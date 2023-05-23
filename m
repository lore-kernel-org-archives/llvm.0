Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D0C21CC0;
	Tue, 23 May 2023 17:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684863457; x=1716399457;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9m4rvDuiiYOJYwmhe0egxN2UiTxd66XCtHrf3aw9egs=;
  b=GjJO/3bigSzJCkyNyn7eG3w8UPDEFyvHNJW96hMjoM9Iik0laiMTRU+Z
   CeQFtiLeGDLMJ5Y837gIfc1S57qEO+WO4P+he6ZVGi4m/gEn+qXTs1JJ+
   YqYhzJVb/smH0EcORGpjfSYQ35PkjY0AhRIILoBOUT4kXtK1Cr9rNvbQ3
   nMpqnDG821cxjhdbTWyuFN8c3XEBrW1mLZy6N9twfXO4R7NnT6whBJRDk
   VhsUAqyw86KstSTjw3aAK+N1DrkZwnU/HbHdsMfuuoI4ueXavDjQiso8X
   7wa0IFh2nbmhyV+ouIF5RAWTWI32+CZ10rqm5Dmrq/9eqLL68NXOYGBsI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="416770516"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; 
   d="scan'208";a="416770516"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2023 10:37:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="703988457"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; 
   d="scan'208";a="703988457"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 May 2023 10:37:24 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1Vwp-000DyH-0c;
	Tue, 23 May 2023 17:37:23 +0000
Date: Wed, 24 May 2023 01:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: aloktiagi <aloktiagi@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v6 2/2] seccomp: replace existing file in the epoll
 interface by a new file injected by the syscall supervisor.
Message-ID: <202305240114.MHCHQIvG-lkp@intel.com>
References: <20230523065802.2253926-2-aloktiagi@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230523065802.2253926-2-aloktiagi@gmail.com>

Hi aloktiagi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on kees/for-next/seccomp v6.4-rc3 next-20230523]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/aloktiagi/seccomp-replace-existing-file-in-the-epoll-interface-by-a-new-file-injected-by-the-syscall-supervisor/20230523-150046
base:   linus/master
patch link:    https://lore.kernel.org/r/20230523065802.2253926-2-aloktiagi%40gmail.com
patch subject: [RFC v6 2/2] seccomp: replace existing file in the epoll interface by a new file injected by the syscall supervisor.
config: powerpc-lite5200b_defconfig (https://download.01.org/0day-ci/archive/20230524/202305240114.MHCHQIvG-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/1d9c481b2cb96cb6bbe54d22da6405f9b7daa489
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review aloktiagi/seccomp-replace-existing-file-in-the-epoll-interface-by-a-new-file-injected-by-the-syscall-supervisor/20230523-150046
        git checkout 1d9c481b2cb96cb6bbe54d22da6405f9b7daa489
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305240114.MHCHQIvG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:214:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:615:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/seccomp.c:30:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:216:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:616:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/seccomp.c:30:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:218:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:617:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/seccomp.c:30:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:220:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:618:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from kernel/seccomp.c:30:
   In file included from include/linux/syscalls.h:88:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:677:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:674:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:222:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:619:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> kernel/seccomp.c:1077:10: error: call to undeclared function 'eventpoll_replace_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           ret = eventpoll_replace_file(old_file, addfd->file, addfd->fd);
                                 ^
   kernel/seccomp.c:1077:10: note: did you mean 'eventpoll_release'?
   include/linux/eventpoll.h:75:20: note: 'eventpoll_release' declared here
   static inline void eventpoll_release(struct file *file) {}
                      ^
   kernel/seccomp.c:1086:10: error: call to undeclared function 'eventpoll_replace_file'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           ret = eventpoll_replace_file(addfd->file, old_file, addfd->fd);
                                 ^
   6 warnings and 2 errors generated.


vim +/eventpoll_replace_file +1077 kernel/seccomp.c

  1056	
  1057	static void seccomp_handle_addfd(struct seccomp_kaddfd *addfd, struct seccomp_knotif *n)
  1058	{
  1059		int fd;
  1060		struct file *old_file = NULL;
  1061	
  1062		/*
  1063		 * Remove the notification, and reset the list pointers, indicating
  1064		 * that it has been handled.
  1065		 */
  1066		list_del_init(&addfd->list);
  1067		if (!addfd->setfd)
  1068			fd = receive_fd(addfd->file, addfd->flags);
  1069		else {
  1070			int ret = 0;
  1071			if (addfd->ioctl_flags & SECCOMP_ADDFD_FLAG_REPLACE_REF) {
  1072				old_file = fget(addfd->fd);
  1073				if (!old_file) {
  1074					fd = -EBADF;
  1075					goto error;
  1076				}
> 1077				ret = eventpoll_replace_file(old_file, addfd->file, addfd->fd);
  1078				if (ret < 0) {
  1079					fd = ret;
  1080					goto error;
  1081				}
  1082			}
  1083			fd = receive_fd_replace(addfd->fd, addfd->file, addfd->flags);
  1084			/* In case of error restore all references */
  1085			if (fd < 0 && addfd->ioctl_flags & SECCOMP_ADDFD_FLAG_REPLACE_REF) {
  1086				ret = eventpoll_replace_file(addfd->file, old_file, addfd->fd);
  1087				if (ret < 0) {
  1088					fd = ret;
  1089				}
  1090			}
  1091		}
  1092	error:
  1093		addfd->ret = fd;
  1094	
  1095		if (addfd->ioctl_flags & SECCOMP_ADDFD_FLAG_SEND) {
  1096			/* If we fail reset and return an error to the notifier */
  1097			if (fd < 0) {
  1098				n->state = SECCOMP_NOTIFY_SENT;
  1099			} else {
  1100				/* Return the FD we just added */
  1101				n->flags = 0;
  1102				n->error = 0;
  1103				n->val = fd;
  1104			}
  1105		}
  1106	
  1107		if (old_file)
  1108			fput(old_file);
  1109	
  1110		/*
  1111		 * Mark the notification as completed. From this point, addfd mem
  1112		 * might be invalidated and we can't safely read it anymore.
  1113		 */
  1114		complete(&addfd->completion);
  1115	}
  1116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
