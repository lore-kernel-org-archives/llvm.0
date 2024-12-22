Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9FE18732E;
	Sun, 22 Dec 2024 07:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734853124; cv=none; b=rEB8TrecQhSHkilU0YS89g0NiAxfEX3UKT8Utp9SSHtHs0BNb6IM+J99rRINPgO/J6IP059DGCNJN7NHLCqKyOXj4yEeIRv7Zatd1m9W+ZJA9yPjSQRqD08ZS1kcWy9AwZ+07cac2muyF+71Z8GHSvXND20DvVWBn6FrEluK3yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734853124; c=relaxed/simple;
	bh=9CSqFjdfcmPs0IAnHrFIW9rFa4v7bjtQzC8EB9Q7e6U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9/4YZ85qAS401o0jmHjsa56/+lCZsvzgrKpMK07LIhA5+uRr+JPxqa3KohcbLVMTcDSVrLkb1gN/jMRK2iOLReQ5HV77+PvkJCsuf/tEym4Ej9gfS4Tnwr4sVxfLgFLir9CQVuRXpV2B/2OnT1NCIGFkxF4M6wF3DHTqXdTHP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q1kwFiew; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q1kwFiew"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734853122; x=1766389122;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9CSqFjdfcmPs0IAnHrFIW9rFa4v7bjtQzC8EB9Q7e6U=;
  b=Q1kwFiewObwSKtt3DXcNTS01zmHGWxxcK0qau+aNQui0sAfCpAR5wMj0
   dZYLAnDh78Iv6gYszUqwAhC4lP5upOSfNhs/oLpYARhcXFDQKvZe1jZ/A
   2qAemz+EG89TanUOiYz47FoZBEqBguvedZekNEVQU0e2fpy4mSrmROGT3
   LyBgUZRgf+wFXaxB8TN1ohzjgCn7cZWqnyq+qWxZMshEcp0D8uXeBu7zc
   IPOM1uaQ3EFiD/iUtSWvv01t3fhoQchMjFtG4WqPmRwm4PTCo4uQ4Nn6h
   A2vyjKL20a1vgqivE0+CV7WmCy7m5H0GNjbRznJwaM1EGc4HWjXoyA0ey
   Q==;
X-CSE-ConnectionGUID: qDeYN6FLS2Ovl4vO2kXMGA==
X-CSE-MsgGUID: KwN5xgwoQEK3Pgtb9jieLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="22940008"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="22940008"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 23:38:37 -0800
X-CSE-ConnectionGUID: JwXWb0X/RFeRGVrV1wHscQ==
X-CSE-MsgGUID: wSDg2s2dRjqy7vluNL1uqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99135805"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2024 23:38:36 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPGXq-0002n3-1N;
	Sun, 22 Dec 2024 07:38:34 +0000
Date: Sun, 22 Dec 2024 15:38:16 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 11/26] kernel/unwind/user.c:48:6: warning: variable
 'ret' set but not used
Message-ID: <202412221511.KU6vXDRc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   3c5688da4922c1ff09b4973c69e7324950c7ef60
commit: 617841b73481f6f7435128fade47251a90e39d15 [11/26] unwind/x86: Enable user space compat mode frame pointers for x86
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20241222/202412221511.KU6vXDRc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221511.KU6vXDRc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221511.KU6vXDRc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/unwind/user.c:11:
   In file included from arch/x86/include/asm/unwind_user.h:7:
   In file included from arch/x86/include/asm/perf_event.h:545:
   In file included from arch/x86/include/asm/stacktrace.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/unwind/user.c:48:6: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
      48 |         int ret;
         |             ^
>> kernel/unwind/user.c:67:23: warning: variable '__ret' is uninitialized when used here [-Wuninitialized]
      67 |         if (frame->fp_off && UNWIND_GET_USER_LONG(fp, cfa + frame->fp_off, state))
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/unwind/user.c:40:2: note: expanded from macro 'UNWIND_GET_USER_LONG'
      40 |         __ret;                                                          \
         |         ^~~~~
   kernel/unwind/user.c:67:23: note: variable '__ret' is declared here
   kernel/unwind/user.c:35:2: note: expanded from macro 'UNWIND_GET_USER_LONG'
      35 |         int __ret;                                                      \
         |         ^
   kernel/unwind/user.c:64:6: warning: variable '__ret' is uninitialized when used here [-Wuninitialized]
      64 |         if (UNWIND_GET_USER_LONG(ra, cfa + frame->ra_off, state))
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/unwind/user.c:40:2: note: expanded from macro 'UNWIND_GET_USER_LONG'
      40 |         __ret;                                                          \
         |         ^~~~~
   kernel/unwind/user.c:64:6: note: variable '__ret' is declared here
   kernel/unwind/user.c:35:2: note: expanded from macro 'UNWIND_GET_USER_LONG'
      35 |         int __ret;                                                      \
         |         ^
   4 warnings generated.


