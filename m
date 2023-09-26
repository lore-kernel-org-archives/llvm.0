Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9707C7F;
	Tue, 26 Sep 2023 03:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695700067; x=1727236067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mMl4UwG08zQSaM6AFP5OWlkl99IQTviX/ot41QmqyD8=;
  b=D/550bqfFdf7cub7N0OJc4Vxi5eG7eDBbti3ag3Y3v3cNeDrfLbR2Njl
   s7lvMNPoLZjBh2lSsOqnKVG8rHuFgWkTlMzj72BMSDTZOQQCK91quIYdo
   R4IQRPBsqdna/4VnWVMR2M5rwSgwQEj+urI1MNs2FlB4ihDP6MuOHGQlR
   yO11Y3isWVt35oR4uWSqpfDIes+vgUN1iwL6L5A5Txg2rUi7AeO11ffjY
   24x+KMLlXtALlD559mBz/cIF8pB9GBPykb914VQT55Z4Ix1G5bniJbM28
   Rp27MEHGiM/FGQwwSzkhJLgsEtXyS2I7bf0R6R8yj2+xoN0rU2rxpSkeh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361721240"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="361721240"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 20:47:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="698302382"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="698302382"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Sep 2023 20:47:45 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkz30-0002NH-24;
	Tue, 26 Sep 2023 03:47:42 +0000
Date: Tue, 26 Sep 2023 11:47:29 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/xdp-multi 9/9] include/net/xdp.h:500:9: error: implicit
 declaration of function 'bpf_mprog_foreach_prog' is invalid in C99
Message-ID: <202309261148.Sply5Rjt-lkp@intel.com>
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
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230926/202309261148.Sply5Rjt-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230926/202309261148.Sply5Rjt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309261148.Sply5Rjt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/select.c:22:
   In file included from include/linux/syscalls.h:90:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/select.c:22:
   In file included from include/linux/syscalls.h:90:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/select.c:22:
   In file included from include/linux/syscalls.h:90:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/um/include/asm/io.h:24:
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
   In file included from fs/select.c:33:
   In file included from include/net/busy_poll.h:19:
   include/net/xdp.h:494:22: warning: declaration of 'struct bpf_mprog_entry' will not be visible outside of this function [-Wvisibility]
   xdp_run(const struct bpf_mprog_entry *entry, struct xdp_buff *xdp)
                        ^
>> include/net/xdp.h:500:9: error: implicit declaration of function 'bpf_mprog_foreach_prog' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           bpf_mprog_foreach_prog(entry, fp, prog) {
           ^
   include/net/xdp.h:500:48: error: expected ';' after expression
           bpf_mprog_foreach_prog(entry, fp, prog) {
                                                  ^
                                                  ;
   include/net/xdp.h:503:25: error: 'break' statement not in loop or switch statement
                           break;
                           ^
   include/net/xdp.h:523:7: error: use of undeclared identifier 'ret'
                   if (ret == XDP_TX && netif_is_bond_slave(xdp->rxq->dev))
                       ^
   include/net/xdp.h:524:4: error: use of undeclared identifier 'ret'
                           ret = xdp_master_redirect(xdp);
                           ^
   13 warnings and 5 errors generated.


vim +/bpf_mprog_foreach_prog +500 include/net/xdp.h

   492	
   493	static __always_inline u32
 > 494	xdp_run(const struct bpf_mprog_entry *entry, struct xdp_buff *xdp)
   495	{
   496	        const struct bpf_mprog_fp *fp;
   497	        const struct bpf_prog *prog;
   498	        int ret = XDP_NEXT;
   499	
 > 500	        bpf_mprog_foreach_prog(entry, fp, prog) {
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
