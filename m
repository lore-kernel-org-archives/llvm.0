Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B675B5A5;
	Mon, 29 Jan 2024 11:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706526749; cv=none; b=dGau75lW5UwnW9lsbtRxRZFfRoBSGWj2kdxX9ZQpHEChv31K893PWoQehti6c/R/UGpNqQLKTs8d3pytyXi5NztDL4RPGQmuUD2oyT7uwtbgBGaWtKkRqBbjA0+TQP0Q9HNr8CQL5WtYmmUEIbGcKi0XMIm9NitLg+TyAXAgk60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706526749; c=relaxed/simple;
	bh=sWb5iW/Zc4rMtuvDgiy2XEeNVN53cyP6uPMuU6C2c4w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IEZq6Loo6OyvrsR7QUK/4/sW0KyN1+6ukIG8CoWrasElBP8UdTvYNtXq4no018NcCwxKx8x6/OUMhJYkH/jjp/XYwX8s6R5T4GD42adPvgBhGnS7ooaTlqITIbYMRRvy+qK439AEtB8tpteRBd+124QCtynzGnczADiq0tgcEsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dPON0QTL; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dPON0QTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706526747; x=1738062747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sWb5iW/Zc4rMtuvDgiy2XEeNVN53cyP6uPMuU6C2c4w=;
  b=dPON0QTLgrtg2SvUdRp1IIa3S48bK1m41KeJ5e/4VZP3VEkaQawD6nP9
   6bdLrEybGQVxYNK3Mj9FlLUmSUam2+t9wXMheCaJfxstyNTHLysqAro3D
   o3ah98jbGngpGaJ7jbdp+8bK7qTlLMx9UwA1LhHkiVrEc+QEq6av4uRn+
   SNc0G1r8JygbdhT49AeT1QmHeyGphcuIS4f/8aEnzPG7tyu/VLNe3dX5Z
   azXcKqRM7wG45sBo2R/iHIbsypjnd55VkiiASzyGB9u/LJFk6cfpljxon
   dvVkOWM4hRCdpsfFqgyXRvRHv5tYnTBQp/Kl+v931xXzfRccmB9U0RgH4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="393355830"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="393355830"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 03:12:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="737363763"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="737363763"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 29 Jan 2024 03:12:24 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUPYs-0004F2-26;
	Mon, 29 Jan 2024 11:12:22 +0000
Date: Mon, 29 Jan 2024 19:11:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:for-6.9/io_uring 7/8] io_uring/net.c:657:34: error: too
 many arguments to function call, expected single argument 'req', have 2
 arguments
Message-ID: <202401291912.0MoiJI2y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.9/io_uring
head:   57c7dda62e7e44cc6e3d89488dcaf9a0f491339c
commit: bc525bf2233d3f5c1f6845686a318d5d4086b229 [7/8] io_uring/net: use io_poll_multishot_retry() to avoid extra receive
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240129/202401291912.0MoiJI2y-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240129/202401291912.0MoiJI2y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291912.0MoiJI2y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/net.c:13:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
   In file included from io_uring/net.c:13:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
   In file included from io_uring/net.c:13:
   In file included from io_uring/io_uring.h:6:
   In file included from include/linux/resume_user_mode.h:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
>> io_uring/net.c:657:34: error: too many arguments to function call, expected single argument 'req', have 2 arguments
     657 |                                 io_poll_multishot_retry(req, issue_flags);
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~      ^~~~~~~~~~~
   io_uring/poll.h:31:20: note: 'io_poll_multishot_retry' declared here
      31 | static inline void io_poll_multishot_retry(struct io_kiocb *req)
         |                    ^                       ~~~~~~~~~~~~~~~~~~~~
   12 warnings and 1 error generated.


vim +/req +657 io_uring/net.c

   626	
   627	/*
   628	 * Finishes io_recv and io_recvmsg.
   629	 *
   630	 * Returns true if it is actually finished, or false if it should run
   631	 * again (for multishot).
   632	 */
   633	static inline bool io_recv_finish(struct io_kiocb *req, int *ret,
   634					  struct msghdr *msg, bool mshot_finished,
   635					  unsigned issue_flags)
   636	{
   637		unsigned int cflags;
   638	
   639		cflags = io_put_kbuf(req, issue_flags);
   640		if (msg->msg_inq && msg->msg_inq != -1)
   641			cflags |= IORING_CQE_F_SOCK_NONEMPTY;
   642	
   643		if (!(req->flags & REQ_F_APOLL_MULTISHOT)) {
   644			io_req_set_res(req, *ret, cflags);
   645			*ret = IOU_OK;
   646			return true;
   647		}
   648	
   649		if (!mshot_finished) {
   650			if (io_fill_cqe_req_aux(req, issue_flags & IO_URING_F_COMPLETE_DEFER,
   651						*ret, cflags | IORING_CQE_F_MORE)) {
   652				io_recv_prep_retry(req);
   653				/* Known not-empty, loop again */
   654				if (cflags & IORING_CQE_F_SOCK_NONEMPTY)
   655					return false;
   656				if (issue_flags & IO_URING_F_MULTISHOT) {
 > 657					io_poll_multishot_retry(req, issue_flags);
   658					*ret = IOU_ISSUE_SKIP_COMPLETE;
   659				} else {
   660					*ret = -EAGAIN;
   661				}
   662				return true;
   663			}
   664			/* Otherwise stop multishot but use the current result. */
   665		}
   666	
   667		io_req_set_res(req, *ret, cflags);
   668	
   669		if (issue_flags & IO_URING_F_MULTISHOT)
   670			*ret = IOU_STOP_MULTISHOT;
   671		else
   672			*ret = IOU_OK;
   673		return true;
   674	}
   675	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
