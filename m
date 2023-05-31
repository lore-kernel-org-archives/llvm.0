Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92063168A8;
	Wed, 31 May 2023 23:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685575907; x=1717111907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kgWYocIFKq6N5hOQ6ZE26H5c77I91dB2Hu0FFqnOIoY=;
  b=HjR/kkW/KcVyKkKIQwhHQY/Cq/isYpDMkfQ8VcUkKqznELUFhWY1ZbJ1
   zBodSPxRNiXjpvW8cP2KiPQAiiutNkV2gOo+W5ImrQmCUnteUfosRC144
   yRno1X9qK38Nj+L0dATgYN186W0EDhEJH8PBi0S4NJMVthZ2l0iT0UpEb
   DfwX0hcvqXGhS1z4d9uuQ74KyNDPHTTnWg4EF8ei84otR8H1+I8hckfz8
   +aO2e2B43WOt6+R9liY7Gvs6bZJRWivUZFlrAMP/cLBl7IvvbcIiLw2k9
   Io0KkmkwnvMpXM8I9UHiv2b7KPyiqHw2ZKR4QYwB1Rz4zTmKnGg+QPW5H
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="344918280"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="344918280"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:31:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="684586917"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="684586917"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 May 2023 16:31:45 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4VI8-0001gl-0g;
	Wed, 31 May 2023 23:31:44 +0000
Date: Thu, 1 Jun 2023 07:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [axboe-block:for-6.5/block 65/74] drivers/md/raid1.c:1151:4:
 warning: incompatible pointer to integer conversion passing 'struct page *'
 to parameter of type 'unsigned long'
Message-ID: <202306010709.iZLreXv6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.5/block
head:   8e8fedab1194ef90e007636eb3d224c4f8e979a7
commit: 6473bc325644b9c8473e6c92bfb520a68dce1e12 [65/74] md: check for failure when adding pages in alloc_behind_master_bio
config: i386-randconfig-r026-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010709.iZLreXv6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=6473bc325644b9c8473e6c92bfb520a68dce1e12
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-6.5/block
        git checkout 6473bc325644b9c8473e6c92bfb520a68dce1e12
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010709.iZLreXv6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/md/raid1.c:1151:4: warning: incompatible pointer to integer conversion passing 'struct page *' to parameter of type 'unsigned long' [-Wint-conversion]
                           free_page(page);
                           ^~~~~~~~~~~~~~~
   include/linux/gfp.h:320:36: note: expanded from macro 'free_page'
   #define free_page(addr) free_pages((addr), 0)
                                      ^~~~~~
   include/linux/gfp.h:303:38: note: passing argument to parameter 'addr' here
   extern void free_pages(unsigned long addr, unsigned int order);
                                        ^
   1 warning generated.


vim +1151 drivers/md/raid1.c

  1122	
  1123	static void alloc_behind_master_bio(struct r1bio *r1_bio,
  1124						   struct bio *bio)
  1125	{
  1126		int size = bio->bi_iter.bi_size;
  1127		unsigned vcnt = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
  1128		int i = 0;
  1129		struct bio *behind_bio = NULL;
  1130	
  1131		behind_bio = bio_alloc_bioset(NULL, vcnt, 0, GFP_NOIO,
  1132					      &r1_bio->mddev->bio_set);
  1133		if (!behind_bio)
  1134			return;
  1135	
  1136		/* discard op, we don't support writezero/writesame yet */
  1137		if (!bio_has_data(bio)) {
  1138			behind_bio->bi_iter.bi_size = size;
  1139			goto skip_copy;
  1140		}
  1141	
  1142		while (i < vcnt && size) {
  1143			struct page *page;
  1144			int len = min_t(int, PAGE_SIZE, size);
  1145	
  1146			page = alloc_page(GFP_NOIO);
  1147			if (unlikely(!page))
  1148				goto free_pages;
  1149	
  1150			if (!bio_add_page(behind_bio, page, len, 0)) {
> 1151				free_page(page);
  1152				goto free_pages;
  1153			}
  1154	
  1155			size -= len;
  1156			i++;
  1157		}
  1158	
  1159		bio_copy_data(behind_bio, bio);
  1160	skip_copy:
  1161		r1_bio->behind_master_bio = behind_bio;
  1162		set_bit(R1BIO_BehindIO, &r1_bio->state);
  1163	
  1164		return;
  1165	
  1166	free_pages:
  1167		pr_debug("%dB behind alloc failed, doing sync I/O\n",
  1168			 bio->bi_iter.bi_size);
  1169		bio_free_pages(behind_bio);
  1170		bio_put(behind_bio);
  1171	}
  1172	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
