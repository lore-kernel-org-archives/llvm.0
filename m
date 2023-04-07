Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C838E110E;
	Fri,  7 Apr 2023 06:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680850356; x=1712386356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=avlNllpfBNmaoPYrWuLFtuBkbN+pnFsMxdE+AmyQJEA=;
  b=Zds+Rat5HuEZDYx86UsAApao2Cc2lQfOjn2mQqtCoA46oynQ82oO0Wl3
   2bymItz9ZL281ND6dbxYwKv19zhaaX23rkkVqZybKKq2De/YeUQiWStbq
   F7bYsyKNV+Bx91gpUz2l9xs+qhkcVsYc0wsoLUotlVgTVZ6up87uPlG4a
   f0K6/BUuvwWvyGN6R7zSAzBjQjrlVA/5Kyrj4qMBoRGC2FcHnXnZ1BXuK
   tn+o3dEv7xWOlUx5BHwC0exggcb/y9nrW9MpiOuJdApevx3RgucScFYoB
   Kh315iZXv6ciwW3JD3GeMw2uTzxFFjAwBq5k8gawkIkVBLFIzOiTGKxQC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="342945249"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="342945249"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2023 23:52:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="687435135"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="687435135"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Apr 2023 23:52:32 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkfxX-000SDC-1f;
	Fri, 07 Apr 2023 06:52:31 +0000
Date: Fri, 7 Apr 2023 14:51:58 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 15/16] zram: fix synchronous reads
Message-ID: <202304071443.4xWaXjV6-lkp@intel.com>
References: <20230406144102.149231-16-hch@lst.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230406144102.149231-16-hch@lst.de>

Hi Christoph,

kernel test robot noticed the following build errors:

[auto build test ERROR on axboe-block/for-next]
[also build test ERROR on linus/master v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/zram-make-zram_bio_discard-more-self-contained/20230406-234133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-next
patch link:    https://lore.kernel.org/r/20230406144102.149231-16-hch%40lst.de
patch subject: [PATCH 15/16] zram: fix synchronous reads
config: hexagon-randconfig-r024-20230405 (https://download.01.org/0day-ci/archive/20230407/202304071443.4xWaXjV6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/e4596d7c2cf157f5b3d566cb2cc0769c9232a728
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Christoph-Hellwig/zram-make-zram_bio_discard-more-self-contained/20230406-234133
        git checkout e4596d7c2cf157f5b3d566cb2cc0769c9232a728
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/block/zram/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304071443.4xWaXjV6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/block/zram/zram_drv.c:20:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/block/zram/zram_drv.c:20:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/block/zram/zram_drv.c:20:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/block/zram/zram_drv.c:778:18: error: variable has incomplete type 'struct bio_bvec'
           struct bio_bvec bv;
                           ^
   drivers/block/zram/zram_drv.c:778:9: note: forward declaration of 'struct bio_bvec'
           struct bio_bvec bv;
                  ^
   6 warnings and 1 error generated.


vim +778 drivers/block/zram/zram_drv.c

   774	
   775	static void zram_sync_read(struct work_struct *work)
   776	{
   777		struct zram_work *zw = container_of(work, struct zram_work, work);
 > 778		struct bio_bvec bv;
   779		struct bio bio;
   780	
   781		bio_init(&bio, zw->zram->bdev, &bv, 1, REQ_OP_READ);
   782		bio.bi_iter.bi_sector = zw->entry * (PAGE_SIZE >> 9);
   783		__bio_add_page(&bio, zw->page, PAGE_SIZE, 0);
   784		submit_bio_wait(&bio);
   785	}
   786	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
