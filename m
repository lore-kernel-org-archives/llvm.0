Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE1D3C04;
	Mon, 10 Apr 2023 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681143942; x=1712679942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CLUSLOiKRUyK7SliPOK1ZQCExtCTl3hNHzZFJFAc+sM=;
  b=E4ojqqMeBQx8Y8AGptTz26fBEzqUlMDATR09orIxBci8MRVdQk/Lb3K9
   zNRsY1V+Yy6Dar2tTq5JvLmvBRBlrFX9ynfbFLpRuGHqcredn7hRhYyRn
   mrPxNaSVClbwQFcsCRGT+kJRvleOXEga4RG7mLddnugsHu/3qSpuS4Z/y
   e2kYKLGvDmteLDGFmO62IwOP/HpBtRYPyGtUUzciNE5shlPS1PjezvbWs
   jWDNyHqAqQ/1+33h9o3w67pdsFRt61vWwutx7Wl8ZfUWDZBGcxRqbLWEj
   Cp0mcsUxVzcvbWvGXKnjzRJvRdSkY3zGyuuNQex8Osj5vJTr0ayVK3waa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="371231626"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="371231626"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 09:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="757499559"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="757499559"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Apr 2023 09:25:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pluKf-000VUP-0n;
	Mon, 10 Apr 2023 16:25:29 +0000
Date: Tue, 11 Apr 2023 00:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: Reiji Watanabe <reijiw@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Subject: [linux-stable-rc:queue/5.15 1/61] arch/arm64/kvm/sys_regs.c:1671:36:
 error: incompatible function pointer types initializing 'int (*)(struct
 kvm_vcpu *, const struct sys_reg_desc *, const struct kvm_one_reg *, void
 *)' with an expression of type 'int (struct kvm_vcpu *, const struct
 sys_r...
Message-ID: <202304110046.3R0IWBQE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.15
head:   187b7748d2b4b086b06615133295ec4dfb800c24
commit: 41f020b4f0d60868fe94c2a8acf4a662a6654f44 [1/61] KVM: arm64: PMU: Fix GET_ONE_REG for vPMC regs to return the current value
config: arm64-randconfig-r031-20230409 (https://download.01.org/0day-ci/archive/20230411/202304110046.3R0IWBQE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=41f020b4f0d60868fe94c2a8acf4a662a6654f44
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.15
        git checkout 41f020b4f0d60868fe94c2a8acf4a662a6654f44
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110046.3R0IWBQE-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/sys_regs.c:1649:13: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
             .reset = reset_pmcr, .reg = PMCR_EL0 },
                      ^~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1648:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMCR_EL0), .access = access_pmcr,
             ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1662:39: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
             .access = access_pmswinc, .reset = NULL },
                                                ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1660:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMSWINC_EL0),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1664:38: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
             .access = access_pmselr, .reset = reset_pmselr, .reg = PMSELR_EL0 },
                                               ^~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1663:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMSELR_EL0),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1666:38: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
             .access = access_pmceid, .reset = NULL },
                                               ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1665:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMCEID0_EL0),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1668:38: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
             .access = access_pmceid, .reset = NULL },
                                               ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1667:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMCEID1_EL0),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1670:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
             .access = access_pmu_evcntr, .reset = reset_unknown,
                                                   ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1669:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMCCNTR_EL0),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
