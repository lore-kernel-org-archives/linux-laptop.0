From: "David Griffith" <dgriffith@bigpond.com.au>
Subject: Possble Toshiba 3010CT IDE port from NetBSD?
Date: Mon, 20 Oct 2003 12:52:53 +1000
Sender: linux-laptop-owner@vger.kernel.org
Message-ID: <000a01c396b5$424e4aa0$0a01a8c0@davidhome>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-laptop-owner@vger.kernel.org>
List-Id: <linux-laptop.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-laptop@vger.kernel.org

Hi, 
In my quest for a DMA driver for the IDE controller in my Toshiba
3010CT, I've come across a code chunk in netBSD for it (see end of
message).
It (to my untrained eye) scans the PnP device listing for "TOS 7300" and
then does some (apparently minor) tweaks to get it to work. Compiling
2.6.0-rc8 and doing lspnp shows this to be present on my laptop. Looking
at /drivers/ide/ide-pnp, one can add a PnP device string in to get it to
recognise other IDE controllers.
So, I added "TOS 7300" in there and it the toshiba PnP controller gets
recognised now. 
But, still no DMA. I know there's a few things to set in the hwid (?)
structure, but my feeble attempts to do so result in kernel panics upon
ide init :-)
What bugs me is this looks to be in the "trivial" department... but I
have no clue, and a slow laptop to compile/crash/compile/crash with.
Anyone able to port this properly? 
Alternatively , anyone got any suggestions on how to do this? 
I know, 3010CT's are *old* now, but still I'd like to get it to go. 
Regards 
David 


--------------------------------------------------------------- 
/* $NetBSD: pciide_pnpbios.c,v 1.7 2002/10/02 05:47:17 thorpej Exp $ */

/*
* Copyright (c) 1999 Soren S. Jorvang. All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
* 1. Redistributions of source code must retain the above copyright
* notice, this list of conditions, and the following disclaimer.
* 2. Redistributions in binary form must reproduce the above copyright
* notice, this list of conditions and the following disclaimer in the
* documentation and/or other materials provided with the distribution.
*
* THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
* ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
PURPOSE
* ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
GOODS
* OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
* HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
STRICT
* LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
WAY
* OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
* SUCH DAMAGE.
*/

/*
* Handle the weird "almost PCI" IDE on Toshiba Porteges.
*/

#include <sys/cdefs.h>
__KERNEL_RCSID(0, "$NetBSD: pciide_pnpbios.c,v 1.7 2002/10/02 05:47:17
thorpej Exp $");

#include <sys/param.h>
#include <sys/systm.h>
#include <sys/device.h>
#include <sys/malloc.h>

#include <machine/bus.h>

#include <dev/isa/isavar.h>
#include <dev/isa/isadmavar.h>

#include <i386/pnpbios/pnpbiosvar.h>

#include <dev/pci/pcireg.h>
#include <dev/pci/pcivar.h>
#include <dev/pci/pcidevs.h>

#include <dev/pci/pciidereg.h>
#include <dev/pci/pciidevar.h>

static int pciide_pnpbios_match(struct device *, struct cfdata *, void
*);
static void pciide_pnpbios_attach(struct device *, struct device *, void
*);

extern void pciide_channel_dma_setup(struct pciide_channel *);
extern int pciide_dma_init(void *, int, int, void *, size_t, int);
extern void pciide_dma_start(void *, int, int);
extern int pciide_dma_finish(void *, int, int, int);
extern int pciide_compat_intr (void *);

CFATTACH_DECL(pciide_pnpbios, sizeof(struct pciide_softc),
pciide_pnpbios_match, pciide_pnpbios_attach, NULL, NULL);

int
pciide_pnpbios_match(parent, match, aux)
struct device *parent;
struct cfdata *match;
void *aux;
{
struct pnpbiosdev_attach_args *aa = aux;

if (strcmp(aa->idstr, "TOS7300") == 0)
return 1;

return 0;
}

void
pciide_pnpbios_attach(parent, self, aux)
struct device *parent, *self;
void *aux;
{
struct pciide_softc *sc = (void *)self;
struct pnpbiosdev_attach_args *aa = aux;
struct pciide_channel *cp;
struct channel_softc *wdc_cp;
bus_space_tag_t compat_iot;
bus_space_handle_t cmd_ioh, ctl_ioh;

printf("\n");
pnpbios_print_devres(self, aa);

printf("%s: Toshiba Extended IDE Controller\n", self->dv_xname);

if (pnpbios_io_map(aa->pbt, aa->resc, 2, &sc->sc_dma_iot,
&sc->sc_dma_ioh) != 0) {
printf("%s: unable to map DMA registers\n", self->dv_xname);
return;
}
if (pnpbios_io_map(aa->pbt, aa->resc, 0, &compat_iot,
&cmd_ioh) != 0) {
printf("%s: unable to map command registers\n", self->dv_xname);
return;
}
if (pnpbios_io_map(aa->pbt, aa->resc, 1, &compat_iot,
&ctl_ioh) != 0) {
printf("%s: unable to map control register\n", self->dv_xname);
return;
}

sc->sc_dmat = &pci_bus_dma_tag;

sc->sc_dma_ok = 1;
sc->sc_wdcdev.dma_arg = sc;
sc->sc_wdcdev.dma_init = pciide_dma_init;
sc->sc_wdcdev.dma_start = pciide_dma_start;
sc->sc_wdcdev.dma_finish = pciide_dma_finish;
sc->sc_wdcdev.channels = sc->wdc_chanarray;
sc->sc_wdcdev.nchannels = 1;
sc->sc_wdcdev.cap |= WDC_CAPABILITY_DATA16 | WDC_CAPABILITY_DATA32;
sc->sc_wdcdev.cap |= WDC_CAPABILITY_DMA | WDC_CAPABILITY_UDMA;
#if 0 /* Need documentation. */
sc->sc_wdcdev.cap |= WDC_CAPABILITY_MODE;
#endif
sc->sc_wdcdev.PIO_cap = 4;
sc->sc_wdcdev.DMA_cap = 2; /* XXX */
sc->sc_wdcdev.UDMA_cap = 2; /* XXX */

cp = &sc->pciide_channels[0];
sc->wdc_chanarray[0] = &cp->wdc_channel;
cp->wdc_channel.channel = 0;
cp->wdc_channel.wdc = &sc->sc_wdcdev;
cp->wdc_channel.ch_queue = malloc(sizeof(struct channel_queue),
M_DEVBUF, M_NOWAIT);
if (cp->wdc_channel.ch_queue == NULL) {
printf("%s: unable to allocate memory for command queue\n",
self->dv_xname);
return;
}

wdc_cp = &cp->wdc_channel;
wdc_cp->cmd_iot = compat_iot;
wdc_cp->cmd_ioh = cmd_ioh;
wdc_cp->ctl_iot = wdc_cp->data32iot = compat_iot;
wdc_cp->ctl_ioh = wdc_cp->data32ioh = ctl_ioh;

cp->hw_ok = 1; /* XXX */
cp->compat = 1;

cp->ih = pnpbios_intr_establish(aa->pbt, aa->resc, 0, IPL_BIO,
pciide_compat_intr, cp);

wdcattach(wdc_cp);

pciide_channel_dma_setup(cp);
} 






