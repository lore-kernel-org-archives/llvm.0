Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B477266A9;
	Fri, 13 Oct 2023 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bf6TCj1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697233076; x=1728769076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/FoRQ79cDIWgwF53iTA4Pe2y9GXP34PgSUiq3j9mhE8=;
  b=Bf6TCj1H+VKhLfV/VhjqLTzRis5dy7jQeeh4iaiOuYe38LeWIuBVDPFE
   y77mteThKNjG/8moj5ZJte8xYnVlnWbjsmOdaDVpoIx0Alb6Xc44nVj5M
   YQeRBhB/8V9svYHM7HQgXOrU6l1W0H7GzRHSTKfCRaNqEF/FBNR84rz7n
   OPuMET3GUgeEHuezmMcfKM3HZ7LtNNE6fu9Xcpwc3/o9Qqx3bADNtPAy8
   w0P2ELQwEB0IQ28sGd9TpJWjc7KRG44wQXkcB5eIsQ26JhzKkyQ4TH44k
   aPlARXa134XbLcbi9JKhGhsk2LIDK61u8hhkpjanuuscVF4GJOukVEHL5
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="388122846"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="388122846"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 14:37:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="758630178"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="758630178"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 13 Oct 2023 14:37:51 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrPqv-0005QJ-1D;
	Fri, 13 Oct 2023 21:37:49 +0000
Date: Sat, 14 Oct 2023 05:37:01 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1004/1018] io_uring/zc_rx.c:144:5: warning: no
 previous prototype for function 'io_zc_rx_create_pool'
Message-ID: <202310140530.ALReuETc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/veth
head:   cff8a226d561bc0db814b65ca5d2c97894d4d1cd
commit: de471788991400859db2362ac41d6f1d2662820a [1004/1018] io_uring: add ZC buf and pool
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231014/202310140530.ALReuETc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140530.ALReuETc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140530.ALReuETc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/zc_rx.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from io_uring/zc_rx.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from io_uring/zc_rx.c:6:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> io_uring/zc_rx.c:144:5: warning: no previous prototype for function 'io_zc_rx_create_pool' [-Wmissing-prototypes]
     144 | int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
         |     ^
   io_uring/zc_rx.c:144:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     144 | int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
         | ^
         | static 
   13 warnings generated.


vim +/io_zc_rx_create_pool +144 io_uring/zc_rx.c

   143	
 > 144	int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
   145				 struct io_zc_rx_ifq *ifq,
   146				 u16 id)
   147	{
   148		struct device *dev = netdev2dev(ifq->dev);
   149		struct io_mapped_ubuf *imu;
   150		struct io_zc_rx_pool *pool;
   151		int nr_pages;
   152		int ret;
   153	
   154		if (ifq->pool)
   155			return -EFAULT;
   156	
   157		if (unlikely(id >= ctx->nr_user_bufs))
   158			return -EFAULT;
   159		id = array_index_nospec(id, ctx->nr_user_bufs);
   160		imu = ctx->user_bufs[id];
   161		if (imu->ubuf & ~PAGE_MASK || imu->ubuf_end & ~PAGE_MASK)
   162			return -EFAULT;
   163	
   164		ret = -ENOMEM;
   165		nr_pages = imu->nr_bvecs;
   166		pool = kvmalloc(struct_size(pool, freelist, nr_pages), GFP_KERNEL);
   167		if (!pool)
   168			goto err;
   169	
   170		pool->bufs = kvmalloc_array(nr_pages, sizeof(*pool->bufs), GFP_KERNEL);
   171		if (!pool->bufs)
   172			goto err_buf;
   173	
   174		ret = io_zc_rx_map_pool(pool, imu, dev);
   175		if (ret)
   176			goto err_map;
   177	
   178		pool->ifq = ifq;
   179		pool->pool_id = id;
   180		pool->nr_pages = nr_pages;
   181		pool->cache_count = 0;
   182		spin_lock_init(&pool->freelist_lock);
   183		pool->free_count = nr_pages;
   184		ifq->pool = pool;
   185	
   186		return 0;
   187	
   188	err_map:
   189		kvfree(pool->bufs);
   190	err_buf:
   191		kvfree(pool);
   192	err:
   193		return ret;
   194	}
   195	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
