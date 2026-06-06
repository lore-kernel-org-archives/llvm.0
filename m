Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3538A274B23;
	Sat,  6 Jun 2026 04:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780718849; cv=none; b=ScfSQfL6LjigS4Mxym2m0HW9sPZDhiU5B1XkR3ewQxGjbCXz510l9ItnOTFQViq0xVjb+bb2UAlwJ2zCqKfttEq46cOVbKoiq45YPkaZaEFf0NsJ4Bz45ncq80Bbf1Qmz26pDfub3Y1UmpWYSUYlnUT49q/MVqNLc1+S6vFI8sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780718849; c=relaxed/simple;
	bh=IQfqbJx5FgA9xLpKYTXn+XXlxkgMdhU8guDLgCUl/Qk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rO7q+k81n3nHYvbGHMiHeCEwpPQYjERhgRKp3hGBb8uWpRgmtKqnz6Jn+2xM1Y96rc7xWdUUsJysi1berrmQJrf1B832CIJpTnVbOz/lX5t1bqxoPdxQjvEAYA5grbgs08MyXlshAwvZtm0UfgeyjkkhDsejZ5x16LoDil/TM1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GyThO5ev; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GyThO5ev"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780718847; x=1812254847;
  h=date:from:to:cc:subject:message-id;
  bh=IQfqbJx5FgA9xLpKYTXn+XXlxkgMdhU8guDLgCUl/Qk=;
  b=GyThO5evLj2Wr5oXvJgyLZtqj1w0tWQIYqqfe0e/efp08heOjR5H2aCP
   5bfePnssj6Y++FzxKsFhSGUjPfdUGiZVH2Z2ilpY92HhWRYuSG0sHcrJI
   0BE9NroA5UK8rELgy4Pnay3m/OIXyFOKFfYiRJ81sc0H9m0skV+Kwk/Zp
   Va8wpuE2oPG0S8523TJ0ezEzSd33VtN1BsBA4cGIVGdz2hVEkl0ADLs+0
   +CuGMZ2CVlVK27ubbh3NnF3rKaubn+IJAnmwNu2qiaAg5hEdRlnjYfPGF
   dzBKuD3DMMmzDiMifHkkhhGvXavRCMWelz1gjCFczL3ZLPBdo7I/snE8w
   w==;
X-CSE-ConnectionGUID: hsZWEEPlSbmTlAayCPxFRg==
X-CSE-MsgGUID: yRrIfTQKR8a8fptL+OzvNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81295319"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="81295319"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 21:07:26 -0700
X-CSE-ConnectionGUID: 2tBrcnAbSxSMxzFs6UzVbw==
X-CSE-MsgGUID: h18XB9r+RvCNNwDBdlkTcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="245062195"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Jun 2026 21:07:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wViJf-00000000Gj4-0HcH;
	Sat, 06 Jun 2026 04:07:23 +0000
Date: Sat, 06 Jun 2026 12:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat-2026-06-04 58/62]
 kernel/sched/debug.c:274:2: error: call to undeclared function
 '__sched_cgroup_mode_update'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202606061224.6SlMZvGc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat-2026-06-04
head:   b89fcd232db2b7117a3255be623eeb4c67ece726
commit: 582f7ee48dc53ebe117cf24e3a2b2102b25dcbd7 [58/62] sched/fair: Add cgroup_mode: up
config: x86_64-randconfig-014-20260605 (https://download.01.org/0day-ci/archive/20260606/202606061224.6SlMZvGc-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260606/202606061224.6SlMZvGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606061224.6SlMZvGc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:71:
>> kernel/sched/debug.c:274:2: error: call to undeclared function '__sched_cgroup_mode_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     274 |         __sched_cgroup_mode_update(mode);
         |         ^
   1 error generated.


vim +/__sched_cgroup_mode_update +274 kernel/sched/debug.c

   256	
   257	static ssize_t sched_dynamic_write(struct file *filp, const char __user *ubuf,
   258					   size_t cnt, loff_t *ppos)
   259	{
   260		char buf[16];
   261		int mode;
   262	
   263		if (cnt > 15)
   264			cnt = 15;
   265	
   266		if (copy_from_user(buf, ubuf, cnt))
   267			return -EFAULT;
   268	
   269		buf[cnt] = 0;
   270		mode = sched_dynamic_mode(strstrip(buf));
   271		if (mode < 0)
   272			return mode;
   273	
 > 274		__sched_cgroup_mode_update(mode);
   275		sched_dynamic_update(mode);
   276	
   277		*ppos += cnt;
   278	
   279		return cnt;
   280	}
   281	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
