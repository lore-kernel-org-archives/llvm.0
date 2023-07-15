Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10556625;
	Sat, 15 Jul 2023 00:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689380990; x=1720916990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iqs0j1QscZFhakd2g7cneuEpIDA+qroESvK7mhdbxn4=;
  b=DOpFTDZLG4EeQjZVNOJ9dcWI6zEoGSXXtkL3pfY/o2AAcx+EYz01t93+
   uBM2VUvp93nt4YEu5MK6BBHvV5YZ53crBMIWBPeOWIIBIGBvWG1BqlUDe
   XLj54zjC/9DrhiwF6QxNyFmWWK6MpaBFdmaDvlziVB7Fx3qwnmwIqOLMR
   pC3Fjjfl3avj4xOJS3Miebh+rpYvUNXLfDffyE267lTM9RC/6N4F33AxN
   7VrZv97GxAt/hwHWoT1qZZgo5ecBJ+COXTy+H2+cnuDkAG93oDvEykXY3
   OEdGaIJhzbPM8dXt3WGYCqXj5BB/7SLtf/hbBsdMLKkTag+OKG/S0Yqlb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="364481576"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="364481576"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2023 17:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10771"; a="896589773"
X-IronPort-AV: E=Sophos;i="6.01,206,1684825200"; 
   d="scan'208";a="896589773"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Jul 2023 17:29:46 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKTAQ-0007mr-0t;
	Sat, 15 Jul 2023 00:29:46 +0000
Date: Sat, 15 Jul 2023 08:29:16 +0800
From: kernel test robot <lkp@intel.com>
To: Deepak Gupta <debug@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:arm64-gcs 13/48] kernel/sys.c:2305:12: warning: no
 previous prototype for function 'arch_get_shadow_stack_status'
Message-ID: <202307150810.KwRDzuUH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   e90b1663883e49f3f5aef612fde57503c21ad1ad
commit: b506a9cc113f13d910ab85a127c299d63a3c1fb1 [13/48] prctl: arch-agnostic prctl for shadow stack
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230715/202307150810.KwRDzuUH-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307150810.KwRDzuUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307150810.KwRDzuUH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sys.c:10:
   In file included from include/linux/mm_inline.h:7:
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
   In file included from kernel/sys.c:10:
   In file included from include/linux/mm_inline.h:7:
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
   In file included from kernel/sys.c:10:
   In file included from include/linux/mm_inline.h:7:
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
>> kernel/sys.c:2305:12: warning: no previous prototype for function 'arch_get_shadow_stack_status' [-Wmissing-prototypes]
    2305 | int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
         |            ^
   kernel/sys.c:2305:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2305 | int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
         | ^
         | static 
>> kernel/sys.c:2310:12: warning: no previous prototype for function 'arch_set_shadow_stack_status' [-Wmissing-prototypes]
    2310 | int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
         |            ^
   kernel/sys.c:2310:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2310 | int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
         | ^
         | static 
>> kernel/sys.c:2315:12: warning: no previous prototype for function 'arch_get_indir_br_lp_status' [-Wmissing-prototypes]
    2315 | int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
         |            ^
   kernel/sys.c:2315:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2315 | int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
         | ^
         | static 
>> kernel/sys.c:2320:12: warning: no previous prototype for function 'arch_set_indir_br_lp_status' [-Wmissing-prototypes]
    2320 | int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
         |            ^
   kernel/sys.c:2320:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2320 | int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
         | ^
         | static 
   16 warnings generated.


vim +/arch_get_shadow_stack_status +2305 kernel/sys.c

  2304	
> 2305	int __weak arch_get_shadow_stack_status(struct task_struct *t, unsigned long __user *status)
  2306	{
  2307		return -EINVAL;
  2308	}
  2309	
> 2310	int __weak arch_set_shadow_stack_status(struct task_struct *t, unsigned long status)
  2311	{
  2312		return -EINVAL;
  2313	}
  2314	
> 2315	int __weak arch_get_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
  2316	{
  2317		return -EINVAL;
  2318	}
  2319	
> 2320	int __weak arch_set_indir_br_lp_status(struct task_struct *t, unsigned long __user *status)
  2321	{
  2322		return -EINVAL;
  2323	}
  2324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
