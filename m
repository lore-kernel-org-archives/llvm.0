Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF529328A8;
	Tue,  3 Oct 2023 20:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696364967; x=1727900967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3xM/ynJxXtcIH7vmQNgQkgnZUw9YTjKsJGR/HIZYY6I=;
  b=i7MHNJCyqZgDjp20AwR2jo5ZMTsrZW2sl38hjuPzTw68oqbiHNpSmT8N
   NC2SvSsIcFHjL5cv5hmknyGoWdbMoaGlJYemXGtHHtl/j4QVHZ57IM1hE
   tuE8A60VsLl/j3H6lEqZPCXBuNvKYWDBeCV5IuNdJvPI7m0u/OXb433vo
   beby63M1JIRVLGcnU5xrauDjjGd+vTSaRaGe3NOQZDckB4pRhQt/qx6XP
   RlNZKwdBA9InAiuVJ6yxvKz3Qr5WcCzcyIheLVltrhVnjBdN7m8yd73FH
   JTa71Crfmoxv4+UTavZg01GeZZkNAoVgK+24g8m9h63Br6JEgMrmCp7St
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="362331536"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="362331536"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 13:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="924786971"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; 
   d="scan'208";a="924786971"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 03 Oct 2023 13:29:24 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qnm1C-0008xc-2O;
	Tue, 03 Oct 2023 20:29:22 +0000
Date: Wed, 4 Oct 2023 04:28:40 +0800
From: kernel test robot <lkp@intel.com>
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] seccomp: Introduce SECCOMP_ATTACH_FILTER
 operation
Message-ID: <202310040409.sFAAtW2o-lkp@intel.com>
References: <20231003083836.100706-3-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003083836.100706-3-hengqi.chen@gmail.com>

Hi Hengqi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/seccomp]
[also build test ERROR on kees/for-next/pstore kees/for-next/kspp linus/master v6.6-rc4 next-20231003]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Hengqi-Chen/seccomp-Introduce-SECCOMP_LOAD_FILTER-operation/20231003-164556
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/seccomp
patch link:    https://lore.kernel.org/r/20231003083836.100706-3-hengqi.chen%40gmail.com
patch subject: [RFC PATCH 2/2] seccomp: Introduce SECCOMP_ATTACH_FILTER operation
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231004/202310040409.sFAAtW2o-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310040409.sFAAtW2o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040409.sFAAtW2o-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/seccomp.c:29:
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
   In file included from kernel/seccomp.c:29:
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
   In file included from kernel/seccomp.c:29:
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
   kernel/seccomp.c:2034:8: error: call to undeclared function 'security_bpf_prog_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2034 |         ret = security_bpf_prog_alloc(prog->aux);
         |               ^
   kernel/seccomp.c:2034:8: note: did you mean 'security_msg_msg_alloc'?
   include/linux/security.h:1245:19: note: 'security_msg_msg_alloc' declared here
    1245 | static inline int security_msg_msg_alloc(struct msg_msg *msg)
         |                   ^
   kernel/seccomp.c:2043:8: error: call to undeclared function 'bpf_prog_new_fd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2043 |         ret = bpf_prog_new_fd(prog);
         |               ^
>> kernel/seccomp.c:2070:21: error: use of undeclared identifier 'bpf_prog_fops'; did you mean 'bpf_prog_free'?
    2070 |         if (filp->f_op != &bpf_prog_fops) {
         |                            ^~~~~~~~~~~~~
         |                            bpf_prog_free
   include/linux/filter.h:865:6: note: 'bpf_prog_free' declared here
     865 | void bpf_prog_free(struct bpf_prog *fp);
         |      ^
   12 warnings and 3 errors generated.


vim +2070 kernel/seccomp.c

  2053	
  2054	static long seccomp_attach_filter(const char __user *ufd)
  2055	{
  2056		const unsigned long seccomp_mode = SECCOMP_MODE_FILTER;
  2057		struct seccomp_filter *sfilter;
  2058		struct bpf_prog *prog;
  2059		struct file *filp;
  2060		int flags = 0;
  2061		int fd, ret;
  2062	
  2063		if (copy_from_user(&fd, ufd, sizeof(fd)))
  2064			return -EFAULT;
  2065	
  2066		filp = fget(fd);
  2067		if (!filp)
  2068			return -EBADF;
  2069	
> 2070		if (filp->f_op != &bpf_prog_fops) {
  2071			ret = -EINVAL;
  2072			goto out;
  2073		}
  2074	
  2075		prog = filp->private_data;
  2076	
  2077		sfilter = kzalloc(sizeof(*sfilter), GFP_KERNEL | __GFP_NOWARN);
  2078		if (!sfilter) {
  2079			ret = -ENOMEM;
  2080			goto out;
  2081		}
  2082	
  2083		sfilter->prog = prog;
  2084		refcount_set(&sfilter->refs, 1);
  2085		refcount_set(&sfilter->users, 1);
  2086		mutex_init(&sfilter->notify_lock);
  2087		init_waitqueue_head(&sfilter->wqh);
  2088	
  2089		spin_lock_irq(&current->sighand->siglock);
  2090	
  2091		ret = -EINVAL;
  2092		if (!seccomp_may_assign_mode(seccomp_mode))
  2093			goto out_unlock;
  2094	
  2095		ret = seccomp_do_attach_filter(flags, sfilter);
  2096		if (ret)
  2097			goto out_unlock;
  2098	
  2099		sfilter = NULL;
  2100		seccomp_assign_mode(current, seccomp_mode, flags);
  2101	
  2102	out_unlock:
  2103		spin_unlock_irq(&current->sighand->siglock);
  2104		seccomp_filter_free(sfilter);
  2105	out:
  2106		fput(filp);
  2107		return ret;
  2108	}
  2109	#else
  2110	static inline long seccomp_set_mode_filter(unsigned int flags,
  2111						   const char __user *filter)
  2112	{
  2113		return -EINVAL;
  2114	}
  2115	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
