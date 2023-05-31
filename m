Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B0F20697;
	Wed, 31 May 2023 22:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685573987; x=1717109987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kYbG/Ce/gr5ETyttKr+c8Im+TptBsAGsU0v8N/O3ksI=;
  b=MMhNvn4qrLMk0ui2ICUSBvnNldTeNFVjOhsNuMDSljCIDpYKB60IVRPt
   sN7st3dXzglxEOMRee71iEtf//b95K49ZVVj+c1GUsJ7nMGjxZ90Gja9Q
   7LGnVQJXvOP0aL9olR72QZMTQ4BvNPPl3UfPYik8bmFq6GzVRQtbGTbXt
   DrTrqss8os/u2DVliw4L4hD/FivS8BuXIcgHRISZe9asvWfixCM8g7u1u
   YoOM5Hx24Uvu4PgUm/E2r1uMPdenhw7XcC/KYZsxVwqCvxvqBijlEU5EQ
   Owq4oSFHFNNeszl8HLyH8xxVlNqEFoSNFAAIZrxSQXrgxCGhhbNQqdJmv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="358658330"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="358658330"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 15:59:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="851406811"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="851406811"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 31 May 2023 15:59:44 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4Un9-0001fb-1l;
	Wed, 31 May 2023 22:59:43 +0000
Date: Thu, 1 Jun 2023 06:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: [axboe-block:for-6.5/block 65/74] drivers/md/raid1.c:1151:4: error:
 incompatible pointer to integer conversion passing 'struct page *' to
 parameter of type 'unsigned long'
Message-ID: <202306010608.8DwJ0Mrp-lkp@intel.com>
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
config: s390-randconfig-r044-20230531 (https://download.01.org/0day-ci/archive/20230601/202306010608.8DwJ0Mrp-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git/commit/?id=6473bc325644b9c8473e6c92bfb520a68dce1e12
        git remote add axboe-block https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git
        git fetch --no-tags axboe-block for-6.5/block
        git checkout 6473bc325644b9c8473e6c92bfb520a68dce1e12
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/md/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010608.8DwJ0Mrp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/md/raid1.c:34:
   In file included from include/trace/events/block.h:8:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/md/raid1.c:34:
   In file included from include/trace/events/block.h:8:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/md/raid1.c:34:
   In file included from include/trace/events/block.h:8:
   In file included from include/linux/blktrace_api.h:5:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/md/raid1.c:1151:4: error: incompatible pointer to integer conversion passing 'struct page *' to parameter of type 'unsigned long' [-Wint-conversion]
                           free_page(page);
                           ^~~~~~~~~~~~~~~
   include/linux/gfp.h:320:36: note: expanded from macro 'free_page'
   #define free_page(addr) free_pages((addr), 0)
                                      ^~~~~~
   include/linux/gfp.h:303:38: note: passing argument to parameter 'addr' here
   extern void free_pages(unsigned long addr, unsigned int order);
                                        ^
   12 warnings and 1 error generated.


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