>> arch/arm64/kvm/sys_regs.c:1671:36: error: incompatible function pointer types initializing 'int (*)(struct kvm_vcpu *, const struct sys_reg_desc *, const struct kvm_one_reg *, void *)' with an expression of type 'int (struct kvm_vcpu *, const struct sys_reg_desc *, u64 *)' (aka 'int (struct kvm_vcpu *, const struct sys_reg_desc *, unsigned long long *)') [-Wincompatible-function-pointer-types]
             .reg = PMCCNTR_EL0, .get_user = get_pmu_evcntr},
                                             ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1673:43: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
             .access = access_pmu_evtyper, .reset = NULL },
                                                    ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1672:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMXEVTYPER_EL0),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1675:42: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
             .access = access_pmu_evcntr, .reset = NULL },
                                                   ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1674:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMXEVCNTR_EL0),
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1681:13: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
             .reset = reset_val, .reg = PMUSERENR_EL0, .val = 0 },
                      ^~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1680:4: note: previous initialization is here
           { PMU_SYS_REG(SYS_PMUSERENR_EL0), .access = access_pmuserenr,
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1768:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PMU_PMEVCNTR_EL0(0),
           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:999:13: note: expanded from macro 'PMU_PMEVCNTR_EL0'
             .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,          \
                      ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1768:2: note: previous initialization is here
           PMU_PMEVCNTR_EL0(0),
           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:998:4: note: expanded from macro 'PMU_PMEVCNTR_EL0'
           { PMU_SYS_REG(SYS_PMEVCNTRn_EL0(n)),                            \
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1768:2: error: incompatible function pointer types initializing 'int (*)(struct kvm_vcpu *, const struct sys_reg_desc *, const struct kvm_one_reg *, void *)' with an expression of type 'int (struct kvm_vcpu *, const struct sys_reg_desc *, u64 *)' (aka 'int (struct kvm_vcpu *, const struct sys_reg_desc *, unsigned long long *)') [-Wincompatible-function-pointer-types]
           PMU_PMEVCNTR_EL0(0),
           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:999:41: note: expanded from macro 'PMU_PMEVCNTR_EL0'
             .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,          \
                                                  ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1769:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PMU_PMEVCNTR_EL0(1),
           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:999:13: note: expanded from macro 'PMU_PMEVCNTR_EL0'
             .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,          \
                      ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1769:2: note: previous initialization is here
           PMU_PMEVCNTR_EL0(1),
           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:998:4: note: expanded from macro 'PMU_PMEVCNTR_EL0'
           { PMU_SYS_REG(SYS_PMEVCNTRn_EL0(n)),                            \
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1769:2: error: incompatible function pointer types initializing 'int (*)(struct kvm_vcpu *, const struct sys_reg_desc *, const struct kvm_one_reg *, void *)' with an expression of type 'int (struct kvm_vcpu *, const struct sys_reg_desc *, u64 *)' (aka 'int (struct kvm_vcpu *, const struct sys_reg_desc *, unsigned long long *)') [-Wincompatible-function-pointer-types]
           PMU_PMEVCNTR_EL0(1),
           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:999:41: note: expanded from macro 'PMU_PMEVCNTR_EL0'
             .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,          \
                                                  ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1770:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PMU_PMEVCNTR_EL0(2),
           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:999:13: note: expanded from macro 'PMU_PMEVCNTR_EL0'
             .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,          \
                      ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1770:2: note: previous initialization is here
           PMU_PMEVCNTR_EL0(2),
           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:998:4: note: expanded from macro 'PMU_PMEVCNTR_EL0'
           { PMU_SYS_REG(SYS_PMEVCNTRn_EL0(n)),                            \
             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:994:24: note: expanded from macro 'PMU_SYS_REG'
           SYS_DESC(r), .reset = reset_pmu_reg, .visibility = pmu_visibility
                                 ^~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1770:2: error: incompatible function pointer types initializing 'int (*)(struct kvm_vcpu *, const struct sys_reg_desc *, const struct kvm_one_reg *, void *)' with an expression of type 'int (struct kvm_vcpu *, const struct sys_reg_desc *, u64 *)' (aka 'int (struct kvm_vcpu *, const struct sys_reg_desc *, unsigned long long *)') [-Wincompatible-function-pointer-types]
           PMU_PMEVCNTR_EL0(2),
           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:999:41: note: expanded from macro 'PMU_PMEVCNTR_EL0'
             .reset = reset_pmevcntr, .get_user = get_pmu_evcntr,          \
                                                  ^~~~~~~~~~~~~~
   arch/arm64/kvm/sys_regs.c:1771:2: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
           PMU_PMEVCNTR_EL0(3),


vim +1671 arch/arm64/kvm/sys_regs.c

  1422	
  1423	/*
  1424	 * Architected system registers.
  1425	 * Important: Must be sorted ascending by Op0, Op1, CRn, CRm, Op2
  1426	 *
  1427	 * Debug handling: We do trap most, if not all debug related system
  1428	 * registers. The implementation is good enough to ensure that a guest
  1429	 * can use these with minimal performance degradation. The drawback is
  1430	 * that we don't implement any of the external debug, none of the
  1431	 * OSlock protocol. This should be revisited if we ever encounter a
  1432	 * more demanding guest...
  1433	 */
  1434	static const struct sys_reg_desc sys_reg_descs[] = {
  1435		{ SYS_DESC(SYS_DC_ISW), access_dcsw },
  1436		{ SYS_DESC(SYS_DC_CSW), access_dcsw },
  1437		{ SYS_DESC(SYS_DC_CISW), access_dcsw },
  1438	
  1439		DBG_BCR_BVR_WCR_WVR_EL1(0),
  1440		DBG_BCR_BVR_WCR_WVR_EL1(1),
  1441		{ SYS_DESC(SYS_MDCCINT_EL1), trap_debug_regs, reset_val, MDCCINT_EL1, 0 },
  1442		{ SYS_DESC(SYS_MDSCR_EL1), trap_debug_regs, reset_val, MDSCR_EL1, 0 },
  1443		DBG_BCR_BVR_WCR_WVR_EL1(2),
  1444		DBG_BCR_BVR_WCR_WVR_EL1(3),
  1445		DBG_BCR_BVR_WCR_WVR_EL1(4),
  1446		DBG_BCR_BVR_WCR_WVR_EL1(5),
  1447		DBG_BCR_BVR_WCR_WVR_EL1(6),
  1448		DBG_BCR_BVR_WCR_WVR_EL1(7),
  1449		DBG_BCR_BVR_WCR_WVR_EL1(8),
  1450		DBG_BCR_BVR_WCR_WVR_EL1(9),
  1451		DBG_BCR_BVR_WCR_WVR_EL1(10),
  1452		DBG_BCR_BVR_WCR_WVR_EL1(11),
  1453		DBG_BCR_BVR_WCR_WVR_EL1(12),
  1454		DBG_BCR_BVR_WCR_WVR_EL1(13),
  1455		DBG_BCR_BVR_WCR_WVR_EL1(14),
  1456		DBG_BCR_BVR_WCR_WVR_EL1(15),
  1457	
  1458		{ SYS_DESC(SYS_MDRAR_EL1), trap_raz_wi },
  1459		{ SYS_DESC(SYS_OSLAR_EL1), trap_raz_wi },
  1460		{ SYS_DESC(SYS_OSLSR_EL1), trap_oslsr_el1 },
  1461		{ SYS_DESC(SYS_OSDLR_EL1), trap_raz_wi },
  1462		{ SYS_DESC(SYS_DBGPRCR_EL1), trap_raz_wi },
  1463		{ SYS_DESC(SYS_DBGCLAIMSET_EL1), trap_raz_wi },
  1464		{ SYS_DESC(SYS_DBGCLAIMCLR_EL1), trap_raz_wi },
  1465		{ SYS_DESC(SYS_DBGAUTHSTATUS_EL1), trap_dbgauthstatus_el1 },
  1466	
  1467		{ SYS_DESC(SYS_MDCCSR_EL0), trap_raz_wi },
  1468		{ SYS_DESC(SYS_DBGDTR_EL0), trap_raz_wi },
  1469		// DBGDTR[TR]X_EL0 share the same encoding
  1470		{ SYS_DESC(SYS_DBGDTRTX_EL0), trap_raz_wi },
  1471	
  1472		{ SYS_DESC(SYS_DBGVCR32_EL2), NULL, reset_val, DBGVCR32_EL2, 0 },
  1473	
  1474		{ SYS_DESC(SYS_MPIDR_EL1), NULL, reset_mpidr, MPIDR_EL1 },
  1475	
  1476		/*
  1477		 * ID regs: all ID_SANITISED() entries here must have corresponding
  1478		 * entries in arm64_ftr_regs[].
  1479		 */
  1480	
  1481		/* AArch64 mappings of the AArch32 ID registers */
  1482		/* CRm=1 */
  1483		ID_SANITISED(ID_PFR0_EL1),
  1484		ID_SANITISED(ID_PFR1_EL1),
  1485		ID_SANITISED(ID_DFR0_EL1),
  1486		ID_HIDDEN(ID_AFR0_EL1),
  1487		ID_SANITISED(ID_MMFR0_EL1),
  1488		ID_SANITISED(ID_MMFR1_EL1),
  1489		ID_SANITISED(ID_MMFR2_EL1),
  1490		ID_SANITISED(ID_MMFR3_EL1),
  1491	
  1492		/* CRm=2 */
  1493		ID_SANITISED(ID_ISAR0_EL1),
  1494		ID_SANITISED(ID_ISAR1_EL1),
  1495		ID_SANITISED(ID_ISAR2_EL1),
  1496		ID_SANITISED(ID_ISAR3_EL1),
  1497		ID_SANITISED(ID_ISAR4_EL1),
  1498		ID_SANITISED(ID_ISAR5_EL1),
  1499		ID_SANITISED(ID_MMFR4_EL1),
  1500		ID_SANITISED(ID_ISAR6_EL1),
  1501	
  1502		/* CRm=3 */
  1503		ID_SANITISED(MVFR0_EL1),
  1504		ID_SANITISED(MVFR1_EL1),
  1505		ID_SANITISED(MVFR2_EL1),
  1506		ID_UNALLOCATED(3,3),
  1507		ID_SANITISED(ID_PFR2_EL1),
  1508		ID_HIDDEN(ID_DFR1_EL1),
  1509		ID_SANITISED(ID_MMFR5_EL1),
  1510		ID_UNALLOCATED(3,7),
  1511	
  1512		/* AArch64 ID registers */
  1513		/* CRm=4 */
  1514		{ SYS_DESC(SYS_ID_AA64PFR0_EL1), .access = access_id_reg,
  1515		  .get_user = get_id_reg, .set_user = set_id_aa64pfr0_el1, },
  1516		ID_SANITISED(ID_AA64PFR1_EL1),
  1517		ID_UNALLOCATED(4,2),
  1518		ID_UNALLOCATED(4,3),
  1519		ID_SANITISED(ID_AA64ZFR0_EL1),
  1520		ID_UNALLOCATED(4,5),
  1521		ID_UNALLOCATED(4,6),
  1522		ID_UNALLOCATED(4,7),
  1523	
  1524		/* CRm=5 */
  1525		ID_SANITISED(ID_AA64DFR0_EL1),
  1526		ID_SANITISED(ID_AA64DFR1_EL1),
  1527		ID_UNALLOCATED(5,2),
  1528		ID_UNALLOCATED(5,3),
  1529		ID_HIDDEN(ID_AA64AFR0_EL1),
  1530		ID_HIDDEN(ID_AA64AFR1_EL1),
  1531		ID_UNALLOCATED(5,6),
  1532		ID_UNALLOCATED(5,7),
  1533	
  1534		/* CRm=6 */
  1535		ID_SANITISED(ID_AA64ISAR0_EL1),
  1536		ID_SANITISED(ID_AA64ISAR1_EL1),
  1537		ID_SANITISED(ID_AA64ISAR2_EL1),
  1538		ID_UNALLOCATED(6,3),
  1539		ID_UNALLOCATED(6,4),
  1540		ID_UNALLOCATED(6,5),
  1541		ID_UNALLOCATED(6,6),
  1542		ID_UNALLOCATED(6,7),
  1543	
  1544		/* CRm=7 */
  1545		ID_SANITISED(ID_AA64MMFR0_EL1),
  1546		ID_SANITISED(ID_AA64MMFR1_EL1),
  1547		ID_SANITISED(ID_AA64MMFR2_EL1),
  1548		ID_UNALLOCATED(7,3),
  1549		ID_UNALLOCATED(7,4),
  1550		ID_UNALLOCATED(7,5),
  1551		ID_UNALLOCATED(7,6),
  1552		ID_UNALLOCATED(7,7),
  1553	
  1554		{ SYS_DESC(SYS_SCTLR_EL1), access_vm_reg, reset_val, SCTLR_EL1, 0x00C50078 },
  1555		{ SYS_DESC(SYS_ACTLR_EL1), access_actlr, reset_actlr, ACTLR_EL1 },
  1556		{ SYS_DESC(SYS_CPACR_EL1), NULL, reset_val, CPACR_EL1, 0 },
  1557	
  1558		MTE_REG(RGSR_EL1),
  1559		MTE_REG(GCR_EL1),
  1560	
  1561		{ SYS_DESC(SYS_ZCR_EL1), NULL, reset_val, ZCR_EL1, 0, .visibility = sve_visibility },
  1562		{ SYS_DESC(SYS_TRFCR_EL1), undef_access },
  1563		{ SYS_DESC(SYS_TTBR0_EL1), access_vm_reg, reset_unknown, TTBR0_EL1 },
  1564		{ SYS_DESC(SYS_TTBR1_EL1), access_vm_reg, reset_unknown, TTBR1_EL1 },
  1565		{ SYS_DESC(SYS_TCR_EL1), access_vm_reg, reset_val, TCR_EL1, 0 },
  1566	
  1567		PTRAUTH_KEY(APIA),
  1568		PTRAUTH_KEY(APIB),
  1569		PTRAUTH_KEY(APDA),
  1570		PTRAUTH_KEY(APDB),
  1571		PTRAUTH_KEY(APGA),
  1572	
  1573		{ SYS_DESC(SYS_AFSR0_EL1), access_vm_reg, reset_unknown, AFSR0_EL1 },
  1574		{ SYS_DESC(SYS_AFSR1_EL1), access_vm_reg, reset_unknown, AFSR1_EL1 },
  1575		{ SYS_DESC(SYS_ESR_EL1), access_vm_reg, reset_unknown, ESR_EL1 },
  1576	
  1577		{ SYS_DESC(SYS_ERRIDR_EL1), trap_raz_wi },
  1578		{ SYS_DESC(SYS_ERRSELR_EL1), trap_raz_wi },
  1579		{ SYS_DESC(SYS_ERXFR_EL1), trap_raz_wi },
  1580		{ SYS_DESC(SYS_ERXCTLR_EL1), trap_raz_wi },
  1581		{ SYS_DESC(SYS_ERXSTATUS_EL1), trap_raz_wi },
  1582		{ SYS_DESC(SYS_ERXADDR_EL1), trap_raz_wi },
  1583		{ SYS_DESC(SYS_ERXMISC0_EL1), trap_raz_wi },
  1584		{ SYS_DESC(SYS_ERXMISC1_EL1), trap_raz_wi },
  1585	
  1586		MTE_REG(TFSR_EL1),
  1587		MTE_REG(TFSRE0_EL1),
  1588	
  1589		{ SYS_DESC(SYS_FAR_EL1), access_vm_reg, reset_unknown, FAR_EL1 },
  1590		{ SYS_DESC(SYS_PAR_EL1), NULL, reset_unknown, PAR_EL1 },
  1591	
  1592		{ SYS_DESC(SYS_PMSCR_EL1), undef_access },
  1593		{ SYS_DESC(SYS_PMSNEVFR_EL1), undef_access },
  1594		{ SYS_DESC(SYS_PMSICR_EL1), undef_access },
  1595		{ SYS_DESC(SYS_PMSIRR_EL1), undef_access },
  1596		{ SYS_DESC(SYS_PMSFCR_EL1), undef_access },
  1597		{ SYS_DESC(SYS_PMSEVFR_EL1), undef_access },
  1598		{ SYS_DESC(SYS_PMSLATFR_EL1), undef_access },
  1599		{ SYS_DESC(SYS_PMSIDR_EL1), undef_access },
  1600		{ SYS_DESC(SYS_PMBLIMITR_EL1), undef_access },
  1601		{ SYS_DESC(SYS_PMBPTR_EL1), undef_access },
  1602		{ SYS_DESC(SYS_PMBSR_EL1), undef_access },
  1603		/* PMBIDR_EL1 is not trapped */
  1604	
  1605		{ PMU_SYS_REG(SYS_PMINTENSET_EL1),
  1606		  .access = access_pminten, .reg = PMINTENSET_EL1 },
  1607		{ PMU_SYS_REG(SYS_PMINTENCLR_EL1),
  1608		  .access = access_pminten, .reg = PMINTENSET_EL1 },
  1609		{ SYS_DESC(SYS_PMMIR_EL1), trap_raz_wi },
  1610	
  1611		{ SYS_DESC(SYS_MAIR_EL1), access_vm_reg, reset_unknown, MAIR_EL1 },
  1612		{ SYS_DESC(SYS_AMAIR_EL1), access_vm_reg, reset_amair_el1, AMAIR_EL1 },
  1613	
  1614		{ SYS_DESC(SYS_LORSA_EL1), trap_loregion },
  1615		{ SYS_DESC(SYS_LOREA_EL1), trap_loregion },
  1616		{ SYS_DESC(SYS_LORN_EL1), trap_loregion },
  1617		{ SYS_DESC(SYS_LORC_EL1), trap_loregion },
  1618		{ SYS_DESC(SYS_LORID_EL1), trap_loregion },
  1619	
  1620		{ SYS_DESC(SYS_VBAR_EL1), NULL, reset_val, VBAR_EL1, 0 },
  1621		{ SYS_DESC(SYS_DISR_EL1), NULL, reset_val, DISR_EL1, 0 },
  1622	
  1623		{ SYS_DESC(SYS_ICC_IAR0_EL1), write_to_read_only },
  1624		{ SYS_DESC(SYS_ICC_EOIR0_EL1), read_from_write_only },
  1625		{ SYS_DESC(SYS_ICC_HPPIR0_EL1), write_to_read_only },
  1626		{ SYS_DESC(SYS_ICC_DIR_EL1), read_from_write_only },
  1627		{ SYS_DESC(SYS_ICC_RPR_EL1), write_to_read_only },
  1628		{ SYS_DESC(SYS_ICC_SGI1R_EL1), access_gic_sgi },
  1629		{ SYS_DESC(SYS_ICC_ASGI1R_EL1), access_gic_sgi },
  1630		{ SYS_DESC(SYS_ICC_SGI0R_EL1), access_gic_sgi },
  1631		{ SYS_DESC(SYS_ICC_IAR1_EL1), write_to_read_only },
  1632		{ SYS_DESC(SYS_ICC_EOIR1_EL1), read_from_write_only },
  1633		{ SYS_DESC(SYS_ICC_HPPIR1_EL1), write_to_read_only },
  1634		{ SYS_DESC(SYS_ICC_SRE_EL1), access_gic_sre },
  1635	
  1636		{ SYS_DESC(SYS_CONTEXTIDR_EL1), access_vm_reg, reset_val, CONTEXTIDR_EL1, 0 },
  1637		{ SYS_DESC(SYS_TPIDR_EL1), NULL, reset_unknown, TPIDR_EL1 },
  1638	
  1639		{ SYS_DESC(SYS_SCXTNUM_EL1), undef_access },
  1640	
  1641		{ SYS_DESC(SYS_CNTKCTL_EL1), NULL, reset_val, CNTKCTL_EL1, 0},
  1642	
  1643		{ SYS_DESC(SYS_CCSIDR_EL1), access_ccsidr },
  1644		{ SYS_DESC(SYS_CLIDR_EL1), access_clidr },
  1645		{ SYS_DESC(SYS_CSSELR_EL1), access_csselr, reset_unknown, CSSELR_EL1 },
  1646		{ SYS_DESC(SYS_CTR_EL0), access_ctr },
  1647	
  1648		{ PMU_SYS_REG(SYS_PMCR_EL0), .access = access_pmcr,
  1649		  .reset = reset_pmcr, .reg = PMCR_EL0 },
  1650		{ PMU_SYS_REG(SYS_PMCNTENSET_EL0),
  1651		  .access = access_pmcnten, .reg = PMCNTENSET_EL0 },
  1652		{ PMU_SYS_REG(SYS_PMCNTENCLR_EL0),
  1653		  .access = access_pmcnten, .reg = PMCNTENSET_EL0 },
  1654		{ PMU_SYS_REG(SYS_PMOVSCLR_EL0),
  1655		  .access = access_pmovs, .reg = PMOVSSET_EL0 },
  1656		/*
  1657		 * PM_SWINC_EL0 is exposed to userspace as RAZ/WI, as it was
  1658		 * previously (and pointlessly) advertised in the past...
  1659		 */
  1660		{ PMU_SYS_REG(SYS_PMSWINC_EL0),
  1661		  .get_user = get_raz_id_reg, .set_user = set_wi_reg,
  1662		  .access = access_pmswinc, .reset = NULL },
  1663		{ PMU_SYS_REG(SYS_PMSELR_EL0),
  1664		  .access = access_pmselr, .reset = reset_pmselr, .reg = PMSELR_EL0 },
  1665		{ PMU_SYS_REG(SYS_PMCEID0_EL0),
  1666		  .access = access_pmceid, .reset = NULL },
  1667		{ PMU_SYS_REG(SYS_PMCEID1_EL0),
  1668		  .access = access_pmceid, .reset = NULL },
  1669		{ PMU_SYS_REG(SYS_PMCCNTR_EL0),
  1670		  .access = access_pmu_evcntr, .reset = reset_unknown,
> 1671		  .reg = PMCCNTR_EL0, .get_user = get_pmu_evcntr},
  1672		{ PMU_SYS_REG(SYS_PMXEVTYPER_EL0),
  1673		  .access = access_pmu_evtyper, .reset = NULL },
  1674		{ PMU_SYS_REG(SYS_PMXEVCNTR_EL0),
  1675		  .access = access_pmu_evcntr, .reset = NULL },
  1676		/*
  1677		 * PMUSERENR_EL0 resets as unknown in 64bit mode while it resets as zero
  1678		 * in 32bit mode. Here we choose to reset it as zero for consistency.
  1679		 */
  1680		{ PMU_SYS_REG(SYS_PMUSERENR_EL0), .access = access_pmuserenr,
  1681		  .reset = reset_val, .reg = PMUSERENR_EL0, .val = 0 },
  1682		{ PMU_SYS_REG(SYS_PMOVSSET_EL0),
  1683		  .access = access_pmovs, .reg = PMOVSSET_EL0 },
  1684	
  1685		{ SYS_DESC(SYS_TPIDR_EL0), NULL, reset_unknown, TPIDR_EL0 },
  1686		{ SYS_DESC(SYS_TPIDRRO_EL0), NULL, reset_unknown, TPIDRRO_EL0 },
  1687	
  1688		{ SYS_DESC(SYS_SCXTNUM_EL0), undef_access },
  1689	
  1690		{ SYS_DESC(SYS_AMCR_EL0), undef_access },
  1691		{ SYS_DESC(SYS_AMCFGR_EL0), undef_access },
  1692		{ SYS_DESC(SYS_AMCGCR_EL0), undef_access },
  1693		{ SYS_DESC(SYS_AMUSERENR_EL0), undef_access },
  1694		{ SYS_DESC(SYS_AMCNTENCLR0_EL0), undef_access },
  1695		{ SYS_DESC(SYS_AMCNTENSET0_EL0), undef_access },
  1696		{ SYS_DESC(SYS_AMCNTENCLR1_EL0), undef_access },
  1697		{ SYS_DESC(SYS_AMCNTENSET1_EL0), undef_access },
  1698		AMU_AMEVCNTR0_EL0(0),
  1699		AMU_AMEVCNTR0_EL0(1),
  1700		AMU_AMEVCNTR0_EL0(2),
  1701		AMU_AMEVCNTR0_EL0(3),
  1702		AMU_AMEVCNTR0_EL0(4),
  1703		AMU_AMEVCNTR0_EL0(5),
  1704		AMU_AMEVCNTR0_EL0(6),
  1705		AMU_AMEVCNTR0_EL0(7),
  1706		AMU_AMEVCNTR0_EL0(8),
  1707		AMU_AMEVCNTR0_EL0(9),
  1708		AMU_AMEVCNTR0_EL0(10),
  1709		AMU_AMEVCNTR0_EL0(11),
  1710		AMU_AMEVCNTR0_EL0(12),
  1711		AMU_AMEVCNTR0_EL0(13),
  1712		AMU_AMEVCNTR0_EL0(14),
  1713		AMU_AMEVCNTR0_EL0(15),
  1714		AMU_AMEVTYPER0_EL0(0),
  1715		AMU_AMEVTYPER0_EL0(1),
  1716		AMU_AMEVTYPER0_EL0(2),
  1717		AMU_AMEVTYPER0_EL0(3),
  1718		AMU_AMEVTYPER0_EL0(4),
  1719		AMU_AMEVTYPER0_EL0(5),
  1720		AMU_AMEVTYPER0_EL0(6),
  1721		AMU_AMEVTYPER0_EL0(7),
  1722		AMU_AMEVTYPER0_EL0(8),
  1723		AMU_AMEVTYPER0_EL0(9),
  1724		AMU_AMEVTYPER0_EL0(10),
  1725		AMU_AMEVTYPER0_EL0(11),
  1726		AMU_AMEVTYPER0_EL0(12),
  1727		AMU_AMEVTYPER0_EL0(13),
  1728		AMU_AMEVTYPER0_EL0(14),
  1729		AMU_AMEVTYPER0_EL0(15),
  1730		AMU_AMEVCNTR1_EL0(0),
  1731		AMU_AMEVCNTR1_EL0(1),
  1732		AMU_AMEVCNTR1_EL0(2),
  1733		AMU_AMEVCNTR1_EL0(3),
  1734		AMU_AMEVCNTR1_EL0(4),
  1735		AMU_AMEVCNTR1_EL0(5),
  1736		AMU_AMEVCNTR1_EL0(6),
  1737		AMU_AMEVCNTR1_EL0(7),
  1738		AMU_AMEVCNTR1_EL0(8),
  1739		AMU_AMEVCNTR1_EL0(9),
  1740		AMU_AMEVCNTR1_EL0(10),
  1741		AMU_AMEVCNTR1_EL0(11),
  1742		AMU_AMEVCNTR1_EL0(12),
  1743		AMU_AMEVCNTR1_EL0(13),
  1744		AMU_AMEVCNTR1_EL0(14),
  1745		AMU_AMEVCNTR1_EL0(15),
  1746		AMU_AMEVTYPER1_EL0(0),
  1747		AMU_AMEVTYPER1_EL0(1),
  1748		AMU_AMEVTYPER1_EL0(2),
  1749		AMU_AMEVTYPER1_EL0(3),
  1750		AMU_AMEVTYPER1_EL0(4),
  1751		AMU_AMEVTYPER1_EL0(5),
  1752		AMU_AMEVTYPER1_EL0(6),
  1753		AMU_AMEVTYPER1_EL0(7),
  1754		AMU_AMEVTYPER1_EL0(8),
  1755		AMU_AMEVTYPER1_EL0(9),
  1756		AMU_AMEVTYPER1_EL0(10),
  1757		AMU_AMEVTYPER1_EL0(11),
  1758		AMU_AMEVTYPER1_EL0(12),
  1759		AMU_AMEVTYPER1_EL0(13),
  1760		AMU_AMEVTYPER1_EL0(14),
  1761		AMU_AMEVTYPER1_EL0(15),
  1762	
  1763		{ SYS_DESC(SYS_CNTP_TVAL_EL0), access_arch_timer },
  1764		{ SYS_DESC(SYS_CNTP_CTL_EL0), access_arch_timer },
  1765		{ SYS_DESC(SYS_CNTP_CVAL_EL0), access_arch_timer },
  1766	
  1767		/* PMEVCNTRn_EL0 */
  1768		PMU_PMEVCNTR_EL0(0),
  1769		PMU_PMEVCNTR_EL0(1),
  1770		PMU_PMEVCNTR_EL0(2),
  1771		PMU_PMEVCNTR_EL0(3),
  1772		PMU_PMEVCNTR_EL0(4),
  1773		PMU_PMEVCNTR_EL0(5),
  1774		PMU_PMEVCNTR_EL0(6),
  1775		PMU_PMEVCNTR_EL0(7),
  1776		PMU_PMEVCNTR_EL0(8),
  1777		PMU_PMEVCNTR_EL0(9),
  1778		PMU_PMEVCNTR_EL0(10),
  1779		PMU_PMEVCNTR_EL0(11),
  1780		PMU_PMEVCNTR_EL0(12),
  1781		PMU_PMEVCNTR_EL0(13),
  1782		PMU_PMEVCNTR_EL0(14),
  1783		PMU_PMEVCNTR_EL0(15),
  1784		PMU_PMEVCNTR_EL0(16),
  1785		PMU_PMEVCNTR_EL0(17),
  1786		PMU_PMEVCNTR_EL0(18),
  1787		PMU_PMEVCNTR_EL0(19),
  1788		PMU_PMEVCNTR_EL0(20),
  1789		PMU_PMEVCNTR_EL0(21),
  1790		PMU_PMEVCNTR_EL0(22),
  1791		PMU_PMEVCNTR_EL0(23),
  1792		PMU_PMEVCNTR_EL0(24),
  1793		PMU_PMEVCNTR_EL0(25),
  1794		PMU_PMEVCNTR_EL0(26),
  1795		PMU_PMEVCNTR_EL0(27),
  1796		PMU_PMEVCNTR_EL0(28),
  1797		PMU_PMEVCNTR_EL0(29),
  1798		PMU_PMEVCNTR_EL0(30),
  1799		/* PMEVTYPERn_EL0 */
  1800		PMU_PMEVTYPER_EL0(0),
  1801		PMU_PMEVTYPER_EL0(1),
  1802		PMU_PMEVTYPER_EL0(2),
  1803		PMU_PMEVTYPER_EL0(3),
  1804		PMU_PMEVTYPER_EL0(4),
  1805		PMU_PMEVTYPER_EL0(5),
  1806		PMU_PMEVTYPER_EL0(6),
  1807		PMU_PMEVTYPER_EL0(7),
  1808		PMU_PMEVTYPER_EL0(8),
  1809		PMU_PMEVTYPER_EL0(9),
  1810		PMU_PMEVTYPER_EL0(10),
  1811		PMU_PMEVTYPER_EL0(11),
  1812		PMU_PMEVTYPER_EL0(12),
  1813		PMU_PMEVTYPER_EL0(13),
  1814		PMU_PMEVTYPER_EL0(14),
  1815		PMU_PMEVTYPER_EL0(15),
  1816		PMU_PMEVTYPER_EL0(16),
  1817		PMU_PMEVTYPER_EL0(17),
  1818		PMU_PMEVTYPER_EL0(18),
  1819		PMU_PMEVTYPER_EL0(19),
  1820		PMU_PMEVTYPER_EL0(20),
  1821		PMU_PMEVTYPER_EL0(21),
  1822		PMU_PMEVTYPER_EL0(22),
  1823		PMU_PMEVTYPER_EL0(23),
  1824		PMU_PMEVTYPER_EL0(24),
  1825		PMU_PMEVTYPER_EL0(25),
  1826		PMU_PMEVTYPER_EL0(26),
  1827		PMU_PMEVTYPER_EL0(27),
  1828		PMU_PMEVTYPER_EL0(28),
  1829		PMU_PMEVTYPER_EL0(29),
  1830		PMU_PMEVTYPER_EL0(30),
  1831		/*
  1832		 * PMCCFILTR_EL0 resets as unknown in 64bit mode while it resets as zero
  1833		 * in 32bit mode. Here we choose to reset it as zero for consistency.
  1834		 */
  1835		{ PMU_SYS_REG(SYS_PMCCFILTR_EL0), .access = access_pmu_evtyper,
  1836		  .reset = reset_val, .reg = PMCCFILTR_EL0, .val = 0 },
  1837	
  1838		{ SYS_DESC(SYS_DACR32_EL2), NULL, reset_unknown, DACR32_EL2 },
  1839		{ SYS_DESC(SYS_IFSR32_EL2), NULL, reset_unknown, IFSR32_EL2 },
  1840		{ SYS_DESC(SYS_FPEXC32_EL2), NULL, reset_val, FPEXC32_EL2, 0x700 },
  1841	};
  1842	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
