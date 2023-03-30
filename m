Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36038BE6;
	Thu, 30 Mar 2023 19:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680203531; x=1711739531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PVsH6t0x9DNFwUwtIqKlNz5rIcZnOQ0ggpYZkHYAmik=;
  b=WeTaKdNkdnlm6K9KObnaRvUiiRG2puYrSx+fY3iNw5ZO/Rfzrrz7zFsA
   RjbZakzPDP1eBggvq83u8FWnPf42KqMEa6E/xJbV7C7nic8IZZAbHLMHb
   +Oc1adXZL60/YGzPnyeoUo20f3wm6FqgGcal4XaSmlJPe+oaBX+myblBj
   3mJ+nC744gQ/b2o7KGbkMqQJwHlDf1XaklApZUeMuQPoPej5vRjYbfCYl
   +J1Z8C46MurDgu8BNLJ2ltlmfMfmXWfr4SnN5Y/DySj+oHFNynHhJ3w22
   a29HBWyUpIqTRp2sTAIL57Rsj2IyPVMJ4kD1ePQsKzgF+7KpGV0A3xtRu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329786401"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="329786401"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 12:12:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687373432"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="687373432"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Mar 2023 12:12:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phxgs-000L86-0U;
	Thu, 30 Mar 2023 19:12:06 +0000
Date: Fri, 31 Mar 2023 03:12:04 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:optimise-rsrc-update 10/17] io_uring/io_uring.c:1119:13:
 warning: no previous prototype for function 'io_free_req_tw'
Message-ID: <202303310350.wb4yjmCt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux optimise-rsrc-update
head:   d4c9d4791c934fb40e17c69529de78afe241cd6b
commit: 80b814f83c1030a35052e02e313109e9c9167ea8 [10/17] io_uring: io_free_req() via tw
config: s390-randconfig-r014-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310350.wb4yjmCt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/isilence/linux/commit/80b814f83c1030a35052e02e313109e9c9167ea8
        git remote add isilence https://github.com/isilence/linux
        git fetch --no-tags isilence optimise-rsrc-update
        git checkout 80b814f83c1030a35052e02e313109e9c9167ea8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310350.wb4yjmCt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:10:
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
   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:10:
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
   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:10:
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
>> io_uring/io_uring.c:1119:13: warning: no previous prototype for function 'io_free_req_tw' [-Wmissing-prototypes]
   __cold void io_free_req_tw(struct io_kiocb *req, struct io_tw_state *ts)
               ^
   io_uring/io_uring.c:1119:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
   __cold void io_free_req_tw(struct io_kiocb *req, struct io_tw_state *ts)
          ^
          static 
   13 warnings generated.


vim +/io_free_req_tw +1119 io_uring/io_uring.c

  1118	
> 1119	__cold void io_free_req_tw(struct io_kiocb *req, struct io_tw_state *ts)
  1120	{
  1121		struct io_ring_ctx *ctx = req->ctx;
  1122	
  1123		io_put_rsrc_node(req->rsrc_node);
  1124		io_dismantle_req(req);
  1125		io_put_task_remote(req->task, 1);
  1126	
  1127		spin_lock(&ctx->completion_lock);
  1128		wq_list_add_head(&req->comp_list, &ctx->locked_free_list);
  1129		ctx->locked_free_nr++;
  1130		spin_unlock(&ctx->completion_lock);
  1131	}
  1132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
