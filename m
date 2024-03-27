Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B72E208A9;
	Wed, 27 Mar 2024 02:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711505774; cv=none; b=K9Ogq6oVNSiUvnKbt/40c0/KIVyFzWzBv1mQgUGObeCZ5r+dkfE6oBuj5hSaNPDgp52zAPhBA0RXB3igV7HYF0ZtoHNZ8IiXx+RV8N4zNDY2ugLKYtzEozHUijoxFPnRR1Pc9u0LfBXoH1u1p+deUQCinENMCZm+ebxraYQyt/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711505774; c=relaxed/simple;
	bh=hq8TkPe9gNm6ktNPMkwT/j6a49iI2ZC8yKb5cMhkWOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NPluPNA4xARGw85dOeP8rTf7bmUEdyOire7JTserxkclfGIhgPX/rQjs8aBl5SGzEqirA1UAjs/xZhQI+KvV575X1uMXyZ39CwZSeLyL/ewr0KuhQxrvM+AwZOLYoxlYcm4aznSVETzeGwOJ686iRPpQ0EPtBZ/AubF4SK9aeIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EhcUQnJ2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EhcUQnJ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711505772; x=1743041772;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hq8TkPe9gNm6ktNPMkwT/j6a49iI2ZC8yKb5cMhkWOI=;
  b=EhcUQnJ2Ceb/syhrctz6biQwD2fLuikMJ293/AvPkwJEzoMibap3kh+W
   8IEfJNZE748+F63BAlaMek19InhqlEvGiO7fKnwgJDbVlb9JFBeNibjGa
   O2+Cx0SmSit9vUH7IsuRfazCN1DWIGb6Nnnl2RqyNC/qbcMfDE8HO7vwt
   zrEHbwiFoud5d3Y3XUZ9TQhTKAf1D5ekbqmUkFXyD5KGHMKDXgBftoI/f
   98kQr2Xhlpc4/QUDagWaHbxRbMW/ToL2S8NGxbeSV3nNAn/fn+3lcIx38
   zU9GNcIEyQiGvr1kOm0bx9MLQT5wsMFtz0FWw8OHz6+hw/kf7/ONHN4tv
   A==;
X-CSE-ConnectionGUID: BKqj/fhJTj2sKBoas907sA==
X-CSE-MsgGUID: bQyM9f+FSBipQWSWHGbsYg==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17217701"
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="17217701"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2024 19:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,157,1708416000"; 
   d="scan'208";a="16242149"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 26 Mar 2024 19:16:10 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpIpj-0000e7-33;
	Wed, 27 Mar 2024 02:16:07 +0000
Date: Wed, 27 Mar 2024 10:15:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-recvsend-bundle 4/11]
 io_uring/io_uring.c:1228:73: warning: parameter 'tw_flags' set but not used
Message-ID: <202403271036.IvCKouDH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-recvsend-bundle
head:   ed3ccc57b108a73411506483be33dee237995659
commit: 015090a8fac24dd9deaf4c887c60230a39ed3376 [4/11] io_uring: switch deferred task_work to an io_wq_work_list
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240327/202403271036.IvCKouDH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 23de3862dce582ce91c1aa914467d982cb1a73b4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240327/202403271036.IvCKouDH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403271036.IvCKouDH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:45:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:5:
   In file included from include/linux/tracepoint.h:22:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from io_uring/io_uring.c:61:
   In file included from include/net/sock.h:46:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:28:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:78:
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
>> io_uring/io_uring.c:1228:73: warning: parameter 'tw_flags' set but not used [-Wunused-but-set-parameter]
    1228 | static inline void io_req_local_work_add(struct io_kiocb *req, unsigned tw_flags)
         |                                                                         ^
   io_uring/io_uring.c:644:20: warning: unused function '__io_cq_unlock' [-Wunused-function]
     644 | static inline void __io_cq_unlock(struct io_ring_ctx *ctx)
         |                    ^~~~~~~~~~~~~~
   15 warnings generated.


vim +/tw_flags +1228 io_uring/io_uring.c

  1227	
> 1228	static inline void io_req_local_work_add(struct io_kiocb *req, unsigned tw_flags)
  1229	{
  1230		struct io_ring_ctx *ctx = req->ctx;
  1231		unsigned nr_wait, nr_tw;
  1232		unsigned long flags;
  1233	
  1234		/* See comment above IO_CQ_WAKE_INIT */
  1235		BUILD_BUG_ON(IO_CQ_WAKE_FORCE <= IORING_MAX_CQ_ENTRIES);
  1236	
  1237		/*
  1238		 * We don't know how many requests is there in the link and whether
  1239		 * they can even be queued lazily, fall back to non-lazy.
  1240		 */
  1241		if (req->flags & (REQ_F_LINK | REQ_F_HARDLINK))
  1242			tw_flags &= ~IOU_F_TWQ_LAZY_WAKE;
  1243	
  1244		spin_lock_irqsave(&ctx->work_lock, flags);
  1245		wq_list_add_tail(&req->io_task_work.node, &ctx->work_list);
  1246		nr_tw = ++ctx->work_items;
  1247		spin_unlock_irqrestore(&ctx->work_lock, flags);
  1248	
  1249		/*
  1250		 * cmpxchg implies a full barrier, which pairs with the barrier
  1251		 * in set_current_state() on the io_cqring_wait() side. It's used
  1252		 * to ensure that either we see updated ->cq_wait_nr, or waiters
  1253		 * going to sleep will observe the work added to the list, which
  1254		 * is similar to the wait/wawke task state sync.
  1255		 */
  1256	
  1257		if (nr_tw == 1) {
  1258			if (ctx->flags & IORING_SETUP_TASKRUN_FLAG)
  1259				atomic_or(IORING_SQ_TASKRUN, &ctx->rings->sq_flags);
  1260			if (ctx->has_evfd)
  1261				io_eventfd_signal(ctx);
  1262		}
  1263	
  1264		nr_wait = atomic_read(&ctx->cq_wait_nr);
  1265		if (nr_tw >= nr_wait)
  1266			wake_up_state(ctx->submitter_task, TASK_INTERRUPTIBLE);
  1267	}
  1268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
