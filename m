Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E4319CC2E;
	Wed,  5 Mar 2025 04:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741148069; cv=none; b=GlCy7znOeljU+yL9fBEoBiOo514JwBgRe7TSPvzlA/0I4tiO7xsqmiPZpbfud0kxQdWeTOKJPbFaB7kFqBjX72PrwQjijMGV8AzOnr5YT3C1QsM9QfY1qZDoe762KvwqQ+sg19PErgzwlZrLq6K3xjinOQSJf83bhX9Zxe4sm0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741148069; c=relaxed/simple;
	bh=YVo5zjdnG3PFXPuBFidkC29jzE13TUWifC6rd23OT+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9KvurrP4Vcdwa50C7ZKeuYBj3AXPe/K7puqPJeFmKtJ0ZgvIgRaWHcjNw44+hHu39pmbNyz58W8gs89PwC2uLegWO86NCOl7YMX/WOim7x9GzOlbg6saHg5j5bZQr20PZwLhkXgZNryr7XfKS3UbH/W2mFFD+M9djakbRPiv8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GeFDERPV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GeFDERPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741148068; x=1772684068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YVo5zjdnG3PFXPuBFidkC29jzE13TUWifC6rd23OT+Y=;
  b=GeFDERPV6duu0tqvFkU7/0QaBK6hx1xlYk31QYGvwC3eH6Lrcm/AtGWI
   GugTP8lWOnzcr80mbAJUhF7tCHnGrMPdvyd0GupGBuY0K27YPKZuQAGl9
   cnK8gUhjsy8iohD+1XQQDWYGa9i857FJ0wN7Y0NeyydCYTzghrahHkFzz
   Rj+454mlk63548fBw0U/A4IzOzk989JAAM6A2/BSxzN8Ftpu8ucyljcyw
   hslettbPyTxHZqpl2Pw6kJxMF12Y4ZA0sldg9KuCtFhlIR5BeG8VaRE2y
   IJg1NLSfEmSii2hl+MEyJiPt5H/EmuUVJV5H8nPBaMYSrVocV61A4XUhk
   w==;
X-CSE-ConnectionGUID: D4vhWeazQPuD3rLMAXi15Q==
X-CSE-MsgGUID: EVVIbDGIRWSwBkAX+M1bGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41806649"
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="41806649"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 20:14:21 -0800
X-CSE-ConnectionGUID: o4dylf/JTzGmuMZ89OuATw==
X-CSE-MsgGUID: r15n9EP3Sj6WdOA7m/L9Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,222,1736841600"; 
   d="scan'208";a="149349837"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Mar 2025 20:14:21 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpg9B-000KZy-1h;
	Wed, 05 Mar 2025 04:14:17 +0000
Date: Wed, 5 Mar 2025 12:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: Tingmao Wang <m@maowtm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/9] Define user structure for events and responses.
Message-ID: <202503051149.MimDe0ds-lkp@intel.com>
References: <cde6bbf0b52710b33170f2787fdcb11538e40813.1741047969.git.m@maowtm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cde6bbf0b52710b33170f2787fdcb11538e40813.1741047969.git.m@maowtm.org>

Hi Tingmao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc5 next-20250304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tingmao-Wang/Define-the-supervisor-and-event-structure/20250304-092354
base:   linus/master
patch link:    https://lore.kernel.org/r/cde6bbf0b52710b33170f2787fdcb11538e40813.1741047969.git.m%40maowtm.org
patch subject: [RFC PATCH 5/9] Define user structure for events and responses.
config: i386-buildonly-randconfig-003-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051149.MimDe0ds-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051149.MimDe0ds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051149.MimDe0ds-lkp@intel.com/

All errors (new ones prefixed by >>):

