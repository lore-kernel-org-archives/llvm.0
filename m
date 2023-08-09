Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9408353B7;
	Wed,  9 Aug 2023 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691576914; x=1723112914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PvLYaZGzz6FFINZj9Rcyqlp0OMziihzlSIjscHEOK6U=;
  b=jtqe9NseVdDQ7CYQeq8/k3ExSSlHNBxvB8kEntgB6FnCxm35Y+RCXCX4
   cUq7HAaOD0uubj6BTLVL9DSRpjAUnLS46/ITWSi8a3ZhgYduVvHEgUA1x
   MPPGVjN+5VQXZ6soz+Ual+tw9aH//ECJOBzBT0UrWqfAbxjvb0TC35aDx
   QjOJAYyT9pBa6vetv2T7axy6ctzcDEJBcdsFWgJAiwBVzsmfI6hozNKw0
   k+/O3bvPTd6CoebNbWkdBD6HSzNUA9fzC6Hx2F0ZW1kfYdK98RCiRATln
   0UelUNw8cMhR7AxYUj726sQwpThawQKZIAT/v7qPWjblvQyA8yGxALMKl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="373867953"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="373867953"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 03:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="821798825"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="821798825"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Aug 2023 03:28:29 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTgQW-00060b-1O;
	Wed, 09 Aug 2023 10:28:28 +0000
Date: Wed, 9 Aug 2023 18:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 8173/8441] include/linux/list.h:53:13: warning:
 '__preserve_most__' calling convention is not supported for this target
Message-ID: <202308091820.0dPY7D6f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   21ef7b1e17d039053edaeaf41142423810572741
commit: fee8feb67f0b2954eb7a2a259122e43a15cf3a52 [8173/8441] list_debug: introduce CONFIG_DEBUG_LIST_MINIMAL
config: hexagon-randconfig-r041-20230808 (https://download.01.org/0day-ci/archive/20230809/202308091820.0dPY7D6f-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091820.0dPY7D6f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091820.0dPY7D6f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:5:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:12:
>> include/linux/list.h:53:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:5:
   In file included from include/linux/spinlock.h:56:
   In file included from include/linux/preempt.h:12:
   include/linux/list.h:96:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
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
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
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
   In file included from arch/hexagon/kernel/asm-offsets.c:15:
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
   8 warnings generated.
--
   In file included from lib/idr.c:5:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:13:
>> include/linux/list.h:53:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   In file included from lib/idr.c:5:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:13:
   include/linux/list.h:96:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   2 warnings generated.
--
   In file included from lib/maple_tree.c:54:
   In file included from include/linux/maple_tree.h:12:
   In file included from include/linux/rcupdate.h:27:
   In file included from include/linux/preempt.h:12:
>> include/linux/list.h:53:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   In file included from lib/maple_tree.c:54:
   In file included from include/linux/maple_tree.h:12:
   In file included from include/linux/rcupdate.h:27:
   In file included from include/linux/preempt.h:12:
   include/linux/list.h:96:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   In file included from lib/maple_tree.c:63:
   In file included from include/trace/events/maple_tree.h:123:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:9:
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
   In file included from lib/maple_tree.c:63:
   In file included from include/trace/events/maple_tree.h:123:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:9:
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
   In file included from lib/maple_tree.c:63:
   In file included from include/trace/events/maple_tree.h:123:
   In file included from include/trace/define_trace.h:102:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:9:
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
   lib/maple_tree.c:331:21: warning: unused function 'mte_set_full' [-Wunused-function]
   static inline void *mte_set_full(const struct maple_enode *node)
                       ^
   lib/maple_tree.c:336:21: warning: unused function 'mte_clear_full' [-Wunused-function]
   static inline void *mte_clear_full(const struct maple_enode *node)
                       ^
   lib/maple_tree.c:341:20: warning: unused function 'mte_has_null' [-Wunused-function]
   static inline bool mte_has_null(const struct maple_enode *node)
                      ^
   lib/maple_tree.c:672:29: warning: unused function 'mas_pivot' [-Wunused-function]
   static inline unsigned long mas_pivot(struct ma_state *mas, unsigned char piv)
                               ^
   12 warnings generated.
--
   In file included from lib/radix-tree.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:10:
>> include/linux/list.h:53:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   In file included from lib/radix-tree.c:15:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:10:
   include/linux/list.h:96:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   lib/radix-tree.c:1136:50: warning: parameter 'slot' set but not used [-Wunused-but-set-parameter]
   void __rcu **radix_tree_iter_resume(void __rcu **slot,
                                                    ^
   3 warnings generated.
--
   In file included from lib/test_ida.c:9:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:13:
>> include/linux/list.h:53:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   In file included from lib/test_ida.c:9:
   In file included from include/linux/idr.h:15:
   In file included from include/linux/radix-tree.h:13:
   include/linux/list.h:96:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   lib/test_ida.c:16:6: warning: no previous prototype for function 'ida_dump' [-Wmissing-prototypes]
   void ida_dump(struct ida *ida) { }
        ^
   lib/test_ida.c:16:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ida_dump(struct ida *ida) { }
   ^
   static 
   3 warnings generated.
--
   In file included from lib/list_debug.c:9:
>> include/linux/list.h:53:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   In file included from lib/list_debug.c:9:
   include/linux/list.h:96:13: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   extern bool __list_valid_slowpath __list_del_entry_valid_or_report(struct list_head *entry);
               ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
>> lib/list_debug.c:20:1: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   __list_valid_slowpath
   ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   lib/list_debug.c:43:1: warning: '__preserve_most__' calling convention is not supported for this target [-Wignored-attributes]
   __list_valid_slowpath
   ^
   include/linux/list.h:44:39: note: expanded from macro '__list_valid_slowpath'
   # define __list_valid_slowpath __cold __preserve_most
                                         ^
   include/linux/compiler_types.h:132:49: note: expanded from macro '__preserve_most'
   # define __preserve_most notrace __attribute__((__preserve_most__))
                                                   ^
   4 warnings generated.
..


vim +/__preserve_most__ +53 include/linux/list.h

    48	
    49	/*
    50	 * Performs the full set of list corruption checks before __list_add().
    51	 * On list corruption reports a warning, and returns false.
    52	 */
  > 53	extern bool __list_valid_slowpath __list_add_valid_or_report(struct list_head *new,
    54								     struct list_head *prev,
    55								     struct list_head *next);
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
