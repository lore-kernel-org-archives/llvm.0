Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CD62116EE;
	Fri, 10 Jan 2025 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524231; cv=none; b=llBhjPzRapicsugIxUXz1Lj4iuJRpkyye7safVt8va3ZYko7uiSYOWa+3tfjo0n6PMc9VcQJr4hKBf67diKuuwJqoy/sphHc65GVa55kqAQtCWBaYzWj75QYkkSJsm4QAi1UWTkXy3FZY/okWBXZDLRa65I5BgP/PBcpAisdeGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524231; c=relaxed/simple;
	bh=p7Q+E7SzkIx217ZVyoT0u9dgp89rT/WEr2oYpiWlTvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DAQdtPzopYoQ44wd1zQeaxJrzg5ZiQioMoliGwxGgfTPPLLoBPqusodqcCZbUItaIX8DXxDZ7KjyxsnsLBWG2KsTV42I9e9AR0GLrtdfYLJxafzG25hZ2sg+6tkO318Ezb0bJZjOlxz7AltKKeRq/8rXr2ZcrP9FHC+O6i6O43k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtdzK3bd; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtdzK3bd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736524229; x=1768060229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p7Q+E7SzkIx217ZVyoT0u9dgp89rT/WEr2oYpiWlTvc=;
  b=OtdzK3bddxZsT6ccfhVoSvjPANP16linI5fxOJTSWWiyIFPOKoRkmy39
   SkrHWfS6SiIUIWRBdckpzlMY0Ovn86MuIUpGkjtavdMTb90GbQPrDFUY7
   cgOVtS6QFhWJlFJpo/KLvRel6ulYXe3MK4vVSZCukDDHL1cPwTN6xy9By
   TBMv5LFQdAQN4rMugdChrjBE4aRLqMyd26yZ1r3pRc9kiYdOaS7FEU/uo
   MMGNYLSbZkG8zDV0XVZCRxVBqGRSfZohTBnVwqnk/HXXM/HAx5JZgihhL
   ScR1AJqYo+7d07eYc+tO3knAp7cm2hwwKZWjL3m8J94vyJnFdADWG6/39
   w==;
X-CSE-ConnectionGUID: EblugONpSei/cYf1xr1Qfg==
X-CSE-MsgGUID: 7L3KNIxDQqyytDYy8c/lHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36106956"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36106956"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 07:50:28 -0800
X-CSE-ConnectionGUID: wnz314vyQ9GNJ8ETWsGlug==
X-CSE-MsgGUID: /wswR8R0TsakX75c8wU7MQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134670178"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2025 07:50:27 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWHHE-000JQZ-1j;
	Fri, 10 Jan 2025 15:50:24 +0000
Date: Fri, 10 Jan 2025 23:49:25 +0800
From: kernel test robot <lkp@intel.com>
To: Even Xu <even.xu@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jiri Kosina <jikos@kernel.org>, Xinpeng Sun <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: [linux-next:master 7317/7860]
 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:259:11: error:
 call to undeclared function 'acpi_execute_simple_method'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202501102352.Xfv1hCxO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2b88851f583d3c4e40bcd40cfe1965241ec229dd
commit: 9d8d51735a3af40b722346931a6a1e50227df4b5 [7317/7860] HID: intel-thc-hid: intel-quickspi: Add HIDSPI protocol implementation
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250110/202501102352.Xfv1hCxO-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102352.Xfv1hCxO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501102352.Xfv1hCxO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:7:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:7:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:7:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:7:
   In file included from include/linux/hid.h:29:
   In file included from include/linux/hid_bpf.h:6:
   In file included from include/linux/bpf.h:31:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:258:11: error: call to undeclared function 'acpi_device_handle'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     258 |         handle = acpi_device_handle(qsdev->acpi_dev);
         |                  ^
   drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:258:9: error: incompatible integer to pointer conversion assigning to 'acpi_handle' (aka 'void *') from 'int' [-Wint-conversion]
     258 |         handle = acpi_device_handle(qsdev->acpi_dev);
         |                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:259:11: error: call to undeclared function 'acpi_execute_simple_method'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     259 |         status = acpi_execute_simple_method(handle, "_RST", 0);
         |                  ^
   drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c:259:11: note: did you mean 'acpi_execute_reg_methods'?
   include/acpi/acpixf.h:662:8: note: 'acpi_execute_reg_methods' declared here
     662 |                             acpi_execute_reg_methods(acpi_handle device,
         |                             ^
   include/acpi/platform/aclinux.h:93:21: note: expanded from macro 'ACPI_EXTERNAL_RETURN_STATUS'
      93 |         static ACPI_INLINE prototype {return(AE_NOT_CONFIGURED);}
         |                            ^
   13 warnings and 3 errors generated.


vim +/acpi_execute_simple_method +259 drivers/hid/intel-thc-hid/intel-quickspi/quickspi-protocol.c

   249	
   250	static int acpi_tic_reset(struct quickspi_device *qsdev)
   251	{
   252		acpi_status status = 0;
   253		acpi_handle handle;
   254	
   255		if (!qsdev->acpi_dev)
   256			return -ENODEV;
   257	
   258		handle = acpi_device_handle(qsdev->acpi_dev);
 > 259		status = acpi_execute_simple_method(handle, "_RST", 0);
   260		if (ACPI_FAILURE(status)) {
   261			dev_err_once(qsdev->dev,
   262				     "Failed to reset device through ACPI method, ret = %d\n", status);
   263			return -EIO;
   264		}
   265	
   266		return 0;
   267	}
   268	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