vim +/ret +48 kernel/unwind/user.c

74615b99696506 Josh Poimboeuf 2024-12-21  42  
8be9b2c9faa1f9 Josh Poimboeuf 2024-12-21  43  int unwind_user_next(struct unwind_user_state *state)
8be9b2c9faa1f9 Josh Poimboeuf 2024-12-21  44  {
8be9b2c9faa1f9 Josh Poimboeuf 2024-12-21  45  	struct unwind_user_frame _frame;
8be9b2c9faa1f9 Josh Poimboeuf 2024-12-21  46  	struct unwind_user_frame *frame = &_frame;
8be9b2c9faa1f9 Josh Poimboeuf 2024-12-21  47  	unsigned long cfa = 0, fp, ra = 0;
8be9b2c9faa1f9 Josh Poimboeuf 2024-12-21 @48  	int ret;
8be9b2c9faa1f9 Josh Poimboeuf 2024-12-21  49  
6def01593a2222 Josh Poimboeuf 2024-12-21  50  	if (state->done)
6def01593a2222 Josh Poimboeuf 2024-12-21  51  		return -EINVAL;
6def01593a2222 Josh Poimboeuf 2024-12-21  52  
74615b99696506 Josh Poimboeuf 2024-12-21  53  	if (compat_state(state))
74615b99696506 Josh Poimboeuf 2024-12-21  54  		frame = &compat_fp_frame;
74615b99696506 Josh Poimboeuf 2024-12-21  55  	else if (fp_state(state))
6def01593a2222 Josh Poimboeuf 2024-12-21  56  		frame = &fp_frame;
6def01593a2222 Josh Poimboeuf 2024-12-21  57  	else
6def01593a2222 Josh Poimboeuf 2024-12-21  58  		goto the_end;
6def01593a2222 Josh Poimboeuf 2024-12-21  59  
6def01593a2222 Josh Poimboeuf 2024-12-21  60  	cfa = (frame->use_fp ? state->fp : state->sp) + frame->cfa_off;
6def01593a2222 Josh Poimboeuf 2024-12-21  61  	if (cfa <= state->sp)
6def01593a2222 Josh Poimboeuf 2024-12-21  62  		goto the_end;
6def01593a2222 Josh Poimboeuf 2024-12-21  63  
74615b99696506 Josh Poimboeuf 2024-12-21  64  	if (UNWIND_GET_USER_LONG(ra, cfa + frame->ra_off, state))
6def01593a2222 Josh Poimboeuf 2024-12-21  65  		goto the_end;
6def01593a2222 Josh Poimboeuf 2024-12-21  66  
74615b99696506 Josh Poimboeuf 2024-12-21 @67  	if (frame->fp_off && UNWIND_GET_USER_LONG(fp, cfa + frame->fp_off, state))
6def01593a2222 Josh Poimboeuf 2024-12-21  68  		goto the_end;
6def01593a2222 Josh Poimboeuf 2024-12-21  69  
6def01593a2222 Josh Poimboeuf 2024-12-21  70  	state->ip = ra;
6def01593a2222 Josh Poimboeuf 2024-12-21  71  	state->sp = cfa;
6def01593a2222 Josh Poimboeuf 2024-12-21  72  	if (frame->fp_off)
6def01593a2222 Josh Poimboeuf 2024-12-21  73  		state->fp = fp;
6def01593a2222 Josh Poimboeuf 2024-12-21  74  
74615b99696506 Josh Poimboeuf 2024-12-21  75  	arch_unwind_user_next(state);
74615b99696506 Josh Poimboeuf 2024-12-21  76  
6def01593a2222 Josh Poimboeuf 2024-12-21  77  	return 0;
6def01593a2222 Josh Poimboeuf 2024-12-21  78  
6def01593a2222 Josh Poimboeuf 2024-12-21  79  the_end:
6def01593a2222 Josh Poimboeuf 2024-12-21  80  	state->done = true;
6def01593a2222 Josh Poimboeuf 2024-12-21  81  	return -EINVAL;
8be9b2c9faa1f9 Josh Poimboeuf 2024-12-21  82  }
8be9b2c9faa1f9 Josh Poimboeuf 2024-12-21  83  

:::::: The code at line 48 was first introduced by commit
:::::: 8be9b2c9faa1f9ec62006e968ec6f6b1f666ce1d unwind: Add user space unwinding API

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
