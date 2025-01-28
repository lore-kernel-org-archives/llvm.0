Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150919CC11;
	Tue, 28 Jan 2025 11:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738064917; cv=none; b=eIoXth2yAH8xhm1Y11BgzdWheoQo+nuLko5rIC/QfXsOxcY4+EXJZK0HuyBfV4MWnk7RSyvzF/2172WrmYAaMvFa0gxB5mgCCywE52/hd9QaR5r8OybONUtHbYE/zzSHdwxfI62cTnYTaeMmhW97/RfdTX9v3K8KdTA5HkzSIrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738064917; c=relaxed/simple;
	bh=SyGeKYJrSl+oGTvLZakuLvo0f78OL9DWlOMkv6YSD9Y=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lZjIXB0PqZV/FGIwkxtcJ4BAyedpXo+hb+YBVirBBLf1qhqDRpIYhWC29oIejErJjmggdSOSeXAcpIncqq+vo+7AefXTj1GgCWZJokMV4zMyBXzZ4hvMyGSaEpgoNow7J+//0uOyJz7fvU3aUC6G4ZQzhmEbSdfx58ywR7rS/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kMeHUoB4; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kMeHUoB4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738064916; x=1769600916;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SyGeKYJrSl+oGTvLZakuLvo0f78OL9DWlOMkv6YSD9Y=;
  b=kMeHUoB4v4gbgG+uCCMIAU73Y9MUV47kGQNj+t1LQlUiBmy2kcT3iJV5
   6WCgWcCkzMnfb9lh0bEh/Df4hj3HCzKNXm2xAuI89vLVZepETRABr8f+V
   N8P3sv4C40UnpFtMm5JzPkwwne0IIDWovhchW79c5303EhiwIY+jNI6vi
   AwpwaJA83rGZrQruixUtNKrIwlIRc3uI00M1OH2l7SKcbD5r+ZUUdDT95
   3Tus3szmTfYRptz5OH55kkI8Ktqjq/7EuPMsSNPSlAY+Srh7ban8K7j0R
   p1qej9a47fbAk8f2TsOAlAtCKVZvEJasRcD/aa79laRtawKTMKPOLehO8
   A==;
X-CSE-ConnectionGUID: DM/stJAUScaOoI+DPyOUfg==
X-CSE-MsgGUID: qRkY4wO6T0W8SPTnjS1bkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="38717975"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; 
   d="scan'208";a="38717975"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 03:48:34 -0800
X-CSE-ConnectionGUID: zKPPy+fLTVi1+0V9cfjKHw==
X-CSE-MsgGUID: 8Cq+Q+n9RROPesnPpmoPfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109639669"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Jan 2025 03:48:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tck50-000hjj-35;
	Tue, 28 Jan 2025 11:48:30 +0000
Date: Tue, 28 Jan 2025 19:47:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [drm-i915:drm-intel-next 1/1]
 drivers/gpu/drm/i915/display/intel_cmtg.c:96:17: warning: arithmetic between
 different enumeration types ('enum transcoder' and 'enum
 intel_display_power_domain')
Message-ID: <202501281927.MbHLTsgX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

TO: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Ville Syrjälä" <ville.syrjala@linux.intel.com>

tree:   https://gitlab.freedesktop.org/drm/i915/kernel drm-intel-next
head:   2e0727c347467775a2dfa7d850a3a029f3212e58
commit: f14d81b7102bdbf062f90b3910e986850f5f86c2 [1/1] drm/i915/cmtg: Disable the CMTG
config: i386-buildonly-randconfig-001-20250128 (https://download.01.org/0day-ci/archive/20250128/202501281927.MbHLTsgX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250128/202501281927.MbHLTsgX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501281927.MbHLTsgX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_cmtg.c:12:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:16:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_cmtg.c:96:17: warning: arithmetic between different enumeration types ('enum transcoder' and 'enum intel_display_power_domain') [-Wenum-enum-conversion]
      96 |         power_domain = POWER_DOMAIN_TRANSCODER(trans);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_power.h:126:10: note: expanded from macro 'POWER_DOMAIN_TRANSCODER'
     126 |          (tran) + POWER_DOMAIN_TRANSCODER_A)
         |          ~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


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
