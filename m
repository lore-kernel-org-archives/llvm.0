Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213713;
	b=iy+Xf15/rKwRLWcDhPvV8sRIj4I2fZgOCcDvlTAQ4tsp7OV2SFy4oE2BeTAH5RkgG7lI
	 OAl6TTr5kkTAdILoWzkaF1WGGdtCUjPfv9fl5pKPb1WoahTTCCZS0YwsqJISU6+zOvtvg
	 NnnqrZGCii7rulWqltYMprz0ZdAa0LpFO2o7xtT0RjRmHHfCYYSg710Du5wSlPuG57sZq
	 p7p2CMDBbjdA2MOuv/1PqGhAm5/A9buQsfpDW5zBURwaMUJfyEgkDH3Nx2qkh+7elAGr5
	 QqqzKRIkXHojtY2jKTB1SJH/xrmkZkpqtD4E4y3S00iWReUxpI+iC5sDMhF1Dl119/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213713;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aX3llIV3J8lOlZmG67f6xJKVxd09rqcRX1N9MDGR+78=;
	b=rWpD8hkalRIsrWytQ7UQBNeOlFw4Wbom153S4iSn8/ufOytqBNaq5ii94BGpAPI30T16
	 0oRWpLMCMklRDULkRE+RIoEWAyDzBMinZJI8QUtSyGLEYKfBFZtr98jlz91EOxAg8bxeF
	 7b6x8rL3e/aDICZ/lJt3hS0BHFG0YHaBvWJuwjeMfjUO+QiCiycxKirSzhzZLmLpJkzEF
	 1GmadwtsvvU++hSVZa0JZz0r4tyLy3SV1+VRYJ5HUIuGif3sS2Z4Kaje6oQWlYGzmSmjg
	 fdOQ7uMsS17RV18GAZDWIQnxSd49ptRlxpxB+Bc22mTaSfQQf2FPPeZWpRE8EvDG5Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hBrmdBTm;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D50B606A323;
	Mon,  9 Nov 2026 08:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D50B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hBrmdBTm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794213710; x=1825749710;
  h=date:from:to:cc:subject:message-id;
  bh=XHBU96FJTppjSojGLS+K5UbaYaYd35Eb8QY++KuuHr4=;
  b=hBrmdBTml6gGYyipULnCAKDmRKqYqXVaIWcyzLG53KMryjOMMBiAxYc4
   zRdVqSzXJcNa7LAz2pIar1vMuOP9lKev8pipDQjlRv8twXKEy35FCMP87
   mX7nN85s5FcWANWuXTxi/FmIyea+KeyfJ/v4sL5GcWuLyPtdrrJOZNhOY
   6/nZIvP3XRcpegpI2wP4q313uqmRpAb/+4HJsmOdi7Fi1g3JDBBk9440I
   2uqZI6VkkiUJMj03T+XP3inHhVQtvUR2/BzdhOFhqnecJ+d22q4dfLN/6
   UngKXcQ7NvcXuyPX3mW4bgM3QIwFmCrdhY765UjyL2hAHAXpN3/FY0ege
   Q==;
X-CSE-ConnectionGUID: EJ1wwfWVSPuAzNwl3qEbZA==
X-CSE-MsgGUID: VxSXGjQ6QWaAB1cNHa/2/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2820535"
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="2820535"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 00:41:50 -0800
X-CSE-ConnectionGUID: yZWfa+iqTPmV1ZDGxoz+5Q==
X-CSE-MsgGUID: UcR830beRD225HqkePOaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,203,1787036400"; 
   d="scan'208";a="7858577"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 Nov 2026 00:41:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQKwj-00000000uBN-3YCo;
	Mon, 09 Nov 2026 08:41:45 +0000
Date: Mon, 09 Nov 2026 16:41:22 +0800
From: kernel test robot <lkp@intel.com>
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Anup Patel <anup@brainfault.org>,
 Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [avpatel:riscv_sbi_watchdog_v1 94/98]
 arch/riscv/mm/tlbflush.c:76:3: error: call to undeclared function
 'sbi_remote_sfence_vma_asid'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202611091628.SenLNJ0s-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v1
head:   929bf13433e242a3f255f463b2fb44633e102e0d
commit: b4cc5b9ca0cada8221e31b647640bbae515000a1 [94/98] riscv: pmu: Add driver for Control Transfer Records Ext
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20261109/202611091628.SenLNJ0s-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project fc9576e3b179738d99c5babe5cd9d6c1f883e0db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091628.SenLNJ0s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091628.SenLNJ0s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/mm/tlbflush.c:76:3: error: call to undeclared function 'sbi_remote_sfence_vma_asid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      76 |                 sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
         |                 ^
   arch/riscv/mm/tlbflush.c:76:3: note: did you mean 'sbi_remote_fence_i'?
   arch/riscv/include/asm/sbi.h:850:19: note: 'sbi_remote_fence_i' declared here
     850 | static inline int sbi_remote_fence_i(const struct cpumask *cpu_mask) { return -1; }
         |                   ^
   arch/riscv/mm/tlbflush.c:112:3: error: call to undeclared function 'sbi_remote_sfence_vma_asid'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     112 |                 sbi_remote_sfence_vma_asid(cmask, start, size, asid);
         |                 ^
   2 errors generated.
