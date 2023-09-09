Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C305D370;
	Sat,  9 Sep 2023 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694245379; x=1725781379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NclmO7jm8GCuBtnfe0rCb30mU5QcAy5J+UuCvIHvhnI=;
  b=VpOAiI3DHJBXItqH05Jnb+9W+dYOLjFSDWKwAlL1CUHgAeytN0QMw0IY
   +mUsCfayjerk1c8ljdg450K9p972EBvwduvmFx91vTg/Qvoje4Gg0SsMr
   bkxHALIqD2ogciPt0A+UrVcDWv06J3/9Rv8Wwbit46F9PV+SiDKoJh52s
   EO9KkTsLwy76Mvqr4nO9BjgjTHrnkVOfg9ZKL9l4X7TLRN3qop4jbwV54
   vToa/o7MA47waaIm1yQGIPb5YMeQXB7wD+ISm2aWrqfn/qJNklHaQhWK9
   z91eD1Jbz3Cv1ynNM9fJN0+xJkgTUCFJjE2PpEURdKopTxFTnwHIYANog
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375175460"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="375175460"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 00:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="808261400"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="808261400"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Sep 2023 00:42:52 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qescE-00035y-27;
	Sat, 09 Sep 2023 07:42:50 +0000
Date: Sat, 9 Sep 2023 15:42:17 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-sunrpc-thread-scheduling 76/77]
 net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:200:15: warning: variable 'count'
 set but not used
Message-ID: <202309091510.lqtBu2f5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-sunrpc-thread-scheduling
head:   fecdd17a8cd2f8d356bfc4f42b8c06af2d0506da
commit: d0a489e1ee8c40fc0e984533dd4a2619bd5c3906 [76/77] svcrdma: Pre-allocate svc_rdma_recv_ctxt objects
config: hexagon-randconfig-r022-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091510.lqtBu2f5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091510.lqtBu2f5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091510.lqtBu2f5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:98:
   In file included from include/rdma/ib_verbs.h:15:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:98:
   In file included from include/rdma/ib_verbs.h:15:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:98:
   In file included from include/rdma/ib_verbs.h:15:
   In file included from include/linux/ethtool.h:18:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> net/sunrpc/xprtrdma/svc_rdma_recvfrom.c:200:15: warning: variable 'count' set but not used [-Wunused-but-set-variable]
     200 |         unsigned int count;
         |                      ^
   7 warnings generated.


vim +/count +200 net/sunrpc/xprtrdma/svc_rdma_recvfrom.c

   190	
   191	/**
   192	 * svc_rdma_recv_ctxts_destroy - Release all recv_ctxt's for an xprt
   193	 * @rdma: svcxprt_rdma being torn down
   194	 *
   195	 */
   196	void svc_rdma_recv_ctxts_destroy(struct svcxprt_rdma *rdma)
   197	{
   198		struct svc_rdma_recv_ctxt *ctxt;
   199		struct llist_node *node;
 > 200		unsigned int count;
   201	
   202		count = 0;
   203		while ((node = llist_del_first(&rdma->sc_recv_ctxts))) {
   204			ctxt = llist_entry(node, struct svc_rdma_recv_ctxt, rc_node);
   205			svc_rdma_recv_ctxt_destroy(rdma, ctxt);
   206			++count;
   207		}
   208	}
   209	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
