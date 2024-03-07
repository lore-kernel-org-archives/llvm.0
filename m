Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F0820B38;
	Thu,  7 Mar 2024 23:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709853809; cv=none; b=E8+vWVb8UwbCPcNgt9LoPYRQAxiYBupo5iQweDDif22C+WnXghz2P58fjBkjrwCQrfhVGwKwacq1coANnpoIueaPJonQaB5/6pCuK7zfkTGFQd0op5WIcgyLXdOZ1sxlKmHKsV12RUcYO6iUkw6FhJozFRAqPvgSZMWllz6BBrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709853809; c=relaxed/simple;
	bh=4GPaPY7TnI6rU/+OkVTuFyBXEgQ/S4uD4PL6TW3kR4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n2aGUQFn6dHdNgr/yJflz+CS8WBKxluwyITm9ahnRCl0QwpkTwMMEtGZAe3svT2rihju+ZfREH38bgYZoP3HOeyOCak8SOmABYiaX2Llqwhx1rx2JhMiCQ9EWWg17/VY+qkmnwJ4zU6mpmIB9ZwKd8IYwEY5tEBx00W5xHq1GwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFbDx5JH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFbDx5JH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709853807; x=1741389807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4GPaPY7TnI6rU/+OkVTuFyBXEgQ/S4uD4PL6TW3kR4Y=;
  b=SFbDx5JHlyeM0X/QyAiTOwwH7YtOOJUOs4zAWG1C5nQh6pVDyupmSbj5
   5Gudttzi6LGc/3j2aNoUo+Khr4D80SF935JftDy5adbDZDIMkuiMLRsE9
   BFZClvomhEYiWSpmD5rJqwPi7Qs12ESGeEHvssOradDEttPQW9gTkMzYb
   WSJ5ttIGRh21LT7bLWdLos6SraVTn3/Vgv7jB/8jE//tmJGkkOCODxi9d
   0T5r1KELtuRL2smc3RizjFWnX3GKYEtAp/RZU/DM5rrqMQx1VO6UA0stc
   wa7u0J1O6Ns1n0PhQikI04a3diiKoXpA1FLNN6pNJYULSDoY+4+zg0D7v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="27028762"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="27028762"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2024 15:23:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="14772146"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Mar 2024 15:23:25 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riN58-0005np-2m;
	Thu, 07 Mar 2024 23:23:22 +0000
Date: Fri, 8 Mar 2024 07:23:18 +0800
From: kernel test robot <lkp@intel.com>
To: Phil Elwell <phil@raspberrypi.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: [jmondi:pispbe/media-staging/be-upstream 6/143]
 drivers/pinctrl/bcm/pinctrl-bcm2712.c:598:39: warning: unused variable
 'bcm2712_c0_aon_sgpio_pin_funcs'
Message-ID: <202403080708.7rqsvi76-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git pispbe/media-staging/be-upstream
head:   b7b928a1ff80dc548d6f5c1b8c00b2082212e38e
commit: e839a3c9e275f9506bcc5f49c5a2b0c45b047985 [6/143] pinctrl: bcm2712 pinctrl/pinconf driver
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240308/202403080708.7rqsvi76-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240308/202403080708.7rqsvi76-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403080708.7rqsvi76-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pinctrl/bcm/pinctrl-bcm2712.c:16:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/pinctrl/bcm/pinctrl-bcm2712.c:18:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/pinctrl/bcm/pinctrl-bcm2712.c:18:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/pinctrl/bcm/pinctrl-bcm2712.c:18:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   drivers/pinctrl/bcm/pinctrl-bcm2712.c:1009:13: warning: variable 'arg' set but not used [-Wunused-but-set-variable]
    1009 |         u32 param, arg;
         |                    ^
