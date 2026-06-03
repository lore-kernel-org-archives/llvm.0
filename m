Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF35B3EF0DC;
	Wed,  3 Jun 2026 17:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780506594; cv=none; b=ReQO2C2m3wNfm3W4WvIh31SavZ/RYf4+fLEZp6gcN05oR0O9eEaJ6Fi4rfuNLaoonPwXPAvSpEB/BLuFeZ7bHOuA1q7pnEVkw76hlMHtmBEONDmfqUaKwjqROtcbenVf6d8wWMUTzSrj+aVEj8H2LiSgyemCloUMsK6z4kDrRek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780506594; c=relaxed/simple;
	bh=c8J1myb8ZsND9D6OTijpUKgoLxdUp3Lgetrog7eZsw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tb0UwBalRvZTc8ZpqY1Wy183kv76fOxzDjQg8U7C8LKRFNCTJ7I27vAAgzPn/MKNhQsx5NN2Zyx4Ofs+oj+G+Zr6+Z29wFlb9FeJxFx6esD0h1cocphHS7y6CEUoQ+H/BjotZr2r+LWBzxsDE8gIF5GAvtNEqbf9iq6eSCs+eH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GzXuH359; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GzXuH359"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780506593; x=1812042593;
  h=date:from:to:cc:subject:message-id;
  bh=c8J1myb8ZsND9D6OTijpUKgoLxdUp3Lgetrog7eZsw4=;
  b=GzXuH359kPXWSB2iAtikD3RJMKKNdJW8Wru9MB9ryYRkULPNDnaDnWFz
   D4LfSw6ekn9cILagqIaIYq/9STDOTs0+9wXmMk/BrZGxgJBny3W35aamP
   JB8NvsXOW+oH97hX+7+y0bAHGISeiMO9Yj5Cbf4N/gfd9VJncJsQFkeeG
   bLGCo1cBIwuouSHniTH5JLgxQ7bs6k7X0wKjlMlkUg2RlxLabpmrfFjsY
   /SBg699rL4k6cto0wo0nQ3dWm2gzJBXznWuoDc/MRsp5NYUgwi07O73GM
   aOEOrE+xerVGoXN/8YFOX3SAsk3METxE681B7Ut3HKZM4AQ1EUQwqt5ku
   A==;
X-CSE-ConnectionGUID: fLBzTiMTRCG8ZogbGwLZ5A==
X-CSE-MsgGUID: mBV59hgZRNqO0pW+YV9owQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81451514"
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="81451514"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2026 10:09:52 -0700
X-CSE-ConnectionGUID: LXBD8uTQTD6o28fdo6wuAw==
X-CSE-MsgGUID: m0bhBoYeT5yvYG4Q7lApyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,185,1774335600"; 
   d="scan'208";a="239821951"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Jun 2026 10:09:50 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUp6C-00000000Dgw-2U79;
	Wed, 03 Jun 2026 17:09:48 +0000
Date: Thu, 04 Jun 2026 01:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Thomas Gleixner <tglx@kernel.org>
Subject: [tglx-devel:irq/constify 8/8] kernel/irq/ipi.c:317:19:
 error: initializing 'struct irq_chip *' with an expression of type 'const
 struct irq_chip *' discards qualifiers
