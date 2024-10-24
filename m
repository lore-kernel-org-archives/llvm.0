Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018041591F0;
	Thu, 24 Oct 2024 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729786508; cv=none; b=fs6rmPDhvEg68q8SMN/nE4Plc4hio6o+rkcK5YTGC2zVf5BwH8rVLF/4kXT2VI3GjvW7RJAxwI9B49ioWxwQoUfHuyIsYgu9YeFXrDDh6lgpWpvxGIjdh3dweUOPisgHKzZ4PYZw93Y8tJWXqY0AuQ6DiybqW/hC8DQ758uNv2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729786508; c=relaxed/simple;
	bh=xb6g9iL+65YUyCDJg9AIZQdi/mQA0++/xQQ6T8nbkWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxvifSUUXQy5qdon/ZOQn1IjLWZV6R3lUx6deyNSAzRYmt7PPUCmhMKSb1HT3pktART0qlqskctpIdlE0EvzQd8Vts+TGcGnO22fANsUcfPR64Zrn3gkNL/E2JUWVIciApMt3dj4VA9jZ9+FimHfq/U40XLWbluo6pUm6oqmKaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hA1Amfqf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hA1Amfqf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729786506; x=1761322506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xb6g9iL+65YUyCDJg9AIZQdi/mQA0++/xQQ6T8nbkWk=;
  b=hA1Amfqf86c3c05UWvcUp2MHW8BBAp+NGBj+e2xgXboqUlGOvWPUZc+1
   kmebnUqfXoxYwJKffcecZpl4/mQ9rbgRca+85OLilg7am3Gr44bJbCKPh
   Qjaesu3ZS8s5Y37XySe1ntIKq+ZMIZz954GQjzU5nAUH/k9VnGOGrCAIe
   kBmXAvLfBlIYmXghxMJ66H95obUqdnQmMNm9NPTdaGBczWS33k0tYX279
   VUZdQQ0fO3oftcIyf8cgmR8jiYTXEiY6vf8pfrrRNsjwil1RrTQv42MOl
   K15E00udjwTmb4XyNTubJSm0Ifk3Z15pDjqGr5b06koIbNsZ4WanD3rPV
   w==;
X-CSE-ConnectionGUID: pD/X0HT1TpO+4uX+aashTg==
X-CSE-MsgGUID: 7B1kc4DHRmC55Baga1Zqsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="28873122"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="28873122"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 09:15:05 -0700
X-CSE-ConnectionGUID: 9V+utqOwTGSLu1k7xCUTOQ==
X-CSE-MsgGUID: 5qZ+yDQvQZyi7vbq4/90Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80747678"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Oct 2024 09:15:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t40UI-000Wfu-1Q;
	Thu, 24 Oct 2024 16:15:02 +0000
Date: Fri, 25 Oct 2024 00:14:05 +0800
From: kernel test robot <lkp@intel.com>
To: Nemesa Garg <nemesa.garg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/5] drm/i915/display: Add registers and compute the
 strength
Message-ID: <202410250018.H5RGjCHy-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-xe/drm-xe-next drm-misc/drm-misc-next linus/master v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nemesa-Garg/drm-Introduce-sharpness-strength-property/20241024-001247
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20241023161206.1113519-5-nemesa.garg%40intel.com
patch subject: [PATCH 4/5] drm/i915/display: Add registers and compute the strength
config: i386-defconfig (https://download.01.org/0day-ci/archive/20241025/202410250018.H5RGjCHy-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410250018.H5RGjCHy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410250018.H5RGjCHy-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/i915/display/intel_casf.c:87:19: warning: result of comparison of constant 2073600 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
      87 |         if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
         |             ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_casf.c:89:24: warning: result of comparison of constant 8294400 with expression of type 'u16' (aka 'unsigned short') is always true [-Wtautological-constant-out-of-range-compare]
      89 |         else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
         |                  ~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


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
