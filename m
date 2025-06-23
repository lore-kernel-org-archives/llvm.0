Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A4D30E84D;
	Mon, 23 Jun 2025 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671572; cv=none; b=iDPpmqq5veK5yMOhtYfQKtSFz/bBurRXQiynfFswzQAAhToC9dkAEda1HMg3XIOVXDXtDc5eSfZThsh10WE9XQdZx64sEV6r9mJMQ0eSsloH9w37YvuGKfvlZ9obCa1E1EtR/Ji+PzDIY6/I7QPPbFWhGjAXK+b++CaYeehDOQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671572; c=relaxed/simple;
	bh=V2cAW49MftLzTkIZYHxcO07wrG9WkakFtAyaDk38xiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NovmWy+i7ae66mpNO5fjDLIsQ715gbxpms4mHx1rbG2QPNy8JnPM+y+3m4o26vdE/UN83InoUl3HOvlwvMTwB3x8zof0GyoDW2HED7DFmaT7xAmrggSuPpx4P7BTJViSJcZG/Nwkg5C787cTWDoxIUyxLFRfC0u6z+nJ8cUnBo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b2eBSVSy; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b2eBSVSy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750671572; x=1782207572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2cAW49MftLzTkIZYHxcO07wrG9WkakFtAyaDk38xiA=;
  b=b2eBSVSyB6ekmjlcrhak8FbUYUPS8ZiqDSMbsGBl22WY/AJon5SbkWwp
   s1rYVY83bdf+LWd74wQIUmd2j5t42/vqpStB4TmgyXi4gW490yJyuE0N8
   41EeEumboYGYcw9rFtyA8h1PIKi21LsBqhdzkiZGaSv7oygALpzolqitm
   Kk4XlfO64FmJk3JL3Qv6eAJk4mMuYk1kW+cIC33HVqOxGRG7R9GXpGhVE
   NsBqO7Z6GD3Jfgg+/HYDnZUSNTDewrOPQTLfo89IqbZpY4iCHLBHWi5/Q
   EZiqcZBjzPysH2aDPIRnk8yofNQcRzjencp6ZgzQuLUp0yO8MkL96+gb1
   g==;
X-CSE-ConnectionGUID: crAyldiDRbeNlYeJI7GwQg==
X-CSE-MsgGUID: 3Lf0iCrXTvyvvZqYNvlvFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="53003444"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="53003444"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:39:31 -0700
X-CSE-ConnectionGUID: Y0QgG7E2QsOPOdjWVqa0sg==
X-CSE-MsgGUID: 8rA53tU7RmO7/+m8AfUY8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152223611"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jun 2025 02:39:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTdeB-000NuY-05;
	Mon, 23 Jun 2025 09:39:27 +0000
Date: Mon, 23 Jun 2025 17:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 65/66] lib/raid6/recov_rvv.c:168:24:
 error: use of undeclared identifier 'raid6_empty_zero_page'
Message-ID: <202506231711.lx2jqP0r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   4a817909eb2f8319250eb504f24337a45e43d351
commit: b443ec8e9b9ccfc3929e2b660f82c46b5f656c33 [65/66] lib/raid6: replace custom zero page with ZERO_PAGE
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20250623/202506231711.lx2jqP0r-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 875b36a8742437b95f623bab1e0332562c7b4b3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250623/202506231711.lx2jqP0r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506231711.lx2jqP0r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/raid6/recov_rvv.c:168:24: error: use of undeclared identifier 'raid6_empty_zero_page'
     168 |         ptrs[faila] = (void *)raid6_empty_zero_page;
         |                               ^~~~~~~~~~~~~~~~~~~~~
   lib/raid6/recov_rvv.c:171:24: error: use of undeclared identifier 'raid6_empty_zero_page'
     171 |         ptrs[failb] = (void *)raid6_empty_zero_page;
         |                               ^~~~~~~~~~~~~~~~~~~~~
   lib/raid6/recov_rvv.c:206:24: error: use of undeclared identifier 'raid6_empty_zero_page'
     206 |         ptrs[faila] = (void *)raid6_empty_zero_page;
         |                               ^~~~~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +/raid6_empty_zero_page +168 lib/raid6/recov_rvv.c

