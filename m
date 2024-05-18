Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBBFBE49;
	Sat, 18 May 2024 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716045181; cv=none; b=NgzQPwhOv0e4ZCGNJmKFEg0yv/C/mxZHJsfvRjcCwElwW4tjhD1xL5yFTR78xSO8lHguZKBN/L+TRbJH/TQU4wRK8srb6se7o0mVQgA093X2hFwF2cjEjOrbO6VFKG33ZmyfvvNQYpvNzwFiHwUEbJw87O/yyV39QW7pggt/Nvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716045181; c=relaxed/simple;
	bh=tEnSYlUZA2KJzWC9C4Mk9deRVlOvubKNUecXFV+sVu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ibY+Nx161DMF+VJ4BLX+WsENiBZY3wnpCVYIr/YqlDrS9GkoVvo+AXzWmcovRUnomTWRe+SO4hD99kKZJJYU35qmFTKuQHwDF87fhu2FhL33P9GwYUYxZ1ZS+5uRWmmjaZ4L9RRCxwTfZ5EqZxnM4L8e+OrZyqUnZ3Bl5dP0uvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DiWpeHg1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DiWpeHg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716045179; x=1747581179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tEnSYlUZA2KJzWC9C4Mk9deRVlOvubKNUecXFV+sVu8=;
  b=DiWpeHg1Yl5hBRQXqyyyYLa5XAZkIE4G6ZN3HAHXLiT7Qe7nB5c+GpYp
   zhcjQfnv5viJyo4sLXuRaQiTuHwqhWQoA7Yu2OVmlCizNUqy+65CgOfCh
   Srhhv9bbmOi0CKKm7flNgCEAeajslCgMCiX9/kbIq27MaLWasyLrqWim7
   WoCAWRvLONUG/EM45MtF2KD4Z21k4rY9RnhP1+VoxDQ+P07mg5FXcwRm4
   /d2IA/ypqz30FfE9uedAqCmEz5eOu/fh35BUEeP+zt3INo8ShrTGBKK/4
   In3fFM6Uovd2p0xtUqhV2qRUxcUtOKS2ie4T4F+GTsuiPPMmTH4QTWGnB
   g==;
X-CSE-ConnectionGUID: c+wT1p6ARnq7UdolVo1Qfg==
X-CSE-MsgGUID: mObOZdBXRX+5txNx9zVFhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12406651"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="12406651"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 08:12:58 -0700
X-CSE-ConnectionGUID: /5+dGgj+R+CAMePQktKmwA==
X-CSE-MsgGUID: u7LXr76OS0mQjsAc2DSbaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; 
   d="scan'208";a="36492588"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 May 2024 08:12:57 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8Ljy-0002JM-38;
	Sat, 18 May 2024 15:12:54 +0000
Date: Sat, 18 May 2024 23:12:25 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/virt_enable_less_sucky 4/5]
 arch/s390/kvm/../../../virt/kvm/kvm_main.c:6443:10: error: use of undeclared
 identifier 'kvm_usage_count'; did you mean 'set_page_count'?
Message-ID: <202405182337.62ffHiQz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/virt_enable_less_sucky
head:   371a6c885b7bffb276ebf0a7e660d2702b1555e7
commit: b9f6ab5e571d77c7cc35dd6f4642677fdc6e8bc3 [4/5] KVM: Add a module param to allow enabled virtualization when KVM is loaded
config: s390-defconfig (https://download.01.org/0day-ci/archive/20240518/202405182337.62ffHiQz-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182337.62ffHiQz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182337.62ffHiQz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2210:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from arch/s390/kvm/../../../virt/kvm/kvm_main.c:18:
   In file included from include/linux/kvm_host.h:19:
   In file included from include/linux/msi.h:27:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
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
>> arch/s390/kvm/../../../virt/kvm/kvm_main.c:6443:10: error: use of undeclared identifier 'kvm_usage_count'; did you mean 'set_page_count'?
    6443 |                 BUG_ON(kvm_usage_count);
         |                        ^~~~~~~~~~~~~~~
         |                        set_page_count
   include/asm-generic/bug.h:71:45: note: expanded from macro 'BUG_ON'
      71 | #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
         |                                             ^
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/page_ref.h:97:20: note: 'set_page_count' declared here
      97 | static inline void set_page_count(struct page *page, int v)
         |                    ^
   17 warnings and 1 error generated.


vim +6443 arch/s390/kvm/../../../virt/kvm/kvm_main.c

  6429	
  6430	void kvm_exit(void)
  6431	{
  6432		int cpu;
  6433	
  6434		/*
  6435		 * Note, unregistering /dev/kvm doesn't strictly need to come first,
  6436		 * fops_get(), a.k.a. try_module_get(), prevents acquiring references
  6437		 * to KVM while the module is being stopped.
  6438		 */
  6439		misc_deregister(&kvm_dev);
  6440	
  6441		if (enable_virt_at_load) {
  6442			kvm_disable_virtualization();
> 6443			BUG_ON(kvm_usage_count);
  6444		}
  6445	
  6446		debugfs_remove_recursive(kvm_debugfs_dir);
  6447		for_each_possible_cpu(cpu)
  6448			free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
  6449		kmem_cache_destroy(kvm_vcpu_cache);
  6450		kvm_vfio_ops_exit();
  6451		kvm_async_pf_deinit();
  6452		kvm_irqfd_exit();
  6453	}
  6454	EXPORT_SYMBOL_GPL(kvm_exit);
  6455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
