Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A6A10E4;
	Sun, 28 Jan 2024 01:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706405356; cv=none; b=E2IELnToEtBaFhwe+dEO+WUIW0I3KLkDWDidkHzVBd7cYDpOCtU7xoMeHcsz6V9SKNIqX9zo7UA/iamzWUqd0jh9zKlK2az8l169F6LuhvJO92K1LWgJYNhxz8kL53/mdLfTUfBWdEmGLrNhy3Su9Z4Nauu4Ro0OPI9hhsq0Ucs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706405356; c=relaxed/simple;
	bh=tG3KZpkmzEnoPewvoU1tDdnDLsXIb/NFenmlioDoIDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nE6SdaXLPVOIEsJyki19ADZF0BwYVhvZPOfK6VxCWPmqrFvjYq/y8A6COX6njsQmjPFZwiVpPDjV5ThZhd0pFSfM8WCotd7/8V3MltD0BxQ0YtDUXJxzhqTa3fTAArnihRqQ7MwlXXs72NXHBq+CBmIloB6fL9iK+x0iLaQmzuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cis0MmOe; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cis0MmOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706405353; x=1737941353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tG3KZpkmzEnoPewvoU1tDdnDLsXIb/NFenmlioDoIDw=;
  b=cis0MmOeK1peXshntSJEAhODAEA7lBvFXATc8lD0tJBHIEtAbB45MOzd
   3WrVNp8LudCErd4q7W2iWeEBjPlmx74xfSGivxQmDVDixlNBxr86zA/Mi
   zokfK1VtNBSvaHtC74MXkehAoAjQ0AZjHnv+qeP2Dsw9PhQsxgY+60hSn
   qOcSFNr7DhK+0i96HjCsTuD4wcXg7gGPnjiJuSFs8Ql8jOaOdQXoTa3Qa
   4qr8osG4lVIHzWe3pbZCs7RUwTHXIQD4LCINEQRJN3Nw4KWvk7ct9Go3K
   VXW0fJpBQumSngyu3Zh46+l8fv3fp39faJKk73uE7xpInHkfHe0Zb15LB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="393159576"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="393159576"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 17:29:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="787468091"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="787468091"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 27 Jan 2024 17:29:09 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTtyt-0002xA-1e;
	Sun, 28 Jan 2024 01:29:07 +0000
Date: Sun, 28 Jan 2024 09:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Jonathan Bell <jonathan@raspberrypi.com>
Subject: [jmondi:jmondi/rpi5-be-upstream/libcamera 5/131]
 include/linux/of.h:1556:34: error: use of undeclared identifier
 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
