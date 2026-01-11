Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A7C13AD1C;
	Sun, 11 Jan 2026 03:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768102184; cv=none; b=ZdfRLmuxiu2MI2YDuh9oBHV4m1Dlymj1eRQg1rxYUzaDWN7Tr7HnFFKMkceFez+zEAimcnrb4gNacHuKw3ZwW290L+kEKDS+GgrILxgb9E1w6HtL/DME7VIl7AFFa/aWZIr4Y65rWJezTNzeGWGrO1I1g3FbOLfRmV3ejjndW3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768102184; c=relaxed/simple;
	bh=C1vu/mNnjzDGaT2hJcSy5Pl2in6SJMGExoJVmNL87Po=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WElt8jQKH8CncdWR+loY86aBDu3n/z34179EP8yv1I+G3xowA182spfQ4FaJyjpE5zAZWBfYOXXhOvFEOqjs8YT5Xx5NAs2pE56tOMAURvnZgVJ4pVjKsNCS9hUfa377j9djgq5x8JI0muz5ugMuKBPgYjTruTyouhD0QCt2AhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJId3klp; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJId3klp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768102183; x=1799638183;
  h=date:from:to:cc:subject:message-id;
  bh=C1vu/mNnjzDGaT2hJcSy5Pl2in6SJMGExoJVmNL87Po=;
  b=OJId3klpx+uP8C/Swx46n0dWVWVpB8aWFawiENJ3DvsaxfwSe3b0DumF
   CMhXB8fuzV5XkFNBl9FdGcXnqXe8KKlZJ0y9+xhZNkzhpV/joKLKc//ij
   difnGFI4d/yTghrMjqkqC+5Tkx5rkpZkEjxNhK/y6OK2F43n33Expskvo
   IAI9hqzcrdi43WOZi6oAo7HGQJzVwAhRh3jTdQzremyLG5bJ1nZ2RqJj/
   XfC3n0NwNXhQf/xZnejVK099ajZex304BWX1rjnaPV6Uh4ytK2tIKVYag
   ZX3Neo2TRWvS8Q9sY5qsbrcPF3CN5/93kEqd5SarGDNw3prGLcyfHExe0
   A==;
X-CSE-ConnectionGUID: MIVhmAAdR1qrc5FBLXXMlA==
X-CSE-MsgGUID: 7HlELDfjRlKVe3YeEjosPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="68429418"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="68429418"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 19:29:43 -0800
X-CSE-ConnectionGUID: t+5A4n2cTguGkRvThkrIeg==
X-CSE-MsgGUID: qkPOJmlcRMur8qAV3NQBUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="235004781"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Jan 2026 19:29:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vem94-000000009XE-0iQi;
	Sun, 11 Jan 2026 03:29:38 +0000
Date: Sun, 11 Jan 2026 11:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Pavan Chebbi <pavan.chebbi@broadcom.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>,
 Somnath Kotur <somnath.kotur@broadcom.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Michael Chan <michael.chan@broadcom.com>
Subject: [netdev-net-next:main 48/53]
 drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:1141:6: error: call to
 undeclared function 'boot_cpu_has'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202601111104.2bvtxqyF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git main
head:   60d8484c4cec811f5ceb6550655df74490d1a165
commit: c470195b989fe7b9f92297e465c4e8a2363c0bb3 [48/53] bnxt_en: Add PTP .getcrosststamp() interface to get device/host times
config: arm64-randconfig-001-20260111 (https://download.01.org/0day-ci/archive/20260111/202601111104.2bvtxqyF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601111104.2bvtxqyF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601111104.2bvtxqyF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:1141:6: error: call to undeclared function 'boot_cpu_has'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1141 |             boot_cpu_has(X86_FEATURE_ART))
         |             ^
   drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:1141:6: note: did you mean 'boot_cpu_init'?
   include/linux/cpu.h:33:13: note: 'boot_cpu_init' declared here
      33 | extern void boot_cpu_init(void);
         |             ^
>> drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c:1141:19: error: use of undeclared identifier 'X86_FEATURE_ART'
    1141 |             boot_cpu_has(X86_FEATURE_ART))
         |                          ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_SELFTESTS
   Depends on [n]: NET [=y] && PHYLIB [=y] && INET [=n]
   Selected by [y]:
   - AMD_XGBE [=y] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_AMD [=y] && (OF_ADDRESS [=y] || ACPI [=n] || PCI [=y]) && HAS_IOMEM [=y] && (X86 || ARM64 [=y] || COMPILE_TEST [=y]) && PTP_1588_CLOCK_OPTIONAL [=y]


