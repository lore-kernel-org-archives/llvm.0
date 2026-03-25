Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF33E2459C5;
	Wed, 25 Mar 2026 04:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774412218; cv=none; b=OA/3BirTjKwAMLQaxDhZlUgHFeZ/v/+rNjRaZ++Hz8kXLd9D3QmMvC1qri7fve4u1GwAWZ3aw53V9/G85Xy61I83XrrjV1okXEub5oeFy5gwodx3Ui4mQbIrGCGq1aaPrMOz7QckLsUkTo2tyv7/jhvs/ldLtOL6MqzfcNmUa5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774412218; c=relaxed/simple;
	bh=szsi0JLizE0fjetMbtNt0HLfks0Ov14D3uXe6h43Xec=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XOrgjX7pK52rtga6vxcYPDMCYV6yPa6iLQeCLOBCaUgDssWY1hF+BersxFFkDAwVcADwUY8HMNDPE6onq8gVTLkyQ34GFqdc2ymK6iVvfszG7Mx1uFPWdsC5ILRqnjle3R9rFljtVDdLVZc9BGbceV7ykMkYGj1emXJz1a7LMcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7nu/g80; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7nu/g80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774412217; x=1805948217;
  h=date:from:to:cc:subject:message-id;
  bh=szsi0JLizE0fjetMbtNt0HLfks0Ov14D3uXe6h43Xec=;
  b=h7nu/g80jYXy7QaQ0vHEMkElMtvcACNhcNpWl9jM13VSB3KnH25jx2j5
   ZYs6H+dM2aiTEd5/XKEDwAR/eUNN8iMap6XiibiMcuJG7Gel8F4qAdIzy
   MPwFqhX8kYYRpYvNUGAPy/ApcWLO0EZHyeeAOxKRkvh7V4wmV0GlNQbOY
   ZYrUJuslOEkoyrTv5Gxv7zj7JOGeQZgbfSXGJpoljltCml3J+W9Y6ETWZ
   4HMXEtCwIpWIlRWR0+9ubKqMHIVSNQwTb+7JDbcUt5O/VVePEqC7vz29a
   kjC9OD87UBDmB60snYwMWJ77cn0wNOo1gUEJezSm7TDnP4PLgFF9UhGBY
   w==;
X-CSE-ConnectionGUID: 9LMWgwtQTAmkiSw49zOvhw==
X-CSE-MsgGUID: /R9Rt8DEQtOTsaGJovykfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75410459"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75410459"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 21:16:56 -0700
X-CSE-ConnectionGUID: 6aJpSTG9Tkya/J5YT5yrSQ==
X-CSE-MsgGUID: OTe6wOifQzWJQtgX+iwBgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="229028607"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Mar 2026 21:16:54 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Ffn-000000005wF-0jsF;
	Wed, 25 Mar 2026 04:16:51 +0000
Date: Wed, 25 Mar 2026 12:16:31 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Will Deacon <will@kernel.org>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: [arm-perf:for-next/perf 4/11]
 drivers/perf/arm-cmn.c:2149:51: warning: format specifies type 'unsigned long
 long' but the argument has type 'resource_size_t' (aka 'unsigned int')
Message-ID: <202603251248.s3JOjeN0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
head:   2f89b7f78c50ca973ca035ceb30426f78d9e0996
commit: 5394396ff5488f007248727988b722c5d4f0638b [4/11] perf/arm-cmn: Stop claiming entire iomem region
config: i386-buildonly-randconfig-003-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251248.s3JOjeN0-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251248.s3JOjeN0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251248.s3JOjeN0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/arm-cmn.c:2149:51: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
    2149 |                                      "Failed to request DTC region 0x%llx\n", base);
         |                                                                      ~~~~     ^~~~
         |                                                                      %x
   1 warning generated.


vim +2149 drivers/perf/arm-cmn.c

  2131	
  2132	static int arm_cmn_init_dtc(struct arm_cmn *cmn, struct arm_cmn_node *dn, int idx)
  2133	{
  2134		struct arm_cmn_dtc *dtc = cmn->dtc + idx;
  2135		const struct resource *cfg;
  2136		resource_size_t base, size;
  2137	
  2138		dtc->pmu_base = dn->pmu_base;
  2139		dtc->base = dtc->pmu_base - arm_cmn_pmu_offset(cmn, dn);
  2140		dtc->irq = platform_get_irq(to_platform_device(cmn->dev), idx);
  2141		if (dtc->irq < 0)
  2142			return dtc->irq;
  2143	
  2144		cfg = platform_get_resource(to_platform_device(cmn->dev), IORESOURCE_MEM, 0);
  2145		base = dtc->base - cmn->base + cfg->start;
  2146		size = cmn->part == PART_CMN600 ? SZ_16K : SZ_64K;
  2147		if (!devm_request_mem_region(cmn->dev, base, size, dev_name(cmn->dev)))
  2148			return dev_err_probe(cmn->dev, -EBUSY,
> 2149					     "Failed to request DTC region 0x%llx\n", base);
  2150	
  2151		writel_relaxed(CMN_DT_DTC_CTL_DT_EN, dtc->base + CMN_DT_DTC_CTL);
  2152		writel_relaxed(CMN_DT_PMCR_PMU_EN | CMN_DT_PMCR_OVFL_INTR_EN, CMN_DT_PMCR(dtc));
  2153		writeq_relaxed(0, CMN_DT_PMCCNTR(dtc));
  2154		writel_relaxed(0x1ff, CMN_DT_PMOVSR_CLR(dtc));
  2155	
  2156		return 0;
  2157	}
  2158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
