Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EE917E0;
	Mon,  6 Jan 2025 03:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736134901; cv=none; b=r+6aoBYTXlgPkyFBdj5ZSOpaYH12FKzoNBrcwyr3wlpWsFgN45ckfmWSF3krF+ZQkFBeIt/S7b/i4yzBWwufkvcyWG6JdH+plJj/lMgLbGDIlCyir5REAtfwdQd5M28fIFanoCbMgsxArc0reDogn+XXbWYTk6em4SBlY4eeEbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736134901; c=relaxed/simple;
	bh=NWshMZPUrjIRimErItZsIyqGEFaXPAXR50CVQ0ZP3hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2ZwS8pLlVx0OTmF+nHlySi6VjM4oA08+0m1HV/Ec8nwJUZAqudDxf1nk5J6UopOLIvnh4Ziv4ovkkFDg5SfFMbgQ7uu0OlFQ4ujLJJVBll7rJr9ZKfMJT4K9OEgMXVQL2r85dKA1z2zTo1pygtlqKQAzbA2HAuLdlB7q369xTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=blUziDgS; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="blUziDgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736134900; x=1767670900;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NWshMZPUrjIRimErItZsIyqGEFaXPAXR50CVQ0ZP3hg=;
  b=blUziDgSBvX7uY3lanVbOLjw3QzK+0hxyhV+T2P6ulYydLLoMKweetR7
   5jt0NozHAr/9nmsXPZ2ZqH5GOfQGp/UQvflWPCbQJvOONIibfQRn0Ipk8
   UP1SjkgBKWjrK/FkD/7aE90M9hRwvBD+H8Hz0lPxpdGxpk3EOX/9izPAs
   s6Rph7iOlJSRjxo/3oRvIby0r7ffrJnV/qOcwOMKLqKFkQsX8TKvBv7LS
   KroxJNmVPMlGh0Ap12TifC4SlLa5yL09b+/2v9DqLk4LtUQtAaM27vA8n
   VlY0ve8Ns+eJ1/rtOW6IHRHlKEp95P+maFayPV7c/gsOMQ3xVuALgfn7g
   g==;
X-CSE-ConnectionGUID: lFUOwGRUTF6IxRnrEpO3RQ==
X-CSE-MsgGUID: tnG1g5g4RJi4nmomqXP8OA==
X-IronPort-AV: E=McAfee;i="6700,10204,11306"; a="46775029"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="46775029"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 19:41:39 -0800
X-CSE-ConnectionGUID: wAveN5YRRJWVppAP0n3Ebg==
X-CSE-MsgGUID: RzARYIXJQGS7EmjyNpC8gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="125609871"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 05 Jan 2025 19:41:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUdzi-000CDT-3B;
	Mon, 06 Jan 2025 03:41:34 +0000
Date: Mon, 6 Jan 2025 11:40:50 +0800
From: kernel test robot <lkp@intel.com>
To: Hongzhen Luo <hongzhen@linux.alibaba.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v5 4/4] erofs: introduce .fadvise for page cache share
Message-ID: <202501061117.0i32iTXy-lkp@intel.com>
References: <20250105151208.3797385-5-hongzhen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105151208.3797385-5-hongzhen@linux.alibaba.com>

Hi Hongzhen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on xiang-erofs/dev-test]
[also build test ERROR on xiang-erofs/dev xiang-erofs/fixes linus/master v6.13-rc5 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hongzhen-Luo/erofs-move-struct-erofs_anon_fs_type-to-super-c/20250105-231438
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev-test
patch link:    https://lore.kernel.org/r/20250105151208.3797385-5-hongzhen%40linux.alibaba.com
patch subject: [RFC PATCH v5 4/4] erofs: introduce .fadvise for page cache share
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250106/202501061117.0i32iTXy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501061117.0i32iTXy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501061117.0i32iTXy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/erofs/pagecache_share.c:11:
   In file included from include/linux/pagemap.h:8:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/pagecache_share.c:66:4: error: invalid application of 'sizeof' to an incomplete type 'struct interval_tree_node'
      66 |                         sizeof(struct interval_tree_node), 0,
         |                         ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:430:41: note: expanded from macro 'kmem_cache_create'
     430 |                 default: __kmem_cache_create)(__name, __object_size, __args, __VA_ARGS__)
         |                                                       ^~~~~~~~~~~~~
   fs/erofs/pagecache_share.c:66:18: note: forward declaration of 'struct interval_tree_node'
      66 |                         sizeof(struct interval_tree_node), 0,
         |                                       ^
