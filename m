Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC2E2AF04;
	Sat, 12 Apr 2025 01:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744420457; cv=none; b=dJPUL26H7Sh/VLle+aH60KxCABSXPwo3gW1yxxe3GWdCUnomcmdJ1xQJIbWYSPQu1w9TtkFXMQkKYlbliokO3FdOu3JKy9YoWosmlsQkdQq23n6JlSsDa1qgxZfk2bLZYK0RCmhL2SSInv0Jcik4J9ch2w4DySLaDlGHBlfxyeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744420457; c=relaxed/simple;
	bh=t/lDAr1QSYlXNpMgCMF7pCItkdllxRMYVnOc7ffvJho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caZG21+seoB5NgrhKuqwi9K6pa0p+uJB6kpPzXLkeoMwGGYvvQmMLvZ7JkNfWiUXunCUUH6D8CAz2A72PTdxPorDU6beiwzEmMLsLVSkvYH6ik7UmQDltPxTKzBxxA0f8PW7s1H00B6Y8ECFNjf151+zK/Qp29+3izSBVtNLjec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fu6DjhR1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fu6DjhR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744420455; x=1775956455;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t/lDAr1QSYlXNpMgCMF7pCItkdllxRMYVnOc7ffvJho=;
  b=Fu6DjhR1gDtIkwZOtND9+7DKFHFLVi2nqTmFc6CshIsaWYDAetyQmQFk
   i+L+ywj1q5AL8N3zilJXYTGkennTp+KHGVKZW7c9BwYrPAWNVj3liDzPb
   T6ihegSNa2EutxbR73shA9PONmHZvCzOKYHSPNVDWLqp9ub4510bvcUEh
   iqY8gAUpN5lGiB2WODjvpkRaaRpM+tcKOpwunTlVYafVpgKYeqt4JsunK
   lWSIlbhY7HCrjNdFbmxpns9svUgHd+/18XzUF+UJT54eeTkRPy/x5fZJ+
   uB2WIAxn4lATu9pnOFx8wGYmmQ12xsPqaUNxfPdPo6euj3P/oPko3bcCJ
   A==;
X-CSE-ConnectionGUID: dY/EgqqVQhi8HjIur/17OQ==
X-CSE-MsgGUID: /ambCbJaQ2qVvMzAmrFeyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="56961815"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="56961815"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 18:14:14 -0700
X-CSE-ConnectionGUID: AKGxcc6AQjWADuAOqt/vPA==
X-CSE-MsgGUID: 31ZU/4yQTc2j7zfuf4xB0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="130322254"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Apr 2025 18:14:14 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3PRj-000BUQ-1A;
	Sat, 12 Apr 2025 01:14:11 +0000
Date: Sat, 12 Apr 2025 09:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 1/4] cgroup: Add bpf prog revisions to
 struct cgroup_bpf
Message-ID: <202504120859.YZRdhT38-lkp@intel.com>
References: <20250411011528.1839359-1-yonghong.song@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411011528.1839359-1-yonghong.song@linux.dev>

Hi Yonghong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/cgroup-Add-bpf-prog-revisions-to-struct-cgroup_bpf/20250411-091743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250411011528.1839359-1-yonghong.song%40linux.dev
patch subject: [RFC PATCH bpf-next 1/4] cgroup: Add bpf prog revisions to struct cgroup_bpf
config: x86_64-buildonly-randconfig-004-20250412 (https://download.01.org/0day-ci/archive/20250412/202504120859.YZRdhT38-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504120859.YZRdhT38-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504120859.YZRdhT38-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/cgroup/cgroup.c:2074:39: error: no member named 'revisions' in 'struct cgroup_bpf'
    2074 |         for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
         |                                    ~~~~~~~~~ ^
   include/linux/array_size.h:11:33: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
>> kernel/cgroup/cgroup.c:2074:39: error: no member named 'revisions' in 'struct cgroup_bpf'
    2074 |         for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
         |                                    ~~~~~~~~~ ^
   include/linux/array_size.h:11:48: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                ^~~
>> kernel/cgroup/cgroup.c:2074:39: error: no member named 'revisions' in 'struct cgroup_bpf'
    2074 |         for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
         |                                    ~~~~~~~~~ ^
   include/linux/array_size.h:11:75: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                                           ^~~
   include/linux/compiler.h:202:64: note: expanded from macro '__must_be_array'
     202 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
         |                                                                     ^
   include/linux/compiler.h:201:39: note: expanded from macro '__is_array'
     201 | #define __is_array(a)           (!__same_type((a), &(a)[0]))
         |                                                ^
   include/linux/compiler_types.h:498:63: note: expanded from macro '__same_type'
     498 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                               ^
   include/linux/compiler.h:197:79: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
     197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                               ^
   kernel/cgroup/cgroup.c:2075:27: error: no member named 'revisions' in 'struct cgroup_bpf'
    2075 |                 atomic64_set(&cgrp->bpf.revisions[i], 1);
         |                               ~~~~~~~~~ ^
   4 errors generated.


vim +2074 kernel/cgroup/cgroup.c

  2052	
  2053	static void init_cgroup_housekeeping(struct cgroup *cgrp)
  2054	{
  2055		struct cgroup_subsys *ss;
  2056		int i, ssid;
  2057	
  2058		INIT_LIST_HEAD(&cgrp->self.sibling);
  2059		INIT_LIST_HEAD(&cgrp->self.children);
  2060		INIT_LIST_HEAD(&cgrp->cset_links);
  2061		INIT_LIST_HEAD(&cgrp->pidlists);
  2062		mutex_init(&cgrp->pidlist_mutex);
  2063		cgrp->self.cgroup = cgrp;
  2064		cgrp->self.flags |= CSS_ONLINE;
  2065		cgrp->dom_cgrp = cgrp;
  2066		cgrp->max_descendants = INT_MAX;
  2067		cgrp->max_depth = INT_MAX;
  2068		INIT_LIST_HEAD(&cgrp->rstat_css_list);
  2069		prev_cputime_init(&cgrp->prev_cputime);
  2070	
  2071		for_each_subsys(ss, ssid)
  2072			INIT_LIST_HEAD(&cgrp->e_csets[ssid]);
  2073	
> 2074		for (i = 0; i < ARRAY_SIZE(cgrp->bpf.revisions); i++)
  2075			atomic64_set(&cgrp->bpf.revisions[i], 1);
  2076	
  2077		init_waitqueue_head(&cgrp->offline_waitq);
  2078		INIT_WORK(&cgrp->release_agent_work, cgroup1_release_agent);
  2079	}
  2080	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
