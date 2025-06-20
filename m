Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028372522A7;
	Fri, 20 Jun 2025 14:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430731; cv=none; b=gL+hPQP5rvQI/fUfRYNollr1xg/oW9URy3oGP8YsDVC0MGALyxdLAD3skLR/djfaMTu2ELhd/R1nwOQJzVUIhxMXbzFkm5gfOfSZioNEF9uo4W3KrbIwM9PStLkmEq6vnLF28hdngljH0oM3rKgkS8BsUhAQbgseV5/0xFrJcKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430731; c=relaxed/simple;
	bh=tmYILQMyswj4/c1RXNvxqk5R6MLTLM6z2i7/gxVuVcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W/TSrUeZPqisgyXMC1PnTc8rn70pVaDHgeiI3nw35OYkQ7Iksj7IK0wHeiqGNmZbsAXHj8R6zfFHVlS5TmQiQcPNejIkR4f33u+MORH1KSGm35Y0Cp8LaQtBZI0DRzW3tf2vYVqsSA6m5pZxNZQewCUazRjDvli4IOQ/ifRZFBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CG8Ttn9P; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CG8Ttn9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750430730; x=1781966730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tmYILQMyswj4/c1RXNvxqk5R6MLTLM6z2i7/gxVuVcQ=;
  b=CG8Ttn9PiykDteSrcSGoVQFZDkh6k8s0JqOKc6PdwfphTEg015LVvSxB
   H2YvoYNLhAznqdSHWWRDmikPjAQfYGeJTA0e1KRArrXjfcaWVtAnu1EQS
   aD3yT/URM/sIJKhy30W5VxukTODLfKzdj8gkfZ44oGv/tPdf++jwTJ93G
   xVoym5m6HmHQowwTVi2vpteZpP/Mae4xEoDjXwJUXE2lPeBl+FgTLYd3O
   /HNXegfGumKgEsAJ+Rl/0ida3B1CSBbn7bID/A3sxElURlMKPX2Razs5I
   kZ0huW89BmGMc1+sxPWXBwHGfKgXgTw6QlifKgmK4KqQlXW+fjDb7hMi1
   Q==;
X-CSE-ConnectionGUID: VAhF4gmiQ4qfDjnDSYZxgA==
X-CSE-MsgGUID: dtcBfrbdQBCZWN+VAU4zbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52786484"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="52786484"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 07:45:29 -0700
X-CSE-ConnectionGUID: xPfI23MvSNW5Q5vVSnkFUw==
X-CSE-MsgGUID: Ycr6TMT5SXuM0gXrm6Ci3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="150421309"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Jun 2025 07:45:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSczd-000Lr0-0P;
	Fri, 20 Jun 2025 14:45:25 +0000
Date: Fri, 20 Jun 2025 22:44:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 10/10]
 kernel/bpf/trampoline.c:195:19: error: variable has incomplete type 'struct
 ftrace_ops'
Message-ID: <202506202232.4jCtsKLX-lkp@intel.com>
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
commit: b288c6b15d20122d59ddf3bce2fb86afe6ed56c3 [10/10] bpf: Remove ftrace_ops from bpf_trampoline object
config: x86_64-buildonly-randconfig-003-20250620 (https://download.01.org/0day-ci/archive/20250620/202506202232.4jCtsKLX-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506202232.4jCtsKLX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506202232.4jCtsKLX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bpf/trampoline.c:6:
   include/linux/ftrace.h:567:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     567 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:567:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     567 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:572:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     572 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:572:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     572 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:577:5: warning: no previous prototype for function 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     577 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         |     ^
   include/linux/ftrace.h:577:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     577 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         | ^
         | static 
>> kernel/bpf/trampoline.c:195:19: error: variable has incomplete type 'struct ftrace_ops'
     195 | struct ftrace_ops direct_ops = {
         |                   ^
   include/linux/bpf.h:55:8: note: forward declaration of 'struct ftrace_ops'
      55 | struct ftrace_ops;
         |        ^
   3 warnings and 1 error generated.


vim +195 kernel/bpf/trampoline.c

   194	
 > 195	struct ftrace_ops direct_ops = {
   196	#ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
   197	       .ops_func = bpf_tramp_ftrace_ops_func,
   198	#endif
   199	};
   200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