>> security/landlock/syscalls.c:137:2: error: call to '__compiletime_assert_358' declared with 'error' attribute: BUILD_BUG_ON failed: __alignof__(typeof(*event)) != 8
     137 |         BUILD_BUG_ON(__alignof__(typeof(*event)) != 8);
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   include/linux/compiler_types.h:542:2: note: expanded from macro 'compiletime_assert'
     542 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:530:2: note: expanded from macro '_compiletime_assert'
     530 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:523:4: note: expanded from macro '__compiletime_assert'
     523 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:137:1: note: expanded from here
     137 | __compiletime_assert_358
         | ^
   1 error generated.


vim +137 security/landlock/syscalls.c

    82	
    83	/*
    84	 * This function only contains arithmetic operations with constants, leading to
    85	 * BUILD_BUG_ON().  The related code is evaluated and checked at build time,
    86	 * but it is then ignored thanks to compiler optimizations.
    87	 */
    88	static void build_check_abi(void)
    89	{
    90		struct landlock_ruleset_attr ruleset_attr;
    91		struct landlock_path_beneath_attr path_beneath_attr;
    92		struct landlock_net_port_attr net_port_attr;
    93		size_t ruleset_size, path_beneath_size, net_port_size;
    94		struct landlock_supervise_event *event;
    95		struct landlock_supervise_response response;
    96		size_t supervise_evt_size, supervise_response_size;
    97	
    98		/*
    99		 * For each user space ABI structures, first checks that there is no
   100		 * hole in them, then checks that all architectures have the same
   101		 * struct size.
   102		 */
   103		ruleset_size = sizeof(ruleset_attr.handled_access_fs);
   104		ruleset_size += sizeof(ruleset_attr.handled_access_net);
   105		ruleset_size += sizeof(ruleset_attr.scoped);
   106		ruleset_size += sizeof(ruleset_attr.supervisor_fd);
   107		ruleset_size += sizeof(ruleset_attr.pad);
   108		BUILD_BUG_ON(sizeof(ruleset_attr) != ruleset_size);
   109		BUILD_BUG_ON(sizeof(ruleset_attr) != 32);
   110	
   111		path_beneath_size = sizeof(path_beneath_attr.allowed_access);
   112		path_beneath_size += sizeof(path_beneath_attr.parent_fd);
   113		BUILD_BUG_ON(sizeof(path_beneath_attr) != path_beneath_size);
   114		BUILD_BUG_ON(sizeof(path_beneath_attr) != 12);
   115	
   116		net_port_size = sizeof(net_port_attr.allowed_access);
   117		net_port_size += sizeof(net_port_attr.port);
   118		BUILD_BUG_ON(sizeof(net_port_attr) != net_port_size);
   119		BUILD_BUG_ON(sizeof(net_port_attr) != 16);
   120	
   121		/* Check that anything before the destname does not have holes */
   122		supervise_evt_size = sizeof(event->hdr.type);
   123		supervise_evt_size += sizeof(event->hdr.length);
   124		supervise_evt_size += sizeof(event->hdr.cookie);
   125		BUILD_BUG_ON(offsetofend(typeof(*event), hdr) != 8);
   126		supervise_evt_size += sizeof(event->access_request);
   127		supervise_evt_size += sizeof(event->accessor);
   128		supervise_evt_size += sizeof(event->fd1);
   129		supervise_evt_size += sizeof(event->fd2);
   130		BUILD_BUG_ON(offsetof(typeof(*event), destname) != supervise_evt_size);
   131		BUILD_BUG_ON(offsetof(typeof(*event), destname) != 28);
   132	
   133		/*
   134		 * Make sure this struct does not end up with stricter
   135		 * alignment than 8
   136		 */
 > 137		BUILD_BUG_ON(__alignof__(typeof(*event)) != 8);
   138	
   139		supervise_response_size = sizeof(response.length);
   140		supervise_response_size += sizeof(response.decision);
   141		supervise_response_size += sizeof(response._reserved);
   142		supervise_response_size += sizeof(response.cookie);
   143		BUILD_BUG_ON(sizeof(response) != supervise_response_size);
   144		BUILD_BUG_ON(sizeof(response) != 8);
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
