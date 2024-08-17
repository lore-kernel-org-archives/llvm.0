Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EE012CDB6;
	Sat, 17 Aug 2024 19:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723922934; cv=none; b=qotg/sJGNOGkGKB2PQDm7QNn0TOUV7v5WVR4lPQOubIk0JdHw9MLt3fRLhsShDqyy4n59mcRxRas5YnBVNgWUfZa7p4bjdeRFyrOwBaq4g547xHKOl0JO5Saycz7HzaQFZHaqUf/uDkXoqppxOPF4OWcfnqaOj0iudVnnnCLyAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723922934; c=relaxed/simple;
	bh=6HQ0WGJcmVET/dBNfe/9B1i9QMQMAm40jSwUoX4bitw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TRi2yra7cVIhoNFdg07bNs/FlQknNlvLVsvEXe5K+DNr6B4i31omkZ+PGtgk8SAHZBOLl4sQicI8TH2ekBFTlMEbuvflhnyLD5E8x3fYOsDsVHhx6EeRXa18/8NdmxkdKgZxZ8jO6Di2WKeDXiPahaKk/EDL5EN2QzINz++XRIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfL5LWLk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfL5LWLk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723922931; x=1755458931;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6HQ0WGJcmVET/dBNfe/9B1i9QMQMAm40jSwUoX4bitw=;
  b=dfL5LWLkEML0/XylJTObaff27sI0PANZLUo5zpBfAXdJwP2EbtSSzye9
   OR56pZlJxpsY0ghfyku+U4/lyGxwVCH+qC+wHOJi1M3PwfZZc0AZe56YZ
   A4/b1HIapvzFMFJfCVlCAQBtit5ZBJT1rtTsX/7222/QRDddQKby6PrGb
   BKqMG6IfvuwmhIcLpCR6TcXewoY7IebaepyLMltSlX99XaekGvgWTlm7s
   VtUR8jbdJxQGHzE/OgtpJj5dCK/ixiyhxbY9pApLR9LkSNZGh/RAP61nS
   CohhPWIxEghhVdWglV1fYH0Sm9MzFVRaDVyeUi3Huriy5hPB6KDzGk9S4
   A==;
X-CSE-ConnectionGUID: shMaoFc9QwKZDZs3wLlOlw==
X-CSE-MsgGUID: gMIWrzuZRQaIwP23Vorthw==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="22080507"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="22080507"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 12:28:51 -0700
X-CSE-ConnectionGUID: rPo8GZPOTKC01ViTQP/W3Q==
X-CSE-MsgGUID: +RVso1xFT7iURlU1FA+szQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="64804879"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Aug 2024 12:28:50 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfP6V-0007k6-24;
	Sat, 17 Aug 2024 19:28:47 +0000
Date: Sun, 18 Aug 2024 03:28:30 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:clone3-shadow-stack 5/9]
 include/linux/sched/task.h:242:17: warning: declaration of 'struct
 vm_area_struct' will not be visible outside of this function
Message-ID: <202408180324.gJq8Xel2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git clone3-shadow-stack
head:   9afed14a987147f3e45980fa0b962ca96de453dd
commit: 8c4502a4854ffb82bd6711413e5908812fdea4aa [5/9] fork: Add shadow stack support to clone3()
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240818/202408180324.gJq8Xel2-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240818/202408180324.gJq8Xel2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408180324.gJq8Xel2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/um/signal.c:9:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:9:
>> include/linux/sched/task.h:242:17: warning: declaration of 'struct vm_area_struct' will not be visible outside of this function [-Wvisibility]
     242 |                                             struct vm_area_struct *vma,
         |                                                    ^
   In file included from arch/x86/um/signal.c:11:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from arch/x86/um/signal.c:11:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from arch/x86/um/signal.c:11:
   In file included from include/linux/syscalls.h:93:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     693 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     701 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     709 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     718 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     727 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     736 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   13 warnings generated.
--
   In file included from arch/x86/um/elfcore.c:3:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:7:
   In file included from include/linux/sched/signal.h:9:
>> include/linux/sched/task.h:242:17: warning: declaration of 'struct vm_area_struct' will not be visible outside of this function [-Wvisibility]
     242 |                                             struct vm_area_struct *vma,
         |                                                    ^
   1 warning generated.
--
   In file included from kernel/locking/rwsem.c:22:
>> include/linux/sched/task.h:242:17: warning: declaration of 'struct vm_area_struct' will not be visible outside of this function [-Wvisibility]
     242 |                                             struct vm_area_struct *vma,
         |                                                    ^
   kernel/locking/rwsem.c:187:20: warning: unused function 'is_rwsem_reader_owned' [-Wunused-function]
     187 | static inline bool is_rwsem_reader_owned(struct rw_semaphore *sem)
         |                    ^~~~~~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:271:35: warning: unused function 'rwsem_owner' [-Wunused-function]
     271 | static inline struct task_struct *rwsem_owner(struct rw_semaphore *sem)
         |                                   ^~~~~~~~~~~
   kernel/locking/rwsem.c:282:1: warning: unused function 'rwsem_owner_flags' [-Wunused-function]
     282 | rwsem_owner_flags(struct rw_semaphore *sem, unsigned long *pflags)
         | ^~~~~~~~~~~~~~~~~
   4 warnings generated.


vim +242 include/linux/sched/task.h

   234	
   235	#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
   236	int arch_shstk_validate_clone(struct task_struct *p,
   237				      struct vm_area_struct *vma,
   238				      struct page *page,
   239				      struct kernel_clone_args *args);
   240	#else
   241	static inline int arch_shstk_validate_clone(struct task_struct *p,
 > 242						    struct vm_area_struct *vma,
   243						    struct page *page,
   244						    struct kernel_clone_args *args)
   245	{
   246		return 0;
   247	}
   248	#endif
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
