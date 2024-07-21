Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989CB20E6;
	Sun, 21 Jul 2024 03:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721531528; cv=none; b=tc7pbMnfl+ywmbSX0Ac6oda6Ze+igLop70fYsqH1gpXjDdXpxskTyDMbBJcLFIH+fZYVwjdCguSil0MwxqmMqnlDPUV33wkEfUeCvRAuN3rUI2dpodiXDjj9BL7KN0/Xq8Utx6eC8x8V9RhebjQ9+FJ9eSmh/zlKoSvFXzyiu24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721531528; c=relaxed/simple;
	bh=qkjac/UK/F2GUPU8bVxhzHT81pY4zydY+DRAqHRMltc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EOFfuj7lk76MvZB8fg+TF1uHepcAQrkhDyYcFvxB0DH6KO2mvj2qCju5cj36uorPiGgxuHpgk9enHIR0gdxhPc/QhUsSsZ2Kw39Llq8r/ZKfs0gL4vww7ywcTpovPuen0FcFqKSlRZPxZCcN9ZLop4w4wxt5Nb0h7sh5V8F0KA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ecB6ZZx1; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ecB6ZZx1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721531526; x=1753067526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkjac/UK/F2GUPU8bVxhzHT81pY4zydY+DRAqHRMltc=;
  b=ecB6ZZx1gxWctTGrfvHG5NC5UQXucyfcA0TBpZcTZ9oXrd1oRardyLxq
   1DMDLboP5B6+aa/McjU4fh4uqtiNmuwniDlLWCbic4HMU/cjSU5yCyotB
   MDGUSkrmW8k+DM9lcsJoHB8AHcgiSRIa1m2x+KNPaIOz7Qj84cUmhXajC
   /xTkDMTMrWbNDbbPrwg9CBmwAUCjrTFkYBGt/47GM6cIvhC/1mPR8HkUG
   jITV6P3aJDBswJFjHgCOUxDPyDg6K3axeo3RB9VVhocfxxg9v9rJq0GQz
   0FCpWlf3xUyt+qxWgrj9WCduDWkcmez9wnXq+E9qBzKBNVQuolKM2p2Gs
   g==;
X-CSE-ConnectionGUID: SsMhACZYToCBD7XhEA4tog==
X-CSE-MsgGUID: fqRPOt1YS1K6XN4orcwuOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="22987058"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="22987058"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 20:12:03 -0700
X-CSE-ConnectionGUID: +GctZFICQ7mwsq8re91r3A==
X-CSE-MsgGUID: Q6C3XFbATbmxoJ2XoaftMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51402850"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jul 2024 20:12:02 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVMzQ-000jss-1L;
	Sun, 21 Jul 2024 03:12:00 +0000
Date: Sun, 21 Jul 2024 11:11:23 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:kvm/protected-guest 3/6] ERROR: modpost:
 "set_memory_decrypted" [drivers/hv/hv_vmbus.ko] undefined!
Message-ID: <202407211149.MSdmVXGY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git kvm/protected-guest
head:   f3aede5d1e5508c88894afa5111eec1be4fbf183
commit: 23afa5abaab9773ab812a68e9fa457ff6151914a [3/6] arm64: mm: Add top-level dispatcher for internal mem_encrypt API
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240721/202407211149.MSdmVXGY-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240721/202407211149.MSdmVXGY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407211149.MSdmVXGY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-bootrom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-spilib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-light.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-log.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-loopback.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-power-supply.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-raw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-vibrator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-audio-manager.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-gbphy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-i2c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-pwm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-sdio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/staging/greybus/gb-usb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/goldfish/goldfish_pipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/chrome/cros_kunit_proto_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mailbox/mtk-cmdq-mailbox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm-ccn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/fsl_imx8_ddr_perf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/hisilicon/hisi_uncore_pmu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/marvell_cn10k_ddr_pmu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/arm_cspmu_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/nvidia_cspmu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm_cspmu/ampere_cspmu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/cxl_pmu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem-apple-efuses.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_brcm_nvram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_u-boot-env.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mm-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mq-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mn-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/imx/imx8mp-interconnect.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/qcom/interconnect_qcom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/interconnect/qcom/icc-rpmh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hte/hte-tegra194-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/vdpa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vdpa/ifcvf/ifcvf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/libnvdimm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_pmem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_btt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/of_pmem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvdimm/nd_virtio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/brcm_u-boot.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/parsers/tplink_safeloader.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_util.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/chips/cfi_cmdset_0020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mtd/maps/map_funcs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-controller.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/spmi-pmic-arb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_cif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_aec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_netx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_mf624.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_socket.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/i82092.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/mr75203.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/edac/layerscape_edac_mod.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/vhost/vringh.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rpmsg/rpmsg_char.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/ingenic-adc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/xilinx-ams.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/siox/siox-bus-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/counter/ftm-quaddec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mtty.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-fb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mbochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/bytestream-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/dma-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/inttype-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kfifo/record-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kobject-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kset-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kprobes/kretprobe_example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kmemleak/kmemleak-test.o
>> ERROR: modpost: "set_memory_decrypted" [drivers/hv/hv_vmbus.ko] undefined!
>> ERROR: modpost: "set_memory_encrypted" [drivers/hv/hv_vmbus.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
