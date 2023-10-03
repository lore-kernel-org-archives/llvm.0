Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F23F3AC1C;
	Tue,  3 Oct 2023 16:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696350565; x=1727886565;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tOiRGzikq6AjMrSOKT2pu9qctPRqG77ATQc2snODIBo=;
  b=HL5nu4uovY8aomOBfu7kIMCTAfF0JbKLi0r76+1dKF0PrBal8XM9wXgZ
   aghEKLxnglPdFsAa4F4INZ00nvH3z3Zci/ULfuohHZCrYHneA2MuFwWFc
   XySxjWoFOsERQahrCj+pkI9aV3G0z6Ef9uo+j1R0YGmHFYObsZ4GxH6TZ
   sDjuo4WaZ7fHqtwR5xikpi7p96cqiwFqYBWvsUld/Gp2LX6OsS3FidPOC
   MwdPxkCc0eoMy+PvBVF2TjcsUTzS+XMb9RDsunrGDCjRqiQpz4qn3f0Sr
   D3CjA+bJncG0+DEnXfZR6UN2mtpKU9rgmhc5ZQTsWlEq/yGI2G7wkIM1X
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="386788084"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="386788084"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 09:29:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="700768970"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="700768970"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 03 Oct 2023 09:29:09 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qniGh-0007RM-04;
	Tue, 03 Oct 2023 16:29:07 +0000
Date: Wed, 4 Oct 2023 00:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Hengqi Chen <hengqi.chen@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] seccomp: Introduce SECCOMP_LOAD_FILTER operation
Message-ID: <202310040012.kV4xilAy-lkp@intel.com>
References: <20231003083836.100706-2-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231003083836.100706-2-hengqi.chen@gmail.com>

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
patch link:    https://lore.kernel.org/r/20231003083836.100706-2-hengqi.chen%40gmail.com
patch subject: [RFC PATCH 1/2] seccomp: Introduce SECCOMP_LOAD_FILTER operation
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20231004/202310040012.kV4xilAy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310040012.kV4xilAy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310040012.kV4xilAy-lkp@intel.com/

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
>> kernel/seccomp.c:2034:8: error: call to undeclared function 'security_bpf_prog_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2034 |         ret = security_bpf_prog_alloc(prog->aux);
         |               ^
   kernel/seccomp.c:2034:8: note: did you mean 'security_msg_msg_alloc'?
   include/linux/security.h:1245:19: note: 'security_msg_msg_alloc' declared here
    1245 | static inline int security_msg_msg_alloc(struct msg_msg *msg)
         |                   ^
>> kernel/seccomp.c:2043:8: error: call to undeclared function 'bpf_prog_new_fd'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2043 |         ret = bpf_prog_new_fd(prog);
         |               ^
   12 warnings and 2 errors generated.


vim +/security_bpf_prog_alloc +2034 kernel/seccomp.c

  2011	
  2012	#ifdef CONFIG_COMPAT
  2013		if (in_compat_syscall()) {
  2014			struct compat_sock_fprog fprog32;
  2015			if (copy_from_user(&fprog32, filter, sizeof(fprog32)))
  2016				goto out;
  2017			fprog.len = fprog32.len;
  2018			fprog.filter = compat_ptr(fprog32.filter);
  2019		} else /* falls through to the if below. */
  2020	#endif
  2021		if (copy_from_user(&fprog, filter, sizeof(fprog)))
  2022			goto out;
  2023	
  2024		ret = -EINVAL;
  2025		if (fprog.len == 0 || fprog.len > BPF_MAXINSNS)
  2026			goto out;
  2027	
  2028		BUG_ON(INT_MAX / fprog.len < sizeof(struct sock_filter));
  2029	
  2030		ret = bpf_prog_create_from_user(&prog, &fprog, seccomp_check_filter, save_orig);
  2031		if (ret < 0)
  2032			goto out;
  2033	
> 2034		ret = security_bpf_prog_alloc(prog->aux);
  2035		if (ret) {
  2036			ret = -EINVAL;
  2037			goto prog_free;
  2038		}
  2039	
  2040		prog->aux->user = get_current_user();
  2041		atomic64_set(&prog->aux->refcnt, 1);
  2042	
> 2043		ret = bpf_prog_new_fd(prog);
  2044		if (ret < 0)
  2045			bpf_prog_put(prog);
  2046		return ret;
  2047	
  2048	prog_free:
  2049		bpf_prog_free(prog);
  2050	out:
  2051		return ret;
  2052	}
  2053	#else
  2054	static inline long seccomp_set_mode_filter(unsigned int flags,
  2055						   const char __user *filter)
  2056	{
  2057		return -EINVAL;
  2058	}
  2059	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
