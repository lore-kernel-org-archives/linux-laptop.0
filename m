From: Wu Zhangjin <wuzhangjin@gmail.com>
Subject: [PATCH v10 5/8] Loongson: YeeLoong: add hardware monitoring driver
Date: Tue, 15 Dec 2009 17:24:42 +0800
Message-ID: <d74dbb0ff251bc26556e27c21be3ce7c752776be.1260868626.git.wuzhangjin@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-laptop-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:from:to:cc:subject:date
         :message-id:x-mailer;
        bh=hj61Y9B8S5IAiCi2Y4JgjBxxllRhFS/vECCobFWiW6k=;
        b=iUCclKbeQ+NehAQCRU91aip4ETTbdXKURWVKJCpnmaX/mqq6cVyBdxPvsm9e1eycp/
         MBI1dfAqQT6vw8TKwY19oin0Hc6GwOqeJn8o6dxhylCrMUcj8snkhuYdxcuIfHAxte8F
         NUMN03T4LyqruDd/0tfuQ+vUvEILX86E/hG4A=
Sender: linux-laptop-owner@vger.kernel.org
List-ID: <linux-laptop.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="windows-1252"
To: Ralf Baechle <ralf@linux-mips.org>, akpm@linux-foundation.org
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Rafael J . Wysocki" <rjw@sisk.pl>, zhangfx@lemote.com, linux-laptop@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Pavel Machek <pavel@ucw.cz>, Wu Zhangjin <wuzhangjin@gmail.com>

=46rom: Wu Zhangjin <wuzhangjin@gmail.com>

This can be applied between v9 4/8 and v9 6/8.

Changes from v9 5/8:

	o ensure the fan controlling interface is compatible with the
	one described in Documentation/hwmon/sysfs-interface

	o add the max temperature limit of cpu to hwmon subdriver
	60 =E2=84=83  is the max temp limit to ensure the processor work norma=
lly.

----------------

This patch adds hardware monitoring driver, it provides standard
interface(/sys/class/hwmon/) for lm-sensors/sensors-applet to monitor
the temperatures of CPU and battery, the PWM of fan, the current,
voltage of battery.

Please refer to Documentation/hwmon/userspace-tools and
Documentation/hwmon/sysfs-interface to get more information about the
hwmon.

Acked-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Wu Zhangjin <wuzhangjin@gmail.com>
---
 drivers/platform/mips/Kconfig           |    1 +
 drivers/platform/mips/yeeloong_laptop.c |  252 +++++++++++++++++++++++=
+++++++-
 2 files changed, 249 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/mips/Kconfig b/drivers/platform/mips/Kcon=
fig
index 965933b..352594c 100644
--- a/drivers/platform/mips/Kconfig
+++ b/drivers/platform/mips/Kconfig
@@ -20,6 +20,7 @@ config LEMOTE_YEELOONG2F
 	select BACKLIGHT_CLASS_DEVICE
 	select SYS_SUPPORTS_APM_EMULATION
 	select APM_EMULATION
+	select HWMON
 	help
 	  YeeLoong netbook is a mini laptop made by Lemote, which is basicall=
y
 	  compatible to FuLoong2F mini PC, but it has an extra Embedded
diff --git a/drivers/platform/mips/yeeloong_laptop.c b/drivers/platform=
/mips/yeeloong_laptop.c
index b265674..e09ddac 100644
--- a/drivers/platform/mips/yeeloong_laptop.c
+++ b/drivers/platform/mips/yeeloong_laptop.c
@@ -14,6 +14,8 @@
 #include <linux/backlight.h>	/* for backlight subdriver */
 #include <linux/fb.h>
 #include <linux/apm-emulation.h>/* for battery subdriver */
+#include <linux/hwmon.h>	/* for hwmon subdriver */
+#include <linux/hwmon-sysfs.h>
=20
 #include <ec_kb3310b.h>
=20
@@ -29,10 +31,7 @@ static int yeeloong_set_brightness(struct backlight_=
device *bd)
 		 bd->props.power =3D=3D FB_BLANK_UNBLANK) ?
 	    bd->props.brightness : 0;
=20
-	if (level > MAX_BRIGHTNESS)
-		level =3D MAX_BRIGHTNESS;
-	else if (level < 0)
-		level =3D 0;
+	level =3D SENSORS_LIMIT(level, 0, MAX_BRIGHTNESS);
=20
 	/* Avoid to modify the brightness when EC is tuning it */
 	if (old_level !=3D level) {
@@ -186,6 +185,243 @@ static void yeeloong_battery_exit(void)
 		apm_get_power_status =3D NULL;
 }
