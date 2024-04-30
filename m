Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D9B199E9A;
	Tue, 30 Apr 2024 20:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714507847; cv=none; b=AA+597riHVXPcihtj/Dz4a7OAzvbFqypcfyXXZ6L7L4qkOC3yqt3z2E/sRWCQTLvXiaEIUZrKW3VAyOHn8exia8mA2RWG3xjIpbPV7mmolHkBX3fqrl0QNhgNzvZtBauRAJEVI4PpcValSdXAQP+lGYioILgg62HXiEeiLmdTvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714507847; c=relaxed/simple;
	bh=BhHboh2rPxzWOqpDwav8jhhkk052POTh5fk+rqWz1Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Du68bNkHzd+iV7XONKEDf2HmhMmbFio1W9w0vOLZ65exQDNI/FS0ESFepRXndso9WmcMKdrt9gsMFKfAwu7eTXTJLCgEmZNfSxX9kqRY//lZNlmyIRxJTz8PZBv1nsszmruMHmhGzaa9MiymKm8sllrTrgwPWP5UPtVpKELUm2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iFFqMyfR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iFFqMyfR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714507845; x=1746043845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BhHboh2rPxzWOqpDwav8jhhkk052POTh5fk+rqWz1Hw=;
  b=iFFqMyfRLfMptKUVH1Jb36CSVGzxqQLOtJwNlNxiQ1a26tolM8gyIW7f
   RMBLEgvvkV8rNbj8Kapls3TAL5GY7CZ2VbGWDiDzX4TO1A+hBcrWiSMdK
   0JyheAG9W7ovySEQBF7jGT7m+F9ZUnTmW4wzpl5BuJqL+KzvItqsmepyb
   bh/m4VJvyIR8dOijcCIbPzbWXpBW4AN3tSMAH8p2cVd/pbFZmqwuvuMsU
   HgY1qE8RVogh2xUrhI0actLwA2bTYz1Ras6bzPteI4ru5UKAYTxsO/nCO
   JDxZRsvROyqhNZmHGqELRVD9ouK2T79R/nP7dFtVOSFxnpoFdmTJOEeyR
   w==;
X-CSE-ConnectionGUID: hHmMhTFCT52dYqhR0EAWxQ==
X-CSE-MsgGUID: MGXB9kP1Tuyy37NHUd3vGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="20849863"
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="20849863"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 13:10:45 -0700
X-CSE-ConnectionGUID: JkIvY6R7TK+YPghB3CXoHA==
X-CSE-MsgGUID: NXS5e2XvTjKB6InMaChlDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,243,1708416000"; 
   d="scan'208";a="31028407"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Apr 2024 13:10:42 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1toG-0008Uy-0u;
	Tue, 30 Apr 2024 20:10:40 +0000
Date: Wed, 1 May 2024 04:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?G=F6ttsche?= <cgzones@googlemail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [brauner-vfs:vfs.xattr 2/5] include/linux/syscalls.h:343:24:
 warning: declaration of 'struct xattr_args' will not be visible outside of
 this function
Message-ID: <202405010457.SAnmBuYr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.xattr
head:   0703b9aad555387113b9112cdc84469d12fda266
commit: 71491cbe0205be53be1a044594698eb21c1c15f4 [2/5] fs/xattr: add *at family syscalls
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20240501/202405010457.SAnmBuYr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405010457.SAnmBuYr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405010457.SAnmBuYr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:20:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
   In file included from mm/filemap.c:20:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
   In file included from mm/filemap.c:20:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
   In file included from mm/filemap.c:25:
>> include/linux/syscalls.h:343:24: warning: declaration of 'struct xattr_args' will not be visible outside of this function [-Wvisibility]
     343 |                                const struct xattr_args __user *args, size_t size);
         |                                             ^
   include/linux/syscalls.h:352:18: warning: declaration of 'struct xattr_args' will not be visible outside of this function [-Wvisibility]
     352 |                                struct xattr_args __user *args, size_t size);
         |                                       ^
   14 warnings generated.
--
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
   In file included from mm/mremap.c:12:
   In file included from include/linux/mm_inline.h:8:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
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
   In file included from mm/mremap.c:23:
