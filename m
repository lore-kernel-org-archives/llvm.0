Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C28323D9;
	Tue, 20 Jun 2023 22:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687301881; x=1718837881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sSP7FixdxOxW/0hI2etvICTPUT/GET8rmnPdKxTTGMY=;
  b=lFKYvFn6JgfnO6cRs7ambUT3BPIRfW15LHZgistpb15DVN2pt4AjvFNK
   RDzWua4kz4Qhkr34w61RaHbadU7IATusx4mo9YyftU9T7B3xekNkikD6W
   gxjToUL0qura2Wc3gjZ+r4Pp5qsI8hrLP7XjyT66YnZbQoFPpexr8W0BD
   wk0KIc3DF7Fl0M2QWCE2OqaoCD1OSbgIIEwW9zIwgO6ihg0J+1ILfmCpS
   A46z85cNiMu8zDMMzC+WrVp3qCcwkda8qr8plr9Nj++sCKzCr4jaLN8jc
   ATBtcitfLuks9nvtFSNER+OfQDdtUw6dOQOS5IPTt42uJ88ecUOLSQwDD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="349735949"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="349735949"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 15:57:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="960948971"
X-IronPort-AV: E=Sophos;i="6.00,258,1681196400"; 
   d="scan'208";a="960948971"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 20 Jun 2023 15:57:42 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBkI9-0006JG-2A;
	Tue, 20 Jun 2023 22:57:41 +0000
Date: Wed, 21 Jun 2023 06:56:36 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [linux-next:master 2819/11071] fs/ceph/addr.c:794:12: warning: stack
 frame size (2096) exceeds limit (2048) in 'ceph_writepages_start'
