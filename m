Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1741D7B
	for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 18:24:52 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id m14so20064550wrg.13
        for <llvm@lists.linux.dev>; Wed, 15 Feb 2023 10:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8qQVLFZ7UDB7jnbued0gyCjJBOpdGeuy6BzRosqQMs=;
        b=b/RAUg/xuFHGD26IgVmGFoIZMRZCP4LEyqDTy1MqShAq4G6srnb+jzPwLfG0V2kFpW
         vE/14fYdpXws/m0GtCR8ePbNbYoeFnRdQIMr31+2oP6MEEwOPVjXtco0hEf+r7VMsvFI
         gKSBgiS6XEtktpQVS1Ggw9D5mTF5IDrXiU4qHTE8J2CuqcHK7742qDEaBoolzPfiHVSM
         q38qsVlusVCZEyzu2aVJ6eK5YdKax0I3c5ghCDKTrydWv1yq34KVvW1nqzBMl6n6Kawl
         Mx2dAgEB+v6tFVVBjwkSWudEivMQuvdTKCsOBBTXj4FOmz/vyQCRmnC2ao15sExQ7AJZ
         QzWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8qQVLFZ7UDB7jnbued0gyCjJBOpdGeuy6BzRosqQMs=;
        b=OhJ16O7rJD+fHs/YMEd0kHui8cYNAdwKFIaW1hg7d+5eiXUPzmhaVLdsvKM+p/cBqT
         //yp4ef/L+tcSBPZl+3Owl6xWTFAr+h5SHnRYlWssD9G7H7aElC9BtGLaKkEkJpNmQc/
         Ks71uTHeZM+KB3vI0pnGn6T2VOzalCQL0YU1D4BALV6BE2APRB9J92sFbfKJmelL7g2V
         dsfuECKLkOHjuOovNJShEyhW7aLsMR2FTYl3Pha4ae2+lERdPbHrV9mfmk1+IcHseByY
         Mb/5RCInu48K+P9korGaWp42+IMyodXyMmZpxBHh3FfWx/yHm8d/mPFxmTAh34oOEeKt
         1xcQ==
X-Gm-Message-State: AO0yUKV46wms0KhpQi8jlZ8mvcCVJHz9dfOwfXkp7oCIbdBDw2ONIZKd
	J+MozobWy4TIHrOmFb38/krbFw==
X-Google-Smtp-Source: AK7set/ssLulmTNGplr0nsDwooz6sJlnasXYw8LkDvfNGiL7usEIiwsBbWXY/jBSuB/Tt3cJ42UShg==
X-Received: by 2002:adf:de8a:0:b0:2c5:53e4:9e53 with SMTP id w10-20020adfde8a000000b002c553e49e53mr2376164wrl.65.1676485491251;
        Wed, 15 Feb 2023 10:24:51 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id n6-20020adffe06000000b002c559843748sm7873687wrr.10.2023.02.15.10.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 10:24:50 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 15 Feb 2023 18:24:49 +0000 (UTC)
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <296281863.14275.1676485490631@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.2-rc1-28-gcec3b46b8bda: power: reset:
 add Odroid Go Ultra poweroff driver
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_14274_1326447276.1676485490086"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-aarch64-next-allmodconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_14274_1326447276.1676485490086
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.2-rc1-28-gcec3b46b8bda: power: reset: add Odroid Go Ultra poweroff driver:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
32627
# First few build errors in logs:
# 00:59:23 ld.lld: error: undefined symbol: of_find_i2c_device_by_node
# 00:59:26 make[1]: *** [scripts/Makefile.vmlinux:34: vmlinux] Error 1
# 00:59:26 make: *** [Makefile:1252: vmlinux] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
32631
# linux build successful:
all

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.2-rc1-28-gcec3b46b8bda commit for tcwg_kernel:
commit cec3b46b8bda0cdc93d3ab2bdd14aae5d30ecfd9
Author: Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue Feb 14 17:41:18 2023 +0100

    power: reset: add Odroid Go Ultra poweroff driver
    
    The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
    to its two PMICs in order, this represents the poweroff scheme needed to complete
    a clean poweroff of the system.
    
    This implement this scheme by implementing a self registering driver to permit
    using probe defer until both pmics are finally probed.
    
    Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
    Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
