Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EF2193;
	Sat,  3 Aug 2024 09:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722677454; cv=none; b=dEzIPaonuesnvOrOqgc8dYONk9WQVfCs3lvwUFOiP5SLr7itkw+Eg0GvcbBQZSIvR2qU67pruNOqHw2JbYJIbcecIWC/dZSKKKGVnxgMGAKkJ0BSO7ukQ4+TA7VJQaO6gMaZne4f4Ic0VePK/0Ef2hq6IW3kTfxiaircEPFB6g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722677454; c=relaxed/simple;
	bh=Fjg9Pn+ZYwJbve/udsHMETjpAeIl6n+IOKDgECgDa44=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ECR1VhZBgN4vX/ff4EzIJ53fMXK7NO3FDLgA4EPUy9HC0pTEkxh04pCasTtu9bFyC0V3s3XoJ9RvyeT5qsTTywUHkbi3qeeZe5unl8Fy0wxqMajUSeqmVFvFFZXhWFYXaItsYbKiTiOD4zczuE54vdD0qPnBg5GFD2fyGcxtXWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxqnmP/y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxqnmP/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722677452; x=1754213452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fjg9Pn+ZYwJbve/udsHMETjpAeIl6n+IOKDgECgDa44=;
  b=MxqnmP/yK0FcoNofQoXpEsDArXwFoqqQMzGv0x6n5E4ORTKbicdGfc9A
   WrFwNfy6g8+IBWj6ngQeazeBTr5TUiT0zwl6g38ZBsoKIZ+De15VWPbYu
   QKUoD0RATaYGowMNpFNQ2/+ldjqIsxnt0hbQhpMPAQYx6klNELHjsDuGZ
   aaKLMyh/DDDW5x5S92TeMmpLb63fve4rGNPUNcJ11DQHd0WdVSgE9koJv
   VouNTN94+dvqou6CTFHkQ01joANz/G4WePxIJDfYVa8v5OjUMRAocZJCq
   aadw/XkA+mO3XTehMYYmA6giMYcvplRZ8PNYuQr7kOeac6V0Ih54hM0pd
   Q==;
X-CSE-ConnectionGUID: kQe91UDdQw64LR9xaeOj+Q==
X-CSE-MsgGUID: bU53C2ViQlud2UikZGR1SA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="20537852"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20537852"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 02:30:51 -0700
X-CSE-ConnectionGUID: y0u5W3HYTleadD4KNtyd5A==
X-CSE-MsgGUID: +T5FzQOcRcG38wcV4UwQ2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="60309871"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Aug 2024 02:30:49 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saB62-0000Lw-36;
	Sat, 03 Aug 2024 09:30:43 +0000
Date: Sat, 3 Aug 2024 17:29:54 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.11-rc1 78/128]
 drivers/platform/arm64/mpam/mpam_devices.c:767:4: warning: variable
 'hw_managed' is used uninitialized whenever 'if' condition is true
