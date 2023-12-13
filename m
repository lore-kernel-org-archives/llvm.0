Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B82C5953B;
	Wed, 13 Dec 2023 17:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLoQ16C5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702490095; x=1734026095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MdEqJtzTuG2wFclZmzqoppjrMv+GE0+VBm5LXMJYO00=;
  b=WLoQ16C5v2FOR2P6dw2hEz8oHHz8CgJQXhOcW0dQiDHy1HECJPhd+lfs
   15imD1+LWksWVZXHKEpCWcnB2ebCNCGujtvBV1nE6vSSxmi6FHHcU2xD0
   VREV9aTxdo4oGk49J2OzC4PRD0wtXd7bAezYHhCqd1cCZjjjEsR4BaPOq
   aLznde3aZDFbOjhwKU+Zb4A7PIq72V0/xLThbFBS1dPsaQq7jBgSegkyk
   I7rRkb2GLwhHA/VG+sJatK0Arkn+//0LLuxPbMtVqY3Nu0c5iPY0Mor0d
   +LcmduUqkfno/mFEpV60TsTYrA9S6YHybwtRzgBu91WJr5jtGcAWnmQKf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="459319156"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="459319156"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 09:54:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="844403004"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="844403004"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Dec 2023 09:54:53 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDTRa-000KyR-18;
	Wed, 13 Dec 2023 17:54:50 +0000
Date: Thu, 14 Dec 2023 01:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-lib 38/80] arch/mips/include/asm/cmpxchg.h:83:11:
 error: call to '__xchg_called_with_bad_pointer' declared with 'error'
 attribute: Bad argument size for xchg
Message-ID: <202312140146.kxOIs24Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-lib
head:   0e2ac5291cc1c3c45e5ee784357b3f51b611195f
commit: 398fc1b7e26f5161324f78959fb43673eb18e4d7 [38/80] afs: Overhaul invalidation handling to better support RO volumes
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20231214/202312140146.kxOIs24Y-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140146.kxOIs24Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140146.kxOIs24Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/afs/callback.c:17:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/mips/include/asm/timex.h:19:
   In file included from arch/mips/include/asm/cpu-type.h:12:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:13:
   In file included from include/linux/atomic.h:7:
   In file included from arch/mips/include/asm/atomic.h:23:
>> arch/mips/include/asm/cmpxchg.h:83:11: error: call to '__xchg_called_with_bad_pointer' declared with 'error' attribute: Bad argument size for xchg
                           return __xchg_called_with_bad_pointer();
                                  ^
   1 error generated.


vim +83 arch/mips/include/asm/cmpxchg.h

5154f3b4194910 Paul Burton         2017-06-09  66  
b70eb30056dc84 Paul Burton         2017-06-09  67  extern unsigned long __xchg_small(volatile void *ptr, unsigned long val,
b70eb30056dc84 Paul Burton         2017-06-09  68  				  unsigned int size);
b70eb30056dc84 Paul Burton         2017-06-09  69  
46f1619500d022 Thomas Bogendoerfer 2019-10-09  70  static __always_inline
068550631fbe0b Andrzej Hajda       2023-01-18  71  unsigned long __arch_xchg(volatile void *ptr, unsigned long x, int size)
b81947c646bfef David Howells       2012-03-28  72  {
b81947c646bfef David Howells       2012-03-28  73  	switch (size) {
b70eb30056dc84 Paul Burton         2017-06-09  74  	case 1:
b70eb30056dc84 Paul Burton         2017-06-09  75  	case 2:
b70eb30056dc84 Paul Burton         2017-06-09  76  		return __xchg_small(ptr, x, size);
b70eb30056dc84 Paul Burton         2017-06-09  77  
b81947c646bfef David Howells       2012-03-28  78  	case 4:
62c6081dca75d6 Paul Burton         2017-06-09  79  		return __xchg_asm("ll", "sc", (volatile u32 *)ptr, x);
62c6081dca75d6 Paul Burton         2017-06-09  80  
b81947c646bfef David Howells       2012-03-28  81  	case 8:
62c6081dca75d6 Paul Burton         2017-06-09  82  		if (!IS_ENABLED(CONFIG_64BIT))
62c6081dca75d6 Paul Burton         2017-06-09 @83  			return __xchg_called_with_bad_pointer();
62c6081dca75d6 Paul Burton         2017-06-09  84  
62c6081dca75d6 Paul Burton         2017-06-09  85  		return __xchg_asm("lld", "scd", (volatile u64 *)ptr, x);
62c6081dca75d6 Paul Burton         2017-06-09  86  
d15dc68c1143e2 Paul Burton         2017-06-09  87  	default:
d15dc68c1143e2 Paul Burton         2017-06-09  88  		return __xchg_called_with_bad_pointer();
b81947c646bfef David Howells       2012-03-28  89  	}
b81947c646bfef David Howells       2012-03-28  90  }
b81947c646bfef David Howells       2012-03-28  91  

:::::: The code at line 83 was first introduced by commit
:::::: 62c6081dca75d6bec1198ed5a1ae50968b323a8c MIPS: cmpxchg: Drop __xchg_u{32,64} functions

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
