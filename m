Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C57B1843;
	Fri,  7 Jun 2024 00:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717721238; cv=none; b=L3vUNqvcOWQhLaLYVJERqg4H4wsl92uVs6542wGrKiaRb5lw7N4uhbElWvYbbaQruev/iZmssCohPzwwfcl/HTLVtD8qjiUd6oYUw92X9quup3nugoQHcw3EHNUB0oJAZTt69ejprjEuA558Aw9Zv3FCK8sNrups0aIKIxTeLkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717721238; c=relaxed/simple;
	bh=im3lw1GuRGh+V4/+2+XLQWBRWvNLeg2EfGwFZkZ6UQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=es012XnvcKF0/jWg12cQEUtsPWQblTwOBh5DtI0kpwa+9UfnBgqhJwJgkPxNDYreQRUEK9cOMmNwohMHfim7zu8Khvzux0Yqwq0/gBUbYpOXPMBYCnERUc/kCE8TJVGCBKrt/978aBcugWUgZatR7mK68vbwMeAHLpqi+k64VIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvMgw6lQ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvMgw6lQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717721237; x=1749257237;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=im3lw1GuRGh+V4/+2+XLQWBRWvNLeg2EfGwFZkZ6UQE=;
  b=dvMgw6lQjWZ9YNqdZaTgTJyJSLF5Go4DwszRZcqH5AecDuDxyHHr586T
   iBfysxM9aLxRlHLC8t9owaas5oOdLJ1Yd9DMqjkeSyefihDHA+qCoKhKl
   kVWiPDt75Pyplruyu1CXlhBGamA3xAg+uGT/Gxelryt3T8+/qqZ0KVZus
   6C2U40xBd/pIeN5XLhtn/X5RrleQQRgav/xmsWI+xG9z6AoBTN/LGhzi2
   Ol2BrdHVl+PKhL6OzYzer7sTR9Qmugt7ml3M1toqJNPsUrfdviSjQIu3x
   lGAbCIsGvXVctldn2IQ54UfO7t1XRGZC3W7cIgkMAdD872z5ZNaZtkg5w
   Q==;
X-CSE-ConnectionGUID: merH34BJRG2Gh7yTrKsi5A==
X-CSE-MsgGUID: mEV/s9lURvC3qq8lT1damA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25528686"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="25528686"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 17:47:17 -0700
X-CSE-ConnectionGUID: eAPND6B+Sk6WhTAqNefqAw==
X-CSE-MsgGUID: nz/zVVYJS/O3N+62s0bWdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="42609039"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 06 Jun 2024 17:47:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFNlA-0003wG-0F;
	Fri, 07 Jun 2024 00:47:12 +0000
Date: Fri, 7 Jun 2024 08:46:46 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	animesh.manna@intel.com, arun.r.murthy@intel.com,
	jouni.hogander@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/psr: Implment WA to help reach PC10
Message-ID: <202406070845.TnConzA7-lkp@intel.com>
References: <20240606082926.1816416-4-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606082926.1816416-4-suraj.kandpal@intel.com>

