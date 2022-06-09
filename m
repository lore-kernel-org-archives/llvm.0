Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951C3210
	for <llvm@lists.linux.dev>; Thu,  9 Jun 2022 15:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654788468; x=1686324468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aZv0T36vGfEf7pqwFa8crYKTlp0crC6xpuupvEHZFXg=;
  b=crzRkBZf6OB6KLfzSguFyNd1Dm/xm8cKrrj/91MtczAVXipkGYrCf6Z7
   0N165TcjgyTBu/uL1MPyiopgnKS/ALeXLzmhZGmmQRrjzOf/HgjZ7fRu5
   2GidkJXgGV4Kk1Qu4Bl7+PcoVqbQhu5tvg2TYNLvDZ3ngccIqbXJ5aIXj
   hKN7w5DjIpWR48aqG15el31xTmSUp0xF/Fvvys0nEeWwobdtsgQ/BsgW5
   w9/T1pbWxvAlzsIFjdRQQ2/cl4/p4R7J8EwI9OXTfSgwTpUSNx/CBVeuF
   TVpRrB4TboQ27+VouhcqkdWepePgUnkCOFbahWgiUNYck6/cM5tr0l98u
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="260442247"
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="260442247"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2022 08:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,287,1647327600"; 
   d="scan'208";a="649317186"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Jun 2022 08:27:37 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nzK4P-000G5x-7K;
	Thu, 09 Jun 2022 15:27:37 +0000
Date: Thu, 9 Jun 2022 23:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v2 02/19] mm: Convert all PageMovable users to
 movable_operations
Message-ID: <202206092341.s0Iay4wA-lkp@intel.com>
References: <20220608150249.3033815-3-willy@infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220608150249.3033815-3-willy@infradead.org>

Hi "Matthew,

