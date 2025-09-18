Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6EE28E7;
	Thu, 18 Sep 2025 00:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758154780; cv=none; b=WlqR0fvxIVRQi/kbF11AR7VM9m14jU5ENiYcFCs+1pwwLd9u9V51vG2yCTxp/blH+lqzwYXnnvm2Of6RGiEcWe9hrthFGj+TWjqFkvXXnVNZGOu7ESjBiVC7nxG3QiwsFgsYGYu4UyPSRX5UhPSoj1Y4/TMNbvGCCLM8MneysfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758154780; c=relaxed/simple;
	bh=agDroU+Cu9ldCw0oxgBD0fZZB/Dxjk063eP6p7QpZ0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g0TzkY++YTgnH5WG6ouVsslPEnBsLqvTVDZ+1piu5iA+7Oh/xrKWFfcUEK3NMGzwU4wivc+ODm4rKYpGuTlL4XSs+N0sdubT2sM750UHnIFeyRPy07MApYCo7W9+CEuiro1EZ3rFP+1bBlaGpa9aMkBAsANFSz/NPodPIjKGva0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWFJ8Kb5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWFJ8Kb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758154779; x=1789690779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=agDroU+Cu9ldCw0oxgBD0fZZB/Dxjk063eP6p7QpZ0k=;
  b=iWFJ8Kb55xhfWdB0SVsSjnFK39I4lCb7npu4hVHVIw2RAGW71VgNZuhJ
   uPyd4GtoC//Joir+ZvYxzxkc6g6F3QW0eJr+oeVrVENgTDzxoluvIyyxC
   QG0yPrg8IMqdyT+ODHKegsK5WMtALz0IscWAWVM9/YOVMMkrg1z0aLNqR
   +/SauTBxP440ziBa4EhEgaEI1hpUNaoxdXqCdC2fYDtvIGbAtiqh1uO8k
   5q8oQUKXOKl6o/5F7LVkTJdO/ZAccmrrkRfJv1TrNabx7Rx7qfqDgxI7N
   eI06vsgwM84heJq8ofZ/4H+hxGOkjBPbpR07M3j+1UGRbedvJySrXz4vk
   g==;
X-CSE-ConnectionGUID: +636nGFNSnKPwDr8RrmRSw==
X-CSE-MsgGUID: Vmm686qWTP6fTwujTXV8JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60624507"
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="60624507"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 17:19:39 -0700
X-CSE-ConnectionGUID: kF7faGEHSha8+hBueFPHfA==
X-CSE-MsgGUID: uIpy9WIwRFuUet5dYPjQmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,273,1751266800"; 
   d="scan'208";a="175785244"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2025 17:19:37 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uz2N5-0002aV-0E;
	Thu, 18 Sep 2025 00:19:35 +0000
Date: Thu, 18 Sep 2025 08:19:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Curley <jcurley@purestorage.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anna Schumaker <anna.schumaker@oracle.com>
Subject: [anna-nfs:linux-next 20/32]
 fs/nfs/flexfilelayout/flexfilelayout.c:614:2: error: incompatible pointer
 types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'uint64_t
 *' (aka 'unsigned long long *')
Message-ID: <202509180839.UzAynv63-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.linux-nfs.org/projects/anna/linux-nfs.git linux-next
head:   790035f57131cbc430418b4a2d3f3f24caa7c40f
commit: 67ee714244dfb06cdeab07ee624e2eeddab35067 [20/32] NFSv4/flexfiles: Commit path updates for striped layouts
config: powerpc-randconfig-003-20250918 (https://download.01.org/0day-ci/archive/20250918/202509180839.UzAynv63-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509180839.UzAynv63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509180839.UzAynv63-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/nfs/flexfilelayout/flexfilelayout.c:614:2: warning: comparison of distinct pointer types ('typeof ((mirror_idx)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     614 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:183:28: note: expanded from macro 'do_div'
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> fs/nfs/flexfilelayout/flexfilelayout.c:614:2: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     614 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:199:22: note: expanded from macro 'do_div'
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:174:38: note: passing argument to parameter 'dividend' here
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
>> fs/nfs/flexfilelayout/flexfilelayout.c:614:2: warning: shift count >= width of type [-Wshift-count-overflow]
     614 |         do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:195:25: note: expanded from macro 'do_div'
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   fs/nfs/flexfilelayout/flexfilelayout.c:625:9: warning: comparison of distinct pointer types ('typeof ((mirror_idx)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
     625 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:183:28: note: expanded from macro 'do_div'
     183 |         (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
         |                ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c:625:9: error: incompatible pointer types passing 'u32 *' (aka 'unsigned int *') to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
     625 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:199:22: note: expanded from macro 'do_div'
     199 |                 __rem = __div64_32(&(n), __base);       \
         |                                    ^~~~
   include/asm-generic/div64.h:174:38: note: passing argument to parameter 'dividend' here
     174 | extern uint32_t __div64_32(uint64_t *dividend, uint32_t divisor);
         |                                      ^
   fs/nfs/flexfilelayout/flexfilelayout.c:625:9: warning: shift count >= width of type [-Wshift-count-overflow]
     625 |         return do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:195:25: note: expanded from macro 'do_div'
     195 |         } else if (likely(((n) >> 32) == 0)) {          \
         |                                ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   4 warnings and 2 errors generated.


vim +614 fs/nfs/flexfilelayout/flexfilelayout.c

   607	
   608	static u32 calc_mirror_idx_from_commit(struct pnfs_layout_segment *lseg,
   609					       u32 commit_index)
   610	{
   611		struct nfs4_ff_layout_segment *flseg = FF_LAYOUT_LSEG(lseg);
   612		u32 mirror_idx = commit_index;
   613	
 > 614		do_div(mirror_idx, flseg->mirror_array[0]->dss_count);
   615	
   616		return mirror_idx;
   617	}
   618	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
