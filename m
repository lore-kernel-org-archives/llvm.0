Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CB2282F0C;
	Thu,  8 Oct 2026 06:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791440550; cv=none; b=B4L9kd9jnurwQoICuM6peemsW6PAK1M81npLagt8C31AqvfAeWUdYAR4vuuAE7ZIVNrqnQqUM9DkQ/lhH5S9/IHUhRfFUgA9r+amqd00MiJn7oq+hjiOF8ppgPrTFU83MTFbDMMWn1y9aYF9tRrNzNEQasZl7GroiAh5Ct1n+ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791440550; c=relaxed/simple;
	bh=fgY7qN/jX3W2aO9QuJqIpQuePJTqp6pAjiV9WdeRb68=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sNktTqkXsDj1edv8AZjcWK0dygs5pdCCQIBbC9c3JCQQ1HKBx4wpH4kv08o0ZnaONmC+wPHNRPOm+ApT/zNBJpxxBvxUns2OsXCrUTXDSVgFeytCe4tvf/u8yrZZKkQShBvTJF7MzPI3jf+0mYFy+HGP+5EX3n5sGlqd7uETiYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c679qDKB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c679qDKB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791440548; x=1822976548;
  h=date:from:to:cc:subject:message-id;
  bh=fgY7qN/jX3W2aO9QuJqIpQuePJTqp6pAjiV9WdeRb68=;
  b=c679qDKBs/QyWWiNI5cYNrgdxB9V9wYadlpBW9rFf75QXVw5sFfwpW3C
   0eQD1tg+GcYNK4dI3H7XrwMugZmOBAP5i610l+6UrLlEdc+h0VXpr2rap
   0R4ZFKGPAFE31LXdVOE8ZRASC6zGjhx5ed0iaDzHImQ3Al4XVl+7q4nrB
   1uNVYuLN0EmZfbJrWKByIdIoonOzYNcVo5HxO8CK8/l8Dikla/FaX6W6S
   NLXhWs1ijMrdx58wQ8TmIe4/xtG7zYRLI7h1jm9pMVv8jOqF9056kOm90
   nK7b3UTvbFy0mieYQByr7dX6eHv62awChanM95vdYKEf9NmHfYadXGoAE
   g==;
X-CSE-ConnectionGUID: a3Vy6zBMT86J2pHESg/sHA==
X-CSE-MsgGUID: Ei4NauAKSpO9WQp+Dt0l5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="223046"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="223046"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 23:22:27 -0700
X-CSE-ConnectionGUID: vNadQmI5T7+9uApGfnI4Vg==
X-CSE-MsgGUID: tEYw3BUoSD6pqHKemVZ3Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="1764117"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 07 Oct 2026 23:22:26 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEhWJ-000000004vX-2dbl;
	Thu, 08 Oct 2026 06:22:23 +0000
Date: Thu, 08 Oct 2026 08:21:33 +0200
From: kernel test robot <lkp@intel.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Paul Walmsley <pjw@kernel.org>,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [pjw-riscv:temp-testing 22/25]
 arch/riscv/kernel/cpufeature.c:943:7: error: use of undeclared identifier
 '_pgtable_l4_enabled'; did you mean 'pgtable_l4_enabled'?
