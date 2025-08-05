Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A422E36F6;
	Tue,  5 Aug 2025 18:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754420158; cv=none; b=fjESGYMqO/Wb+CecOXDYobFWN8L6Lox4wgZMva+dpeWIpsJvtS5rYBw1N9K8uYZkEEPZQ3KlhUpTTf9Gn2vJ0tGDK2opHXscJmBwZUDwjpKOMJwsKKbYy1Kg+Hv1uMqJ6e0lB1uWVg0kiETC50oEjAU6CRVISX4zrQI0vjTocWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754420158; c=relaxed/simple;
	bh=KFwarEgTIgd3P2HiXSkhm+b4Pa1sd+1sLQw0H4V1E6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lqso8DKuvKtDIkYU85luaydZa2yq6Jmjp6zvczgPDuoGsbgViZOAbsBt5XbRYeL0sDn6uIn7LEEZS1tFL+M0gPjYSqqpZ+3hAVpvp5JlxgFOfvP422uGSXdnD5IAsneZ5BzYBhBzNcpr24MYClK6T0B+KTZGF6qeyHue9B4aJFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G6Aau0ak; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G6Aau0ak"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754420156; x=1785956156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFwarEgTIgd3P2HiXSkhm+b4Pa1sd+1sLQw0H4V1E6g=;
  b=G6Aau0akEmVFAS+bJtH5ct5HTXkJN+r2Zai3MYpVPsD2RPb+NeKZmzv5
   G0f2y7hbFC9DRITa4GzGY19+EjQe41466sOjJxvOIbO4oagUiqDKLYpP6
   /YkyDYjFutcikQW0NpEvWE4kpGj53EWzJojtQv+MdvRAnv9fPVZJHwdwA
   bpnnyaabWMKODRWadD/6e7pj3Os0F64iTeEvQ5MStEYEuZ/P5vkqZlw+8
   bIxrhK6GgrlULM31gbzjcqjn9n1sup9hAnWWAqcj0u3Ceyxnx6/AIzwyU
   Fc+StfXfQ5XmxzRkzxITSObsopINWS5nJURa342XS/FVD0udU2kBi/SZa
   g==;
X-CSE-ConnectionGUID: rQfrRlUiRemRpdofFqmFAg==
X-CSE-MsgGUID: tZhVEXfiTh2KOk/T5PS2jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="56872341"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="56872341"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 11:55:56 -0700
X-CSE-ConnectionGUID: ISu1QqVOTqSW3Qdytqg2yA==
X-CSE-MsgGUID: BY0crQMNSPyXEcULm35l9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="168718125"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 05 Aug 2025 11:55:54 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujMpE-00022t-1C;
	Tue, 05 Aug 2025 18:55:52 +0000
Date: Tue, 5 Aug 2025 20:55:19 +0200
From: kernel test robot <lkp@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Animesh Manna <animesh.manna@intel.com>
Subject: [drm-i915:drm-intel-next 1/1]
 drivers/gpu/drm/i915/display/skl_scaler.c:967:57: warning: variable 'id' is
 uninitialized when used here
Message-ID: <202508052002.gCODptW2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/drm/i915/kernel drm-intel-next
head:   73309ed9d598d35576431c4691813e080980df68
commit: 73309ed9d598d35576431c4691813e080980df68 [1/1] drm/i915/display: WA_14011503117
config: x86_64-buildonly-randconfig-2004-20250805 (https://download.01.org/0day-ci/archive/20250805/202508052002.gCODptW2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508052002.gCODptW2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508052002.gCODptW2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/skl_scaler.c:967:57: warning: variable 'id' is uninitialized when used here [-Wuninitialized]
     967 |         intel_de_write_fw(display, SKL_PS_ECC_STAT(crtc->pipe, id), 1);
         |                                                                ^~
   drivers/gpu/drm/i915/display/intel_display_regs.h:1193:8: note: expanded from macro 'SKL_PS_ECC_STAT'
    1193 |                         _ID(id, _PS_ECC_STAT_1A, _PS_ECC_STAT_2A),   \
         |                             ^~
   drivers/gpu/drm/i915/display/intel_display_regs.h:1043:34: note: expanded from macro '_ID'
    1043 | #define _ID(id, a, b) _PICK_EVEN(id, a, b)
         |                                  ^~
   drivers/gpu/drm/i915/i915_reg_defs.h:127:49: note: expanded from macro '_PICK_EVEN'
     127 | #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
         |                                                 ^~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/gpu/drm/i915/display/intel_display_reg_defs.h:18:45: note: expanded from macro '_PIPE'
      18 | #define _PIPE(pipe, a, b)               _PICK_EVEN(pipe, a, b)
         |                                                          ^
   drivers/gpu/drm/i915/i915_reg_defs.h:127:41: note: expanded from macro '_PICK_EVEN'
     127 | #define _PICK_EVEN(__index, __a, __b) ((__a) + (__index) * ((__b) - (__a)))
         |                                         ^~~
   drivers/gpu/drm/i915/i915_reg_defs.h:181:47: note: expanded from macro '_MMIO'
     181 | #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
         |                                               ^
   drivers/gpu/drm/i915/display/skl_scaler.c:962:8: note: initialize the variable 'id' to silence this warning
     962 |         int id;
         |               ^
         |                = 0
   1 warning generated.


vim +/id +967 drivers/gpu/drm/i915/display/skl_scaler.c

   955	
   956	void adl_scaler_ecc_unmask(const struct intel_crtc_state *crtc_state)
   957	{
   958		struct intel_display *display = to_intel_display(crtc_state);
   959		struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
   960		const struct intel_crtc_scaler_state *scaler_state =
   961			&crtc_state->scaler_state;
   962		int id;
   963	
   964		if (!scaler_state && scaler_state->scaler_id == -1)
   965			return;
   966	
 > 967		intel_de_write_fw(display, SKL_PS_ECC_STAT(crtc->pipe, id), 1);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