Hi Suraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.10-rc2 next-20240606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-i915-psr-Add-return-bool-value-for-hsw_activate_psr1/20240606-163351
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240606082926.1816416-4-suraj.kandpal%40intel.com
patch subject: [PATCH 2/2] drm/i915/psr: Implment WA to help reach PC10
config: i386-buildonly-randconfig-002-20240607 (https://download.01.org/0day-ci/archive/20240607/202406070845.TnConzA7-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070845.TnConzA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070845.TnConzA7-lkp@intel.com/

All errors (new ones prefixed by >>):

    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                              ^
   include/linux/dev_printk.h:48:6: note: '_dev_crit' declared here
      48 | void _dev_crit(const struct device *dev, const char *fmt, ...);
         |      ^
   drivers/gpu/drm/i915/display/intel_psr.c:817:29: error: use of undeclared identifier 'dev_priv'; did you mean '_dev_crit'?
     817 |         return intel_de_read(i915, TRANS_SET_CONTEXT_LATENCY(cpu_transcoder)) >= 6;
         |                                    ^
   drivers/gpu/drm/i915/i915_reg.h:4158:55: note: expanded from macro 'TRANS_SET_CONTEXT_LATENCY'
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                              ^
   include/linux/dev_printk.h:48:6: note: '_dev_crit' declared here
      48 | void _dev_crit(const struct device *dev, const char *fmt, ...);
         |      ^
   drivers/gpu/drm/i915/display/intel_psr.c:817:29: error: controlling expression type 'void (*)(const struct device *, const char *, ...)' not compatible with any generic association type
     817 |         return intel_de_read(i915, TRANS_SET_CONTEXT_LATENCY(cpu_transcoder)) >= 6;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_reg.h:4158:55: note: expanded from macro 'TRANS_SET_CONTEXT_LATENCY'
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                              ^~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_reg_defs.h:43:26: note: expanded from macro '_MMIO_TRANS2'
      43 |                                                       DISPLAY_INFO(display)->trans_offsets[TRANSCODER_A] + \
         |                                                                    ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_device.h:185:49: note: expanded from macro 'DISPLAY_INFO'
     185 | #define DISPLAY_INFO(i915)              (__to_intel_display(i915)->info.__device_info)
         |                                                             ^~~~
   drivers/gpu/drm/i915/display/intel_display_conversion.h:16:11: note: expanded from macro '__to_intel_display'
      16 |         _Generic(p,                                                     \
         |                  ^
   drivers/gpu/drm/i915/i915_reg_defs.h:267:47: note: expanded from macro '_MMIO'
     267 | #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
         |                                               ^
   drivers/gpu/drm/i915/display/intel_de.h:31:69: note: expanded from macro 'intel_de_read'
      31 | #define intel_de_read(p,...) __intel_de_read(__to_intel_display(p), __VA_ARGS__)
         |                                                                     ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_psr.c:817:29: error: use of undeclared identifier 'dev_priv'; did you mean '_dev_crit'?
   drivers/gpu/drm/i915/i915_reg.h:4158:55: note: expanded from macro 'TRANS_SET_CONTEXT_LATENCY'
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                              ^
   include/linux/dev_printk.h:48:6: note: '_dev_crit' declared here
      48 | void _dev_crit(const struct device *dev, const char *fmt, ...);
         |      ^
   drivers/gpu/drm/i915/display/intel_psr.c:817:29: error: use of undeclared identifier 'dev_priv'; did you mean '_dev_crit'?
     817 |         return intel_de_read(i915, TRANS_SET_CONTEXT_LATENCY(cpu_transcoder)) >= 6;
         |                                    ^
   drivers/gpu/drm/i915/i915_reg.h:4158:55: note: expanded from macro 'TRANS_SET_CONTEXT_LATENCY'
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                              ^
   include/linux/dev_printk.h:48:6: note: '_dev_crit' declared here
      48 | void _dev_crit(const struct device *dev, const char *fmt, ...);
         |      ^
   drivers/gpu/drm/i915/display/intel_psr.c:817:29: error: use of undeclared identifier 'dev_priv'; did you mean '_dev_crit'?
     817 |         return intel_de_read(i915, TRANS_SET_CONTEXT_LATENCY(cpu_transcoder)) >= 6;
         |                                    ^
   drivers/gpu/drm/i915/i915_reg.h:4158:55: note: expanded from macro 'TRANS_SET_CONTEXT_LATENCY'
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                              ^
   include/linux/dev_printk.h:48:6: note: '_dev_crit' declared here
      48 | void _dev_crit(const struct device *dev, const char *fmt, ...);
         |      ^
   drivers/gpu/drm/i915/display/intel_psr.c:817:29: error: use of undeclared identifier 'dev_priv'; did you mean '_dev_crit'?
     817 |         return intel_de_read(i915, TRANS_SET_CONTEXT_LATENCY(cpu_transcoder)) >= 6;
         |                                    ^
   drivers/gpu/drm/i915/i915_reg.h:4158:55: note: expanded from macro 'TRANS_SET_CONTEXT_LATENCY'
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                              ^
   include/linux/dev_printk.h:48:6: note: '_dev_crit' declared here
      48 | void _dev_crit(const struct device *dev, const char *fmt, ...);
         |      ^
   drivers/gpu/drm/i915/display/intel_psr.c:817:29: error: use of undeclared identifier 'dev_priv'; did you mean '_dev_crit'?
     817 |         return intel_de_read(i915, TRANS_SET_CONTEXT_LATENCY(cpu_transcoder)) >= 6;
         |                                    ^
   drivers/gpu/drm/i915/i915_reg.h:4158:55: note: expanded from macro 'TRANS_SET_CONTEXT_LATENCY'
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                              ^
   include/linux/dev_printk.h:48:6: note: '_dev_crit' declared here
      48 | void _dev_crit(const struct device *dev, const char *fmt, ...);
         |      ^
   drivers/gpu/drm/i915/display/intel_psr.c:817:29: error: controlling expression type 'void (*)(const struct device *, const char *, ...)' not compatible with any generic association type
     817 |         return intel_de_read(i915, TRANS_SET_CONTEXT_LATENCY(cpu_transcoder)) >= 6;
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/i915_reg.h:4158:55: note: expanded from macro 'TRANS_SET_CONTEXT_LATENCY'
    4158 | #define TRANS_SET_CONTEXT_LATENCY(tran)         _MMIO_TRANS2(dev_priv, tran, _TRANS_A_SET_CONTEXT_LATENCY)
         |                                                              ^~~~~~~~
   drivers/gpu/drm/i915/display/intel_display_reg_defs.h:44:31: note: expanded from macro '_MMIO_TRANS2'
      44 |                                                       DISPLAY_MMIO_BASE(display) + (reg))
         |                                                                         ^~~~~~~
   drivers/gpu/drm/i915/display/intel_display_reg_defs.h:11:51: note: expanded from macro 'DISPLAY_MMIO_BASE'
      11 | #define DISPLAY_MMIO_BASE(dev_priv)     (DISPLAY_INFO(dev_priv)->mmio_offset)
         |                                                       ^~~~~~~~
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   drivers/gpu/drm/i915/display/intel_display_conversion.h:16:11: note: expanded from macro '__to_intel_display'
      16 |         _Generic(p,                                                     \
         |                  ^
   drivers/gpu/drm/i915/i915_reg_defs.h:267:47: note: expanded from macro '_MMIO'
     267 | #define _MMIO(r) ((const i915_reg_t){ .reg = (r) })
         |                                               ^
   drivers/gpu/drm/i915/display/intel_de.h:31:69: note: expanded from macro 'intel_de_read'
      31 | #define intel_de_read(p,...) __intel_de_read(__to_intel_display(p), __VA_ARGS__)
         |                                                                     ^~~~~~~~~~~
>> drivers/gpu/drm/i915/display/intel_psr.c:822:29: error: use of undeclared identifier 'LNL_PKG_C_LATENCY'
     822 |         return intel_de_read(i915, LNL_PKG_C_LATENCY) == U32_MAX;
         |                                    ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/LNL_PKG_C_LATENCY +822 drivers/gpu/drm/i915/display/intel_psr.c

   819	
   820	static bool intel_psr_is_dpkgc_configured(struct drm_i915_private *i915)
   821	{
 > 822		return intel_de_read(i915, LNL_PKG_C_LATENCY) == U32_MAX;
   823	}
   824	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
