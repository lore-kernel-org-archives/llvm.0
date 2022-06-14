Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A975F4693
	for <llvm@lists.linux.dev>; Tue, 14 Jun 2022 05:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655184437; x=1686720437;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=COT+kgd5eedc/FdqthVLIA930mEXjT/2DUeQL9vQadw=;
  b=SviAX2whaeG1yx3ZEkrsSjHVLl/qjslICi8D+eEFJXvWT58iwvLaYbE2
   g3HEYki7HYm3T8O1AVmO9iV3qzpdc5+aqzDJvBBQ0cFkQJqugrjdHTiPb
   LAixdsOipBPtauJHXv1pxQyuU8sZ5mabtjsTZZYFoREwI8rmAJo5tzxxb
   HinrjJCyknAOJnoM4EuysDRS9V7KP9C+XDArZwCyTgGX4sy+EG1GwrPOp
   xNGn8FAavvMnETw5EWYClQeLATS1yC5DDwhxHfeM59G3lsp3GP3Lm2Q72
   t+7FLZ3C+zhyrEcQwQBFat8aYRICd1qUVUj9sGH/SS5Ssi2pLzeJy2SIB
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="342476149"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="342476149"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2022 22:27:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; 
   d="scan'208";a="910786791"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jun 2022 22:27:15 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o0z58-000LW9-EJ;
	Tue, 14 Jun 2022 05:27:14 +0000
Date: Tue, 14 Jun 2022 13:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Daeho Jeong <daehojeong@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>
Subject: [jaegeuk-f2fs:dev-test 5/7] fs/f2fs/data.c:137:8: error: too many
 arguments to function call, expected 3, have 4
Message-ID: <202206141312.6Prd40vG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
head:   b133c2a8acb301652cdf98198f21b41e4c36c281
commit: 1b565702dffe0d67d19fce41be2eae24c0d19709 [5/7] f2fs: handle decompress only post processing in softirq
config: i386-randconfig-a004-20220613 (https://download.01.org/0day-ci/archive/20220614/202206141312.6Prd40vG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c97436f8b6e2718286e8496faf53a2c800e281cf)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?id=1b565702dffe0d67d19fce41be2eae24c0d19709
        git remote add jaegeuk-f2fs https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
        git fetch --no-tags jaegeuk-f2fs dev-test
        git checkout 1b565702dffe0d67d19fce41be2eae24c0d19709
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/f2fs/data.c:137:8: error: too many arguments to function call, expected 3, have 4
                                                           in_softirq);
                                                           ^~~~~~~~~~
   fs/f2fs/f2fs.h:4232:20: note: 'f2fs_end_read_compressed_page' declared here
   static inline void f2fs_end_read_compressed_page(struct page *page,
                      ^
>> fs/f2fs/data.c:138:28: error: too many arguments to function call, expected single argument 'page', have 2 arguments
                           f2fs_put_page_dic(page, in_softirq);
                           ~~~~~~~~~~~~~~~~~       ^~~~~~~~~~
   fs/f2fs/f2fs.h:4237:20: note: 'f2fs_put_page_dic' declared here
   static inline void f2fs_put_page_dic(struct page *page)
                      ^
   fs/f2fs/data.c:242:16: error: too many arguments to function call, expected 3, have 4
                                                   blkaddr, in_softirq);
                                                            ^~~~~~~~~~
   fs/f2fs/f2fs.h:4232:20: note: 'f2fs_end_read_compressed_page' declared here
   static inline void f2fs_end_read_compressed_page(struct page *page,
                      ^
   3 errors generated.


vim +137 fs/f2fs/data.c

   121	
   122	static void f2fs_finish_read_bio(struct bio *bio, bool in_softirq)
   123	{
   124		struct bio_vec *bv;
   125		struct bvec_iter_all iter_all;
   126	
   127		/*
   128		 * Update and unlock the bio's pagecache pages, and put the
   129		 * decompression context for any compressed pages.
   130		 */
   131		bio_for_each_segment_all(bv, bio, iter_all) {
   132			struct page *page = bv->bv_page;
   133	
   134			if (f2fs_is_compressed_page(page)) {
   135				if (bio->bi_status)
   136					f2fs_end_read_compressed_page(page, true, 0,
 > 137								in_softirq);
 > 138				f2fs_put_page_dic(page, in_softirq);
   139				continue;
   140			}
   141	
   142			/* PG_error was set if decryption or verity failed. */
   143			if (bio->bi_status || PageError(page)) {
   144				ClearPageUptodate(page);
   145				/* will re-read again later */
   146				ClearPageError(page);
   147			} else {
   148				SetPageUptodate(page);
   149			}
   150			dec_page_count(F2FS_P_SB(page), __read_io_type(page));
   151			unlock_page(page);
   152		}
   153	
   154		if (bio->bi_private)
   155			mempool_free(bio->bi_private, bio_post_read_ctx_pool);
   156		bio_put(bio);
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
