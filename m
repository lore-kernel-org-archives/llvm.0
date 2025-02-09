Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4BE4C79;
	Sun,  9 Feb 2025 07:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739085797; cv=none; b=qFElFgp6LppPF7B6BBQTFEcOE0SC1Eq924NMZA133OmYcfDqAnhLQnjWBoRhp+oyrZoRX3/CAYoDnVLq8ZLoPv+t6gVuTgNvF10bb9pdrFtZJUuzLA2T5qP2a/347ywI4LwzX/BL5ET0j5o7MHVaE/nHtjTehtUmvIZitUBL5Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739085797; c=relaxed/simple;
	bh=5GqIc+1kCxkhd7PHGBP5vf6u6aXir0IC/lpMivcNzjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qj7ZXmQuboAnoInI4TE6W76+8ozYBqumEiqy6nONLBrywB5lKeGp0opcIDfpEYa7WyossIjykSl56KckTx5JivTVfHGzH+nybl5Yuu6MGc9dezwV0ZDF4em7A8p72CwDxyvkv8dugIv6/Dka3ihDNnFhL7WiZD9xZLC3cO+g0kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LuAd+8nT; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LuAd+8nT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739085795; x=1770621795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5GqIc+1kCxkhd7PHGBP5vf6u6aXir0IC/lpMivcNzjE=;
  b=LuAd+8nT4QQa8QhP8aShnASIZiap74VFRxoGmPpUIg4rLw3VsvMiwp1z
   oKiTJz7y6gMo0IDFpZItQ1BbbuQjdcdOm7zIVPJtbY6j+vgKw4YkP/AE9
   JpxMIqkM4+XA1v27jHHGNXE0Q9A0EVKKgC5MGlhz+h9cE7mj4dDRd8ybv
   /Y7R2wbF+RIeOi1tsZZSLzGZYfGfdunhRfQTMPl9bs3NpNmE38zny3jUA
   5i3sZOkzhm+52a6R2kktjmMWP3Uf2xqwcVLYzzoKzYUGxj6twr5/5Nr5a
   1tXhcH7Xp0aEt4T793eu7Hd5kd5U/IJUOSKhUtIogW/5zlOlpGp4N4Vvn
   g==;
X-CSE-ConnectionGUID: WnqYMvnQQIWlGvWWYrjf7A==
X-CSE-MsgGUID: 4swB4KgcTF+nZb00omhKsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="43345762"
X-IronPort-AV: E=Sophos;i="6.13,271,1732608000"; 
   d="scan'208";a="43345762"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 23:23:14 -0800
X-CSE-ConnectionGUID: mkRfQn5lRKSOaj/45geYcw==
X-CSE-MsgGUID: qhG2bFFvT8CbNdrGgGMsnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="117104206"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Feb 2025 23:23:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1th1en-0011Cn-3D;
	Sun, 09 Feb 2025 07:23:09 +0000
Date: Sun, 9 Feb 2025 15:22:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_unaligned_test_skip_v1 28/77]
 drivers/mailbox/riscv-sbi-mpxy-mbox.c:1005:36: warning: unused variable
 'mpxy_mbox_acpi_match'
Message-ID: <202502091536.UuAYP9pL-lkp@intel.com>
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
commit: 13851aef320d7e43e85b08933a00593dd1322653 [28/77] mailbox/riscv-sbi-mpxy: Add ACPI support
config: riscv-randconfig-001-20250209 (https://download.01.org/0day-ci/archive/20250209/202502091536.UuAYP9pL-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250209/202502091536.UuAYP9pL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502091536.UuAYP9pL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mailbox/riscv-sbi-mpxy-mbox.c:20:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:804:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     804 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:104:53: note: expanded from macro 'insb'
     104 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/mailbox/riscv-sbi-mpxy-mbox.c:20:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:812:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     812 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
     105 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/mailbox/riscv-sbi-mpxy-mbox.c:20:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:820:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     820 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
     106 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from drivers/mailbox/riscv-sbi-mpxy-mbox.c:20:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:829:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     829 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
     118 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/mailbox/riscv-sbi-mpxy-mbox.c:20:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
     119 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/mailbox/riscv-sbi-mpxy-mbox.c:20:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:847:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     847 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
     120 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from drivers/mailbox/riscv-sbi-mpxy-mbox.c:20:
   In file included from include/linux/msi.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/mailbox/riscv-sbi-mpxy-mbox.c:1005:36: warning: unused variable 'mpxy_mbox_acpi_match' [-Wunused-const-variable]
    1005 | static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +/mpxy_mbox_acpi_match +1005 drivers/mailbox/riscv-sbi-mpxy-mbox.c

  1004	
> 1005	static const struct acpi_device_id mpxy_mbox_acpi_match[] = {
  1006		{ "RSCV0005" },
  1007		{}
  1008	};
  1009	MODULE_DEVICE_TABLE(acpi, mpxy_mbox_acpi_match);
  1010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
