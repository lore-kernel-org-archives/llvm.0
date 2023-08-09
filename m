Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6308363DF;
	Wed,  9 Aug 2023 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691586415; x=1723122415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FbYDNCYkMSpa9rrKwEV7u40XHpaYvLEw7RAiD2+K+F8=;
  b=LQJEkRzZOY9OA7pkI8dMxPtL2++Ag0OwSoOUVdsy6w2zxlNrG/+gjlrf
   1TAyBPF9Tx5k2alNB3d0L5uQaxJZyt6eAOU4cmFKj079AaNeOf4sBvkCA
   oHWkB8nuEKMb38m7K8it2XqqpzupT0+kNE5NIZGplZ+2mwhVATCYygjIs
   0UcGndQCDFQDKvnZ58LdnFimvL2QDakDNGlwhq7ZlhvPstrPy6PsbiArA
   umDuCOJfZjnzZhXGCbP4y3RAoyLeChk9sD5eAv9Rx0QENrQrpbE0t1sXb
   zpKyCpX8gmKz/7LkmEovc5Nx9jIgTqwzuQDZvUT1o6Sm1tdE62q7tR4TN
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="457483554"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="457483554"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 06:06:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="801751629"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="801751629"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Aug 2023 06:06:33 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTitU-00067Q-2E;
	Wed, 09 Aug 2023 13:06:32 +0000
Date: Wed, 9 Aug 2023 21:05:39 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 8173/8441] include/linux/list.h:53:13: error:
 '__preserve_most__' calling convention is not supported for this target
Message-ID: <202308092009.dDIMqss4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: fee8feb67f0b2954eb7a2a259122e43a15cf3a52 [8173/8441] list_debug: introduce CONFIG_DEBUG_LIST_MINIMAL
config: arm-randconfig-r005-20230809 (https://download.01.org/0day-ci/archive/20230809/202308092009.dDIMqss4-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308092009.dDIMqss4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308092009.dDIMqss4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tilcdc/tilcdc_external.c:10:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:28:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:12:
>> include/linux/list.h:53:13: error: '__preserve_most__' calling convention is not supported for this target [-Werror,-Wignored-attributes]
      53 | extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
         |             ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
      44 | # define __list_valid_slowpath __cold __preserve_most
         |                                       ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
     132 | # define __preserve_most notrace __attribute__((__preserve_most__))
         |                                                 ^
   In file included from drivers/gpu/drm/tilcdc/tilcdc_external.c:10:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:28:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:12:
   include/linux/list.h:96:13: error: '__preserve_most__' calling convention is not supported for this target [-Werror,-Wignored-attributes]
      96 | extern bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
         |             ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
      44 | # define __list_valid_slowpath __cold __preserve_most
         |                                       ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
     132 | # define __preserve_most notrace __attribute__((__preserve_most__))
         |                                                 ^
   2 errors generated.


vim +/__preserve_most__ +53 include/linux/list.h

    48	
    49	/*
    50	 * Performs the full set of list corruption checks before __list_add().
    51	 * On list corruption reports a warning, and returns false.
    52	 */
  > 53	extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
    54								     struct list_head *prev,
    55								     struct list_head *next);
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
