Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EA91EEF7;
	Thu,  6 Jun 2024 17:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717694157; cv=none; b=GUbO5fdmt9WF5EdurDD7w8BxqN1wBrqyp90CuJAcgChqjHeksSoqyYubHo+Jc5CCOFx7VWmlt5Dk07XVQ1IJRpQLTPzH+rJq3ImTwxPFoM3PTfWithyB2uBdiFV002kNzekW6XQheK230Hz88kWHi7bCwxo+hZNzrZrXRVeV5fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717694157; c=relaxed/simple;
	bh=lPjcqcSWuWxCoriLQm41bPi1MkJTbWLXuj16OXIGMDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ba+9gtrL+5x+PrE3JrOdg4xXXXb4z4xiHbt6Rtq6BIQZAdsoTcmPiqnZv+U9xayfuW4kUpb74SVYM3iFJJ8HHO2RxwkF1A+aX7nBG8+nw+lM5u5aRl25HidmNPHAB4VxDLAex8lZi6xUW4UUbsbTEH+elimMpQKaSPN+Qr250tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BqNG71IV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BqNG71IV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717694156; x=1749230156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lPjcqcSWuWxCoriLQm41bPi1MkJTbWLXuj16OXIGMDo=;
  b=BqNG71IV86+33KOd9Lf25DMiWfUQbrK0VvArZBVLiFUf/nXhRNb0rdPg
   IGnvUvWZsztYAfBmkmPPU8ud/vlQtaXQzAMmUGNGDrlXyK9q9aufZdPpL
   l/9oEafypDFXTLsa4/Q+yhqRQgyqgAadXruxJC93nt7CBleLh2/u9fGr9
   8KJ1uYep9uCBzieMmd4vJSWwSjBdNvgqqI/A2Qy9M42diLEe2RUumzBhK
   HxRe9FiF39qy/ALYW+nmPaCsciVjKKx7KuS8zJ/CDz+3GSmqJoNwNqoxm
   ZutcMNcgTbSH3F5ASHvcM2/+NleY9/Jj4RFwnZEq87x7llOtH1CZ2FZSL
   Q==;
X-CSE-ConnectionGUID: BBy2AZKkQsmbhyNIpcm/5g==
X-CSE-MsgGUID: UqubLjwTRVS+22+aAoWmRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14605253"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14605253"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 10:15:55 -0700
X-CSE-ConnectionGUID: 9umwJTieRDe+HOPyFqd1vA==
X-CSE-MsgGUID: NCPggjqkR9qQ1OtBeyaD3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38485310"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 06 Jun 2024 10:15:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFGiN-0003TN-1h;
	Thu, 06 Jun 2024 17:15:51 +0000
Date: Fri, 7 Jun 2024 01:15:16 +0800
From: kernel test robot <lkp@intel.com>
To: Akiva Goldberger <agoldberger@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Leon Romanovsky <leon@kernel.org>
Subject: [leon-rdma:rdma-next 34/35]
 drivers/infiniband/sw/siw/siw_main.c:235:15: error: incompatible function
 pointer types initializing 'int (*)(struct ib_cq *, const struct
 ib_cq_init_attr *, struct uverbs_attr_bundle *)' with an expression of type
 'int (struct ib_cq *, const struct ib_cq...
