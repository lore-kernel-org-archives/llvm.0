Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673EE2F24
	for <llvm@lists.linux.dev>; Mon,  7 Feb 2022 15:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644247116; x=1675783116;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7qMrL3tgm7ZLSNTsZz7XvX01TLSAWUYkClJaHWG+Vb0=;
  b=Yot4iYOOb8Gk6l0dUQWwu8i0P7gtCIDQQEqjmsTBIVwx4JmbOCgDUKPg
   ZLsYVs7YO1EQ8rdI439sWmeZKiFeIoXp3tuQoA5Smc0n0FFpVNpcZVcoB
   GodDoIntSyRv6SgBgSpP6e8estgDgax6McY/QF2vyL0sFK/GB0ZlJpdvr
   m8KGwLPf0tl1Vyk6r4V6CuDmF2WQkYifKGkegnyM6Et4A6RQz04etJtZb
   oEGxLn2Vb8pVelR8NKqnngeBmr+44XScAGDrfw05to9dFmkadPHh339OL
   wEGRgcqPl5hxN6AVZjHuZse1T6cKSySqSPhXOrqo2KcBKHo0YRSZ/mhqR
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="246325707"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="246325707"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2022 07:18:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; 
   d="scan'208";a="481611671"
Received: from lkp-server01.sh.intel.com (HELO 9dd77a123018) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Feb 2022 07:18:33 -0800
Received: from kbuild by 9dd77a123018 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nH5mi-0000fD-Ns; Mon, 07 Feb 2022 15:18:32 +0000
Date: Mon, 7 Feb 2022 23:18:02 +0800
From: kernel test robot <lkp@intel.com>
To: NeilBrown <neilb@suse.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 01/21] MM: create new mm/swap.h header file.
Message-ID: <202202072351.RqMHsM0e-lkp@intel.com>
References: <164420916109.29374.8959231877111146366.stgit@noble.brown>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <164420916109.29374.8959231877111146366.stgit@noble.brown>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi NeilBrown,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on trondmy-nfs/linux-next]
[also build test ERROR on hnaz-mm/master cifs/for-next linus/master v5.17-rc3 next-20220207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/NeilBrown/Repair-SWAP-over_NFS/20220207-125206
base:   git://git.linux-nfs.org/projects/trondmy/linux-nfs.git linux-next
config: hexagon-randconfig-r005-20220207 (https://download.01.org/0day-ci/archive/20220207/202202072351.RqMHsM0e-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0d8850ae2cae85d49bea6ae0799fa41c7202c05c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/06d2bcb84187037252a0f764881ab51965e931ea
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review NeilBrown/Repair-SWAP-over_NFS/20220207-125206
        git checkout 06d2bcb84187037252a0f764881ab51965e931ea
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/zswap.c:906:13: error: implicit declaration of function '__read_swap_cache_async' [-Werror,-Wimplicit-function-declaration]
           *retpage = __read_swap_cache_async(entry, GFP_KERNEL,
                      ^
   mm/zswap.c:906:11: warning: incompatible integer to pointer conversion assigning to 'struct page *' from 'int' [-Wint-conversion]
           *retpage = __read_swap_cache_async(entry, GFP_KERNEL,
                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/zswap.c:1014:2: error: implicit declaration of function '__swap_writepage' [-Werror,-Wimplicit-function-declaration]
           __swap_writepage(page, &wbc, end_swap_bio_write);
           ^
>> mm/zswap.c:1014:31: error: use of undeclared identifier 'end_swap_bio_write'
           __swap_writepage(page, &wbc, end_swap_bio_write);
                                        ^
   1 warning and 3 errors generated.


vim +/__read_swap_cache_async +906 mm/zswap.c

2b2811178e85553 Seth Jennings      2013-07-10   884  
2b2811178e85553 Seth Jennings      2013-07-10   885  /*
2b2811178e85553 Seth Jennings      2013-07-10   886   * zswap_get_swap_cache_page
2b2811178e85553 Seth Jennings      2013-07-10   887   *
2b2811178e85553 Seth Jennings      2013-07-10   888   * This is an adaption of read_swap_cache_async()
2b2811178e85553 Seth Jennings      2013-07-10   889   *
2b2811178e85553 Seth Jennings      2013-07-10   890   * This function tries to find a page with the given swap entry
2b2811178e85553 Seth Jennings      2013-07-10   891   * in the swapper_space address space (the swap cache).  If the page
2b2811178e85553 Seth Jennings      2013-07-10   892   * is found, it is returned in retpage.  Otherwise, a page is allocated,
2b2811178e85553 Seth Jennings      2013-07-10   893   * added to the swap cache, and returned in retpage.
2b2811178e85553 Seth Jennings      2013-07-10   894   *
2b2811178e85553 Seth Jennings      2013-07-10   895   * If success, the swap cache page is returned in retpage
67d13fe846c57a5 Weijie Yang        2013-11-12   896   * Returns ZSWAP_SWAPCACHE_EXIST if page was already in the swap cache
67d13fe846c57a5 Weijie Yang        2013-11-12   897   * Returns ZSWAP_SWAPCACHE_NEW if the new page needs to be populated,
67d13fe846c57a5 Weijie Yang        2013-11-12   898   *     the new page is added to swapcache and locked
67d13fe846c57a5 Weijie Yang        2013-11-12   899   * Returns ZSWAP_SWAPCACHE_FAIL on error
2b2811178e85553 Seth Jennings      2013-07-10   900   */
2b2811178e85553 Seth Jennings      2013-07-10   901  static int zswap_get_swap_cache_page(swp_entry_t entry,
2b2811178e85553 Seth Jennings      2013-07-10   902  				struct page **retpage)
2b2811178e85553 Seth Jennings      2013-07-10   903  {
5b999aadbae6569 Dmitry Safonov     2015-09-08   904  	bool page_was_allocated;
2b2811178e85553 Seth Jennings      2013-07-10   905  
5b999aadbae6569 Dmitry Safonov     2015-09-08  @906  	*retpage = __read_swap_cache_async(entry, GFP_KERNEL,
5b999aadbae6569 Dmitry Safonov     2015-09-08   907  			NULL, 0, &page_was_allocated);
5b999aadbae6569 Dmitry Safonov     2015-09-08   908  	if (page_was_allocated)
2b2811178e85553 Seth Jennings      2013-07-10   909  		return ZSWAP_SWAPCACHE_NEW;
5b999aadbae6569 Dmitry Safonov     2015-09-08   910  	if (!*retpage)
67d13fe846c57a5 Weijie Yang        2013-11-12   911  		return ZSWAP_SWAPCACHE_FAIL;
2b2811178e85553 Seth Jennings      2013-07-10   912  	return ZSWAP_SWAPCACHE_EXIST;
2b2811178e85553 Seth Jennings      2013-07-10   913  }
2b2811178e85553 Seth Jennings      2013-07-10   914  
2b2811178e85553 Seth Jennings      2013-07-10   915  /*
2b2811178e85553 Seth Jennings      2013-07-10   916   * Attempts to free an entry by adding a page to the swap cache,
2b2811178e85553 Seth Jennings      2013-07-10   917   * decompressing the entry data into the page, and issuing a
2b2811178e85553 Seth Jennings      2013-07-10   918   * bio write to write the page back to the swap device.
2b2811178e85553 Seth Jennings      2013-07-10   919   *
2b2811178e85553 Seth Jennings      2013-07-10   920   * This can be thought of as a "resumed writeback" of the page
2b2811178e85553 Seth Jennings      2013-07-10   921   * to the swap device.  We are basically resuming the same swap
2b2811178e85553 Seth Jennings      2013-07-10   922   * writeback path that was intercepted with the frontswap_store()
2b2811178e85553 Seth Jennings      2013-07-10   923   * in the first place.  After the page has been decompressed into
2b2811178e85553 Seth Jennings      2013-07-10   924   * the swap cache, the compressed version stored by zswap can be
2b2811178e85553 Seth Jennings      2013-07-10   925   * freed.
2b2811178e85553 Seth Jennings      2013-07-10   926   */
12d79d64bfd3913 Dan Streetman      2014-08-06   927  static int zswap_writeback_entry(struct zpool *pool, unsigned long handle)
2b2811178e85553 Seth Jennings      2013-07-10   928  {
2b2811178e85553 Seth Jennings      2013-07-10   929  	struct zswap_header *zhdr;
2b2811178e85553 Seth Jennings      2013-07-10   930  	swp_entry_t swpentry;
2b2811178e85553 Seth Jennings      2013-07-10   931  	struct zswap_tree *tree;
2b2811178e85553 Seth Jennings      2013-07-10   932  	pgoff_t offset;
2b2811178e85553 Seth Jennings      2013-07-10   933  	struct zswap_entry *entry;
2b2811178e85553 Seth Jennings      2013-07-10   934  	struct page *page;
1ec3b5fe6eec782 Barry Song         2020-12-14   935  	struct scatterlist input, output;
1ec3b5fe6eec782 Barry Song         2020-12-14   936  	struct crypto_acomp_ctx *acomp_ctx;
1ec3b5fe6eec782 Barry Song         2020-12-14   937  
fc6697a89f56d97 Tian Tao           2021-02-25   938  	u8 *src, *tmp = NULL;
2b2811178e85553 Seth Jennings      2013-07-10   939  	unsigned int dlen;
0ab0abcf511545d Weijie Yang        2013-11-12   940  	int ret;
2b2811178e85553 Seth Jennings      2013-07-10   941  	struct writeback_control wbc = {
2b2811178e85553 Seth Jennings      2013-07-10   942  		.sync_mode = WB_SYNC_NONE,
2b2811178e85553 Seth Jennings      2013-07-10   943  	};
2b2811178e85553 Seth Jennings      2013-07-10   944  
fc6697a89f56d97 Tian Tao           2021-02-25   945  	if (!zpool_can_sleep_mapped(pool)) {
fc6697a89f56d97 Tian Tao           2021-02-25   946  		tmp = kmalloc(PAGE_SIZE, GFP_ATOMIC);
fc6697a89f56d97 Tian Tao           2021-02-25   947  		if (!tmp)
fc6697a89f56d97 Tian Tao           2021-02-25   948  			return -ENOMEM;
fc6697a89f56d97 Tian Tao           2021-02-25   949  	}
fc6697a89f56d97 Tian Tao           2021-02-25   950  
2b2811178e85553 Seth Jennings      2013-07-10   951  	/* extract swpentry from data */
12d79d64bfd3913 Dan Streetman      2014-08-06   952  	zhdr = zpool_map_handle(pool, handle, ZPOOL_MM_RO);
2b2811178e85553 Seth Jennings      2013-07-10   953  	swpentry = zhdr->swpentry; /* here */
2b2811178e85553 Seth Jennings      2013-07-10   954  	tree = zswap_trees[swp_type(swpentry)];
2b2811178e85553 Seth Jennings      2013-07-10   955  	offset = swp_offset(swpentry);
2b2811178e85553 Seth Jennings      2013-07-10   956  
2b2811178e85553 Seth Jennings      2013-07-10   957  	/* find and ref zswap entry */
2b2811178e85553 Seth Jennings      2013-07-10   958  	spin_lock(&tree->lock);
0ab0abcf511545d Weijie Yang        2013-11-12   959  	entry = zswap_entry_find_get(&tree->rbroot, offset);
2b2811178e85553 Seth Jennings      2013-07-10   960  	if (!entry) {
2b2811178e85553 Seth Jennings      2013-07-10   961  		/* entry was invalidated */
2b2811178e85553 Seth Jennings      2013-07-10   962  		spin_unlock(&tree->lock);
068619e32ff6229 Vitaly Wool        2019-09-23   963  		zpool_unmap_handle(pool, handle);
fc6697a89f56d97 Tian Tao           2021-02-25   964  		kfree(tmp);
2b2811178e85553 Seth Jennings      2013-07-10   965  		return 0;
2b2811178e85553 Seth Jennings      2013-07-10   966  	}
2b2811178e85553 Seth Jennings      2013-07-10   967  	spin_unlock(&tree->lock);
2b2811178e85553 Seth Jennings      2013-07-10   968  	BUG_ON(offset != entry->offset);
2b2811178e85553 Seth Jennings      2013-07-10   969  
46b76f2e09dc35f Miaohe Lin         2021-06-30   970  	src = (u8 *)zhdr + sizeof(struct zswap_header);
46b76f2e09dc35f Miaohe Lin         2021-06-30   971  	if (!zpool_can_sleep_mapped(pool)) {
46b76f2e09dc35f Miaohe Lin         2021-06-30   972  		memcpy(tmp, src, entry->length);
46b76f2e09dc35f Miaohe Lin         2021-06-30   973  		src = tmp;
46b76f2e09dc35f Miaohe Lin         2021-06-30   974  		zpool_unmap_handle(pool, handle);
46b76f2e09dc35f Miaohe Lin         2021-06-30   975  	}
46b76f2e09dc35f Miaohe Lin         2021-06-30   976  
2b2811178e85553 Seth Jennings      2013-07-10   977  	/* try to allocate swap cache page */
2b2811178e85553 Seth Jennings      2013-07-10   978  	switch (zswap_get_swap_cache_page(swpentry, &page)) {
67d13fe846c57a5 Weijie Yang        2013-11-12   979  	case ZSWAP_SWAPCACHE_FAIL: /* no memory or invalidate happened */
2b2811178e85553 Seth Jennings      2013-07-10   980  		ret = -ENOMEM;
2b2811178e85553 Seth Jennings      2013-07-10   981  		goto fail;
2b2811178e85553 Seth Jennings      2013-07-10   982  
67d13fe846c57a5 Weijie Yang        2013-11-12   983  	case ZSWAP_SWAPCACHE_EXIST:
2b2811178e85553 Seth Jennings      2013-07-10   984  		/* page is already in the swap cache, ignore for now */
09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01   985  		put_page(page);
2b2811178e85553 Seth Jennings      2013-07-10   986  		ret = -EEXIST;
2b2811178e85553 Seth Jennings      2013-07-10   987  		goto fail;
2b2811178e85553 Seth Jennings      2013-07-10   988  
2b2811178e85553 Seth Jennings      2013-07-10   989  	case ZSWAP_SWAPCACHE_NEW: /* page is locked */
2b2811178e85553 Seth Jennings      2013-07-10   990  		/* decompress */
1ec3b5fe6eec782 Barry Song         2020-12-14   991  		acomp_ctx = raw_cpu_ptr(entry->pool->acomp_ctx);
2b2811178e85553 Seth Jennings      2013-07-10   992  		dlen = PAGE_SIZE;
fc6697a89f56d97 Tian Tao           2021-02-25   993  
1ec3b5fe6eec782 Barry Song         2020-12-14   994  		mutex_lock(acomp_ctx->mutex);
1ec3b5fe6eec782 Barry Song         2020-12-14   995  		sg_init_one(&input, src, entry->length);
1ec3b5fe6eec782 Barry Song         2020-12-14   996  		sg_init_table(&output, 1);
1ec3b5fe6eec782 Barry Song         2020-12-14   997  		sg_set_page(&output, page, PAGE_SIZE, 0);
1ec3b5fe6eec782 Barry Song         2020-12-14   998  		acomp_request_set_params(acomp_ctx->req, &input, &output, entry->length, dlen);
1ec3b5fe6eec782 Barry Song         2020-12-14   999  		ret = crypto_wait_req(crypto_acomp_decompress(acomp_ctx->req), &acomp_ctx->wait);
1ec3b5fe6eec782 Barry Song         2020-12-14  1000  		dlen = acomp_ctx->req->dlen;
1ec3b5fe6eec782 Barry Song         2020-12-14  1001  		mutex_unlock(acomp_ctx->mutex);
1ec3b5fe6eec782 Barry Song         2020-12-14  1002  
2b2811178e85553 Seth Jennings      2013-07-10  1003  		BUG_ON(ret);
2b2811178e85553 Seth Jennings      2013-07-10  1004  		BUG_ON(dlen != PAGE_SIZE);
2b2811178e85553 Seth Jennings      2013-07-10  1005  
2b2811178e85553 Seth Jennings      2013-07-10  1006  		/* page is up to date */
2b2811178e85553 Seth Jennings      2013-07-10  1007  		SetPageUptodate(page);
2b2811178e85553 Seth Jennings      2013-07-10  1008  	}
2b2811178e85553 Seth Jennings      2013-07-10  1009  
b349acc76b7f654 Weijie Yang        2013-11-12  1010  	/* move it to the tail of the inactive list after end_writeback */
b349acc76b7f654 Weijie Yang        2013-11-12  1011  	SetPageReclaim(page);
b349acc76b7f654 Weijie Yang        2013-11-12  1012  
2b2811178e85553 Seth Jennings      2013-07-10  1013  	/* start writeback */
2b2811178e85553 Seth Jennings      2013-07-10 @1014  	__swap_writepage(page, &wbc, end_swap_bio_write);
09cbfeaf1a5a67b Kirill A. Shutemov 2016-04-01  1015  	put_page(page);
2b2811178e85553 Seth Jennings      2013-07-10  1016  	zswap_written_back_pages++;
2b2811178e85553 Seth Jennings      2013-07-10  1017  
2b2811178e85553 Seth Jennings      2013-07-10  1018  	spin_lock(&tree->lock);
2b2811178e85553 Seth Jennings      2013-07-10  1019  	/* drop local reference */
0ab0abcf511545d Weijie Yang        2013-11-12  1020  	zswap_entry_put(tree, entry);
2b2811178e85553 Seth Jennings      2013-07-10  1021  
2b2811178e85553 Seth Jennings      2013-07-10  1022  	/*
0ab0abcf511545d Weijie Yang        2013-11-12  1023  	* There are two possible situations for entry here:
0ab0abcf511545d Weijie Yang        2013-11-12  1024  	* (1) refcount is 1(normal case),  entry is valid and on the tree
0ab0abcf511545d Weijie Yang        2013-11-12  1025  	* (2) refcount is 0, entry is freed and not on the tree
0ab0abcf511545d Weijie Yang        2013-11-12  1026  	*     because invalidate happened during writeback
0ab0abcf511545d Weijie Yang        2013-11-12  1027  	*  search the tree and free the entry if find entry
2b2811178e85553 Seth Jennings      2013-07-10  1028  	*/
0ab0abcf511545d Weijie Yang        2013-11-12  1029  	if (entry == zswap_rb_search(&tree->rbroot, offset))
0ab0abcf511545d Weijie Yang        2013-11-12  1030  		zswap_entry_put(tree, entry);
2b2811178e85553 Seth Jennings      2013-07-10  1031  	spin_unlock(&tree->lock);
2b2811178e85553 Seth Jennings      2013-07-10  1032  
0ab0abcf511545d Weijie Yang        2013-11-12  1033  	goto end;
0ab0abcf511545d Weijie Yang        2013-11-12  1034  
0ab0abcf511545d Weijie Yang        2013-11-12  1035  	/*
0ab0abcf511545d Weijie Yang        2013-11-12  1036  	* if we get here due to ZSWAP_SWAPCACHE_EXIST
c0c641d77b9ab0d Randy Dunlap       2021-02-25  1037  	* a load may be happening concurrently.
c0c641d77b9ab0d Randy Dunlap       2021-02-25  1038  	* it is safe and okay to not free the entry.
0ab0abcf511545d Weijie Yang        2013-11-12  1039  	* if we free the entry in the following put
c0c641d77b9ab0d Randy Dunlap       2021-02-25  1040  	* it is also okay to return !0
0ab0abcf511545d Weijie Yang        2013-11-12  1041  	*/
2b2811178e85553 Seth Jennings      2013-07-10  1042  fail:
2b2811178e85553 Seth Jennings      2013-07-10  1043  	spin_lock(&tree->lock);
0ab0abcf511545d Weijie Yang        2013-11-12  1044  	zswap_entry_put(tree, entry);
2b2811178e85553 Seth Jennings      2013-07-10  1045  	spin_unlock(&tree->lock);
0ab0abcf511545d Weijie Yang        2013-11-12  1046  
0ab0abcf511545d Weijie Yang        2013-11-12  1047  end:
fc6697a89f56d97 Tian Tao           2021-02-25  1048  	if (zpool_can_sleep_mapped(pool))
068619e32ff6229 Vitaly Wool        2019-09-23  1049  		zpool_unmap_handle(pool, handle);
fc6697a89f56d97 Tian Tao           2021-02-25  1050  	else
fc6697a89f56d97 Tian Tao           2021-02-25  1051  		kfree(tmp);
fc6697a89f56d97 Tian Tao           2021-02-25  1052  
2b2811178e85553 Seth Jennings      2013-07-10  1053  	return ret;
2b2811178e85553 Seth Jennings      2013-07-10  1054  }
2b2811178e85553 Seth Jennings      2013-07-10  1055  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
