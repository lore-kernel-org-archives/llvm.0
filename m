Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D47A2A;
	Thu,  2 Feb 2023 05:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675314866; x=1706850866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXF7e0JfYIaDvNGq9FhdrZmF5C7IEsEImR4aqCwLtw8=;
  b=N2XIsIC/hd83vKNja2DJYlxjfcxYC70Iegxf0cy+iH8sdgVkHgsGpzzm
   qrNx6iagsFoRbJ69xtd9+ndcCIniHeJahTQPE+w387fytoXqFUjYDwHHe
   LnsqgMyGkd2Vk03hUbYswYhB6NSEC00pEKK2rHDihQQ8ZYPAw9OsthNwE
   JD9s+B7FRU5AhgOW14zMK0e2jwwKupb83BC39bcINry/TnJ5NqaAQ+dyN
   s5uq1ZkUPZQQl8WV/a5b58HXNAPq6AdjUGJMo33HLorbfE7xPru04qkW6
   1GVxo5q0xZxtGIR6kkJLLPgoUWK3O6LaeohJvtqMii8h/+GOtVncEojtw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="392935639"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="392935639"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 21:14:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="839049661"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="839049661"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 01 Feb 2023 21:14:14 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNRvG-0006B5-2k;
	Thu, 02 Feb 2023 05:14:10 +0000
Date: Thu, 2 Feb 2023 13:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 9528/10104] mm/kasan/report.c:272:44: warning:
 format specifies type 'unsigned long' but the argument has type 'size_t'
 (aka 'unsigned int')
Message-ID: <202302021325.700zGa0M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ea4dabbb4ad7eb52632a2ca0b8f89f0ea7c55dcf
commit: 088dec22162732a23b30e58191eeb443d5795fbe [9528/10104] kasan: infer allocation size by scanning metadata
config: powerpc-randconfig-r015-20230130 (https://download.01.org/0day-ci/archive/20230202/202302021325.700zGa0M-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=088dec22162732a23b30e58191eeb443d5795fbe
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 088dec22162732a23b30e58191eeb443d5795fbe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash mm/kasan/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/kasan/report.c:272:44: warning: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
                  rel_bytes, rel_type, region_state, info->alloc_size,
                                                     ^~~~~~~~~~~~~~~~
   include/linux/printk.h:500:33: note: expanded from macro 'pr_err'
           printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                                  ~~~     ^~~~~~~~~~~
   include/linux/printk.h:457:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                       ~~~    ^~~~~~~~~~~
   include/linux/printk.h:429:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                           ~~~~    ^~~~~~~~~~~
   mm/kasan/report.c:143:20: warning: unused function 'kasan_kunit_test_suite_executing' [-Wunused-function]
   static inline bool kasan_kunit_test_suite_executing(void) { return false; }
                      ^
   2 warnings generated.


vim +272 mm/kasan/report.c

   233	
   234	static void describe_object_addr(const void *addr, struct kasan_report_info *info)
   235	{
   236		unsigned long access_addr = (unsigned long)addr;
   237		unsigned long object_addr = (unsigned long)info->object;
   238		const char *rel_type, *region_state = "";
   239		int rel_bytes;
   240	
   241		pr_err("The buggy address belongs to the object at %px\n"
   242		       " which belongs to the cache %s of size %d\n",
   243			info->object, info->cache->name, info->cache->object_size);
   244	
   245		if (access_addr < object_addr) {
   246			rel_type = "to the left";
   247			rel_bytes = object_addr - access_addr;
   248		} else if (access_addr >= object_addr + info->alloc_size) {
   249			rel_type = "to the right";
   250			rel_bytes = access_addr - (object_addr + info->alloc_size);
   251		} else {
   252			rel_type = "inside";
   253			rel_bytes = access_addr - object_addr;
   254		}
   255	
   256		/*
   257		 * Tag-Based modes use the stack ring to infer the bug type, but the
   258		 * memory region state description is generated based on the metadata.
   259		 * Thus, defining the region state as below can contradict the metadata.
   260		 * Fixing this requires further improvements, so only infer the state
   261		 * for the Generic mode.
   262		 */
   263		if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
   264			if (strcmp(info->bug_type, "slab-out-of-bounds") == 0)
   265				region_state = "allocated ";
   266			else if (strcmp(info->bug_type, "slab-use-after-free") == 0)
   267				region_state = "freed ";
   268		}
   269	
   270		pr_err("The buggy address is located %d bytes %s of\n"
   271		       " %s%lu-byte region [%px, %px)\n",
 > 272		       rel_bytes, rel_type, region_state, info->alloc_size,
   273		       (void *)object_addr, (void *)(object_addr + info->alloc_size));
   274	}
   275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