Message-ID: <202610080839.GUd6iQe9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pjw/riscv.git temp-testing
head:   f3f4d80eb6b19a2998ed935716e592955eab319f
commit: 016fdf4cebe05b68f13128f1eb12537b10a89d66 [22/25] riscv: support early isa ext and use it to optimize pgtable_l4|l5_enabled
config: riscv-randconfig-2000-20261008 (https://download.01.org/0day-ci/archive/20261008/202610080839.GUd6iQe9-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project dbeca9a3a3ba0b46471efb339b0ea8f2194f6f68)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080839.GUd6iQe9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080839.GUd6iQe9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/cpufeature.c:943:7: error: use of undeclared identifier '_pgtable_l4_enabled'; did you mean 'pgtable_l4_enabled'?
     943 |                 if (_pgtable_l4_enabled)
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     pgtable_l4_enabled
   arch/riscv/include/asm/pgtable-32.h:36:20: note: 'pgtable_l4_enabled' declared here
      36 | static inline bool pgtable_l4_enabled(void) { return false; }
         |                    ^
   arch/riscv/kernel/cpufeature.c:943:7: warning: address of function 'pgtable_l4_enabled' will always evaluate to 'true' [-Wpointer-bool-conversion]
     943 |                 if (_pgtable_l4_enabled)
         |                 ~~  ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:943:7: note: prefix with the address-of operator to silence this warning
     943 |                 if (_pgtable_l4_enabled)
         |                     ^
         |                     &
   arch/riscv/kernel/cpufeature.c:943:7: note: suffix with parentheses to turn this into a function call
     943 |                 if (_pgtable_l4_enabled)
         |                     ^                  
         |                                        ()
>> arch/riscv/kernel/cpufeature.c:945:7: error: use of undeclared identifier '_pgtable_l5_enabled'; did you mean 'pgtable_l5_enabled'?
     945 |                 if (_pgtable_l5_enabled)
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     pgtable_l5_enabled
   arch/riscv/include/asm/pgtable-32.h:37:20: note: 'pgtable_l5_enabled' declared here
      37 | static inline bool pgtable_l5_enabled(void) { return false; }
         |                    ^
   arch/riscv/kernel/cpufeature.c:945:7: warning: address of function 'pgtable_l5_enabled' will always evaluate to 'true' [-Wpointer-bool-conversion]
     945 |                 if (_pgtable_l5_enabled)
         |                 ~~  ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:945:7: note: prefix with the address-of operator to silence this warning
     945 |                 if (_pgtable_l5_enabled)
         |                     ^
         |                     &
   arch/riscv/kernel/cpufeature.c:945:7: note: suffix with parentheses to turn this into a function call
     945 |                 if (_pgtable_l5_enabled)
         |                     ^                  
         |                                        ()
   arch/riscv/kernel/cpufeature.c:1108:7: error: use of undeclared identifier '_pgtable_l4_enabled'; did you mean 'pgtable_l4_enabled'?
    1108 |                 if (_pgtable_l4_enabled)
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     pgtable_l4_enabled
   arch/riscv/include/asm/pgtable-32.h:36:20: note: 'pgtable_l4_enabled' declared here
      36 | static inline bool pgtable_l4_enabled(void) { return false; }
         |                    ^
   arch/riscv/kernel/cpufeature.c:1108:7: warning: address of function 'pgtable_l4_enabled' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1108 |                 if (_pgtable_l4_enabled)
         |                 ~~  ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:1108:7: note: prefix with the address-of operator to silence this warning
    1108 |                 if (_pgtable_l4_enabled)
         |                     ^
         |                     &
   arch/riscv/kernel/cpufeature.c:1108:7: note: suffix with parentheses to turn this into a function call
    1108 |                 if (_pgtable_l4_enabled)
         |                     ^                  
         |                                        ()
   arch/riscv/kernel/cpufeature.c:1110:7: error: use of undeclared identifier '_pgtable_l5_enabled'; did you mean 'pgtable_l5_enabled'?
    1110 |                 if (_pgtable_l5_enabled)
         |                     ^~~~~~~~~~~~~~~~~~~
         |                     pgtable_l5_enabled
   arch/riscv/include/asm/pgtable-32.h:37:20: note: 'pgtable_l5_enabled' declared here
      37 | static inline bool pgtable_l5_enabled(void) { return false; }
         |                    ^
   arch/riscv/kernel/cpufeature.c:1110:7: warning: address of function 'pgtable_l5_enabled' will always evaluate to 'true' [-Wpointer-bool-conversion]
    1110 |                 if (_pgtable_l5_enabled)
         |                 ~~  ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/cpufeature.c:1110:7: note: prefix with the address-of operator to silence this warning
    1110 |                 if (_pgtable_l5_enabled)
         |                     ^
         |                     &
   arch/riscv/kernel/cpufeature.c:1110:7: note: suffix with parentheses to turn this into a function call
    1110 |                 if (_pgtable_l5_enabled)
         |                     ^                  
         |                                        ()
   4 warnings and 4 errors generated.


vim +943 arch/riscv/kernel/cpufeature.c

   882	
   883	static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
   884	{
   885		struct device_node *node;
   886		const char *isa;
   887		int rc;
   888		struct acpi_table_header *rhct;
   889		acpi_status status;
   890		unsigned int cpu;
   891		u64 boot_vendorid;
   892		u64 boot_archid;
   893	
   894		if (!acpi_disabled) {
   895			status = acpi_get_table(ACPI_SIG_RHCT, 0, &rhct);
   896			if (ACPI_FAILURE(status))
   897				return;
   898		}
   899	
   900		boot_vendorid = riscv_get_mvendorid();
   901		boot_archid = riscv_get_marchid();
   902	
   903		for_each_possible_cpu(cpu) {
   904			struct riscv_isainfo *isainfo = &hart_isa[cpu];
   905			unsigned long this_hwcap = 0;
   906			DECLARE_BITMAP(source_isa, RISCV_ISA_EXT_MAX) = { 0 };
   907	
   908			if (acpi_disabled) {
   909				node = of_cpu_device_node_get(cpu);
   910				if (!node) {
   911					pr_warn("Unable to find cpu node\n");
   912					continue;
   913				}
   914	
   915				rc = of_property_read_string(node, "riscv,isa", &isa);
   916				of_node_put(node);
   917				if (rc) {
   918					pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
   919					continue;
   920				}
   921			} else {
   922				rc = acpi_get_riscv_isa(rhct, cpu, &isa);
   923				if (rc < 0) {
   924					pr_warn("Unable to get ISA for the hart - %d\n", cpu);
   925					continue;
   926				}
   927			}
   928	
   929			riscv_parse_isa_string(isa, source_isa);
   930	
   931			/*
   932			 * These ones were as they were part of the base ISA when the
   933			 * port & dt-bindings were upstreamed, and so can be set
   934			 * unconditionally where `i` is in riscv,isa on DT systems.
   935			 */
   936			if (acpi_disabled) {
   937				set_bit(RISCV_ISA_EXT_ZICSR, source_isa);
   938				set_bit(RISCV_ISA_EXT_ZIFENCEI, source_isa);
   939				set_bit(RISCV_ISA_EXT_ZICNTR, source_isa);
   940				set_bit(RISCV_ISA_EXT_ZIHPM, source_isa);
   941			}
   942	
 > 943			if (_pgtable_l4_enabled)
   944				set_bit(RISCV_ISA_EXT_SV48, source_isa);
 > 945			if (_pgtable_l5_enabled)
   946				set_bit(RISCV_ISA_EXT_SV57, source_isa);
   947	
   948			/*
   949			 * "V" in ISA strings is ambiguous in practice: it should mean
   950			 * just the standard V-1.0 but vendors aren't well behaved.
   951			 * Many vendors with T-Head CPU cores which implement the 0.7.1
   952			 * version of the vector specification put "v" into their DTs.
   953			 * CPU cores with the ratified spec will contain non-zero
   954			 * marchid.
   955			 */
   956			if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0)
   957				clear_bit(RISCV_ISA_EXT_V, source_isa);
   958	
   959			riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
   960	
   961			/*
   962			 * All "okay" hart should have same isa. Set HWCAP based on
   963			 * common capabilities of every "okay" hart, in case they don't
   964			 * have.
   965			 */
   966			if (elf_hwcap)
   967				elf_hwcap &= this_hwcap;
   968			else
   969				elf_hwcap = this_hwcap;
   970	
   971			if (bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX))
   972				bitmap_copy(riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
   973			else
   974				bitmap_and(riscv_isa, riscv_isa, isainfo->isa, RISCV_ISA_EXT_MAX);
   975		}
   976	
   977		if (!acpi_disabled && rhct)
   978			acpi_put_table((struct acpi_table_header *)rhct);
   979	}
   980	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