--
>> arch/riscv/errata/andes/errata.c:30:16: error: variable has incomplete type 'struct sbiret'
      30 |         struct sbiret ret;
         |                       ^
   arch/riscv/errata/andes/errata.c:30:9: note: forward declaration of 'struct sbiret'
      30 |         struct sbiret ret;
         |                ^
>> arch/riscv/errata/andes/errata.c:36:8: error: call to undeclared function 'sbi_ecall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      36 |         ret = sbi_ecall(ANDES_SBI_EXT_ANDES, ANDES_SBI_EXT_IOCP_SW_WORKAROUND,
         |               ^
   2 errors generated.
--
>> drivers/acpi/riscv/cpuidle.c:73:14: error: use of undeclared identifier 'SBI_HSM_SUSP_NON_RET_BIT'
      73 |         if (state & SBI_HSM_SUSP_NON_RET_BIT)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/acpi/riscv/cppc.c:31:16: error: field has incomplete type 'struct sbiret'
      31 |         struct sbiret ret;
         |                       ^
   drivers/acpi/riscv/cppc.c:31:9: note: forward declaration of 'struct sbiret'
      31 |         struct sbiret ret;
         |                ^
>> drivers/acpi/riscv/cppc.c:38:6: error: use of undeclared identifier 'sbi_spec_version'
      38 |         if (sbi_spec_version >= sbi_mk_version(2, 0) &&
         |             ^~~~~~~~~~~~~~~~
>> drivers/acpi/riscv/cppc.c:38:26: error: call to undeclared function 'sbi_mk_version'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      38 |         if (sbi_spec_version >= sbi_mk_version(2, 0) &&
         |                                 ^
>> drivers/acpi/riscv/cppc.c:39:6: error: call to undeclared function 'sbi_probe_extension'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      39 |             sbi_probe_extension(SBI_EXT_CPPC) > 0) {
         |             ^
>> drivers/acpi/riscv/cppc.c:53:14: error: call to undeclared function 'sbi_ecall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      53 |         data->ret = sbi_ecall(SBI_EXT_CPPC, SBI_CPPC_READ,
         |                     ^
   drivers/acpi/riscv/cppc.c:61:14: error: call to undeclared function 'sbi_ecall'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      61 |         data->ret = sbi_ecall(SBI_EXT_CPPC, SBI_CPPC_WRITE,
         |                     ^
>> drivers/acpi/riscv/cppc.c:110:11: error: call to undeclared function 'sbi_err_map_linux_errno'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     110 |                         return sbi_err_map_linux_errno(data.ret.error);
         |                                ^
   drivers/acpi/riscv/cppc.c:151:29: error: call to undeclared function 'sbi_err_map_linux_errno'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     151 |                 return (data.ret.error) ? sbi_err_map_linux_errno(data.ret.error) : 0;
         |                                           ^
   8 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ERRATA_ANDES
   Depends on [n]: RISCV_SBI [=n]
   Selected by [y]:
   - ARCH_ANDES [=y] && MMU [=y]
   WARNING: unmet direct dependencies detected for HAVE_MIXED_BREAKPOINTS_REGS
   Depends on [n]: HAVE_HW_BREAKPOINT [=n]
   Selected by [y]:
   - RISCV [=y] && PERF_EVENTS [=y]


vim +/sbi_remote_sfence_vma_asid +76 arch/riscv/mm/tlbflush.c

18d2199d81054f Anup Patel        2023-03-28  70  
95594cb40c6e01 Christoph Hellwig 2019-08-21  71  void flush_tlb_all(void)
95594cb40c6e01 Christoph Hellwig 2019-08-21  72  {
9546f00410ed88 Samuel Holland    2024-03-26  73  	if (num_online_cpus() < 2)
9546f00410ed88 Samuel Holland    2024-03-26  74  		local_flush_tlb_all();
9546f00410ed88 Samuel Holland    2024-03-26  75  	else if (riscv_use_sbi_for_rfence())
9d4e8d5fa7dbbb Alexandre Ghiti   2023-10-30 @76  		sbi_remote_sfence_vma_asid(NULL, 0, FLUSH_TLB_MAX_SIZE, FLUSH_TLB_NO_ASID);
dc892fb443224d Samuel Holland    2024-03-26  77  	else
dc892fb443224d Samuel Holland    2024-03-26  78  		on_each_cpu(__ipi_flush_tlb_all, NULL, 1);
95594cb40c6e01 Christoph Hellwig 2019-08-21  79  }
95594cb40c6e01 Christoph Hellwig 2019-08-21  80  

:::::: The code at line 76 was first introduced by commit
:::::: 9d4e8d5fa7dbbb606b355f40d918a1feef821bc5 riscv: Make __flush_tlb_range() loop over pte instead of flushing the whole tlb

:::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
