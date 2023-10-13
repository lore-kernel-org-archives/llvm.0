Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442D1107AD;
	Fri, 13 Oct 2023 22:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gI/Jfvpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697236929; x=1728772929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dfEJ0mFCZIjAh8/ZCkT/rq6NjhycGvjPV0udDc1vOnw=;
  b=gI/Jfvpm/B/WkBHIav7hiiAvgY+YICKA2amUEq/yUXO/cz8jfr15zfR3
   SXvj66lDBngDm9+Mi9UT+zJP411xVenWEKUeaICsF+hx+4M6M9iencXvJ
   zLRau1EfE9PVO2xmbV4+EnTZkOoVZvhxrzZjTQReCPyaGXxaPt0kNYzPg
   hibNvLUbGVI/bl7jbHKomJDnJjCN7HHQkmYmP6Ou3hTiXsFhfRjsXFd9W
   J/ojGyW3wvsya2HK5fbcompTSJ6LfRK0X8JPlG3QpYui455ehvMWb80Vx
   gqxc2OUlp8MAi08n19qqCB8dgRSkzXGZKcPWN/aia62iOIcbZycfwFw+S
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385118847"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="385118847"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 15:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="845646515"
X-IronPort-AV: E=Sophos;i="6.03,223,1694761200"; 
   d="scan'208";a="845646515"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 13 Oct 2023 15:41:57 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrQqw-0005Tb-31;
	Fri, 13 Oct 2023 22:41:54 +0000
Date: Sat, 14 Oct 2023 06:41:33 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1008/1018] io_uring/zc_rx.c:253:4: warning:
 variable 'count' is uninitialized when used here
Message-ID: <202310140624.zxibZDIv-lkp@intel.com>
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
commit: 2558b655e4efd71bb5ffee98429a84c4e52da676 [1008/1018] io_uring: delay ZC pool destruction
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231014/202310140624.zxibZDIv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140624.zxibZDIv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140624.zxibZDIv-lkp@intel.com/

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
   io_uring/zc_rx.c:177:5: warning: no previous prototype for function 'io_zc_rx_create_pool' [-Wmissing-prototypes]
     177 | int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
         |     ^
   io_uring/zc_rx.c:177:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     177 | int io_zc_rx_create_pool(struct io_ring_ctx *ctx,
         | ^
         | static 
>> io_uring/zc_rx.c:253:4: warning: variable 'count' is uninitialized when used here [-Wuninitialized]
     253 |                         count++;
         |                         ^~~~~
   io_uring/zc_rx.c:243:20: note: initialize the variable 'count' to silence this warning
     243 |         int i, refc, count;
         |                           ^
         |                            = 0
   14 warnings generated.


vim +/count +253 io_uring/zc_rx.c

   236	
   237	static void io_zc_rx_destroy_pool_work(struct work_struct *work)
   238	{
   239		struct io_zc_rx_pool *pool = container_of(
   240				to_delayed_work(work), struct io_zc_rx_pool, destroy_work);
   241		struct device *dev = netdev2dev(pool->ifq->dev);
   242		struct io_zc_rx_buf *buf;
   243		int i, refc, count;
   244	
   245		for (i = 0; i < pool->nr_pages; i++) {
   246			buf = &pool->bufs[i];
   247			refc = atomic_read(&buf->refcount) & IO_ZC_RX_KREF_MASK;
   248			if (refc) {
   249				if (time_before(jiffies, pool->delay_end)) {
   250					schedule_delayed_work(&pool->destroy_work, HZ);
   251					return;
   252				}
 > 253				count++;
   254			}
   255		}
   256	
   257		if (count)
   258			pr_debug("freeing pool with %d/%d outstanding pages\n",
   259				 count, pool->nr_pages);
   260	
   261	
   262		for (i = 0; i < pool->nr_pages; i++) {
   263			buf = &pool->bufs[i];
   264			io_zc_rx_unmap_buf(dev, buf);
   265		}
   266	
   267		io_zc_rx_destroy_ifq(pool->ifq);
   268		kvfree(pool->bufs);
   269		kvfree(pool);
   270	}
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
