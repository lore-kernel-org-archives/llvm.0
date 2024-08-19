Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342491CAAF;
	Mon, 19 Aug 2024 18:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724090582; cv=none; b=om51ihyJN5t/eITMhJWQvLxv66pHXN8g8b/eMN5q2iS3TtZjgtwiy+F5QLAk7bZb2PIoVJ4HOwWPrxTyl9uxfSLNDcmBdOi+BXAA/V9nrktKwqjRVIwYilSKqsc1dQHK1J9ui6pD0SfL8YU7lBTHtNr8vTzyTYz2JIPZTI3S/Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724090582; c=relaxed/simple;
	bh=4TcV0z44ktrkpfTieRGhBfAkngjvlSrTcQdmML5TFII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HVI4k6Cs62m1O90pi423L3798cfLx8s+0Bqn01epOmsPz2XiZP6mKjuPzK1yQ/58a9ZHYfiGCG6WS0fya3CrtmWQqQUP6werHoHtLX0bvaELMWzwyPAEB4ckVIvnkBTcu6DRwQfuokUeNw73lNFxPsUPjfBVxklgVG04J9+QCxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DGRylYov; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DGRylYov"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724090580; x=1755626580;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4TcV0z44ktrkpfTieRGhBfAkngjvlSrTcQdmML5TFII=;
  b=DGRylYovoA/BAIHNYtHuDpktIJPr5Feo1lRFsqyIbVYYGafWbiB5aidM
   N0Wql6sJ63XqL2+8pIpO/i7Ppeyvp2MF34CbDb1EpspCEScothmyYRj0e
   DJWVKNbf78Qd+lfEhCxmZRJjWeMF/OI5ZebyFVceV2f8aEY4OJ5RTgeTK
   QTtr/X+0qIZXbe0xc6s7/Z+iNa3doxFYbEaRK1bt80LtJDsLzJpyoHhb0
   PdjxsMw7XdR48W3r6NC/JhGolwpSuXP7LFDCpOsuHXp5OhhtDhwb4gz83
   +0zMBg7qLtuQVw6EnWBBrufNUy+eV0xWayhGuWtbkim9McylqIhaLBfSP
   g==;
X-CSE-ConnectionGUID: frwPefyxRg6vsSpS/Og7KA==
X-CSE-MsgGUID: CU5FRyWLTtG2nZJ7hAxFvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="26218940"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="26218940"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 11:02:57 -0700
X-CSE-ConnectionGUID: 3nQiPRZTT0eNSxYbotS0Jw==
X-CSE-MsgGUID: LUY6kTN5SAKNrFDKet4oBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60507985"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Aug 2024 11:02:56 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg6iU-0009Hv-0t;
	Mon, 19 Aug 2024 18:02:54 +0000
Date: Tue, 20 Aug 2024 02:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/vgic-sre-traps 10/13]
 arch/arm64/kvm/hyp/vhe/../vgic-v3-sr.c:1107:10: warning: converting the
 result of '<<' to a boolean always evaluates to true
Message-ID: <202408200109.tJ2BFUyY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/vgic-sre-traps
head:   41d85ddf2bde3a7a3cc8c7d6276146f14d1bff94
commit: 1c3174082fe5623b4c0d48968bbce04509c8f563 [10/13] KVM: arm64: Honor guest requested traps in GICv3 emulation
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240820/202408200109.tJ2BFUyY-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200109.tJ2BFUyY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200109.tJ2BFUyY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/vhe/../vgic-v3-sr.c:7:
   In file included from arch/arm64/kvm/hyp/include/hyp/adjust_pc.h:13:
   In file included from arch/arm64/include/asm/kvm_emulate.h:15:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/vhe/../vgic-v3-sr.c:1107:10: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
    1107 |                 return ICH_HCR_TC;
         |                        ^
   arch/arm64/include/asm/sysreg.h:1009:24: note: expanded from macro 'ICH_HCR_TC'
    1009 | #define ICH_HCR_TC              (1 << 10)
         |                                    ^
   5 warnings generated.