* llvm-master-aarch64-next-allmodconfig
** Failure after v6.2-rc1-28-gcec3b46b8bda: power: reset: add Odroid Go Ultra poweroff driver:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/624/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/624/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/623/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-cec3b46b8bda0cdc93d3ab2bdd14aae5d30ecfd9
cd investigate-linux-cec3b46b8bda0cdc93d3ab2bdd14aae5d30ecfd9

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/624/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-aarch64-next-allmodconfig/623/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit cec3b46b8bda0cdc93d3ab2bdd14aae5d30ecfd9
Author: Neil Armstrong <neil.armstrong@linaro.org>
Date:   Tue Feb 14 17:41:18 2023 +0100

    power: reset: add Odroid Go Ultra poweroff driver
    
    The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
    to its two PMICs in order, this represents the poweroff scheme needed to complete
    a clean poweroff of the system.
    
    This implement this scheme by implementing a self registering driver to permit
    using probe defer until both pmics are finally probed.
    
    Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
    Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/power/reset/Kconfig                    |   7 +
 drivers/power/reset/Makefile                   |   1 +
 drivers/power/reset/odroid-go-ultra-poweroff.c | 177 +++++++++++++++++++++++++
 3 files changed, 185 insertions(+)

diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index a8c46ba5878f..7059bd1f2ee7 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -141,6 +141,13 @@ config POWER_RESET_OCELOT_RESET
 	help
 	  This driver supports restart for Microsemi Ocelot SoC and similar.
 
+config POWER_RESET_ODROID_GO_ULTRA_POWEROFF
+	bool "Odroid Go Ultra power-off driver"
+	depends on ARCH_MESON || COMPILE_TEST
+	depends on I2C && OF
+	help
+	  This driver supports Power off for Odroid Go Ultra device.
+
 config POWER_RESET_OXNAS
 	bool "OXNAS SoC restart driver"
 	depends on ARCH_OXNAS
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 0a39424fc558..d763e6735ee3 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -17,6 +17,7 @@ obj-$(CONFIG_POWER_RESET_MT6323) += mt6323-poweroff.o
 obj-$(CONFIG_POWER_RESET_OXNAS) += oxnas-restart.o
 obj-$(CONFIG_POWER_RESET_QCOM_PON) += qcom-pon.o
 obj-$(CONFIG_POWER_RESET_OCELOT_RESET) += ocelot-reset.o
+obj-$(CONFIG_POWER_RESET_ODROID_GO_ULTRA_POWEROFF) += odroid-go-ultra-poweroff.o
 obj-$(CONFIG_POWER_RESET_PIIX4_POWEROFF) += piix4-poweroff.o
 obj-$(CONFIG_POWER_RESET_LTC2952) += ltc2952-poweroff.o
 obj-$(CONFIG_POWER_RESET_QNAP) += qnap-poweroff.o
