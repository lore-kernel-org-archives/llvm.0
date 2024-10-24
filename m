Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9817219492;
	Thu, 24 Oct 2024 22:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729808372; cv=none; b=nGsluy/JT9aubgdCr1l5p5N0Q1VueOBcLjiW6tTXFnqAHGUWPDwWKQDNNK287Bbm/fybKaSsxZlRAWoIwO+SCI61rUvL8kqZNI59ELydRANH2WEk78Tz3MtN5D4255ieVxe1Mw+TwfwinBqCJiVB52X/o1kcS54eIwMjHYVdwIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729808372; c=relaxed/simple;
	bh=EB4qVyQpr9a7w4h4gdp6zUXK2Krqxn2eXqdP3PMIoeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ay+XcRlA0skXn1WViISSZkguFl1l0KE/CVEgKnu/AixPU/9mVtVgeNKujgDsS3bamT6KAmqR6dromB3S36t6kAHap2f9X4pHD7iI9sxqlZ0iPKekPtA0lvPWChHfNcFYPjXrvVD+uyP+6eZQtWKCfgkusIX44LwuQlq+df7N/dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0IMYXYx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0IMYXYx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729808369; x=1761344369;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EB4qVyQpr9a7w4h4gdp6zUXK2Krqxn2eXqdP3PMIoeU=;
  b=E0IMYXYxvuyUGD8v1n648yhO4VC7JzuCNJx5V03Gug0g6O/BuX5CCylI
   /X0Iej5r4S3rnSxnrZTz9cTB7YMPEdnKs773TAq3byNRwuMlkXAO5C9Vm
   n9d3dKjxBi7T7XlJ+dEqiMo35FgHNjhGXLAONQwFmW9aWDgLkG0T/mol7
   Bsrsw4XTdVdLh3finadKzbMoh6IZnKNrtCRLsPs3TrgNGCUZMsDQp+bZO
   2NmkuIb/f9zZtUkaza62mG3ffrrdAO4PteHyUQNGJg4sIUmcwREOj6H6v
   tyzu/nMbnC6muNdZDmwoFGM+cPma3F0LPDXyHCcGBk3wNiWSuA/T52x0p
   A==;
X-CSE-ConnectionGUID: 4Cys4YEbQ5mcudR9vlcWQQ==
X-CSE-MsgGUID: 3PCWsoWlT3Gs9litHqdQ3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29589772"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29589772"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 15:19:27 -0700
X-CSE-ConnectionGUID: hZBEQmeuQea705SkUD4x+A==
X-CSE-MsgGUID: /z6PgTIVTNWRK6xZF3TLmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; 
   d="scan'208";a="85524542"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Oct 2024 15:19:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t46As-000XDU-3A;
	Thu, 24 Oct 2024 22:19:22 +0000
Date: Fri, 25 Oct 2024 06:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/5] drm/i915/display: Add registers and compute the
 strength
Message-ID: <202410250602.WFDti47H-lkp@intel.com>
References: <20241023161206.1113519-5-nemesa.garg@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023161206.1113519-5-nemesa.garg@intel.com>

Hi Nemesa,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on drm-exynos/exynos-drm-next]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-xe/drm-xe-next drm-misc/drm-misc-next linus/master v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-Introduce-sharpness-strength-property/20241024-001247
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241023161206.1113519-5-nemesa.garg%40intel.com
patch subject: [PATCH 4/5] drm/i915/display: Add registers and compute the strength
config: i386-randconfig-006-20241024 (https://download.01.org/0day-ci/archive/20241025/202410250602.WFDti47H-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250602.WFDti47H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250602.WFDti47H-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_casf.c:7:
   In file included from drivers/gpu/drm/i915/display/intel_de.h:9:
   In file included from drivers/gpu/drm/i915/i915_drv.h:40:
   In file included from drivers/gpu/drm/i915/display/intel_display_core.h:16:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: error: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Werror,-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_casf.c:87:19: error: result of comparison of constant 2073600 with expression of type 'u16' (aka 'unsigned short') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
      87 |         if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
         |             ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
>> drivers/gpu/drm/i915/display/intel_casf.c:87:19: error: result of comparison of constant 2073600 with expression of type 'u16' (aka 'unsigned short') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
      87 |         if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
         |             ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
>> drivers/gpu/drm/i915/display/intel_casf.c:87:19: error: result of comparison of constant 2073600 with expression of type 'u16' (aka 'unsigned short') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
      87 |         if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
         |             ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   drivers/gpu/drm/i915/display/intel_casf.c:89:24: error: result of comparison of constant 8294400 with expression of type 'u16' (aka 'unsigned short') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
      89 |         else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
         |                  ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:86: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                                      ^~~~
   include/linux/compiler.h:68:3: note: expanded from macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   drivers/gpu/drm/i915/display/intel_casf.c:89:24: error: result of comparison of constant 8294400 with expression of type 'u16' (aka 'unsigned short') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
      89 |         else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
         |                  ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:52: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   drivers/gpu/drm/i915/display/intel_casf.c:89:24: error: result of comparison of constant 8294400 with expression of type 'u16' (aka 'unsigned short') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
      89 |         else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
         |                  ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:47: note: expanded from macro 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                                               ^~~~
   include/linux/compiler.h:57:61: note: expanded from macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   7 errors generated.


vim +87 drivers/gpu/drm/i915/display/intel_casf.c

    81	
    82	static void intel_casf_size_compute(struct intel_crtc_state *crtc_state)
    83	{
    84		const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
    85		u16 total_pixels = mode->hdisplay * mode->vdisplay;
    86	
  > 87		if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
    88			crtc_state->hw.casf_params.win_size = 0;
    89		else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
    90			crtc_state->hw.casf_params.win_size = 1;
    91		else
    92			crtc_state->hw.casf_params.win_size = 2;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
