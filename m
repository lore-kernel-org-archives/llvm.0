Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF318DB2A;
	Thu,  6 Nov 2025 04:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762402558; cv=none; b=ZqflSdwM19POx1s2BdyZ4wP+vG2tgBfx39LAzwdPTYyuOYGd7hhFA5eeNuRZDHTILWwOBmlRdciiawTEAYjRJXIH/SnLK1RsBSoU72/JAZethGmzinNdZY+m26VqTAGc95hmLgAtrkxmJuTtFzyd3aaHr0t3ET5nLYolclsaQw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762402558; c=relaxed/simple;
	bh=x4LcBPkkX0w6Mv/6ZuOLhbCXOYFnmK39ltUTTEKxUEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qY9xYN4BJ8YKW8Mvgd/pZS2RwJ6QVEYFC7mHr3bcQD6IJvSwmikK+8GMhix1u83LrPBjlWy76Zb/0TWJrkocQD+T713jupArPUdpv/BAR+rOO56PZFTbPEi+AZzCuiN7fEnioYJA+3TArvwO7/rae2W6tZpVYI+dPy/wZ3rArI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fwf98TOE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fwf98TOE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762402556; x=1793938556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x4LcBPkkX0w6Mv/6ZuOLhbCXOYFnmK39ltUTTEKxUEY=;
  b=fwf98TOEUFAAxMjOxODfgfSfU/4a/oy6tbMgkOr8pmZZfIGgQxV6n9kA
   5D43Zcb5pHaLrjKFBCYThbFlCJ5uMg/kKaNpxNfr3PlnEpOi56/gn9rAc
   SieD5KO5UKkMHAmZi1XfCjFwb/BOAyB7BmMjkJaSNq7R8OOIiPpvlg8MV
   4py8xPsSNgG4m8gbrDMHlOyAyTcNNeRaScTjpbsNRC6/87aDyGaC2DqMG
   w1hfgNoZdGeULjrrDMqccep2j1Net2AyeTebnzoO2yyk5PsFSITkRR88x
   rbYXWfKdAtMCpKALgW2jQZfrP3/N5OyfB+rmyCyKOMKpmtVnMUduzL7BQ
   A==;
X-CSE-ConnectionGUID: ZgTo497wRuGCiN8yWkSBiA==
X-CSE-MsgGUID: 3JxDcWqdRCOvMvrwgLK1wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75980727"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="75980727"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 20:15:56 -0800
X-CSE-ConnectionGUID: 3gJUzrBTRzuAvFpu6nDpuQ==
X-CSE-MsgGUID: PFP81VbkS4qLxCbW8QNK1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="187594967"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 05 Nov 2025 20:15:55 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGrPc-000TU8-2D;
	Thu, 06 Nov 2025 04:15:52 +0000
Date: Thu, 6 Nov 2025 12:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [rcu:rcu/refscale 1/8] kernel/rcu/refscale.c:187:1: error: type
 specifier missing, defaults to 'int'; ISO C99 and later do not support
 implicit int
Message-ID: <202511061218.rUPOilkA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rcu/linux.git rcu/refscale
head:   0c990a8562a127b71e72eec4b9b92ba0f602510c
commit: 04f65881ec76959989d5218440085bb0a5042b01 [1/8] refscale: Exercise DEFINE_STATIC_SRCU_FAST() and init_srcu_struct_fast()
config: riscv-randconfig-001-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061218.rUPOilkA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061218.rUPOilkA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061218.rUPOilkA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/rcu/refscale.c:187:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     187 | DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
         | ^
         | int
>> kernel/rcu/refscale.c:187:25: error: a parameter list without types is only allowed in a function definition
     187 | DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
         |                         ^
>> kernel/rcu/refscale.c:222:15: error: use of undeclared identifier 'srcu_fast_refctl_scale'; did you mean 'srcu_refctl_scale'?
     222 |         srcu_ctlp = &srcu_fast_refctl_scale;
         |                      ^~~~~~~~~~~~~~~~~~~~~~
         |                      srcu_refctl_scale
   kernel/rcu/refscale.c:186:20: note: 'srcu_refctl_scale' declared here
     186 | DEFINE_STATIC_SRCU(srcu_refctl_scale);
         |                    ^
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/int +187 kernel/rcu/refscale.c

   184	
   185	// Definitions for SRCU ref scale testing.
   186	DEFINE_STATIC_SRCU(srcu_refctl_scale);
 > 187	DEFINE_STATIC_SRCU_FAST(srcu_fast_refctl_scale);
   188	static struct srcu_struct *srcu_ctlp = &srcu_refctl_scale;
   189	
   190	static void srcu_ref_scale_read_section(const int nloops)
   191	{
   192		int i;
   193		int idx;
   194	
   195		for (i = nloops; i >= 0; i--) {
   196			idx = srcu_read_lock(srcu_ctlp);
   197			srcu_read_unlock(srcu_ctlp, idx);
   198		}
   199	}
   200	
   201	static void srcu_ref_scale_delay_section(const int nloops, const int udl, const int ndl)
   202	{
   203		int i;
   204		int idx;
   205	
   206		for (i = nloops; i >= 0; i--) {
   207			idx = srcu_read_lock(srcu_ctlp);
   208			un_delay(udl, ndl);
   209			srcu_read_unlock(srcu_ctlp, idx);
   210		}
   211	}
   212	
   213	static const struct ref_scale_ops srcu_ops = {
   214		.init		= rcu_sync_scale_init,
   215		.readsection	= srcu_ref_scale_read_section,
   216		.delaysection	= srcu_ref_scale_delay_section,
   217		.name		= "srcu"
   218	};
   219	
   220	static bool srcu_fast_sync_scale_init(void)
   221	{
 > 222		srcu_ctlp = &srcu_fast_refctl_scale;
   223		return true;
   224	}
   225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
