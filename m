Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64A033EC
	for <llvm@lists.linux.dev>; Wed, 25 Jan 2023 23:08:32 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id k16so81885wms.2
        for <llvm@lists.linux.dev>; Wed, 25 Jan 2023 15:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=list-id:mime-version:subject:message-id:cc:to:date:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQUgvHhaDM2W7ToTUMXOA0pzP0NtoWeNtI1D8URod1A=;
        b=fU/QYT0oP9RbcQoCsRwOSkltB2E7Kx7+3wD0+htcGafEHSByL+1V3dzNAaAC9OYOa+
         dtB79xShh/zNuPpSTAj0QO0ibuL2yTlS8OpuUscOeQeWMFcIkomy4M6s5nnmwotY3TZp
         zEQBeRlehCujx7npnc3JZRWLTeTUqb8kDnFeb8Z9Rard3H+FhameNv96tcNJgOIKmwH/
         ql6zIRqSKFJr16JiJt9N21WRRFlKfUqP/VtmZBG2g4Haqht1FZPjhkW+xTPmljOV2E6m
         sce5JO/Ru6K1O01AEZH/IkK4wXSHzhE+nYQQfnwkrSl8ZIdlj0le/oE/kL70KcUHHC68
         bg8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-id:mime-version:subject:message-id:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQUgvHhaDM2W7ToTUMXOA0pzP0NtoWeNtI1D8URod1A=;
        b=bOe4vTEFoQQ7LNb3FJfyrBXKRauuo6DIiTw/qeQeRRhtyb/e1SpxYJdYcmXIWsbER7
         T77SYi0pNUFb/G5dzHig66xOyishKFjAraVGdHUYXfohwt9pAHWD0pTtzUQ1cUSmK/kT
         tLjdYYkeGvLW2YNfVVXpl85OepSDx5UXQfwGaRWGgiMXrLW8RosFa3fC+fJzVr3tHHeQ
         w53UMjWW429ODY/M+6trAX/uEp+PRrkZZJvE6KsNBpoS54TKlcTVnQX4Pm1VaPayqo1P
         a6N0CI25CZ1SlFf94uNxPJu/O//rFpxIRPdFLe9PpxpBH+LO03H+iWM0cRX8rDysnGN2
         d/vA==
X-Gm-Message-State: AFqh2kq5H2v3Agw/yJ6h6VhFNJhmiAxbQ/dW10VAGU8T7aaVm+1+OQa+
	UAIA4I4KgFxKQj+rcwDYguhD/Q==
X-Google-Smtp-Source: AMrXdXtAeQjZUxhrFgQtrPOOIO/5Mp5ksfaxt1QJqOcpNnG7hBeg6W6xZDOeD4an4FrIlmUgZP2lsA==
X-Received: by 2002:a05:600c:1d12:b0:3db:53f:baea with SMTP id l18-20020a05600c1d1200b003db053fbaeamr33031364wms.6.1674688110980;
        Wed, 25 Jan 2023 15:08:30 -0800 (PST)
Received: from jenkins.jenkins (ci.linaro.org. [88.99.136.175])
        by smtp.gmail.com with ESMTPSA id j15-20020a05600c130f00b003db0659c454sm3493574wmf.32.2023.01.25.15.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 15:08:30 -0800 (PST)
From: ci_notify@linaro.org
X-Google-Original-From: linaro-infrastructure-errors@lists.linaro.org
Date: Wed, 25 Jan 2023 23:08:29 +0000 (UTC)
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, arnd@linaro.org
Message-ID: <936824449.4202.1674688110564@jenkins.jenkins>
Subject: [TCWG CI] Failure after v6.2-rc1-10-gc09846fc1ff4: ARM: orion:
 remove unused board files
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4201_299797598.1674688109924"
X-Jenkins-Job: TCWG Build tcwg_kernel/llvm-master-arm-next-allyesconfig
X-Jenkins-Result: SUCCESS
List-ID: 

------=_Part_4201_299797598.1674688109924
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Failure after v6.2-rc1-10-gc09846fc1ff4: ARM: orion: remove unused board files:

Results changed to
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21023
# First few build errors in logs:
# 00:21:35 drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack frame size (1040) exceeds limit (1024) in '__drm_test_mm_reserve' [-Werror,-Wframe-larger-than]
# 00:21:35 make[5]: *** [scripts/Makefile.build:252: drivers/gpu/drm/tests/drm_mm_test.o] Error 1
# 00:21:41 make[4]: *** [scripts/Makefile.build:504: drivers/gpu/drm/tests] Error 2
# 00:54:50 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: error: stack frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wframe-larger-than]
# 00:54:51 make[6]: *** [scripts/Makefile.build:252: drivers/net/ethernet/mellanox/mlx5/core/en_main.o] Error 1
# 00:55:24 make[3]: *** [scripts/Makefile.build:504: drivers/gpu/drm] Error 2
# 00:55:24 make[2]: *** [scripts/Makefile.build:504: drivers/gpu] Error 2
# 00:55:47 make[5]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox/mlx5/core] Error 2
# 00:55:47 make[4]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox] Error 2
# 00:55:47 make[3]: *** [scripts/Makefile.build:504: drivers/net/ethernet] Error 2

from
-10
# build_abe binutils:
-9
# build_kernel_llvm:
-5
# build_abe qemu:
-2
# linux_n_obj:
21024
# First few build errors in logs:
# 00:27:43 drivers/gpu/drm/tests/drm_mm_test.c:344:12: error: stack frame size (1040) exceeds limit (1024) in '__drm_test_mm_reserve' [-Werror,-Wframe-larger-than]
# 00:27:44 make[5]: *** [scripts/Makefile.build:252: drivers/gpu/drm/tests/drm_mm_test.o] Error 1
# 00:27:49 make[4]: *** [scripts/Makefile.build:504: drivers/gpu/drm/tests] Error 2
# 01:17:22 drivers/net/ethernet/mellanox/mlx5/core/en_main.c:3597:12: error: stack frame size (1256) exceeds limit (1024) in 'mlx5e_setup_tc' [-Werror,-Wframe-larger-than]
# 01:17:24 make[6]: *** [scripts/Makefile.build:252: drivers/net/ethernet/mellanox/mlx5/core/en_main.o] Error 1
# 01:20:04 make[3]: *** [scripts/Makefile.build:504: drivers/gpu/drm] Error 2
# 01:20:04 make[2]: *** [scripts/Makefile.build:504: drivers/gpu] Error 2
# 01:21:26 make[5]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox/mlx5/core] Error 2
# 01:21:26 make[4]: *** [scripts/Makefile.build:504: drivers/net/ethernet/mellanox] Error 2
# 01:21:27 make[3]: *** [scripts/Makefile.build:504: drivers/net/ethernet] Error 2

THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.

For latest status see comments in https://linaro.atlassian.net/browse/LLVM-647 .
Status of v6.2-rc1-10-gc09846fc1ff4 commit for tcwg_kernel:
commit c09846fc1ff4ced5c55840fb7f171ebc6e5478e4
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu Sep 29 15:36:58 2022 +0200

    ARM: orion: remove unused board files
    
    As planned earlier, all board support that was marked unused can be
    removed now after nobody explicitly asked for these to be kept.
    
    In particular, all of the reference designs get removed now, as these
    are not commonly used productively any more. Also, the machines that
    were not supported by Debian or the Debian_on_Buffalo group because of
    limitations with RAM size are gone.
    
    Cc: Lennert Buytenhek <kernel@wantstofly.org>
    Cc: Nicolas Pitre <nico@fluxnic.net>
    Cc: Imre Kaloz <kaloz@openwrt.org>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
* llvm-master-arm-next-allyesconfig
** Failure after v6.2-rc1-10-gc09846fc1ff4: ARM: orion: remove unused board files:
** https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/554/

Bad  build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/554/artifact/artifacts
Good build: https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/553/artifact/artifacts

Reproduce current build:
<cut>
mkdir -p investigate-linux-c09846fc1ff4ced5c55840fb7f171ebc6e5478e4
cd investigate-linux-c09846fc1ff4ced5c55840fb7f171ebc6e5478e4

# Fetch scripts
git clone https://git.linaro.org/toolchain/jenkins-scripts

# Fetch manifests for bad and good builds
mkdir -p bad/artifacts good/artifacts
curl -o bad/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/554/artifact/artifacts/manifest.sh --fail
curl -o good/artifacts/manifest.sh https://ci.linaro.org/job/tcwg_kernel-llvm-build-llvm-master-arm-next-allyesconfig/553/artifact/artifacts/manifest.sh --fail

