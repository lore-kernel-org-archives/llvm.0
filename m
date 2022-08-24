Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19FB7E
	for <llvm@lists.linux.dev>; Wed, 24 Aug 2022 00:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661300053; x=1692836053;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tpvFWDJS6JfTa0cgLW/rmuc7c/o/TOUDXTugWUlmYMw=;
  b=R7NTwJRecXN2bkVdaORuAPtSBdOtm8i3oG/gLzAaU6ZBMbpWaH94Ac0T
   +F+4EjfGyEsiwG5N71Gsg0tltgzN2fjm97rjhPuCCXZENZPX0BoX4iZz7
   X4Cwn9ibc/3L7FqW4gJOKPQqNjGgIx1V3KfJAU11DFjkQXT9qH3G65I2k
   ItKROjubcDTkDCkMac4g4QNzTO5dEm3T8SKWnOssX6xJuttRByLxv7lOA
   Lm4BPgbR3/2Q19rh8sXjH2C9inD95mELQmbHGqdkOdKzCAbKHmpgeuzIp
   2VpjrFaFSJk/d6sPZCefFiOZXrU+CZq79OG8yHxGzkapahLZ8Xw2bkXb3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="355556241"
X-IronPort-AV: E=Sophos;i="5.93,259,1654585200"; 
   d="scan'208";a="355556241"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2022 17:14:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,259,1654585200"; 
   d="scan'208";a="560378404"
Received: from lkp-server02.sh.intel.com (HELO 9bbcefcddf9f) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 23 Aug 2022 17:14:11 -0700
Received: from kbuild by 9bbcefcddf9f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oQe27-0000kF-0b;
	Wed, 24 Aug 2022 00:14:11 +0000
Date: Wed, 24 Aug 2022 08:13:38 +0800
From: kernel test robot <lkp@intel.com>
To: Hyeonggon Yoo <42.hyeyoo@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@suse.cz>
Subject: [vbabka-slab:for-6.1/common_kmalloc 12/17] mm/slab_common.c:1023:7:
 warning: no previous prototype for function '__kmalloc_large_node'
Message-ID: <202208240825.lwZks9Hg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git for-6.1/common_kmalloc
head:   b261334803b44092acd06be3c9f32c46af818359
commit: 79c7527b9805edf14c952deca45de60a8a06a414 [12/17] mm/sl[au]b: generalize kmalloc subsystem
config: s390-randconfig-r044-20220823 (https://download.01.org/0day-ci/archive/20220824/202208240825.lwZks9Hg-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project b04d01c009d7f66bcca9138d2ce40999eedf104d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git/commit/?id=79c7527b9805edf14c952deca45de60a8a06a414
        git remote add vbabka-slab git://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
        git fetch --no-tags vbabka-slab for-6.1/common_kmalloc
        git checkout 79c7527b9805edf14c952deca45de60a8a06a414
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/slab_common.c:1023:7: warning: no previous prototype for function '__kmalloc_large_node' [-Wmissing-prototypes]
   void *__kmalloc_large_node(size_t size, gfp_t flags, int node)
         ^
   mm/slab_common.c:1023:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void *__kmalloc_large_node(size_t size, gfp_t flags, int node)
   ^
   static 
   1 warning generated.


vim +/__kmalloc_large_node +1023 mm/slab_common.c

  1016	
  1017	/*
  1018	 * To avoid unnecessary overhead, we pass through large allocation requests
  1019	 * directly to the page allocator. We use __GFP_COMP, because we will need to
  1020	 * know the allocation order to free the pages properly in kfree.
  1021	 */
  1022	
> 1023	void *__kmalloc_large_node(size_t size, gfp_t flags, int node)
  1024	{
  1025		struct page *page;
  1026		void *ptr = NULL;
  1027		unsigned int order = get_order(size);
  1028	
  1029		if (unlikely(flags & GFP_SLAB_BUG_MASK))
  1030			flags = kmalloc_fix_flags(flags);
  1031	
  1032		flags |= __GFP_COMP;
  1033		page = alloc_pages_node(node, flags, order);
  1034		if (page) {
  1035			ptr = page_address(page);
  1036			mod_lruvec_page_state(page, NR_SLAB_UNRECLAIMABLE_B,
  1037					      PAGE_SIZE << order);
  1038		}
  1039	
  1040		ptr = kasan_kmalloc_large(ptr, size, flags);
  1041		/* As ptr might get tagged, call kmemleak hook after KASAN. */
  1042		kmemleak_alloc(ptr, size, 1, flags);
  1043	
  1044		return ptr;
  1045	}
  1046	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
