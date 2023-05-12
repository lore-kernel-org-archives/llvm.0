Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A089460;
	Fri, 12 May 2023 08:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683881689; x=1715417689;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZLf5MT4SG1toK2Ewf11jOOLaMp++8Z7s0AFeltCagdg=;
  b=NZxDIEra23LyeVqNgFluflWGoPi6pF29wb/FKB06Y9Im42qmX14ps1QP
   GEL/wsyirkbMUw8K6lO20hTFs1gAwQryDMMxZnqQhtwZalvLsi67Aez82
   XfV9OW3Dg77AEH1vnpRvxXsuwW7fDY0/yiQF4jgw7rK18z50FrVbl6Qpx
   U1yrYkoG904Q+9ozx9IEBekFq7Pvsdp8qxeaQoCclpPDfxpBiVgxUQwi0
   6TYTsQtmCbmm+nJp1DQCtuirEvRKdBBkhWxRXed/rDK388pD4mvNxpjeE
   wbV4wwATfenmx8pFsg5dUuHXiEuVyxEdFZqfX5XkKgvggARyYPOgUqjIQ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353874494"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353874494"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 01:54:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="700106937"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="700106937"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 12 May 2023 01:54:44 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxOXz-0004jE-12;
	Fri, 12 May 2023 08:54:43 +0000
Date: Fri, 12 May 2023 16:54:24 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
	Phillip Lougher <phillip@squashfs.org.uk>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Philippe Liard <pliard@google.com>, hch@lst.de,
	linux-kernel@vger.kernel.org, squashfs-devel@lists.sourceforge.net,
	kernel@axis.com, Vincent Whitchurch <vincent.whitchurch@axis.com>
Subject: Re: [PATCH] squashfs: cache partial compressed blocks
Message-ID: <202305121650.kWn3uM2f-lkp@intel.com>
References: <20230510-squashfs-cache-v1-1-3b6bb0e7d952@axis.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230510-squashfs-cache-v1-1-3b6bb0e7d952@axis.com>

Hi Vincent,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 457391b0380335d5e9a5babdec90ac53928b23b4]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Whitchurch/squashfs-cache-partial-compressed-blocks/20230512-143553
base:   457391b0380335d5e9a5babdec90ac53928b23b4
patch link:    https://lore.kernel.org/r/20230510-squashfs-cache-v1-1-3b6bb0e7d952%40axis.com
patch subject: [PATCH] squashfs: cache partial compressed blocks
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230512/202305121650.kWn3uM2f-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3ca22c93f1faf376ecf133f84d0148497284366a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Vincent-Whitchurch/squashfs-cache-partial-compressed-blocks/20230512-143553
        git checkout 3ca22c93f1faf376ecf133f84d0148497284366a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/squashfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305121650.kWn3uM2f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/squashfs/block.c:168:5: warning: no previous prototype for function 'squashfs_bio_read' [-Wmissing-prototypes]
   int squashfs_bio_read(struct super_block *sb, u64 index, int length,
       ^
   fs/squashfs/block.c:168:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int squashfs_bio_read(struct super_block *sb, u64 index, int length,
   ^
   static 
   1 warning generated.


vim +/squashfs_bio_read +168 fs/squashfs/block.c

   167	
 > 168	int squashfs_bio_read(struct super_block *sb, u64 index, int length,
   169				     struct bio **biop, int *block_offset)
   170	{
   171		struct squashfs_sb_info *msblk = sb->s_fs_info;
   172		struct inode *cache_inode = msblk->cache_inode;
   173		struct address_space *cache_mapping = cache_inode ? cache_inode->i_mapping : NULL;
   174		const u64 read_start = round_down(index, msblk->devblksize);
   175		const sector_t block = read_start >> msblk->devblksize_log2;
   176		const u64 read_end = round_up(index + length, msblk->devblksize);
   177		const sector_t block_end = read_end >> msblk->devblksize_log2;
   178		int offset = read_start - round_down(index, PAGE_SIZE);
   179		int total_len = (block_end - block) << msblk->devblksize_log2;
   180		const int page_count = DIV_ROUND_UP(total_len + offset, PAGE_SIZE);
   181		int error, i;
   182		struct bio *bio;
   183	
   184		bio = bio_kmalloc(page_count, GFP_NOIO);
   185		if (!bio)
   186			return -ENOMEM;
   187		bio_init(bio, sb->s_bdev, bio->bi_inline_vecs, page_count, REQ_OP_READ);
   188		bio->bi_iter.bi_sector = block * (msblk->devblksize >> SECTOR_SHIFT);
   189	
   190		for (i = 0; i < page_count; ++i) {
   191			unsigned int len =
   192				min_t(unsigned int, PAGE_SIZE - offset, total_len);
   193			struct page *page = NULL;
   194	
   195			if (cache_mapping)
   196				page = find_get_page(cache_mapping,
   197						     read_start + i * PAGE_SIZE);
   198			if (!page)
   199				page = alloc_page(GFP_NOIO);
   200	
   201			if (!page) {
   202				error = -ENOMEM;
   203				goto out_free_bio;
   204			}
   205	
   206			if (cache_mapping) {
   207				/*
   208				 * Use the __ version to avoid merging since we need
   209				 * each page to be separate when we check for and avoid
   210				 * cached pages.
   211				 */
   212				__bio_add_page(bio, page, len, offset);
   213			} else if (!bio_add_page(bio, page, len, offset)) {
   214				error = -EIO;
   215				goto out_free_bio;
   216			}
   217			offset = 0;
   218			total_len -= len;
   219		}
   220	
   221		if (cache_mapping)
   222			error = squashfs_bio_read_cached(bio, cache_mapping, index,
   223							 length, read_start, read_end,
   224							 page_count);
   225		else
   226			error = submit_bio_wait(bio);
   227		if (error)
   228			goto out_free_bio;
   229	
   230		*biop = bio;
   231		*block_offset = index & ((1 << msblk->devblksize_log2) - 1);
   232		return 0;
   233	
   234	out_free_bio:
   235		bio_free_pages(bio);
   236		bio_uninit(bio);
   237		kfree(bio);
   238		return error;
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