# Reproduce bad build
(cd bad; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
# Reproduce good build
(cd good; ../jenkins-scripts/tcwg_kernel-build.sh ^^ true %%rr[top_artifacts] artifacts)
</cut>

Full commit (up to 1000 lines):
<cut>
commit c09846fc1ff4ced5c55840fb7f171ebc6e5478e4
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Thu Sep 29 15:36:58 2022 +0200

    ARM: orion: remove unused board files
    
    As planned earlier, all board support that was marked unused can be
    removed now after nobody explicitly asked for these to be kept.
    
    In particular, all of the reference designs get removed now, as these
    are not commonly used productively any more. Also, the machines that
    were not supported by Debian or the Debian_on_Buffalo group because of
    limitations with RAM size are gone.
    
    Cc: Lennert Buytenhek <kernel@wantstofly.org>
    Cc: Nicolas Pitre <nico@fluxnic.net>
    Cc: Imre Kaloz <kaloz@openwrt.org>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/mv78xx0_defconfig           |   2 -
 arch/arm/mach-dove/Kconfig                   |   8 -
 arch/arm/mach-dove/Makefile                  |   1 -
 arch/arm/mach-dove/dove-db-setup.c           | 101 -------
 arch/arm/mach-mv78xx0/Kconfig                |  14 -
 arch/arm/mach-mv78xx0/Makefile               |   2 -
 arch/arm/mach-mv78xx0/db78x00-bp-setup.c     | 101 -------
 arch/arm/mach-mv78xx0/rd78x00-masa-setup.c   |  86 ------
 arch/arm/mach-orion5x/Kconfig                |  59 -----
 arch/arm/mach-orion5x/Makefile               |   8 -
 arch/arm/mach-orion5x/db88f5281-setup.c      | 376 ---------------------------
 arch/arm/mach-orion5x/ls_hgl-setup.c         | 275 --------------------
 arch/arm/mach-orion5x/rd88f5181l-fxo-setup.c | 172 ------------
 arch/arm/mach-orion5x/rd88f5181l-ge-setup.c  | 183 -------------
 arch/arm/mach-orion5x/rd88f5182-setup.c      | 288 --------------------
 arch/arm/mach-orion5x/rd88f6183ap-ge-setup.c | 120 ---------
 arch/arm/mach-orion5x/wnr854t-setup.c        | 175 -------------
 arch/arm/mach-orion5x/wrt350n-v2-setup.c     | 263 -------------------
 18 files changed, 2234 deletions(-)

diff --git a/arch/arm/configs/mv78xx0_defconfig b/arch/arm/configs/mv78xx0_defconfig
index f02f29d3fecb..3a1088079514 100644
--- a/arch/arm/configs/mv78xx0_defconfig
+++ b/arch/arm/configs/mv78xx0_defconfig
@@ -11,8 +11,6 @@ CONFIG_ARCH_MULTI_V5=y
 # CONFIG_ARCH_MULTI_V6 is not set
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_MV78XX0=y
-CONFIG_MACH_DB78X00_BP=y
-CONFIG_MACH_RD78X00_MASA=y
 CONFIG_MACH_TERASTATION_WXL=y
 CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
diff --git a/arch/arm/mach-dove/Kconfig b/arch/arm/mach-dove/Kconfig
index 2252f465cafd..996888ffcfe7 100644
--- a/arch/arm/mach-dove/Kconfig
+++ b/arch/arm/mach-dove/Kconfig
@@ -18,14 +18,6 @@ if ARCH_DOVE
 config DOVE_LEGACY
 	bool
 
-config MACH_DOVE_DB
-	bool "Marvell DB-MV88AP510 Development Board"
-	select DOVE_LEGACY
-	select I2C_BOARDINFO if I2C
-	help
-	  Say 'Y' here if you want your kernel to support the
-	  Marvell DB-MV88AP510 Development Board.
-
 config MACH_CM_A510
 	bool "CompuLab CM-A510 Board"
 	select DOVE_LEGACY
diff --git a/arch/arm/mach-dove/Makefile b/arch/arm/mach-dove/Makefile
index da373a5768ba..0d31390be069 100644
--- a/arch/arm/mach-dove/Makefile
+++ b/arch/arm/mach-dove/Makefile
@@ -4,5 +4,4 @@ ccflags-y := -I$(srctree)/arch/arm/plat-orion/include
 obj-y				+= common.o
 obj-$(CONFIG_DOVE_LEGACY)	+= irq.o mpp.o
 obj-$(CONFIG_PCI)		+= pcie.o
-obj-$(CONFIG_MACH_DOVE_DB)	+= dove-db-setup.o
 obj-$(CONFIG_MACH_CM_A510)	+= cm-a510.o
diff --git a/arch/arm/mach-dove/dove-db-setup.c b/arch/arm/mach-dove/dove-db-setup.c
deleted file mode 100644
index d5bf54040577..000000000000
--- a/arch/arm/mach-dove/dove-db-setup.c
+++ /dev/null
@@ -1,101 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mach-dove/dove-db-setup.c
- *
- * Marvell DB-MV88AP510-BP Development Board Setup
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/irq.h>
-#include <linux/mtd/physmap.h>
-#include <linux/mtd/rawnand.h>
-#include <linux/timer.h>
-#include <linux/ata_platform.h>
-#include <linux/mv643xx_eth.h>
-#include <linux/i2c.h>
-#include <linux/pci.h>
-#include <linux/spi/spi.h>
-#include <linux/spi/flash.h>
-#include <linux/gpio.h>
-#include <asm/mach-types.h>
-#include <asm/mach/arch.h>
-#include "dove.h"
-#include "common.h"
-
-static struct mv643xx_eth_platform_data dove_db_ge00_data = {
-	.phy_addr	= MV643XX_ETH_PHY_ADDR_DEFAULT,
-};
-
-static struct mv_sata_platform_data dove_db_sata_data = {
-	.n_ports        = 1,
-};
-
-/*****************************************************************************
- * SPI Devices:
- * 	SPI0: 4M Flash ST-M25P32-VMF6P
- ****************************************************************************/
-static const struct flash_platform_data dove_db_spi_flash_data = {
-	.type		= "m25p64",
-};
-
-static struct spi_board_info __initdata dove_db_spi_flash_info[] = {
-	{
-		.modalias       = "m25p80",
-		.platform_data  = &dove_db_spi_flash_data,
-		.irq            = -1,
-		.max_speed_hz   = 20000000,
-		.bus_num        = 0,
-		.chip_select    = 0,
-	},
-};
-
-/*****************************************************************************
- * PCI
- ****************************************************************************/
-static int __init dove_db_pci_init(void)
-{
-	if (machine_is_dove_db())
-		dove_pcie_init(1, 1);
-
-	return 0;
-}
-
-subsys_initcall(dove_db_pci_init);
-
-/*****************************************************************************
- * Board Init
- ****************************************************************************/
-static void __init dove_db_init(void)
-{
-	/*
-	 * Basic Dove setup. Needs to be called early.
-	 */
-	dove_init();
-
-	dove_ge00_init(&dove_db_ge00_data);
-	dove_ehci0_init();
-	dove_ehci1_init();
-	dove_sata_init(&dove_db_sata_data);
-	dove_sdio0_init();
-	dove_sdio1_init();
-	dove_spi0_init();
-	dove_spi1_init();
-	dove_uart0_init();
-	dove_uart1_init();
-	dove_i2c_init();
-	spi_register_board_info(dove_db_spi_flash_info,
-				ARRAY_SIZE(dove_db_spi_flash_info));
-}
-
-MACHINE_START(DOVE_DB, "Marvell DB-MV88AP510-BP Development Board")
-	.atag_offset	= 0x100,
-	.nr_irqs	= DOVE_NR_IRQS,
-	.init_machine	= dove_db_init,
-	.map_io		= dove_map_io,
-	.init_early	= dove_init_early,
-	.init_irq	= dove_init_irq,
-	.init_time	= dove_timer_init,
-	.restart	= dove_restart,
-MACHINE_END
diff --git a/arch/arm/mach-mv78xx0/Kconfig b/arch/arm/mach-mv78xx0/Kconfig
index 0464b732ead4..9de3bbc09c3a 100644
--- a/arch/arm/mach-mv78xx0/Kconfig
+++ b/arch/arm/mach-mv78xx0/Kconfig
@@ -15,20 +15,6 @@ menuconfig ARCH_MV78XX0
 
 if ARCH_MV78XX0
 
-config MACH_DB78X00_BP
-	bool "Marvell DB-78x00-BP Development Board"
-	depends on UNUSED_BOARD_FILES
-	help
-	  Say 'Y' here if you want your kernel to support the
-	  Marvell DB-78x00-BP Development Board.
-
-config MACH_RD78X00_MASA
-	bool "Marvell RD-78x00-mASA Reference Design"
-	depends on UNUSED_BOARD_FILES
-	help
-	  Say 'Y' here if you want your kernel to support the
-	  Marvell RD-78x00-mASA Reference Design.
-
 config MACH_TERASTATION_WXL
 	bool "Buffalo WLX (Terastation Duo) NAS"
 	help
diff --git a/arch/arm/mach-mv78xx0/Makefile b/arch/arm/mach-mv78xx0/Makefile
index 50aff70065f2..ddee6ae501bb 100644
--- a/arch/arm/mach-mv78xx0/Makefile
+++ b/arch/arm/mach-mv78xx0/Makefile
@@ -2,6 +2,4 @@
 ccflags-y := -I$(srctree)/arch/arm/plat-orion/include
 
 obj-y				+= common.o mpp.o irq.o pcie.o
-obj-$(CONFIG_MACH_DB78X00_BP)	+= db78x00-bp-setup.o
-obj-$(CONFIG_MACH_RD78X00_MASA)	+= rd78x00-masa-setup.o
 obj-$(CONFIG_MACH_TERASTATION_WXL) += buffalo-wxl-setup.o
diff --git a/arch/arm/mach-mv78xx0/db78x00-bp-setup.c b/arch/arm/mach-mv78xx0/db78x00-bp-setup.c
deleted file mode 100644
index da633a33a0c1..000000000000
--- a/arch/arm/mach-mv78xx0/db78x00-bp-setup.c
+++ /dev/null
@@ -1,101 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mach-mv78xx0/db78x00-bp-setup.c
- *
- * Marvell DB-78x00-BP Development Board Setup
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/ata_platform.h>
-#include <linux/mv643xx_eth.h>
-#include <linux/ethtool.h>
-#include <linux/i2c.h>
-#include <asm/mach-types.h>
-#include <asm/mach/arch.h>
-#include "mv78xx0.h"
-#include "common.h"
-
-static struct mv643xx_eth_platform_data db78x00_ge00_data = {
-	.phy_addr	= MV643XX_ETH_PHY_ADDR(8),
-};
-
-static struct mv643xx_eth_platform_data db78x00_ge01_data = {
-	.phy_addr	= MV643XX_ETH_PHY_ADDR(9),
-};
-
-static struct mv643xx_eth_platform_data db78x00_ge10_data = {
-	.phy_addr	= MV643XX_ETH_PHY_ADDR(10),
-};
-
-static struct mv643xx_eth_platform_data db78x00_ge11_data = {
-	.phy_addr	= MV643XX_ETH_PHY_ADDR(11),
-};
-
-static struct mv_sata_platform_data db78x00_sata_data = {
-	.n_ports	= 2,
-};
-
-static struct i2c_board_info __initdata db78x00_i2c_rtc = {
-	I2C_BOARD_INFO("ds1338", 0x68),
-};
-
-
-static void __init db78x00_init(void)
-{
-	/*
-	 * Basic MV78xx0 setup. Needs to be called early.
-	 */
-	mv78xx0_init();
-
-	/*
-	 * Partition on-chip peripherals between the two CPU cores.
-	 */
-	if (mv78xx0_core_index() == 0) {
-		mv78xx0_ehci0_init();
-		mv78xx0_ehci1_init();
-		mv78xx0_ehci2_init();
-		mv78xx0_ge00_init(&db78x00_ge00_data);
-		mv78xx0_ge01_init(&db78x00_ge01_data);
-		mv78xx0_ge10_init(&db78x00_ge10_data);
-		mv78xx0_ge11_init(&db78x00_ge11_data);
-		mv78xx0_sata_init(&db78x00_sata_data);
-		mv78xx0_uart0_init();
-		mv78xx0_uart2_init();
-		mv78xx0_i2c_init();
-		i2c_register_board_info(0, &db78x00_i2c_rtc, 1);
-	} else {
-		mv78xx0_uart1_init();
-		mv78xx0_uart3_init();
-	}
-}
-
-static int __init db78x00_pci_init(void)
-{
-	if (machine_is_db78x00_bp()) {
-		/*
-		 * Assign the x16 PCIe slot on the board to CPU core
-		 * #0, and let CPU core #1 have the four x1 slots.
-		 */
-		if (mv78xx0_core_index() == 0)
-			mv78xx0_pcie_init(0, 1);
-		else
-			mv78xx0_pcie_init(1, 0);
-	}
-
-	return 0;
-}
-subsys_initcall(db78x00_pci_init);
-
-MACHINE_START(DB78X00_BP, "Marvell DB-78x00-BP Development Board")
-	/* Maintainer: Lennert Buytenhek <buytenh@marvell.com> */
-	.atag_offset	= 0x100,
-	.nr_irqs	= MV78XX0_NR_IRQS,
-	.init_machine	= db78x00_init,
-	.map_io		= mv78xx0_map_io,
-	.init_early	= mv78xx0_init_early,
-	.init_irq	= mv78xx0_init_irq,
-	.init_time	= mv78xx0_timer_init,
-	.restart	= mv78xx0_restart,
-MACHINE_END
diff --git a/arch/arm/mach-mv78xx0/rd78x00-masa-setup.c b/arch/arm/mach-mv78xx0/rd78x00-masa-setup.c
deleted file mode 100644
index 80ca8b1a81de..000000000000
--- a/arch/arm/mach-mv78xx0/rd78x00-masa-setup.c
+++ /dev/null
@@ -1,86 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mach-mv78x00/rd78x00-masa-setup.c
- *
- * Marvell RD-78x00-mASA Development Board Setup
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/ata_platform.h>
-#include <linux/mv643xx_eth.h>
-#include <linux/ethtool.h>
-#include <asm/mach-types.h>
-#include <asm/mach/arch.h>
-#include "mv78xx0.h"
-#include "common.h"
-
-static struct mv643xx_eth_platform_data rd78x00_masa_ge00_data = {
-	.phy_addr	= MV643XX_ETH_PHY_ADDR(8),
-};
-
-static struct mv643xx_eth_platform_data rd78x00_masa_ge01_data = {
-	.phy_addr	= MV643XX_ETH_PHY_ADDR(9),
-};
-
-static struct mv643xx_eth_platform_data rd78x00_masa_ge10_data = {
-};
-
-static struct mv643xx_eth_platform_data rd78x00_masa_ge11_data = {
-};
-
-static struct mv_sata_platform_data rd78x00_masa_sata_data = {
-	.n_ports	= 2,
-};
-
-static void __init rd78x00_masa_init(void)
-{
-	/*
-	 * Basic MV78x00 setup. Needs to be called early.
-	 */
-	mv78xx0_init();
-
-	/*
-	 * Partition on-chip peripherals between the two CPU cores.
-	 */
-	if (mv78xx0_core_index() == 0) {
-		mv78xx0_ehci0_init();
-		mv78xx0_ehci1_init();
-		mv78xx0_ge00_init(&rd78x00_masa_ge00_data);
-		mv78xx0_ge10_init(&rd78x00_masa_ge10_data);
-		mv78xx0_sata_init(&rd78x00_masa_sata_data);
-		mv78xx0_uart0_init();
-		mv78xx0_uart2_init();
-	} else {
-		mv78xx0_ehci2_init();
-		mv78xx0_ge01_init(&rd78x00_masa_ge01_data);
-		mv78xx0_ge11_init(&rd78x00_masa_ge11_data);
-		mv78xx0_uart1_init();
-		mv78xx0_uart3_init();
-	}
-}
-
-static int __init rd78x00_pci_init(void)
-{
-	/*
-	 * Assign all PCIe devices to CPU core #0.
-	 */
-	if (machine_is_rd78x00_masa() && mv78xx0_core_index() == 0)
-		mv78xx0_pcie_init(1, 1);
-
-	return 0;
-}
-subsys_initcall(rd78x00_pci_init);
-
-MACHINE_START(RD78X00_MASA, "Marvell RD-78x00-MASA Development Board")
-	/* Maintainer: Lennert Buytenhek <buytenh@marvell.com> */
-	.atag_offset	= 0x100,
-	.nr_irqs	= MV78XX0_NR_IRQS,
-	.init_machine	= rd78x00_masa_init,
-	.map_io		= mv78xx0_map_io,
-	.init_early	= mv78xx0_init_early,
-	.init_irq	= mv78xx0_init_irq,
-	.init_time	= mv78xx0_timer_init,
-	.restart	= mv78xx0_restart,
-MACHINE_END
diff --git a/arch/arm/mach-orion5x/Kconfig b/arch/arm/mach-orion5x/Kconfig
index 0044b2823710..ee449ca032d2 100644
--- a/arch/arm/mach-orion5x/Kconfig
+++ b/arch/arm/mach-orion5x/Kconfig
@@ -28,22 +28,6 @@ config ARCH_ORION5X_DT
 	  Say 'Y' here if you want your kernel to support the
 	  Marvell Orion5x using flattened device tree.
 
-config MACH_DB88F5281
-	bool "Marvell Orion-2 Development Board"
-	select I2C_BOARDINFO if I2C
-	depends on ATAGS && UNUSED_BOARD_FILES
-	help
-	  Say 'Y' here if you want your kernel to support the
-	  Marvell Orion-2 (88F5281) Development Board
-
-config MACH_RD88F5182
-	bool "Marvell Orion-NAS Reference Design"
-	select I2C_BOARDINFO if I2C
-	depends on ATAGS && UNUSED_BOARD_FILES
-	help
-	  Say 'Y' here if you want your kernel to support the
-	  Marvell Orion-NAS (88F5182) RD2
-
 config MACH_RD88F5182_DT
 	bool "Marvell Orion-NAS Reference Design (Flattened Device Tree)"
 	select ARCH_ORION5X_DT
@@ -98,14 +82,6 @@ config MACH_LINKSTATION_MINI
 	  Say 'Y' here if you want your kernel to support the
 	  Buffalo Linkstation Mini (LS-WSGL) platform.
 
-config MACH_LINKSTATION_LS_HGL
-	bool "Buffalo Linkstation LS-HGL"
-	depends on ATAGS && UNUSED_BOARD_FILES
-	select I2C_BOARDINFO if I2C
-	help
-	  Say 'Y' here if you want your kernel to support the
-	  Buffalo Linkstation LS-HGL platform.
-
 config MACH_TS409
 	bool "QNAP TS-409"
 	depends on ATAGS
@@ -113,13 +89,6 @@ config MACH_TS409
 	  Say 'Y' here if you want your kernel to support the
 	  QNAP TS-409 platform.
 
-config MACH_WRT350N_V2
-	bool "Linksys WRT350N v2"
-	depends on ATAGS && UNUSED_BOARD_FILES
-	help
-	  Say 'Y' here if you want your kernel to support the
-	  Linksys WRT350N v2 platform.
-
 config MACH_TS78XX
 	bool "Technologic Systems TS-78xx"
 	depends on ATAGS
@@ -156,32 +125,4 @@ config MACH_MSS2_DT
 	  Say 'Y' here if you want your kernel to support the
 	  Maxtor Shared Storage II platform.
 
-config MACH_WNR854T
-	bool "Netgear WNR854T"
-	depends on ATAGS && UNUSED_BOARD_FILES
-	help
-	  Say 'Y' here if you want your kernel to support the
-	  Netgear WNR854T platform.
-
-config MACH_RD88F5181L_GE
-	bool "Marvell Orion-VoIP GE Reference Design"
-	depends on ATAGS && UNUSED_BOARD_FILES
-	help
-	  Say 'Y' here if you want your kernel to support the
-	  Marvell Orion-VoIP GE (88F5181L) RD.
-
-config MACH_RD88F5181L_FXO
-	bool "Marvell Orion-VoIP FXO Reference Design"
-	depends on ATAGS && UNUSED_BOARD_FILES
-	help
-	  Say 'Y' here if you want your kernel to support the
-	  Marvell Orion-VoIP FXO (88F5181L) RD.
-
-config MACH_RD88F6183AP_GE
-	bool "Marvell Orion-1-90 AP GE Reference Design"
-	depends on ATAGS && UNUSED_BOARD_FILES
-	help
-	  Say 'Y' here if you want your kernel to support the
-	  Marvell Orion-1-90 (88F6183) AP GE RD.
-
 endif
diff --git a/arch/arm/mach-orion5x/Makefile b/arch/arm/mach-orion5x/Makefile
index 572c3520f7fe..6f54d7fef27a 100644
--- a/arch/arm/mach-orion5x/Makefile
+++ b/arch/arm/mach-orion5x/Makefile
@@ -2,23 +2,15 @@
 ccflags-y := -I$(srctree)/arch/arm/plat-orion/include
 
 obj-y				+= common.o pci.o irq.o mpp.o
-obj-$(CONFIG_MACH_DB88F5281)	+= db88f5281-setup.o
-obj-$(CONFIG_MACH_RD88F5182)	+= rd88f5182-setup.o
 obj-$(CONFIG_MACH_KUROBOX_PRO)	+= kurobox_pro-setup.o
 obj-$(CONFIG_MACH_TERASTATION_PRO2)	+= terastation_pro2-setup.o
 obj-$(CONFIG_MACH_LINKSTATION_PRO) += kurobox_pro-setup.o
-obj-$(CONFIG_MACH_LINKSTATION_LS_HGL) += ls_hgl-setup.o
 obj-$(CONFIG_MACH_DNS323)	+= dns323-setup.o
 obj-$(CONFIG_MACH_TS209)	+= ts209-setup.o tsx09-common.o
 obj-$(CONFIG_MACH_TS409)	+= ts409-setup.o tsx09-common.o
-obj-$(CONFIG_MACH_WRT350N_V2)	+= wrt350n-v2-setup.o
 obj-$(CONFIG_MACH_TS78XX)	+= ts78xx-setup.o
 obj-$(CONFIG_MACH_MV2120)	+= mv2120-setup.o
 obj-$(CONFIG_MACH_NET2BIG)	+= net2big-setup.o
-obj-$(CONFIG_MACH_WNR854T)	+= wnr854t-setup.o
-obj-$(CONFIG_MACH_RD88F5181L_GE)	+= rd88f5181l-ge-setup.o
-obj-$(CONFIG_MACH_RD88F5181L_FXO)	+= rd88f5181l-fxo-setup.o
-obj-$(CONFIG_MACH_RD88F6183AP_GE)	+= rd88f6183ap-ge-setup.o
 
 obj-$(CONFIG_ARCH_ORION5X_DT)		+= board-dt.o
 obj-$(CONFIG_MACH_D2NET_DT)	+= board-d2net.o
diff --git a/arch/arm/mach-orion5x/db88f5281-setup.c b/arch/arm/mach-orion5x/db88f5281-setup.c
deleted file mode 100644
index fe1a4cef1ba2..000000000000
--- a/arch/arm/mach-orion5x/db88f5281-setup.c
+++ /dev/null
@@ -1,376 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mach-orion5x/db88f5281-setup.c
- *
- * Marvell Orion-2 Development Board Setup
- *
- * Maintainer: Tzachi Perelstein <tzachi@marvell.com>
- */
-#include <linux/gpio.h>
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/pci.h>
-#include <linux/irq.h>
-#include <linux/mtd/physmap.h>
-#include <linux/mtd/rawnand.h>
-#include <linux/timer.h>
-#include <linux/mv643xx_eth.h>
-#include <linux/i2c.h>
-#include <asm/mach-types.h>
-#include <asm/mach/arch.h>
-#include <asm/mach/pci.h>
-#include <linux/platform_data/mtd-orion_nand.h>
-#include "common.h"
-#include "mpp.h"
-#include "orion5x.h"
-
-/*****************************************************************************
- * DB-88F5281 on board devices
- ****************************************************************************/
-
-/*
- * 512K NOR flash Device bus boot chip select
- */
-
-#define DB88F5281_NOR_BOOT_BASE		0xf4000000
-#define DB88F5281_NOR_BOOT_SIZE		SZ_512K
-
-/*
- * 7-Segment on Device bus chip select 0
- */
-
-#define DB88F5281_7SEG_BASE		0xfa000000
-#define DB88F5281_7SEG_SIZE		SZ_1K
-
-/*
- * 32M NOR flash on Device bus chip select 1
- */
-
-#define DB88F5281_NOR_BASE		0xfc000000
-#define DB88F5281_NOR_SIZE		SZ_32M
-
-/*
- * 32M NAND flash on Device bus chip select 2
- */
-
-#define DB88F5281_NAND_BASE		0xfa800000
-#define DB88F5281_NAND_SIZE		SZ_1K
-
-/*
- * PCI
- */
-
-#define DB88F5281_PCI_SLOT0_OFFS		7
-#define DB88F5281_PCI_SLOT0_IRQ_PIN		12
-#define DB88F5281_PCI_SLOT1_SLOT2_IRQ_PIN	13
-
-/*****************************************************************************
- * 512M NOR Flash on Device bus Boot CS
- ****************************************************************************/
-
-static struct physmap_flash_data db88f5281_boot_flash_data = {
-	.width		= 1,	/* 8 bit bus width */
-};
-
-static struct resource db88f5281_boot_flash_resource = {
-	.flags		= IORESOURCE_MEM,
-	.start		= DB88F5281_NOR_BOOT_BASE,
-	.end		= DB88F5281_NOR_BOOT_BASE + DB88F5281_NOR_BOOT_SIZE - 1,
-};
-
-static struct platform_device db88f5281_boot_flash = {
-	.name		= "physmap-flash",
-	.id		= 0,
-	.dev		= {
-		.platform_data	= &db88f5281_boot_flash_data,
-	},
-	.num_resources	= 1,
-	.resource	= &db88f5281_boot_flash_resource,
-};
-
-/*****************************************************************************
- * 32M NOR Flash on Device bus CS1
- ****************************************************************************/
-
-static struct physmap_flash_data db88f5281_nor_flash_data = {
-	.width		= 4,	/* 32 bit bus width */
-};
-
-static struct resource db88f5281_nor_flash_resource = {
-	.flags		= IORESOURCE_MEM,
-	.start		= DB88F5281_NOR_BASE,
-	.end		= DB88F5281_NOR_BASE + DB88F5281_NOR_SIZE - 1,
-};
-
-static struct platform_device db88f5281_nor_flash = {
-	.name		= "physmap-flash",
-	.id		= 1,
-	.dev		= {
-		.platform_data	= &db88f5281_nor_flash_data,
-	},
-	.num_resources	= 1,
-	.resource	= &db88f5281_nor_flash_resource,
-};
-
-/*****************************************************************************
- * 32M NAND Flash on Device bus CS2
- ****************************************************************************/
-
-static struct mtd_partition db88f5281_nand_parts[] = {
-	{
-		.name = "kernel",
-		.offset = 0,
-		.size = SZ_2M,
-	}, {
-		.name = "root",
-		.offset = SZ_2M,
-		.size = (SZ_16M - SZ_2M),
-	}, {
-		.name = "user",
-		.offset = SZ_16M,
-		.size = SZ_8M,
-	}, {
-		.name = "recovery",
-		.offset = (SZ_16M + SZ_8M),
-		.size = SZ_8M,
-	},
-};
-
-static struct resource db88f5281_nand_resource = {
-	.flags		= IORESOURCE_MEM,
-	.start		= DB88F5281_NAND_BASE,
-	.end		= DB88F5281_NAND_BASE + DB88F5281_NAND_SIZE - 1,
-};
-
-static struct orion_nand_data db88f5281_nand_data = {
-	.parts		= db88f5281_nand_parts,
-	.nr_parts	= ARRAY_SIZE(db88f5281_nand_parts),
-	.cle		= 0,
-	.ale		= 1,
-	.width		= 8,
-};
-
-static struct platform_device db88f5281_nand_flash = {
-	.name		= "orion_nand",
-	.id		= -1,
-	.dev		= {
-		.platform_data	= &db88f5281_nand_data,
-	},
-	.resource	= &db88f5281_nand_resource,
-	.num_resources	= 1,
-};
-
-/*****************************************************************************
- * 7-Segment on Device bus CS0
- * Dummy counter every 2 sec
- ****************************************************************************/
-
-static void __iomem *db88f5281_7seg;
-static struct timer_list db88f5281_timer;
-
-static void db88f5281_7seg_event(struct timer_list *unused)
-{
-	static int count = 0;
-	writel(0, db88f5281_7seg + (count << 4));
-	count = (count + 1) & 7;
-	mod_timer(&db88f5281_timer, jiffies + 2 * HZ);
-}
-
-static int __init db88f5281_7seg_init(void)
-{
-	if (machine_is_db88f5281()) {
-		db88f5281_7seg = ioremap(DB88F5281_7SEG_BASE,
-					DB88F5281_7SEG_SIZE);
-		if (!db88f5281_7seg) {
-			printk(KERN_ERR "Failed to ioremap db88f5281_7seg\n");
-			return -EIO;
-		}
-		timer_setup(&db88f5281_timer, db88f5281_7seg_event, 0);
-		mod_timer(&db88f5281_timer, jiffies + 2 * HZ);
-	}
-
-	return 0;
-}
-
-__initcall(db88f5281_7seg_init);
-
-/*****************************************************************************
- * PCI
- ****************************************************************************/
-
-static void __init db88f5281_pci_preinit(void)
-{
-	int pin;
-
-	/*
-	 * Configure PCI GPIO IRQ pins
-	 */
-	pin = DB88F5281_PCI_SLOT0_IRQ_PIN;
-	if (gpio_request(pin, "PCI Int1") == 0) {
-		if (gpio_direction_input(pin) == 0) {
-			irq_set_irq_type(gpio_to_irq(pin), IRQ_TYPE_LEVEL_LOW);
-		} else {
-			printk(KERN_ERR "db88f5281_pci_preinit failed to "
-					"set_irq_type pin %d\n", pin);
-			gpio_free(pin);
-		}
-	} else {
-		printk(KERN_ERR "db88f5281_pci_preinit failed to gpio_request %d\n", pin);
-	}
-
-	pin = DB88F5281_PCI_SLOT1_SLOT2_IRQ_PIN;
-	if (gpio_request(pin, "PCI Int2") == 0) {
-		if (gpio_direction_input(pin) == 0) {
-			irq_set_irq_type(gpio_to_irq(pin), IRQ_TYPE_LEVEL_LOW);
-		} else {
-			printk(KERN_ERR "db88f5281_pci_preinit failed "
-					"to set_irq_type pin %d\n", pin);
-			gpio_free(pin);
-		}
-	} else {
-		printk(KERN_ERR "db88f5281_pci_preinit failed to gpio_request %d\n", pin);
-	}
-}
-
-static int __init db88f5281_pci_map_irq(const struct pci_dev *dev, u8 slot,
-	u8 pin)
-{
-	int irq;
-
-	/*
-	 * Check for devices with hard-wired IRQs.
-	 */
-	irq = orion5x_pci_map_irq(dev, slot, pin);
-	if (irq != -1)
-		return irq;
-
-	/*
-	 * PCI IRQs are connected via GPIOs.
-	 */
-	switch (slot - DB88F5281_PCI_SLOT0_OFFS) {
-	case 0:
-		return gpio_to_irq(DB88F5281_PCI_SLOT0_IRQ_PIN);
-	case 1:
-	case 2:
-		return gpio_to_irq(DB88F5281_PCI_SLOT1_SLOT2_IRQ_PIN);
-	default:
-		return -1;
-	}
-}
-
-static struct hw_pci db88f5281_pci __initdata = {
-	.nr_controllers	= 2,
-	.preinit	= db88f5281_pci_preinit,
-	.setup		= orion5x_pci_sys_setup,
-	.scan		= orion5x_pci_sys_scan_bus,
-	.map_irq	= db88f5281_pci_map_irq,
-};
-
-static int __init db88f5281_pci_init(void)
-{
-	if (machine_is_db88f5281())
-		pci_common_init(&db88f5281_pci);
-
-	return 0;
-}
-
-subsys_initcall(db88f5281_pci_init);
-
-/*****************************************************************************
- * Ethernet
- ****************************************************************************/
-static struct mv643xx_eth_platform_data db88f5281_eth_data = {
-	.phy_addr	= MV643XX_ETH_PHY_ADDR(8),
-};
-
-/*****************************************************************************
- * RTC DS1339 on I2C bus
- ****************************************************************************/
-static struct i2c_board_info __initdata db88f5281_i2c_rtc = {
-	I2C_BOARD_INFO("ds1339", 0x68),
-};
-
-/*****************************************************************************
- * General Setup
- ****************************************************************************/
-static unsigned int db88f5281_mpp_modes[] __initdata = {
-	MPP0_GPIO,		/* USB Over Current */
-	MPP1_GPIO,		/* USB Vbat input */
-	MPP2_PCI_ARB,		/* PCI_REQn[2] */
-	MPP3_PCI_ARB,		/* PCI_GNTn[2] */
-	MPP4_PCI_ARB,		/* PCI_REQn[3] */
-	MPP5_PCI_ARB,		/* PCI_GNTn[3] */
-	MPP6_GPIO,		/* JP0, CON17.2 */
-	MPP7_GPIO,		/* JP1, CON17.1 */
-	MPP8_GPIO,		/* JP2, CON11.2 */
-	MPP9_GPIO,		/* JP3, CON11.3 */
-	MPP10_GPIO,		/* RTC int */
-	MPP11_GPIO,		/* Baud Rate Generator */
-	MPP12_GPIO,		/* PCI int 1 */
-	MPP13_GPIO,		/* PCI int 2 */
-	MPP14_NAND,		/* NAND_REn[2] */
-	MPP15_NAND,		/* NAND_WEn[2] */
-	MPP16_UART,		/* UART1_RX */
-	MPP17_UART,		/* UART1_TX */
-	MPP18_UART,		/* UART1_CTSn */
-	MPP19_UART,		/* UART1_RTSn */
-	0,
-};
-
-static void __init db88f5281_init(void)
-{
-	/*
-	 * Basic Orion setup. Need to be called early.
-	 */
-	orion5x_init();
-
-	orion5x_mpp_conf(db88f5281_mpp_modes);
-	writel(0, MPP_DEV_CTRL);		/* DEV_D[31:16] */
-
-	/*
-	 * Configure peripherals.
-	 */
-	orion5x_ehci0_init();
-	orion5x_eth_init(&db88f5281_eth_data);
-	orion5x_i2c_init();
-	orion5x_uart0_init();
-	orion5x_uart1_init();
-
-	mvebu_mbus_add_window_by_id(ORION_MBUS_DEVBUS_BOOT_TARGET,
-				    ORION_MBUS_DEVBUS_BOOT_ATTR,
-				    DB88F5281_NOR_BOOT_BASE,
-				    DB88F5281_NOR_BOOT_SIZE);
-	platform_device_register(&db88f5281_boot_flash);
-
-	mvebu_mbus_add_window_by_id(ORION_MBUS_DEVBUS_TARGET(0),
-				    ORION_MBUS_DEVBUS_ATTR(0),
-				    DB88F5281_7SEG_BASE,
-				    DB88F5281_7SEG_SIZE);
-
-	mvebu_mbus_add_window_by_id(ORION_MBUS_DEVBUS_TARGET(1),
-				    ORION_MBUS_DEVBUS_ATTR(1),
-				    DB88F5281_NOR_BASE,
-				    DB88F5281_NOR_SIZE);
-	platform_device_register(&db88f5281_nor_flash);
-
-	mvebu_mbus_add_window_by_id(ORION_MBUS_DEVBUS_TARGET(2),
-				    ORION_MBUS_DEVBUS_ATTR(2),
-				    DB88F5281_NAND_BASE,
-				    DB88F5281_NAND_SIZE);
-	platform_device_register(&db88f5281_nand_flash);
-
-	i2c_register_board_info(0, &db88f5281_i2c_rtc, 1);
-}
-
-MACHINE_START(DB88F5281, "Marvell Orion-2 Development Board")
-	/* Maintainer: Tzachi Perelstein <tzachi@marvell.com> */
-	.atag_offset	= 0x100,
-	.nr_irqs	= ORION5X_NR_IRQS,
-	.init_machine	= db88f5281_init,
-	.map_io		= orion5x_map_io,
-	.init_early	= orion5x_init_early,
-	.init_irq	= orion5x_init_irq,
-	.init_time	= orion5x_timer_init,
-	.restart	= orion5x_restart,
-MACHINE_END
diff --git a/arch/arm/mach-orion5x/ls_hgl-setup.c b/arch/arm/mach-orion5x/ls_hgl-setup.c
deleted file mode 100644
index af07f617465f..000000000000
--- a/arch/arm/mach-orion5x/ls_hgl-setup.c
+++ /dev/null
@@ -1,275 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * arch/arm/mach-orion5x/ls_hgl-setup.c
- *
- * Maintainer: Zhu Qingsen <zhuqs@cn.fujitsu.com>
- */
-
-#include <linux/kernel.h>
-#include <linux/init.h>
-#include <linux/platform_device.h>
-#include <linux/mtd/physmap.h>
-#include <linux/mv643xx_eth.h>
-#include <linux/leds.h>
-#include <linux/gpio_keys.h>
-#include <linux/input.h>
-#include <linux/i2c.h>
-#include <linux/ata_platform.h>
-#include <linux/gpio.h>
-#include <asm/mach-types.h>
-#include <asm/mach/arch.h>
-#include "common.h"
-#include "mpp.h"
-#include "orion5x.h"
-
-/*****************************************************************************
- * Linkstation LS-HGL Info
- ****************************************************************************/
-
-/*
- * 256K NOR flash Device bus boot chip select
- */
-
-#define LS_HGL_NOR_BOOT_BASE	0xf4000000
-#define LS_HGL_NOR_BOOT_SIZE	SZ_256K
-
-/*****************************************************************************
- * 256KB NOR Flash on BOOT Device
- ****************************************************************************/
-
-static struct physmap_flash_data ls_hgl_nor_flash_data = {
-	.width		= 1,
-};
-
-static struct resource ls_hgl_nor_flash_resource = {
-	.flags	= IORESOURCE_MEM,
-	.start	= LS_HGL_NOR_BOOT_BASE,
-	.end	= LS_HGL_NOR_BOOT_BASE + LS_HGL_NOR_BOOT_SIZE - 1,
-};
-
-static struct platform_device ls_hgl_nor_flash = {
-	.name			= "physmap-flash",
-	.id			= 0,
-	.dev		= {
-		.platform_data	= &ls_hgl_nor_flash_data,
-	},
-	.num_resources		= 1,
-	.resource		= &ls_hgl_nor_flash_resource,
-};
-
-/*****************************************************************************
- * Ethernet
- ****************************************************************************/
-
-static struct mv643xx_eth_platform_data ls_hgl_eth_data = {
-	.phy_addr	= 8,
-};
-
-/*****************************************************************************
- * RTC 5C372a on I2C bus
- ****************************************************************************/
-
-static struct i2c_board_info __initdata ls_hgl_i2c_rtc = {
</cut>
------=_Part_4201_299797598.1674688109924--
