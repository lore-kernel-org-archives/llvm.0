Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDAE2451CC;
	Wed, 11 Dec 2024 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733892706; cv=none; b=HvIGMAEKPvapjYRXxC8r6wIsbwy8SHINdWeIhLqNxFjqxbgqQ8fskOiUoj1i+yjvRTBmZ6iyCXAQK5hxsJkSPYZrmJSwrigxSi0L3SFvYimv/zzciR8fE+TJevrk/cderk6V5QJop+0vX/Or3ULjfBifZoKOguq8RBKDyakSoS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733892706; c=relaxed/simple;
	bh=p4F6XJXcYkCbg1TF6HnIONvWETztV/yfLZMadBxVKe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgoMkuB2drNXyPSlVLCUO8+xdeoMK4w/Icv4E+i5fFC4lUhZ1BebKCjEINIe4wMRPu/LVQ9NQsUL4JaIPslvruMipa7ehx7sS6ZfZfCsf+GpAecj6j1FISdQiTU/MEGTIdnqqOaXjqgh0wrKdLAs68FM3XmzIfLXLHUxNZjqLgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUsuNzJ/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUsuNzJ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733892705; x=1765428705;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p4F6XJXcYkCbg1TF6HnIONvWETztV/yfLZMadBxVKe4=;
  b=nUsuNzJ/eUYaaNa5dY/OfJkprI+9sD3+PpjY+/7XmG/rc5uLatXUmRVj
   lSTF3Pga9edri4QG8NIl0Mqm8aH/gph+PTvbjbbnkuER5mKSCZRZyDLx3
   5Pd6Y0wcVpjs1kJvhU6WDEWh/C1j415xdMX7ERJLCBjIz+nttUpyRyyVH
   L+8vM2NBR6IRVZen+EEGqaz80sJMZCMiCGpPQlga1jU7+5Dd/T74+AEAS
   g4lFm4qB+lNI9xvUOL+QEzSK2zXY2sxj223af9uMcmJUxvxdJZ9j4MLxP
   r3Zo6Kfx7lmgxXSBjaZ5b73IB+cMDRGJ+B33RJ+pinO3Efq70Mlz/jMcw
   A==;
X-CSE-ConnectionGUID: lPUr7GrCTCOT7TlY/TDtAA==
X-CSE-MsgGUID: liQAnx01T2OmpGCqdOk1JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34505870"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="34505870"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 20:51:44 -0800
X-CSE-ConnectionGUID: CEhRHMpXTb21b1GkyLNyGQ==
X-CSE-MsgGUID: b1qqTJDUSXmckIVd2mjm8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="96104741"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2024 20:51:42 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLEhI-0006IN-0h;
	Wed, 11 Dec 2024 04:51:40 +0000
Date: Wed, 11 Dec 2024 12:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH v2] drm/i915/cx0_phy: Update HDMI TMDS C20 algorithm value
Message-ID: <202412111422.EkKTeLIL-lkp@intel.com>
References: <20241209153418.49580-1-dnyaneshwar.bhadane@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209153418.49580-1-dnyaneshwar.bhadane@intel.com>

Hi Dnyaneshwar,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20241209]
[also build test ERROR on linus/master v6.13-rc2]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.13-rc2 v6.13-rc1 v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dnyaneshwar-Bhadane/drm-i915-cx0_phy-Update-HDMI-TMDS-C20-algorithm-value/20241209-233928
base:   next-20241209
patch link:    https://lore.kernel.org/r/20241209153418.49580-1-dnyaneshwar.bhadane%40intel.com
patch subject: [PATCH v2] drm/i915/cx0_phy: Update HDMI TMDS C20 algorithm value
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20241211/202412111422.EkKTeLIL-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111422.EkKTeLIL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412111422.EkKTeLIL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_cx0_phy.c:13:
   In file included from drivers/gpu/drm/i915/display/intel_de.h:9:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:16:
   In file included from drivers/gpu/drm/xe/compat-i915-headers/intel_runtime_pm.h:10:
   In file included from drivers/gpu/drm/xe/xe_device_types.h:9:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2287:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_cx0_phy.c:2201:7: error: call to undeclared function 'IS_METEORLAKE_U'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2201 |                 if (IS_METEORLAKE_U(to_i915(display->drm)) ||
         |                     ^
>> drivers/gpu/drm/i915/display/intel_cx0_phy.c:2202:7: error: call to undeclared function 'IS_ARROWLAKE_U'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2202 |                     IS_ARROWLAKE_U(to_i915(display->drm)) ||
         |                     ^
   4 warnings and 2 errors generated.


vim +/IS_METEORLAKE_U +2201 drivers/gpu/drm/i915/display/intel_cx0_phy.c

  2177	
  2178	static u16 intel_c20_hdmi_tmds_tx_cgf_1(struct intel_crtc_state *crtc_state)
  2179	{
  2180		struct intel_display *display = to_intel_display(crtc_state);
  2181		struct pci_dev *pdev = NULL;
  2182		u16 tx_misc;
  2183		u16 tx_dcc_cal_dac_ctrl_range = 8;
  2184		u16 tx_term_ctrl;
  2185		u16 host_bridge_pci_dev_id;
  2186	
  2187		if (IS_BATTLEMAGE(to_i915(display->drm))) {
  2188			tx_misc = 0;
  2189			tx_term_ctrl = 2;
  2190		} else if (DISPLAY_VER(display) >= 20) {
  2191			tx_misc = 5;
  2192			tx_term_ctrl = 4;
  2193		} else if (IS_METEORLAKE(to_i915(display->drm))) {
  2194			/*
  2195			 * Some SoCs have the same drm PCI IDs, so differentiate based
  2196			 * on the host bridge device ID to use the correct txx_mics value.
  2197			 */
  2198			while ((pdev = pci_get_class(PCI_CLASS_BRIDGE_HOST << 8, pdev)))
  2199				host_bridge_pci_dev_id = pdev->device;
  2200	
> 2201			if (IS_METEORLAKE_U(to_i915(display->drm)) ||
> 2202			    IS_ARROWLAKE_U(to_i915(display->drm)) ||
  2203			    (pdev && IS_ARROWLAKE_S_BY_HOST_BRIDGE_ID(host_bridge_pci_dev_id))) {
  2204				tx_misc = 3;
  2205			} else {
  2206				tx_misc = 7;
  2207			}
  2208	
  2209			tx_term_ctrl = 2;
  2210		}
  2211		return (C20_PHY_TX_MISC(tx_misc) |
  2212			C20_PHY_TX_DCC_CAL_RANGE(tx_dcc_cal_dac_ctrl_range) |
  2213			C20_PHY_TX_DCC_BYPASS | C20_PHY_TX_TERM_CTL(tx_term_ctrl));
  2214	}
  2215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
