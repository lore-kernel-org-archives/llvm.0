Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85FB23B0;
	Sat, 25 Nov 2023 06:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPlr4Ov/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700893279; x=1732429279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YHJFsRDZmGbTw/ab1NTnvNsGcBmbe3O7cYS67aw2GNE=;
  b=BPlr4Ov/dGMHdR5hC06cHOme5yyssy3X5G2fyu3JsgUonUIiL3dV4HxM
   9R6+qKU5xT2vKZ8koCXNAARznslRfpQyGIc+ssOMtCqRYKw23y1wT3gxD
   lvWlkrVtut+ZnI26ypS8W0fC6t55hXypJHCWorOJyoG5lAN5AcJugUPo8
   KXz9x4W6bgx0XioduIcL+alcA1IXBbz2nbWXPftujOBFJ8cHpKDUycqS8
   lEIlFkLjfFLQGNMKiaFDQcMjWwKqNzLp6pi4eW6FOgrYGbuDndK1rCVzK
   OTO07CieF8sQs867dWahy+QBEk7qbOVjXVlODBaFIUzvg02u+a6VSfOSB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="478702437"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="478702437"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 22:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="911613422"
X-IronPort-AV: E=Sophos;i="6.04,225,1695711600"; 
   d="scan'208";a="911613422"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Nov 2023 22:21:09 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6m2M-0003gz-37;
	Sat, 25 Nov 2023 06:21:06 +0000
Date: Sat, 25 Nov 2023 14:20:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:vfs.mount 6/11] fs/namespace.c:4957:1: warning: stack
 frame size (1392) exceeds limit (1024) in 'sys_statmount'
Message-ID: <202311251133.eWacwEik-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.mount
head:   229dc17d71b0e6b647d2fe00278da6ec25e6aafe
commit: 7a345f533f6c7ee7456e767b182ece39627f7c44 [6/11] statmount: simplify string option retrieval
config: powerpc-gamecube_defconfig (https://download.01.org/0day-ci/archive/20231125/202311251133.eWacwEik-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251133.eWacwEik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251133.eWacwEik-lkp@intel.com/

All warnings (new ones prefixed by >>):

     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:37:1: note: expanded from here
      37 | __do_insw
         | ^
   arch/powerpc/include/asm/io.h:610:56: note: expanded from macro '__do_insw'
     610 | #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/namespace.c:11:
   In file included from include/linux/syscalls.h:92:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      47 | DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      48 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:39:1: note: expanded from here
      39 | __do_insl
         | ^
   arch/powerpc/include/asm/io.h:611:56: note: expanded from macro '__do_insl'
     611 | #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
         |                                        ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/namespace.c:11:
   In file included from include/linux/syscalls.h:92:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      49 | DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      50 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:41:1: note: expanded from here
      41 | __do_outsb
         | ^
   arch/powerpc/include/asm/io.h:612:58: note: expanded from macro '__do_outsb'
     612 | #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/namespace.c:11:
   In file included from include/linux/syscalls.h:92:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      51 | DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      52 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:43:1: note: expanded from here
      43 | __do_outsw
         | ^
   arch/powerpc/include/asm/io.h:613:58: note: expanded from macro '__do_outsw'
     613 | #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
   In file included from fs/namespace.c:11:
   In file included from include/linux/syscalls.h:92:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:672:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
      53 | DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      54 |                  (p, b, c), pio, p)
         |                  ~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:669:3: note: expanded from macro 'DEF_PCI_AC_NORET'
     669 |                 __do_##name al;                                 \
         |                 ^~~~~~~~~~~~~~
   <scratch space>:45:1: note: expanded from here
      45 | __do_outsl
         | ^
   arch/powerpc/include/asm/io.h:614:58: note: expanded from macro '__do_outsl'
     614 | #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
         |                                         ~~~~~~~~~~~~~~~~~~~~~^
