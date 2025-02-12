Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D101367;
	Wed, 12 Feb 2025 00:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739319450; cv=none; b=rKdl2y10soKIrYSpzvqHyRG8NZ7oQ6YIvw3W1CB9+GWomQXLzGelFcxoeKxSND3ScWFKx0sQ6irkjIo1o7hiGKFwU+CekApjhwhcN4vzFO+Yb5thjvchdxvTy1BuXouCiB5DI/UBrpAZGHTvgkV5af5m5IkjXxHnJUm0FfmShhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739319450; c=relaxed/simple;
	bh=hUqmZTGnYgD1NoGU3VOagwR8MHJD7bgO3mfv/sg7IaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HrSoEFqWJzpG9yPLkuB8FKSID+Y5wv5umpzH1HwF5G4KBwrkQTEV7fm3TNo6iE3HY0RtoCPkTSGzcGEsYwWE2WT3jW32hS3XqvvhWQz5MTWjDBC8F7KnMyBR+Z/+MYN2jZOimOxIa4C5QW2txPwCR5hWAw5SnsPS0llTL1ET44k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnTyJW/P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnTyJW/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739319448; x=1770855448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hUqmZTGnYgD1NoGU3VOagwR8MHJD7bgO3mfv/sg7IaU=;
  b=AnTyJW/PNCgphzu0PrUYbFR4xp+DbsacWEX2Hsb1K/afY9XfoIFWTJ0o
   TkkuHs4i7zaqqdaaBSCPf06QXSKySDwqSFfEmWlaXGlJrmsWJUwpbk31d
   NFyEEAkXmQIA5qVCfwlKkXuxAPCQJ9hdOyOkDrWjgGzoKmWXzBJfPw3tS
   JSCDxowz8xSLv158mjj9I1xPic8rpQw5tZ7KPo7u7L94wDDcUY0le3t2E
   aBMHnPgVtd/urjlkilYlP+9k41wZyWnkWRhUv0wS4xOgO1vNI8EmA1KDk
   8a8fAIGmVL42v3idkTovCvmTAL3mGaqa4h6AC1xju2lnQmbNUyVzhpSye
   A==;
X-CSE-ConnectionGUID: XNekkSlHSOOSfc9altLBvA==
X-CSE-MsgGUID: pHO+Qz+XQfCqCLwR3QLf5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="57495850"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="57495850"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 16:17:25 -0800
X-CSE-ConnectionGUID: 5K3SO2g7SnabmqNPB+UQAQ==
X-CSE-MsgGUID: SYsFrxmwQRmTyhYzsnlrVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="112488952"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Feb 2025 16:17:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ti0RN-0014s7-1L;
	Wed, 12 Feb 2025 00:17:21 +0000
Date: Wed, 12 Feb 2025 08:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: [linux-next:master 529/2407]
 drivers/gpu/drm/i915/display/intel_cmtg.c:96:17: error: arithmetic between
 different enumeration types ('enum transcoder' and 'enum
 intel_display_power_domain')
Message-ID: <202502120809.XfmcqkBD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df5d6180169ae06a2eac57e33b077ad6f6252440
commit: f14d81b7102bdbf062f90b3910e986850f5f86c2 [529/2407] drm/i915/cmtg: Disable the CMTG
config: x86_64-randconfig-005-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120809.XfmcqkBD-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120809.XfmcqkBD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120809.XfmcqkBD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_cmtg.c:12:
   In file included from ./gpu/drm/xe/compat-i915-headers/i915_drv.h:16:
   In file included from ./gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:10:
   In file included from gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:1644:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: error: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Werror,-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_cmtg.c:96:17: error: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Werror,-Wenum-enum-conversion]
      96 |         power_domain = POWER_DOMAIN_TRANSCODER(trans);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:126:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     126 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.


vim +96 drivers/gpu/drm/i915/display/intel_cmtg.c

    84	
    85	static bool intel_cmtg_transcoder_is_secondary(struct intel_display *display,
    86						       enum transcoder trans)
    87	{
    88		struct drm_i915_private *i915 = to_i915(display->drm);
    89		enum intel_display_power_domain power_domain;
    90		intel_wakeref_t wakeref;
    91		u32 val = 0;
    92	
    93		if (!HAS_TRANSCODER(display, trans))
    94			return false;
    95	
  > 96		power_domain = POWER_DOMAIN_TRANSCODER(trans);
    97	
    98		with_intel_display_power_if_enabled(i915, power_domain, wakeref)
    99			val = intel_de_read(display, TRANS_DDI_FUNC_CTL2(display, trans));
   100	
   101		return val & CMTG_SECONDARY_MODE;
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
