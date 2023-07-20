Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3CB171A9;
	Thu, 20 Jul 2023 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689863317; x=1721399317;
  h=date:from:cc:subject:message-id:mime-version;
  bh=IjHk/bZnC7XkI6uaubavgD/rCBnDvBM9nDDALejCgy8=;
  b=kPNkC+SiKC/7no9DKNDetp1FRr8hz+OW9xpyh1oQsGNuRFu/W75Sl70v
   gZQFBmav+J1TXWIBvamnAQV2gPxA927iQTqaECHNxcJOt+G9X6c0u3cRV
   K3L2T6kqq5pWyQcaKZyjB6tDphDo1zBEZADp0/6xARXWvRBIjy/ebcr4Z
   sndCS0tagJJ2/hNLX4XFsMwheV+7hF/MNJ1xqHGWsgzvMK/ch/eOjfodN
   TpMp3Pwh9oh/WwPqZi9+c4DJUJhnkr6V5EGABw+BGL0foOUkTmR4S13Qm
   usfEZR0c4UjAY1r25IxR82t4+CELZwgRvRpfMXO+6IKyEnO0Ag1JQoa2M
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="397632889"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="397632889"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2023 07:28:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="898300505"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; 
   d="scan'208";a="898300505"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Jul 2023 07:28:31 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMUdZ-00069d-0q;
	Thu, 20 Jul 2023 14:28:22 +0000
Date: Thu, 20 Jul 2023 22:27:13 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: error: unknown target CPU 'r5000'
Message-ID: <202307202251.6Bm85qFP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Paul Cercueil <paul@crapouillou.net>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Paul,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bfa3037d828050896ae52f6467b6ca2489ae6fb1
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
date:   2 years, 10 months ago
config: mips-randconfig-r006-20230720 (https://download.01.org/0day-ci/archive/20230720/202307202251.6Bm85qFP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307202251.6Bm85qFP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307202251.6Bm85qFP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: unknown target CPU 'r5000'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
>> error: unknown target CPU 'r5000'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1 shuffle=952842252
>> error: unknown target CPU 'r5000'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:283: scripts/mod/empty.o] Error 1 shuffle=952842252
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1202: prepare0] Error 2 shuffle=952842252
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2 shuffle=952842252
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
