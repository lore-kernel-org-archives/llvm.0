Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136BF1E8342;
	Wed, 19 Nov 2025 01:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763515990; cv=none; b=Ep8cuSItHcfC55vjaG9r80ot1vsSQdh/NcvzT0pZwn2xS7oKFaDPQJQVP+kswMq+5RQzV+tTN1E/kl+38n1OFrUQj88U0QjeZADiuKC7eyPDz7RASNAldFrdQ1LRyszQj0GTJOyawPRiJHiopjfYcFYHcQaOQzqScwgORQHSDU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763515990; c=relaxed/simple;
	bh=DvmgA7sgmbGuXynCvqxoipVufBDHN23HD5C0mOMAL9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwGioFTUAjCCB2o1r7Vag6ilRmUpep/VmkON+8TNbMbJ/ibK5IEfmYb+MC/rx5GQ3jo+c48N6qLgDwrv6Ax/+jI5AquoU99zDWOrSOIWqnn5w8DLgFy4gl6eHiNp0hzxmjoybqeZS0sVW5P/wVWiZ+EegjpOD+fN1MhrINIkKt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnMmUOIB; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnMmUOIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763515988; x=1795051988;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DvmgA7sgmbGuXynCvqxoipVufBDHN23HD5C0mOMAL9M=;
  b=AnMmUOIBWscbCpXT1aYQ5v3bXh8aPnbkoAqPNLSmOFR5whJpuqtve37G
   gl+u7VaH462reJwZlfNbLl9wyHyK21RuA+jDflaPgiOwfXKSYdXvfWMxN
   eEy4vC+6gn+pLnP01i3QbEhfjNHipWs/SvgDiaXxvuYLxLHkD/HWe9Yde
   iVeN0AOoV3pgP5Nzw7I4KaB74zVHaULbnTF53sUKM//SYQTXyYRtu1MG0
   +Ec5sXetchm/APc16XpNgZ4TwoweoYTU0c4HZfm9b+mk9Drm86mfPr8gF
   MKmNwYVHq67MZuBIaZrchL/nQgvYt5RyuGjatNynBEQCFEKT4/+j1xLfW
   A==;
X-CSE-ConnectionGUID: 8qsr2Et9TdilhtPuB40s6Q==
X-CSE-MsgGUID: r4IJlElMR+Oh9ldJstt/Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65430662"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65430662"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 17:33:06 -0800
X-CSE-ConnectionGUID: Al9WWulaQAqB1Z0buq7CeA==
X-CSE-MsgGUID: /hAP615RRUe7pxzAhrNDkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191161013"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 17:33:05 -0800
Date: Tue, 18 Nov 2025 17:40:08 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 8/9] x86/hyperv/vtl: Mark the wakeup mailbox page as
 private
Message-ID: <20251119014008.GA21978@ranerica-svr.sc.intel.com>
References: <20251117-rneri-wakeup-mailbox-v7-8-4a8b82ab7c2c@linux.intel.com>
 <202511190008.AA0NTn3G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202511190008.AA0NTn3G-lkp@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Wed, Nov 19, 2025 at 01:18:11AM +0800, kernel test robot wrote:
> Hi Ricardo,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on 6f85aad74a70d17919a64ecd93037aa51c08698d]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Neri/x86-acpi-Add-functions-to-setup-and-access-the-wakeup-mailbox/20251118-011935
> base:   6f85aad74a70d17919a64ecd93037aa51c08698d
> patch link:    https://lore.kernel.org/r/20251117-rneri-wakeup-mailbox-v7-8-4a8b82ab7c2c%40linux.intel.com
> patch subject: [PATCH v7 8/9] x86/hyperv/vtl: Mark the wakeup mailbox page as private
> config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251119/202511190008.AA0NTn3G-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190008.AA0NTn3G-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511190008.AA0NTn3G-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/x86/hyperv/hv_vtl.c:9:
>    In file included from arch/x86/include/asm/acpi.h:11:
>    In file included from arch/x86/include/asm/numa.h:8:
> >> arch/x86/include/asm/topology.h:264:26: error: expected ';' after top level declarator
>      264 | extern bool __read_mostly sysctl_sched_itmt_enabled;
>          |                          ^
>          |                          ;

The patch in https://lore.kernel.org/all/20251117-rneri-topology-cpuinfo-bug-v1-1-a905bb5f91e2@linux.intel.com/
fixes this error too.

