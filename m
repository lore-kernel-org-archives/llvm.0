Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D9D1CD25;
	Sun, 23 Jun 2024 14:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719153781; cv=none; b=ecGFUfsOLL/N+knRqgMATEYA4xIAZcXmKFaQNIGYYkC6aw/IBKEO1w4P3Zw6Sop7leX/vEqZZWs/TUpCWsXjK7jEb/dASHPllYGzGMdJmNWJzl+737jJk9eH57p8/I2V1c8rzWksV5WFAh/5UwB69ES0AgvwGmV5q95GDBF6v+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719153781; c=relaxed/simple;
	bh=34nDTh4c+rycjUNr64PVy/ygxh9pjwR1JJ9FaW0YwC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=clNVPyM0wgUYZNk2wIyNjaAijY0REn2D4Qb2kGb8rC2sG7r1VIgXvvdN1B9Kpt+Tpfr7OfbtYIxbs9DXusO59kLg6xGTnhreHVzXC2yPMjerHBCaoZBGDzqw0qIj33Z7HrXNCrLkh6FrcZ3868XKZc6th9yi1LFtitpIvRWpfjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmEw1XHD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmEw1XHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719153779; x=1750689779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=34nDTh4c+rycjUNr64PVy/ygxh9pjwR1JJ9FaW0YwC0=;
  b=kmEw1XHDr1Pddn7XVXq4VIkV/SimeOqn7a2NEZn3Q40DwHd/hgngdOWR
   AxnTdPZZC+zecf7R9/824TWtP/gTym8MItH7SpUBQ1YCHpd0xUbelonVM
   vuoRrE/VH07i7+VRyK+pjl/o1ms7NAFH0EAiLksrYTB9W00rm1AdycziU
   eeTYIX7wPHGaLLLif//qZs9+X9w/qCT+Vgh2w4FPnMdKNSvyvKldaST+7
   imdeMNLYC3yy7AUMjEAcf17L+LyejzBr7bDD9P7CfP+TkeyQkYwtqfGcW
   9s0i2ppSi7n82JYDgpxgGFs707qOnCSYz33MZ3AhpmB4b3Bb7Q9APL05X
   w==;
X-CSE-ConnectionGUID: uHkr9foiSeubZYUhsjAhOA==
X-CSE-MsgGUID: KN7ZZLLtTMi5nacuGctfTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="16006142"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="16006142"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 07:42:59 -0700
X-CSE-ConnectionGUID: mlPy7xWzTU2wbcwgfHjamA==
X-CSE-MsgGUID: OkIit29LToiV5QNOuboBKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="47421761"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jun 2024 07:42:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLOQh-000AZ4-15;
	Sun, 23 Jun 2024 14:42:55 +0000
Date: Sun, 23 Jun 2024 22:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:objtool-diff 6/6] WARNING: modpost:
 "__early_static_cpu_has" [arch/x86/kernel/cpu/mce/mce-inject.ko] undefined!
Message-ID: <202406232215.OyBzHpSL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-diff
head:   0f0cdc98e2240e0599117fb18be73d618e51ee8e
commit: 0f0cdc98e2240e0599117fb18be73d618e51ee8e [6/6] todo
config: i386-buildonly-randconfig-006-20240623 (https://download.01.org/0day-ci/archive/20240623/202406232215.OyBzHpSL-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406232215.OyBzHpSL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406232215.OyBzHpSL-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-mfgcfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8167-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-apmixedsys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-topckgen.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-infra_ao.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-mdp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-mfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-apmixedsys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-topckgen.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-peri_ao.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-infra_ao.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-mfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-vdo0.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-vdo1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-mfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-apusys_pll.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-vdo0.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8195-vdo1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-a64-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-a100-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun6i-rtc-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-a33-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-r-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun9i-a80-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun9i-a80-de-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun9i-a80-usb-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/clk-gate_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-qmgr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mtk-cmdq-helper.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/amlogic/meson-clk-measure.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/amlogic/meson-gx-pwrc-vpu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/hisilicon/hi6220_reset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/8250/8250_pxa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/owl-uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/ttynull.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/nvram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/tlclk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-abt-y030xx067a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-auo-a030jtn01.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-innolux-ej030na.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-newvision-nv3052c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sii9234.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ac97.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-slimbus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spi-avmm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-altera-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-fsl-lib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-controller.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/touchscreen/cyttsp_i2c_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-goldfish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-tps65910.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-qup.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/twl4030_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/of_mmc_spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds-rt4505.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/goldfish/goldfish_pipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmdq-mailbox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/fsl_imx8_ddr_perf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/arm_cspmu_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mq-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mn-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/core/snd-pcm-dmaengine.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-sigmadsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/codecs/snd-soc-wm-adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/qcom/snd-soc-qcom-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-intel-atom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-byt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/intel/snd-sof-acpi-intel-bdw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/snd-sof-imx8ulp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/imx/imx-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-utils.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-acpi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/soc/sof/snd-sof-of.o
WARNING: modpost: missing MODULE_DESCRIPTION() in sound/ac97_bus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mtty.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-fb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mbochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
>> WARNING: modpost: "__early_static_cpu_has" [arch/x86/kernel/cpu/mce/mce-inject.ko] undefined!
>> WARNING: modpost: "__early_static_cpu_has" [drivers/vfio/vfio_iommu_type1.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
