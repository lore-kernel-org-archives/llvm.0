Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9382427F18F;
	Fri, 15 Aug 2025 06:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755239220; cv=none; b=TkypG8NhljAz7gyWqztVRLlEsDuuxTKLOQKPr7x5oD/445teNJy/nCo+YSA80yPSZd1f2FuX1sm3P6rKx0RjT967UNQqqQXhWqySLIwtji7GKXscDmCJ4DJ9S2gsYbdD9DmBz+RKnra9OaH3BYoI05VuoYwMXMOBYDvLY/zLsg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755239220; c=relaxed/simple;
	bh=Uxy8jyCJuQJDoOvh+L84ywBbtTD0UVC1K7NekXCDgms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l/kCwE4aJODSnZihN5O8YMHzpvpI6lh59y7Ah/XeR9WZnG7R+LYZ73H+CJHpslvC07rKknwmm1ijx15mebLUJe3/TWC0FJDSkMEL3pyrhHspTJKZZhFXrwtmVVDOk9IFfebn6+87lw+Pd5Yo8Ih210QAileP0eLFxccygyjINrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpLqyfks; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpLqyfks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755239219; x=1786775219;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uxy8jyCJuQJDoOvh+L84ywBbtTD0UVC1K7NekXCDgms=;
  b=fpLqyfkswNXPsO4QeTKkS0daEoYBYO0ZvCtGhibqtpyVY4NFT4Vwbie0
   PfglQABxXNmhNwA1J5qqEPr7UinM7YXLIVvBU4bB/kmhs8JVzNxH7y4qP
   Qi8ZqGkAHTNuzjDiHhPowDjyL7gCh9NV2HwzYu3VMFfpGqqMCVYIhCZxa
   Vcvetx2Zk99TRtO4KeFvzlPZZlPPPyH24X00iJmYnVKW07/zHBDge+99q
   BGyyXPQwhkqimNans2+SW6g345HiPcglRR/Jit5VzRNVvgeeRuCen9RZ5
   TeV33tVqtj3AefcmMOZu1yINYtsCpqXZ6rIs/TfPy35oCKNSTHm0kVKyp
   Q==;
X-CSE-ConnectionGUID: KwgE0qTcSZOlrOQg+TrFnw==
X-CSE-MsgGUID: p6SK8LJjQ76U7gueHmf08g==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68650256"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68650256"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 23:26:59 -0700
X-CSE-ConnectionGUID: us9KEMXFTn2jzC2XbidVdg==
X-CSE-MsgGUID: UT1B3xepTySM2iobe379ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="197796197"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 14 Aug 2025 23:26:57 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umntu-000Bdo-38;
	Fri, 15 Aug 2025 06:26:54 +0000
Date: Fri, 15 Aug 2025 14:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: Vernon Yang <vernon2gm@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 6/7] mm: memory: add mTHP support for wp
Message-ID: <202508151424.3vsVTwI0-lkp@intel.com>
References: <20250814113813.4533-7-vernon2gm@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814113813.4533-7-vernon2gm@gmail.com>

Hi Vernon,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vernon-Yang/mm-memory-replace-single-operation-with-multi-operation-in-wp/20250814-195529
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250814113813.4533-7-vernon2gm%40gmail.com
patch subject: [RFC PATCH 6/7] mm: memory: add mTHP support for wp
config: arm-randconfig-002-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151424.3vsVTwI0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151424.3vsVTwI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508151424.3vsVTwI0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memory.c:3466:10: error: call to undeclared function 'copy_user_large_folio'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3466 |                 return copy_user_large_folio(dst, src, offset, vmf->address, vma);
         |                        ^
>> mm/memory.c:3470:9: error: call to undeclared function 'copy_folio_from_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3470 |         return copy_folio_from_user(dst, uaddr, 0);
         |                ^
   mm/memory.c:3470:9: note: did you mean 'copy_siginfo_from_user'?
   include/linux/signal.h:37:5: note: 'copy_siginfo_from_user' declared here
      37 | int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from);
         |     ^
   2 errors generated.


vim +/copy_user_large_folio +3466 mm/memory.c

  3457	
  3458	static inline int __wp_folio_copy_user(struct folio *dst, struct folio *src,
  3459					       unsigned int offset,
  3460					       struct vm_fault *vmf)
  3461	{
  3462		struct vm_area_struct *vma = vmf->vma;
  3463		void __user *uaddr;
  3464	
  3465		if (likely(src))
> 3466			return copy_user_large_folio(dst, src, offset, vmf->address, vma);
  3467	
  3468		uaddr = (void __user *)ALIGN_DOWN(vmf->address, folio_size(dst));
  3469	
> 3470		return copy_folio_from_user(dst, uaddr, 0);
  3471	}
  3472	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