>    In file included from arch/x86/hyperv/hv_vtl.c:9:
> >> arch/x86/include/asm/acpi.h:179:42: error: unknown type name 'acpi_physical_address'
>      179 | extern void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys,
>          |                                          ^
> >> arch/x86/include/asm/acpi.h:180:7: error: unknown type name 'acpi_size'
>      180 |                                          acpi_size size);
>          |                                          ^
>    arch/x86/include/asm/acpi.h:181:35: error: unknown type name 'acpi_physical_address'
>      181 | void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
>          |                                   ^
>    arch/x86/include/asm/acpi.h:181:63: error: unknown type name 'acpi_size'
>      181 | void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
>          |                                                               ^
>    In file included from arch/x86/hyperv/hv_vtl.c:10:
>    In file included from arch/x86/include/asm/apic.h:6:
>    In file included from include/linux/static_call.h:135:
>    In file included from include/linux/cpu.h:17:
>    In file included from include/linux/node.h:18:
>    In file included from include/linux/device.h:32:
>    In file included from include/linux/device/driver.h:21:
>    In file included from include/linux/module.h:20:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/x86/include/asm/elf.h:10:
>    In file included from arch/x86/include/asm/ia32.h:7:
>    In file included from include/linux/compat.h:17:
>    In file included from include/linux/fs.h:34:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
>       98 |                 return (set->sig[3] | set->sig[2] |
>          |                         ^        ~
>    arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
>       24 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/x86/hyperv/hv_vtl.c:10:
>    In file included from arch/x86/include/asm/apic.h:6:
>    In file included from include/linux/static_call.h:135:
>    In file included from include/linux/cpu.h:17:
>    In file included from include/linux/node.h:18:
>    In file included from include/linux/device.h:32:
>    In file included from include/linux/device/driver.h:21:
>    In file included from include/linux/module.h:20:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/x86/include/asm/elf.h:10:
>    In file included from arch/x86/include/asm/ia32.h:7:
>    In file included from include/linux/compat.h:17:
>    In file included from include/linux/fs.h:34:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
>       98 |                 return (set->sig[3] | set->sig[2] |
>          |                                       ^        ~
>    arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
>       24 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/x86/hyperv/hv_vtl.c:10:
>    In file included from arch/x86/include/asm/apic.h:6:
>    In file included from include/linux/static_call.h:135:
>    In file included from include/linux/cpu.h:17:
>    In file included from include/linux/node.h:18:
>    In file included from include/linux/device.h:32:
>    In file included from include/linux/device/driver.h:21:
>    In file included from include/linux/module.h:20:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/x86/include/asm/elf.h:10:
>    In file included from arch/x86/include/asm/ia32.h:7:
>    In file included from include/linux/compat.h:17:
>    In file included from include/linux/fs.h:34:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
>       99 |                         set->sig[1] | set->sig[0]) == 0;
>          |                         ^        ~
>    arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
>       24 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/x86/hyperv/hv_vtl.c:10:
>    In file included from arch/x86/include/asm/apic.h:6:
>    In file included from include/linux/static_call.h:135:
>    In file included from include/linux/cpu.h:17:
>    In file included from include/linux/node.h:18:
>    In file included from include/linux/device.h:32:
>    In file included from include/linux/device/driver.h:21:
>    In file included from include/linux/module.h:20:
>    In file included from include/linux/elf.h:6:
>    In file included from arch/x86/include/asm/elf.h:10:
>    In file included from arch/x86/include/asm/ia32.h:7:
>    In file included from include/linux/compat.h:17:
>    In file included from include/linux/fs.h:34:
>    In file included from include/linux/percpu-rwsem.h:7:
>    In file included from include/linux/rcuwait.h:6:
>    In file included from include/linux/sched/signal.h:6:
>    include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
>      101 |                 return (set->sig[1] | set->sig[0]) == 0;
>          |                         ^        ~
>    arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
>       24 |         unsigned long sig[_NSIG_WORDS];
>          |         ^
>    In file included from arch/x86/hyperv/hv_vtl.c:10:
>    In file included from arch/x86/include/asm/apic.h:6:
>    In file included from include/linux/static_call.h:135:
>    In file included from include/linux/cpu.h:17:
> 
> 
> vim +/acpi_physical_address +179 arch/x86/include/asm/acpi.h
> 
> e7b66d16fe4172 Juergen Gross 2018-10-10  176  
> 9221222c717dbd Juergen Gross 2024-08-09  177  #ifdef CONFIG_XEN_PV
> 9221222c717dbd Juergen Gross 2024-08-09  178  /* A Xen PV domain needs a special acpi_os_ioremap() handling. */
> 9221222c717dbd Juergen Gross 2024-08-09 @179  extern void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys,
> 9221222c717dbd Juergen Gross 2024-08-09 @180  					 acpi_size size);
> 9221222c717dbd Juergen Gross 2024-08-09  181  void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
> 9221222c717dbd Juergen Gross 2024-08-09  182  #define acpi_os_ioremap acpi_os_ioremap
> 9221222c717dbd Juergen Gross 2024-08-09  183  #endif
> 9221222c717dbd Juergen Gross 2024-08-09  184  

These errors are caused by a missing header in this patch. I will fix this issue.
