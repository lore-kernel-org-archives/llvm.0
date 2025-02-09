Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F6E143888;
	Sun,  9 Feb 2025 08:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739091383; cv=none; b=jn5ycevmJISfcR8BPNgWii1cUamrLKFxEN96sIyizkTMIZ0SaJyCOwnHbXET0FENeZRNMPDERfvxXzzcm+yiN+NFhsILQinPMnAJS+i+lpV00Rl/SNxwzwb4sgeP9gxOa3Z4TWMomFllQ/Jk/DA27ZIfhY295HeEGLfafudFx+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739091383; c=relaxed/simple;
	bh=sVHpJ+0fKTU9C02dksHnxm9yM5GvjtKn9AUd9XsmOC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+GliZK8h3UP3UmRnHLXJ4WzewhA4AfIY59IphPgH8DRjJDlPnAMOq3iWVENoVLqQghU3ad2Dmy3e63XPK1sNsTGOe8y2XKZPs8t2K0xv6z0YHxpqbvxvyJv6W6V6lx6wwl10Sr6khETi+pigWXTMPyXmGzJT0VwLtKZc52xJdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuXk1oHa; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuXk1oHa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739091382; x=1770627382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sVHpJ+0fKTU9C02dksHnxm9yM5GvjtKn9AUd9XsmOC4=;
  b=FuXk1oHa+u/AbB5H3tcvzNISuKiTegW4YcN2TI9XfWzNsBLxJSTmRklz
   tS0GIz15xJEnpo69ZdTVVV0YD6EroSFXI1c8P6nXZm//yUf7+HnMp/jWR
   VqamhbAN9LbzWq0JoLQjsH6wxvaA5JmP4HPlpfM6Ru58Hi+8zyAPTNTa4
   MStVCn/HBeiA6v5OuKiSNqecmNo1cufieWzUApqeHZzVMyGHoUsS4obh5
   VqQTWxbi/MKCPPuNJLcE+ZVQ7seqVwFhfcCobLRYb6qwJUYF2aT3S94EL
   swncr0K6OYEE8OVgrebfIMrWARDOs4xqf6W4X38lfsBQIzEhNGF0UMeMu
   g==;
X-CSE-ConnectionGUID: z0RKP7+uR+6ZgnsB6L7sng==
X-CSE-MsgGUID: rHzqd4AxRauRngRn0ht8uA==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43451056"
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="43451056"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 00:56:22 -0800
X-CSE-ConnectionGUID: Fv3V/s/iQ9++GkyvdHVK5w==
X-CSE-MsgGUID: VJBWZ+EXRxKcD4ZlGDT3OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,272,1732608000"; 
   d="scan'208";a="116920341"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Feb 2025 00:56:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th36v-0011Gx-1x;
	Sun, 09 Feb 2025 08:56:17 +0000
Date: Sun, 9 Feb 2025 16:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_unaligned_test_skip_v1 29/77]
 drivers/irqchip/irq-riscv-rpmi-sysmsi.c:295:36: warning: unused variable
 'acpi_rpmi_sysmsi_match'
Message-ID: <202502091617.AqDyIhLZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_unaligned_test_skip_v1
head:   aa50b53026d20b9d37c6d17a3cf2f42e65a2a636
commit: c2fda1370f05b732e7717a9f9181498303a58b7d [29/77] irqchip/riscv-rpmi-sysmsi: Add ACPI support
config: riscv-randconfig-001-20250209 (https://download.01.org/0day-ci/archive/20250209/202502091617.AqDyIhLZ-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091617.AqDyIhLZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091617.AqDyIhLZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-riscv-rpmi-sysmsi.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-rpmi-sysmsi.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-rpmi-sysmsi.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-rpmi-sysmsi.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-rpmi-sysmsi.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-rpmi-sysmsi.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/irqchip/irq-riscv-rpmi-sysmsi.c:10:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/irqchip/irq-riscv-rpmi-sysmsi.c:295:36: warning: unused variable 'acpi_rpmi_sysmsi_match' [-Wunused-const-variable]
     295 | static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +/acpi_rpmi_sysmsi_match +295 drivers/irqchip/irq-riscv-rpmi-sysmsi.c

   294	
 > 295	static const struct acpi_device_id acpi_rpmi_sysmsi_match[] = {
   296		{ "RSCV0006" },
   297		{}
   298	};
   299	MODULE_DEVICE_TABLE(acpi, acpi_rpmi_sysmsi_match);
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