diff --git a/drivers/power/reset/odroid-go-ultra-poweroff.c b/drivers/power/reset/odroid-go-ultra-poweroff.c
new file mode 100644
index 000000000000..f46271da4e8e
--- /dev/null
+++ b/drivers/power/reset/odroid-go-ultra-poweroff.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2023 Neil Armstrong <neil.armstrong@linaro.org>
+ */
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/of_platform.h>
+#include <linux/mfd/rk808.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+#include <linux/reboot.h>
+#include <linux/i2c.h>
+
+/*
+ * The Odroid Go Ultra has 2 PMICs:
+ * - RK818 (manages the battery and USB-C power supply)
+ * - RK817
+ * Both PMICs feeds power to the S922X SoC, so they must be powered-off in sequence.
+ * Vendor does power-off the RK817 first, then the RK818 so here we follow this sequence.
+ */
+
+struct odroid_go_ultra_poweroff_data {
+	struct device *dev;
+	struct device *rk817;
+	struct device *rk818;
+};
+
+static int odroid_go_ultra_poweroff_prepare(struct sys_off_data *data)
+{
+	struct odroid_go_ultra_poweroff_data *poweroff_data = data->cb_data;
+	struct regmap *rk817, *rk818;
+	int ret;
+
+	/* RK817 Regmap */
+	rk817 = dev_get_regmap(poweroff_data->rk817, NULL);
+	if (!rk817) {
+		dev_err(poweroff_data->dev, "failed to get rk817 regmap\n");
+		return notifier_from_errno(-EINVAL);
+	}
+
+	/* RK818 Regmap */
+	rk818 = dev_get_regmap(poweroff_data->rk818, NULL);
+	if (!rk818) {
+		dev_err(poweroff_data->dev, "failed to get rk818 regmap\n");
+		return notifier_from_errno(-EINVAL);
+	}
+
+	dev_info(poweroff_data->dev, "Setting PMICs for power off");
+
+	/* RK817 */
+	ret = regmap_update_bits(rk817, RK817_SYS_CFG(3), DEV_OFF, DEV_OFF);
+	if (ret) {
+		dev_err(poweroff_data->dev, "failed to poweroff rk817\n");
+		return notifier_from_errno(ret);
+	}
+
+	/* RK818 */
+	ret = regmap_update_bits(rk818, RK818_DEVCTRL_REG, DEV_OFF, DEV_OFF);
+	if (ret) {
+		dev_err(poweroff_data->dev, "failed to poweroff rk818\n");
+		return notifier_from_errno(ret);
+	}
+
+	return NOTIFY_OK;
+}
+
+static void odroid_go_ultra_poweroff_put_pmic_device(void *data)
+{
+	struct device *dev = data;
+
+	put_device(dev);
+}
+
+static int odroid_go_ultra_poweroff_get_pmic_device(struct device *dev, const char *compatible,
+						    struct device **pmic)
+{
+	struct device_node *pmic_node;
+	struct i2c_client *pmic_client;
+
+	pmic_node = of_find_compatible_node(NULL, NULL, compatible);
+	if (!pmic_node)
+		return -ENODEV;
+
+	pmic_client = of_find_i2c_device_by_node(pmic_node);
+	of_node_put(pmic_node);
+	if (!pmic_client)
+		return -EPROBE_DEFER;
+
+	*pmic = &pmic_client->dev;
+
+	return devm_add_action_or_reset(dev, odroid_go_ultra_poweroff_put_pmic_device, *pmic);
+}
+
+static int odroid_go_ultra_poweroff_probe(struct platform_device *pdev)
+{
+	struct odroid_go_ultra_poweroff_data *poweroff_data;
+	int ret;
+
+	poweroff_data = devm_kzalloc(&pdev->dev, sizeof(*poweroff_data), GFP_KERNEL);
+	if (!poweroff_data)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, poweroff_data);
+
+	/* RK818 PMIC Device */
+	ret = odroid_go_ultra_poweroff_get_pmic_device(&pdev->dev, "rockchip,rk818",
+						       &poweroff_data->rk818);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to get rk818 mfd data\n");
+
+	/* RK817 PMIC Device */
+	ret = odroid_go_ultra_poweroff_get_pmic_device(&pdev->dev, "rockchip,rk817",
+						       &poweroff_data->rk817);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to get rk817 mfd data\n");
+
+	/* Register as SYS_OFF_MODE_POWER_OFF_PREPARE because regmap_update_bits may sleep */
+	ret = devm_register_sys_off_handler(&pdev->dev,
+					    SYS_OFF_MODE_POWER_OFF_PREPARE,
+					    SYS_OFF_PRIO_DEFAULT,
+					    odroid_go_ultra_poweroff_prepare,
+					    poweroff_data);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to register sys-off handler\n");
+
+	dev_info(&pdev->dev, "Registered Power-Off handler\n");
+
+	return 0;
+}
+static struct platform_device *pdev;
+
+static struct platform_driver odroid_go_ultra_poweroff_driver = {
+	.driver = {
+		.name	= "odroid-go-ultra-poweroff",
+	},
+	.probe = odroid_go_ultra_poweroff_probe,
+};
+
+static int __init odroid_go_ultra_poweroff_init(void)
+{
+	int ret;
+
+	/* Only create when running on the Odroid Go Ultra device */
+	if (!of_device_is_compatible(of_root, "hardkernel,odroid-go-ultra"))
+		return -ENODEV;
+
+	ret = platform_driver_register(&odroid_go_ultra_poweroff_driver);
+	if (ret)
+		return ret;
+
+	pdev = platform_device_register_resndata(NULL, "odroid-go-ultra-poweroff", -1,
+						 NULL, 0, NULL, 0);
+
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&odroid_go_ultra_poweroff_driver);
+		return PTR_ERR(pdev);
+	}
+
+	return 0;
+}
+
+static void __exit odroid_go_ultra_poweroff_exit(void)
+{
+	/* Only delete when running on the Odroid Go Ultra device */
+	if (!of_device_is_compatible(of_root, "hardkernel,odroid-go-ultra"))
+		return;
+
+	platform_device_unregister(pdev);
+	platform_driver_unregister(&odroid_go_ultra_poweroff_driver);
+}
+
+module_init(odroid_go_ultra_poweroff_init);
+module_exit(odroid_go_ultra_poweroff_exit);
+
+MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
+MODULE_DESCRIPTION("Odroid Go Ultra poweroff driver");
+MODULE_LICENSE("GPL");
</cut>
------=_Part_14274_1326447276.1676485490086--
