Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1FF2F852;
	Thu, 20 Feb 2025 00:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740012263; cv=none; b=XLmFijGsusDFNCBpQuM1yvBPhMdoYHFjMHt/1cctF4WuZ6HvGlFXD7hy4vKdmRCkYFHPrRlniCv02Yo3Rvd1+9Czx90ojXd9o0HSydHIliKRxUp9VYwpeW1se9agCWWiAcZe/DKZpmUb+APBgjIltgF/OQkJLsVnoCggxhr5meM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740012263; c=relaxed/simple;
	bh=hC7w/ueXz1ar21mfEcIIPDDMtbUij9k8b7g/Dp7FSu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HY2AY6s1MkOIquVj+nbVw+PtMUcF8sHVE5psHjCz7vRSmxKc0ro2rgRDOaFIMJh4kWfqS59VaTt3xuII2k/f65zkzwj70KYnLlWLJ1y3fD6v6YcrqQs3izCUk/0t61nRjD+kehxlzkWKxzpgTyJ7xQ85uTptlIiaC0cPfbl8O7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aF+ooXwc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aF+ooXwc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740012262; x=1771548262;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hC7w/ueXz1ar21mfEcIIPDDMtbUij9k8b7g/Dp7FSu8=;
  b=aF+ooXwcnu4RvczHU4cUNs4ThW5DG1fTygCm5LGJpNpa6j6Wy8n1FclV
   2V3xJpKA4B8VYAqcNVaV3n3pH1L5XnfAfVjs5YbRyQ1RH1nYpCgcY9u+U
   CjaiBAp4qUiHzxLWSJOf9HjaZR1S+yk31OWrlN1Ll6DK5CUchuvI3cTBy
   wzfQiD3H/XE+plW8GhxYViJ8hbdqwLSLC9i4fl3n6wjvx5BPXNvse4eaT
   qTw6zikB22LFvx3HU/vkcRE8wk8JzmQe1M2jvK5KmvKI2Gk4F7Zgbi3E/
   CCmKZSsny98sode3JD6qBUp3ZOoOGW5yc//GRtdlrqeo4Q4M+HrXdhrXJ
   g==;
X-CSE-ConnectionGUID: jfP8e9gPRS+dxezXiZd5Pg==
X-CSE-MsgGUID: viFTacSaQjW7eyzAcRRvpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="43604683"
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="43604683"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 16:44:21 -0800
X-CSE-ConnectionGUID: JNzdxpTERAmFE7vg+W2FRg==
X-CSE-MsgGUID: rqA02sHPTu2v1yaslifJmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,300,1732608000"; 
   d="scan'208";a="119866693"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Feb 2025 16:44:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkufp-0003h9-1o;
	Thu, 20 Feb 2025 00:44:17 +0000
Date: Thu, 20 Feb 2025 08:43:33 +0800
From: kernel test robot <lkp@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 5/6] drm/i915/display: Add registers and compute the
 strength
Message-ID: <202502200838.vQNIR4Ee-lkp@intel.com>
References: <20250219115359.2320992-6-nemesa.garg@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250219115359.2320992-6-nemesa.garg@intel.com>

Hi Nemesa,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250219]
[cannot apply to drm-xe/drm-xe-next drm-exynos/exynos-drm-next linus/master v6.14-rc3 v6.14-rc2 v6.14-rc1 v6.14-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-Introduce-sharpness-strength-property/20250219-200229
base:   next-20250219
patch link:    https://lore.kernel.org/r/20250219115359.2320992-6-nemesa.garg%40intel.com
patch subject: [PATCH v8 5/6] drm/i915/display: Add registers and compute the strength
config: i386-buildonly-randconfig-004-20250219 (https://download.01.org/0day-ci/archive/20250220/202502200838.vQNIR4Ee-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200838.vQNIR4Ee-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200838.vQNIR4Ee-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_casf.c:9:
   In file included from drivers/gpu/drm/i915/display/intel_de.h:10:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:16:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2287:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_casf.c:97:19: warning: result of comparison of constant 2073600 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
      97 |         if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
         |             ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_casf.c:99:24: warning: result of comparison of constant 8294400 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
      99 |         else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
         |                  ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_casf.c:111:73: error: no member named 'strength' in 'struct intel_casf'
     111 |         sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
         |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/i915/display/intel_casf_regs.h:23:69: note: expanded from macro 'FILTER_STRENGTH'
      23 | #define   FILTER_STRENGTH(x)            REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
         |                                                                               ^
   drivers/gpu/drm/i915/i915_reg_defs.h:99:28: note: expanded from macro 'REG_FIELD_PREP'
      99 |         ((u32)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +     \
         |                                   ^~~~~
   drivers/gpu/drm/i915/display/intel_casf.c:111:73: error: no member named 'strength' in 'struct intel_casf'
     111 |         sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
         |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/i915/display/intel_casf_regs.h:23:69: note: expanded from macro 'FILTER_STRENGTH'
      23 | #define   FILTER_STRENGTH(x)            REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
         |                                                                               ^
   drivers/gpu/drm/i915/i915_reg_defs.h:103:64: note: expanded from macro 'REG_FIELD_PREP'
     103 |                BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))
         |                                                                       ^~~~~
   include/linux/compiler.h:328:48: note: expanded from macro '__is_constexpr'
     328 |         (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
         |                                                       ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   drivers/gpu/drm/i915/display/intel_casf.c:111:73: error: no member named 'strength' in 'struct intel_casf'
     111 |         sharpness_ctl = FILTER_EN | FILTER_STRENGTH(crtc_state->hw.casf_params.strength);
         |                                                     ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/i915/display/intel_casf_regs.h:23:69: note: expanded from macro 'FILTER_STRENGTH'
      23 | #define   FILTER_STRENGTH(x)            REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
         |                                                                               ^
   drivers/gpu/drm/i915/i915_reg_defs.h:103:108: note: expanded from macro 'REG_FIELD_PREP'
     103 |                BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))
         |                                                                                                                   ^~~~~
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                              ^
   drivers/gpu/drm/i915/display/intel_casf.c:196:30: error: no member named 'strength' in 'struct intel_casf'
     196 |                 crtc_state->hw.casf_params.strength = 0;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/gpu/drm/i915/display/intel_casf.c:214:29: error: no member named 'strength' in 'struct intel_casf'
     214 |         crtc_state->hw.casf_params.strength =
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   3 warnings and 5 errors generated.


vim +97 drivers/gpu/drm/i915/display/intel_casf.c

    91	
    92	static void intel_casf_size_compute(struct intel_crtc_state *crtc_state)
    93	{
    94		const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
    95		u16 total_pixels = mode->hdisplay * mode->vdisplay;
    96	
  > 97		if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
    98			crtc_state->hw.casf_params.win_size = 0;
    99		else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
   100			crtc_state->hw.casf_params.win_size = 1;
   101		else
   102			crtc_state->hw.casf_params.win_size = 2;
   103	}
   104	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
