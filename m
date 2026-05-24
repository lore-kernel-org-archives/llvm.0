Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF1913AD1C;
	Sun, 24 May 2026 01:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779586632; cv=none; b=GFVAHl3rUos0XR4ad4hNp5aO2nwEVQprsGwlyC3ezficv8htU/Ccm6/tsI+RujBLVX+qY6zck36QMFdy5toKzCnPHhvz2JpQon7hEmRwBMQ2TsOAuCqHkfVRNTj1qDOtLMvDTsOqDxtWug9YIetiBrpbSCxIXDmiix+H5uGTgIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779586632; c=relaxed/simple;
	bh=yUfr85D9fm2/niGATP9vVwxOu5fWPbRm69BBR9ceKQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qglW6Ca5+CCOux05LBrrLal/1E9dDZuz8qwGszYcTyxoXHKKp4YKEUoD7vyF0gTQUgSaqkrgcRKXXDpVjUZE3AJT6/CItxVfCu1hxhUKXXQDJbY9I2/x7ZQvPs33Xmxqbel+Q6q9OnVCB7nUPboiQSg2QlpJM/o48ejxlp/v4+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKu2Rsn2; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKu2Rsn2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779586630; x=1811122630;
  h=date:from:to:cc:subject:message-id;
  bh=yUfr85D9fm2/niGATP9vVwxOu5fWPbRm69BBR9ceKQQ=;
  b=WKu2Rsn2NPK7319yJn/vf/PMknL4hZb+gLOlV7MchE1X56391csMKruv
   igVw6G4fNsEuU2oiRzBS3ywOMc9bgdbz0LZpsBxhlBLvaSLDcmgNuN99O
   8TOzYIRd62z6pwwh4qFauaBlu0CRMPMxhUlzH9h6yJtb8Br5x7WTt8zQ+
   1muMqLkdnPtAVXhPnYy463h6JwYkdguxmBCk8TRmV5evu65JrQs9EiKa5
   upz8SuhmiU72gneeRSgbPlirnb8m/7nq30zx2qbMpaIXLxOKhWRklsAi1
   gQxeUerM/uB7brMATXpjDhFXtzAjWXQJM2UT8f3xt/O1ghvOtkTC+J8ye
   Q==;
X-CSE-ConnectionGUID: JHT2diLeSRGnePIJ56QuVw==
X-CSE-MsgGUID: fTnjn6NeSU2p5qgl8mZCOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="91849632"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="91849632"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 18:37:08 -0700
X-CSE-ConnectionGUID: VbVt5VI6S/WklUON16LabA==
X-CSE-MsgGUID: t0/ZDIBsQLiSvrkWurB14Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="246336535"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2026 18:37:07 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQxm4-000000000YN-141k;
	Sun, 24 May 2026 01:37:04 +0000
Date: Sun, 24 May 2026 09:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Tejun Heo <tj@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>
Subject: [tj-sched-ext:arena-direct-v4 58/64]
 kernel/bpf/core.c:3293:1: warning: attribute declaration must precede
 definition
Message-ID: <202605240910.1zChSX2b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git arena-direct-v4
head:   2d25ba3fed37e8da4b3c91d6bf5d209e2ca5f8d6
commit: 96960690387e0641d86fd9fefa49ee3210aa2208 [58/64] bpf: Recover arena kernel faults with scratch page
config: hexagon-defconfig (https://download.01.org/0day-ci/archive/20260524/202605240910.1zChSX2b-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240910.1zChSX2b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240910.1zChSX2b-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.c:3293:1: warning: attribute declaration must precede definition [-Wignored-attributes]
    3293 | __weak bool bpf_arena_handle_page_fault(unsigned long addr, bool is_write,
         | ^
   include/linux/compiler_attributes.h:403:56: note: expanded from macro '__weak'
     403 | #define __weak                          __attribute__((__weak__))
         |                                                        ^
   include/linux/bpf_defs.h:12:20: note: previous definition is here
      12 | static inline bool bpf_arena_handle_page_fault(unsigned long addr, bool is_write,
         |                    ^
   kernel/bpf/core.c:3293:13: error: redefinition of 'bpf_arena_handle_page_fault'
    3293 | __weak bool bpf_arena_handle_page_fault(unsigned long addr, bool is_write,
         |             ^
   include/linux/bpf_defs.h:12:20: note: previous definition is here
      12 | static inline bool bpf_arena_handle_page_fault(unsigned long addr, bool is_write,
         |                    ^
   1 warning and 1 error generated.


vim +3293 kernel/bpf/core.c

  3282	
  3283	/* for configs without MMU or 32-bit */
  3284	__weak const struct bpf_map_ops arena_map_ops;
  3285	__weak u64 bpf_arena_get_user_vm_start(struct bpf_arena *arena)
  3286	{
  3287		return 0;
  3288	}
  3289	__weak u64 bpf_arena_get_kern_vm_start(struct bpf_arena *arena)
  3290	{
  3291		return 0;
  3292	}
> 3293	__weak bool bpf_arena_handle_page_fault(unsigned long addr, bool is_write,
  3294						unsigned long fault_ip)
  3295	{
  3296		return false;
  3297	}
  3298	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