Message-ID: <202606040107.ZrsVFJvK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/constify
head:   2e8b4859e87ef8229ab12228b5e484171084a127
commit: 2e8b4859e87ef8229ab12228b5e484171084a127 [8/8] genirq/chip: Constify the 'chip' field in irq_data
config: riscv-nommu_virt_defconfig (https://download.01.org/0day-ci/archive/20260604/202606040107.ZrsVFJvK-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5ab4f8a1f766febdc65ce89c00dec85393cfd68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040107.ZrsVFJvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606040107.ZrsVFJvK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/irq/ipi.c:12:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:838:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     838 |         insb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:108:53: note: expanded from macro 'insb'
     108 | #define insb(addr, buffer, count) __insb(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/irq/ipi.c:12:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:846:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     846 |         insw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:109:53: note: expanded from macro 'insw'
     109 | #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/irq/ipi.c:12:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:854:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     854 |         insl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:110:53: note: expanded from macro 'insl'
     110 | #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
         |                                          ~~~~~~~~~~ ^
   In file included from kernel/irq/ipi.c:12:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:863:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     863 |         outsb(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:122:55: note: expanded from macro 'outsb'
     122 | #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/irq/ipi.c:12:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:872:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     872 |         outsw(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:123:55: note: expanded from macro 'outsw'
     123 | #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/irq/ipi.c:12:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:881:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     881 |         outsl(addr, buffer, count);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:124:55: note: expanded from macro 'outsl'
     124 | #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
         |                                            ~~~~~~~~~~ ^
   In file included from kernel/irq/ipi.c:12:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:140:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> kernel/irq/ipi.c:317:19: error: initializing 'struct irq_chip *' with an expression of type 'const struct irq_chip *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     317 |         struct irq_chip *chip = data ? irq_data_get_irq_chip(data) : NULL;
         |                          ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/irq/ipi.c:338:19: error: initializing 'struct irq_chip *' with an expression of type 'const struct irq_chip *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     338 |         struct irq_chip *chip = data ? irq_data_get_irq_chip(data) : NULL;
         |                          ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   7 warnings and 2 errors generated.


vim +317 kernel/irq/ipi.c

3b8e29a82dd16c Qais Yousef  2015-12-08  304  
3b8e29a82dd16c Qais Yousef  2015-12-08  305  /**
3b8e29a82dd16c Qais Yousef  2015-12-08  306   * ipi_send_single - Send an IPI to a single CPU
3b35e7e6daef5a Randy Dunlap 2021-08-10  307   * @virq:	Linux IRQ number from irq_reserve_ipi()
3b8e29a82dd16c Qais Yousef  2015-12-08  308   * @cpu:	destination CPU, must in the destination mask passed to
3b8e29a82dd16c Qais Yousef  2015-12-08  309   *		irq_reserve_ipi()
3b8e29a82dd16c Qais Yousef  2015-12-08  310   *
3b35e7e6daef5a Randy Dunlap 2021-08-10  311   * Return: %0 on success or negative error number on failure.
3b8e29a82dd16c Qais Yousef  2015-12-08  312   */
3b8e29a82dd16c Qais Yousef  2015-12-08  313  int ipi_send_single(unsigned int virq, unsigned int cpu)
3b8e29a82dd16c Qais Yousef  2015-12-08  314  {
3b8e29a82dd16c Qais Yousef  2015-12-08  315  	struct irq_desc *desc = irq_to_desc(virq);
3b8e29a82dd16c Qais Yousef  2015-12-08  316  	struct irq_data *data = desc ? irq_desc_get_irq_data(desc) : NULL;
3b8e29a82dd16c Qais Yousef  2015-12-08 @317  	struct irq_chip *chip = data ? irq_data_get_irq_chip(data) : NULL;
3b8e29a82dd16c Qais Yousef  2015-12-08  318  
3b8e29a82dd16c Qais Yousef  2015-12-08  319  	if (WARN_ON_ONCE(ipi_send_verify(chip, data, NULL, cpu)))
3b8e29a82dd16c Qais Yousef  2015-12-08  320  		return -EINVAL;
3b8e29a82dd16c Qais Yousef  2015-12-08  321  
3b8e29a82dd16c Qais Yousef  2015-12-08  322  	return __ipi_send_single(desc, cpu);
3b8e29a82dd16c Qais Yousef  2015-12-08  323  }
3b8e29a82dd16c Qais Yousef  2015-12-08  324  EXPORT_SYMBOL_GPL(ipi_send_single);
3b8e29a82dd16c Qais Yousef  2015-12-08  325  

:::::: The code at line 317 was first introduced by commit
:::::: 3b8e29a82dd16c1f2061e0b955a71cd36eeb061b genirq: Implement ipi_send_mask/single()

:::::: TO: Qais Yousef <qais.yousef@imgtec.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
