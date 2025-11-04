Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02042C327E;
	Tue,  4 Nov 2025 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762249449; cv=none; b=FMTIa11A8wx38f5orYDz6gE4MYrmJ5hi30+cyb9bqqKGAoMOLjW4Q7Y9V3EEq1KeEafLzr4YKDJczvWEImaAMtukQfZM6neuC9IzvJvKzG3ORQVxiIgIx2+mczLvUOnjD4w5cCb4NK0I4ixcdQyRANUt64ooGg6WXRZKpCdQyrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762249449; c=relaxed/simple;
	bh=szmKk321I2L+YTEETSV+bLXfqfZU7Xf32XDr2dWMvrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D2IyvU/ljqRL7eWRB1x0jx7oRPb8PkuOfpCVryAbbTpTm3UmPpJ9q7tV7vqdZbjNq0cy2M3apImbpNx7OXYTxfAVoN3E3kl99jKI0p48ucKfG38mpIVrWgrZGsXY21dnM8GSvaOEIOnOcT8ADQnuPwi2qKNMd18QeIvKsv0+ygg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=adSCc76x; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="adSCc76x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762249448; x=1793785448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=szmKk321I2L+YTEETSV+bLXfqfZU7Xf32XDr2dWMvrE=;
  b=adSCc76xnSjVOeTyOpNaA8kxJ3gs9jXRTzB/D9rR/0n1AVh+bLYR8u4a
   QfWtYWC3Ju49JtYUlOfQqJjknJ4CabjU7hEvIwLcg/eKoJCk7uPeAeazV
   PyOEvsjiI11yxGI+PPVwoRjlA2wudeAB74kU3/xBcAnsSXwFk9Nk0+xn7
   oV84kjyLkZ+v3KBF8VIbBn/vgQLOUj7c9I9B8FBwty+KvFXqLcAfMftLt
   sqkI0rTbabPt7rE54jBJEX+H4buzxusoy7ZzEvYgsgABF33GVt9ojOMwv
   BUugnwP+vy5JR6SQm4LUqA14SZSzAwX90cN/WHrP0vIISIRCubRIPtfEj
   g==;
X-CSE-ConnectionGUID: T6KxZofhRSa35Y/LcI3GXg==
X-CSE-MsgGUID: pC9m7hMBTCarz+F4ZdEcVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="63350875"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="63350875"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 01:44:06 -0800
X-CSE-ConnectionGUID: kENPLh7MSRmv9tS4Md70dQ==
X-CSE-MsgGUID: yFdSBfAkS4yjmake+vk3vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="191422853"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 04 Nov 2025 01:44:05 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGDa7-000RDw-0I;
	Tue, 04 Nov 2025 09:44:03 +0000
Date: Tue, 4 Nov 2025 17:43:40 +0800
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Will Deacon <will@kernel.org>
Subject: [arm-perf:for-next/perf 6/8] drivers/perf/arm-ni.c:433:13: warning:
 operator '?:' has lower precedence than '+'; '+' will be evaluated first
Message-ID: <202511041749.ok8zDP6u-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
head:   989b40b7578a2be7b0388522d33d751b257d59d9
commit: 8fa08f8835e57e1fd5e2994c9cf76c84dadc1235 [6/8] perf/arm-ni: Add NoC S3 support
config: sparc64-randconfig-002-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041749.ok8zDP6u-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d2625a438020ad35330cda29c3def102c1687b1b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041749.ok8zDP6u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041749.ok8zDP6u-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/perf/arm-ni.c:433:13: warning: operator '?:' has lower precedence than '+'; '+' will be evaluated first [-Wparentheses]
     432 |                 hw->event_base = (unsigned long)cd->pmu_base +
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     433 |                                  is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
         |                                  ~~~~~~ ^
   drivers/perf/arm-ni.c:433:13: note: place parentheses around the '+' expression to silence this warning
     432 |                 hw->event_base = (unsigned long)cd->pmu_base +
         |                                  (
     433 |                                  is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
         |                                         ^
         |                                        )
   drivers/perf/arm-ni.c:433:13: note: place parentheses around the '?:' expression to evaluate it first
     433 |                                  is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
         |                                  ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/perf/arm-ni.c:446:13: warning: operator '?:' has lower precedence than '+'; '+' will be evaluated first [-Wparentheses]
     445 |                 hw->event_base = (unsigned long)cd->pmu_base +
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     446 |                                  is_7xx ? NI700_PMEVCNTR(hw->idx) : NI_PMEVCNTR(hw->idx);
         |                                  ~~~~~~ ^
   drivers/perf/arm-ni.c:446:13: note: place parentheses around the '+' expression to silence this warning
     445 |                 hw->event_base = (unsigned long)cd->pmu_base +
         |                                  (
     446 |                                  is_7xx ? NI700_PMEVCNTR(hw->idx) : NI_PMEVCNTR(hw->idx);
         |                                         ^
         |                                        )
   drivers/perf/arm-ni.c:446:13: note: place parentheses around the '?:' expression to evaluate it first
     446 |                                  is_7xx ? NI700_PMEVCNTR(hw->idx) : NI_PMEVCNTR(hw->idx);
         |                                  ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +433 drivers/perf/arm-ni.c

   418	
   419	static int arm_ni_event_add(struct perf_event *event, int flags)
   420	{
   421		struct arm_ni_cd *cd = pmu_to_cd(event->pmu);
   422		struct hw_perf_event *hw = &event->hw;
   423		struct arm_ni_unit *unit;
   424		enum ni_node_type type = NI_EVENT_TYPE(event);
   425		bool is_7xx = arm_ni_is_7xx(cd_to_ni(cd));
   426		u32 reg;
   427	
   428		if (type == NI_PMU) {
   429			if (cd->ccnt)
   430				return -ENOSPC;
   431			hw->idx = NI_CCNT_IDX;
   432			hw->event_base = (unsigned long)cd->pmu_base +
 > 433					 is_7xx ? NI700_PMCCNTR_L : NI_PMCCNTR_L;
   434			cd->ccnt = event;
   435			arm_ni_init_ccnt(hw);
   436		} else {
   437			hw->idx = 0;
   438			while (cd->evcnt[hw->idx]) {
   439				if (++hw->idx == NI_NUM_COUNTERS)
   440					return -ENOSPC;
   441			}
   442			cd->evcnt[hw->idx] = event;
   443			unit = (void *)hw->config_base;
   444			unit->event[hw->idx] = NI_EVENT_EVENTID(event);
   445			hw->event_base = (unsigned long)cd->pmu_base +
   446					 is_7xx ? NI700_PMEVCNTR(hw->idx) : NI_PMEVCNTR(hw->idx);
   447			arm_ni_init_evcnt(hw);
   448			lo_hi_writeq_relaxed(le64_to_cpu(unit->pmusel), unit->pmusela);
   449	
   450			reg = FIELD_PREP(NI_PMEVTYPER_NODE_TYPE, type) |
   451			      FIELD_PREP(NI_PMEVTYPER_NODE_ID, NI_EVENT_NODEID(event));
   452			writel_relaxed(reg, cd->pmu_base + NI_PMEVTYPER(hw->idx));
   453		}
   454		if (flags & PERF_EF_START)
   455			arm_ni_event_start(event, 0);
   456		return 0;
   457	}
   458	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
