Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9426D1E5B70;
	Mon, 30 Mar 2026 01:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774834762; cv=none; b=fL/oKmHsyHBl9mXjownLgjG/sp0UJh3uTSo27O1HoUt4Hkp15fex8w4Rkix1Yo0QszrFvvNfnu+IF01fw42SLzhni8MYnI96o8HTvYEypUOaNUTRHHrw15iK0uFIskH2vgcSRm0wSOmswZ683RHh8U4fOKhfnlxMlfOqAttlN2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774834762; c=relaxed/simple;
	bh=OiHc07jqT6NBebrPNnUK47uI2bHXQLJBH7hz79B2Vxk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TZcPTMU4yXKKOR9xvnarPocoUNpSNbEQMiUhCvFf7ve2G4xXNIs61tpf+HPIR88GTRKTavbSTIX8fPuKRfZrPAPC7Ko6cDpgRrh6UT1us71qPbrx+sKHoJWV8tu11ZmFI2wZ1M7iQAfjSlwDULCm05Z8iyMkQeSWuoQKsnjvYiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CyvY53eT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CyvY53eT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774834759; x=1806370759;
  h=date:from:to:cc:subject:message-id;
  bh=OiHc07jqT6NBebrPNnUK47uI2bHXQLJBH7hz79B2Vxk=;
  b=CyvY53eTaHWGMOK9aLq6dPwQ2D8L4mzaX5QSHb0fOnfJ1BBaH/uLeIUF
   p6E9vZDUjgXZTN4Xo2XvNE1xgxiJhUgQUkyoRuNX/l48cOYnRX2r53q6l
   YvoB46KstYbOdCI3kvjHi5nXQvZhpOtsuLjN+QTLfbsbouX9y2sfpL96v
   w8PgoTadEtht+5kcVQZKv7LyqV+3GtYBbVaGAMqfNHwa7XOXCMZGazKHV
   x1KAD/ds49g1ke/SIy2yGiAber2NA4sTYIsfwyeN4a7mDATO2Ke4qoDUS
   aEZkvLGDrZAuf6qmYPAaRVPTRcEOkcdxJ/x8oks4RzcFSWT/CZeZ/USNj
   g==;
X-CSE-ConnectionGUID: t+Ik3Au6SGujQIEV53c8Gg==
X-CSE-MsgGUID: kFhyE/NtQI66QEPGKnvhkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="74854566"
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="74854566"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 18:39:19 -0700
X-CSE-ConnectionGUID: /IOCknRDQkWusvQ6aTEdvA==
X-CSE-MsgGUID: JMFeebVlQr+xubG0tBLLog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,148,1770624000"; 
   d="scan'208";a="224923759"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Mar 2026 18:39:17 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w71b0-000000000Wh-0F9e;
	Mon, 30 Mar 2026 01:39:14 +0000
Date: Mon, 30 Mar 2026 09:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: Tiwei Bie <tiwei.btw@antgroup.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>
Subject: drivers/video/fbdev/aty/atyfb_base.c:2327:24: warning:
 variable 'fb_list' set but not used
Message-ID: <202603300931.osMYxYZ7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   11 months ago
config: um-randconfig-002-20260330 (https://download.01.org/0day-ci/archive/20260330/202603300931.osMYxYZ7-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 2cd67b8b69f78e3f95918204320c3075a74ba16c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603300931.osMYxYZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603300931.osMYxYZ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/video/fbdev/aty/atyfb_base.c:64:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/video/fbdev/aty/atyfb_base.c:64:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/video/fbdev/aty/atyfb_base.c:64:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/video/fbdev/aty/atyfb_base.c:2327:24: warning: variable 'fb_list' set but not used [-Wunused-but-set-global]
    2327 | static struct fb_info *fb_list = NULL;
         |                        ^
   13 warnings generated.


vim +/fb_list +2327 drivers/video/fbdev/aty/atyfb_base.c

^1da177e4c3f415 drivers/video/aty/atyfb_base.c Linus Torvalds 2005-04-16  2322  
^1da177e4c3f415 drivers/video/aty/atyfb_base.c Linus Torvalds 2005-04-16  2323  /*
^1da177e4c3f415 drivers/video/aty/atyfb_base.c Linus Torvalds 2005-04-16  2324   * Initialisation
^1da177e4c3f415 drivers/video/aty/atyfb_base.c Linus Torvalds 2005-04-16  2325   */
^1da177e4c3f415 drivers/video/aty/atyfb_base.c Linus Torvalds 2005-04-16  2326  
^1da177e4c3f415 drivers/video/aty/atyfb_base.c Linus Torvalds 2005-04-16 @2327  static struct fb_info *fb_list = NULL;
^1da177e4c3f415 drivers/video/aty/atyfb_base.c Linus Torvalds 2005-04-16  2328  

:::::: The code at line 2327 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
