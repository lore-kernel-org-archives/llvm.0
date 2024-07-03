Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD081803E;
	Wed,  3 Jul 2024 05:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719983108; cv=none; b=LsoYhwvlHLeaRT87iUULSQnmUBgZEhzujHUTev0UqTKG2XsDs73AiNNXI0DZtjLTpzlfYyNBrxSX098jpGdpc6LQQ4DNPdtn5UMHUNvQme4O8aLqDN0gmboU1l7qjFtWV5w5y3G6Mr3p7kYQS2IkUckvMPS+kZrjwCJy3eBORn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719983108; c=relaxed/simple;
	bh=kzLC//5Zk5KG8F+UmrI7Y8jrfWw0F2OWED2S2ToqMUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owxaMQQQfecHmnJqQyy43pmYLHE8wc2UUwIIFdZyinQZpiGCcHR6KUz7Fond0XzyyhyJmKWWKQT4HKybIOEt35C3dtzJZ0gkwpoC0Q05YonFVKjCu12bWKJqLEoi1En5U4BZf8sdRM6sJCoKTt1VHAufK+CqbgdxCxs2HR/y9BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iDgf9bmV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iDgf9bmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719983107; x=1751519107;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kzLC//5Zk5KG8F+UmrI7Y8jrfWw0F2OWED2S2ToqMUc=;
  b=iDgf9bmV3icVSqNPPbmv9P/IHjxG+8hPDpNbv8WtxULOS0hqmhl0jXxE
   IlAU7gUmm8P3hHbpvasc1tgiCxHAk3vgPhPXhsJtQ/zSlwhrjFIYwjixq
   VpPFblSefB9ir4zuImGpBTJ6H4Cjg9Q+p4FZBqeuP7TZM0QRjA3H6YPWL
   2XHiwTJYu29M7Pe2Cf11jc7yO1LK9ulRW2iq5a5+xtFosgyiCezQa2cZQ
   7Nz/FUH81BpKPC/Wa28JAJ57M+HHswvV4MpKPsWhkDlC72U2NMJben9Lq
   b9WyuahyxuDhuhdYwdhYTwiB4Sy87lOd6Vzn7FjHzBv/NKwy73h/haIeT
   A==;
X-CSE-ConnectionGUID: 8alFnewEQj2mKVpH+WZinw==
X-CSE-MsgGUID: IhIbu6t2SUSdj4qlswQUeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17015412"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="17015412"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 22:05:07 -0700
X-CSE-ConnectionGUID: 8OkNKwaORMmjCU+Al0PHbg==
X-CSE-MsgGUID: R0CmOsMOSESII8mzh834tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="51071953"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 02 Jul 2024 22:05:05 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOsAw-000PIw-28;
	Wed, 03 Jul 2024 05:05:02 +0000
Date: Wed, 3 Jul 2024 13:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH V2 07/12] i2c: tegra: config settings for interface
 timings
Message-ID: <202407031225.dUci8Dg8-lkp@intel.com>
References: <20240701151231.29425-8-kyarlagadda@nvidia.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701151231.29425-8-kyarlagadda@nvidia.com>

Hi Krishna,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tegra/for-next]
[also build test ERROR on robh/for-next andi-shyti/i2c/i2c-host linus/master v6.10-rc6 next-20240702]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Yarlagadda/Documentation-Introduce-config-settings-framework/20240701-235313
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20240701151231.29425-8-kyarlagadda%40nvidia.com
patch subject: [RFC PATCH V2 07/12] i2c: tegra: config settings for interface timings
config: arm-randconfig-001-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031225.dUci8Dg8-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031225.dUci8Dg8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031225.dUci8Dg8-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mtk-cmdq-helper.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/da9121-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/tps6286x-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/8250/8250_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/8250/8250_pxa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/esp32_uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/esp32_acm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/serial_mctrl_gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/omap-rng.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/hw_random/omap3-rom-rng.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-slimbus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-w1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-sccb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/fastrpc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/open-dice.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/ssbi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-altera-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-omap2-mcspi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-qup.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/core/usbcore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/host/ohci-exynos.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/host/xhci-pci-renesas.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/class/usbtmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/isight_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/yurex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/vivaldi-fmap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-goldfish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-omap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/i2c/uda1342.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/uvc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/radio/si470x/radio-si470x-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/blink/leds-bcm63138.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds-rt4505.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/coreboot_table.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/framebuffer-coreboot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/cbmem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/xilinx/zynqmp-aes-gcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/atmel-sha204a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-bigbenff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-google-stadiaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-letsketch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-maltron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-megaworld.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ntrig.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-razer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-samsung.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sony.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steelseries.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tmff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-topseed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-uclogic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/of/of_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/fbtft/fbtft.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/fsl_imx8_ddr_perf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem-apple-efuses.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/brcm_u-boot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/xilinx-ams.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
>> ERROR: modpost: "tegra_cfg_get" [drivers/i2c/busses/i2c-tegra.ko] undefined!
>> ERROR: modpost: "tegra_cfg_get_by_name" [drivers/i2c/busses/i2c-tegra.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
