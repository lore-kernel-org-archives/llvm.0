Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3955F328606;
	Tue,  4 Nov 2025 14:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762267915; cv=none; b=rxw7tRoFc6/triuvim5w45Y5pjdETfa6Tzkl+XjWW2F3X9UctgoyZeglka/vKhxUDApcVTJcX+Jvpi6dpC8cD5xgdVea7q7St9zD6aZ7qw/sGXQJFdSHlx17+wH5BwKLJkHDFIJE8qHn+Bu7SxpvrdQsVvR3h4+g79y0DUYqXts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762267915; c=relaxed/simple;
	bh=P/HlHjCiyP8djl/YsJTrzZ+Ot6NggdaEPCcyndLWpOY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IuBufL1VATaKjdfrpPsTD5ITgiTp4W36yjIu/4BUHJW3dJVoeiiN6xWO4W6G8ysOnoNY2wGVLvMq9M5/SQXbOw/oVdUrpvRQZvQfUsyqanBV57vGhZwri/XHGOSp7vuGk64VQS5cXcsarhmXwm90TKLcyee4ZckecBUr/Y49lAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7F985D9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7F985D9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762267914; x=1793803914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/HlHjCiyP8djl/YsJTrzZ+Ot6NggdaEPCcyndLWpOY=;
  b=O7F985D9rpA2pJXh94mY7w0LxdzzJhvUowRAZWN3TX0s93X1U1VYK9oG
   Ych/SRdo+fluBGdkXMmkQF4HnCHHI3D42EQhviFV1o+qkyiyNRWu4y7Mz
   kg2f9oDCHQ2ztPj7rSORPraGlMKNedSmJFc6TyHCI9gk+xLTWV+x7EXxC
   xkNxdpEhgQog5qCBWLV5VmXaA3j3wkfnnwh7en3lXacyXskEiiFlo6ZZO
   QUI7IkQBe4+ExII5H6AwurYkCgpK+B6xO1ooGa/5PBZx4/qsOHWmY45dQ
   Y4aiHID3xyum6cq0iaDr0AmM+zxwyK0nYcVOGCJOYVX+Tu1jMxFcAuemN
   w==;
X-CSE-ConnectionGUID: eXZWNufjQhGcwUY4PAGGSw==
X-CSE-MsgGUID: T04wdGV2Tm6lmUJfGx6Hvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="89826735"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="89826735"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 06:51:53 -0800
X-CSE-ConnectionGUID: tnqYtCWNTsOF1XeIP41pWQ==
X-CSE-MsgGUID: ekfRqJRhQZKEz6/up32sYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="186416255"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Nov 2025 06:51:52 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGIN9-000RVX-21;
	Tue, 04 Nov 2025 14:51:17 +0000
Date: Tue, 4 Nov 2025 22:48:31 +0800
From: kernel test robot <lkp@intel.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4972/5926] kernel/kexec_handover_debug.c:16:18:
 error: use of undeclared identifier 'kho_scratch_cnt'
Message-ID: <202511042251.paO6f5BZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17490bd0527f59d841168457b245581f314b5fa0
commit: 8c211175c3abcebb8bffce8095d78d193e482105 [4972/5926] liveupdate-kho-warn-and-fail-on-metadata-or-preserved-memory-in-scratch-area-fix
config: x86_64-randconfig-071-20251104 (https://download.01.org/0day-ci/archive/20251104/202511042251.paO6f5BZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511042251.paO6f5BZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511042251.paO6f5BZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/kexec_handover_debug.c:16:18: error: use of undeclared identifier 'kho_scratch_cnt'
      16 |         for (i = 0; i < kho_scratch_cnt; i++) {
         |                         ^
>> kernel/kexec_handover_debug.c:17:19: error: use of undeclared identifier 'kho_scratch'
      17 |                 scratch_start = kho_scratch[i].addr;
         |                                 ^
   kernel/kexec_handover_debug.c:18:17: error: use of undeclared identifier 'kho_scratch'
      18 |                 scratch_end = kho_scratch[i].addr + kho_scratch[i].size;
         |                               ^
   kernel/kexec_handover_debug.c:18:39: error: use of undeclared identifier 'kho_scratch'
      18 |                 scratch_end = kho_scratch[i].addr + kho_scratch[i].size;
         |                                                     ^
   4 errors generated.


vim +/kho_scratch_cnt +16 kernel/kexec_handover_debug.c

4039a00022d42a Pasha Tatashin 2025-10-20  10  
4039a00022d42a Pasha Tatashin 2025-10-20  11  bool kho_scratch_overlap(phys_addr_t phys, size_t size)
4039a00022d42a Pasha Tatashin 2025-10-20  12  {
4039a00022d42a Pasha Tatashin 2025-10-20  13  	phys_addr_t scratch_start, scratch_end;
4039a00022d42a Pasha Tatashin 2025-10-20  14  	unsigned int i;
4039a00022d42a Pasha Tatashin 2025-10-20  15  
4039a00022d42a Pasha Tatashin 2025-10-20 @16  	for (i = 0; i < kho_scratch_cnt; i++) {
4039a00022d42a Pasha Tatashin 2025-10-20 @17  		scratch_start = kho_scratch[i].addr;

:::::: The code at line 16 was first introduced by commit
:::::: 4039a00022d42ac3d68b2eea63066bc9f7ef89ce kho: warn and fail on metadata or preserved memory in scratch area

:::::: TO: Pasha Tatashin <pasha.tatashin@soleen.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