--
   In file included from arch/arm64/kvm/hyp/nvhe/../vgic-v3-sr.c:7:
   In file included from arch/arm64/kvm/hyp/include/hyp/adjust_pc.h:13:
   In file included from arch/arm64/include/asm/kvm_emulate.h:15:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/../vgic-v3-sr.c:1107:10: warning: converting the result of '<<' to a boolean always evaluates to true [-Wtautological-constant-compare]
    1107 |                 return ICH_HCR_TC;
         |                        ^
   arch/arm64/include/asm/sysreg.h:1009:24: note: expanded from macro 'ICH_HCR_TC'
    1009 | #define ICH_HCR_TC              (1 << 10)
         |                                    ^
   5 warnings generated.


vim +1107 arch/arm64/kvm/hyp/vhe/../vgic-v3-sr.c

  1044	
  1045	static bool __vgic_v3_check_trap_forwarding(struct kvm_vcpu *vcpu,
  1046						    u32 sysreg, bool is_read)
  1047	{
  1048		u64 ich_hcr;
  1049	
  1050		if (!vcpu_has_nv(vcpu) || is_hyp_ctxt(vcpu))
  1051			return false;
  1052	
  1053		ich_hcr = __vcpu_sys_reg(vcpu, ICH_HCR_EL2);
  1054	
  1055		switch (sysreg) {
  1056		case SYS_ICC_IGRPEN0_EL1:
  1057			if (is_read &&
  1058			    (__vcpu_sys_reg(vcpu, HFGRTR_EL2) & HFGxTR_EL2_ICC_IGRPENn_EL1))
  1059				return true;
  1060	
  1061			if (!is_read &&
  1062			    (__vcpu_sys_reg(vcpu, HFGWTR_EL2) & HFGxTR_EL2_ICC_IGRPENn_EL1))
  1063				return true;
  1064	
  1065			fallthrough;
  1066	
  1067		case SYS_ICC_AP0Rn_EL1(0):
  1068		case SYS_ICC_AP0Rn_EL1(1):
  1069		case SYS_ICC_AP0Rn_EL1(2):
  1070		case SYS_ICC_AP0Rn_EL1(3):
  1071		case SYS_ICC_BPR0_EL1:
  1072		case SYS_ICC_EOIR0_EL1:
  1073		case SYS_ICC_HPPIR0_EL1:
  1074		case SYS_ICC_IAR0_EL1:
  1075			return ich_hcr & ICH_HCR_TALL0;
  1076	
  1077		case SYS_ICC_IGRPEN1_EL1:
  1078			if (is_read &&
  1079			    (__vcpu_sys_reg(vcpu, HFGRTR_EL2) & HFGxTR_EL2_ICC_IGRPENn_EL1))
  1080				return true;
  1081	
  1082			if (!is_read &&
  1083			    (__vcpu_sys_reg(vcpu, HFGWTR_EL2) & HFGxTR_EL2_ICC_IGRPENn_EL1))
  1084				return true;
  1085	
  1086			fallthrough;
  1087	
  1088		case SYS_ICC_AP1Rn_EL1(0):
  1089		case SYS_ICC_AP1Rn_EL1(1):
  1090		case SYS_ICC_AP1Rn_EL1(2):
  1091		case SYS_ICC_AP1Rn_EL1(3):
  1092		case SYS_ICC_BPR1_EL1:
  1093		case SYS_ICC_EOIR1_EL1:
  1094		case SYS_ICC_HPPIR1_EL1:
  1095		case SYS_ICC_IAR1_EL1:
  1096			return ich_hcr & ICH_HCR_TALL1;
  1097	
  1098		case SYS_ICC_DIR_EL1:
  1099			if (ich_hcr & ICH_HCR_TDIR)
  1100				return true;
  1101	
  1102			fallthrough;
  1103	
  1104		case SYS_ICC_RPR_EL1:
  1105		case SYS_ICC_CTLR_EL1:
  1106		case SYS_ICC_PMR_EL1:
> 1107			return ICH_HCR_TC;
  1108	
  1109		default:
  1110			return false;
  1111		}
  1112	}
  1113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
