Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B30346A0A;
	Wed, 11 Mar 2026 02:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773197095; cv=none; b=qmf+vor71YIbbHehNoPqrlScpE/TzzuJc3mg51GVrX5tYWsD0y7m5iopHHP8II+NQzG7evNwYX+V3OccJnWVQ15Z9H3JTbPjv889SZkS0PdN4mjPbjPn7WyNZCwMNowb9Ev7RugPwL66h9Z/0rz9e78hsz3PQ81TrQu7Q3BBKPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773197095; c=relaxed/simple;
	bh=aaG8l65BlkwQHxO4vr3LjRQ34Lg8mKXUZjdSfAKItmU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m9ZlABRZXU/5vwvyqIjLqxnqr9c1vUoGAN8KeC0j+bMAY7EJrEE6M1c/7YJj/rJ6FbA3GlzoHtSQ7Txsovqu1Rttv2nSCj3Qw/x16hivRgEPRJQtAvgJYW3tu5l1kK1BqZbaFTM859phLUbdDMJ/g042B8uLzrYdcrT+iepeIDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpP7m6C9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpP7m6C9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773197093; x=1804733093;
  h=date:from:to:cc:subject:message-id;
  bh=aaG8l65BlkwQHxO4vr3LjRQ34Lg8mKXUZjdSfAKItmU=;
  b=OpP7m6C968sGlWgUUVKf430kSbhpAVda1OhMIU7bjGMDihZHGe4epE/I
   BgWmzPME5+dW+k3gYUXcU21WWa41NTMIfZqS0xw2wBiF8auQKBqUGR0vz
   13Yh+T8zZYk1X9vwfxqkgaY827GlsoagBTImtaiqtdO4PWSD0UlCK/HPI
   LG0dWwyfcyC9Vz00bNSiQzkqyEvUoiEThuVaGDYE6ueedoznoPK26ppgP
   XCtZp0km2YbWZ0sUcKkG7AAecundiywyGyonGrCjDI6DrveMDHrQ1OUqG
   oh2pqdEgFku+V8M9UowjUB6gm037H0K14/iVcx/jAiXCwX06ARhdtba4i
   A==;
X-CSE-ConnectionGUID: ZP/zsbcFTfKCC0+Py9tnNA==
X-CSE-MsgGUID: sRBJkYX/Qx2HpnelMr7aKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74134169"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74134169"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 19:44:51 -0700
X-CSE-ConnectionGUID: KnKAjngQQYCaMr/ZlSH+iQ==
X-CSE-MsgGUID: mi7y1Kv+T5aTnKujBsLT2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219442203"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Mar 2026 19:44:50 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w09Z0-000000000bb-2UMF;
	Wed, 11 Mar 2026 02:44:46 +0000
Date: Wed, 11 Mar 2026 10:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [gustavoars:testing/wfamnae-next20260309 14/19]
 mm/mmu_gather.c:25:39: warning: comparison of distinct pointer types ('struct
 mmu_gather_batch *' and 'struct mmu_gather_batch_hdr *')
Message-ID: <202603111025.WgKunZHd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gustavoars/linux.git testing/wfamnae-next20260309
head:   e9c10f65a9dba55b2ab308e88aeb068d775d1a65
commit: f51f62a26a08681ba34f2d3e8df8395c91ecd8c1 [14/19] mm/mmu_gather: avoid dozens of -Wflex-array-member-not-at-end warnings
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260311/202603111025.WgKunZHd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111025.WgKunZHd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111025.WgKunZHd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/mmu_gather.c:25:39: warning: comparison of distinct pointer types ('struct mmu_gather_batch *' and 'struct mmu_gather_batch_hdr *') [-Wcompare-distinct-pointer-types]
      25 |         if (tlb->delayed_rmap && tlb->active != &tlb->local)
         |                                  ~~~~~~~~~~~ ^  ~~~~~~~~~~~
   1 warning generated.


vim +25 mm/mmu_gather.c

952a31c9e6fa963 Martin Schwidefsky 2018-09-18  19  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  20  static bool tlb_next_batch(struct mmu_gather *tlb)
196d9d8bb71deaa Peter Zijlstra     2018-09-03  21  {
196d9d8bb71deaa Peter Zijlstra     2018-09-03  22  	struct mmu_gather_batch *batch;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  23  
c47454823bd4e3a Linus Torvalds     2022-12-06  24  	/* Limit batching if we have delayed rmaps pending */
c47454823bd4e3a Linus Torvalds     2022-12-06 @25  	if (tlb->delayed_rmap && tlb->active != &tlb->local)
5df397dec7c4c08 Linus Torvalds     2022-11-09  26  		return false;
5df397dec7c4c08 Linus Torvalds     2022-11-09  27  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  28  	batch = tlb->active;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  29  	if (batch->next) {
196d9d8bb71deaa Peter Zijlstra     2018-09-03  30  		tlb->active = batch->next;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  31  		return true;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  32  	}
196d9d8bb71deaa Peter Zijlstra     2018-09-03  33  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  34  	if (tlb->batch_count == MAX_GATHER_BATCH_COUNT)
196d9d8bb71deaa Peter Zijlstra     2018-09-03  35  		return false;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  36  
adf085ff0d6fde5 Qianfeng Rong      2025-08-12  37  	batch = (void *)__get_free_page(GFP_NOWAIT);
196d9d8bb71deaa Peter Zijlstra     2018-09-03  38  	if (!batch)
196d9d8bb71deaa Peter Zijlstra     2018-09-03  39  		return false;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  40  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  41  	tlb->batch_count++;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  42  	batch->next = NULL;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  43  	batch->nr   = 0;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  44  	batch->max  = MAX_GATHER_BATCH;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  45  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  46  	tlb->active->next = batch;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  47  	tlb->active = batch;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  48  
196d9d8bb71deaa Peter Zijlstra     2018-09-03  49  	return true;
196d9d8bb71deaa Peter Zijlstra     2018-09-03  50  }
196d9d8bb71deaa Peter Zijlstra     2018-09-03  51  

:::::: The code at line 25 was first introduced by commit
:::::: c47454823bd4e3ab34ed3f795afd4479ab938a3f mm: mmu_gather: allow more than one batch of delayed rmaps

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
