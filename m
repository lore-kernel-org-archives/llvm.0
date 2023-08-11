Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8EE65693;
	Fri, 11 Aug 2023 11:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691751870; x=1723287870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpmZPtW1ra+qIJSNTfp1DRqS4QGGB/tOBJ4zWYtsyOQ=;
  b=HFGTYQVJNEvcXGs+sS9mCWlXqDsmOiViwxHBI7wtwLlVazhQHD3VhEeM
   /2uPqKM5xzKDEQ38MAiEmtzzSxkaKYriXwd3/hmMSBGc2dfEtYHqxHL3L
   /+dFUkDk4iEAlQsF6TMWW4A/LIBZWeKZN8Sw2fyuet1NJ/EaaXKaQ9fQm
   BKcMsBQincbLLkshyjaQLsP+yK8SxmtcrTRIDPOXCcKTsakbu7BxuOlm3
   5HqsymrJjPpikaa3mKnaUG9VKDmTob/RW09Gv6R+xrD/H+8THRKPUpo+j
   rlwyuv+fYcMuqSU6dVUW+KFqzg+R5pBxN8tCjWFrWw8YlQ6iJKA3D1TYd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="374423381"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="374423381"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 04:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="876123250"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 11 Aug 2023 04:03:43 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUPvf-0007jU-1q;
	Fri, 11 Aug 2023 11:03:39 +0000
Date: Fri, 11 Aug 2023 19:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Sterba <dsterba@suse.com>, Josef Bacik <josef@toxicpanda.com>
Subject: [linux-next:master 4824/8441] fs/btrfs/extent_io.c:230:16: warning:
 variable 'pages_processed' set but not used
Message-ID: <202308111822.ITiKYDqp-lkp@intel.com>
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
commit: e74cd6ee58375cbdd85c01c93f75e34133ebea4d [4824/8441] btrfs: split page locking out of __process_pages_contig
config: powerpc-randconfig-r031-20230811 (https://download.01.org/0day-ci/archive/20230811/202308111822.ITiKYDqp-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111822.ITiKYDqp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111822.ITiKYDqp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/extent_io.c:230:16: warning: variable 'pages_processed' set but not used [-Wunused-but-set-variable]
           unsigned long pages_processed = 0;
                         ^
   1 warning generated.


vim +/pages_processed +230 fs/btrfs/extent_io.c

ed8f13bf4a2ccb Qu Wenruo             2021-05-31  221  
e74cd6ee58375c Christoph Hellwig     2023-06-28  222  static void __process_pages_contig(struct address_space *mapping,
e74cd6ee58375c Christoph Hellwig     2023-06-28  223  				   struct page *locked_page, u64 start, u64 end,
e74cd6ee58375c Christoph Hellwig     2023-06-28  224  				   unsigned long page_ops)
ed8f13bf4a2ccb Qu Wenruo             2021-05-31  225  {
e38992be1f6cf3 Qu Wenruo             2021-05-31  226  	struct btrfs_fs_info *fs_info = btrfs_sb(mapping->host->i_sb);
ed8f13bf4a2ccb Qu Wenruo             2021-05-31  227  	pgoff_t start_index = start >> PAGE_SHIFT;
ed8f13bf4a2ccb Qu Wenruo             2021-05-31  228  	pgoff_t end_index = end >> PAGE_SHIFT;
ed8f13bf4a2ccb Qu Wenruo             2021-05-31  229  	pgoff_t index = start_index;
ed8f13bf4a2ccb Qu Wenruo             2021-05-31 @230  	unsigned long pages_processed = 0;
04c6b79ae4f0bc Vishal Moola (Oracle  2022-08-23  231) 	struct folio_batch fbatch;
ed8f13bf4a2ccb Qu Wenruo             2021-05-31  232  	int i;
ed8f13bf4a2ccb Qu Wenruo             2021-05-31  233  
04c6b79ae4f0bc Vishal Moola (Oracle  2022-08-23  234) 	folio_batch_init(&fbatch);
04c6b79ae4f0bc Vishal Moola (Oracle  2022-08-23  235) 	while (index <= end_index) {
04c6b79ae4f0bc Vishal Moola (Oracle  2022-08-23  236) 		int found_folios;
04c6b79ae4f0bc Vishal Moola (Oracle  2022-08-23  237) 
04c6b79ae4f0bc Vishal Moola (Oracle  2022-08-23  238) 		found_folios = filemap_get_folios_contig(mapping, &index,
04c6b79ae4f0bc Vishal Moola (Oracle  2022-08-23  239) 				end_index, &fbatch);
04c6b79ae4f0bc Vishal Moola (Oracle  2022-08-23  240) 		for (i = 0; i < found_folios; i++) {
04c6b79ae4f0bc Vishal Moola (Oracle  2022-08-23  241) 			struct folio *folio = fbatch.folios[i];
e74cd6ee58375c Christoph Hellwig     2023-06-28  242  
e74cd6ee58375c Christoph Hellwig     2023-06-28  243  			process_one_page(fs_info, &folio->page, locked_page,
e74cd6ee58375c Christoph Hellwig     2023-06-28  244  					 page_ops, start, end);
04c6b79ae4f0bc Vishal Moola (Oracle  2022-08-23  245) 			pages_processed += folio_nr_pages(folio);
ed8f13bf4a2ccb Qu Wenruo             2021-05-31  246  		}
04c6b79ae4f0bc Vishal Moola (Oracle  2022-08-23  247) 		folio_batch_release(&fbatch);
ed8f13bf4a2ccb Qu Wenruo             2021-05-31  248  		cond_resched();
ed8f13bf4a2ccb Qu Wenruo             2021-05-31  249  	}
ed8f13bf4a2ccb Qu Wenruo             2021-05-31  250  }
da2c7009f6cafe Liu Bo                2017-02-10  251  

:::::: The code at line 230 was first introduced by commit
:::::: ed8f13bf4a2ccb6c90d3210421455c2ceae678de btrfs: refactor page status update into process_one_page()

:::::: TO: Qu Wenruo <wqu@suse.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
