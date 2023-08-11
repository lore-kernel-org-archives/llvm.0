Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB6D63A8;
	Fri, 11 Aug 2023 09:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691746260; x=1723282260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0LnrcTQNmGdS6++4V695KueKyCKjgf31CLnBsubCkzw=;
  b=CAQQiF+216IeCe1IEMafb369L7oGTKnDcbhyhglu8d9P09YYyAL/8tir
   lr+dN6TsrDpgARgudiiKgSC6PaN6m8O1rvfOGnnrGg8mDf3M6KmnCtfo4
   jIKo067oZKIH3CKfy50HSLqjWbx07bFzDfuyjY+svRH89zugBRie0L/Ko
   7vOwJsap52hg99/pYSjYvbAA6U1Gr5pBdDTmm97Quufc1nMW8bZ1sVTmz
   9E6m0jEKablXfQ0SptPv0cMjaeDyk3+ilEaDbv1FswKdvRtaZ9Ki50iGO
   P0Z3Ck1Gjz0VGEL4FIF+3zJ3Ki6KvNcn3M5+orQGOLRayFSJO8YJK+VTy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="370535426"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="370535426"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 02:30:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="1063261059"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; 
   d="scan'208";a="1063261059"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Aug 2023 02:30:38 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUOTd-0007fs-26;
	Fri, 11 Aug 2023 09:30:37 +0000
Date: Fri, 11 Aug 2023 17:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-ftrace-regs 5/8]
 include/linux/ftrace.h:175:11: warning: cast to 'unsigned long *' from
 smaller integer type 'int'
Message-ID: <202308111715.3eqcbIlf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-ftrace-regs
head:   dfb22a7e201fa419633cc5ce757d6bffb000666a
commit: 81a0320aea7fac0e4209f7570aac3f2183eb2a98 [5/8] tracing/fprobe: Enable fprobe events with CONFIG_DYNAMIC_FTRACE_WITH_ARGS
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230811/202308111715.3eqcbIlf-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308111715.3eqcbIlf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308111715.3eqcbIlf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ipc/msg.c:35:
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
   In file included from ipc/msg.c:35:
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
   In file included from ipc/msg.c:35:
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
   In file included from ipc/msg.c:35:
   In file included from include/linux/syscalls.h:90:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
   include/linux/ftrace.h:175:28: error: call to undeclared function 'kernel_stack_pointer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                                   ^
   include/linux/ftrace.h:138:2: note: expanded from macro 'ftrace_regs_get_stack_pointer'
     138 |         kernel_stack_pointer(ftrace_get_regs(fregs))
         |         ^
>> include/linux/ftrace.h:175:11: warning: cast to 'unsigned long *' from smaller integer type 'int' [-Wint-to-pointer-cast]
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> ipc/msg.c:497:20: warning: implicit conversion from 'int' to 'unsigned short' changes value from 32768000 to 0 [-Wconstant-conversion]
     497 |         msginfo->msgseg = MSGSEG;
         |                         ~ ^~~~~~
   include/uapi/linux/msg.h:87:38: note: expanded from macro 'MSGSEG'
      87 | #define MSGSEG (__MSGSEG <= 0xffff ? __MSGSEG : 0xffff)
         |                                      ^~~~~~~~
   include/uapi/linux/msg.h:86:36: note: expanded from macro '__MSGSEG'
      86 | #define __MSGSEG ((MSGPOOL * 1024) / MSGSSZ) /* max no. of segments */
         |                   ~~~~~~~~~~~~~~~~~^~~~~~~~
   14 warnings and 1 error generated.
--
   In file included from ipc/sem.c:80:
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
   In file included from ipc/sem.c:80:
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
   In file included from ipc/sem.c:80:
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
   In file included from ipc/sem.c:80:
   In file included from include/linux/syscalls.h:90:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:52:
   include/linux/ftrace.h:175:28: error: call to undeclared function 'kernel_stack_pointer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                                   ^
   include/linux/ftrace.h:138:2: note: expanded from macro 'ftrace_regs_get_stack_pointer'
     138 |         kernel_stack_pointer(ftrace_get_regs(fregs))
         |         ^
>> include/linux/ftrace.h:175:11: warning: cast to 'unsigned long *' from smaller integer type 'int' [-Wint-to-pointer-cast]
     175 |         stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   13 warnings and 1 error generated.


vim +175 include/linux/ftrace.h

   169	
   170	static __always_inline unsigned long
   171	ftrace_regs_get_kernel_stack_nth(struct ftrace_regs *fregs, unsigned int nth)
   172	{
   173		unsigned long *stackp;
   174	
 > 175		stackp = (unsigned long *)ftrace_regs_get_stack_pointer(fregs);
   176		if (((unsigned long)(stackp + nth) & ~(THREAD_SIZE - 1)) ==
   177		    ((unsigned long)stackp & ~(THREAD_SIZE - 1)))
   178			return *(stackp + nth);
   179	
   180		return 0;
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