Message-ID: <202408031757.s4MfIY9k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.11-rc1
head:   063bc546005302904092c158fe3228dc8af798a9
commit: f81756350bdbf79a9c82c04a71f3a5d64461868b [78/128] arm_mpam: Probe the hardware features resctrl supports
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240803/202408031757.s4MfIY9k-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408031757.s4MfIY9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408031757.s4MfIY9k-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/platform/arm64/mpam/mpam_devices.c:6:
   In file included from include/linux/acpi.h:39:
   In file included from include/acpi/acpi_io.h:7:
   In file included from arch/arm64/include/asm/acpi.h:14:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/arm64/mpam/mpam_devices.c:473:17: warning: result of comparison of constant 18446744073709551615 with expression of type 'u32' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
     473 |                         if (cache_id == ~0UL) {
         |                             ~~~~~~~~ ^  ~~~~
>> drivers/platform/arm64/mpam/mpam_devices.c:767:4: warning: variable 'hw_managed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     767 |                         mpam_ris_hw_probe_hw_nrdy(ris, MBWU, hw_managed);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/arm64/mpam/mpam_devices.c:670:6: note: expanded from macro 'mpam_ris_hw_probe_hw_nrdy'
     670 |         if (WARN_ON_ONCE(!mpam_mon_sel_inner_lock(msc)))                        \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:33: note: expanded from macro 'WARN_ON_ONCE'
     110 | #define WARN_ON_ONCE(condition) ({                              \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     111 |         int __ret_warn_on = !!(condition);                      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     112 |         if (unlikely(__ret_warn_on))                            \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     114 |                              BUGFLAG_TAINT(TAINT_WARN));        \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     115 |         unlikely(__ret_warn_on);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 | })
         | ~~
   drivers/platform/arm64/mpam/mpam_devices.c:768:8: note: uninitialized use occurs here
     768 |                         if (hw_managed)
         |                             ^~~~~~~~~~
   drivers/platform/arm64/mpam/mpam_devices.c:767:4: note: remove the 'if' if its condition is always false
     767 |                         mpam_ris_hw_probe_hw_nrdy(ris, MBWU, hw_managed);
         |                         ^
   drivers/platform/arm64/mpam/mpam_devices.c:670:2: note: expanded from macro 'mpam_ris_hw_probe_hw_nrdy'
     670 |         if (WARN_ON_ONCE(!mpam_mon_sel_inner_lock(msc)))                        \
         |         ^
   drivers/platform/arm64/mpam/mpam_devices.c:756:19: note: initialize the variable 'hw_managed' to silence this warning
     756 |                         bool hw_managed;
         |                                        ^
         |                                         = 0
   drivers/platform/arm64/mpam/mpam_devices.c:746:5: warning: variable 'hw_managed' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     746 |                                 mpam_ris_hw_probe_hw_nrdy(ris, CSU, hw_managed);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/platform/arm64/mpam/mpam_devices.c:670:6: note: expanded from macro 'mpam_ris_hw_probe_hw_nrdy'
     670 |         if (WARN_ON_ONCE(!mpam_mon_sel_inner_lock(msc)))                        \
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:33: note: expanded from macro 'WARN_ON_ONCE'
     110 | #define WARN_ON_ONCE(condition) ({                              \
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     111 |         int __ret_warn_on = !!(condition);                      \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     112 |         if (unlikely(__ret_warn_on))                            \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     113 |                 __WARN_FLAGS(BUGFLAG_ONCE |                     \
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     114 |                              BUGFLAG_TAINT(TAINT_WARN));        \
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     115 |         unlikely(__ret_warn_on);                                \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     116 | })
         | ~~
   drivers/platform/arm64/mpam/mpam_devices.c:747:9: note: uninitialized use occurs here
     747 |                                 if (hw_managed)
         |                                     ^~~~~~~~~~
   drivers/platform/arm64/mpam/mpam_devices.c:746:5: note: remove the 'if' if its condition is always false
     746 |                                 mpam_ris_hw_probe_hw_nrdy(ris, CSU, hw_managed);
         |                                 ^
   drivers/platform/arm64/mpam/mpam_devices.c:670:2: note: expanded from macro 'mpam_ris_hw_probe_hw_nrdy'
     670 |         if (WARN_ON_ONCE(!mpam_mon_sel_inner_lock(msc)))                        \
         |         ^
   drivers/platform/arm64/mpam/mpam_devices.c:741:20: note: initialize the variable 'hw_managed' to silence this warning
     741 |                                 bool hw_managed;
         |                                                ^
         |                                                 = 0
   8 warnings generated.


