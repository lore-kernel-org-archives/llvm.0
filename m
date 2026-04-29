Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5FA287259;
	Wed, 29 Apr 2026 19:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777491106; cv=none; b=K6lEeppcfN+Qk1IwYoaToumNc79MHYu+h+AX2fF5/87JFhkHCNqlzZmydWp8Ll4oigZYU3WG6cAVn62FI7cBqCu/ESm/Sk/nVpK2OB2LL3jrRAog7vxoTubj2V8cATIkDfPb8H1LqbbNOZK92p5BP8i6EQ2dqCEMzUQ6Nmv2uBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777491106; c=relaxed/simple;
	bh=84tCgT7M7YG33dSvFcQtEURiRYdpo9sHfAasTsVQND0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n8AAu4Xzn5GVok3t4oC16+HQIsfjY9HOINlbK6NxFD72i3LWZFZ63U31Lf+rFzId513LgH80HuffuI59FO1T59QvTah5nSr0+OLDwF+3UosCqj3aL+Nx3PF3GHUdcysQBreSzaVOwL5wS3iPcL352CcwCjfNdR+qjL1RbUiXRpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VeOC2gee; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VeOC2gee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777491106; x=1809027106;
  h=date:from:to:cc:subject:message-id;
  bh=84tCgT7M7YG33dSvFcQtEURiRYdpo9sHfAasTsVQND0=;
  b=VeOC2geeLQruM3TjpLP53cbAdZEHh1b8Wf7QS91umfqGl7+/kN0kbXn7
   RZWSAU8BDDheYmVWoE7wPskk0jR6bpZPnzC6/EdKz1oKiWYcNX7G//Y2x
   UcSb7Aeeow9s+/ZZjvBI0iAvz54t3JjgX1a60qzw5iYIngmwtQjMrhBeh
   udJLm3/6Azv6fssofB5zktqhg5SynKtOMkri6ZtukKG54UpVwcBBR2GRr
   oct9/WQgRf7PDobzHNQd/hx/WABNmb/kbWA3qGQeV+xnYwMHULp4vKUDn
   xtFw9RGBI+G/a+3G/CT7se0g7E+oiZZPilfQ8mlYAHFQylYDE1BTDutqB
   g==;
X-CSE-ConnectionGUID: m8ZLJsZcQbOfv5ECRGX/DQ==
X-CSE-MsgGUID: 0cibwDjbSEGwo2HoJamYDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78325117"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="78325117"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 12:31:45 -0700
X-CSE-ConnectionGUID: YxRu9OHmQ/aPuTwFBa/L+g==
X-CSE-MsgGUID: LGaGnLk9T6W7iq98yCCktg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; 
   d="scan'208";a="229759541"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Apr 2026 12:31:43 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIAdJ-00000000BSa-0Kh0;
	Wed, 29 Apr 2026 19:31:41 +0000
Date: Thu, 30 Apr 2026 03:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:core/rseq 5/11] kernel/sched/membarrier.c:208:6:
 error: call to undeclared function 'rseq_v2'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202604300311.aIKKS59R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git core/rseq
head:   9a2253d7640f6b319562dda1a87cee3416c5d332
commit: a86e32c235afd7ea34ee7ecca5ce532b918930c2 [5/11] rseq: Revert to historical performance killing behaviour
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260430/202604300311.aIKKS59R-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300311.aIKKS59R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300311.aIKKS59R-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
>> kernel/sched/membarrier.c:208:6: error: call to undeclared function 'rseq_v2'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     208 |         if (rseq_v2(current))
         |             ^
   1 error generated.


vim +/rseq_v2 +208 kernel/sched/membarrier.c

   191	
   192	static void ipi_rseq(void *info)
   193	{
   194		/*
   195		 * Ensure that all stores done by the calling thread are visible
   196		 * to the current task before the current task resumes.  We could
   197		 * probably optimize this away on most architectures, but by the
   198		 * time we've already sent an IPI, the cost of the extra smp_mb()
   199		 * is negligible.
   200		 */
   201		smp_mb();
   202		/*
   203		 * Legacy mode requires that IDs are written and the critical section is
   204		 * evaluated. V2 optimized mode handles the critical section and IDs are
   205		 * only updated if they change as a consequence of preemption after
   206		 * return from this IPI.
   207		 */
 > 208		if (rseq_v2(current))
   209			rseq_sched_switch_event(current);
   210		else
   211			rseq_force_update();
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