6093faaf9593fc Chunyan Zhang 2025-03-05  151  
6093faaf9593fc Chunyan Zhang 2025-03-05  152  static void raid6_2data_recov_rvv(int disks, size_t bytes, int faila,
6093faaf9593fc Chunyan Zhang 2025-03-05  153  				  int failb, void **ptrs)
6093faaf9593fc Chunyan Zhang 2025-03-05  154  {
6093faaf9593fc Chunyan Zhang 2025-03-05  155  	u8 *p, *q, *dp, *dq;
6093faaf9593fc Chunyan Zhang 2025-03-05  156  	const u8 *pbmul;	/* P multiplier table for B data */
6093faaf9593fc Chunyan Zhang 2025-03-05  157  	const u8 *qmul;		/* Q multiplier table (for both) */
6093faaf9593fc Chunyan Zhang 2025-03-05  158  
6093faaf9593fc Chunyan Zhang 2025-03-05  159  	p = (u8 *)ptrs[disks - 2];
6093faaf9593fc Chunyan Zhang 2025-03-05  160  	q = (u8 *)ptrs[disks - 1];
6093faaf9593fc Chunyan Zhang 2025-03-05  161  
6093faaf9593fc Chunyan Zhang 2025-03-05  162  	/*
6093faaf9593fc Chunyan Zhang 2025-03-05  163  	 * Compute syndrome with zero for the missing data pages
6093faaf9593fc Chunyan Zhang 2025-03-05  164  	 * Use the dead data pages as temporary storage for
6093faaf9593fc Chunyan Zhang 2025-03-05  165  	 * delta p and delta q
6093faaf9593fc Chunyan Zhang 2025-03-05  166  	 */
6093faaf9593fc Chunyan Zhang 2025-03-05  167  	dp = (u8 *)ptrs[faila];
6093faaf9593fc Chunyan Zhang 2025-03-05 @168  	ptrs[faila] = (void *)raid6_empty_zero_page;
6093faaf9593fc Chunyan Zhang 2025-03-05  169  	ptrs[disks - 2] = dp;
6093faaf9593fc Chunyan Zhang 2025-03-05  170  	dq = (u8 *)ptrs[failb];
6093faaf9593fc Chunyan Zhang 2025-03-05  171  	ptrs[failb] = (void *)raid6_empty_zero_page;
6093faaf9593fc Chunyan Zhang 2025-03-05  172  	ptrs[disks - 1] = dq;
6093faaf9593fc Chunyan Zhang 2025-03-05  173  
6093faaf9593fc Chunyan Zhang 2025-03-05  174  	raid6_call.gen_syndrome(disks, bytes, ptrs);
6093faaf9593fc Chunyan Zhang 2025-03-05  175  
6093faaf9593fc Chunyan Zhang 2025-03-05  176  	/* Restore pointer table */
6093faaf9593fc Chunyan Zhang 2025-03-05  177  	ptrs[faila]     = dp;
6093faaf9593fc Chunyan Zhang 2025-03-05  178  	ptrs[failb]     = dq;
6093faaf9593fc Chunyan Zhang 2025-03-05  179  	ptrs[disks - 2] = p;
6093faaf9593fc Chunyan Zhang 2025-03-05  180  	ptrs[disks - 1] = q;
6093faaf9593fc Chunyan Zhang 2025-03-05  181  
6093faaf9593fc Chunyan Zhang 2025-03-05  182  	/* Now, pick the proper data tables */
6093faaf9593fc Chunyan Zhang 2025-03-05  183  	pbmul = raid6_vgfmul[raid6_gfexi[failb - faila]];
6093faaf9593fc Chunyan Zhang 2025-03-05  184  	qmul  = raid6_vgfmul[raid6_gfinv[raid6_gfexp[faila] ^
6093faaf9593fc Chunyan Zhang 2025-03-05  185  					 raid6_gfexp[failb]]];
6093faaf9593fc Chunyan Zhang 2025-03-05  186  
6093faaf9593fc Chunyan Zhang 2025-03-05  187  	kernel_vector_begin();
6093faaf9593fc Chunyan Zhang 2025-03-05  188  	__raid6_2data_recov_rvv(bytes, p, q, dp, dq, pbmul, qmul);
6093faaf9593fc Chunyan Zhang 2025-03-05  189  	kernel_vector_end();
6093faaf9593fc Chunyan Zhang 2025-03-05  190  }
6093faaf9593fc Chunyan Zhang 2025-03-05  191  

:::::: The code at line 168 was first introduced by commit
:::::: 6093faaf9593fca92f96f165c95ff4b53353b1f4 raid6: Add RISC-V SIMD syndrome and recovery calculations

:::::: TO: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
