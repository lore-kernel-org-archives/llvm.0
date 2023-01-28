Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3A02F47;
	Sat, 28 Jan 2023 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674923564; x=1706459564;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SVe32qLBK3zJriPFW1WjuUxsKF06TKzMXle7qN1YO50=;
  b=Y+Tmkz8czTLZyjkxhiZjNOLFvKi2CMz+X/09bOzjY/kju+u0XY9pnEhI
   oUIJvOkRt7KItl5Xo3x6tX0c8wFt1OqLO6k+JMW2g4Qiv7uQxfSd0TzYH
   oT69V5c4+wzKvx8IylSkFztVQpdnA3LCCKHng2oblQuvzG3Lvup6fceYk
   2WxuzmoyiVsr+Mofujq0xgDh24rVqy7P4eV5620lFUxiUFxIBRqLgyjWm
   qfn+KWlOuVueZKbkN6XCJCo0F7/usGEeDEm8lkqCDWKPhXoClpkq9tKaM
   VqnzVoRnfrOOGXNz6/CeGWeao8Lv2ZFU8n4yqZq9MgyvJwZj0xJx3VNSx
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="310927850"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="310927850"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 08:32:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="656959297"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="656959297"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Jan 2023 08:32:43 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLo8A-0000uc-12;
	Sat, 28 Jan 2023 16:32:42 +0000
Date: Sun, 29 Jan 2023 00:32:35 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 5/6] proc: Validate incoming allowlist
Message-ID: <202301290038.jSJhkuqz-lkp@intel.com>
References: <18bb5a8c0c81211cba5b865b4fbb5c2dd6b9e688.1674660533.git.legion@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18bb5a8c0c81211cba5b865b4fbb5c2dd6b9e688.1674660533.git.legion@kernel.org>

Hi Alexey,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.2-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Gladkov/proc-Fix-separator-for-subset-option/20230128-150138
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/18bb5a8c0c81211cba5b865b4fbb5c2dd6b9e688.1674660533.git.legion%40kernel.org
patch subject: [RFC PATCH v1 5/6] proc: Validate incoming allowlist
config: hexagon-randconfig-r045-20230123 (https://download.01.org/0day-ci/archive/20230129/202301290038.jSJhkuqz-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/2be09bb9025a1c3e735bf5bc1ba3c2a3e51539f8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexey-Gladkov/proc-Fix-separator-for-subset-option/20230128-150138
        git checkout 2be09bb9025a1c3e735bf5bc1ba3c2a3e51539f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from fs/proc_namespace.c:16:
>> fs/proc/internal.h:341:59: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                             ^
   fs/proc/internal.h:341:73: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                                           ^
   fs/proc/internal.h:341:81: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                                                   ^
   fs/proc/internal.h:345:58: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline void proc_allowlist_free(struct list_head *)
                                                            ^
   4 warnings generated.
--
   In file included from fs/proc/kcore.c:22:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/proc/kcore.c:22:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/proc/kcore.c:22:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   In file included from fs/proc/kcore.c:35:
>> fs/proc/internal.h:341:59: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                             ^
   fs/proc/internal.h:341:73: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                                           ^
   fs/proc/internal.h:341:81: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                                                   ^
   fs/proc/internal.h:345:58: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline void proc_allowlist_free(struct list_head *)
                                                            ^
   10 warnings generated.
--
   In file included from fs/proc/task_mmu.c:3:
   In file included from include/linux/mm_inline.h:7:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/proc/task_mmu.c:3:
   In file included from include/linux/mm_inline.h:7:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/proc/task_mmu.c:3:
   In file included from include/linux/mm_inline.h:7:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   In file included from fs/proc/task_mmu.c:26:
>> fs/proc/internal.h:341:59: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                             ^
   fs/proc/internal.h:341:73: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                                           ^
   fs/proc/internal.h:341:81: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                                                   ^
   fs/proc/internal.h:345:58: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline void proc_allowlist_free(struct list_head *)
                                                            ^
   fs/proc/task_mmu.c:764:33: warning: unused variable 'smaps_shmem_walk_ops' [-Wunused-const-variable]
   static const struct mm_walk_ops smaps_shmem_walk_ops = {
                                   ^
   11 warnings generated.
--
   In file included from fs/proc/meminfo.c:6:
   In file included from include/linux/hugetlb.h:10:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from fs/proc/meminfo.c:6:
   In file included from include/linux/hugetlb.h:10:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from fs/proc/meminfo.c:6:
   In file included from include/linux/hugetlb.h:10:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   In file included from fs/proc/meminfo.c:20:
>> fs/proc/internal.h:341:59: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                             ^
   fs/proc/internal.h:341:73: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                                           ^
   fs/proc/internal.h:341:81: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline int proc_allowlist_append(struct list_head *, const char *, size_t)
                                                                                   ^
   fs/proc/internal.h:345:58: warning: omitting the parameter name in a function definition is a C2x extension [-Wc2x-extensions]
   static inline void proc_allowlist_free(struct list_head *)
                                                            ^
   fs/proc/meminfo.c:22:28: warning: no previous prototype for function 'arch_report_meminfo' [-Wmissing-prototypes]
   void __attribute__((weak)) arch_report_meminfo(struct seq_file *m)
                              ^
   fs/proc/meminfo.c:22:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __attribute__((weak)) arch_report_meminfo(struct seq_file *m)
   ^
   static 
   11 warnings generated.


vim +341 fs/proc/internal.h

   332	
   333	/*
   334	 * proc_allowlist.c
   335	 */
   336	#ifdef CONFIG_PROC_ALLOW_LIST
   337	extern int proc_allowlist_append(struct list_head *, const char *, size_t);
   338	extern void proc_allowlist_free(struct list_head *);
   339	extern bool proc_pde_access_allowed(struct proc_fs_info *, struct proc_dir_entry *);
   340	#else
 > 341	static inline int proc_allowlist_append(struct list_head *, const char *, size_t)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
