Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98C215A6
	for <llvm@lists.linux.dev>; Wed, 11 May 2022 10:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652266605; x=1683802605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=owyTCCcmnJo+T4Ingx7H5FSHvJQhxhbripOAra61JMc=;
  b=RnBm57K3SWcQT0/jUN/sgv+TMyUY56tNidvJgpPhCW2Z8qAh9EF5WOIo
   QdQlRWEPYI8+8NaxauiwWKssnqpWWNqb4+0o98o10dKxtujPhyoNaCM1U
   Dy/jKe7wkB2R9/ETJy6l33qOrE63VfkbV1i0MKAJ3SDA7c3Eq2j9xNLBK
   puHdY5O0HyuX2IbmTlWm8nDG6YuViv+ubImrtyeKJ1ejgz+/fvPGsrw2S
   w1/Dd7PuB9eGKgcgiL8zO2UkpeHhtkL8YL+8HdUH6HZA0HsSPAn+p9t1U
   NW7s/pOLNdHcTnUnpgyQu2AXp/5lm3C8Sb4+thVpj5iLNg4FDbC2HkwaZ
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="269795877"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; 
   d="scan'208";a="269795877"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2022 03:56:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,216,1647327600"; 
   d="scan'208";a="553278726"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 May 2022 03:56:41 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nok1J-000J12-44;
	Wed, 11 May 2022 10:56:41 +0000
Date: Wed, 11 May 2022 18:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Xu <howeyxu@tencent.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>
Subject: [ammarfaizi2-block:axboe/linux-block/fastpoll-mshot 89/98]
 fs/io_uring.c:6075:2: error: call to undeclared function '__io_poll_clean';
 ISO C99 and later do not support implicit function declarations
Message-ID: <202205111808.7jOLZqcw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block axboe/linux-block/fastpoll-mshot
head:   e721cdc172fd3aa845e4a0850cb5f9aefd8f3591
commit: e2959ad0f1aa6081772c3d9c703497c15d9c6039 [89/98] io_uring: add a helper for poll clean
config: s390-randconfig-c005-20220509 (https://download.01.org/0day-ci/archive/20220511/202205111808.7jOLZqcw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/ammarfaizi2/linux-block/commit/e2959ad0f1aa6081772c3d9c703497c15d9c6039
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block axboe/linux-block/fastpoll-mshot
        git checkout e2959ad0f1aa6081772c3d9c703497c15d9c6039
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from fs/io_uring.c:60:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from fs/io_uring.c:60:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from fs/io_uring.c:60:
   In file included from include/linux/blk-mq.h:8:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> fs/io_uring.c:6075:2: error: call to undeclared function '__io_poll_clean'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           __io_poll_clean(req);
           ^
   fs/io_uring.c:6075:2: note: did you mean '__io_fill_cqe'?
   fs/io_uring.c:2162:20: note: '__io_fill_cqe' declared here
   static inline bool __io_fill_cqe(struct io_ring_ctx *ctx, u64 user_data,
                      ^
   12 warnings and 1 error generated.


vim +/__io_poll_clean +6075 fs/io_uring.c

  6066	
  6067	static void io_apoll_task_func(struct io_kiocb *req, bool *locked)
  6068	{
  6069		int ret;
  6070	
  6071		ret = io_poll_check_events(req, locked);
  6072		if (ret > 0)
  6073			return;
  6074	
> 6075		__io_poll_clean(req);
  6076	
  6077		if (!ret)
  6078			io_req_task_submit(req, locked);
  6079		else
  6080			io_req_complete_failed(req, ret);
  6081	}
  6082	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