I love your patch! Perhaps something to improve:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[cannot apply to trondmy-nfs/linux-next xfs-linux/for-next next-20220609]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/Convert-aops-migratepage-to-aops-migrate_folio/20220608-231043
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
config: s390-randconfig-r036-20220608 (https://download.01.org/0day-ci/archive/20220609/202206092341.s0Iay4wA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7fd2c06d9eaa28dfc922d77aeb62e6454ed7d831
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Matthew-Wilcox-Oracle/Convert-aops-migratepage-to-aops-migrate_folio/20220608-231043
        git checkout 7fd2c06d9eaa28dfc922d77aeb62e6454ed7d831
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/z3fold.c:1505:24: warning: variable 'new_mapping' set but not used [-Wunused-but-set-variable]
           struct address_space *new_mapping;
                                 ^
   1 warning generated.


vim +/new_mapping +1505 mm/z3fold.c

1f862989b04ade Vitaly Wool             2019-05-13  1499  
7fd2c06d9eaa28 Matthew Wilcox (Oracle  2022-06-08  1500) static int z3fold_page_migrate(struct page *newpage, struct page *page,
7fd2c06d9eaa28 Matthew Wilcox (Oracle  2022-06-08  1501) 		enum migrate_mode mode)
1f862989b04ade Vitaly Wool             2019-05-13  1502  {
1f862989b04ade Vitaly Wool             2019-05-13  1503  	struct z3fold_header *zhdr, *new_zhdr;
1f862989b04ade Vitaly Wool             2019-05-13  1504  	struct z3fold_pool *pool;
1f862989b04ade Vitaly Wool             2019-05-13 @1505  	struct address_space *new_mapping;
1f862989b04ade Vitaly Wool             2019-05-13  1506  
1f862989b04ade Vitaly Wool             2019-05-13  1507  	VM_BUG_ON_PAGE(!PageMovable(page), page);
1f862989b04ade Vitaly Wool             2019-05-13  1508  	VM_BUG_ON_PAGE(!PageIsolated(page), page);
dcf5aedb24f899 Vitaly Wool             2020-12-14  1509  	VM_BUG_ON_PAGE(!test_bit(PAGE_CLAIMED, &page->private), page);
810481a2460891 Henry Burns             2019-07-11  1510  	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
1f862989b04ade Vitaly Wool             2019-05-13  1511  
1f862989b04ade Vitaly Wool             2019-05-13  1512  	zhdr = page_address(page);
1f862989b04ade Vitaly Wool             2019-05-13  1513  	pool = zhdr_to_pool(zhdr);
1f862989b04ade Vitaly Wool             2019-05-13  1514  
dcf5aedb24f899 Vitaly Wool             2020-12-14  1515  	if (!z3fold_page_trylock(zhdr))
1f862989b04ade Vitaly Wool             2019-05-13  1516  		return -EAGAIN;
4a3ac9311dac38 Vitaly Wool             2019-11-30  1517  	if (zhdr->mapped_count != 0 || zhdr->foreign_handles != 0) {
dcf5aedb24f899 Vitaly Wool             2020-12-14  1518  		clear_bit(PAGE_CLAIMED, &page->private);
4a1c3839108afc Miaohe Lin              2022-04-29  1519  		z3fold_page_unlock(zhdr);
1f862989b04ade Vitaly Wool             2019-05-13  1520  		return -EBUSY;
1f862989b04ade Vitaly Wool             2019-05-13  1521  	}
c92d2f38563db2 Henry Burns             2019-07-16  1522  	if (work_pending(&zhdr->work)) {
c92d2f38563db2 Henry Burns             2019-07-16  1523  		z3fold_page_unlock(zhdr);
c92d2f38563db2 Henry Burns             2019-07-16  1524  		return -EAGAIN;
c92d2f38563db2 Henry Burns             2019-07-16  1525  	}
1f862989b04ade Vitaly Wool             2019-05-13  1526  	new_zhdr = page_address(newpage);
1f862989b04ade Vitaly Wool             2019-05-13  1527  	memcpy(new_zhdr, zhdr, PAGE_SIZE);
1f862989b04ade Vitaly Wool             2019-05-13  1528  	newpage->private = page->private;
943fb61dd66f47 Miaohe Lin              2022-04-29  1529  	set_bit(PAGE_MIGRATED, &page->private);
1f862989b04ade Vitaly Wool             2019-05-13  1530  	z3fold_page_unlock(zhdr);
1f862989b04ade Vitaly Wool             2019-05-13  1531  	spin_lock_init(&new_zhdr->page_lock);
c92d2f38563db2 Henry Burns             2019-07-16  1532  	INIT_WORK(&new_zhdr->work, compact_page_work);
c92d2f38563db2 Henry Burns             2019-07-16  1533  	/*
c92d2f38563db2 Henry Burns             2019-07-16  1534  	 * z3fold_page_isolate() ensures that new_zhdr->buddy is empty,
c92d2f38563db2 Henry Burns             2019-07-16  1535  	 * so we only have to reinitialize it.
c92d2f38563db2 Henry Burns             2019-07-16  1536  	 */
c92d2f38563db2 Henry Burns             2019-07-16  1537  	INIT_LIST_HEAD(&new_zhdr->buddy);
1f862989b04ade Vitaly Wool             2019-05-13  1538  	new_mapping = page_mapping(page);
1f862989b04ade Vitaly Wool             2019-05-13  1539  	__ClearPageMovable(page);
1f862989b04ade Vitaly Wool             2019-05-13  1540  
1f862989b04ade Vitaly Wool             2019-05-13  1541  	get_page(newpage);
1f862989b04ade Vitaly Wool             2019-05-13  1542  	z3fold_page_lock(new_zhdr);
1f862989b04ade Vitaly Wool             2019-05-13  1543  	if (new_zhdr->first_chunks)
1f862989b04ade Vitaly Wool             2019-05-13  1544  		encode_handle(new_zhdr, FIRST);
1f862989b04ade Vitaly Wool             2019-05-13  1545  	if (new_zhdr->last_chunks)
1f862989b04ade Vitaly Wool             2019-05-13  1546  		encode_handle(new_zhdr, LAST);
1f862989b04ade Vitaly Wool             2019-05-13  1547  	if (new_zhdr->middle_chunks)
1f862989b04ade Vitaly Wool             2019-05-13  1548  		encode_handle(new_zhdr, MIDDLE);
1f862989b04ade Vitaly Wool             2019-05-13  1549  	set_bit(NEEDS_COMPACTING, &newpage->private);
1f862989b04ade Vitaly Wool             2019-05-13  1550  	new_zhdr->cpu = smp_processor_id();
1f862989b04ade Vitaly Wool             2019-05-13  1551  	spin_lock(&pool->lock);
1f862989b04ade Vitaly Wool             2019-05-13  1552  	list_add(&newpage->lru, &pool->lru);
1f862989b04ade Vitaly Wool             2019-05-13  1553  	spin_unlock(&pool->lock);
7fd2c06d9eaa28 Matthew Wilcox (Oracle  2022-06-08  1554) 	__SetPageMovable(newpage, &z3fold_mops);
1f862989b04ade Vitaly Wool             2019-05-13  1555  	z3fold_page_unlock(new_zhdr);
1f862989b04ade Vitaly Wool             2019-05-13  1556  
1f862989b04ade Vitaly Wool             2019-05-13  1557  	queue_work_on(new_zhdr->cpu, pool->compact_wq, &new_zhdr->work);
1f862989b04ade Vitaly Wool             2019-05-13  1558  
943fb61dd66f47 Miaohe Lin              2022-04-29  1559  	/* PAGE_CLAIMED and PAGE_MIGRATED are cleared now. */
943fb61dd66f47 Miaohe Lin              2022-04-29  1560  	page->private = 0;
1f862989b04ade Vitaly Wool             2019-05-13  1561  	put_page(page);
1f862989b04ade Vitaly Wool             2019-05-13  1562  	return 0;
1f862989b04ade Vitaly Wool             2019-05-13  1563  }
1f862989b04ade Vitaly Wool             2019-05-13  1564  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
