Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E70205AB4;
	Fri, 10 Jan 2025 06:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736492231; cv=none; b=JtCkKGXD2jYlc4sAf0LFSYanjqDfxc+ti6xBmrdJiWdbf9iTTNOeGrXJvGeRiK+pZEgLmDpc48dcc6oq1S89T/L6K1d9SUOd6z3x9TvIQNPlJ21sIAbHKWweLnTAFnbDphnN8dtFqWLMgkxmPLWuW3r8DmgpeL0rI4+0S0Ml1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736492231; c=relaxed/simple;
	bh=bSy72CGlFpXBaMURND79eDsTivJty4UBZP5JNStEvx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xgy9/IoUI8wrMTc36QNwahjYlM9+RTjOUVdQE9m3zjNJzr9JYIujePfiQSFgI0oa1iW9QHiPGC+FcOUT0r334V3wkwGPbb8vLLFdEjyHh6J5l/JePlyxnOZ2TnMb7LfJaOEEMB7v39X4+xGbfHuClUahqYGHs6TRR17hagVlTWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HlFXIQks; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HlFXIQks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736492230; x=1768028230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bSy72CGlFpXBaMURND79eDsTivJty4UBZP5JNStEvx8=;
  b=HlFXIQkspSr4BvqTfOHuD+9jXumnMGowWJaVeX2lqsbvO3qT78Zus2XG
   yUoTChAfVaDuybaoaf8gHn1TN0Zc85Ue4RewqegNZ++CmmEfNN7zDevK/
   4Y2zIkVL+MCF+NJv0NOp2g3N82Oy+T14SCn4FwZ7xJoai3zuVLHSaCv7o
   dGI68rLTM/G9MUoMvt69pUg/Uw9yuWmHTkMzrlvv72rvPESN7YMpC4fsE
   gp5A4da6kxxEUzKd/IFWKb/lEEwXmIwvuScNWgEP5LMpcpzIPRy6NUCcH
   0+b/scydHnTxViHwzmzsx5daaaNiYc7s9HLRqeOy+F2i2HcmN535RbZiq
   w==;
X-CSE-ConnectionGUID: wC5NNMYEQl+NY0qRCZEGlg==
X-CSE-MsgGUID: sYRqecaVSFKi1QbpkFX1hQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="40543294"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="40543294"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 22:57:09 -0800
X-CSE-ConnectionGUID: 7LkHqyDITxOV6GH/b8jT+w==
X-CSE-MsgGUID: PuSUO6tUT66AXk2i5ZPKvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="104174765"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jan 2025 22:57:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW8x7-000IhN-0s;
	Fri, 10 Jan 2025 06:57:05 +0000
Date: Fri, 10 Jan 2025 14:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.01.07a 46/56] kernel/rcu/srcutree.c:800:18:
 error: passing 'atomic_long_t' (aka 'atomic64_t') to parameter of
 incompatible type 'atomic_long_t *' (aka 'atomic64_t *'); take the address
 with &
Message-ID: <202501101426.H4VxxBgO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.01.07a
head:   88e44a908bff076d1e7f47634f06a8a4560c19e9
commit: 88b0a38dd85e2d8a633c78ad39dd82168b9b4e94 [46/56] srcu: Pull integer-to-pointer conversion into __srcu_ctr_to_ptr()
config: powerpc64-randconfig-001-20250110 (https://download.01.org/0day-ci/archive/20250110/202501101426.H4VxxBgO-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101426.H4VxxBgO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501101426.H4VxxBgO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/srcutree.c:800:18: error: passing 'atomic_long_t' (aka 'atomic64_t') to parameter of incompatible type 'atomic_long_t *' (aka 'atomic64_t *'); take the address with &
     800 |         atomic_long_inc(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         &
   include/linux/atomic/atomic-instrumented.h:3589:32: note: passing argument to parameter 'v' here
    3589 | atomic_long_inc(atomic_long_t *v)
         |                                ^
   1 error generated.


vim +800 kernel/rcu/srcutree.c

   789	
   790	/*
   791	 * Removes the count for the old reader from the appropriate per-CPU
   792	 * element of the srcu_struct.  Note that this may well be a different
   793	 * CPU than that which was incremented by the corresponding srcu_read_lock().
   794	 */
   795	void __srcu_read_unlock_nmisafe(struct srcu_struct *ssp, int idx)
   796	{
   797		struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
   798	
   799		smp_mb__before_atomic(); /* C */  /* Avoid leaking the critical section. */
 > 800		atomic_long_inc(__srcu_ctr_to_ptr(ssp, idx)->srcu_unlocks);
   801	}
   802	EXPORT_SYMBOL_GPL(__srcu_read_unlock_nmisafe);
   803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
