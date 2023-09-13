Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF03A22EF5;
	Wed, 13 Sep 2023 21:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694640800; x=1726176800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JBnaBIIiFAAPGx7J5YWQmNxC/pSQKLhYuYNPxVjHgoo=;
  b=IKT6mJr9cP4oQAXcnVZYdR4ITPu4zPDmWJTXxM7sFDWC2omALXjYWD7j
   hBc5mkNGg6fGwU+glIjVwEh64jD6TBwWJPN2KNaC2vFYSl389JdME6/lm
   v/XI7/Mdz8hBgt34ZtjNFatjJKZzaULeQJFZMvDvq62/Vz3KShz5LuPHR
   WnpwCUpDV16vQYRasB5qgVvoQRCGJi3luU+zwW7bq32ktNE8Aa+nS9tmP
   2JlCjTTuTrLJfvtoY2Dde7boXwZ99WkR1E76YtWNvRjhY2i6Kh+S406Gg
   cqmuOFl+NXdWtdUC4KsIQX0K2XrCJoD6cZbvfg40mxyJ3b1P/xT6t0y8T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="378715012"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="378715012"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 14:33:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="887504061"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="887504061"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2023 14:32:48 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgXTw-0000gb-2J;
	Wed, 13 Sep 2023 21:33:13 +0000
Date: Thu, 14 Sep 2023 05:32:16 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] add statmnt(2) syscall
Message-ID: <202309140525.CcMyfaEf-lkp@intel.com>
References: <20230913152238.905247-3-mszeredi@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913152238.905247-3-mszeredi@redhat.com>