Message-ID: <202401280959.OxsMCRk7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jmondi/linux.git jmondi/rpi5-be-upstream/libcamera
head:   a7bec0179c6915e1140ede4bd0ceae507b80112e
commit: 56623a64942003da747bb9a624c9a3d0f83fabb7 [5/131] mmc: brcmstb: add support for BCM2712
config: i386-buildonly-randconfig-005-20240128 (https://download.01.org/0day-ci/archive/20240128/202401280959.OxsMCRk7-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280959.OxsMCRk7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280959.OxsMCRk7-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-bcm2835.c:26:
>> include/linux/of.h:1556:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1556 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1531:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1531 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1562:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1562 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1531:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1531 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1568:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1568 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1574:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1574 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1580:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1580 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^
   5 errors generated.
--
   In file included from drivers/spi/spi-meson-spifc.c:14:
>> include/linux/of.h:1556:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1556 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1531:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1531 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1562:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1562 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1531:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1531 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1568:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1568 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1574:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1574 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1580:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1580 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^
   In file included from drivers/spi/spi-meson-spifc.c:18:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-meson-spifc.c:18:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-meson-spifc.c:18:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-meson-spifc.c:18:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-meson-spifc.c:18:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-meson-spifc.c:18:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/spi/spi-meson-spifc.c:18:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1095:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
--
   In file included from drivers/spi/spi.c:24:
   In file included from include/linux/of_device.h:8:
>> include/linux/of.h:1556:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1556 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1531:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1531 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1562:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1562 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1531:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1531 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1568:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1568 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1574:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1574 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1580:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1580 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^
>> drivers/spi/spi.c:4675:9: error: call to undeclared function 'of_register_spi_device'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4675 |                 spi = of_register_spi_device(ctlr, rd->dn);
         |                       ^
   drivers/spi/spi.c:4675:9: note: did you mean 'of_register_spi_devices'?
   drivers/spi/spi.c:2522:13: note: 'of_register_spi_devices' declared here
    2522 | static void of_register_spi_devices(struct spi_controller *ctlr) { }
         |             ^
>> drivers/spi/spi.c:4675:7: error: incompatible integer to pointer conversion assigning to 'struct spi_device *' from 'int' [-Wint-conversion]
    4675 |                 spi = of_register_spi_device(ctlr, rd->dn);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 errors generated.
--
   In file included from drivers/irqchip/irq-ingenic-tcu.c:9:
   In file included from include/linux/irqchip.h:16:
>> include/linux/of.h:1556:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1556 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1531:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1531 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1562:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1562 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1531:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1531 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1568:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1568 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1574:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1574 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1580:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1580 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^
>> drivers/irqchip/irq-ingenic-tcu.c:135:21: warning: shift count >= width of type [-Wshift-count-overflow]
     135 |         gc->wake_enabled = IRQ_MSK(32);
         |                            ^~~~~~~~~~~
   include/linux/irq.h:1188:41: note: expanded from macro 'IRQ_MSK'
    1188 | #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
         |                                         ^  ~~~
   drivers/irqchip/irq-ingenic-tcu.c:147:39: warning: shift count >= width of type [-Wshift-count-overflow]
     147 |         regmap_write(tcu->map, TCU_REG_TMSR, IRQ_MSK(32));
         |                                              ^~~~~~~~~~~
   include/linux/irq.h:1188:41: note: expanded from macro 'IRQ_MSK'
    1188 | #define IRQ_MSK(n) (u32)((n) < 32 ? ((1 << (n)) - 1) : UINT_MAX)
         |                                         ^  ~~~
   2 warnings and 5 errors generated.
--
   In file included from drivers/net/ethernet/apm/xgene/xgene_enet_main.c:11:
   In file included from drivers/net/ethernet/apm/xgene/xgene_enet_main.h:18:
>> include/linux/of.h:1556:34: error: use of undeclared identifier 'OF_RECONFIG_ATTACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1556 |         return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1531:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1531 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1562:34: error: use of undeclared identifier 'OF_RECONFIG_DETACH_NODE'; did you mean 'OF_RECONFIG_NO_CHANGE'?
    1562 |         return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                                         OF_RECONFIG_NO_CHANGE
   include/linux/of.h:1531:2: note: 'OF_RECONFIG_NO_CHANGE' declared here
    1531 |         OF_RECONFIG_NO_CHANGE = 0,
         |         ^
>> include/linux/of.h:1568:34: error: use of undeclared identifier 'OF_RECONFIG_ADD_PROPERTY'
    1568 |         return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1574:34: error: use of undeclared identifier 'OF_RECONFIG_REMOVE_PROPERTY'
    1574 |         return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
         |                                         ^
>> include/linux/of.h:1580:34: error: use of undeclared identifier 'OF_RECONFIG_UPDATE_PROPERTY'
    1580 |         return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
         |                                         ^
   drivers/net/ethernet/apm/xgene/xgene_enet_main.c:2060:42: warning: shift count >= width of type [-Wshift-count-overflow]
    2060 |         ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
         |                                                 ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
      77 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 5 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for OF_DYNAMIC
   Depends on [n]: OF [=n]
   Selected by [m]:
   - MMC_SDHCI_BRCMSTB [=m] && MMC [=m] && (ARCH_BRCMSTB || BMIPS_GENERIC || COMPILE_TEST [=y]) && MMC_SDHCI_PLTFM [=m]


vim +1556 include/linux/of.h

201c910bd6898d Pantelis Antoniou 2014-07-04  1529  
b53a2340d0d304 Pantelis Antoniou 2014-10-28  1530  enum of_reconfig_change {
b53a2340d0d304 Pantelis Antoniou 2014-10-28 @1531  	OF_RECONFIG_NO_CHANGE = 0,
b53a2340d0d304 Pantelis Antoniou 2014-10-28  1532  	OF_RECONFIG_CHANGE_ADD,
b53a2340d0d304 Pantelis Antoniou 2014-10-28  1533  	OF_RECONFIG_CHANGE_REMOVE,
b53a2340d0d304 Pantelis Antoniou 2014-10-28  1534  };
b53a2340d0d304 Pantelis Antoniou 2014-10-28  1535  
2e8fff668dc14e Rob Herring       2023-03-29  1536  struct notifier_block;
2e8fff668dc14e Rob Herring       2023-03-29  1537  
201c910bd6898d Pantelis Antoniou 2014-07-04  1538  #ifdef CONFIG_OF_DYNAMIC
f6892d193fb9d6 Grant Likely      2014-11-21  1539  extern int of_reconfig_notifier_register(struct notifier_block *);
f6892d193fb9d6 Grant Likely      2014-11-21  1540  extern int of_reconfig_notifier_unregister(struct notifier_block *);
f5242e5a883bf1 Grant Likely      2014-11-24  1541  extern int of_reconfig_notify(unsigned long, struct of_reconfig_data *rd);
f5242e5a883bf1 Grant Likely      2014-11-24  1542  extern int of_reconfig_get_state_change(unsigned long action,
f5242e5a883bf1 Grant Likely      2014-11-24  1543  					struct of_reconfig_data *arg);
f6892d193fb9d6 Grant Likely      2014-11-21  1544  
201c910bd6898d Pantelis Antoniou 2014-07-04  1545  extern void of_changeset_init(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1546  extern void of_changeset_destroy(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1547  extern int of_changeset_apply(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1548  extern int of_changeset_revert(struct of_changeset *ocs);
201c910bd6898d Pantelis Antoniou 2014-07-04  1549  extern int of_changeset_action(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1550  		unsigned long action, struct device_node *np,
201c910bd6898d Pantelis Antoniou 2014-07-04  1551  		struct property *prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1552  
201c910bd6898d Pantelis Antoniou 2014-07-04  1553  static inline int of_changeset_attach_node(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1554  		struct device_node *np)
201c910bd6898d Pantelis Antoniou 2014-07-04  1555  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1556  	return of_changeset_action(ocs, OF_RECONFIG_ATTACH_NODE, np, NULL);
201c910bd6898d Pantelis Antoniou 2014-07-04  1557  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1558  
201c910bd6898d Pantelis Antoniou 2014-07-04  1559  static inline int of_changeset_detach_node(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1560  		struct device_node *np)
201c910bd6898d Pantelis Antoniou 2014-07-04  1561  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1562  	return of_changeset_action(ocs, OF_RECONFIG_DETACH_NODE, np, NULL);
201c910bd6898d Pantelis Antoniou 2014-07-04  1563  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1564  
201c910bd6898d Pantelis Antoniou 2014-07-04  1565  static inline int of_changeset_add_property(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1566  		struct device_node *np, struct property *prop)
201c910bd6898d Pantelis Antoniou 2014-07-04  1567  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1568  	return of_changeset_action(ocs, OF_RECONFIG_ADD_PROPERTY, np, prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1569  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1570  
201c910bd6898d Pantelis Antoniou 2014-07-04  1571  static inline int of_changeset_remove_property(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1572  		struct device_node *np, struct property *prop)
201c910bd6898d Pantelis Antoniou 2014-07-04  1573  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1574  	return of_changeset_action(ocs, OF_RECONFIG_REMOVE_PROPERTY, np, prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1575  }
201c910bd6898d Pantelis Antoniou 2014-07-04  1576  
201c910bd6898d Pantelis Antoniou 2014-07-04  1577  static inline int of_changeset_update_property(struct of_changeset *ocs,
201c910bd6898d Pantelis Antoniou 2014-07-04  1578  		struct device_node *np, struct property *prop)
201c910bd6898d Pantelis Antoniou 2014-07-04  1579  {
201c910bd6898d Pantelis Antoniou 2014-07-04 @1580  	return of_changeset_action(ocs, OF_RECONFIG_UPDATE_PROPERTY, np, prop);
201c910bd6898d Pantelis Antoniou 2014-07-04  1581  }
b544fc2b8606d7 Lizhi Hou         2023-08-15  1582  

:::::: The code at line 1556 was first introduced by commit
:::::: 201c910bd6898d81d4ac6685d0f421b7e10f3c5d of: Transactional DT support.

:::::: TO: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
:::::: CC: Grant Likely <grant.likely@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
