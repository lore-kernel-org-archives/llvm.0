Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70ED525B;
	Thu, 15 Jun 2023 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686819738; x=1718355738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O9r1IJyAe4d1E/NWc7Cpgdr29PCwuKBMC5h/Bn9e1wU=;
  b=bxGxa6PVFtKw0uVEGfa6k5gWXf1JlG0vE/OLmHVD0vM6Tuet8Ko+98SH
   jeZdW3S5fZciUNo+gdiwJO1p1MTUlSZLpXbnORfVsds9+7CnuNu+MhVxf
   JbKSla1fFXhw8zwXyZp/ruKTS4ZItOq/CG7sGZ14Oi5GvUc/1wTjWlL1K
   ig7PFg2AKS4lm/4NWlNc1aSvAwqrhKMylde9PA0twgRdYIW70OxcLGxzv
   TuFimuYwPCGSTqdWFTebW5zkoA6FcWNjD8dKJQ/LPheq2/G/nKLLC9tDw
   gB/+7EFjb9iDt16ZCyKPMIMsoMleNTcXui1UFyamZ+/IfrNG3Pb0mgFPd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="339204078"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="339204078"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 02:02:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="1042573301"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="1042573301"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jun 2023 02:02:16 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9irv-0001gN-2I;
	Thu, 15 Jun 2023 09:02:15 +0000
Date: Thu, 15 Jun 2023 17:00:54 +0800
From: kernel test robot <lkp@intel.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] zsmalloc: charge the zspage's object to
 obj_cgroup
