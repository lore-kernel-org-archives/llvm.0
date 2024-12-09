Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC85E15C120;
	Mon,  9 Dec 2024 04:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718926; cv=none; b=ktCrZ/xR6ATutPi0G8CE5XQRAEhWPbPC9//Rr+YMNj70vjK7lwvln/sVCdoYBKXHIv77tBxnMe80d984OlvyvnSCyyo/gas2s4I4TInQysrQl+C4/JWaNnkXL/scFBfGWmgklpb4EbDWC9lw38UHenYB/hn2HOz1SGO9tK7VhEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718926; c=relaxed/simple;
	bh=XqNpv2IE/nUOzmK3PBJlRgK/a9JryImk6FVyJoa8hGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h3/ovs1ryR4g+ZAzqi/3pv0nevrQqVNIpPohTN9IdSPbM0qQzPmkEKLG5mUVzlzwL967QXfk6l3jJcGOhU3x2E+BtKRoxbL7bVOBkkpTBdQioUH1y/BIXXHrVl0sX9j5+TnXwe3z4Kn6yRyALJZwcz4JgDt3m+1BfCNV2LjZPAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTW6FBcz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTW6FBcz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718925; x=1765254925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XqNpv2IE/nUOzmK3PBJlRgK/a9JryImk6FVyJoa8hGs=;
  b=KTW6FBcz4ZjUrhC8j1vu1U/Rv+V9DtO4TP612dp4jXV8Lqc+rV6iE5ko
   CLOK4sh2y0hcxl9j5PpsKSkaHkAOJ7C5sxzZn/aL4VzNl3JeeAwJviAbs
   iwbDITBf96Krp0e1NMzwIS3/aM0vlG9xBs33q10emXW6Sobi/Y/5fSujB
   SQLaEU2qM92qzAk+ryHEXrLRmHY6BcQ4W9LFT2JYqjfCp+gFvKVxn14EM
   9rwW569dVfxRRK95JRRDf8l0g3GkHeG6fRGb70C+4JVyGAUdffTjYvhrf
   K8D31PXyWWb+5HQPfF2IfCBv2xMtL079Mil/Kk4RNQilBFGWL2A6Txyhp
   w==;
X-CSE-ConnectionGUID: +oTXoPLgRLuuTiOroCTpgg==
X-CSE-MsgGUID: n2hLVSPYRX2BnrTvJwOSbw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34237096"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34237096"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:35:24 -0800
X-CSE-ConnectionGUID: tbBIyH9LSXC5EAsmqIgT+Q==
X-CSE-MsgGUID: smKqU5VtRtOHvJ/Die40Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="125844586"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Dec 2024 20:35:22 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVUO-0003sh-1C;
	Mon, 09 Dec 2024 04:35:20 +0000
Date: Mon, 9 Dec 2024 12:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2260/2462]
 drivers/gpu/drm/xe/xe_gt_idle.c:127:33: error: static assertion expression
 is not an integral constant expression
Message-ID: <202412080849.sPp82jSi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
commit: 86c4e589d5c8fbb5092de0052b89402e86706515 [2260/2462] build_bug.h: more user friendly error messages in BUILD_BUG_ON_ZERO()
config: s390-randconfig-001-20241208 (https://download.01.org/0day-ci/archive/20241208/202412080849.sPp82jSi-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080849.sPp82jSi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080849.sPp82jSi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/xe/xe_gt_idle.c:127:33: error: static assertion expression is not an integral constant expression
                           gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/regs/xe_gt_regs.h:342:40: note: expanded from macro 'VDN_HCP_POWERGATE_ENABLE'
   #define   VDN_HCP_POWERGATE_ENABLE(n)           REG_BIT(3 + 2 * (n))
                                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   drivers/gpu/drm/xe/xe_gt_idle.c:128:12: error: static assertion expression is not an integral constant expression
                                                        VDN_MFXVDENC_POWERGATE_ENABLE(j));
                                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/regs/xe_gt_regs.h:343:44: note: expanded from macro 'VDN_MFXVDENC_POWERGATE_ENABLE'
   #define   VDN_MFXVDENC_POWERGATE_ENABLE(n)      REG_BIT(4 + 2 * (n))
                                                   ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   2 errors generated.