=20
+/* hwmon subdriver */
+
+#define MIN_FAN_SPEED 0
+#define MAX_FAN_SPEED 3
+
+static int get_fan_pwm_enable(void)
+{
+	int level, mode;
+
+	level =3D ec_read(REG_FAN_SPEED_LEVEL);
+	mode =3D ec_read(REG_FAN_AUTO_MAN_SWITCH);
+
+	if (level =3D=3D MAX_FAN_SPEED && mode =3D=3D BIT_FAN_MANUAL)
+		mode =3D 0;
+	else if (mode =3D=3D BIT_FAN_MANUAL)
+		mode =3D 1;
+	else
+		mode =3D 2;
+
+	return mode;
+}
+
+static void set_fan_pwm_enable(int mode)
+{
+	switch (mode) {
+	case 0:
+		/* fullspeed */
+		ec_write(REG_FAN_AUTO_MAN_SWITCH, BIT_FAN_MANUAL);
+		ec_write(REG_FAN_SPEED_LEVEL, MAX_FAN_SPEED);
+		break;
+	case 1:
+		ec_write(REG_FAN_AUTO_MAN_SWITCH, BIT_FAN_MANUAL);
+		break;
+	case 2:
+		ec_write(REG_FAN_AUTO_MAN_SWITCH, BIT_FAN_AUTO);
+		break;
+	default:
+		break;
+	}
+}
+
+static int get_fan_pwm(void)
+{
+	return ec_read(REG_FAN_SPEED_LEVEL);
+}
+
+static void set_fan_pwm(int value)
+{
+	int mode;
+
+	mode =3D ec_read(REG_FAN_AUTO_MAN_SWITCH);
+	if (mode !=3D BIT_FAN_MANUAL)
+		return;
+
+	value =3D SENSORS_LIMIT(value, 0, 3);
+
+	/* We must ensure the fan is on */
+	if (value > 0)
+		ec_write(REG_FAN_CONTROL, BIT_FAN_CONTROL_ON);
+
+	ec_write(REG_FAN_SPEED_LEVEL, value);
+}
+
+static int get_fan_rpm(void)
+{
+	int value;
+
+	value =3D FAN_SPEED_DIVIDER /
+	    (((ec_read(REG_FAN_SPEED_HIGH) & 0x0f) << 8) |
+	     ec_read(REG_FAN_SPEED_LOW));
+
+	return value;
+}
+
+static int get_cpu_temp(void)
+{
+	s8 value;
+
+	value =3D ec_read(REG_TEMPERATURE_VALUE);
+
+	return value * 1000;
+}
+
+static int get_cpu_temp_max(void)
+{
+	return 60 * 1000;
+}
+
+static int get_battery_temp(void)
+{
+	int value;
+
+	value =3D (ec_read(REG_BAT_TEMPERATURE_HIGH) << 8) |
+		(ec_read(REG_BAT_TEMPERATURE_LOW));
+
+	return value * 1000;
+}
+
+static int get_battery_temp_alarm(void)
+{
+	int status;
+
+	status =3D (ec_read(REG_BAT_CHARGE_STATUS) &
+			BIT_BAT_CHARGE_STATUS_OVERTEMP);
+
+	return !!status;
+}
+
+static int get_battery_current(void)
+{
+	s16 value;
+
+	value =3D (ec_read(REG_BAT_CURRENT_HIGH) << 8) |
+		(ec_read(REG_BAT_CURRENT_LOW));
+
+	return -value;
+}
+
+static int get_battery_voltage(void)
+{
+	int value;
+
+	value =3D (ec_read(REG_BAT_VOLTAGE_HIGH) << 8) |
+		(ec_read(REG_BAT_VOLTAGE_LOW));
+
+	return value;
+}
+
+static ssize_t store_sys_hwmon(void (*set) (int), const char *buf, siz=
e_t count)
+{
+	int ret;
+	unsigned long value;
+
+	if (!count)
+		return 0;
+
+	ret =3D strict_strtoul(buf, 10, &value);
+	if (ret)
+		return ret;
+
+	set(value);
+
+	return count;
+}
+
+static ssize_t show_sys_hwmon(int (*get) (void), char *buf)
+{
+	return sprintf(buf, "%d\n", get());
+}
+
+#define CREATE_SENSOR_ATTR(_name, _mode, _set, _get)		\
+	static ssize_t show_##_name(struct device *dev,			\
+				    struct device_attribute *attr,	\
+				    char *buf)				\
+	{								\
+		return show_sys_hwmon(_set, buf);			\
+	}								\
+	static ssize_t store_##_name(struct device *dev,		\
+				     struct device_attribute *attr,	\
+				     const char *buf, size_t count)	\
+	{								\
+		return store_sys_hwmon(_get, buf, count);		\
+	}								\
+	static SENSOR_DEVICE_ATTR(_name, _mode, show_##_name, store_##_name, =
0);
+
+CREATE_SENSOR_ATTR(fan1_input, S_IRUGO, get_fan_rpm, NULL);
+CREATE_SENSOR_ATTR(pwm1, S_IRUGO | S_IWUSR, get_fan_pwm, set_fan_pwm);
+CREATE_SENSOR_ATTR(pwm1_enable, S_IRUGO | S_IWUSR, get_fan_pwm_enable,
+		set_fan_pwm_enable);
+CREATE_SENSOR_ATTR(temp1_input, S_IRUGO, get_cpu_temp, NULL);
+CREATE_SENSOR_ATTR(temp1_max, S_IRUGO, get_cpu_temp_max, NULL);
+CREATE_SENSOR_ATTR(temp2_input, S_IRUGO, get_battery_temp, NULL);
+CREATE_SENSOR_ATTR(temp2_max_alarm, S_IRUGO, get_battery_temp_alarm, N=
ULL);
+CREATE_SENSOR_ATTR(curr1_input, S_IRUGO, get_battery_current, NULL);
+CREATE_SENSOR_ATTR(in1_input, S_IRUGO, get_battery_voltage, NULL);
+
+static ssize_t
+show_name(struct device *dev, struct device_attribute *attr, char *buf=
)
+{
+	return sprintf(buf, "yeeloong\n");
+}
+
+static SENSOR_DEVICE_ATTR(name, S_IRUGO, show_name, NULL, 0);
+
+static struct attribute *hwmon_attributes[] =3D {
+	&sensor_dev_attr_pwm1.dev_attr.attr,
+	&sensor_dev_attr_pwm1_enable.dev_attr.attr,
+	&sensor_dev_attr_fan1_input.dev_attr.attr,
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	&sensor_dev_attr_temp1_max.dev_attr.attr,
+	&sensor_dev_attr_temp2_input.dev_attr.attr,
+	&sensor_dev_attr_temp2_max_alarm.dev_attr.attr,
+	&sensor_dev_attr_curr1_input.dev_attr.attr,
+	&sensor_dev_attr_in1_input.dev_attr.attr,
+	&sensor_dev_attr_name.dev_attr.attr,
+	NULL
+};
+
+static struct attribute_group hwmon_attribute_group =3D {
+	.attrs =3D hwmon_attributes
+};
+
+static struct device *yeeloong_hwmon_dev;
+
+static int yeeloong_hwmon_init(void)
+{
+	int ret;
+
+	yeeloong_hwmon_dev =3D hwmon_device_register(NULL);
+	if (IS_ERR(yeeloong_hwmon_dev)) {
+		pr_err("Fail to register yeeloong hwmon device\n");
+		yeeloong_hwmon_dev =3D NULL;
+		return PTR_ERR(yeeloong_hwmon_dev);
+	}
+	ret =3D sysfs_create_group(&yeeloong_hwmon_dev->kobj,
+				 &hwmon_attribute_group);
+	if (ret) {
+		hwmon_device_unregister(yeeloong_hwmon_dev);
+		yeeloong_hwmon_dev =3D NULL;
+		return ret;
+	}
+	/* ensure fan is set to auto mode */
+	set_fan_pwm_enable(BIT_FAN_AUTO);
+
+	return 0;
+}
+
+static void yeeloong_hwmon_exit(void)
+{
+	if (yeeloong_hwmon_dev) {
+		sysfs_remove_group(&yeeloong_hwmon_dev->kobj,
+				   &hwmon_attribute_group);
+		hwmon_device_unregister(yeeloong_hwmon_dev);
+		yeeloong_hwmon_dev =3D NULL;
+	}
+}
+
 static struct platform_device_id platform_device_ids[] =3D {
 	{
 		.name =3D "yeeloong_laptop",
@@ -225,11 +461,19 @@ static int __init yeeloong_init(void)
=20
 	yeeloong_battery_init();
=20
+	ret =3D yeeloong_hwmon_init();
+	if (ret) {
+		pr_err("Fail to register yeeloong hwmon driver.\n");
+		yeeloong_hwmon_exit();
+		return ret;
+	}
+
 	return 0;
 }
=20
 static void __exit yeeloong_exit(void)
 {
+	yeeloong_hwmon_exit();
 	yeeloong_battery_exit();
 	yeeloong_backlight_exit();
 	platform_driver_unregister(&platform_driver);
--=20
1.6.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-laptop"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