>> include/linux/syscalls.h:343:24: warning: declaration of 'struct xattr_args' will not be visible outside of this function [-Wvisibility]
     343 |                                const struct xattr_args __user *args, size_t size);
         |                                             ^
   include/linux/syscalls.h:352:18: warning: declaration of 'struct xattr_args' will not be visible outside of this function [-Wvisibility]
     352 |                                struct xattr_args __user *args, size_t size);
         |                                       ^
   mm/mremap.c:228:20: warning: unused function 'arch_supports_page_table_move' [-Wunused-function]
     228 | static inline bool arch_supports_page_table_move(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/mremap.c:227:39: note: expanded from macro 'arch_supports_page_table_move'
     227 | #define arch_supports_page_table_move arch_supports_page_table_move
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   15 warnings generated.


vim +343 include/linux/syscalls.h

   289	
   290	/*
   291	 * These syscall function prototypes are kept in the same order as
   292	 * include/uapi/asm-generic/unistd.h. Architecture specific entries go below,
   293	 * followed by deprecated or obsolete system calls.
   294	 *
   295	 * Please note that these prototypes here are only provided for information
   296	 * purposes, for static analysis, and for linking from the syscall table.
   297	 * These functions should not be called elsewhere from kernel code.
   298	 *
   299	 * As the syscall calling convention may be different from the default
   300	 * for architectures overriding the syscall calling convention, do not
   301	 * include the prototypes if CONFIG_ARCH_HAS_SYSCALL_WRAPPER is enabled.
   302	 */
   303	#ifndef CONFIG_ARCH_HAS_SYSCALL_WRAPPER
   304	asmlinkage long sys_io_setup(unsigned nr_reqs, aio_context_t __user *ctx);
   305	asmlinkage long sys_io_destroy(aio_context_t ctx);
   306	asmlinkage long sys_io_submit(aio_context_t, long,
   307				struct iocb __user * __user *);
   308	asmlinkage long sys_io_cancel(aio_context_t ctx_id, struct iocb __user *iocb,
   309				      struct io_event __user *result);
   310	asmlinkage long sys_io_getevents(aio_context_t ctx_id,
   311					long min_nr,
   312					long nr,
   313					struct io_event __user *events,
   314					struct __kernel_timespec __user *timeout);
   315	asmlinkage long sys_io_getevents_time32(__u32 ctx_id,
   316					__s32 min_nr,
   317					__s32 nr,
   318					struct io_event __user *events,
   319					struct old_timespec32 __user *timeout);
   320	asmlinkage long sys_io_pgetevents(aio_context_t ctx_id,
   321					long min_nr,
   322					long nr,
   323					struct io_event __user *events,
   324					struct __kernel_timespec __user *timeout,
   325					const struct __aio_sigset *sig);
   326	asmlinkage long sys_io_pgetevents_time32(aio_context_t ctx_id,
   327					long min_nr,
   328					long nr,
   329					struct io_event __user *events,
   330					struct old_timespec32 __user *timeout,
   331					const struct __aio_sigset *sig);
   332	asmlinkage long sys_io_uring_setup(u32 entries,
   333					struct io_uring_params __user *p);
   334	asmlinkage long sys_io_uring_enter(unsigned int fd, u32 to_submit,
   335					u32 min_complete, u32 flags,
   336					const void __user *argp, size_t argsz);
   337	asmlinkage long sys_io_uring_register(unsigned int fd, unsigned int op,
   338					void __user *arg, unsigned int nr_args);
   339	asmlinkage long sys_setxattr(const char __user *path, const char __user *name,
   340				     const void __user *value, size_t size, int flags);
   341	asmlinkage long sys_setxattrat(int dfd, const char __user *path, unsigned int at_flags,
   342				       const char __user *name,
 > 343				       const struct xattr_args __user *args, size_t size);
   344	asmlinkage long sys_lsetxattr(const char __user *path, const char __user *name,
   345				      const void __user *value, size_t size, int flags);
   346	asmlinkage long sys_fsetxattr(int fd, const char __user *name,
   347				      const void __user *value, size_t size, int flags);
   348	asmlinkage long sys_getxattr(const char __user *path, const char __user *name,
   349				     void __user *value, size_t size);
   350	asmlinkage long sys_getxattrat(int dfd, const char __user *path, unsigned int at_flags,
   351				       const char __user *name,
   352				       struct xattr_args __user *args, size_t size);
   353	asmlinkage long sys_lgetxattr(const char __user *path, const char __user *name,
   354				      void __user *value, size_t size);
   355	asmlinkage long sys_fgetxattr(int fd, const char __user *name,
   356				      void __user *value, size_t size);
   357	asmlinkage long sys_listxattr(const char __user *path, char __user *list,
   358				      size_t size);
   359	asmlinkage long sys_listxattrat(int dfd, const char __user *path, char __user *list,
   360				      size_t size, int flags);
   361	asmlinkage long sys_llistxattr(const char __user *path, char __user *list,
   362				       size_t size);
   363	asmlinkage long sys_flistxattr(int fd, char __user *list, size_t size);
   364	asmlinkage long sys_removexattr(const char __user *path,
   365					const char __user *name);
   366	asmlinkage long sys_removexattrat(int dfd, const char __user *path,
   367					const char __user *name, int flags);
   368	asmlinkage long sys_lremovexattr(const char __user *path,
   369					 const char __user *name);
   370	asmlinkage long sys_fremovexattr(int fd, const char __user *name);
   371	asmlinkage long sys_getcwd(char __user *buf, unsigned long size);
   372	asmlinkage long sys_eventfd2(unsigned int count, int flags);
   373	asmlinkage long sys_epoll_create1(int flags);
   374	asmlinkage long sys_epoll_ctl(int epfd, int op, int fd,
   375					struct epoll_event __user *event);
   376	asmlinkage long sys_epoll_pwait(int epfd, struct epoll_event __user *events,
   377					int maxevents, int timeout,
   378					const sigset_t __user *sigmask,
   379					size_t sigsetsize);
   380	asmlinkage long sys_epoll_pwait2(int epfd, struct epoll_event __user *events,
   381					 int maxevents,
   382					 const struct __kernel_timespec __user *timeout,
   383					 const sigset_t __user *sigmask,
   384					 size_t sigsetsize);
   385	asmlinkage long sys_dup(unsigned int fildes);
   386	asmlinkage long sys_dup3(unsigned int oldfd, unsigned int newfd, int flags);
   387	asmlinkage long sys_fcntl(unsigned int fd, unsigned int cmd, unsigned long arg);
   388	#if BITS_PER_LONG == 32
   389	asmlinkage long sys_fcntl64(unsigned int fd,
   390					unsigned int cmd, unsigned long arg);
   391	#endif
   392	asmlinkage long sys_inotify_init1(int flags);
   393	asmlinkage long sys_inotify_add_watch(int fd, const char __user *path,
   394						u32 mask);
   395	asmlinkage long sys_inotify_rm_watch(int fd, __s32 wd);
   396	asmlinkage long sys_ioctl(unsigned int fd, unsigned int cmd,
   397					unsigned long arg);
   398	asmlinkage long sys_ioprio_set(int which, int who, int ioprio);
   399	asmlinkage long sys_ioprio_get(int which, int who);
   400	asmlinkage long sys_flock(unsigned int fd, unsigned int cmd);
   401	asmlinkage long sys_mknodat(int dfd, const char __user * filename, umode_t mode,
   402				    unsigned dev);
   403	asmlinkage long sys_mkdirat(int dfd, const char __user * pathname, umode_t mode);
   404	asmlinkage long sys_unlinkat(int dfd, const char __user * pathname, int flag);
   405	asmlinkage long sys_symlinkat(const char __user * oldname,
   406				      int newdfd, const char __user * newname);
   407	asmlinkage long sys_linkat(int olddfd, const char __user *oldname,
   408				   int newdfd, const char __user *newname, int flags);
   409	asmlinkage long sys_renameat(int olddfd, const char __user * oldname,
   410				     int newdfd, const char __user * newname);
   411	asmlinkage long sys_umount(char __user *name, int flags);
   412	asmlinkage long sys_mount(char __user *dev_name, char __user *dir_name,
   413					char __user *type, unsigned long flags,
   414					void __user *data);
   415	asmlinkage long sys_pivot_root(const char __user *new_root,
   416					const char __user *put_old);
   417	asmlinkage long sys_statfs(const char __user * path,
   418					struct statfs __user *buf);
   419	asmlinkage long sys_statfs64(const char __user *path, size_t sz,
   420					struct statfs64 __user *buf);
   421	asmlinkage long sys_fstatfs(unsigned int fd, struct statfs __user *buf);
   422	asmlinkage long sys_fstatfs64(unsigned int fd, size_t sz,
   423					struct statfs64 __user *buf);
   424	asmlinkage long sys_statmount(const struct mnt_id_req __user *req,
   425				      struct statmount __user *buf, size_t bufsize,
   426				      unsigned int flags);
   427	asmlinkage long sys_listmount(const struct mnt_id_req __user *req,
   428				      u64 __user *mnt_ids, size_t nr_mnt_ids,
   429				      unsigned int flags);
   430	asmlinkage long sys_truncate(const char __user *path, long length);
   431	asmlinkage long sys_ftruncate(unsigned int fd, unsigned long length);
   432	#if BITS_PER_LONG == 32
   433	asmlinkage long sys_truncate64(const char __user *path, loff_t length);
   434	asmlinkage long sys_ftruncate64(unsigned int fd, loff_t length);
   435	#endif
   436	asmlinkage long sys_fallocate(int fd, int mode, loff_t offset, loff_t len);
   437	asmlinkage long sys_faccessat(int dfd, const char __user *filename, int mode);
   438	asmlinkage long sys_faccessat2(int dfd, const char __user *filename, int mode,
   439				       int flags);
   440	asmlinkage long sys_chdir(const char __user *filename);
   441	asmlinkage long sys_fchdir(unsigned int fd);
   442	asmlinkage long sys_chroot(const char __user *filename);
   443	asmlinkage long sys_fchmod(unsigned int fd, umode_t mode);
   444	asmlinkage long sys_fchmodat(int dfd, const char __user *filename,
   445				     umode_t mode);
   446	asmlinkage long sys_fchmodat2(int dfd, const char __user *filename,
   447				     umode_t mode, unsigned int flags);
   448	asmlinkage long sys_fchownat(int dfd, const char __user *filename, uid_t user,
   449				     gid_t group, int flag);
   450	asmlinkage long sys_fchown(unsigned int fd, uid_t user, gid_t group);
   451	asmlinkage long sys_openat(int dfd, const char __user *filename, int flags,
   452				   umode_t mode);
   453	asmlinkage long sys_openat2(int dfd, const char __user *filename,
   454				    struct open_how *how, size_t size);
   455	asmlinkage long sys_close(unsigned int fd);
   456	asmlinkage long sys_close_range(unsigned int fd, unsigned int max_fd,
   457					unsigned int flags);
   458	asmlinkage long sys_vhangup(void);
   459	asmlinkage long sys_pipe2(int __user *fildes, int flags);
   460	asmlinkage long sys_quotactl(unsigned int cmd, const char __user *special,
   461					qid_t id, void __user *addr);
   462	asmlinkage long sys_quotactl_fd(unsigned int fd, unsigned int cmd, qid_t id,
   463					void __user *addr);
   464	asmlinkage long sys_getdents64(unsigned int fd,
   465					struct linux_dirent64 __user *dirent,
   466					unsigned int count);
   467	asmlinkage long sys_llseek(unsigned int fd, unsigned long offset_high,
   468				unsigned long offset_low, loff_t __user *result,
   469				unsigned int whence);
   470	asmlinkage long sys_lseek(unsigned int fd, off_t offset,
   471				  unsigned int whence);
   472	asmlinkage long sys_read(unsigned int fd, char __user *buf, size_t count);
   473	asmlinkage long sys_write(unsigned int fd, const char __user *buf,
   474				  size_t count);
   475	asmlinkage long sys_readv(unsigned long fd,
   476				  const struct iovec __user *vec,
   477				  unsigned long vlen);
   478	asmlinkage long sys_writev(unsigned long fd,
   479				   const struct iovec __user *vec,
   480				   unsigned long vlen);
   481	asmlinkage long sys_pread64(unsigned int fd, char __user *buf,
   482				    size_t count, loff_t pos);
   483	asmlinkage long sys_pwrite64(unsigned int fd, const char __user *buf,
   484				     size_t count, loff_t pos);
   485	asmlinkage long sys_preadv(unsigned long fd, const struct iovec __user *vec,
   486				   unsigned long vlen, unsigned long pos_l, unsigned long pos_h);
   487	asmlinkage long sys_pwritev(unsigned long fd, const struct iovec __user *vec,
   488				    unsigned long vlen, unsigned long pos_l, unsigned long pos_h);
   489	asmlinkage long sys_sendfile64(int out_fd, int in_fd,
   490				       loff_t __user *offset, size_t count);
   491	asmlinkage long sys_pselect6(int, fd_set __user *, fd_set __user *,
   492				     fd_set __user *, struct __kernel_timespec __user *,
   493				     void __user *);
   494	asmlinkage long sys_pselect6_time32(int, fd_set __user *, fd_set __user *,
   495				     fd_set __user *, struct old_timespec32 __user *,
   496				     void __user *);
   497	asmlinkage long sys_ppoll(struct pollfd __user *, unsigned int,
   498				  struct __kernel_timespec __user *, const sigset_t __user *,
   499				  size_t);
   500	asmlinkage long sys_ppoll_time32(struct pollfd __user *, unsigned int,
   501				  struct old_timespec32 __user *, const sigset_t __user *,
   502				  size_t);
   503	asmlinkage long sys_signalfd4(int ufd, sigset_t __user *user_mask, size_t sizemask, int flags);
   504	asmlinkage long sys_vmsplice(int fd, const struct iovec __user *iov,
   505				     unsigned long nr_segs, unsigned int flags);
   506	asmlinkage long sys_splice(int fd_in, loff_t __user *off_in,
   507				   int fd_out, loff_t __user *off_out,
   508				   size_t len, unsigned int flags);
   509	asmlinkage long sys_tee(int fdin, int fdout, size_t len, unsigned int flags);
   510	asmlinkage long sys_readlinkat(int dfd, const char __user *path, char __user *buf,
   511				       int bufsiz);
   512	asmlinkage long sys_newfstatat(int dfd, const char __user *filename,
   513				       struct stat __user *statbuf, int flag);
   514	asmlinkage long sys_newfstat(unsigned int fd, struct stat __user *statbuf);
   515	#if defined(__ARCH_WANT_STAT64) || defined(__ARCH_WANT_COMPAT_STAT64)
   516	asmlinkage long sys_fstat64(unsigned long fd, struct stat64 __user *statbuf);
   517	asmlinkage long sys_fstatat64(int dfd, const char __user *filename,
   518				       struct stat64 __user *statbuf, int flag);
   519	#endif
   520	asmlinkage long sys_sync(void);
   521	asmlinkage long sys_fsync(unsigned int fd);
   522	asmlinkage long sys_fdatasync(unsigned int fd);
   523	asmlinkage long sys_sync_file_range2(int fd, unsigned int flags,
   524					     loff_t offset, loff_t nbytes);
   525	asmlinkage long sys_sync_file_range(int fd, loff_t offset, loff_t nbytes,
   526						unsigned int flags);
   527	asmlinkage long sys_timerfd_create(int clockid, int flags);
   528	asmlinkage long sys_timerfd_settime(int ufd, int flags,
   529					    const struct __kernel_itimerspec __user *utmr,
   530					    struct __kernel_itimerspec __user *otmr);
   531	asmlinkage long sys_timerfd_gettime(int ufd, struct __kernel_itimerspec __user *otmr);
   532	asmlinkage long sys_timerfd_gettime32(int ufd,
   533					   struct old_itimerspec32 __user *otmr);
   534	asmlinkage long sys_timerfd_settime32(int ufd, int flags,
   535					   const struct old_itimerspec32 __user *utmr,
   536					   struct old_itimerspec32 __user *otmr);
   537	asmlinkage long sys_utimensat(int dfd, const char __user *filename,
   538					struct __kernel_timespec __user *utimes,
   539					int flags);
   540	asmlinkage long sys_utimensat_time32(unsigned int dfd,
   541					const char __user *filename,
   542					struct old_timespec32 __user *t, int flags);
   543	asmlinkage long sys_acct(const char __user *name);
   544	asmlinkage long sys_capget(cap_user_header_t header,
   545					cap_user_data_t dataptr);
   546	asmlinkage long sys_capset(cap_user_header_t header,
   547					const cap_user_data_t data);
   548	asmlinkage long sys_personality(unsigned int personality);
   549	asmlinkage long sys_exit(int error_code);
   550	asmlinkage long sys_exit_group(int error_code);
   551	asmlinkage long sys_waitid(int which, pid_t pid,
   552				   struct siginfo __user *infop,
   553				   int options, struct rusage __user *ru);
   554	asmlinkage long sys_set_tid_address(int __user *tidptr);
   555	asmlinkage long sys_unshare(unsigned long unshare_flags);
   556	asmlinkage long sys_futex(u32 __user *uaddr, int op, u32 val,
   557				  const struct __kernel_timespec __user *utime,
   558				  u32 __user *uaddr2, u32 val3);
   559	asmlinkage long sys_futex_time32(u32 __user *uaddr, int op, u32 val,
   560					 const struct old_timespec32 __user *utime,
   561					 u32 __user *uaddr2, u32 val3);
   562	asmlinkage long sys_get_robust_list(int pid,
   563					    struct robust_list_head __user * __user *head_ptr,
   564					    size_t __user *len_ptr);
   565	asmlinkage long sys_set_robust_list(struct robust_list_head __user *head,
   566					    size_t len);
   567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
