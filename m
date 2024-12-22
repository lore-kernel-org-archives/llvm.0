Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A630780B;
	Sun, 22 Dec 2024 02:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734833053; cv=none; b=AlJ4nk/zXJFkIUzVxyEl2lWnzrYpflawKQAG0UkkeJg3e9B9P0yC/DcHH8Lpvz1X0+YIiQiO+Lcs+SxwDKd3BW2ntqao8asBbzvWpqUhA20sF7Cl/5skH0+/x+4d7uC4xqP7YOIPGF+gfySf5X+CYqOKpimxOveu5Tedn1Yfrsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734833053; c=relaxed/simple;
	bh=PtddHhG2CcgrUys/yWYZ86rQDGnDlIvdipYAKFJopr0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mIg2V1nD1JK2lMv513O5QSwp9xgEUmm1GxDMcIGThuKNcHWc9GHLpBq40XCpcCfeTiQ5MyaQBDMLsCQ2lKgf17sczoKOgigwyhylbSne3G0LJlnhbJINIJVbz6ZBVFssdJZTKChY9b5WLqvzsKlMe/6HH29jLvonPTxTb/kRyCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aQN4NYxN; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQN4NYxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734833051; x=1766369051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PtddHhG2CcgrUys/yWYZ86rQDGnDlIvdipYAKFJopr0=;
  b=aQN4NYxN45sWfFIooWcUIwWgXsU7Lla4g4mV07edUKdQJpR0OGa5Xz2k
   m0f7AF/KXuKJRbSmyhr4lI68ARwsuPWQECem4q/4Y1MWKW0TN6hBYGYJN
   OJYAkBkCExDZ2xCMTS8gA7pP8cHvUl4NiSz1ep+PKKpz36uojagJ61QkP
   I9uTgByUZ+/XslopNzl2SMyni642jbZAfkx8QW3VipGrq8TbMpx3urVNX
   AwHlXMoMfQMsZ6d9sAztCm1n4Ggssv1scovNr6OHhIVGAlaM+2LAJxrBD
   aaGU1csFvCqXSuP0TQ4wuX9+30DM40TR1AQAXnsAucOXTR8REAgHPW8p/
   A==;
X-CSE-ConnectionGUID: qbWvrCovTxS0AGsby0kPWQ==
X-CSE-MsgGUID: lFLS+/8aS+yFM3Dvws5w1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="45944075"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="45944075"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 18:04:11 -0800
X-CSE-ConnectionGUID: EpcTdvC0QgWzfwL3AAZTJA==
X-CSE-MsgGUID: Q+tjIOgrTb6gv8DlLYFDZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129831974"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2024 18:04:10 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPBKC-0002fG-0e;
	Sun, 22 Dec 2024 02:04:08 +0000
Date: Sun, 22 Dec 2024 10:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 28/32] kernel/rcu/srcutree.c:795:18: error:
 incompatible pointer types passing 's64 *' (aka 'long long *') to parameter
 of type 'atomic_long_t *' (aka 'atomic64_t *')
Message-ID: <202412220902.dvHSzE62-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   61a0b92b3a3cfef69e3848806e51d1b99a9e9406
commit: 62986fee7c7a83cb091dca361bcb1ea1b40d4ec4 [28/32] srcu: Pull ->srcu_{un,}lock_count into a new srcu_ctr structure
config: powerpc64-randconfig-001-20241222 (https://download.01.org/0day-ci/archive/20241222/202412220902.dvHSzE62-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220902.dvHSzE62-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220902.dvHSzE62-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/srcutree.c:779:49: error: expected ')'
     779 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_locks]);
         |                                                        ^
   kernel/rcu/srcutree.c:779:17: note: to match this '('
     779 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_locks]);
         |                        ^
   kernel/rcu/srcutree.c:779:50: error: expected expression
     779 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_locks]);
         |                                                         ^
>> kernel/rcu/srcutree.c:795:18: error: incompatible pointer types passing 's64 *' (aka 'long long *') to parameter of type 'atomic_long_t *' (aka 'atomic64_t *') [-Werror,-Wincompatible-pointer-types]
     795 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_unlocks.counter);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:3589:32: note: passing argument to parameter 'v' here
    3589 | atomic_long_inc(atomic_long_t *v)
         |                                ^
   3 errors generated.


vim +795 kernel/rcu/srcutree.c

   784	
   785	/*
   786	 * Removes the count for the old reader from the appropriate per-CPU
   787	 * element of the srcu_struct.  Note that this may well be a different
   788	 * CPU than that which was incremented by the corresponding srcu_read_lock().
   789	 */
   790	void __srcu_read_unlock_nmisafe(struct srcu_struct *ssp, int idx)
   791	{
   792		struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
   793	
   794		smp_mb__before_atomic(); /* C */  /* Avoid leaking the critical section. */
 > 795		atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_unlocks.counter);
   796	}
   797	EXPORT_SYMBOL_GPL(__srcu_read_unlock_nmisafe);
   798	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
