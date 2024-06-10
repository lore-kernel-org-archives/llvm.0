Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3914A953;
	Mon, 10 Jun 2024 15:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718033389; cv=none; b=preeJVsxwZXgZa7nSux08LZUJGJWc8Nt2aRYOUkPuTWXSPCijunh8HHo/ZFz7Vo1ZPjHK2it9o5c63MNGRoL+XJ21Qr52VkuLGOnDdyakpRwVnL2yx+aaagVDN12QRb4XsP4K9drEi2h5mIcaTByZIgz0/99C79y7M0kDrGMGic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718033389; c=relaxed/simple;
	bh=2cYIhjK3LKBBSwrb0AXwqoDXXNmiC/tJXjswEtFgv+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WS95X5xETjHPe18D00jTpnQ1kYg+xUM9VSRZA9y9Nv+NUSWYvhoFPl/rlf6ff2tXob9YpnEg5brQb0gosC1HWoaqX+Yxl8HTaAmmCKXxINK+G7KoGia8YBByOuRISJcJzwffSlatVXCQxU8r02HD/X2f5zeNr6yeyfHX39fb5tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWO3MZKu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWO3MZKu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718033387; x=1749569387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2cYIhjK3LKBBSwrb0AXwqoDXXNmiC/tJXjswEtFgv+o=;
  b=SWO3MZKuFICs7xCZ0+E6J+jSqkBs86o2aCxEpcdWrIiW0FyVoAzxB6WB
   gcW9QIMDNoL7EFs5fltjy0uFX8JG6uUfZ5kDUpjePUwo2FF02EtnBKFl7
   56mtKW7vlRdpcMlwWV2g03xMyRDW9dJG7cErqFyCd3Z51rRdvEt/MLuFw
   sLx55cdfx2ilQm0o1c3UVcbTcRxt22fGCrfIgI5/h3/C+OMcp0oBgJLTP
   G1+k3nfJhoPavKKebXK6cUj9RD8Gzx1s91DZYrLk1XTThsLKVgtMmc9DT
   3d9SDItN9pwInGckaa+frJoL2of9ovFDHZKqgsGiBWgFGX+2+ekRQj7AM
   g==;
X-CSE-ConnectionGUID: eNWWBBnmTMm0Us3LG5Gxfw==
X-CSE-MsgGUID: tU+5MYBqRFiRJEYKwjpPBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14531195"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="14531195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 08:29:47 -0700
X-CSE-ConnectionGUID: eyHY1jcsSbu69rR9xA27BA==
X-CSE-MsgGUID: UOSLG/UcTOe7feqUXI1LZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="39020444"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Jun 2024 08:29:45 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGgxq-0002Fd-2r;
	Mon, 10 Jun 2024 15:29:42 +0000
Date: Mon, 10 Jun 2024 23:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maxime Ripard <mripard@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH] drm/connector: hdmi: Fix kerneldoc warnings
Message-ID: <202406102334.csOl5G2p-lkp@intel.com>
References: <20240610111200.428224-1-mripard@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240610111200.428224-1-mripard@kernel.org>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on drm-tip/drm-tip]
[cannot apply to linus/master v6.10-rc3 next-20240607]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/drm-connector-hdmi-Fix-kerneldoc-warnings/20240610-191427
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20240610111200.428224-1-mripard%40kernel.org
patch subject: [PATCH] drm/connector: hdmi: Fix kerneldoc warnings
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240610/202406102334.csOl5G2p-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 4403cdbaf01379de96f8d0d6ea4f51a085e37766)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240610/202406102334.csOl5G2p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406102334.csOl5G2p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/radeon/radeon_drv.c:36:
   In file included from include/linux/vga_switcheroo.h:34:
   In file included from include/linux/fb.h:5:
   In file included from include/uapi/linux/fb.h:6:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/radeon/radeon_drv.c:46:
   In file included from include/drm/drm_probe_helper.h:6:
   In file included from include/drm/drm_modes.h:33:
