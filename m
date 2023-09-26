Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556AD637;
	Tue, 26 Sep 2023 01:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695691964; x=1727227964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=624I+KrWTvk2D5ZNCBccp1IkjlfuL3LYcPxSKzeg1AQ=;
  b=AChfejg9QfuRAxz6oWDXxmShl/bh03VlAfWelIoyRDNyQDJnlXTHExBY
   zrHAcN4HuSX7rXuJmmBlMRszpKD8l5+oJ1PGaa4jW+j21v3nAxN2L5KwF
   NiULXipX5HTUK03LMQYDYMjyN/nT88aC736Ljy1Y0L/y2BiTA90J5oMSI
   DnjT4NLBIGvvWqZwfZ7oXABkH4JgJgAkThvrgxL8Uf1c0ShMB+a6nYa/u
   dXaL/NlADtC1s7WdNSLsl+IM1IojZcvDtOM3mRJRx9CxNNB2WF3y5rmV7
   /LTK+g4lE5vRZGcORsavhX76lDed1rWMIRBFIyRCJGBDWSvMJ2EOhnCVE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385303754"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="385303754"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 18:32:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="783780286"
X-IronPort-AV: E=Sophos;i="6.03,176,1694761200"; 
   d="scan'208";a="783780286"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Sep 2023 18:32:42 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkwwJ-0002E7-28;
	Tue, 26 Sep 2023 01:32:39 +0000
Date: Tue, 26 Sep 2023 09:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/xdp-multi 9/9] include/net/xdp.h:494:22: warning:
 declaration of 'struct bpf_mprog_entry' will not be visible outside of this
 function
Message-ID: <202309260939.87244IKl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/xdp-multi
head:   83f1483cdee8611d004ce761c31d6c3a78da1c95
commit: 83f1483cdee8611d004ce761c31d6c3a78da1c95 [9/9] poc hack
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230926/202309260939.87244IKl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309260939.87244IKl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309260939.87244IKl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/ethtool/ioctl.c:11:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
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
   In file included from net/ethtool/ioctl.c:11:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
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
   In file included from net/ethtool/ioctl.c:11:
   In file included from include/linux/etherdevice.h:20:
   In file included from include/linux/if_ether.h:19:
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
   In file included from net/ethtool/ioctl.c:31:
   In file included from include/net/xdp_sock_drv.h:10:
   In file included from include/net/xsk_buff_pool.h:11:
>> include/net/xdp.h:494:22: warning: declaration of 'struct bpf_mprog_entry' will not be visible outside of this function [-Wvisibility]
     494 | xdp_run(const struct bpf_mprog_entry *entry, struct xdp_buff *xdp)
         |                      ^
   include/net/xdp.h:500:9: error: call to undeclared function 'bpf_mprog_foreach_prog'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     500 |         bpf_mprog_foreach_prog(entry, fp, prog) {
         |         ^
   include/net/xdp.h:500:48: error: expected ';' after expression
     500 |         bpf_mprog_foreach_prog(entry, fp, prog) {
         |                                                ^
         |                                                ;
   include/net/xdp.h:503:25: error: 'break' statement not in loop or switch statement
     503 |                         break;
         |                         ^
   include/net/xdp.h:523:7: error: use of undeclared identifier 'ret'
     523 |                 if (ret == XDP_TX && netif_is_bond_slave(xdp->rxq->dev))
         |                     ^
   include/net/xdp.h:524:4: error: use of undeclared identifier 'ret'
     524 |                         ret = xdp_master_redirect(xdp);
         |                         ^
   13 warnings and 5 errors generated.


vim +494 include/net/xdp.h

   492	
   493	static __always_inline u32
 > 494	xdp_run(const struct bpf_mprog_entry *entry, struct xdp_buff *xdp)
   495	{
   496	        const struct bpf_mprog_fp *fp;
   497	        const struct bpf_prog *prog;
   498	        int ret = XDP_NEXT;
   499	
   500	        bpf_mprog_foreach_prog(entry, fp, prog) {
   501	                ret = __bpf_prog_run(prog, xdp, BPF_DISPATCHER_FUNC(xdp));
   502	                if (ret != XDP_NEXT)
   503	                        break;
   504	        }
   505		if (static_branch_unlikely(&bpf_master_redirect_enabled_key)) {
   506			if (ret == XDP_TX && netif_is_bond_slave(xdp->rxq->dev))
   507				ret = xdp_master_redirect(xdp);
   508		}
   509		return ret;
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
