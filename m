Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACE7191493;
	Mon, 11 Aug 2025 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754912294; cv=none; b=Mk55/iRg7mv8v2yGWeWWi+GvaZzESp76CCboumMRYowojVF+HuBdIZUqY+EGEYdPbiIVLHlAdxY2JXQy3Bies8Rm/G3+UuAUxcitxQP/dKwY9eqwmtSl63aoOD+iTbqbC66yuP7qh5lS/an2aaojt4zIF0KzypQj1JMfxSeXBHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754912294; c=relaxed/simple;
	bh=psMFDQFL9rjG0sfo8SIjNSegDEGVaPqyUFWznjFHNko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jp6JnbN2KRQSn9oy0luUd5PE/dZNDQkc84HMSyQoMZdAMn7kgWa5M9EN1e7uJS/I+EWwCG2yfa/LdtE2XIlXHKSk4IEVQ+PTluOh+Q27ny8zbif2rgz2LXzQJI6pwDinj5X++p8sORStW1LbgNSz2kn0P1pHAnxSaRb4Q1d9ZkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEe05Kxg; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEe05Kxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754912292; x=1786448292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=psMFDQFL9rjG0sfo8SIjNSegDEGVaPqyUFWznjFHNko=;
  b=FEe05Kxg5udwoI/iREh/buZhbZ6AaPI5EUK9R7gmgBUmta9nEcbRkqjm
   Au4RjGY0/tsFhL3rUIedJRIcT9+9CXCwJiv7a+vRYs1V9ZH3S6nCSxx5A
   7qOxbHa7FcWKd1FiiZho9mfkUi8uAbxaYq+YpHVxTeCEJrv4wT/s6YlpS
   H5j+EnIjpr9qsC0DpscnC3o1GZk4DV9eJC99AKigbAnl3x6hKC/Jq6WId
   GpyJkxGHIcm13Q/AcNK6VrUYYpmV698i2FGYjqIdPHLgdHS8Wz/zFIHUT
   A/fWZ4coHhA+8+Heriw6bp9oImte17bDXudq8zlBcZImh8jG+WUjAUhmn
   g==;
X-CSE-ConnectionGUID: xa6hlQAsRvqujSpVkEfBEg==
X-CSE-MsgGUID: UgSpluF9SxiO9pXCpo4INg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57083556"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="57083556"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 04:38:12 -0700
X-CSE-ConnectionGUID: xRqRVxk6R1iT+5wRDyrLow==
X-CSE-MsgGUID: wI8C2FxwR5mCWOuWGRkc4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="165384323"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 11 Aug 2025 04:38:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulQq5-0005p6-1v;
	Mon, 11 Aug 2025 11:37:38 +0000
Date: Mon, 11 Aug 2025 19:36:18 +0800
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <hchauhan@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>, Jesse Taube <jesse@rivosinc.com>
Subject: [avpatel:riscv_acpi_apei_v1 35/55]
 arch/riscv/kernel/hw_breakpoint.c:109:9: warning: variable 'rc' is
 uninitialized when used here
Message-ID: <202508111923.YBAEfI8R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_apei_v1
head:   eaca137f211dcb260f7eb52d983ddad7f27277f3
commit: df85c5a81bf62ede57ad6bdfa14482907dee11cf [35/55] riscv: Introduce support for hardware break/watchpoints
config: riscv-randconfig-002-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111923.YBAEfI8R-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111923.YBAEfI8R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111923.YBAEfI8R-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/hw_breakpoint.c:109:9: warning: variable 'rc' is uninitialized when used here [-Wuninitialized]
     109 |         return rc;
         |                ^~
   arch/riscv/kernel/hw_breakpoint.c:90:8: note: initialize the variable 'rc' to silence this warning
      90 |         int rc;
         |               ^
         |                = 0
   1 warning generated.


vim +/rc +109 arch/riscv/kernel/hw_breakpoint.c

    84	
    85	static int arch_smp_setup_sbi_shmem(unsigned int cpu)
    86	{
    87		union sbi_dbtr_shmem_entry *dbtr_shmem;
    88		unsigned long shmem_pa;
    89		struct sbiret ret;
    90		int rc;
    91	
    92		dbtr_shmem = per_cpu_ptr(&sbi_dbtr_shmem, cpu);
    93		if (!dbtr_shmem) {
    94			pr_err("Invalid per-cpu shared memory for debug triggers\n");
    95			return -ENODEV;
    96		}
    97	
    98		shmem_pa = virt_to_phys(dbtr_shmem);
    99	
   100		ret = sbi_ecall(SBI_EXT_DBTR, SBI_EXT_DBTR_SETUP_SHMEM,
   101				SBI_SHMEM_LO(shmem_pa), SBI_SHMEM_HI(shmem_pa), 0, 0, 0, 0);
   102		if (ret.error) {
   103			pr_warn("%s: failed to setup shared memory. error: %ld\n", __func__, ret.error);
   104			return sbi_err_map_linux_errno(ret.error);
   105		}
   106	
   107		pr_debug("CPU %d: HW Breakpoint shared memory registered.\n", cpu);
   108	
 > 109		return rc;
   110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
