Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9ED193;
	Thu, 24 Aug 2023 02:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692845636; x=1724381636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TLM5axGSvoG+xKjd8kE0P9Us0tPfrfspzerS4LQW4Zo=;
  b=AFAgp+HN2tdu7TJk/E+t80k2S6ZT5fr+A74ZhYLeP7g1pYIYzSjOt+Gj
   DfOK0N7nUeIlXWonV6BSwOk6crdTbibD5nC7CskiXxBKBMQ9qhrlusEAa
   F1by9aw/m6ZJ5YmAF872MJNVZH6MTOvhK52UWlfyCzt+pcFKaC+0RM5fW
   82ZYuzzBQfM3oo4L5bnGuXuN5xbzIVbzUi3elBPNyePu4oICmFAhfJ7sq
   0mrGWjjYes6zgetl1Ok5XEjGzN8zPQjRdtuPOySI+V6EjyiPCaIqYitM1
   3hW+RzV9mZ/fl6rKpjywFQVrZi2mQSfVCk8ZWkJP1It6amLz/tl9WruUT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="359311710"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="359311710"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 19:53:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="740005726"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="740005726"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Aug 2023 19:53:47 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZ0Ti-0001hg-2a;
	Thu, 24 Aug 2023 02:53:46 +0000
Date: Thu, 24 Aug 2023 10:53:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] mm: Add vmalloc_user_node()
Message-ID: <202308241004.yfJbE1jh-lkp@intel.com>
References: <20230821202016.2910321-3-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821202016.2910321-3-willy@infradead.org>

Hi Matthew,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on acme/perf/core]
[also build test ERROR on tip/perf/core akpm-mm/mm-everything linus/master v6.5-rc7 next-20230823]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/perf-Convert-perf_mmap_-alloc-free-_page-to-folios/20230822-042131
base:   https://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git perf/core
patch link:    https://lore.kernel.org/r/20230821202016.2910321-3-willy%40infradead.org
patch subject: [RFC PATCH 2/4] mm: Add vmalloc_user_node()
config: arm-randconfig-r031-20230824 (https://download.01.org/0day-ci/archive/20230824/202308241004.yfJbE1jh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230824/202308241004.yfJbE1jh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308241004.yfJbE1jh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/nommu.c:184:7: error: conflicting types for 'vmalloc_user'
     184 | void *vmalloc_user(unsigned long size)
         |       ^
   include/linux/vmalloc.h:171:21: note: previous definition is here
     171 | static inline void *vmalloc_user(size_t size)
         |                     ^
   1 error generated.


vim +/vmalloc_user +184 mm/nommu.c

ed81745a4c9684 Andrii Nakryiko 2019-11-23  183  
ed81745a4c9684 Andrii Nakryiko 2019-11-23 @184  void *vmalloc_user(unsigned long size)
ed81745a4c9684 Andrii Nakryiko 2019-11-23  185  {
ed81745a4c9684 Andrii Nakryiko 2019-11-23  186  	return __vmalloc_user_flags(size, GFP_KERNEL | __GFP_ZERO);
ed81745a4c9684 Andrii Nakryiko 2019-11-23  187  }
f905bc447c303f Paul Mundt      2008-02-04  188  EXPORT_SYMBOL(vmalloc_user);
f905bc447c303f Paul Mundt      2008-02-04  189  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