Message-ID: <202306210637.TpfYq9gM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9dbf40840551df336c95ce2a3adbdd25ed53c0ef
commit: df8fc4e934c12b906d08050d7779f292b9c5c6b5 [2819/11071] kbuild: Enable -fstrict-flex-arrays=3
config: riscv-randconfig-r004-20230620 (https://download.01.org/0day-ci/archive/20230621/202306210637.TpfYq9gM-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306210637.TpfYq9gM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306210637.TpfYq9gM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/addr.c:794:12: warning: stack frame size (2096) exceeds limit (2048) in 'ceph_writepages_start' [-Wframe-larger-than]
   static int ceph_writepages_start(struct address_space *mapping,
              ^
   1820/2096 (86.83%) spills, 276/2096 (13.17%) variables
   1 warning generated.


vim +/ceph_writepages_start +794 fs/ceph/addr.c

1d3576fd10f0d7 Sage Weil               2009-10-06   790  
1d3576fd10f0d7 Sage Weil               2009-10-06   791  /*
1d3576fd10f0d7 Sage Weil               2009-10-06   792   * initiate async writeback
1d3576fd10f0d7 Sage Weil               2009-10-06   793   */
1d3576fd10f0d7 Sage Weil               2009-10-06  @794  static int ceph_writepages_start(struct address_space *mapping,
1d3576fd10f0d7 Sage Weil               2009-10-06   795  				 struct writeback_control *wbc)
1d3576fd10f0d7 Sage Weil               2009-10-06   796  {
1d3576fd10f0d7 Sage Weil               2009-10-06   797  	struct inode *inode = mapping->host;
1d3576fd10f0d7 Sage Weil               2009-10-06   798  	struct ceph_inode_info *ci = ceph_inode(inode);
fc2744aa12da71 Yan, Zheng              2013-05-31   799  	struct ceph_fs_client *fsc = ceph_inode_to_client(inode);
fc2744aa12da71 Yan, Zheng              2013-05-31   800  	struct ceph_vino vino = ceph_vino(inode);
2a2d927e35dd8d Yan, Zheng              2017-09-01   801  	pgoff_t index, start_index, end = -1;
80e755fedebc8d Sage Weil               2010-03-31   802  	struct ceph_snap_context *snapc = NULL, *last_snapc = NULL, *pgsnapc;
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04   803) 	struct folio_batch fbatch;
1d3576fd10f0d7 Sage Weil               2009-10-06   804  	int rc = 0;
93407472a21b82 Fabian Frederick        2017-02-27   805  	unsigned int wsize = i_blocksize(inode);
1d3576fd10f0d7 Sage Weil               2009-10-06   806  	struct ceph_osd_request *req = NULL;
1f934b00e90752 Yan, Zheng              2017-08-30   807  	struct ceph_writeback_ctl ceph_wbc;
590e9d9861f5f2 Yan, Zheng              2017-09-03   808  	bool should_loop, range_whole = false;
af9cc401ce7452 Yan, Zheng              2018-03-04   809  	bool done = false;
1702e79734104d Jeff Layton             2021-12-07   810  	bool caching = ceph_is_cache_enabled(inode);
7d41870d65db02 Xiubo Li                2023-03-08   811  	xa_mark_t tag;
1d3576fd10f0d7 Sage Weil               2009-10-06   812  
503d4fa6ee28e8 NeilBrown               2022-03-22   813  	if (wbc->sync_mode == WB_SYNC_NONE &&
503d4fa6ee28e8 NeilBrown               2022-03-22   814  	    fsc->write_congested)
503d4fa6ee28e8 NeilBrown               2022-03-22   815  		return 0;
503d4fa6ee28e8 NeilBrown               2022-03-22   816  
3fb99d483e614b Yanhu Cao               2017-07-21   817  	dout("writepages_start %p (mode=%s)\n", inode,
1d3576fd10f0d7 Sage Weil               2009-10-06   818  	     wbc->sync_mode == WB_SYNC_NONE ? "NONE" :
1d3576fd10f0d7 Sage Weil               2009-10-06   819  	     (wbc->sync_mode == WB_SYNC_ALL ? "ALL" : "HOLD"));
1d3576fd10f0d7 Sage Weil               2009-10-06   820  
5d6451b1489ad1 Jeff Layton             2021-08-31   821  	if (ceph_inode_is_shutdown(inode)) {
6c93df5db628e7 Yan, Zheng              2016-04-15   822  		if (ci->i_wrbuffer_ref > 0) {
6c93df5db628e7 Yan, Zheng              2016-04-15   823  			pr_warn_ratelimited(
6c93df5db628e7 Yan, Zheng              2016-04-15   824  				"writepage_start %p %lld forced umount\n",
6c93df5db628e7 Yan, Zheng              2016-04-15   825  				inode, ceph_ino(inode));
6c93df5db628e7 Yan, Zheng              2016-04-15   826  		}
a341d4df87487a Yan, Zheng              2015-07-01   827  		mapping_set_error(mapping, -EIO);
1d3576fd10f0d7 Sage Weil               2009-10-06   828  		return -EIO; /* we're in a forced umount, don't write! */
1d3576fd10f0d7 Sage Weil               2009-10-06   829  	}
95cca2b44e54b0 Yan, Zheng              2017-07-11   830  	if (fsc->mount_options->wsize < wsize)
3d14c5d2b6e15c Yehuda Sadeh            2010-04-06   831  		wsize = fsc->mount_options->wsize;
1d3576fd10f0d7 Sage Weil               2009-10-06   832  
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04   833) 	folio_batch_init(&fbatch);
1d3576fd10f0d7 Sage Weil               2009-10-06   834  
590e9d9861f5f2 Yan, Zheng              2017-09-03   835  	start_index = wbc->range_cyclic ? mapping->writeback_index : 0;
590e9d9861f5f2 Yan, Zheng              2017-09-03   836  	index = start_index;
1d3576fd10f0d7 Sage Weil               2009-10-06   837  
7d41870d65db02 Xiubo Li                2023-03-08   838  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages) {
7d41870d65db02 Xiubo Li                2023-03-08   839  		tag = PAGECACHE_TAG_TOWRITE;
7d41870d65db02 Xiubo Li                2023-03-08   840  	} else {
7d41870d65db02 Xiubo Li                2023-03-08   841  		tag = PAGECACHE_TAG_DIRTY;
7d41870d65db02 Xiubo Li                2023-03-08   842  	}
1d3576fd10f0d7 Sage Weil               2009-10-06   843  retry:
1d3576fd10f0d7 Sage Weil               2009-10-06   844  	/* find oldest snap context with dirty data */
05455e1177f768 Yan, Zheng              2017-09-02   845  	snapc = get_oldest_context(inode, &ceph_wbc, NULL);
1d3576fd10f0d7 Sage Weil               2009-10-06   846  	if (!snapc) {
1d3576fd10f0d7 Sage Weil               2009-10-06   847  		/* hmm, why does writepages get called when there
1d3576fd10f0d7 Sage Weil               2009-10-06   848  		   is no dirty data? */
1d3576fd10f0d7 Sage Weil               2009-10-06   849  		dout(" no snap context with dirty data?\n");
1d3576fd10f0d7 Sage Weil               2009-10-06   850  		goto out;
1d3576fd10f0d7 Sage Weil               2009-10-06   851  	}
1d3576fd10f0d7 Sage Weil               2009-10-06   852  	dout(" oldest snapc is %p seq %lld (%d snaps)\n",
1d3576fd10f0d7 Sage Weil               2009-10-06   853  	     snapc, snapc->seq, snapc->num_snaps);
fc2744aa12da71 Yan, Zheng              2013-05-31   854  
2a2d927e35dd8d Yan, Zheng              2017-09-01   855  	should_loop = false;
2a2d927e35dd8d Yan, Zheng              2017-09-01   856  	if (ceph_wbc.head_snapc && snapc != last_snapc) {
2a2d927e35dd8d Yan, Zheng              2017-09-01   857  		/* where to start/end? */
2a2d927e35dd8d Yan, Zheng              2017-09-01   858  		if (wbc->range_cyclic) {
2a2d927e35dd8d Yan, Zheng              2017-09-01   859  			index = start_index;
2a2d927e35dd8d Yan, Zheng              2017-09-01   860  			end = -1;
2a2d927e35dd8d Yan, Zheng              2017-09-01   861  			if (index > 0)
2a2d927e35dd8d Yan, Zheng              2017-09-01   862  				should_loop = true;
2a2d927e35dd8d Yan, Zheng              2017-09-01   863  			dout(" cyclic, start at %lu\n", index);
2a2d927e35dd8d Yan, Zheng              2017-09-01   864  		} else {
2a2d927e35dd8d Yan, Zheng              2017-09-01   865  			index = wbc->range_start >> PAGE_SHIFT;
2a2d927e35dd8d Yan, Zheng              2017-09-01   866  			end = wbc->range_end >> PAGE_SHIFT;
2a2d927e35dd8d Yan, Zheng              2017-09-01   867  			if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
2a2d927e35dd8d Yan, Zheng              2017-09-01   868  				range_whole = true;
2a2d927e35dd8d Yan, Zheng              2017-09-01   869  			dout(" not cyclic, %lu to %lu\n", index, end);
2a2d927e35dd8d Yan, Zheng              2017-09-01   870  		}
2a2d927e35dd8d Yan, Zheng              2017-09-01   871  	} else if (!ceph_wbc.head_snapc) {
2a2d927e35dd8d Yan, Zheng              2017-09-01   872  		/* Do not respect wbc->range_{start,end}. Dirty pages
2a2d927e35dd8d Yan, Zheng              2017-09-01   873  		 * in that range can be associated with newer snapc.
2a2d927e35dd8d Yan, Zheng              2017-09-01   874  		 * They are not writeable until we write all dirty pages
2a2d927e35dd8d Yan, Zheng              2017-09-01   875  		 * associated with 'snapc' get written */
1582af2eaaf17c Yan, Zheng              2018-03-06   876  		if (index > 0)
2a2d927e35dd8d Yan, Zheng              2017-09-01   877  			should_loop = true;
2a2d927e35dd8d Yan, Zheng              2017-09-01   878  		dout(" non-head snapc, range whole\n");
1d3576fd10f0d7 Sage Weil               2009-10-06   879  	}
2a2d927e35dd8d Yan, Zheng              2017-09-01   880  
7d41870d65db02 Xiubo Li                2023-03-08   881  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
7d41870d65db02 Xiubo Li                2023-03-08   882  		tag_pages_for_writeback(mapping, index, end);
7d41870d65db02 Xiubo Li                2023-03-08   883  
2a2d927e35dd8d Yan, Zheng              2017-09-01   884  	ceph_put_snap_context(last_snapc);
1d3576fd10f0d7 Sage Weil               2009-10-06   885  	last_snapc = snapc;
1d3576fd10f0d7 Sage Weil               2009-10-06   886  
af9cc401ce7452 Yan, Zheng              2018-03-04   887  	while (!done && index <= end) {
5b64640cf65be4 Yan, Zheng              2016-01-07   888  		int num_ops = 0, op_idx;
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04   889) 		unsigned i, nr_folios, max_pages, locked_pages = 0;
5b64640cf65be4 Yan, Zheng              2016-01-07   890  		struct page **pages = NULL, **data_pages;
1d3576fd10f0d7 Sage Weil               2009-10-06   891  		struct page *page;
0e5ecac7168366 Yan, Zheng              2017-08-31   892  		pgoff_t strip_unit_end = 0;
5b64640cf65be4 Yan, Zheng              2016-01-07   893  		u64 offset = 0, len = 0;
a0102bda5bc099 Jeff Layton             2020-07-30   894  		bool from_pool = false;
1d3576fd10f0d7 Sage Weil               2009-10-06   895  
0e5ecac7168366 Yan, Zheng              2017-08-31   896  		max_pages = wsize >> PAGE_SHIFT;
1d3576fd10f0d7 Sage Weil               2009-10-06   897  
1d3576fd10f0d7 Sage Weil               2009-10-06   898  get_more_pages:
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04   899) 		nr_folios = filemap_get_folios_tag(mapping, &index,
7d41870d65db02 Xiubo Li                2023-03-08   900  						   end, tag, &fbatch);
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04   901) 		dout("pagevec_lookup_range_tag got %d\n", nr_folios);
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04   902) 		if (!nr_folios && !locked_pages)
1d3576fd10f0d7 Sage Weil               2009-10-06   903  			break;
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04   904) 		for (i = 0; i < nr_folios && locked_pages < max_pages; i++) {
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04   905) 			page = &fbatch.folios[i]->page;
1d3576fd10f0d7 Sage Weil               2009-10-06   906  			dout("? %p idx %lu\n", page, page->index);
1d3576fd10f0d7 Sage Weil               2009-10-06   907  			if (locked_pages == 0)
1d3576fd10f0d7 Sage Weil               2009-10-06   908  				lock_page(page);  /* first page */
1d3576fd10f0d7 Sage Weil               2009-10-06   909  			else if (!trylock_page(page))
1d3576fd10f0d7 Sage Weil               2009-10-06   910  				break;
1d3576fd10f0d7 Sage Weil               2009-10-06   911  
1d3576fd10f0d7 Sage Weil               2009-10-06   912  			/* only dirty pages, or our accounting breaks */
1d3576fd10f0d7 Sage Weil               2009-10-06   913  			if (unlikely(!PageDirty(page)) ||
1d3576fd10f0d7 Sage Weil               2009-10-06   914  			    unlikely(page->mapping != mapping)) {
1d3576fd10f0d7 Sage Weil               2009-10-06   915  				dout("!dirty or !mapping %p\n", page);
1d3576fd10f0d7 Sage Weil               2009-10-06   916  				unlock_page(page);
0713e5f24b7deb Yan, Zheng              2017-08-31   917  				continue;
1d3576fd10f0d7 Sage Weil               2009-10-06   918  			}
af9cc401ce7452 Yan, Zheng              2018-03-04   919  			/* only if matching snap context */
af9cc401ce7452 Yan, Zheng              2018-03-04   920  			pgsnapc = page_snap_context(page);
af9cc401ce7452 Yan, Zheng              2018-03-04   921  			if (pgsnapc != snapc) {
af9cc401ce7452 Yan, Zheng              2018-03-04   922  				dout("page snapc %p %lld != oldest %p %lld\n",
af9cc401ce7452 Yan, Zheng              2018-03-04   923  				     pgsnapc, pgsnapc->seq, snapc, snapc->seq);
1582af2eaaf17c Yan, Zheng              2018-03-06   924  				if (!should_loop &&
1582af2eaaf17c Yan, Zheng              2018-03-06   925  				    !ceph_wbc.head_snapc &&
1582af2eaaf17c Yan, Zheng              2018-03-06   926  				    wbc->sync_mode != WB_SYNC_NONE)
1582af2eaaf17c Yan, Zheng              2018-03-06   927  					should_loop = true;
1d3576fd10f0d7 Sage Weil               2009-10-06   928  				unlock_page(page);
af9cc401ce7452 Yan, Zheng              2018-03-04   929  				continue;
1d3576fd10f0d7 Sage Weil               2009-10-06   930  			}
1f934b00e90752 Yan, Zheng              2017-08-30   931  			if (page_offset(page) >= ceph_wbc.i_size) {
a628304ebe6ab0 Matthew Wilcox (Oracle  2022-02-09   932) 				struct folio *folio = page_folio(page);
a628304ebe6ab0 Matthew Wilcox (Oracle  2022-02-09   933) 
a628304ebe6ab0 Matthew Wilcox (Oracle  2022-02-09   934) 				dout("folio at %lu beyond eof %llu\n",
a628304ebe6ab0 Matthew Wilcox (Oracle  2022-02-09   935) 				     folio->index, ceph_wbc.i_size);
c95f1c5f436bad Erqi Chen               2019-07-24   936  				if ((ceph_wbc.size_stable ||
a628304ebe6ab0 Matthew Wilcox (Oracle  2022-02-09   937) 				    folio_pos(folio) >= i_size_read(inode)) &&
a628304ebe6ab0 Matthew Wilcox (Oracle  2022-02-09   938) 				    folio_clear_dirty_for_io(folio))
a628304ebe6ab0 Matthew Wilcox (Oracle  2022-02-09   939) 					folio_invalidate(folio, 0,
a628304ebe6ab0 Matthew Wilcox (Oracle  2022-02-09   940) 							folio_size(folio));
a628304ebe6ab0 Matthew Wilcox (Oracle  2022-02-09   941) 				folio_unlock(folio);
af9cc401ce7452 Yan, Zheng              2018-03-04   942  				continue;
af9cc401ce7452 Yan, Zheng              2018-03-04   943  			}
af9cc401ce7452 Yan, Zheng              2018-03-04   944  			if (strip_unit_end && (page->index > strip_unit_end)) {
af9cc401ce7452 Yan, Zheng              2018-03-04   945  				dout("end of strip unit %p\n", page);
1d3576fd10f0d7 Sage Weil               2009-10-06   946  				unlock_page(page);
1d3576fd10f0d7 Sage Weil               2009-10-06   947  				break;
1d3576fd10f0d7 Sage Weil               2009-10-06   948  			}
1702e79734104d Jeff Layton             2021-12-07   949  			if (PageWriteback(page) || PageFsCache(page)) {
0713e5f24b7deb Yan, Zheng              2017-08-31   950  				if (wbc->sync_mode == WB_SYNC_NONE) {
1d3576fd10f0d7 Sage Weil               2009-10-06   951  					dout("%p under writeback\n", page);
1d3576fd10f0d7 Sage Weil               2009-10-06   952  					unlock_page(page);
0713e5f24b7deb Yan, Zheng              2017-08-31   953  					continue;
0713e5f24b7deb Yan, Zheng              2017-08-31   954  				}
0713e5f24b7deb Yan, Zheng              2017-08-31   955  				dout("waiting on writeback %p\n", page);
0713e5f24b7deb Yan, Zheng              2017-08-31   956  				wait_on_page_writeback(page);
1702e79734104d Jeff Layton             2021-12-07   957  				wait_on_page_fscache(page);
1d3576fd10f0d7 Sage Weil               2009-10-06   958  			}
1d3576fd10f0d7 Sage Weil               2009-10-06   959  
1d3576fd10f0d7 Sage Weil               2009-10-06   960  			if (!clear_page_dirty_for_io(page)) {
1d3576fd10f0d7 Sage Weil               2009-10-06   961  				dout("%p !clear_page_dirty_for_io\n", page);
1d3576fd10f0d7 Sage Weil               2009-10-06   962  				unlock_page(page);
0713e5f24b7deb Yan, Zheng              2017-08-31   963  				continue;
1d3576fd10f0d7 Sage Weil               2009-10-06   964  			}
1d3576fd10f0d7 Sage Weil               2009-10-06   965  
e5975c7c8eb6ae Alex Elder              2013-03-14   966  			/*
e5975c7c8eb6ae Alex Elder              2013-03-14   967  			 * We have something to write.  If this is
e5975c7c8eb6ae Alex Elder              2013-03-14   968  			 * the first locked page this time through,
5b64640cf65be4 Yan, Zheng              2016-01-07   969  			 * calculate max possinle write size and
5b64640cf65be4 Yan, Zheng              2016-01-07   970  			 * allocate a page array
e5975c7c8eb6ae Alex Elder              2013-03-14   971  			 */
1d3576fd10f0d7 Sage Weil               2009-10-06   972  			if (locked_pages == 0) {
5b64640cf65be4 Yan, Zheng              2016-01-07   973  				u64 objnum;
5b64640cf65be4 Yan, Zheng              2016-01-07   974  				u64 objoff;
dccbf08005df80 Ilya Dryomov            2018-02-17   975  				u32 xlen;
5b64640cf65be4 Yan, Zheng              2016-01-07   976  
1d3576fd10f0d7 Sage Weil               2009-10-06   977  				/* prepare async write request */
6285bc23127741 Alex Elder              2012-10-02   978  				offset = (u64)page_offset(page);
dccbf08005df80 Ilya Dryomov            2018-02-17   979  				ceph_calc_file_object_mapping(&ci->i_layout,
dccbf08005df80 Ilya Dryomov            2018-02-17   980  							      offset, wsize,
5b64640cf65be4 Yan, Zheng              2016-01-07   981  							      &objnum, &objoff,
dccbf08005df80 Ilya Dryomov            2018-02-17   982  							      &xlen);
dccbf08005df80 Ilya Dryomov            2018-02-17   983  				len = xlen;
8c71897be2ddfd Henry C Chang           2011-05-03   984  
3fb99d483e614b Yanhu Cao               2017-07-21   985  				num_ops = 1;
5b64640cf65be4 Yan, Zheng              2016-01-07   986  				strip_unit_end = page->index +
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01   987  					((len - 1) >> PAGE_SHIFT);
88486957f9fbf5 Alex Elder              2013-03-14   988  
5b64640cf65be4 Yan, Zheng              2016-01-07   989  				BUG_ON(pages);
88486957f9fbf5 Alex Elder              2013-03-14   990  				max_pages = calc_pages_for(0, (u64)len);
6da2ec56059c3c Kees Cook               2018-06-12   991  				pages = kmalloc_array(max_pages,
6da2ec56059c3c Kees Cook               2018-06-12   992  						      sizeof(*pages),
fc2744aa12da71 Yan, Zheng              2013-05-31   993  						      GFP_NOFS);
88486957f9fbf5 Alex Elder              2013-03-14   994  				if (!pages) {
a0102bda5bc099 Jeff Layton             2020-07-30   995  					from_pool = true;
a0102bda5bc099 Jeff Layton             2020-07-30   996  					pages = mempool_alloc(ceph_wb_pagevec_pool, GFP_NOFS);
e5975c7c8eb6ae Alex Elder              2013-03-14   997  					BUG_ON(!pages);
88486957f9fbf5 Alex Elder              2013-03-14   998  				}
5b64640cf65be4 Yan, Zheng              2016-01-07   999  
5b64640cf65be4 Yan, Zheng              2016-01-07  1000  				len = 0;
5b64640cf65be4 Yan, Zheng              2016-01-07  1001  			} else if (page->index !=
09cbfeaf1a5a67 Kirill A. Shutemov      2016-04-01  1002  				   (offset + len) >> PAGE_SHIFT) {
a0102bda5bc099 Jeff Layton             2020-07-30  1003  				if (num_ops >= (from_pool ?  CEPH_OSD_SLAB_OPS :
5b64640cf65be4 Yan, Zheng              2016-01-07  1004  							     CEPH_OSD_MAX_OPS)) {
5b64640cf65be4 Yan, Zheng              2016-01-07  1005  					redirty_page_for_writepage(wbc, page);
5b64640cf65be4 Yan, Zheng              2016-01-07  1006  					unlock_page(page);
5b64640cf65be4 Yan, Zheng              2016-01-07  1007  					break;
5b64640cf65be4 Yan, Zheng              2016-01-07  1008  				}
5b64640cf65be4 Yan, Zheng              2016-01-07  1009  
5b64640cf65be4 Yan, Zheng              2016-01-07  1010  				num_ops++;
5b64640cf65be4 Yan, Zheng              2016-01-07  1011  				offset = (u64)page_offset(page);
5b64640cf65be4 Yan, Zheng              2016-01-07  1012  				len = 0;
1d3576fd10f0d7 Sage Weil               2009-10-06  1013  			}
1d3576fd10f0d7 Sage Weil               2009-10-06  1014  
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1015) 			/* note position of first page in fbatch */
1d3576fd10f0d7 Sage Weil               2009-10-06  1016  			dout("%p will write page %p idx %lu\n",
1d3576fd10f0d7 Sage Weil               2009-10-06  1017  			     inode, page, page->index);
2baba25019ec56 Yehuda Sadeh            2009-12-18  1018  
5b64640cf65be4 Yan, Zheng              2016-01-07  1019  			if (atomic_long_inc_return(&fsc->writeback_count) >
5b64640cf65be4 Yan, Zheng              2016-01-07  1020  			    CONGESTION_ON_THRESH(
503d4fa6ee28e8 NeilBrown               2022-03-22  1021  				    fsc->mount_options->congestion_kb))
503d4fa6ee28e8 NeilBrown               2022-03-22  1022  				fsc->write_congested = true;
0713e5f24b7deb Yan, Zheng              2017-08-31  1023  
0713e5f24b7deb Yan, Zheng              2017-08-31  1024  			pages[locked_pages++] = page;
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1025) 			fbatch.folios[i] = NULL;
0713e5f24b7deb Yan, Zheng              2017-08-31  1026  
8ff2d290c8ce77 Jeff Layton             2021-04-05  1027  			len += thp_size(page);
1d3576fd10f0d7 Sage Weil               2009-10-06  1028  		}
1d3576fd10f0d7 Sage Weil               2009-10-06  1029  
1d3576fd10f0d7 Sage Weil               2009-10-06  1030  		/* did we get anything? */
1d3576fd10f0d7 Sage Weil               2009-10-06  1031  		if (!locked_pages)
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1032) 			goto release_folios;
1d3576fd10f0d7 Sage Weil               2009-10-06  1033  		if (i) {
0713e5f24b7deb Yan, Zheng              2017-08-31  1034  			unsigned j, n = 0;
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1035) 			/* shift unused page to beginning of fbatch */
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1036) 			for (j = 0; j < nr_folios; j++) {
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1037) 				if (!fbatch.folios[j])
0713e5f24b7deb Yan, Zheng              2017-08-31  1038  					continue;
0713e5f24b7deb Yan, Zheng              2017-08-31  1039  				if (n < j)
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1040) 					fbatch.folios[n] = fbatch.folios[j];
0713e5f24b7deb Yan, Zheng              2017-08-31  1041  				n++;
0713e5f24b7deb Yan, Zheng              2017-08-31  1042  			}
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1043) 			fbatch.nr = n;
1d3576fd10f0d7 Sage Weil               2009-10-06  1044  
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1045) 			if (nr_folios && i == nr_folios &&
1d3576fd10f0d7 Sage Weil               2009-10-06  1046  			    locked_pages < max_pages) {
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1047) 				dout("reached end fbatch, trying for more\n");
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1048) 				folio_batch_release(&fbatch);
1d3576fd10f0d7 Sage Weil               2009-10-06  1049  				goto get_more_pages;
1d3576fd10f0d7 Sage Weil               2009-10-06  1050  			}
1d3576fd10f0d7 Sage Weil               2009-10-06  1051  		}
1d3576fd10f0d7 Sage Weil               2009-10-06  1052  
5b64640cf65be4 Yan, Zheng              2016-01-07  1053  new_request:
e5975c7c8eb6ae Alex Elder              2013-03-14  1054  		offset = page_offset(pages[0]);
5b64640cf65be4 Yan, Zheng              2016-01-07  1055  		len = wsize;
5b64640cf65be4 Yan, Zheng              2016-01-07  1056  
5b64640cf65be4 Yan, Zheng              2016-01-07  1057  		req = ceph_osdc_new_request(&fsc->client->osdc,
5b64640cf65be4 Yan, Zheng              2016-01-07  1058  					&ci->i_layout, vino,
5b64640cf65be4 Yan, Zheng              2016-01-07  1059  					offset, &len, 0, num_ops,
1f934b00e90752 Yan, Zheng              2017-08-30  1060  					CEPH_OSD_OP_WRITE, CEPH_OSD_FLAG_WRITE,
1f934b00e90752 Yan, Zheng              2017-08-30  1061  					snapc, ceph_wbc.truncate_seq,
1f934b00e90752 Yan, Zheng              2017-08-30  1062  					ceph_wbc.truncate_size, false);
5b64640cf65be4 Yan, Zheng              2016-01-07  1063  		if (IS_ERR(req)) {
5b64640cf65be4 Yan, Zheng              2016-01-07  1064  			req = ceph_osdc_new_request(&fsc->client->osdc,
5b64640cf65be4 Yan, Zheng              2016-01-07  1065  						&ci->i_layout, vino,
5b64640cf65be4 Yan, Zheng              2016-01-07  1066  						offset, &len, 0,
5b64640cf65be4 Yan, Zheng              2016-01-07  1067  						min(num_ops,
5b64640cf65be4 Yan, Zheng              2016-01-07  1068  						    CEPH_OSD_SLAB_OPS),
5b64640cf65be4 Yan, Zheng              2016-01-07  1069  						CEPH_OSD_OP_WRITE,
54ea0046b6fe36 Ilya Dryomov            2017-02-11  1070  						CEPH_OSD_FLAG_WRITE,
1f934b00e90752 Yan, Zheng              2017-08-30  1071  						snapc, ceph_wbc.truncate_seq,
1f934b00e90752 Yan, Zheng              2017-08-30  1072  						ceph_wbc.truncate_size, true);
5b64640cf65be4 Yan, Zheng              2016-01-07  1073  			BUG_ON(IS_ERR(req));
5b64640cf65be4 Yan, Zheng              2016-01-07  1074  		}
5b64640cf65be4 Yan, Zheng              2016-01-07  1075  		BUG_ON(len < page_offset(pages[locked_pages - 1]) +
8ff2d290c8ce77 Jeff Layton             2021-04-05  1076  			     thp_size(page) - offset);
5b64640cf65be4 Yan, Zheng              2016-01-07  1077  
5b64640cf65be4 Yan, Zheng              2016-01-07  1078  		req->r_callback = writepages_finish;
5b64640cf65be4 Yan, Zheng              2016-01-07  1079  		req->r_inode = inode;
5b64640cf65be4 Yan, Zheng              2016-01-07  1080  
5b64640cf65be4 Yan, Zheng              2016-01-07  1081  		/* Format the osd request message and submit the write */
5b64640cf65be4 Yan, Zheng              2016-01-07  1082  		len = 0;
5b64640cf65be4 Yan, Zheng              2016-01-07  1083  		data_pages = pages;
5b64640cf65be4 Yan, Zheng              2016-01-07  1084  		op_idx = 0;
5b64640cf65be4 Yan, Zheng              2016-01-07  1085  		for (i = 0; i < locked_pages; i++) {
5b64640cf65be4 Yan, Zheng              2016-01-07  1086  			u64 cur_offset = page_offset(pages[i]);
1702e79734104d Jeff Layton             2021-12-07  1087  			/*
1702e79734104d Jeff Layton             2021-12-07  1088  			 * Discontinuity in page range? Ceph can handle that by just passing
1702e79734104d Jeff Layton             2021-12-07  1089  			 * multiple extents in the write op.
1702e79734104d Jeff Layton             2021-12-07  1090  			 */
5b64640cf65be4 Yan, Zheng              2016-01-07  1091  			if (offset + len != cur_offset) {
1702e79734104d Jeff Layton             2021-12-07  1092  				/* If it's full, stop here */
3fb99d483e614b Yanhu Cao               2017-07-21  1093  				if (op_idx + 1 == req->r_num_ops)
5b64640cf65be4 Yan, Zheng              2016-01-07  1094  					break;
1702e79734104d Jeff Layton             2021-12-07  1095  
1702e79734104d Jeff Layton             2021-12-07  1096  				/* Kick off an fscache write with what we have so far. */
1702e79734104d Jeff Layton             2021-12-07  1097  				ceph_fscache_write_to_cache(inode, offset, len, caching);
1702e79734104d Jeff Layton             2021-12-07  1098  
1702e79734104d Jeff Layton             2021-12-07  1099  				/* Start a new extent */
5b64640cf65be4 Yan, Zheng              2016-01-07  1100  				osd_req_op_extent_dup_last(req, op_idx,
5b64640cf65be4 Yan, Zheng              2016-01-07  1101  							   cur_offset - offset);
5b64640cf65be4 Yan, Zheng              2016-01-07  1102  				dout("writepages got pages at %llu~%llu\n",
5b64640cf65be4 Yan, Zheng              2016-01-07  1103  				     offset, len);
5b64640cf65be4 Yan, Zheng              2016-01-07  1104  				osd_req_op_extent_osd_data_pages(req, op_idx,
5b64640cf65be4 Yan, Zheng              2016-01-07  1105  							data_pages, len, 0,
a0102bda5bc099 Jeff Layton             2020-07-30  1106  							from_pool, false);
5b64640cf65be4 Yan, Zheng              2016-01-07  1107  				osd_req_op_extent_update(req, op_idx, len);
5b64640cf65be4 Yan, Zheng              2016-01-07  1108  
5b64640cf65be4 Yan, Zheng              2016-01-07  1109  				len = 0;
5b64640cf65be4 Yan, Zheng              2016-01-07  1110  				offset = cur_offset;
5b64640cf65be4 Yan, Zheng              2016-01-07  1111  				data_pages = pages + i;
5b64640cf65be4 Yan, Zheng              2016-01-07  1112  				op_idx++;
5b64640cf65be4 Yan, Zheng              2016-01-07  1113  			}
5b64640cf65be4 Yan, Zheng              2016-01-07  1114  
5b64640cf65be4 Yan, Zheng              2016-01-07  1115  			set_page_writeback(pages[i]);
1702e79734104d Jeff Layton             2021-12-07  1116  			if (caching)
1702e79734104d Jeff Layton             2021-12-07  1117  				ceph_set_page_fscache(pages[i]);
8ff2d290c8ce77 Jeff Layton             2021-04-05  1118  			len += thp_size(page);
5b64640cf65be4 Yan, Zheng              2016-01-07  1119  		}
1702e79734104d Jeff Layton             2021-12-07  1120  		ceph_fscache_write_to_cache(inode, offset, len, caching);
5b64640cf65be4 Yan, Zheng              2016-01-07  1121  
1f934b00e90752 Yan, Zheng              2017-08-30  1122  		if (ceph_wbc.size_stable) {
1f934b00e90752 Yan, Zheng              2017-08-30  1123  			len = min(len, ceph_wbc.i_size - offset);
5b64640cf65be4 Yan, Zheng              2016-01-07  1124  		} else if (i == locked_pages) {
e1966b49446a43 Yan, Zheng              2015-06-18  1125  			/* writepages_finish() clears writeback pages
e1966b49446a43 Yan, Zheng              2015-06-18  1126  			 * according to the data length, so make sure
e1966b49446a43 Yan, Zheng              2015-06-18  1127  			 * data length covers all locked pages */
8ff2d290c8ce77 Jeff Layton             2021-04-05  1128  			u64 min_len = len + 1 - thp_size(page);
1f934b00e90752 Yan, Zheng              2017-08-30  1129  			len = get_writepages_data_length(inode, pages[i - 1],
1f934b00e90752 Yan, Zheng              2017-08-30  1130  							 offset);
5b64640cf65be4 Yan, Zheng              2016-01-07  1131  			len = max(len, min_len);
e1966b49446a43 Yan, Zheng              2015-06-18  1132  		}
5b64640cf65be4 Yan, Zheng              2016-01-07  1133  		dout("writepages got pages at %llu~%llu\n", offset, len);
1d3576fd10f0d7 Sage Weil               2009-10-06  1134  
5b64640cf65be4 Yan, Zheng              2016-01-07  1135  		osd_req_op_extent_osd_data_pages(req, op_idx, data_pages, len,
a0102bda5bc099 Jeff Layton             2020-07-30  1136  						 0, from_pool, false);
5b64640cf65be4 Yan, Zheng              2016-01-07  1137  		osd_req_op_extent_update(req, op_idx, len);
e5975c7c8eb6ae Alex Elder              2013-03-14  1138  
5b64640cf65be4 Yan, Zheng              2016-01-07  1139  		BUG_ON(op_idx + 1 != req->r_num_ops);
e5975c7c8eb6ae Alex Elder              2013-03-14  1140  
a0102bda5bc099 Jeff Layton             2020-07-30  1141  		from_pool = false;
5b64640cf65be4 Yan, Zheng              2016-01-07  1142  		if (i < locked_pages) {
5b64640cf65be4 Yan, Zheng              2016-01-07  1143  			BUG_ON(num_ops <= req->r_num_ops);
5b64640cf65be4 Yan, Zheng              2016-01-07  1144  			num_ops -= req->r_num_ops;
5b64640cf65be4 Yan, Zheng              2016-01-07  1145  			locked_pages -= i;
5b64640cf65be4 Yan, Zheng              2016-01-07  1146  
5b64640cf65be4 Yan, Zheng              2016-01-07  1147  			/* allocate new pages array for next request */
5b64640cf65be4 Yan, Zheng              2016-01-07  1148  			data_pages = pages;
6da2ec56059c3c Kees Cook               2018-06-12  1149  			pages = kmalloc_array(locked_pages, sizeof(*pages),
5b64640cf65be4 Yan, Zheng              2016-01-07  1150  					      GFP_NOFS);
5b64640cf65be4 Yan, Zheng              2016-01-07  1151  			if (!pages) {
a0102bda5bc099 Jeff Layton             2020-07-30  1152  				from_pool = true;
a0102bda5bc099 Jeff Layton             2020-07-30  1153  				pages = mempool_alloc(ceph_wb_pagevec_pool, GFP_NOFS);
5b64640cf65be4 Yan, Zheng              2016-01-07  1154  				BUG_ON(!pages);
5b64640cf65be4 Yan, Zheng              2016-01-07  1155  			}
5b64640cf65be4 Yan, Zheng              2016-01-07  1156  			memcpy(pages, data_pages + i,
5b64640cf65be4 Yan, Zheng              2016-01-07  1157  			       locked_pages * sizeof(*pages));
5b64640cf65be4 Yan, Zheng              2016-01-07  1158  			memset(data_pages + i, 0,
5b64640cf65be4 Yan, Zheng              2016-01-07  1159  			       locked_pages * sizeof(*pages));
5b64640cf65be4 Yan, Zheng              2016-01-07  1160  		} else {
5b64640cf65be4 Yan, Zheng              2016-01-07  1161  			BUG_ON(num_ops != req->r_num_ops);
5b64640cf65be4 Yan, Zheng              2016-01-07  1162  			index = pages[i - 1]->index + 1;
5b64640cf65be4 Yan, Zheng              2016-01-07  1163  			/* request message now owns the pages array */
5b64640cf65be4 Yan, Zheng              2016-01-07  1164  			pages = NULL;
5b64640cf65be4 Yan, Zheng              2016-01-07  1165  		}
e5975c7c8eb6ae Alex Elder              2013-03-14  1166  
fac02ddf910814 Arnd Bergmann           2018-07-13  1167  		req->r_mtime = inode->i_mtime;
a8af0d682ae0c9 Jeff Layton             2022-06-30  1168  		ceph_osdc_start_request(&fsc->client->osdc, req);
1d3576fd10f0d7 Sage Weil               2009-10-06  1169  		req = NULL;
1d3576fd10f0d7 Sage Weil               2009-10-06  1170  
5b64640cf65be4 Yan, Zheng              2016-01-07  1171  		wbc->nr_to_write -= i;
5b64640cf65be4 Yan, Zheng              2016-01-07  1172  		if (pages)
5b64640cf65be4 Yan, Zheng              2016-01-07  1173  			goto new_request;
5b64640cf65be4 Yan, Zheng              2016-01-07  1174  
2a2d927e35dd8d Yan, Zheng              2017-09-01  1175  		/*
2a2d927e35dd8d Yan, Zheng              2017-09-01  1176  		 * We stop writing back only if we are not doing
2a2d927e35dd8d Yan, Zheng              2017-09-01  1177  		 * integrity sync. In case of integrity sync we have to
2a2d927e35dd8d Yan, Zheng              2017-09-01  1178  		 * keep going until we have written all the pages
2a2d927e35dd8d Yan, Zheng              2017-09-01  1179  		 * we tagged for writeback prior to entering this loop.
2a2d927e35dd8d Yan, Zheng              2017-09-01  1180  		 */
2a2d927e35dd8d Yan, Zheng              2017-09-01  1181  		if (wbc->nr_to_write <= 0 && wbc->sync_mode == WB_SYNC_NONE)
af9cc401ce7452 Yan, Zheng              2018-03-04  1182  			done = true;
1d3576fd10f0d7 Sage Weil               2009-10-06  1183  
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1184) release_folios:
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1185) 		dout("folio_batch release on %d folios (%p)\n", (int)fbatch.nr,
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1186) 		     fbatch.nr ? fbatch.folios[0] : NULL);
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1187) 		folio_batch_release(&fbatch);
1d3576fd10f0d7 Sage Weil               2009-10-06  1188  	}
1d3576fd10f0d7 Sage Weil               2009-10-06  1189  
1d3576fd10f0d7 Sage Weil               2009-10-06  1190  	if (should_loop && !done) {
1d3576fd10f0d7 Sage Weil               2009-10-06  1191  		/* more to do; loop back to beginning of file */
1d3576fd10f0d7 Sage Weil               2009-10-06  1192  		dout("writepages looping back to beginning of file\n");
2a2d927e35dd8d Yan, Zheng              2017-09-01  1193  		end = start_index - 1; /* OK even when start_index == 0 */
f275635ee0b664 Yan, Zheng              2017-09-01  1194  
f275635ee0b664 Yan, Zheng              2017-09-01  1195  		/* to write dirty pages associated with next snapc,
f275635ee0b664 Yan, Zheng              2017-09-01  1196  		 * we need to wait until current writes complete */
f275635ee0b664 Yan, Zheng              2017-09-01  1197  		if (wbc->sync_mode != WB_SYNC_NONE &&
f275635ee0b664 Yan, Zheng              2017-09-01  1198  		    start_index == 0 && /* all dirty pages were checked */
f275635ee0b664 Yan, Zheng              2017-09-01  1199  		    !ceph_wbc.head_snapc) {
f275635ee0b664 Yan, Zheng              2017-09-01  1200  			struct page *page;
f275635ee0b664 Yan, Zheng              2017-09-01  1201  			unsigned i, nr;
f275635ee0b664 Yan, Zheng              2017-09-01  1202  			index = 0;
f275635ee0b664 Yan, Zheng              2017-09-01  1203  			while ((index <= end) &&
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1204) 			       (nr = filemap_get_folios_tag(mapping, &index,
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1205) 						(pgoff_t)-1,
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1206) 						PAGECACHE_TAG_WRITEBACK,
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1207) 						&fbatch))) {
f275635ee0b664 Yan, Zheng              2017-09-01  1208  				for (i = 0; i < nr; i++) {
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1209) 					page = &fbatch.folios[i]->page;
f275635ee0b664 Yan, Zheng              2017-09-01  1210  					if (page_snap_context(page) != snapc)
f275635ee0b664 Yan, Zheng              2017-09-01  1211  						continue;
f275635ee0b664 Yan, Zheng              2017-09-01  1212  					wait_on_page_writeback(page);
f275635ee0b664 Yan, Zheng              2017-09-01  1213  				}
590a2b5f0a9b74 Vishal Moola (Oracle    2023-01-04  1214) 				folio_batch_release(&fbatch);
f275635ee0b664 Yan, Zheng              2017-09-01  1215  				cond_resched();
f275635ee0b664 Yan, Zheng              2017-09-01  1216  			}
f275635ee0b664 Yan, Zheng              2017-09-01  1217  		}
f275635ee0b664 Yan, Zheng              2017-09-01  1218  
2a2d927e35dd8d Yan, Zheng              2017-09-01  1219  		start_index = 0;
1d3576fd10f0d7 Sage Weil               2009-10-06  1220  		index = 0;
1d3576fd10f0d7 Sage Weil               2009-10-06  1221  		goto retry;
1d3576fd10f0d7 Sage Weil               2009-10-06  1222  	}
1d3576fd10f0d7 Sage Weil               2009-10-06  1223  
1d3576fd10f0d7 Sage Weil               2009-10-06  1224  	if (wbc->range_cyclic || (range_whole && wbc->nr_to_write > 0))
1d3576fd10f0d7 Sage Weil               2009-10-06  1225  		mapping->writeback_index = index;
1d3576fd10f0d7 Sage Weil               2009-10-06  1226  
1d3576fd10f0d7 Sage Weil               2009-10-06  1227  out:
1d3576fd10f0d7 Sage Weil               2009-10-06  1228  	ceph_osdc_put_request(req);
2a2d927e35dd8d Yan, Zheng              2017-09-01  1229  	ceph_put_snap_context(last_snapc);
2a2d927e35dd8d Yan, Zheng              2017-09-01  1230  	dout("writepages dend - startone, rc = %d\n", rc);
1d3576fd10f0d7 Sage Weil               2009-10-06  1231  	return rc;
1d3576fd10f0d7 Sage Weil               2009-10-06  1232  }
1d3576fd10f0d7 Sage Weil               2009-10-06  1233  

:::::: The code at line 794 was first introduced by commit
:::::: 1d3576fd10f0d7a104204267b81cf84a07028dad ceph: address space operations

:::::: TO: Sage Weil <sage@newdream.net>
:::::: CC: Sage Weil <sage@newdream.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
