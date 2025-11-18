Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F58F31ED7A;
	Tue, 18 Nov 2025 17:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763486339; cv=none; b=WfxPpkf8+PusaJlV371pYEvYHiCZAPglkevAEMIJptu92eWYgaOTDVcWNU32pGGGEF7ofDFQUz4vxbrziCWp+95WT7lhXKXlab918wyVd4tBSdEQYV6JpRB1y5tdScL2dYkEkTdevwY6eJQDlKGaSpMUz30/r/36XjEJ+p4T4fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763486339; c=relaxed/simple;
	bh=y3tKpCfh/4o57cQqByW+ZX2CwDNoWCthgIox4p5fo6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgffdCZoAr4gwh3prjsbkbQonDG2VUsWYjFhMqjc7h/FBIBDR1GhL6HGQzX7EEP8iXJuVETknUxhuRE30Gl0TjkGjdBuuYLWx+b5ff+sxbzKLst3KH00QXIoP2MO4J46oDhZh2QU895GKzXZOaTKOZIE0P18l9UOzTXYYZvQv7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WdywMGFB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WdywMGFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763486336; x=1795022336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y3tKpCfh/4o57cQqByW+ZX2CwDNoWCthgIox4p5fo6o=;
  b=WdywMGFBGG40xHB84fnSutFdkSBMrQECLUVAFyiBsGQDM9ipOeTSsXXA
   8Jh6ZjFF2dXuHSqpeUXzRHdTCV2iL2Ig+j9PEeFqswmmQhGxBWEjucF4f
   h+e3hqlza+6NCQSqa7j3edtwFSBME7RpqzDKtkdMoSw9cJUhtrCIbOyjG
   yzw1NSawfA5fOI5RYajzZ5WND3Wttny+tmuwap72AXMkyrNDkHeKrz2kS
   mzd/Lbp6EKTBY3yEPzQN/EPCJUsNCmoLmYGVAynakKr0kGi/U7G6KfTAD
   YyAFWHJ09gIRaRhlX8t4DTr5GEggNrp5u8DwtoFtBwkR6UUJ5bQ4usA0C
   w==;
X-CSE-ConnectionGUID: A1HauI9JRv2KQMQcMwMelA==
X-CSE-MsgGUID: 28rLgidUR1y9tjHox89dPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76194245"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76194245"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 09:18:56 -0800
X-CSE-ConnectionGUID: jFpulnqIRKuOYT/oQ/ZZ1A==
X-CSE-MsgGUID: oFR/GI82TzqJSiGhkXrbLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="228148900"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2025 09:18:55 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLPLw-0001zX-0s;
	Tue, 18 Nov 2025 17:18:52 +0000
Date: Wed, 19 Nov 2025 01:18:11 +0800
From: kernel test robot <lkp@intel.com>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 8/9] x86/hyperv/vtl: Mark the wakeup mailbox page as
 private
Message-ID: <202511190008.AA0NTn3G-lkp@intel.com>
References: <20251117-rneri-wakeup-mailbox-v7-8-4a8b82ab7c2c@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117-rneri-wakeup-mailbox-v7-8-4a8b82ab7c2c@linux.intel.com>

Hi Ricardo,

kernel test robot noticed the following build errors:

[auto build test ERROR on 6f85aad74a70d17919a64ecd93037aa51c08698d]

url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Neri/x86-acpi-Add-functions-to-setup-and-access-the-wakeup-mailbox/20251118-011935
base:   6f85aad74a70d17919a64ecd93037aa51c08698d
patch link:    https://lore.kernel.org/r/20251117-rneri-wakeup-mailbox-v7-8-4a8b82ab7c2c%40linux.intel.com
patch subject: [PATCH v7 8/9] x86/hyperv/vtl: Mark the wakeup mailbox page as private
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251119/202511190008.AA0NTn3G-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190008.AA0NTn3G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511190008.AA0NTn3G-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/hyperv/hv_vtl.c:9:
   In file included from arch/x86/include/asm/acpi.h:11:
   In file included from arch/x86/include/asm/numa.h:8:
>> arch/x86/include/asm/topology.h:264:26: error: expected ';' after top level declarator
     264 | extern bool __read_mostly sysctl_sched_itmt_enabled;
         |                          ^
         |                          ;
   In file included from arch/x86/hyperv/hv_vtl.c:9:
>> arch/x86/include/asm/acpi.h:179:42: error: unknown type name 'acpi_physical_address'
     179 | extern void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys,
         |                                          ^
>> arch/x86/include/asm/acpi.h:180:7: error: unknown type name 'acpi_size'
     180 |                                          acpi_size size);
         |                                          ^
   arch/x86/include/asm/acpi.h:181:35: error: unknown type name 'acpi_physical_address'
     181 | void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
         |                                   ^
   arch/x86/include/asm/acpi.h:181:63: error: unknown type name 'acpi_size'
     181 | void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
         |                                                               ^
   In file included from arch/x86/hyperv/hv_vtl.c:10:
   In file included from arch/x86/include/asm/apic.h:6:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/hyperv/hv_vtl.c:10:
   In file included from arch/x86/include/asm/apic.h:6:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/hyperv/hv_vtl.c:10:
   In file included from arch/x86/include/asm/apic.h:6:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/hyperv/hv_vtl.c:10:
   In file included from arch/x86/include/asm/apic.h:6:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:
   In file included from include/linux/node.h:18:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:20:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:10:
   In file included from arch/x86/include/asm/ia32.h:7:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:34:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/x86/hyperv/hv_vtl.c:10:
   In file included from arch/x86/include/asm/apic.h:6:
   In file included from include/linux/static_call.h:135:
   In file included from include/linux/cpu.h:17:


vim +/acpi_physical_address +179 arch/x86/include/asm/acpi.h

e7b66d16fe4172 Juergen Gross 2018-10-10  176  
9221222c717dbd Juergen Gross 2024-08-09  177  #ifdef CONFIG_XEN_PV
9221222c717dbd Juergen Gross 2024-08-09  178  /* A Xen PV domain needs a special acpi_os_ioremap() handling. */
9221222c717dbd Juergen Gross 2024-08-09 @179  extern void __iomem * (*acpi_os_ioremap)(acpi_physical_address phys,
9221222c717dbd Juergen Gross 2024-08-09 @180  					 acpi_size size);
9221222c717dbd Juergen Gross 2024-08-09  181  void __iomem *x86_acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
9221222c717dbd Juergen Gross 2024-08-09  182  #define acpi_os_ioremap acpi_os_ioremap
9221222c717dbd Juergen Gross 2024-08-09  183  #endif
9221222c717dbd Juergen Gross 2024-08-09  184  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
