Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E694922688B;
	Fri, 20 Jun 2025 11:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750418169; cv=none; b=rD970V+JmrN3cmfcYi/Yaq1IfMaMZmrlLj9X15yMHHt+fXIwhwFtWzibYB8l1llRxpzdWAHvEYNApdlHG0pzKl8MHf56C7SCG1x7O25zO45xrwhihQ/4lyDCLuYaIDkJJbGjmO/VuFb83lyK3mbSEtrwSzl5t6QvZn5c+dmmu10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750418169; c=relaxed/simple;
	bh=ylTiiioxaGg78B210EosFyifUYRTKWVznfNqfOSYtAI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V74HsJY04AVUSwvWPPVt+3h9KU+8k1VyqySSqzrxNrvH8EwjoRI89jOXCT2pt0hn/pmB+EgiUSxZIBEg2Z9eFrI9WdZ29eYtUnKEbJe2jlxumtSTKsTRQx/e5Wdl6nvQo4NBUc3ML8xZN9cU88sRHXmPr1aTmKT8DT1GV9btjB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jlUaK0Hr; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jlUaK0Hr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750418168; x=1781954168;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ylTiiioxaGg78B210EosFyifUYRTKWVznfNqfOSYtAI=;
  b=jlUaK0HrXFnRZhNVutHzXdfjHlm4a8G4PFea5a0gu2yA6+G1sPTz7+xg
   4yvrnP4b/IfUHTq1OiRp2P1SFopDi0DKuubvxeSf4qFOpxxQiXjwWKn8q
   eSv6Cr5ZHnR6FrttMLUzu/MMDtr/RNi072m6KJGAjoGhn1j44pZOFaOm3
   VzJcJZ9qAqVGmLXL5u6xynAyUGApyK4wzzT3/zhVXI4Y8yoJCqHwQxTOd
   uhDRDYWzh5cO1L+WR7RcKDwrIvWcrLB88qvkkfU3YxSlLC0jYjrOve2uJ
   z5LvvZm8pXNt6MfR1DXeVc1YEpFWgjqSjQIb+t7zaVA7cBIShV8nK0cwt
   Q==;
X-CSE-ConnectionGUID: BDWW2KfKT9CYlnee/eQ2dg==
X-CSE-MsgGUID: FYesm7w2R8CryVDlmRvrNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="64109402"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="64109402"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 04:16:07 -0700
X-CSE-ConnectionGUID: gZxrESXiRKCPTbqf5xG4xQ==
X-CSE-MsgGUID: DizxzOdlS12Vs7m7M1g52g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="188100687"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jun 2025 04:16:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSZj1-000Lfd-0I;
	Fri, 20 Jun 2025 11:16:03 +0000
Date: Fri, 20 Jun 2025 19:15:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 4/10] include/linux/ftrace.h:569:5:
 warning: no previous prototype for function 'modify_ftrace_direct_hash'
Message-ID: <202506201922.EbUiAB8s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   b288c6b15d20122d59ddf3bce2fb86afe6ed56c3
commit: 2f2d7e228b3f129edb4cefbc6c20dff3ea5b8d87 [4/10] ftrace: Add modify_ftrace_direct_hash function
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250620/202506201922.EbUiAB8s-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201922.EbUiAB8s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201922.EbUiAB8s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:25:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:559:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     559 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:559:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     559 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:564:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     564 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:564:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     564 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:569:5: warning: no previous prototype for function 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     569 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         |     ^
   include/linux/ftrace.h:569:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     569 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         | ^
         | static 
   3 warnings generated.
--
   In file included from mm/shmem.c:77:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:559:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     559 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:559:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     559 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:564:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     564 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:564:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     564 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:569:5: warning: no previous prototype for function 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     569 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         |     ^
   include/linux/ftrace.h:569:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     569 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         | ^
         | static 
   mm/shmem.c:1686:20: warning: unused function 'shmem_show_mpol' [-Wunused-function]
    1686 | static inline void shmem_show_mpol(struct seq_file *seq, struct mempolicy *mpol)
         |                    ^~~~~~~~~~~~~~~
   4 warnings generated.


vim +/modify_ftrace_direct_hash +569 include/linux/ftrace.h

   568	
 > 569	int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
   570	{
   571		return -ENODEV;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
