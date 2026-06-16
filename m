Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84E53B14B4;
	Tue, 16 Jun 2026 11:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608864; cv=none; b=k1hBRGStlL8bNT1ZvRF4iEof4El8PRJMtDgqrso1l1CnZvs5MAUFX8XCavCBl3EPz6no648jmPDW6GZYujexlOdMmNL23PNRAfQ68sd1va+4iPstzMOmaGRW/zqdFO4EHlJxqBRdb5xZRUNLdZ/0Ob2WVQOMFPCqJ+6xA00TTJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608864; c=relaxed/simple;
	bh=U86WSjIv0LP3Y2iJU7bx2iIKQB36hIvqarZDUZObwoM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Syh6j8yPnBcAh6u2KwGgJRpE3A0AhFGD2MhmPPJGRqObVzwflxeFdjRdp8evyBvE8r06IzYb/39i1/YQn4WCqGNZmM72eGumvShkZesziPTGwjEgAL+AT6ib5LBBGSQvaf9GmiMfaGNIA/KGKQNwvsomxRa5PZIZ0FzjQ4hTXpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fz7dcm0J; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fz7dcm0J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781608862; x=1813144862;
  h=date:from:to:cc:subject:message-id;
  bh=U86WSjIv0LP3Y2iJU7bx2iIKQB36hIvqarZDUZObwoM=;
  b=Fz7dcm0JPMhLn9kdUqpAxzfBkdgITVS+IHrve/RaXnKXCji/2B/BrE8j
   N6AQq7Qsio0hco/BIgmM+LIYK5M8K9+gbKbs1bSrM2NKIJObHUoMAxNU+
   dg2mLbs/3WK7V31+4K6Y1goXXHxqrWqlkg5kOUwE18d6YiIeZM+F4b4Lu
   F3Wa0/V+PM8dBkipWT7nMo/nCLOkaL+Yhf8IklhNQiO60b5GOqaGZSZ2F
   MRggZAqvarjwzMF1nVwyrNzirgkq1a9iBMJ4R3XZyZEa9te0ek7YX6MRz
   5VgJwkhhMv3MYw9r2mpumyl9hZdOJxJqOfurOtQY9uo9Z/R6bC6yuvGrE
   Q==;
X-CSE-ConnectionGUID: Q/fF+phSSBytnS1yYX0sjg==
X-CSE-MsgGUID: KROTwfOUT96hYNF08xEFMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="92687000"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="92687000"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 04:20:59 -0700
X-CSE-ConnectionGUID: mwQghnpAQM2J3LEbQQTpUg==
X-CSE-MsgGUID: g37S/n6cTLC229rSSc305g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="246861887"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 Jun 2026 04:20:59 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZRqi-0000000056D-0VTv;
	Tue, 16 Jun 2026 11:20:56 +0000
Date: Tue, 16 Jun 2026 13:20:05 +0200
From: kernel test robot <lkp@intel.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: ERROR: modpost: "kvm_free_tlb_tag"
 [arch/x86/kvm/kvm-intel.ko] undefined!
Message-ID: <202606161302.xMRLP5W1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Yosry,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/intel-lab-lkp/linux/commits/Yosry-Ahmed/KVM-nSVM-Flush-the-TLB-after-forcefully-leaving-nested/20260616-104539
head:   8ffd2ccdf3cac4abc0d2fd686f0ec3c7a453a24a
commit: c431a77735b3877be989d51a32b73ef4e80902ca KVM: VMX: Generalize VPID allocation to be vendor-neutral
date:   9 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260616/202606161302.xMRLP5W1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161302.xMRLP5W1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161302.xMRLP5W1-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "kvm_free_tlb_tag" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "kvm_alloc_tlb_tag" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "kvm_destroy_tlb_tags" [arch/x86/kvm/kvm-intel.ko] undefined!
>> ERROR: modpost: "kvm_init_tlb_tags" [arch/x86/kvm/kvm-intel.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
