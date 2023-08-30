Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B9C10EE;
	Wed, 30 Aug 2023 07:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693379380; x=1724915380;
  h=date:from:cc:subject:message-id:mime-version;
  bh=GXlqhCyGWINKGY0iarAcnbr0FNDZ3bcjSWPV7CxdAr4=;
  b=advEBVB1q24uKshG62lhutOFxLfrG7QZ4UBnpNN4mPUKZ488paCtjI+L
   PrQIusOKE2UOsCjpt6Mjckj1EJXLyw7kmEO2Y+Qlyqrbw62jRZi857t09
   awq40FBM8X3M0qbx75WFIADqRDNEXQdDenUkfC850pJ5UG+X29TCMxp3G
   flQWlJc8SsFUD0/xv2gZpEhBlAItIIvtePjdMy+F4Iieoh0KgOVByJO4b
   8134SWesJgsd/rfN7A9tWTWH9Qh0KwWDWaMKERCs+tnuxA6WJ5h6YhWmQ
   z5fK5i2qi1IfCePeUThGUwKA4G5FrYknCA/mmmphTYwwq4jGu+TGBBlI4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="375525369"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="375525369"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 00:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688784875"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="688784875"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 30 Aug 2023 00:09:03 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbFK2-0009Xr-2v;
	Wed, 30 Aug 2023 07:09:02 +0000
Date: Wed, 30 Aug 2023 15:08:08 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: clang-14: error: unsupported option '-fsanitize=thread' for target
 'powerpc-unknown-linux-gnu'
Message-ID: <202308301455.VM45FiiD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Rohan McLure <rmclure@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi Rohan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6c1b980a7e79e55e951b4b2c47eefebc75071209
commit: 95567f46b4d20c047750a5e3029461afcdc67697 powerpc/{32,book3e}: kcsan: Extend KCSAN Support
date:   3 months ago
config: powerpc-randconfig-r031-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301455.VM45FiiD-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301455.VM45FiiD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301455.VM45FiiD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang-14: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1 shuffle=3495563470
>> clang-14: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1 shuffle=3495563470
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2 shuffle=3495563470
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2 shuffle=3495563470
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