--
>> drivers/gpu/drm/xe/xe_reg_whitelist.c:139:22: error: static assertion expression is not an integral constant expression
           range_start = reg & REG_GENMASK(25, range_bit);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:49:9: note: expanded from macro 'REG_GENMASK'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   drivers/gpu/drm/xe/xe_reg_whitelist.c:140:28: error: static assertion expression is not an integral constant expression
           range_end = range_start | REG_GENMASK(range_bit, 0);
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:49:9: note: expanded from macro 'REG_GENMASK'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__high) &&      \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   2 errors generated.
--
>> drivers/gpu/drm/xe/xe_irq.c:303:22: error: static assertion expression is not an integral constant expression
                   if (!(master_ctl & GT_DW_IRQ(bank)))
                                      ^~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/regs/xe_irq_regs.h:22:27: note: expanded from macro 'GT_DW_IRQ'
   #define   GT_DW_IRQ(x)                          REG_BIT(x)
                                                   ^~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   drivers/gpu/drm/xe/xe_irq.c:436:26: error: static assertion expression is not an integral constant expression
                   if ((master_tile_ctl & DG1_MSTR_TILE(tile->id)) == 0)
                                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/regs/xe_irq_regs.h:16:30: note: expanded from macro 'DG1_MSTR_TILE'
   #define   DG1_MSTR_TILE(t)                      REG_BIT(t)
                                                   ^~~~~~~~~~
   drivers/gpu/drm/xe/compat-i915-headers/../../i915/i915_reg_defs.h:22:9: note: expanded from macro 'REG_BIT'
                  BUILD_BUG_ON_ZERO(__is_constexpr(__n) &&         \
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:16:35: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e, ...) __BUILD_BUG_ON_ZERO(e, ##__VA_ARGS__, #e)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:17:37: note: expanded from macro '__BUILD_BUG_ON_ZERO'
   #define __BUILD_BUG_ON_ZERO(e, msg) __BUILD_BUG_ON_ZERO_MSG(e, msg " is true")
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:245:77: note: expanded from macro '__BUILD_BUG_ON_ZERO_MSG'
   #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
                                                                               ^~~~
   2 errors generated.


vim +127 drivers/gpu/drm/xe/xe_gt_idle.c

1c2097bbde107e drivers/gpu/drm/xe/xe_gt_idle_sysfs.c Riana Tauro           2023-06-23   97  
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24   98  void xe_gt_idle_enable_pg(struct xe_gt *gt)
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24   99  {
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  100  	struct xe_device *xe = gt_to_xe(gt);
c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  101  	struct xe_gt_idle *gtidle = &gt->gtidle;
50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  102  	struct xe_mmio *mmio = &gt->mmio;
c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  103  	u32 vcs_mask, vecs_mask;
a66c19895396e6 drivers/gpu/drm/xe/xe_gt_idle.c       Himal Prasad Ghimiray 2024-10-14  104  	unsigned int fw_ref;
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  105  	int i, j;
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  106  
ecab82af278733 drivers/gpu/drm/xe/xe_gt_idle.c       Michal Wajdeczko      2024-06-19  107  	if (IS_SRIOV_VF(xe))
ecab82af278733 drivers/gpu/drm/xe/xe_gt_idle.c       Michal Wajdeczko      2024-06-19  108  		return;
ecab82af278733 drivers/gpu/drm/xe/xe_gt_idle.c       Michal Wajdeczko      2024-06-19  109  
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  110  	/* Disable CPG for PVC */
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  111  	if (xe->info.platform == XE_PVC)
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  112  		return;
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  113  
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  114  	xe_device_assert_mem_access(gt_to_xe(gt));
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  115  
c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  116  	vcs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_DECODE);
c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  117  	vecs_mask = xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_VIDEO_ENHANCE);
c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  118  
c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  119  	if (vcs_mask || vecs_mask)
c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  120  		gtidle->powergate_enable = MEDIA_POWERGATE_ENABLE;
c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  121  
c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  122  	if (!xe_gt_is_media_type(gt))
c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06  123  		gtidle->powergate_enable |= RENDER_POWERGATE_ENABLE;
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  124  
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  125  	for (i = XE_HW_ENGINE_VCS0, j = 0; i <= XE_HW_ENGINE_VCS7; ++i, ++j) {
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  126  		if ((gt->info.engine_mask & BIT(i)))
c2bf07dd0bbce1 drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-09-06 @127  			gtidle->powergate_enable |= (VDN_HCP_POWERGATE_ENABLE(j) |
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  128  						     VDN_MFXVDENC_POWERGATE_ENABLE(j));
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  129  	}
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  130  
a66c19895396e6 drivers/gpu/drm/xe/xe_gt_idle.c       Himal Prasad Ghimiray 2024-10-14  131  	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  132  	if (xe->info.skip_guc_pc) {
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  133  		/*
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  134  		 * GuC sets the hysteresis value when GuC PC is enabled
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  135  		 * else set it to 25 (25 * 1.28us)
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  136  		 */
50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  137  		xe_mmio_write32(mmio, MEDIA_POWERGATE_IDLE_HYSTERESIS, 25);
50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  138  		xe_mmio_write32(mmio, RENDER_POWERGATE_IDLE_HYSTERESIS, 25);
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  139  	}
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  140  
50089a9534e258 drivers/gpu/drm/xe/xe_gt_idle.c       Matt Roper            2024-09-10  141  	xe_mmio_write32(mmio, POWERGATE_ENABLE, gtidle->powergate_enable);
a66c19895396e6 drivers/gpu/drm/xe/xe_gt_idle.c       Himal Prasad Ghimiray 2024-10-14  142  	xe_force_wake_put(gt_to_fw(gt), fw_ref);
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  143  }
38e8c4184ea0ee drivers/gpu/drm/xe/xe_gt_idle.c       Riana Tauro           2024-05-24  144  

:::::: The code at line 127 was first introduced by commit
:::::: c2bf07dd0bbce1f318b73b525e21fbc6d67a3a94 drm/xe/xe_gt_idle: modify powergate enable condition

:::::: TO: Riana Tauro <riana.tauro@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
