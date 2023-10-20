Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A536107A9;
	Fri, 20 Oct 2023 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZMQPkfCt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697789400; x=1729325400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fzQAByBb0zMzpuQqU2gEWFmvKOK/rsdKAhBNTAZkj5o=;
  b=ZMQPkfCtx6j5Ydou9SSnVmomOEonDLQDUi4UJjbjPG98v09j/49HfAyX
   7aroJYL2jggQIR1JJWN/4YbvEU4xdBnDKTRVwE9XYKd+Pox0VmkkZ//np
   wACZvLJet0jwV8+zn1tzm36TDhnEnNtPMBrMhtObpyGbmCGASa9MiW8zs
   NvKiiCXDSwmOjEAe8cyAcg9dPFjYAp8KLvCd5XKaUZ2ssRxAOaL78Tpbr
   zNof3fFFAaFvhX2r8ftDdBnICyts/B3XWV2wsQm9GhkgfY0omxK/foj3b
   DIJHz+8Mnfq7tnNct+vZ8ltnxgrkm3mnYXNL56iBLiRIFPg5yIpH0UTku
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="8018232"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="8018232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 01:09:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="5310076"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Oct 2023 01:09:58 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtkZv-0003Fo-1v;
	Fri, 20 Oct 2023 08:09:55 +0000
Date: Fri, 20 Oct 2023 16:09:49 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/veth 1005/1018] include/linux/io_uring.h:120:60:
 warning: declaration of 'struct io_zc_rx_ifq' will not be visible outside of
 this function
Message-ID: <202310201622.6m4cA3Gm-lkp@intel.com>
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
commit: af0d7997ce7db79cf67af9211e630ac1b95a3924 [1005/1018] io_uring: add ZC pool API
config: riscv-nommu_virt_defconfig (https://download.01.org/0day-ci/archive/20231020/202310201622.6m4cA3Gm-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201622.6m4cA3Gm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310201622.6m4cA3Gm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/asm-generic/io.h:743:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     743 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:751:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     751 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     759 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     768 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     777 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     786 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/fork.c:34:
   In file included from include/linux/mempolicy.h:15:
   In file included from include/linux/pagemap.h:11:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1115:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1115 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
   In file included from kernel/fork.c:97:
>> include/linux/io_uring.h:120:60: warning: declaration of 'struct io_zc_rx_ifq' will not be visible outside of this function [-Wvisibility]
     120 | static inline struct io_zc_rx_buf *io_zc_rx_get_buf(struct io_zc_rx_ifq *ifq)
         |                                                            ^
   include/linux/io_uring.h:124:30: warning: declaration of 'struct io_zc_rx_ifq' will not be visible outside of this function [-Wvisibility]
     124 | void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
         |                              ^
>> include/linux/io_uring.h:124:6: warning: no previous prototype for function 'io_zc_rx_put_buf' [-Wmissing-prototypes]
     124 | void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
         |      ^
   include/linux/io_uring.h:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
         | ^
         | static 
   16 warnings generated.


vim +120 include/linux/io_uring.h

    72	
    73	struct io_zc_rx_ifq;
    74	struct io_zc_rx_buf *io_zc_rx_get_buf(struct io_zc_rx_ifq *ifq);
    75	void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf);
    76	static inline dma_addr_t io_zc_rx_buf_dma(struct io_zc_rx_buf *buf)
    77	{
    78		return buf->dma;
    79	}
    80	static inline struct page *io_zc_rx_buf_page(struct io_zc_rx_buf *buf)
    81	{
    82		return buf->page;
    83	}
    84	static inline void io_uring_files_cancel(void)
    85	{
    86		if (current->io_uring) {
    87			io_uring_unreg_ringfd();
    88			__io_uring_cancel(false);
    89		}
    90	}
    91	static inline void io_uring_task_cancel(void)
    92	{
    93		if (current->io_uring)
    94			__io_uring_cancel(true);
    95	}
    96	static inline void io_uring_free(struct task_struct *tsk)
    97	{
    98		if (tsk->io_uring)
    99			__io_uring_free(tsk);
   100	}
   101	int io_uring_cmd_sock(struct io_uring_cmd *cmd, unsigned int issue_flags);
   102	#else
   103	static inline int io_uring_cmd_import_fixed(u64 ubuf, unsigned long len, int rw,
   104				      struct iov_iter *iter, void *ioucmd)
   105	{
   106		return -EOPNOTSUPP;
   107	}
   108	static inline void io_uring_cmd_done(struct io_uring_cmd *cmd, ssize_t ret,
   109			ssize_t ret2, unsigned issue_flags)
   110	{
   111	}
   112	static inline void io_uring_cmd_complete_in_task(struct io_uring_cmd *ioucmd,
   113				void (*task_work_cb)(struct io_uring_cmd *, unsigned))
   114	{
   115	}
   116	static inline void io_uring_cmd_do_in_task_lazy(struct io_uring_cmd *ioucmd,
   117				void (*task_work_cb)(struct io_uring_cmd *, unsigned))
   118	{
   119	}
 > 120	static inline struct io_zc_rx_buf *io_zc_rx_get_buf(struct io_zc_rx_ifq *ifq)
   121	{
   122		return NULL;
   123	}
 > 124	void io_zc_rx_put_buf(struct io_zc_rx_ifq *ifq, struct io_zc_rx_buf *buf)
   125	{
   126	}
   127	static inline struct sock *io_uring_get_socket(struct file *file)
   128	{
   129		return NULL;
   130	}
   131	static inline void io_uring_task_cancel(void)
   132	{
   133	}
   134	static inline void io_uring_files_cancel(void)
   135	{
   136	}
   137	static inline void io_uring_free(struct task_struct *tsk)
   138	{
   139	}
   140	static inline const char *io_uring_get_opcode(u8 opcode)
   141	{
   142		return "";
   143	}
   144	static inline int io_uring_cmd_sock(struct io_uring_cmd *cmd,
   145					    unsigned int issue_flags)
   146	{
   147		return -EOPNOTSUPP;
   148	}
   149	#endif
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