Message-ID: <202306151659.Jo2P7J8r-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.4-rc6]
[cannot apply to akpm-mm/mm-everything next-20230615]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhongkun-He/memcg-export-obj_cgroup-symbol-to-charge-compressed-RAM/20230615-115048
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230615034905.1362034-1-hezhongkun.hzk%40bytedance.com
patch subject: [RFC PATCH 3/3] zsmalloc: charge the zspage's object to obj_cgroup
config: s390-randconfig-r044-20230615 (https://download.01.org/0day-ci/archive/20230615/202306151659.Jo2P7J8r-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch axboe-block for-next
        git checkout axboe-block/for-next
        b4 shazam https://lore.kernel.org/r/20230615034905.1362034-1-hezhongkun.hzk@bytedance.com
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151659.Jo2P7J8r-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> mm/zsmalloc.c:1567:5: warning: no previous prototype for function 'zs_alloc_obj_cgroups' [-Wmissing-prototypes]
   int zs_alloc_obj_cgroups(struct zspage *zspage, struct size_class *class)
       ^
   mm/zsmalloc.c:1567:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int zs_alloc_obj_cgroups(struct zspage *zspage, struct size_class *class)
   ^
   static 
>> mm/zsmalloc.c:1714:32: error: incompatible pointer types passing 'struct zspage *' to parameter of type 'struct page *' [-Werror,-Wincompatible-pointer-types]
           zs_obj_post_alloc_hook(class, zspage, index, objcg);
                                         ^~~~~~
   mm/zsmalloc.c:1579:18: note: passing argument to parameter 'page' here
                                   struct page *page,
                                                ^
>> mm/zsmalloc.c:1684:6: warning: variable 'index' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (!zspage) {
               ^~~~~~~
   mm/zsmalloc.c:1714:40: note: uninitialized use occurs here
           zs_obj_post_alloc_hook(class, zspage, index, objcg);
                                                 ^~~~~
   mm/zsmalloc.c:1684:2: note: remove the 'if' if its condition is always false
           if (!zspage) {
           ^~~~~~~~~~~~~~
   mm/zsmalloc.c:1645:34: note: initialize the variable 'index' to silence this warning
           unsigned long handle, obj, index;
                                           ^
                                            = 0
   2 warnings and 1 error generated.


vim +1714 mm/zsmalloc.c

  1566	
> 1567	int zs_alloc_obj_cgroups(struct zspage *zspage, struct size_class *class)
  1568	{
  1569		return 0;
  1570	}
  1571	
  1572	static inline bool zs_obj_pre_alloc_hook(struct size_class *class,
  1573					struct obj_cgroup **objcgp, gfp_t flags)
  1574	{
  1575		return true;
  1576	}
  1577	
  1578	static inline void zs_obj_post_alloc_hook(struct size_class *class,
  1579					struct page *page,
  1580					unsigned int idx,
  1581					struct obj_cgroup *objcg)
  1582	{
  1583	}
  1584	static inline void zs_obj_free_hook(int class_size, struct zspage *zspage,
  1585					unsigned int idx)
  1586	{
  1587	}
  1588	#endif
  1589	
  1590	static unsigned long obj_malloc(struct zs_pool *pool,
  1591					struct zspage *zspage, unsigned long handle)
  1592	{
  1593		int i, nr_page, offset;
  1594		unsigned long obj;
  1595		struct link_free *link;
  1596		struct size_class *class;
  1597	
  1598		struct page *m_page;
  1599		unsigned long m_offset;
  1600		void *vaddr;
  1601	
  1602		class = pool->size_class[zspage->class];
  1603		handle |= OBJ_ALLOCATED_TAG;
  1604		obj = get_freeobj(zspage);
  1605	
  1606		offset = obj * class->size;
  1607		nr_page = offset >> PAGE_SHIFT;
  1608		m_offset = offset & ~PAGE_MASK;
  1609		m_page = get_first_page(zspage);
  1610	
  1611		for (i = 0; i < nr_page; i++)
  1612			m_page = get_next_page(m_page);
  1613	
  1614		vaddr = kmap_atomic(m_page);
  1615		link = (struct link_free *)vaddr + m_offset / sizeof(*link);
  1616		set_freeobj(zspage, link->next >> OBJ_TAG_BITS);
  1617		if (likely(!ZsHugePage(zspage)))
  1618			/* record handle in the header of allocated chunk */
  1619			link->handle = handle;
  1620		else
  1621			/* record handle to page->index */
  1622			zspage->first_page->index = handle;
  1623	
  1624		kunmap_atomic(vaddr);
  1625		mod_zspage_inuse(zspage, 1);
  1626	
  1627		obj = location_to_obj(m_page, obj);
  1628	
  1629		return obj;
  1630	}
  1631	
  1632	
  1633	/**
  1634	 * zs_malloc - Allocate block of given size from pool.
  1635	 * @pool: pool to allocate from
  1636	 * @size: size of block to allocate
  1637	 * @gfp: gfp flags when allocating object
  1638	 *
  1639	 * On success, handle to the allocated object is returned,
  1640	 * otherwise an ERR_PTR().
  1641	 * Allocation requests with size > ZS_MAX_ALLOC_SIZE will fail.
  1642	 */
  1643	unsigned long zs_malloc(struct zs_pool *pool, size_t size, gfp_t gfp)
  1644	{
  1645		unsigned long handle, obj, index;
  1646		struct obj_cgroup *objcg;
  1647		struct size_class *class;
  1648		int newfg;
  1649		struct zspage *zspage;
  1650	
  1651		if (unlikely(!size || size > ZS_MAX_ALLOC_SIZE))
  1652			return (unsigned long)ERR_PTR(-EINVAL);
  1653	
  1654		handle = cache_alloc_handle(pool, gfp);
  1655		if (!handle)
  1656			return (unsigned long)ERR_PTR(-ENOMEM);
  1657	
  1658		/* extra space in chunk to keep the handle */
  1659		size += ZS_HANDLE_SIZE;
  1660		class = pool->size_class[get_size_class_index(size)];
  1661	
  1662		if (!zs_obj_pre_alloc_hook(class, &objcg, gfp)) {
  1663			cache_free_handle(pool, handle);
  1664			return (unsigned long)ERR_PTR(-ENOMEM);
  1665		}
  1666	
  1667		/* pool->lock effectively protects the zpage migration */
  1668		spin_lock(&pool->lock);
  1669		zspage = find_get_zspage(class);
  1670		if (likely(zspage)) {
  1671			index = get_freeobj(zspage);
  1672			obj = obj_malloc(pool, zspage, handle);
  1673			/* Now move the zspage to another fullness group, if required */
  1674			fix_fullness_group(class, zspage);
  1675			record_obj(handle, obj);
  1676			class_stat_inc(class, ZS_OBJS_INUSE, 1);
  1677	
  1678			goto out_unlock;
  1679		}
  1680	
  1681		spin_unlock(&pool->lock);
  1682	
  1683		zspage = alloc_zspage(pool, class, gfp);
> 1684		if (!zspage) {
  1685			cache_free_handle(pool, handle);
  1686			handle =  (unsigned long)ERR_PTR(-ENOMEM);
  1687			goto out;
  1688		}
  1689	
  1690		zs_alloc_obj_cgroups(zspage, class);
  1691		index = get_freeobj(zspage);
  1692		spin_lock(&pool->lock);
  1693		obj = obj_malloc(pool, zspage, handle);
  1694		newfg = get_fullness_group(class, zspage);
  1695		insert_zspage(class, zspage, newfg);
  1696		set_zspage_mapping(zspage, class->index, newfg);
  1697		record_obj(handle, obj);
  1698		atomic_long_add(class->pages_per_zspage, &pool->pages_allocated);
  1699		class_stat_inc(class, ZS_OBJS_ALLOCATED, class->objs_per_zspage);
  1700		class_stat_inc(class, ZS_OBJS_INUSE, 1);
  1701	
  1702		/* We completely set up zspage so mark them as movable */
  1703		SetZsPageMovable(pool, zspage);
  1704	out_unlock:
  1705	#ifdef CONFIG_ZPOOL
  1706		/* Add/move zspage to beginning of LRU */
  1707		if (!list_empty(&zspage->lru))
  1708			list_del(&zspage->lru);
  1709		list_add(&zspage->lru, &pool->lru);
  1710	#endif
  1711	
  1712		spin_unlock(&pool->lock);
  1713	out:
> 1714		zs_obj_post_alloc_hook(class, zspage, index, objcg);
  1715	
  1716		return handle;
  1717	}
  1718	EXPORT_SYMBOL_GPL(zs_malloc);
  1719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