>> include/drm/drm_connector.h:992:2: error: expected ';' after struct
     992 | }
         |  ^
         |  ;
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:3:60: note: expanded from macro 'radeon_PCI_IDS'
       3 |         {0x1002, 0x1304, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:4:60: note: expanded from macro 'radeon_PCI_IDS'
       4 |         {0x1002, 0x1305, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:5:60: note: expanded from macro 'radeon_PCI_IDS'
       5 |         {0x1002, 0x1306, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:6:60: note: expanded from macro 'radeon_PCI_IDS'
       6 |         {0x1002, 0x1307, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:7:60: note: expanded from macro 'radeon_PCI_IDS'
       7 |         {0x1002, 0x1309, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:8:60: note: expanded from macro 'radeon_PCI_IDS'
       8 |         {0x1002, 0x130A, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:9:60: note: expanded from macro 'radeon_PCI_IDS'
       9 |         {0x1002, 0x130B, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:10:60: note: expanded from macro 'radeon_PCI_IDS'
      10 |         {0x1002, 0x130C, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:11:60: note: expanded from macro 'radeon_PCI_IDS'
      11 |         {0x1002, 0x130D, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:12:60: note: expanded from macro 'radeon_PCI_IDS'
      12 |         {0x1002, 0x130E, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_IS_MOBILITY|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:13:60: note: expanded from macro 'radeon_PCI_IDS'
      13 |         {0x1002, 0x130F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:14:60: note: expanded from macro 'radeon_PCI_IDS'
      14 |         {0x1002, 0x1310, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:15:60: note: expanded from macro 'radeon_PCI_IDS'
      15 |         {0x1002, 0x1311, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:16:60: note: expanded from macro 'radeon_PCI_IDS'
      16 |         {0x1002, 0x1312, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:17:60: note: expanded from macro 'radeon_PCI_IDS'
      17 |         {0x1002, 0x1313, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
     251 |         radeon_PCI_IDS
         |         ^~~~~~~~~~~~~~
   include/drm/drm_pciids.h:18:60: note: expanded from macro 'radeon_PCI_IDS'
      18 |         {0x1002, 0x1315, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_KAVERI|RADEON_NEW_MEMMAP|RADEON_IS_IGP}, \
         |                                                        ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/radeon/radeon_drv.c:251:2: warning: bitwise operation between different enumeration types ('enum radeon_family' and 'enum radeon_chip_flags') [-Wenum-enum-conversion]
--
   In file included from drivers/gpu/drm/radeon/radeon_device.c:30:
   In file included from include/linux/efi.h:20:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/radeon/radeon_device.c:42:
   In file included from include/drm/drm_probe_helper.h:6:
   In file included from include/drm/drm_modes.h:33:
>> include/drm/drm_connector.h:992:2: error: expected ';' after struct
     992 | }
         |  ^
         |  ;
   In file included from drivers/gpu/drm/radeon/radeon_device.c:48:
   In file included from drivers/gpu/drm/radeon/atom.h:165:
   In file included from drivers/gpu/drm/radeon/atombios.h:7980:
   drivers/gpu/drm/radeon/pptable.h:442:5: warning: 'counted_by' should not be applied to an array with element of unknown size because 'ATOM_PPLIB_STATE_V2' (aka 'struct _ATOM_PPLIB_STATE_V2') is a struct type with a flexible array member. This will be an error in a future compiler version [-Wbounds-safety-counted-by-elt-type-unknown-size]
     442 |     ATOM_PPLIB_STATE_V2 states[] __counted_by(ucNumEntries);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 1 error generated.
--
   In file included from drivers/gpu/drm/radeon/radeon_asic.c:30:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/radeon/radeon_asic.c:35:
   In file included from drivers/gpu/drm/radeon/atom.h:165:
   In file included from drivers/gpu/drm/radeon/atombios.h:7980:
   drivers/gpu/drm/radeon/pptable.h:442:5: warning: 'counted_by' should not be applied to an array with element of unknown size because 'ATOM_PPLIB_STATE_V2' (aka 'struct _ATOM_PPLIB_STATE_V2') is a struct type with a flexible array member. This will be an error in a future compiler version [-Wbounds-safety-counted-by-elt-type-unknown-size]
     442 |     ATOM_PPLIB_STATE_V2 states[] __counted_by(ucNumEntries);
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/radeon/radeon_asic.c:36:
   In file included from drivers/gpu/drm/radeon/radeon.h:85:
   In file included from drivers/gpu/drm/radeon/radeon_mode.h:33:
   In file included from include/drm/display/drm_dp_helper.h:30:
>> include/drm/drm_connector.h:992:2: error: expected ';' after struct
     992 | }
         |  ^
         |  ;
   2 warnings and 1 error generated.
--
   In file included from drivers/gpu/drm/radeon/radeon_kms.c:29:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpu/drm/radeon/radeon_kms.c:39:
   In file included from drivers/gpu/drm/radeon/radeon.h:85:
   In file included from drivers/gpu/drm/radeon/radeon_mode.h:33:
   In file included from include/drm/display/drm_dp_helper.h:30:
>> include/drm/drm_connector.h:992:2: error: expected ';' after struct
     992 | }
         |  ^
         |  ;
   1 warning and 1 error generated.


vim +992 include/drm/drm_connector.h

   931	
   932	/*
   933	 * struct drm_connector_hdmi_state - HDMI state container
   934	 */
   935	struct drm_connector_hdmi_state {
   936		/**
   937		 * @broadcast_rgb: Connector property to pass the
   938		 * Broadcast RGB selection value.
   939		 */
   940		enum drm_hdmi_broadcast_rgb broadcast_rgb;
   941	
   942		/**
   943		 * @infoframes: HDMI Infoframes matching that state
   944		 */
   945		struct {
   946			/**
   947			 * @avi: AVI Infoframes structure matching our
   948			 * state.
   949			 */
   950			struct drm_connector_hdmi_infoframe avi;
   951	
   952			/**
   953			 * @hdr_drm: DRM (Dynamic Range and Mastering)
   954			 * Infoframes structure matching our state.
   955			 */
   956			struct drm_connector_hdmi_infoframe hdr_drm;
   957	
   958			/**
   959			 * @spd: SPD Infoframes structure matching our
   960			 * state.
   961			 */
   962			struct drm_connector_hdmi_infoframe spd;
   963	
   964			/**
   965			 * @vendor: HDMI Vendor Infoframes structure
   966			 * matching our state.
   967			 */
   968			struct drm_connector_hdmi_infoframe hdmi;
   969		} infoframes;
   970	
   971		/**
   972		 * @is_limited_range: Is the output supposed to use a limited
   973		 * RGB Quantization Range or not?
   974		 */
   975		bool is_limited_range;
   976	
   977		/**
   978		 * @output_bpc: Bits per color channel to output.
   979		 */
   980		unsigned int output_bpc;
   981	
   982		/**
   983		 * @output_format: Pixel format to output in.
   984		 */
   985		enum hdmi_colorspace output_format;
   986	
   987		/**
   988		 * @tmds_char_rate: TMDS Character Rate, in Hz.
   989		 */
   990		unsigned long long tmds_char_rate;
   991	
 > 992	}
   993	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