vim +/boot_cpu_has +1141 drivers/net/ethernet/broadcom/bnxt/bnxt_ptp.c

  1102	
  1103	int bnxt_ptp_init(struct bnxt *bp)
  1104	{
  1105		struct bnxt_ptp_cfg *ptp = bp->ptp_cfg;
  1106		int rc;
  1107	
  1108		if (!ptp)
  1109			return 0;
  1110	
  1111		rc = bnxt_map_ptp_regs(bp);
  1112		if (rc)
  1113			return rc;
  1114	
  1115		if (ptp->ptp_clock && bnxt_pps_config_ok(bp))
  1116			return 0;
  1117	
  1118		bnxt_ptp_free(bp);
  1119	
  1120		WRITE_ONCE(ptp->tx_avail, BNXT_MAX_TX_TS);
  1121		seqlock_init(&ptp->ptp_lock);
  1122		spin_lock_init(&ptp->ptp_tx_lock);
  1123	
  1124		if (BNXT_PTP_USE_RTC(bp)) {
  1125			bnxt_ptp_timecounter_init(bp, false);
  1126			rc = bnxt_ptp_init_rtc(bp, ptp->rtc_configured);
  1127			if (rc)
  1128				goto out;
  1129		} else {
  1130			bnxt_ptp_timecounter_init(bp, true);
  1131			bnxt_ptp_adjfine_rtc(bp, 0);
  1132		}
  1133		bnxt_hwrm_func_drv_rgtr(bp, NULL, 0, true);
  1134	
  1135		ptp->ptp_info = bnxt_ptp_caps;
  1136		if ((bp->fw_cap & BNXT_FW_CAP_PTP_PPS)) {
  1137			if (bnxt_ptp_pps_init(bp))
  1138				netdev_err(bp->dev, "1pps not initialized, continuing without 1pps support\n");
  1139		}
  1140		if ((bp->fw_cap & BNXT_FW_CAP_PTP_PTM) && pcie_ptm_enabled(bp->pdev) &&
> 1141		    boot_cpu_has(X86_FEATURE_ART))
  1142			ptp->ptp_info.getcrosststamp = bnxt_ptp_getcrosststamp;
  1143	
  1144		ptp->ptp_clock = ptp_clock_register(&ptp->ptp_info, &bp->pdev->dev);
  1145		if (IS_ERR(ptp->ptp_clock)) {
  1146			int err = PTR_ERR(ptp->ptp_clock);
  1147	
  1148			ptp->ptp_clock = NULL;
  1149			rc = err;
  1150			goto out;
  1151		}
  1152	
  1153		ptp->stats.ts_pkts = 0;
  1154		ptp->stats.ts_lost = 0;
  1155		atomic64_set(&ptp->stats.ts_err, 0);
  1156	
  1157		if (bp->flags & BNXT_FLAG_CHIP_P5_PLUS) {
  1158			bnxt_refclk_read(bp, NULL, &ptp->current_time);
  1159			WRITE_ONCE(ptp->old_time, ptp->current_time >> BNXT_HI_TIMER_SHIFT);
  1160			ptp_schedule_worker(ptp->ptp_clock, 0);
  1161		}
  1162		ptp->txts_tmo = BNXT_PTP_DFLT_TX_TMO;
  1163		return 0;
  1164	
  1165	out:
  1166		bnxt_ptp_free(bp);
  1167		bnxt_unmap_ptp_regs(bp);
  1168		return rc;
  1169	}
  1170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