>> fs/namespace.c:4957:1: warning: stack frame size (1392) exceeds limit (1024) in 'sys_statmount' [-Wframe-larger-than]
    4957 | SYSCALL_DEFINE4(statmount, const struct mnt_id_req __user *, req,
         | ^
   include/linux/syscalls.h:224:36: note: expanded from macro 'SYSCALL_DEFINE4'
     224 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^
   include/linux/syscalls.h:232:2: note: expanded from macro 'SYSCALL_DEFINEx'
     232 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^
   arch/powerpc/include/asm/syscall_wrapper.h:23:7: note: expanded from macro '__SYSCALL_DEFINEx'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^
   <scratch space>:139:1: note: expanded from here
     139 | sys_statmount
         | ^
   7 warnings generated.


vim +/sys_statmount +4957 fs/namespace.c

e9b59e661906d7 Miklos Szeredi    2023-10-25  4956  
e9b59e661906d7 Miklos Szeredi    2023-10-25 @4957  SYSCALL_DEFINE4(statmount, const struct mnt_id_req __user *, req,
e9b59e661906d7 Miklos Szeredi    2023-10-25  4958  		struct statmount __user *, buf, size_t, bufsize,
e9b59e661906d7 Miklos Szeredi    2023-10-25  4959  		unsigned int, flags)
e9b59e661906d7 Miklos Szeredi    2023-10-25  4960  {
e9b59e661906d7 Miklos Szeredi    2023-10-25  4961  	struct vfsmount *mnt;
e9b59e661906d7 Miklos Szeredi    2023-10-25  4962  	struct mnt_id_req kreq;
7a345f533f6c7e Christian Brauner 2023-11-19  4963  	struct kstatmount ks;
7a345f533f6c7e Christian Brauner 2023-11-19  4964  	/* We currently support retrieval of 3 strings. */
7a345f533f6c7e Christian Brauner 2023-11-19  4965  	size_t seq_size = 3 * PATH_MAX;
e9b59e661906d7 Miklos Szeredi    2023-10-25  4966  	int ret;
e9b59e661906d7 Miklos Szeredi    2023-10-25  4967  
e9b59e661906d7 Miklos Szeredi    2023-10-25  4968  	if (flags)
e9b59e661906d7 Miklos Szeredi    2023-10-25  4969  		return -EINVAL;
e9b59e661906d7 Miklos Szeredi    2023-10-25  4970  
e9b59e661906d7 Miklos Szeredi    2023-10-25  4971  	if (copy_from_user(&kreq, req, sizeof(kreq)))
e9b59e661906d7 Miklos Szeredi    2023-10-25  4972  		return -EFAULT;
e9b59e661906d7 Miklos Szeredi    2023-10-25  4973  
7a345f533f6c7e Christian Brauner 2023-11-19  4974  retry:
7a345f533f6c7e Christian Brauner 2023-11-19  4975  	ret = prepare_kstatmount(&ks, &kreq, buf, bufsize, seq_size);
7a345f533f6c7e Christian Brauner 2023-11-19  4976  	if (ret)
7a345f533f6c7e Christian Brauner 2023-11-19  4977  		return ret;
7a345f533f6c7e Christian Brauner 2023-11-19  4978  
e9b59e661906d7 Miklos Szeredi    2023-10-25  4979  	down_read(&namespace_sem);
e9b59e661906d7 Miklos Szeredi    2023-10-25  4980  	mnt = lookup_mnt_in_ns(kreq.mnt_id, current->nsproxy->mnt_ns);
7a345f533f6c7e Christian Brauner 2023-11-19  4981  	if (!mnt) {
7a345f533f6c7e Christian Brauner 2023-11-19  4982  		up_read(&namespace_sem);
7a345f533f6c7e Christian Brauner 2023-11-19  4983  		kvfree(ks.seq.buf);
7a345f533f6c7e Christian Brauner 2023-11-19  4984  		return -ENOENT;
e9b59e661906d7 Miklos Szeredi    2023-10-25  4985  	}
7a345f533f6c7e Christian Brauner 2023-11-19  4986  
7a345f533f6c7e Christian Brauner 2023-11-19  4987  	ks.mnt = mnt;
7a345f533f6c7e Christian Brauner 2023-11-19  4988  	get_fs_root(current->fs, &ks.root);
7a345f533f6c7e Christian Brauner 2023-11-19  4989  	ret = do_statmount(&ks);
7a345f533f6c7e Christian Brauner 2023-11-19  4990  	path_put(&ks.root);
e9b59e661906d7 Miklos Szeredi    2023-10-25  4991  	up_read(&namespace_sem);
e9b59e661906d7 Miklos Szeredi    2023-10-25  4992  
7a345f533f6c7e Christian Brauner 2023-11-19  4993  	if (!ret)
7a345f533f6c7e Christian Brauner 2023-11-19  4994  		ret = copy_statmount_to_user(&ks);
7a345f533f6c7e Christian Brauner 2023-11-19  4995  	kvfree(ks.seq.buf);
7a345f533f6c7e Christian Brauner 2023-11-19  4996  	if (retry_statmount(ret, &seq_size))
7a345f533f6c7e Christian Brauner 2023-11-19  4997  		goto retry;
e9b59e661906d7 Miklos Szeredi    2023-10-25  4998  	return ret;
e9b59e661906d7 Miklos Szeredi    2023-10-25  4999  }
e9b59e661906d7 Miklos Szeredi    2023-10-25  5000  

:::::: The code at line 4957 was first introduced by commit
:::::: e9b59e661906d7565680cb9e2bbb3fa3360ab2ce add statmount(2) syscall

:::::: TO: Miklos Szeredi <mszeredi@redhat.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
