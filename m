Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CDD1607A4;
	Fri,  7 Mar 2025 17:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741370200; cv=none; b=kkPb1So97l+QcIiU9HL0esP7oMO3ZrP93DNjzmk9cUe4L3H1FN2vjiLMjKtOKNhhYGNGynvDmKz3k59x6yhOLtVIxyozqo17WebCevqFx5CgfPvzvqrJv8qpp75R9gBjQoV/DaWfOTh/1NJ7+24NuIdxNXzQqam47icaoUwmxRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741370200; c=relaxed/simple;
	bh=v32ep8wQXLYDB9RMfVOjlCUuiFXNYEVja62Yb9wpOWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rvp9kBlA9dHfN5dCA0hJTZFoK/TlXqGNW1b7XZQMYtAL/LoIVkaPtF1QHF1nnRLHKizelYuc9xAQy1zfLeBQL+Duo1n48VsRDUyxLKpP65+R0x7wbZAuEvdHsTqgsEuM0oQVjZGqXV+GZPcGHEl4C6garN2QU1kaHTHXb4QaoZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nJwh1MwR; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nJwh1MwR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741370198; x=1772906198;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=v32ep8wQXLYDB9RMfVOjlCUuiFXNYEVja62Yb9wpOWM=;
  b=nJwh1MwRAHZ+liSnrpQlj5pEBgDqexMG/MYFxiqu5y3rnQkMW9L50ruf
   5Shxog8wEOcaTfxR+7P0tifdLh2E228ZMD4EV5UAmYSFufXn7LtOalAot
   QwXTb9WQzCkW3AQqe2xu5wXfuz5zmuaKuYuLCYUIvUGKAURoa3Iwtmexc
   D3L3lyrWnnPlAl6XHB5dFNVMcvZY1xnCSAl0uqHJ5UflKbmx3JSlbPytw
   mHyiY5wI/wpmdJl+Z3xAtlCqcUpHkRKtwxaBk7r4SFJK0NYs00fFGAhJN
   6c16OMJp5iKeiw4berhO4+onbGSK1C47DW34V662ZbMkl/TIGdlpG6de1
   Q==;
X-CSE-ConnectionGUID: aoxc72rbQ+OZFZQGWcFkAw==
X-CSE-MsgGUID: NIGJ7q8YSaWk0xtKWvpcsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42628544"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="42628544"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:56:34 -0800
X-CSE-ConnectionGUID: HH8jZ9sLTiKKfX9cT8D9lg==
X-CSE-MsgGUID: hWYQM+BpTy+mwO1PB9jgmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="150335665"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Mar 2025 09:56:32 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqbvy-0000t5-1I;
	Fri, 07 Mar 2025 17:56:30 +0000
Date: Sat, 8 Mar 2025 01:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: Bharata B Rao <bharata@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 4/4] x86: ibs: Enable IBS profiling for memory
 accesses
Message-ID: <202503080104.AHMWmR7w-lkp@intel.com>
References: <20250306054532.221138-5-bharata@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306054532.221138-5-bharata@amd.com>

Hi Bharata,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on tip/x86/mm linus/master v6.14-rc5]
[cannot apply to akpm-mm/mm-everything next-20250307]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Bharata-B-Rao/mm-migrate-Allow-misplaced-migration-without-VMA-too/20250306-134949
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/20250306054532.221138-5-bharata%40amd.com
patch subject: [RFC PATCH 4/4] x86: ibs: Enable IBS profiling for memory accesses
config: x86_64-buildonly-randconfig-005-20250307 (https://download.01.org/0day-ci/archive/20250308/202503080104.AHMWmR7w-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503080104.AHMWmR7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080104.AHMWmR7w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: do_syscall_64+0x11: call to hw_access_profiling_stop() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: do_int80_emulation+0x16: call to hw_access_profiling_stop() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_enter_from_user_mode_prepare+0x5: call to hw_access_profiling_stop() leaves .noinstr.text section
   vmlinux.o: warning: objtool: syscall_exit_to_user_mode+0xcc: call to hw_access_profiling_start() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_enter_from_user_mode+0x5: call to hw_access_profiling_stop() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_exit_to_user_mode+0xc2: call to hw_access_profiling_start() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_enter+0x1c: call to hw_access_profiling_stop() leaves .noinstr.text section
   vmlinux.o: warning: objtool: irqentry_nmi_exit+0x63: call to hw_access_profiling_start() leaves .noinstr.text section
   vmlinux.o: warning: objtool: ia32_setup_rt_frame+0x135: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: compat_get_bitmap+0xb3: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: compat_put_bitmap+0xb3: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp1+0xd: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp2+0x10: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp4+0x10: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_cmp8+0xf: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp1+0x10: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp2+0x10: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp4+0x10: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_const_cmp8+0xf: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: __sanitizer_cov_trace_switch+0x51: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: fault_in_writeable+0xae: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: fault_in_readable+0xb5: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: fillonedir+0x179: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: filldir+0x245: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: filldir64+0x244: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: compat_fillonedir+0x1ae: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: compat_filldir+0x28e: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_iovec_from_user+0x98: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: check_zeroed_user+0xce: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: strncpy_from_user+0x8a: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: strnlen_user+0xa7: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled
   vmlinux.o: warning: objtool: copy_mc_fragile_handle_tail+0x4d: call to write_comp_data.llvm.15977173092665352742() with UACCESS enabled

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