>> drivers/pinctrl/bcm/pinctrl-bcm2712.c:598:39: warning: unused variable 'bcm2712_c0_aon_sgpio_pin_funcs' [-Wunused-const-variable]
     598 | static const struct bcm2712_pin_funcs bcm2712_c0_aon_sgpio_pin_funcs[] = {
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pinctrl/bcm/pinctrl-bcm2712.c:682:39: warning: unused variable 'bcm2712_d0_aon_sgpio_pin_funcs' [-Wunused-const-variable]
     682 | static const struct bcm2712_pin_funcs bcm2712_d0_aon_sgpio_pin_funcs[] = {
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   20 warnings generated.


vim +/bcm2712_c0_aon_sgpio_pin_funcs +598 drivers/pinctrl/bcm/pinctrl-bcm2712.c

   597	
 > 598	static const struct bcm2712_pin_funcs bcm2712_c0_aon_sgpio_pin_funcs[] = {
   599		PIN(0, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
   600		PIN(1, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
   601		PIN(2, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, ctl_hdmi_5v, _, _, _),
   602		PIN(3, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c4, _, _, _, _),
   603		PIN(4, avs_pmu_bsc, bsc_m2, vc_i2c5, ctl_hdmi_5v, _, _, _, _),
   604		PIN(5, avs_pmu_bsc, bsc_m2, vc_i2c5, _, _, _, _, _),
   605	};
   606	
   607	static const struct bcm2712_pin_funcs bcm2712_c0_gpio_pin_funcs[] = {
   608		PIN(0, bsc_m3, vc_i2c0, gpclk0, enet0, vc_pwm1, vc_spi0, ir_in, _),
   609		PIN(1, bsc_m3, vc_i2c0, gpclk1, enet0, vc_pwm1, sr_edm_sense, vc_spi0, vc_uart3),
   610		PIN(2, pdm, i2s_in, gpclk2, vc_spi4, pkt, vc_spi0, vc_uart3, _),
   611		PIN(3, pdm, i2s_in, vc_spi4, pkt, vc_spi0, vc_uart3, _, _),
   612		PIN(4, pdm, i2s_in, arm_jtag, vc_spi4, pkt, vc_spi0, vc_uart3, _),
   613		PIN(5, pdm, vc_i2c3, arm_jtag, sd_card_e, vc_spi4, pkt, vc_pcm, vc_i2c5),
   614		PIN(6, pdm, vc_i2c3, arm_jtag, sd_card_e, vc_spi4, pkt, vc_pcm, vc_i2c5),
   615		PIN(7, i2s_out, spdif_out, arm_jtag, sd_card_e, vc_i2c3, enet0_rgmii, vc_pcm, vc_spi4),
   616		PIN(8, i2s_out, aud_fs_clk0, arm_jtag, sd_card_e, vc_i2c3, enet0_mii, vc_pcm, vc_spi4),
   617		PIN(9, i2s_out, aud_fs_clk0, arm_jtag, sd_card_e, enet0_mii, sd_card_c, vc_spi4, _),
   618		PIN(10, bsc_m3, mtsif_alt1, i2s_in, i2s_out, vc_spi5, enet0_mii, sd_card_c, vc_spi4),
   619		PIN(11, bsc_m3, mtsif_alt1, i2s_in, i2s_out, vc_spi5, enet0_mii, sd_card_c, vc_spi4),
   620		PIN(12, spi_s, mtsif_alt1, i2s_in, i2s_out, vc_spi5, vc_i2csl, sd0, sd_card_d),
   621		PIN(13, spi_s, mtsif_alt1, i2s_out, usb_vbus, vc_spi5, vc_i2csl, sd0, sd_card_d),
   622		PIN(14, spi_s, vc_i2csl, enet0_rgmii, arm_jtag, vc_spi5, vc_pwm0, vc_i2c4, sd_card_d),
   623		PIN(15, spi_s, vc_i2csl, vc_spi3, arm_jtag, vc_pwm0, vc_i2c4, gpclk0, _),
   624		PIN(16, sd_card_b, i2s_out, vc_spi3, i2s_in, sd0, enet0_rgmii, gpclk1, _),
   625		PIN(17, sd_card_b, i2s_out, vc_spi3, i2s_in, ext_sc_clk, sd0, enet0_rgmii, gpclk2),
   626		PIN(18, sd_card_b, i2s_out, vc_spi3, i2s_in, sd0, enet0_rgmii, vc_pwm1, _),
   627		PIN(19, sd_card_b, usb_pwr, vc_spi3, pkt, spdif_out, sd0, ir_in, vc_pwm1),
   628		PIN(20, sd_card_b, uui, vc_uart0, arm_jtag, uart2, usb_pwr, vc_pcm, vc_uart4),
   629		PIN(21, usb_pwr, uui, vc_uart0, arm_jtag, uart2, sd_card_b, vc_pcm, vc_uart4),
   630		PIN(22, usb_pwr, enet0, vc_uart0, mtsif, uart2, usb_vbus, vc_pcm, vc_i2c5),
   631		PIN(23, usb_vbus, enet0, vc_uart0, mtsif, uart2, i2s_out, vc_pcm, vc_i2c5),
   632		PIN(24, mtsif, pkt, uart0, enet0_rgmii, enet0_rgmii, vc_i2c4, vc_uart3, _),
   633		PIN(25, mtsif, pkt, sc0, uart0, enet0_rgmii, enet0_rgmii, vc_i2c4, vc_uart3),
   634		PIN(26, mtsif, pkt, sc0, uart0, enet0_rgmii, vc_uart4, vc_spi5, _),
   635		PIN(27, mtsif, pkt, sc0, uart0, enet0_rgmii, vc_uart4, vc_spi5, _),
   636		PIN(28, mtsif, pkt, sc0, enet0_rgmii, vc_uart4, vc_spi5, _, _),
   637		PIN(29, mtsif, pkt, sc0, enet0_rgmii, vc_uart4, vc_spi5, _, _),
   638		PIN(30, mtsif, pkt, sc0, sd2, enet0_rgmii, gpclk0, vc_pwm0, _),
   639		PIN(31, mtsif, pkt, sc0, sd2, enet0_rgmii, vc_spi3, vc_pwm0, _),
   640		PIN(32, mtsif, pkt, sc0, sd2, enet0_rgmii, vc_spi3, vc_uart3, _),
   641		PIN(33, mtsif, pkt, sd2, enet0_rgmii, vc_spi3, vc_uart3, _, _),
   642		PIN(34, mtsif, pkt, ext_sc_clk, sd2, enet0_rgmii, vc_spi3, vc_i2c5, _),
   643		PIN(35, mtsif, pkt, sd2, enet0_rgmii, vc_spi3, vc_i2c5, _, _),
   644		PIN(36, sd0, mtsif, sc0, i2s_in, vc_uart3, vc_uart2, _, _),
   645		PIN(37, sd0, mtsif, sc0, vc_spi0, i2s_in, vc_uart3, vc_uart2, _),
   646		PIN(38, sd0, mtsif_alt, sc0, vc_spi0, i2s_in, vc_uart3, vc_uart2, _),
   647		PIN(39, sd0, mtsif_alt, sc0, vc_spi0, vc_uart3, vc_uart2, _, _),
   648		PIN(40, sd0, mtsif_alt, sc0, vc_spi0, bsc_m3, _, _, _),
   649		PIN(41, sd0, mtsif_alt, sc0, vc_spi0, bsc_m3, _, _, _),
   650		PIN(42, vc_spi0, mtsif_alt, vc_i2c0, sd_card_a, mtsif_alt1, arm_jtag, pdm, spi_m),
   651		PIN(43, vc_spi0, mtsif_alt, vc_i2c0, sd_card_a, mtsif_alt1, arm_jtag, pdm, spi_m),
   652		PIN(44, vc_spi0, mtsif_alt, enet0, sd_card_a, mtsif_alt1, arm_jtag, pdm, spi_m),
   653		PIN(45, vc_spi0, mtsif_alt, enet0, sd_card_a, mtsif_alt1, arm_jtag, pdm, spi_m),
   654		PIN(46, vc_spi0, mtsif_alt, sd_card_a, mtsif_alt1, arm_jtag, pdm, spi_m, _),
   655		PIN(47, enet0, mtsif_alt, i2s_out, mtsif_alt1, arm_jtag, _, _, _),
   656		PIN(48, sc0, usb_pwr, spdif_out, mtsif, _, _, _, _),
   657		PIN(49, sc0, usb_pwr, aud_fs_clk0, mtsif, _, _, _, _),
   658		PIN(50, sc0, usb_vbus, sc0, _, _, _, _, _),
   659		PIN(51, sc0, enet0, sc0, sr_edm_sense, _, _, _, _),
   660		PIN(52, sc0, enet0, vc_pwm1, _, _, _, _, _),
   661		PIN(53, sc0, enet0_rgmii, ext_sc_clk, _, _, _, _, _),
   662	};
   663	
   664	static const struct bcm2712_pin_funcs bcm2712_d0_aon_gpio_pin_funcs[] = {
   665		PIN(0, ir_in, vc_spi0, vc_uart0, vc_i2c3, uart0, vc_i2c0, _, _),
   666		PIN(1, vc_pwm0, vc_spi0, vc_uart0, vc_i2c3, uart0, aon_pwm, vc_i2c0, vc_pwm1),
   667		PIN(2, vc_pwm0, vc_spi0, vc_uart0, ctl_hdmi_5v, uart0, aon_pwm, ir_in, vc_pwm1),
   668		PIN(3, ir_in, vc_spi0, vc_uart0, uart0, sd_card_g, aon_gpclk, _, _),
   669		PIN(4, gpclk0, vc_spi0, pm_led_out, aon_pwm, sd_card_g, vc_pwm0, _, _),
   670		PIN(5, gpclk1, ir_in, aon_pwm, sd_card_g, vc_pwm0, _, _, _),
   671		PIN(6, uart1, vc_uart2, ctl_hdmi_5v, gpclk2, vc_spi3, _, _, _),
   672		PIN(7, _, _, _, _, _, _, _, _),
   673		PIN(8, uart1, vc_uart2, ctl_hdmi_5v, vc_spi0, vc_spi3, _, _, _),
   674		PIN(9, uart1, vc_uart2, vc_uart0, aon_pwm, vc_spi0, vc_uart2, vc_spi3, _),
   675		PIN(10, _, _, _, _, _, _, _, _),
   676		PIN(11, _, _, _, _, _, _, _, _),
   677		PIN(12, uart1, vc_uart2, vc_uart0, vc_spi0, usb_pwr, vc_uart2, vc_spi3, _),
   678		PIN(13, bsc_m1, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2, vc_i2c3, _),
   679		PIN(14, bsc_m1, aon_gpclk, vc_uart0, uui, vc_spi0, arm_jtag, vc_uart2, vc_i2c3),
   680	};
   681	
 > 682	static const struct bcm2712_pin_funcs bcm2712_d0_aon_sgpio_pin_funcs[] = {
   683		PIN(0, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
   684		PIN(1, hdmi_tx0_bsc, hdmi_tx0_auto_i2c, bsc_m0, vc_i2c0, _, _, _, _),
   685		PIN(2, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, ctl_hdmi_5v, _, _, _),
   686		PIN(3, hdmi_tx1_bsc, hdmi_tx1_auto_i2c, bsc_m1, vc_i2c0, _, _, _, _),
   687		PIN(4, avs_pmu_bsc, bsc_m2, vc_i2c3, ctl_hdmi_5v, _, _, _, _),
   688		PIN(5, avs_pmu_bsc, bsc_m2, vc_i2c3, _, _, _, _, _),
   689	};
   690	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
