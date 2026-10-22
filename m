Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792690843;
	b=SLGsHWVfbYq1RIGUZIUQRNGptkDWBs2vt0rq8V1WGcSg/COiw1J98qZtUYyY6EFinQJ2
	 asg0vfMVNmnhvW0Wi9ARS2EVR7WJIQSM+Bu6vCiCKEFn0cFrvVm1L3BtoCtr+anD6FTsP
	 H5ywT81ecW9qFJTO/ipY6p05xI9pLdDbzKw7ve4gSqJqweW5LYUN2VtMZq0gi9eT19c7T
	 jIIQ0RbJLNCIhmDCrDtaQHx1WRJhnlfhZC/nTu/dUGy6Wj4lzSboWe/mBeo+Nn2yo/Zji
	 n5RrwSZvZaNvdqR4uDIrt4j4dB/7Tm7l0+R3kPXyY0gKH/gsSn/D0EhWGcqDpdzSVAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792690843;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WaguDny2AG9x6JbwRp52ffHnUhPlyAbh7hjgBAN/b94=;
	b=o9yCCSRiLH6K+cprbDPOBu98zpdXR8+hmz8yaf/impMhCGKVhP8+Yz9Ggzowdg7D0g3X
	 U09FSqqiFz1niPVveYQ1VG4cidjVkZtUjq+Svs1TlnFbyoUx/jgYAEcPssIoJVZ2NYX7h
	 poZUWWc3sq3T5UO4tpfEbt/vV7HRs8/yhj5apoiABjHcpLrsBnyXE4Mm0Y86aayVAtoRB
	 HPWlIx+KJ8xLnubL3BkIa880al6gyX1SvnU308SfvqmOYQxJruOIQ5NsCdpBF4jkTKjJj
	 Xdz2u4AGLA6hOVhE+8D59lcnN0pfF9PWiclWlHVy8IE5EyqElj95oNl/mU+IfTQ8VXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="SN/puzre";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E01606A31B;
	Thu, 22 Oct 2026 17:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3E01606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SN/puzre
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792690842; x=1824226842;
  h=date:from:to:cc:subject:message-id;
  bh=t6QHHIAZR8Xvm99DKv60yRWvjQjg0x5jnOoXOjCqhLU=;
  b=SN/puzreviCTsytjxhiijgxrYsX9h2RRFMm++8EvvEVGYw7MKVfxZvT8
   cmTIM6IqYC9N5ABWxCyFGqH++nFQ1b/5ZB4ah97sAFSZ9lJfdzV0JeKIy
   HAP9kWNI+73DWov0md1jpP2VtePcYfCK2rSLFMBAc1tc6HAJ5WuWc0ZuH
   AWdFFR6pjUSqCuHQCx/X/jxg8pGis8A1MSzigyJIkvMXefM0UyMfzrubI
   /IoWgXuhLgpAwtvt78fPnXbQMYx99YWO14BBqr4wyRfVBgeLIgbS6tL3V
   14CnzvH2Z4ccqdf1VpB6e/pfS/CLiePNPEHACtrsWwdM/jDmoDjoQ6cpv
   A==;
X-CSE-ConnectionGUID: mMge8+jMTZKX2+SGaQDmOg==
X-CSE-MsgGUID: hF0bcBcBSd+0MfVOboJktA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1322458"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1322458"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 10:40:39 -0700
X-CSE-ConnectionGUID: 8W7RbAGYS42+qQhLAvOjIg==
X-CSE-MsgGUID: udsmX48NT3Gr8kKaBGVf5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3505717"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Oct 2026 10:40:38 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJwmJ-00000000RQi-1HSn;
	Thu, 22 Oct 2026 17:40:35 +0000
Date: Fri, 23 Oct 2026 01:39:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lumag-msm:venus-8996-vmem 72/173] Warning:
 drivers/cpufreq/qcom-cpufreq-hw.c:585 Incorrect use of kernel-doc format:  *
 qcom_cpufreq_set_supported_hw() - Restrict the OPPs to the fused speed bin
Message-ID: <202610230118.0oZJCgqK-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://gitlab.freedesktop.org/lumag/msm venus-8996-vmem
head:   4dff7b31dd13e97b8f7abab7bc115d2875afd5e8
commit: 08047584b5b3b4021c16bc782047528dbba1fc9b [72/173] cpufreq: qcom-hw: Select the OPPs matching the fused speed bin
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261023/202610230118.0oZJCgqK-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230118.0oZJCgqK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230118.0oZJCgqK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'reg_domain_state' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'reg_dcvs_ctrl' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'reg_intr_clr' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'reg_current_vote' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'lut_max_entries' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'acd_data' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:418 function parameter 'cpu_dev' not described in 'qcom_cpufreq_update_opp'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:418 Excess function parameter 'policy' description in 'qcom_cpufreq_update_opp'
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:585 Incorrect use of kernel-doc format:  * qcom_cpufreq_set_supported_hw() - Restrict the OPPs to the fused speed bin
>> Warning: drivers/cpufreq/qcom-cpufreq-hw.c:596 expecting prototype for qcom_cpufreq_gen_params(). Prototype was for qcom_cpufreq_set_supported_hw() instead
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:1586 function parameter 'index' not described in 'qcom_cpufreq_hw_osm_setup'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'reg_domain_state' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'reg_dcvs_ctrl' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'reg_intr_clr' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'reg_current_vote' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'lut_max_entries' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:343 struct member 'acd_data' not described in 'qcom_cpufreq_soc_data'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:418 function parameter 'cpu_dev' not described in 'qcom_cpufreq_update_opp'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:418 Excess function parameter 'policy' description in 'qcom_cpufreq_update_opp'
   Warning: drivers/cpufreq/qcom-cpufreq-hw.c:1586 function parameter 'index' not described in 'qcom_cpufreq_hw_osm_setup'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
