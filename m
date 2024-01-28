Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7A12E3E5;
	Sun, 28 Jan 2024 18:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706465440; cv=none; b=sG0iczHW0tDelKptNcfiIzvTiAvxOkARG85G0LZPpLlQcH2S5TfOoFmPZRrLhsFTNbmROzweavSoU+iAEpCReCwgeZA/bBGx32EApoD5lsVvnNCEeLgjR9tCM88SMGbQLWJpM52i5f6ntW0HKJpRnHra8CNDF70Gd8MtPpT5lE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706465440; c=relaxed/simple;
	bh=LN7fpdkZ1lk37qgwIc5IA8ziLyCd56ezJq1ynlj3RX0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ro0D30jlrrnNYPBvKAzIztA02IiYE1ukjlgQ4PCfgjOfBWPBXGXoxWVU6/hUjL3MHu4bYFEqjsYQNpIyTAbqzMH0bZRFCmKvjaOhzRA93TJjdiNT3HerWQM05gnTXilZttAjbsMfEjyjM25dHktTnh0TQ27xh5MjiOGUG6AEkuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lmU/TiCx; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lmU/TiCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706465439; x=1738001439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LN7fpdkZ1lk37qgwIc5IA8ziLyCd56ezJq1ynlj3RX0=;
  b=lmU/TiCxrEe1aH6E1fh+qObpw836HtkEe6Cj7o8wONp7DyM93unTqyR2
   pcIyRW8M0Z56gP8rVjPQWaFTsIv6ldNAPRarBOKyc/rC5JLH0KPEYQIPP
   OuzCoJFt8pV3RLus87/4TBnVVxfb1DXcpUNK3JRgeB4DkOGD0GaBznbjQ
   G8uxkDINC083sS/flqWkCVaoCB2hiuhQ+fTV3pHPrKBjzznkqi5/9wf5G
   saaeHTtty1858OfdC+4nE06zgsWkB56kOsYSQhNxKRRqxGwjsR9L0Ec8A
   EOoO8obP6OF62V1lfQECm51Yo1+97F8rOZexIS4G8Y9+R/ZHsp2w4BCjm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="9468414"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9468414"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 10:10:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="3243835"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Jan 2024 10:10:37 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rU9c2-0003dd-0O;
	Sun, 28 Jan 2024 18:10:34 +0000
Date: Mon, 29 Jan 2024 02:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:uptr_v3 2/11] kernel/bpf/core.c:2975:12: warning: no
 previous prototype for function 'bpf_arena_get_user_vm_start'
Message-ID: <202401290217.5t5Cmgp3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git uptr_v3
head:   545ce904000a1f553bc985000a0eee057b6c4847
commit: 35e094065b98d2f1e23592f3e65d4f8c6bc1863e [2/11] bpf: Introduce bpf arena.
config: arm-randconfig-003-20240128 (https://download.01.org/0day-ci/archive/20240129/202401290217.5t5Cmgp3-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401290217.5t5Cmgp3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401290217.5t5Cmgp3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/bpf/core.c:2975:12: warning: no previous prototype for function 'bpf_arena_get_user_vm_start' [-Wmissing-prototypes]
   __weak u64 bpf_arena_get_user_vm_start(struct bpf_arena *arena)
              ^
   kernel/bpf/core.c:2975:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __weak u64 bpf_arena_get_user_vm_start(struct bpf_arena *arena)
          ^
          static 
>> kernel/bpf/core.c:2979:12: warning: no previous prototype for function 'bpf_arena_get_kern_vm_start' [-Wmissing-prototypes]
   __weak u64 bpf_arena_get_kern_vm_start(struct bpf_arena *arena)
              ^
   kernel/bpf/core.c:2979:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __weak u64 bpf_arena_get_kern_vm_start(struct bpf_arena *arena)
          ^
          static 
   2 warnings generated.


vim +/bpf_arena_get_user_vm_start +2975 kernel/bpf/core.c

  2972	
  2973	#ifndef CONFIG_MMU
  2974	__weak const struct bpf_map_ops arena_map_ops;
> 2975	__weak u64 bpf_arena_get_user_vm_start(struct bpf_arena *arena)
  2976	{
  2977		return 0;
  2978	}
> 2979	__weak u64 bpf_arena_get_kern_vm_start(struct bpf_arena *arena)
  2980	{
  2981		return 0;
  2982	}
  2983	#endif
  2984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