vim +767 drivers/platform/arm64/mpam/mpam_devices.c

   687	
   688	static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
   689	{
   690		int err;
   691		struct mpam_msc *msc = ris->vmsc->msc;
   692		struct mpam_props *props = &ris->props;
   693	
   694		lockdep_assert_held(&msc->probe_lock);
   695		lockdep_assert_held(&msc->part_sel_lock);
   696	
   697		mpam_mon_sel_outer_lock(msc);
   698	
   699		/* Cache Portion partitioning */
   700		if (FIELD_GET(MPAMF_IDR_HAS_CPOR_PART, ris->idr)) {
   701			u32 cpor_features = mpam_read_partsel_reg(msc, CPOR_IDR);
   702	
   703			props->cpbm_wd = FIELD_GET(MPAMF_CPOR_IDR_CPBM_WD, cpor_features);
   704			if (props->cpbm_wd)
   705				mpam_set_feature(mpam_feat_cpor_part, props);
   706		}
   707	
   708		/* Memory bandwidth partitioning */
   709		if (FIELD_GET(MPAMF_IDR_HAS_MBW_PART, ris->idr)) {
   710			u32 mbw_features = mpam_read_partsel_reg(msc, MBW_IDR);
   711	
   712			/* portion bitmap resolution */
   713			props->mbw_pbm_bits = FIELD_GET(MPAMF_MBW_IDR_BWPBM_WD, mbw_features);
   714			if (props->mbw_pbm_bits &&
   715			    FIELD_GET(MPAMF_MBW_IDR_HAS_PBM, mbw_features))
   716				mpam_set_feature(mpam_feat_mbw_part, props);
   717	
   718			props->bwa_wd = FIELD_GET(MPAMF_MBW_IDR_BWA_WD, mbw_features);
   719			if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
   720				mpam_set_feature(mpam_feat_mbw_max, props);
   721		}
   722	
   723		/* Performance Monitoring */
   724		if (FIELD_GET(MPAMF_IDR_HAS_MSMON, ris->idr)) {
   725			u32 msmon_features = mpam_read_partsel_reg(msc, MSMON_IDR);
   726	
   727			if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_CSU, msmon_features)) {
   728				u32 csumonidr;
   729	
   730				/*
   731				 * If the firmware max-nrdy-us property is missing, the
   732				 * CSU counters can't be used. Should we wait forever?
   733				 */
   734				err = device_property_read_u32(&msc->pdev->dev,
   735							       "arm,not-ready-us",
   736							       &msc->nrdy_usec);
   737	
   738				csumonidr = mpam_read_partsel_reg(msc, CSUMON_IDR);
   739				props->num_csu_mon = FIELD_GET(MPAMF_CSUMON_IDR_NUM_MON, csumonidr);
   740				if (props->num_csu_mon && !err) {
   741					bool hw_managed;
   742	
   743					mpam_set_feature(mpam_feat_msmon_csu, props);
   744	
   745					/* Is NRDY hardware managed? */
   746					mpam_ris_hw_probe_hw_nrdy(ris, CSU, hw_managed);
   747					if (hw_managed)
   748						mpam_set_feature(mpam_feat_msmon_csu_hw_nrdy, props);
   749				}
   750	
   751				if (err && mpam_has_feature(mpam_feat_msmon_csu_hw_nrdy, props)) {
   752					pr_err_once("Counters are not usable because not-ready timeout was not provided by firmware.");
   753				}
   754			}
   755			if (FIELD_GET(MPAMF_MSMON_IDR_MSMON_MBWU, msmon_features)) {
   756				bool hw_managed;
   757				u32 mbwumonidr = mpam_read_partsel_reg(msc, MBWUMON_IDR);
   758	
   759				props->num_mbwu_mon = FIELD_GET(MPAMF_MBWUMON_IDR_NUM_MON, mbwumonidr);
   760				if (props->num_mbwu_mon)
   761					mpam_set_feature(mpam_feat_msmon_mbwu, props);
   762	
   763				if (FIELD_GET(MPAMF_MBWUMON_IDR_HAS_RWBW, mbwumonidr))
   764					mpam_set_feature(mpam_feat_msmon_mbwu_rwbw, props);
   765	
   766				/* Is NRDY hardware managed? */
 > 767				mpam_ris_hw_probe_hw_nrdy(ris, MBWU, hw_managed);
   768				if (hw_managed)
   769					mpam_set_feature(mpam_feat_msmon_mbwu_hw_nrdy, props);
   770	
   771			}
   772		}
   773	
   774		mpam_mon_sel_outer_unlock(msc);
   775	}
   776	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
