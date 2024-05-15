Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B103413F45C;
	Wed, 15 May 2024 14:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715783392; cv=none; b=cWO2mzMzOFouJLAWphYOUMDr3mo4OYl1aOQiiue9Z3dd+w9R3QULUkzizc8XhqaQ/3xOJSiFzGYsRA+XrZEzwy620OppjfNg2ZlFqTnyE73TBk0Z6Da0rFAq2Wn8Qz0DWNH5sGrjMIz7uHtnKYwJbUxhL2UI5fC0xRL1VLtOvGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715783392; c=relaxed/simple;
	bh=4aVkQKr9l0WIt7rdsf2qdZclzWVA8zoqgn9hVx4/pV0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tJmjy/lgh1KVLhaixAzWPD6yfVSGbFYlxGB6V+p2ZoXRn9Z8W0SGx06Avs4GWCqIQ1hqFpFXHiQK0dT27DnVSYgyIpmuMwuyyxfMFMgLSy3Qcvd0zaGrPAIIpjpsdRM7jKFCz9bnDYA5DpRtn0XrdS4ywT2qdYhn99mg84wdJD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KODpcmsQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KODpcmsQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715783391; x=1747319391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4aVkQKr9l0WIt7rdsf2qdZclzWVA8zoqgn9hVx4/pV0=;
  b=KODpcmsQsvHktPktPnrmh7r6oTvPSvBhOcmFaDtGzYihcU4wv2XfdHdl
   0pihC0JjZ7ahM2VIN4Ywnyhs2BAoMvBc6BVvAqgfOCvvlYALjZVOPQvxN
   MF4mJNvotatM8FB3CaONf6vX3sb2gadFdCM13A51vsT9Cq+dkAT82wtrp
   BG6YISEbve/CzhIFbZWjO7B8uvC4YHK1b8xkbA+brW19AhIOiGj+mxe/0
   LntR/nRuQ4iGTlctt/y3seNrHlhPrzJhjLyn0zj1nq3uROF+biUgj1SR0
   1yyNy86D3XltrbFNgEgC5F/dVzdqcrmMsDVh7POHPWw2C0D8tQXzPmig9
   A==;
X-CSE-ConnectionGUID: uyLaOEO9Staw7MDvl8O/ag==
X-CSE-MsgGUID: Z9LFtJMqQESt75ZTB9yT2A==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="34347528"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="34347528"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 07:29:50 -0700
X-CSE-ConnectionGUID: 3waoFJomQP+WNSpHq1CJYg==
X-CSE-MsgGUID: LTQu1JZURyCp1t2zn8mVug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="31665567"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 May 2024 07:29:47 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7FdZ-000CvX-0L;
	Wed, 15 May 2024 14:29:45 +0000
Date: Wed, 15 May 2024 22:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13096/13213]
 drivers/irqchip/irq-riscv-imsic-early.c:52:47: error: too many arguments to
 function call, expected 2, have 3
Message-ID: <202405152211.4swEsJn5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   82d92a9a1b9ea0ea52aff27cddd05009b4edad49
commit: f725fb3518e03b48a50a22f63c440cd04b41334a [13096/13213] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240515/202405152211.4swEsJn5-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d3455f4ddd16811401fa153298fadd2f59f6914e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240515/202405152211.4swEsJn5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405152211.4swEsJn5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-riscv-imsic-early.c:9:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/irqchip/irq-riscv-imsic-early.c:52:47: error: too many arguments to function call, expected 2, have 3
      52 |         riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                     ^~~~
   arch/riscv/include/asm/smp.h:52:6: note: 'riscv_ipi_set_virq_range' declared here
      52 | void riscv_ipi_set_virq_range(int virq, int nr);
         |      ^                        ~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +52 drivers/irqchip/irq-riscv-imsic-early.c

21a8f8a0eb35ce Anup Patel 2024-03-07  41  
21a8f8a0eb35ce Anup Patel 2024-03-07  42  static int __init imsic_ipi_domain_init(void)
21a8f8a0eb35ce Anup Patel 2024-03-07  43  {
21a8f8a0eb35ce Anup Patel 2024-03-07  44  	int virq;
21a8f8a0eb35ce Anup Patel 2024-03-07  45  
21a8f8a0eb35ce Anup Patel 2024-03-07  46  	/* Create IMSIC IPI multiplexing */
21a8f8a0eb35ce Anup Patel 2024-03-07  47  	virq = ipi_mux_create(IMSIC_NR_IPI, imsic_ipi_send);
21a8f8a0eb35ce Anup Patel 2024-03-07  48  	if (virq <= 0)
21a8f8a0eb35ce Anup Patel 2024-03-07  49  		return virq < 0 ? virq : -ENOMEM;
21a8f8a0eb35ce Anup Patel 2024-03-07  50  
21a8f8a0eb35ce Anup Patel 2024-03-07  51  	/* Set vIRQ range */
21a8f8a0eb35ce Anup Patel 2024-03-07 @52  	riscv_ipi_set_virq_range(virq, IMSIC_NR_IPI, true);
21a8f8a0eb35ce Anup Patel 2024-03-07  53  
21a8f8a0eb35ce Anup Patel 2024-03-07  54  	/* Announce that IMSIC is providing IPIs */
21a8f8a0eb35ce Anup Patel 2024-03-07  55  	pr_info("%pfwP: providing IPIs using interrupt %d\n", imsic->fwnode, IMSIC_IPI_ID);
21a8f8a0eb35ce Anup Patel 2024-03-07  56  
21a8f8a0eb35ce Anup Patel 2024-03-07  57  	return 0;
21a8f8a0eb35ce Anup Patel 2024-03-07  58  }
21a8f8a0eb35ce Anup Patel 2024-03-07  59  #else
21a8f8a0eb35ce Anup Patel 2024-03-07  60  static void imsic_ipi_starting_cpu(void) { }
21a8f8a0eb35ce Anup Patel 2024-03-07  61  static void imsic_ipi_dying_cpu(void) { }
21a8f8a0eb35ce Anup Patel 2024-03-07  62  static int __init imsic_ipi_domain_init(void) { return 0; }
21a8f8a0eb35ce Anup Patel 2024-03-07  63  #endif
21a8f8a0eb35ce Anup Patel 2024-03-07  64  

:::::: The code at line 52 was first introduced by commit
:::::: 21a8f8a0eb35ceb21e2c9ddd87468bc3b5ac87c0 irqchip: Add RISC-V incoming MSI controller early driver

:::::: TO: Anup Patel <apatel@ventanamicro.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