Message-ID: <202406070100.fWRYgpgd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   2ed5b0102c333dc3a591c2b79c6065c3ded2ddc2
commit: fbb0777c51553ab933d70fe1518ea3d6afa5d6a7 [34/35] RDMA: Pass entire uverbs attr bundle to create cq function
config: hexagon-allyesconfig (https://download.01.org/0day-ci/archive/20240607/202406070100.fWRYgpgd-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070100.fWRYgpgd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070100.fWRYgpgd-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/infiniband/sw/siw/siw_main.c:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:10:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/infiniband/sw/siw/siw_main.c:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/infiniband/sw/siw/siw_main.c:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/infiniband/sw/siw/siw_main.c:8:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> drivers/infiniband/sw/siw/siw_main.c:235:15: error: incompatible function pointer types initializing 'int (*)(struct ib_cq *, const struct ib_cq_init_attr *, struct uverbs_attr_bundle *)' with an expression of type 'int (struct ib_cq *, const struct ib_cq_init_attr *, struct ib_udata *)' [-Wincompatible-function-pointer-types]
     235 |         .create_cq = siw_create_cq,
         |                      ^~~~~~~~~~~~~
   7 warnings and 1 error generated.


vim +235 drivers/infiniband/sw/siw/siw_main.c

bdcf26bf9b3acb Bernard Metzler 2019-06-20  226  
bdcf26bf9b3acb Bernard Metzler 2019-06-20  227  static const struct ib_device_ops siw_device_ops = {
bdcf26bf9b3acb Bernard Metzler 2019-06-20  228  	.owner = THIS_MODULE,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  229  	.uverbs_abi_ver = SIW_ABI_VERSION,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  230  	.driver_id = RDMA_DRIVER_SIW,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  231  
bdcf26bf9b3acb Bernard Metzler 2019-06-20  232  	.alloc_mr = siw_alloc_mr,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  233  	.alloc_pd = siw_alloc_pd,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  234  	.alloc_ucontext = siw_alloc_ucontext,
bdcf26bf9b3acb Bernard Metzler 2019-06-20 @235  	.create_cq = siw_create_cq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  236  	.create_qp = siw_create_qp,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  237  	.create_srq = siw_create_srq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  238  	.dealloc_driver = siw_device_cleanup,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  239  	.dealloc_pd = siw_dealloc_pd,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  240  	.dealloc_ucontext = siw_dealloc_ucontext,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  241  	.dereg_mr = siw_dereg_mr,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  242  	.destroy_cq = siw_destroy_cq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  243  	.destroy_qp = siw_destroy_qp,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  244  	.destroy_srq = siw_destroy_srq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  245  	.get_dma_mr = siw_get_dma_mr,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  246  	.get_port_immutable = siw_get_port_immutable,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  247  	.iw_accept = siw_accept,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  248  	.iw_add_ref = siw_qp_get_ref,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  249  	.iw_connect = siw_connect,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  250  	.iw_create_listen = siw_create_listen,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  251  	.iw_destroy_listen = siw_destroy_listen,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  252  	.iw_get_qp = siw_get_base_qp,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  253  	.iw_reject = siw_reject,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  254  	.iw_rem_ref = siw_qp_put_ref,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  255  	.map_mr_sg = siw_map_mr_sg,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  256  	.mmap = siw_mmap,
11f1a75567c43e Michal Kalderon 2019-10-30  257  	.mmap_free = siw_mmap_free,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  258  	.modify_qp = siw_verbs_modify_qp,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  259  	.modify_srq = siw_modify_srq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  260  	.poll_cq = siw_poll_cq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  261  	.post_recv = siw_post_receive,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  262  	.post_send = siw_post_send,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  263  	.post_srq_recv = siw_post_srq_recv,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  264  	.query_device = siw_query_device,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  265  	.query_gid = siw_query_gid,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  266  	.query_port = siw_query_port,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  267  	.query_qp = siw_query_qp,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  268  	.query_srq = siw_query_srq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  269  	.req_notify_cq = siw_req_notify_cq,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  270  	.reg_user_mr = siw_reg_user_mr,
bdcf26bf9b3acb Bernard Metzler 2019-06-20  271  
bdcf26bf9b3acb Bernard Metzler 2019-06-20  272  	INIT_RDMA_OBJ_SIZE(ib_cq, siw_cq, base_cq),
bdcf26bf9b3acb Bernard Metzler 2019-06-20  273  	INIT_RDMA_OBJ_SIZE(ib_pd, siw_pd, base_pd),
514aee660df493 Leon Romanovsky 2021-07-23  274  	INIT_RDMA_OBJ_SIZE(ib_qp, siw_qp, base_qp),
bdcf26bf9b3acb Bernard Metzler 2019-06-20  275  	INIT_RDMA_OBJ_SIZE(ib_srq, siw_srq, base_srq),
bdcf26bf9b3acb Bernard Metzler 2019-06-20  276  	INIT_RDMA_OBJ_SIZE(ib_ucontext, siw_ucontext, base_ucontext),
bdcf26bf9b3acb Bernard Metzler 2019-06-20  277  };
bdcf26bf9b3acb Bernard Metzler 2019-06-20  278  

:::::: The code at line 235 was first introduced by commit
:::::: bdcf26bf9b3acb03c8f90387cfc6474fc8ac5521 rdma/siw: network and RDMA core interface

:::::: TO: Bernard Metzler <bmt@zurich.ibm.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
