Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C15369;
	Sun, 30 Jul 2023 11:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690716107; x=1722252107;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ObR6JzKrAxIQbiL2j7UMR6a22efiB/GVYK6zIj5Nrp0=;
  b=cSkUNwHzZgk0W8qMWmyUoJf/bLx96dek7ErYrAOz9AZKd0UwH/ppXw2C
   slc8uV0hr7aql7dTHejkfmyGtZ7M+XEUmD7W29vCW7oBSdveZuDQy8loO
   lBPqPgE9kCtqhs8wXVDhaWRDEnM29VBaZtFna6Fr/xbSt30SYwKpi8CtD
   DPh78BuZPMpZfsFDIHpU9CbdXbErJ8JVy+25/yy0h4Y2gs4BYJYT/Auq2
   nBp5tIfNU7CceQcT2sro9/RKFRA6bA5kLx3YKl3ZbvToIaIxXrpVSo1J0
   cmln3wEsC2dvwFxNyNt5cOk2I2BKZtS/oIVHcR0hxNabyCoQI/BtQ7uEn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="358870995"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="358870995"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 04:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10786"; a="793408603"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="793408603"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 30 Jul 2023 04:21:45 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQ4Ub-0004Z1-0F;
	Sun, 30 Jul 2023 11:21:45 +0000
Date: Sun, 30 Jul 2023 19:21:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: clang: error: unsupported option '-fsanitize=thread' for target
 'powerpc-unknown-linux-gnu'
Message-ID: <202307301929.fDdnJJob-lkp@intel.com>
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
head:   d31e3792919e5c97d572c8a27a5a7c1eb9de5aca
commit: 95567f46b4d20c047750a5e3029461afcdc67697 powerpc/{32,book3e}: kcsan: Extend KCSAN Support
date:   7 weeks ago
config: powerpc-randconfig-r005-20230730 (https://download.01.org/0day-ci/archive/20230730/202307301929.fDdnJJob-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307301929.fDdnJJob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307301929.fDdnJJob-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
>> clang: error: unsupported option '-fsanitize=thread' for target 'powerpc-unknown-linux-gnu'
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1 shuffle=1218860924
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1218860924
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2 shuffle=1218860924
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2 shuffle=1218860924
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
