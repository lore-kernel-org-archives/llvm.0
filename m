Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7B9610E;
	Thu, 15 Jun 2023 09:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686822178; x=1718358178;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ozRaUnbT/BFkvq1xki+T0dmsx7lOQKo8VnV+xky8Rzs=;
  b=KAFfPYclOuV5WwPvy23cRl0bAgtQPxa5MbcHgyjJk19bOFNl4hs4WXn/
   FaKe2yffmqs61uoV0/08i+09gXXo9Goj54ZAowAv3S34Y6YoqeVhA4IL0
   C1iJ7G5j82W5+ZFzXLjFIHHx2wLMn7lCEDQepu6l6F2eMnYrctlQ8jV1e
   z9dbtcfAJOj/FhJxUvJEU4dDa2qnB/pN6xSHPa8BuuUnuFQ6+HT5m7AQA
   fYZbTKIXVRWXOWG9FjhRdK4c4mi+t0bISCm0vP3KMeL6wGngICf7o2c1U
   YshixIF0nmyQT5pcNaRIMunUbJiNHsuUhxdW1Nlxzxftwqp9aWknH3CT3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="424757864"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="424757864"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 02:42:54 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="745437414"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="745437414"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Jun 2023 02:42:53 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9jVE-0001i9-1H;
	Thu, 15 Jun 2023 09:42:52 +0000
Date: Thu, 15 Jun 2023 17:42:26 +0800
From: kernel test robot <lkp@intel.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] zsmalloc: charge the zspage's object to
 obj_cgroup
Message-ID: <202306151727.Nw4ilZPb-lkp@intel.com>
References: <20230615034905.1362034-1-hezhongkun.hzk@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615034905.1362034-1-hezhongkun.hzk@bytedance.com>

Hi Zhongkun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on axboe-block/for-next]
[also build test WARNING on linus/master v6.4-rc6]
[cannot apply to akpm-mm/mm-everything next-20230615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhongkun-He/memcg-export-obj_cgroup-symbol-to-charge-compressed-RAM/20230615-115048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230615034905.1362034-1-hezhongkun.hzk%40bytedance.com
patch subject: [RFC PATCH 3/3] zsmalloc: charge the zspage's object to obj_cgroup
config: hexagon-randconfig-r035-20230615 (https://download.01.org/0day-ci/archive/20230615/202306151727.Nw4ilZPb-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch axboe-block for-next
        git checkout axboe-block/for-next
        b4 shazam https://lore.kernel.org/r/20230615034905.1362034-1-hezhongkun.hzk@bytedance.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151727.Nw4ilZPb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/zsmalloc.c:45:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/zsmalloc.c:45:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/zsmalloc.c:45:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> mm/zsmalloc.c:1479:6: warning: no previous prototype for function 'zs_alloc_obj_cgroups' [-Wmissing-prototypes]
    1479 | void zs_alloc_obj_cgroups(struct zspage *zspage, struct size_class *class)
         |      ^
   mm/zsmalloc.c:1479:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1479 | void zs_alloc_obj_cgroups(struct zspage *zspage, struct size_class *class)
         | ^
         | static 
>> mm/zsmalloc.c:1684:6: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    1684 |         if (!zspage) {
         |             ^~~~~~~
   mm/zsmalloc.c:1714:40: note: uninitialized use occurs here
    1714 |         zs_obj_post_alloc_hook(class, zspage, index, objcg);
         |                                               ^~~~~
   mm/zsmalloc.c:1684:2: note: remove the 'if' if its condition is always false
    1684 |         if (!zspage) {
         |         ^~~~~~~~~~~~~~
    1685 |                 cache_free_handle(pool, handle);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1686 |                 handle =  (unsigned long)ERR_PTR(-ENOMEM);
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1687 |                 goto out;
         | ~~~~~~~~~~~~~~~~~~~~~~~~~
    1688 |         }
         | ~~~~~~~~~
   mm/zsmalloc.c:1645:34: note: initialize the variable 'index' to silence this warning
    1645 |         unsigned long handle, obj, index;
         |                                         ^
         |                                          = 0
   8 warnings generated.


vim +/zs_alloc_obj_cgroups +1479 mm/zsmalloc.c

  1478	
> 1479	void zs_alloc_obj_cgroups(struct zspage *zspage, struct size_class *class)
  1480	{
  1481		struct page *page = zspage->first_page;
  1482		int objects = class->objs_per_zspage;
  1483		unsigned long memcg_data = 0;
  1484		void *vec;
  1485	
  1486		vec = kcalloc_node(objects, sizeof(struct obj_cgroup *),
  1487				GFP_NOWAIT|__GFP_NOWARN|
  1488				__GFP_ZERO|__GFP_MOVABLE,
  1489				page_to_nid(page));
  1490	
  1491		if (vec)
  1492			memcg_data = (unsigned long)vec | MEMCG_DATA_OBJCGS;
  1493		page->memcg_data = memcg_data;
  1494	}
  1495	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
