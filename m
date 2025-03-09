Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ABF1E492;
	Sun,  9 Mar 2025 00:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741480501; cv=none; b=WXRbEK94+OHk47FH3jhIuht4qBpeH2rjiJGRVtzL6mAIM6OH8/Akj01/esR745Xjrm9m+MgMEo+fWokPct6QcyQQoQnVIkpO+PXGc+dv7Bhb0sckS1btWEnuo8yIDedBoL5JSOakDybyfwl8ltMBl9hGJuVJbpuFm2YwJqSGa1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741480501; c=relaxed/simple;
	bh=XRGPFETcw4gj9jOoRutNuL18GA8xFluq7s7/RhcxKMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=beTCnZmxqIGqfNEZNCbFpn4+C1NliPnfs/f5/2rODtSaXoB3yDZ4vjwMWQH1NZCkA7/md4ljLcDJ5WcayFzgMd3zLbQ3FHd2OPTXQ8MScU8iqQAXfY6QchXLcTM479PewpUqrdbAjHU9GdtMM9JworpnYKFSQUFGYfMwGv68V9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAKDKAJo; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAKDKAJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741480499; x=1773016499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XRGPFETcw4gj9jOoRutNuL18GA8xFluq7s7/RhcxKMk=;
  b=eAKDKAJogC1c0wM5rcQsjGSNZz6cXMcIU+vwFJi4lH2PbwyCHx9f2MCT
   +fcXxhItE0he1LtJfmoL8eQ7cVTEkGtf6GAe5kUGJ9HCKBpjCBvehlCDE
   75YpCTb8Ynyi3TX8Ro+cSU5JTPjY7+p33/lrOrGP/n9Ip6k00Grg7Dn3l
   8KqT3z3BGrVOSUjwCAAGfhMpfgNtNZ5LQuX9vQ9vvZkSGxSwIIDz+Oj5Z
   eAzHjcbmOlETm0ztZHL+Ky+SV+sWpyFcojJvI/trrif31dcyTAqEWT1MC
   zA0wE/dbD8RkRCrPV8ryZDSbO0TgkkK73hQf94tl3JHCWifFKAcIZ2poW
   w==;
X-CSE-ConnectionGUID: WG8+o/xBQHeS9ORBkZGeIQ==
X-CSE-MsgGUID: EcfxBa7zSKuP/KlCC/eWWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="42721293"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="42721293"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 16:34:58 -0800
X-CSE-ConnectionGUID: 2f9eh9e3SYqxZATKkygyKw==
X-CSE-MsgGUID: V3BgS5ROTa6iOJyoqWci5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="124912062"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 08 Mar 2025 16:34:56 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tr4d4-0002Uc-10;
	Sun, 09 Mar 2025 00:34:54 +0000
Date: Sun, 9 Mar 2025 08:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [superm1:superm1/brightness-changes-6.15 3/7]
 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4694:6: error:
 use of undeclared identifier 'caps'
Message-ID: <202503090846.qpfiW2ZL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/superm1/linux.git superm1/brightness-changes-6.15
head:   e1a5d02a5851574c4f09e3d483c473555e69a453
commit: 88e76b926b193764694367e3411d004d5db78ccb [3/7] drm/amd/display: Avoid operating on copies of backlight caps
config: x86_64-buildonly-randconfig-002-20250308 (https://download.01.org/0day-ci/archive/20250309/202503090846.qpfiW2ZL-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503090846.qpfiW2ZL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503090846.qpfiW2ZL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:29:
   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/os_types.h:31:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:446:63: warning: arithmetic between different enumeration types ('enum dc_irq_source' and 'enum irq_type') [-Wenum-enum-conversion]
     446 |         amdgpu_crtc = get_crtc_by_otg_inst(adev, irq_params->irq_src - IRQ_TYPE_PFLIP);
         |                                                  ~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:543:57: warning: arithmetic between different enumeration types ('enum dc_irq_source' and 'enum irq_type') [-Wenum-enum-conversion]
     543 |         acrtc = get_crtc_by_otg_inst(adev, irq_params->irq_src - IRQ_TYPE_VUPDATE);
         |                                            ~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:607:57: warning: arithmetic between different enumeration types ('enum dc_irq_source' and 'enum irq_type') [-Wenum-enum-conversion]
     607 |         acrtc = get_crtc_by_otg_inst(adev, irq_params->irq_src - IRQ_TYPE_VBLANK);
         |                                            ~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4694:6: error: use of undeclared identifier 'caps'
    4694 |         if (caps->aux_support)
         |             ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4697:2: error: use of undeclared identifier 'caps'
    4697 |         caps->min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
         |         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4698:2: error: use of undeclared identifier 'caps'
    4698 |         caps->max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
         |         ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:4699:2: error: use of undeclared identifier 'caps'
    4699 |         caps->caps_valid = true;
         |         ^
   5 warnings and 4 errors generated.


vim +/caps +4694 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c

  4662	
  4663	static void amdgpu_dm_update_backlight_caps(struct amdgpu_display_manager *dm,
  4664						    int bl_idx)
  4665	{
  4666	#if defined(CONFIG_ACPI)
  4667		struct amdgpu_dm_backlight_caps *caps = &dm->backlight_caps[bl_idx];
  4668	
  4669		if (caps->caps_valid)
  4670			return;
  4671	
  4672		amdgpu_acpi_get_backlight_caps(caps);
  4673	
  4674		/* validate the firmware value is sane */
  4675		if (caps->caps_valid) {
  4676			int spread = caps->max_input_signal - caps->min_input_signal;
  4677	
  4678			if (caps->max_input_signal > AMDGPU_DM_DEFAULT_MAX_BACKLIGHT ||
  4679			    caps->min_input_signal < 0 ||
  4680			    spread > AMDGPU_DM_DEFAULT_MAX_BACKLIGHT ||
  4681			    spread < AMDGPU_DM_MIN_SPREAD) {
  4682				DRM_DEBUG_KMS("DM: Invalid backlight caps: min=%d, max=%d\n",
  4683					      caps->min_input_signal, caps->max_input_signal);
  4684				caps->caps_valid = false;
  4685			}
  4686		}
  4687	
  4688		if (!caps->caps_valid) {
  4689			caps->min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
  4690			caps->max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
  4691			caps->caps_valid = true;
  4692		}
  4693	#else
> 4694		if (caps->aux_support)
  4695			return;
  4696	
  4697		caps->min_input_signal = AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
  4698		caps->max_input_signal = AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
  4699		caps->caps_valid = true;
  4700	#endif
  4701	}
  4702	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
