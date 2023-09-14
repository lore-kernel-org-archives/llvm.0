Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339CA388;
	Thu, 14 Sep 2023 01:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694654888; x=1726190888;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KUZZZootIzMTjL3t3FoSdrqHXOcpL2Kjq549EzIG2Bk=;
  b=d4ToUwSyCxvGeOC+c6TvOagxoKSkVRwnrMnn+motX3HsZeu40PMpfbBL
   r8j44bt/MVEF++EN4zMyDl6RsAFN3Ec/E8iGauSPUmyP/YtmPi98mO780
   jZEQz90bPX/B4Xf9MPcFQ3UdbvafIOlype5EM/VPRUxqwy4lYSf9TnaUY
   gBugnj1LzFgfCcPGjpPjD+idM3/vx1e3KmucIU5P/LjTlyVYRyp8O4O70
   CGL3rwPxdZDR9kjDc0M9lBt3snivXhN1D7eX0ZgqJwwfKSPwzgsqlT0Uo
   ByWRRdWCO+pe+aAgWm4Sy0onYwrJLVDS8895M5pzenjdjd++oLCAyW7Sc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="363864226"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="363864226"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 18:28:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="814470949"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="814470949"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 13 Sep 2023 18:28:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgb9D-0000wC-2h;
	Thu, 14 Sep 2023 01:27:59 +0000
Date: Thu, 14 Sep 2023 09:27:10 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/3] add statmnt(2) syscall
Message-ID: <202309140946.BQUL96wT-lkp@intel.com>
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
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/asm]
[also build test ERROR on linux/master linus/master v6.6-rc1 next-20230913]
[cannot apply to arnd-asm-generic/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miklos-Szeredi/add-unique-mount-ID/20230913-232732
base:   tip/x86/asm
patch link:    https://lore.kernel.org/r/20230913152238.905247-3-mszeredi%40redhat.com
patch subject: [RFC PATCH 2/3] add statmnt(2) syscall
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230914/202309140946.BQUL96wT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140946.BQUL96wT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140946.BQUL96wT-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   include/linux/syscalls.h:412:15: warning: declaration of 'struct statmnt' will not be visible outside of this function [-Wvisibility]
     412 |                             struct statmnt __user *buf, size_t bufsize,
         |                                    ^
   fs/namespace.c:4690:18: warning: no previous prototype for function 'lookup_mnt_in_ns' [-Wmissing-prototypes]
    4690 | struct vfsmount *lookup_mnt_in_ns(u64 id, struct mnt_namespace *ns)
         |                  ^
   fs/namespace.c:4690:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4690 | struct vfsmount *lookup_mnt_in_ns(u64 id, struct mnt_namespace *ns)
         | ^
         | static 
   fs/namespace.c:4750:10: error: unknown type name 'stmt_str_t'
    4750 |                        stmt_str_t *str)
         |                        ^
>> fs/namespace.c:4960:1: error: conflicting types for 'sys_statmnt'
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


vim +/sys_statmnt +4960 fs/namespace.c

  4959	
> 4960	SYSCALL_DEFINE5(statmnt, u64, mnt_id,
  4961			u64, mask, struct statmnt __user *, buf,
  4962			size_t, bufsize, unsigned int, flags)
  4963	{
  4964		struct vfsmount *mnt;
  4965		int err;
  4966	
  4967		if (flags)
  4968			return -EINVAL;
  4969	
  4970		down_read(&namespace_sem);
  4971		mnt = lookup_mnt_in_ns(mnt_id, current->nsproxy->mnt_ns);
  4972		err = -ENOENT;
  4973		if (mnt) {
  4974			struct stmt_state s = {
  4975				.mask = mask,
  4976				.buf = buf,
  4977				.bufsize = bufsize,
  4978				.mnt = mnt,
  4979				.pos = sizeof(*buf),
  4980			};
  4981	
  4982			get_fs_root(current->fs, &s.root);
  4983			err = do_statmnt(&s);
  4984			path_put(&s.root);
  4985		}
  4986		up_read(&namespace_sem);
  4987	
  4988		return err;
  4989	}
  4990	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