Hi Miklos,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/asm]
[also build test WARNING on linux/master linus/master v6.6-rc1 next-20230913]
[cannot apply to arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miklos-Szeredi/add-unique-mount-ID/20230913-232732
base:   tip/x86/asm
patch link:    https://lore.kernel.org/r/20230913152238.905247-3-mszeredi%40redhat.com
patch subject: [RFC PATCH 2/3] add statmnt(2) syscall
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230914/202309140525.CcMyfaEf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140525.CcMyfaEf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140525.CcMyfaEf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/open.c:14:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:9:
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
   In file included from fs/open.c:27:
>> include/linux/syscalls.h:412:15: warning: declaration of 'struct statmnt' will not be visible outside of this function [-Wvisibility]
     412 |                             struct statmnt __user *buf, size_t bufsize,
         |                                    ^
   13 warnings generated.
--
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
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
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
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
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
   In file included from fs/select.c:22:
>> include/linux/syscalls.h:412:15: warning: declaration of 'struct statmnt' will not be visible outside of this function [-Wvisibility]
     412 |                             struct statmnt __user *buf, size_t bufsize,
         |                                    ^
   fs/select.c:625:5: warning: stack frame size (1160) exceeds limit (1024) in 'core_sys_select' [-Wframe-larger-than]
     625 | int core_sys_select(int n, fd_set __user *inp, fd_set __user *outp,
         |     ^
   14 warnings generated.
--
   In file included from fs/namespace.c:11:
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
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from fs/namespace.c:11:
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
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from fs/namespace.c:11:
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
   In file included from fs/namespace.c:11:
>> include/linux/syscalls.h:412:15: warning: declaration of 'struct statmnt' will not be visible outside of this function [-Wvisibility]
     412 |                             struct statmnt __user *buf, size_t bufsize,
         |                                    ^
>> fs/namespace.c:4690:18: warning: no previous prototype for function 'lookup_mnt_in_ns' [-Wmissing-prototypes]
    4690 | struct vfsmount *lookup_mnt_in_ns(u64 id, struct mnt_namespace *ns)
         |                  ^
   fs/namespace.c:4690:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4690 | struct vfsmount *lookup_mnt_in_ns(u64 id, struct mnt_namespace *ns)
         | ^
         | static 
   fs/namespace.c:4750:10: error: unknown type name 'stmt_str_t'
    4750 |                        stmt_str_t *str)
         |                        ^
   fs/namespace.c:4960:1: error: conflicting types for 'sys_statmnt'
    4960 | SYSCALL_DEFINE5(statmnt, u64, mnt_id,
         | ^
   include/linux/syscalls.h:223:36: note: expanded from macro 'SYSCALL_DEFINE5'
     223 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:230:2: note: expanded from macro 'SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   include/linux/syscalls.h:244:18: note: expanded from macro '__SYSCALL_DEFINEx'
     244 |         asmlinkage long sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
         |                         ^
   <scratch space>:99:1: note: expanded from here
      99 | sys_statmnt
         | ^
   include/linux/syscalls.h:411:17: note: previous declaration is here
     411 | asmlinkage long sys_statmnt(u64 mnt_id, u64 mask,
         |                 ^
   14 warnings and 2 errors generated.
--
   In file included from kernel/sched/core.c:9:
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
   In file included from kernel/sched/core.c:9:
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
   In file included from kernel/sched/core.c:9:
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
   In file included from kernel/sched/core.c:13:
   In file included from include/linux/syscalls_api.h:1:
>> include/linux/syscalls.h:412:15: warning: declaration of 'struct statmnt' will not be visible outside of this function [-Wvisibility]
     412 |                             struct statmnt __user *buf, size_t bufsize,
         |                                    ^
   kernel/sched/core.c:3706:20: warning: unused function 'rq_has_pinned_tasks' [-Wunused-function]
    3706 | static inline bool rq_has_pinned_tasks(struct rq *rq)
         |                    ^
   kernel/sched/core.c:5812:20: warning: unused function 'sched_tick_start' [-Wunused-function]
    5812 | static inline void sched_tick_start(int cpu) { }
         |                    ^
   kernel/sched/core.c:5813:20: warning: unused function 'sched_tick_stop' [-Wunused-function]
    5813 | static inline void sched_tick_stop(int cpu) { }
         |                    ^
   kernel/sched/core.c:6507:20: warning: unused function 'sched_core_cpu_starting' [-Wunused-function]
    6507 | static inline void sched_core_cpu_starting(unsigned int cpu) {}
         |                    ^
   kernel/sched/core.c:6508:20: warning: unused function 'sched_core_cpu_deactivate' [-Wunused-function]
    6508 | static inline void sched_core_cpu_deactivate(unsigned int cpu) {}
         |                    ^
   kernel/sched/core.c:6509:20: warning: unused function 'sched_core_cpu_dying' [-Wunused-function]
    6509 | static inline void sched_core_cpu_dying(unsigned int cpu) {}
         |                    ^
   19 warnings generated.
..


vim +412 include/linux/syscalls.h

   285	
   286	/*
   287	 * These syscall function prototypes are kept in the same order as
   288	 * include/uapi/asm-generic/unistd.h. Architecture specific entries go below,
   289	 * followed by deprecated or obsolete system calls.
   290	 *
   291	 * Please note that these prototypes here are only provided for information
   292	 * purposes, for static analysis, and for linking from the syscall table.
   293	 * These functions should not be called elsewhere from kernel code.
   294	 *
   295	 * As the syscall calling convention may be different from the default
   296	 * for architectures overriding the syscall calling convention, do not
   297	 * include the prototypes if CONFIG_ARCH_HAS_SYSCALL_WRAPPER is enabled.
   298	 */
   299	#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
   300	asmlinkage long sys_io_setup(unsigned nr_reqs, aio_context_t __user *ctx);
   301	asmlinkage long sys_io_destroy(aio_context_t ctx);
   302	asmlinkage long sys_io_submit(aio_context_t, long,
   303				struct iocb __user * __user *);
   304	asmlinkage long sys_io_cancel(aio_context_t ctx_id, struct iocb __user *iocb,
   305				      struct io_event __user *result);
   306	asmlinkage long sys_io_getevents(aio_context_t ctx_id,
   307					long min_nr,
   308					long nr,
   309					struct io_event __user *events,
   310					struct __kernel_timespec __user *timeout);
   311	asmlinkage long sys_io_getevents_time32(__u32 ctx_id,
   312					__s32 min_nr,
   313					__s32 nr,
   314					struct io_event __user *events,
   315					struct old_timespec32 __user *timeout);
   316	asmlinkage long sys_io_pgetevents(aio_context_t ctx_id,
   317					long min_nr,
   318					long nr,
   319					struct io_event __user *events,
   320					struct __kernel_timespec __user *timeout,
   321					const struct __aio_sigset *sig);
   322	asmlinkage long sys_io_pgetevents_time32(aio_context_t ctx_id,
   323					long min_nr,
   324					long nr,
   325					struct io_event __user *events,
   326					struct old_timespec32 __user *timeout,
   327					const struct __aio_sigset *sig);
   328	asmlinkage long sys_io_uring_setup(u32 entries,
   329					struct io_uring_params __user *p);
   330	asmlinkage long sys_io_uring_enter(unsigned int fd, u32 to_submit,
   331					u32 min_complete, u32 flags,
   332					const void __user *argp, size_t argsz);
   333	asmlinkage long sys_io_uring_register(unsigned int fd, unsigned int op,
   334					void __user *arg, unsigned int nr_args);
   335	asmlinkage long sys_setxattr(const char __user *path, const char __user *name,
   336				     const void __user *value, size_t size, int flags);
   337	asmlinkage long sys_lsetxattr(const char __user *path, const char __user *name,
   338				      const void __user *value, size_t size, int flags);
   339	asmlinkage long sys_fsetxattr(int fd, const char __user *name,
   340				      const void __user *value, size_t size, int flags);
   341	asmlinkage long sys_getxattr(const char __user *path, const char __user *name,
   342				     void __user *value, size_t size);
   343	asmlinkage long sys_lgetxattr(const char __user *path, const char __user *name,
   344				      void __user *value, size_t size);
   345	asmlinkage long sys_fgetxattr(int fd, const char __user *name,
   346				      void __user *value, size_t size);
   347	asmlinkage long sys_listxattr(const char __user *path, char __user *list,
   348				      size_t size);
   349	asmlinkage long sys_llistxattr(const char __user *path, char __user *list,
   350				       size_t size);
   351	asmlinkage long sys_flistxattr(int fd, char __user *list, size_t size);
   352	asmlinkage long sys_removexattr(const char __user *path,
   353					const char __user *name);
   354	asmlinkage long sys_lremovexattr(const char __user *path,
   355					 const char __user *name);
   356	asmlinkage long sys_fremovexattr(int fd, const char __user *name);
   357	asmlinkage long sys_getcwd(char __user *buf, unsigned long size);
   358	asmlinkage long sys_lookup_dcookie(u64 cookie64, char __user *buf, size_t len);
   359	asmlinkage long sys_eventfd2(unsigned int count, int flags);
   360	asmlinkage long sys_epoll_create1(int flags);
   361	asmlinkage long sys_epoll_ctl(int epfd, int op, int fd,
   362					struct epoll_event __user *event);
   363	asmlinkage long sys_epoll_pwait(int epfd, struct epoll_event __user *events,
   364					int maxevents, int timeout,
   365					const sigset_t __user *sigmask,
   366					size_t sigsetsize);
   367	asmlinkage long sys_epoll_pwait2(int epfd, struct epoll_event __user *events,
   368					 int maxevents,
   369					 const struct __kernel_timespec __user *timeout,
   370					 const sigset_t __user *sigmask,
   371					 size_t sigsetsize);
   372	asmlinkage long sys_dup(unsigned int fildes);
   373	asmlinkage long sys_dup3(unsigned int oldfd, unsigned int newfd, int flags);
   374	asmlinkage long sys_fcntl(unsigned int fd, unsigned int cmd, unsigned long arg);
   375	#if BITS_PER_LONG == 32
   376	asmlinkage long sys_fcntl64(unsigned int fd,
   377					unsigned int cmd, unsigned long arg);
   378	#endif
   379	asmlinkage long sys_inotify_init1(int flags);
   380	asmlinkage long sys_inotify_add_watch(int fd, const char __user *path,
   381						u32 mask);
   382	asmlinkage long sys_inotify_rm_watch(int fd, __s32 wd);
   383	asmlinkage long sys_ioctl(unsigned int fd, unsigned int cmd,
   384					unsigned long arg);
   385	asmlinkage long sys_ioprio_set(int which, int who, int ioprio);
   386	asmlinkage long sys_ioprio_get(int which, int who);
   387	asmlinkage long sys_flock(unsigned int fd, unsigned int cmd);
   388	asmlinkage long sys_mknodat(int dfd, const char __user * filename, umode_t mode,
   389				    unsigned dev);
   390	asmlinkage long sys_mkdirat(int dfd, const char __user * pathname, umode_t mode);
   391	asmlinkage long sys_unlinkat(int dfd, const char __user * pathname, int flag);
   392	asmlinkage long sys_symlinkat(const char __user * oldname,
   393				      int newdfd, const char __user * newname);
   394	asmlinkage long sys_linkat(int olddfd, const char __user *oldname,
   395				   int newdfd, const char __user *newname, int flags);
   396	asmlinkage long sys_renameat(int olddfd, const char __user * oldname,
   397				     int newdfd, const char __user * newname);
   398	asmlinkage long sys_umount(char __user *name, int flags);
   399	asmlinkage long sys_mount(char __user *dev_name, char __user *dir_name,
   400					char __user *type, unsigned long flags,
   401					void __user *data);
   402	asmlinkage long sys_pivot_root(const char __user *new_root,
   403					const char __user *put_old);
   404	asmlinkage long sys_statfs(const char __user * path,
   405					struct statfs __user *buf);
   406	asmlinkage long sys_statfs64(const char __user *path, size_t sz,
   407					struct statfs64 __user *buf);
   408	asmlinkage long sys_fstatfs(unsigned int fd, struct statfs __user *buf);
   409	asmlinkage long sys_fstatfs64(unsigned int fd, size_t sz,
   410					struct statfs64 __user *buf);
   411	asmlinkage long sys_statmnt(u64 mnt_id, u64 mask,
 > 412				    struct statmnt __user *buf, size_t bufsize,
   413				    unsigned int flags);
   414	asmlinkage long sys_truncate(const char __user *path, long length);
   415	asmlinkage long sys_ftruncate(unsigned int fd, unsigned long length);
   416	#if BITS_PER_LONG == 32
   417	asmlinkage long sys_truncate64(const char __user *path, loff_t length);
   418	asmlinkage long sys_ftruncate64(unsigned int fd, loff_t length);
   419	#endif
   420	asmlinkage long sys_fallocate(int fd, int mode, loff_t offset, loff_t len);
   421	asmlinkage long sys_faccessat(int dfd, const char __user *filename, int mode);
   422	asmlinkage long sys_faccessat2(int dfd, const char __user *filename, int mode,
   423				       int flags);
   424	asmlinkage long sys_chdir(const char __user *filename);
   425	asmlinkage long sys_fchdir(unsigned int fd);
   426	asmlinkage long sys_chroot(const char __user *filename);
   427	asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
   428	asmlinkage long sys_fchmodat(int dfd, const char __user *filename,
   429				     umode_t mode);
   430	asmlinkage long sys_fchmodat2(int dfd, const char __user *filename,
   431				     umode_t mode, unsigned int flags);
   432	asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t user,
   433				     gid_t group, int flag);
   434	asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
   435	asmlinkage long sys_openat(int dfd, const char __user *filename, int flags,
   436				   umode_t mode);
   437	asmlinkage long sys_openat2(int dfd, const char __user *filename,
   438				    struct open_how *how, size_t size);
   439	asmlinkage long sys_close(unsigned int fd);
   440	asmlinkage long sys_close_range(unsigned int fd, unsigned int max_fd,
   441					unsigned int flags);
   442	asmlinkage long sys_vhangup(void);
   443	asmlinkage long sys_pipe2(int __user *fildes, int flags);
   444	asmlinkage long sys_quotactl(unsigned int cmd, const char __user *special,
   445					qid_t id, void __user *addr);
   446	asmlinkage long sys_quotactl_fd(unsigned int fd, unsigned int cmd, qid_t id,
   447					void __user *addr);
   448	asmlinkage long sys_getdents64(unsigned int fd,
   449					struct linux_dirent64 __user *dirent,
   450					unsigned int count);
   451	asmlinkage long sys_llseek(unsigned int fd, unsigned long offset_high,
   452				unsigned long offset_low, loff_t __user *result,
   453				unsigned int whence);
   454	asmlinkage long sys_lseek(unsigned int fd, off_t offset,
   455				  unsigned int whence);
   456	asmlinkage long sys_read(unsigned int fd, char __user *buf, size_t count);
   457	asmlinkage long sys_write(unsigned int fd, const char __user *buf,
   458				  size_t count);
   459	asmlinkage long sys_readv(unsigned long fd,
   460				  const struct iovec __user *vec,
   461				  unsigned long vlen);
   462	asmlinkage long sys_writev(unsigned long fd,
   463				   const struct iovec __user *vec,
   464				   unsigned long vlen);
   465	asmlinkage long sys_pread64(unsigned int fd, char __user *buf,
   466				    size_t count, loff_t pos);
   467	asmlinkage long sys_pwrite64(unsigned int fd, const char __user *buf,
   468				     size_t count, loff_t pos);
   469	asmlinkage long sys_preadv(unsigned long fd, const struct iovec __user *vec,
   470				   unsigned long vlen, unsigned long pos_l, unsigned long pos_h);
   471	asmlinkage long sys_pwritev(unsigned long fd, const struct iovec __user *vec,
   472				    unsigned long vlen, unsigned long pos_l, unsigned long pos_h);
   473	asmlinkage long sys_sendfile64(int out_fd, int in_fd,
   474				       loff_t __user *offset, size_t count);
   475	asmlinkage long sys_pselect6(int, fd_set __user *, fd_set __user *,
   476				     fd_set __user *, struct __kernel_timespec __user *,
   477				     void __user *);
   478	asmlinkage long sys_pselect6_time32(int, fd_set __user *, fd_set __user *,
   479				     fd_set __user *, struct old_timespec32 __user *,
   480				     void __user *);
   481	asmlinkage long sys_ppoll(struct pollfd __user *, unsigned int,
   482				  struct __kernel_timespec __user *, const sigset_t __user *,
   483				  size_t);
   484	asmlinkage long sys_ppoll_time32(struct pollfd __user *, unsigned int,
   485				  struct old_timespec32 __user *, const sigset_t __user *,
   486				  size_t);
   487	asmlinkage long sys_signalfd4(int ufd, sigset_t __user *user_mask, size_t sizemask, int flags);
   488	asmlinkage long sys_vmsplice(int fd, const struct iovec __user *iov,
   489				     unsigned long nr_segs, unsigned int flags);
   490	asmlinkage long sys_splice(int fd_in, loff_t __user *off_in,
   491				   int fd_out, loff_t __user *off_out,
   492				   size_t len, unsigned int flags);
   493	asmlinkage long sys_tee(int fdin, int fdout, size_t len, unsigned int flags);
   494	asmlinkage long sys_readlinkat(int dfd, const char __user *path, char __user *buf,
   495				       int bufsiz);
   496	asmlinkage long sys_newfstatat(int dfd, const char __user *filename,
   497				       struct stat __user *statbuf, int flag);
   498	asmlinkage long sys_newfstat(unsigned int fd, struct stat __user *statbuf);
   499	#if defined(__ARCH_WANT_STAT64) || defined(__ARCH_WANT_COMPAT_STAT64)
   500	asmlinkage long sys_fstat64(unsigned long fd, struct stat64 __user *statbuf);
   501	asmlinkage long sys_fstatat64(int dfd, const char __user *filename,
   502				       struct stat64 __user *statbuf, int flag);
   503	#endif
   504	asmlinkage long sys_sync(void);
   505	asmlinkage long sys_fsync(unsigned int fd);
   506	asmlinkage long sys_fdatasync(unsigned int fd);
   507	asmlinkage long sys_sync_file_range2(int fd, unsigned int flags,
   508					     loff_t offset, loff_t nbytes);
   509	asmlinkage long sys_sync_file_range(int fd, loff_t offset, loff_t nbytes,
   510						unsigned int flags);
   511	asmlinkage long sys_timerfd_create(int clockid, int flags);
   512	asmlinkage long sys_timerfd_settime(int ufd, int flags,
   513					    const struct __kernel_itimerspec __user *utmr,
   514					    struct __kernel_itimerspec __user *otmr);
   515	asmlinkage long sys_timerfd_gettime(int ufd, struct __kernel_itimerspec __user *otmr);
   516	asmlinkage long sys_timerfd_gettime32(int ufd,
   517					   struct old_itimerspec32 __user *otmr);
   518	asmlinkage long sys_timerfd_settime32(int ufd, int flags,
   519					   const struct old_itimerspec32 __user *utmr,
   520					   struct old_itimerspec32 __user *otmr);
   521	asmlinkage long sys_utimensat(int dfd, const char __user *filename,
   522					struct __kernel_timespec __user *utimes,
   523					int flags);
   524	asmlinkage long sys_utimensat_time32(unsigned int dfd,
   525					const char __user *filename,
   526					struct old_timespec32 __user *t, int flags);
   527	asmlinkage long sys_acct(const char __user *name);
   528	asmlinkage long sys_capget(cap_user_header_t header,
   529					cap_user_data_t dataptr);
   530	asmlinkage long sys_capset(cap_user_header_t header,
   531					const cap_user_data_t data);
   532	asmlinkage long sys_personality(unsigned int personality);
   533	asmlinkage long sys_exit(int error_code);
   534	asmlinkage long sys_exit_group(int error_code);
   535	asmlinkage long sys_waitid(int which, pid_t pid,
   536				   struct siginfo __user *infop,
   537				   int options, struct rusage __user *ru);
   538	asmlinkage long sys_set_tid_address(int __user *tidptr);
   539	asmlinkage long sys_unshare(unsigned long unshare_flags);
   540	asmlinkage long sys_futex(u32 __user *uaddr, int op, u32 val,
   541				  const struct __kernel_timespec __user *utime,
   542				  u32 __user *uaddr2, u32 val3);
   543	asmlinkage long sys_futex_time32(u32 __user *uaddr, int op, u32 val,
   544					 const struct old_timespec32 __user *utime,
   545					 u32 __user *uaddr2, u32 val3);
   546	asmlinkage long sys_get_robust_list(int pid,
   547					    struct robust_list_head __user * __user *head_ptr,
   548					    size_t __user *len_ptr);
   549	asmlinkage long sys_set_robust_list(struct robust_list_head __user *head,
   550					    size_t len);
   551	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