>> fs/erofs/pagecache_share.c:163:8: error: call to undeclared function 'interval_tree_iter_first'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     163 |         seg = interval_tree_iter_first(&vi->segs, 0, LLONG_MAX);
         |               ^
   fs/erofs/pagecache_share.c:163:8: note: did you mean 'vma_interval_tree_iter_first'?
   include/linux/mm.h:3295:24: note: 'vma_interval_tree_iter_first' declared here
    3295 | struct vm_area_struct *vma_interval_tree_iter_first(struct rb_root_cached *root,
         |                        ^
>> fs/erofs/pagecache_share.c:163:6: error: incompatible integer to pointer conversion assigning to 'struct interval_tree_node *' from 'int' [-Wint-conversion]
     163 |         seg = interval_tree_iter_first(&vi->segs, 0, LLONG_MAX);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/pagecache_share.c:165:14: error: call to undeclared function 'interval_tree_iter_next'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     165 |                 next_seg = interval_tree_iter_next(seg, 0, LLONG_MAX);
         |                            ^
   fs/erofs/pagecache_share.c:165:12: error: incompatible integer to pointer conversion assigning to 'struct interval_tree_node *' from 'int' [-Wint-conversion]
     165 |                 next_seg = interval_tree_iter_next(seg, 0, LLONG_MAX);
         |                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/pagecache_share.c:166:3: error: call to undeclared function 'interval_tree_remove'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     166 |                 interval_tree_remove(seg, &vi->segs);
         |                 ^
   fs/erofs/pagecache_share.c:166:3: note: did you mean 'vma_interval_tree_remove'?
   include/linux/mm.h:3293:6: note: 'vma_interval_tree_remove' declared here
    3293 | void vma_interval_tree_remove(struct vm_area_struct *node,
         |      ^
   fs/erofs/pagecache_share.c:276:8: error: call to undeclared function 'interval_tree_iter_first'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     276 |         seg = interval_tree_iter_first(&vi->segs, start, end);
         |               ^
   fs/erofs/pagecache_share.c:276:6: error: incompatible integer to pointer conversion assigning to 'struct interval_tree_node *' from 'int' [-Wint-conversion]
     276 |         seg = interval_tree_iter_first(&vi->segs, start, end);
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/erofs/pagecache_share.c:278:14: error: call to undeclared function 'interval_tree_iter_next'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     278 |                 next_seg = interval_tree_iter_next(seg, start, end);
         |                            ^
   fs/erofs/pagecache_share.c:278:12: error: incompatible integer to pointer conversion assigning to 'struct interval_tree_node *' from 'int' [-Wint-conversion]
     278 |                 next_seg = interval_tree_iter_next(seg, start, end);
         |                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/erofs/pagecache_share.c:283:21: error: incomplete definition of type 'struct interval_tree_node'
     283 |                 l = max_t(u64, seg->start | 0ULL, start);
         |                                ~~~^
   include/linux/minmax.h:221:49: note: expanded from macro 'max_t'
     221 | #define max_t(type, x, y) __cmp_once(max, type, x, y)
         |                                                 ^
   include/linux/minmax.h:96:30: note: expanded from macro '__cmp_once'
      96 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                     ^
   include/linux/minmax.h:93:16: note: expanded from macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                       ^
   fs/erofs/pagecache_share.c:87:15: note: forward declaration of 'struct interval_tree_node'
      87 | static struct interval_tree_node *erofs_pcshr_alloc_seg(void)
         |               ^
   fs/erofs/pagecache_share.c:284:21: error: incomplete definition of type 'struct interval_tree_node'
     284 |                 r = min_t(u64, seg->last | 0ULL, end);
         |                                ~~~^
   include/linux/minmax.h:213:49: note: expanded from macro 'min_t'
     213 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
         |                                                 ^
   include/linux/minmax.h:96:30: note: expanded from macro '__cmp_once'
      96 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                     ^
   include/linux/minmax.h:93:16: note: expanded from macro '__cmp_once_unique'
      93 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
         |                       ^
   fs/erofs/pagecache_share.c:87:15: note: forward declaration of 'struct interval_tree_node'
      87 | static struct interval_tree_node *erofs_pcshr_alloc_seg(void)
         |               ^
   fs/erofs/pagecache_share.c:289:10: error: incomplete definition of type 'struct interval_tree_node'
     289 |                 if (seg->start < l) {
         |                     ~~~^
   fs/erofs/pagecache_share.c:87:15: note: forward declaration of 'struct interval_tree_node'
      87 | static struct interval_tree_node *erofs_pcshr_alloc_seg(void)
         |               ^
   fs/erofs/pagecache_share.c:291:11: error: incomplete definition of type 'struct interval_tree_node'
     291 |                         new_seg->start = seg->start;
         |                         ~~~~~~~^
   fs/erofs/pagecache_share.c:87:15: note: forward declaration of 'struct interval_tree_node'
      87 | static struct interval_tree_node *erofs_pcshr_alloc_seg(void)
         |               ^
   fs/erofs/pagecache_share.c:291:24: error: incomplete definition of type 'struct interval_tree_node'
     291 |                         new_seg->start = seg->start;
         |                                          ~~~^
   fs/erofs/pagecache_share.c:87:15: note: forward declaration of 'struct interval_tree_node'
      87 | static struct interval_tree_node *erofs_pcshr_alloc_seg(void)
         |               ^
   fs/erofs/pagecache_share.c:292:11: error: incomplete definition of type 'struct interval_tree_node'
     292 |                         new_seg->last = l;
         |                         ~~~~~~~^
   fs/erofs/pagecache_share.c:87:15: note: forward declaration of 'struct interval_tree_node'
      87 | static struct interval_tree_node *erofs_pcshr_alloc_seg(void)
         |               ^
>> fs/erofs/pagecache_share.c:293:4: error: call to undeclared function 'interval_tree_insert'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     293 |                         interval_tree_insert(new_seg, &vi->segs);
         |                         ^
   fs/erofs/pagecache_share.c:293:4: note: did you mean 'vma_interval_tree_insert'?
   include/linux/mm.h:3288:6: note: 'vma_interval_tree_insert' declared here
    3288 | void vma_interval_tree_insert(struct vm_area_struct *node,
         |      ^
   fs/erofs/pagecache_share.c:297:14: error: incomplete definition of type 'struct interval_tree_node'
     297 |                 if (r < seg->last) {
         |                         ~~~^
   fs/erofs/pagecache_share.c:87:15: note: forward declaration of 'struct interval_tree_node'
      87 | static struct interval_tree_node *erofs_pcshr_alloc_seg(void)
         |               ^
   fs/erofs/pagecache_share.c:299:11: error: incomplete definition of type 'struct interval_tree_node'
     299 |                         new_seg->start = r;
         |                         ~~~~~~~^
   fs/erofs/pagecache_share.c:87:15: note: forward declaration of 'struct interval_tree_node'
      87 | static struct interval_tree_node *erofs_pcshr_alloc_seg(void)
         |               ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   3 warnings and 20 errors generated.


vim +66 fs/erofs/pagecache_share.c

    49	
    50	int erofs_pcshr_init_mnt(void)
    51	{
    52		int ret;
    53		struct vfsmount *tmp;
    54	
    55		mutex_lock(&mnt_counter.mutex);
    56		if (!mnt_counter.mnt) {
    57			tmp = kern_mount(&erofs_anon_fs_type);
    58			if (IS_ERR(tmp)) {
    59				ret = PTR_ERR(tmp);
    60				goto out;
    61			}
    62			mnt_counter.mnt = tmp;
    63			kref_init(&mnt_counter.ref);
    64	
    65			mnt_counter.segsp = kmem_cache_create("erofs_segs",
  > 66				sizeof(struct interval_tree_node), 0,
    67				SLAB_RECLAIM_ACCOUNT | SLAB_ACCOUNT, NULL);
    68			if (!mnt_counter.segsp) {
    69				ret = -ENOMEM;
    70				goto out;
    71			}
    72		} else
    73			kref_get(&mnt_counter.ref);
    74		ret = 0;
    75	out:
    76		mutex_unlock(&mnt_counter.mutex);
    77		return ret;
    78	}
    79	
    80	void erofs_pcshr_free_mnt(void)
    81	{
    82		mutex_lock(&mnt_counter.mutex);
    83		kref_put(&mnt_counter.ref, erofs_pcshr_counter_release);
    84		mutex_unlock(&mnt_counter.mutex);
    85	}
    86	
  > 87	static struct interval_tree_node *erofs_pcshr_alloc_seg(void)
    88	{
    89		return kmem_cache_alloc(mnt_counter.segsp, GFP_KERNEL);
    90	}
    91	
    92	static void erofs_pcshr_free_seg(struct interval_tree_node *seg)
    93	{
    94		kmem_cache_free(mnt_counter.segsp, seg);
    95	}
    96	
    97	static int erofs_fprt_eq(struct inode *inode, void *data)
    98	{
    99		struct erofs_pcshr_private *ano_private = inode->i_private;
   100	
   101		return ano_private && memcmp(ano_private->fprt, data,
   102				sizeof(size_t) + *(size_t *)data) == 0 ? 1 : 0;
   103	}
   104	
   105	static int erofs_fprt_set(struct inode *inode, void *data)
   106	{
   107		struct erofs_pcshr_private *ano_private;
   108	
   109		ano_private = kmalloc(sizeof(struct erofs_pcshr_private), GFP_KERNEL);
   110		if (!ano_private)
   111			return -ENOMEM;
   112		memcpy(ano_private, data, sizeof(size_t) + *(size_t *)data);
   113		mutex_init(&ano_private->mutex);
   114		inode->i_private = ano_private;
   115		return 0;
   116	}
   117	
   118	int erofs_pcshr_fill_inode(struct inode *inode)
   119	{
   120		struct erofs_inode *vi = EROFS_I(inode);
   121		/* | fingerprint length | fingerprint content | */
   122		char fprt[PCSHR_FPRT_MAXLEN];
   123		struct inode *ano_inode;
   124		unsigned long fprt_hash;
   125		size_t fprt_len;
   126		int ret = -1;
   127	
   128		vi->ano_inode = NULL;
   129		memset(fprt, 0, sizeof(fprt));
   130		fprt_len = erofs_getxattr(inode, PCSHR_FPRT_IDX, PCSHR_FPRT_NAME,
   131				fprt + sizeof(size_t), PCSHR_FPRT_MAXLEN);
   132		if (fprt_len > 0 && fprt_len <= PCSHR_FPRT_MAXLEN) {
   133			*(size_t *)fprt = fprt_len;
   134			fprt_hash = xxh32(fprt + sizeof(size_t), fprt_len, 0);
   135			ano_inode = iget5_locked(mnt_counter.mnt->mnt_sb, fprt_hash,
   136						 erofs_fprt_eq, erofs_fprt_set, fprt);
   137			DBG_BUGON(!ano_inode);
   138			vi->ano_inode = ano_inode;
   139			vi->segs = RB_ROOT_CACHED;
   140			mutex_init(&vi->segs_mutex);
   141			if (ano_inode->i_state & I_NEW) {
   142				if (erofs_inode_is_data_compressed(vi->datalayout))
   143					ano_inode->i_mapping->a_ops = &z_erofs_aops;
   144				else
   145					ano_inode->i_mapping->a_ops = &erofs_aops;
   146				ano_inode->i_size = inode->i_size;
   147				unlock_new_inode(ano_inode);
   148			}
   149			ret = 0;
   150		}
   151		return ret;
   152	}
   153	
   154	void erofs_pcshr_free_inode(struct inode *inode)
   155	{
   156		struct interval_tree_node *seg, *next_seg;
   157		struct erofs_inode *vi = EROFS_I(inode);
   158	
   159		if (S_ISREG(inode->i_mode) &&  vi->ano_inode) {
   160			iput(vi->ano_inode);
   161			vi->ano_inode = NULL;
   162		}
 > 163		seg = interval_tree_iter_first(&vi->segs, 0, LLONG_MAX);
   164		while (seg) {
 > 165			next_seg = interval_tree_iter_next(seg, 0, LLONG_MAX);
 > 166			interval_tree_remove(seg, &vi->segs);
   167			erofs_pcshr_free_seg(seg);
   168			seg = next_seg;
   169		}
   170	}
   171	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
