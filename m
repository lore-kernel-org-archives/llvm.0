Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A90917AAD;
	Tue, 18 Jul 2023 23:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689723471; x=1721259471;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gfD9LnJlqlDtlL18yGiNMFIUXGZhYQhj+ptfPiLVvKo=;
  b=NdoTiCM8okG/dPI+sGQs8EA2TIkqK8OZFN8G3YUZOGWQE5Za9dgKviej
   AjWSldrOQdgIth53b3Lxh9sjJPao+9L5mSQp8EzLZvfXYPhWMVn5DX4Hv
   LTamgR+aj8tIZI/xtVshfPwU1gKhrvUlVhfBLBOSb4NUKLqYUtwsBOlXt
   HtYWgRkTKfACWakkGArElaGlcU3KIc2fpDK3IoF5krefGruQM2XItVJpz
   yxt5BVz8dkGozoVQYDUgBbyC9En5oOWEXURuFr8Fbpe4JYC4TMRpHQZ8q
   mhloyfQK+RyG3IbqxmZJDg9X3wBcBSjnB2ZkfuA0zFH4Q2MWcplu4oCtD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="368980942"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="368980942"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 16:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="867262720"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jul 2023 16:37:49 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLuGJ-0003xR-2I;
	Tue, 18 Jul 2023 23:37:47 +0000
Date: Wed, 19 Jul 2023 07:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: Mingzhe Zou <mingzhe.zou@easystack.cn>, colyli@suse.de,
	linux-bcache@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	bcache@lists.ewheeler.net, zoumingzhe@qq.com
Subject: Re: [PATCH 2/3] bcache: Separate bch_moving_gc() from bch_btree_gc()
Message-ID: <202307190705.ByiMYJwf-lkp@intel.com>
References: <20230717124143.171-2-mingzhe.zou@easystack.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717124143.171-2-mingzhe.zou@easystack.cn>

Hi Mingzhe,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.5-rc2 next-20230718]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mingzhe-Zou/bcache-Separate-bch_moving_gc-from-bch_btree_gc/20230718-195022
base:   linus/master
patch link:    https://lore.kernel.org/r/20230717124143.171-2-mingzhe.zou%40easystack.cn
patch subject: [PATCH 2/3] bcache: Separate bch_moving_gc() from bch_btree_gc()
config: i386-randconfig-r024-20230718 (https://download.01.org/0day-ci/archive/20230719/202307190705.ByiMYJwf-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230719/202307190705.ByiMYJwf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307190705.ByiMYJwf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/md/bcache/movinggc.c:236:6: error: no member named 'sb' in 'struct cache_set'
                   c->sb.set_uuid, sectors_to_move, ca->heap.used);
                   ~  ^
   include/linux/printk.h:528:34: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
                                           ^~~~~~~~~~~
   include/linux/printk.h:455:60: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                                                              ^~~~~~~~~~~
   include/linux/printk.h:427:19: note: expanded from macro 'printk_index_wrap'
                   _p_func(_fmt, ##__VA_ARGS__);                           \
                                   ^~~~~~~~~~~
   1 error generated.


vim +236 drivers/md/bcache/movinggc.c

   196	
   197	void bch_moving_gc(struct cache_set *c)
   198	{
   199		struct cache *ca = c->cache;
   200		struct bucket *b;
   201		unsigned long sectors_to_move, reserve_sectors;
   202	
   203		c->cache->only_moving_gc = 0;
   204	
   205		if (!c->copy_gc_enabled)
   206			return;
   207	
   208		mutex_lock(&c->bucket_lock);
   209	
   210		sectors_to_move = 0;
   211		reserve_sectors = ca->sb.bucket_size *
   212				     fifo_used(&ca->free[RESERVE_MOVINGGC]);
   213	
   214		ca->heap.used = 0;
   215	
   216		for_each_bucket(b, ca) {
   217			if (GC_MOVE(b) || GC_MARK(b) == GC_MARK_METADATA ||
   218			    !b->gc_sectors_used ||
   219			    b->gc_sectors_used == ca->sb.bucket_size ||
   220			    atomic_read(&b->pin))
   221				continue;
   222	
   223			if (!heap_full(&ca->heap)) {
   224				sectors_to_move += b->gc_sectors_used;
   225				heap_add(&ca->heap, b, bucket_cmp);
   226			} else if (bucket_cmp(b, heap_peek(&ca->heap))) {
   227				sectors_to_move -= bucket_heap_top(ca);
   228				sectors_to_move += b->gc_sectors_used;
   229	
   230				ca->heap.data[0] = b;
   231				heap_sift(&ca->heap, 0, bucket_cmp);
   232			}
   233		}
   234	 
   235		pr_info("moving gc: on set %pU, %lu sectors from %zu buckets",
 > 236			c->sb.set_uuid, sectors_to_move, ca->heap.used);
   237	
   238		while (sectors_to_move > reserve_sectors) {
   239			heap_pop(&ca->heap, b, bucket_cmp);
   240			sectors_to_move -= b->gc_sectors_used;
   241		}
   242	
   243		while (heap_pop(&ca->heap, b, bucket_cmp))
   244			SET_GC_MOVE(b, 1);
   245	
   246		mutex_unlock(&c->bucket_lock);
   247	
   248		c->moving_gc_keys.last_scanned = ZERO_KEY;
   249	
   250		read_moving(c);
   251	}
   252	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
