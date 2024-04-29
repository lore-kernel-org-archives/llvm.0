Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB62D530;
	Mon, 29 Apr 2024 06:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714373196; cv=none; b=diCuYQdszw/uC84lTQW0HubU/wr9S81lDYOP7H8kzOEk//Ozaq4Jwi3Da6NP3nPe5LTpNYt0NqOnb+tRHLtCsQPMrXmvfQ4zW3rwscX4w/K1Z3uIh/51Z3DgWqTFf+ixTX738uevxOarmMdW2x28/4OVvYOnyG+EuKI2XYok408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714373196; c=relaxed/simple;
	bh=lvB5WD0/tm11VhioeI9XUhcE9iOeorssnfWj6Bi+rdo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ik2rjANquK+QlH9AfFiiZYz8ZskTd7IjK7N3LZd0nu/BFprbU+i6ocz7jHx220XYhBPS2afYQGSfg8GMgw5D4ruZrptSCrIYaChAXpN3erc/8HhKdVMejI7SqTRyKUMFtKFqO0VJYVgymKWQg6zknYm8DCme8FQwWpJAedYyzjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jApWLvJu; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jApWLvJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714373194; x=1745909194;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lvB5WD0/tm11VhioeI9XUhcE9iOeorssnfWj6Bi+rdo=;
  b=jApWLvJukDsh89UZB/dCDedzW9xptguIA9Jb6hZysVfwfKb67dOpYBbt
   6xr0/coWNzi+fAZ7neZhBxRTvyMv+6YflP/+gyGsztlQd0Mt/2pFSYYY9
   w2gukAlIf92oKViTnCGQ+7c06mOsKhLyQyJ0SQN0JB2lk/dS3LzExOZ6B
   i0kQfDP8D5pm/xbpTH2Hl+lMsfKJKjyFkNE2RI86W2s2FdVj+WxaE/nV/
   6v4fS83Fd7bs0diRA8ssRmwnL9YPhChOfV10iSXsejFYEiwaN6GdkIxbZ
   WZzaykMOEwQ1GWYpeRQfN7p4go0DJp2na0A1P/i6F+lnCKfO2ZOdRyXok
   w==;
X-CSE-ConnectionGUID: +DBUyW6yTDuPdg56fGL90Q==
X-CSE-MsgGUID: o5DYKdlHTN60hnqpjTAM9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9875495"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9875495"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 23:46:33 -0700
X-CSE-ConnectionGUID: y7Ho0e+rRaWMCaN2wf8bRA==
X-CSE-MsgGUID: rVbdlG4ZRy6DTFKNPwABaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="56908252"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Apr 2024 23:46:31 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1KmS-00070q-2C;
	Mon, 29 Apr 2024 06:46:28 +0000
Date: Mon, 29 Apr 2024 14:46:17 +0800
From: kernel test robot <lkp@intel.com>
To: Piyush Mehta <piyush.mehta@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 643/992] ERROR: modpost:
 "ulpi_write" [drivers/usb/dwc3/dwc3.ko] undefined!
Message-ID: <202404291434.T9s0VUQ1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   2de012957c3555b5d1f46cdd63729f43b9bb4514
commit: aca8761729017fb7d788d9c07e6c50b169b425f6 [643/992] usb: dwc3: core: Add support for disabling vbus when suspended
config: i386-randconfig-006-20240429 (https://download.01.org/0day-ci/archive/20240429/202404291434.T9s0VUQ1-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291434.T9s0VUQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291434.T9s0VUQ1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-terratec-slim.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-tevii-nec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-total-media-in-hand-02.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-total-media-in-hand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-trekstor.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-tt-1500.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-twinhan1027.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-twinhan-dtv-cab-ci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-vega-s9x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-m1f.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-s350.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videomate-tv-pvr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-videostrong-kii-pro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-wetek-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-wetek-play2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-winfast.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-winfast-usbii-deluxe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-x96max.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-xbox-360.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-xbox-dvd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-zx-irdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/asus_atk0110.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/simatic-ipc-wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/of_mmc_spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/sdio_uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds-gpio-f7188x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firmware/google/gsmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-bigbenff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-chicony.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-kbd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-holtek-mouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-letsketch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lg-g15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-dj.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-logitech-hidpp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-megaworld.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-microsoft.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-monterey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ntrig.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-retrode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sjoy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-speedlink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-steam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-topseed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-twinhan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zpff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-waltop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-spilib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-log.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-loopback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-power-supply.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-vibrator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/classmate-laptop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/firmware_attributes_class.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/goldfish/goldfish_pipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_netx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/i82092.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/video/fbdev.o
>> ERROR: modpost: "ulpi_write" [drivers/usb/dwc3/dwc3.ko] undefined!
ERROR: modpost: module uio uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
ERROR: modpost: module uio uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
ERROR: modpost: module uio uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
ERROR: modpost: module uio uses symbol dma_buf_unmap_attachment from namespace DMA_BUF, but does not import it.
ERROR: modpost: module uio uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.
ERROR: modpost: module uio uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
