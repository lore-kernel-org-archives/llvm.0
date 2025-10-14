Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB51212560;
	Tue, 14 Oct 2025 08:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760431711; cv=none; b=ifwqul4tPR/n0SIaWPsqA0U7eP6791OTNth9aUiBKeFToXxdHNZ7IsWcGLT05D/d5FzBD467J1cYXlwY7jPh5Tm2GVpuLq7LJod+KnRZu6JOcHvd/xm7b5lJvozAq0SM9TnjduUuS85aIVyjaEAb3B3F0hNCjQuJg3pik2O6RlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760431711; c=relaxed/simple;
	bh=cJOsxvxonjpz+jY7tWIJyNNy/T6R7jgN7sABWLNCPG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IQUzby00xd2pAITIZ4pCyTWy/IW8VXqE1iaw0q5PsSaw29s24e9STqWoSbPaTLoxTk5TMC1wBEnij2nCVlWYesGgn/pJ+GZhYuuueoIBPYNpMPXSmfrM92oo2gHYYXLn7Ntyx70ZJcJAz8Is2eKEP/Zd7PLTOULDT1YbQgY7OY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U9HG5RBM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U9HG5RBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760431709; x=1791967709;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cJOsxvxonjpz+jY7tWIJyNNy/T6R7jgN7sABWLNCPG0=;
  b=U9HG5RBM9gr/A5jhRVWu60fdwHQQOh2j8gatrSh+UuUbMDun51Bwz/9R
   pFuLN1jZU4lIP2VF8Zy6R9kTQ9i0C7mwDQOehyFjFGHKcHDbEafn1vIgW
   QXGm56xXRQ+yeXsgOIPjVvdtjiGNxU1Ms6oHd3/F/hvy93a93v1DOUXbU
   iOxjCLhosWi8/IZj3sxYxX+fOjHSolgL/2B6l8s3dlCtS7ljPYaz3Uxdp
   dDHlglxlZSHPtkRRAeGFC9yF0FeZwUPZUKaC6Sazd6wFqwi9eclXhhhT0
   TRZpfO+Ct2QU+BldDFx1bbYIjNxgvhiQZPGrJPDegMXh0twVIqKiQbIy0
   w==;
X-CSE-ConnectionGUID: f1FY9EhPRjCECtF9h1F1pg==
X-CSE-MsgGUID: 9XQUt1f2SaiaCgJN8lkZEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="85207008"
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="85207008"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 01:48:28 -0700
X-CSE-ConnectionGUID: I63Y/gLfREuk3rYuId2Kwg==
X-CSE-MsgGUID: R96YVaQvSyKv+1r6c1hDqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,227,1754982000"; 
   d="scan'208";a="181509095"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 Oct 2025 01:48:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8ahk-0002Z9-0c;
	Tue, 14 Oct 2025 08:48:24 +0000
Date: Tue, 14 Oct 2025 16:47:47 +0800
From: kernel test robot <lkp@intel.com>
To: Alison Schofield <alison.schofield@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2] cxl/region: Translate DPA->HPA in unaligned MOD3
 regions
Message-ID: <202510141648.2pQWexpT-lkp@intel.com>
References: <20251014062850.727428-1-alison.schofield@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014062850.727428-1-alison.schofield@intel.com>

Hi Alison,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a8660878839faadb4f1a6dd72c3179c1df56787]

url:    https://github.com/intel-lab-lkp/linux/commits/Alison-Schofield/cxl-region-Translate-DPA-HPA-in-unaligned-MOD3-regions/20251014-143112
base:   3a8660878839faadb4f1a6dd72c3179c1df56787
patch link:    https://lore.kernel.org/r/20251014062850.727428-1-alison.schofield%40intel.com
patch subject: [PATCH v2] cxl/region: Translate DPA->HPA in unaligned MOD3 regions
config: loongarch-randconfig-001-20251014 (https://download.01.org/0day-ci/archive/20251014/202510141648.2pQWexpT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251014/202510141648.2pQWexpT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510141648.2pQWexpT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cxl/core/region.c:3076:7: warning: variable 'hpa' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
    3076 |                 if (!aligned)
         |                     ^~~~~~~~
   drivers/cxl/core/region.c:3079:7: note: uninitialized use occurs here
    3079 |                 if (hpa == ULLONG_MAX)
         |                     ^~~
   drivers/cxl/core/region.c:3076:3: note: remove the 'if' if its condition is always true
    3076 |                 if (!aligned)
         |                 ^~~~~~~~~~~~~
    3077 |                         hpa = unaligned_dpa_to_hpa(cxld, p, cxled->pos,
   drivers/cxl/core/region.c:3049:57: note: initialize the variable 'hpa' to silence this warning
    3049 |         u64 dpa_offset, hpa_offset, bits_upper, mask_upper, hpa;
         |                                                                ^
         |                                                                 = 0
   1 warning generated.


vim +3076 drivers/cxl/core/region.c

  3044	
  3045	u64 cxl_dpa_to_hpa(struct cxl_region *cxlr, const struct cxl_memdev *cxlmd,
  3046			   u64 dpa)
  3047	{
  3048		struct cxl_root_decoder *cxlrd = to_cxl_root_decoder(cxlr->dev.parent);
  3049		u64 dpa_offset, hpa_offset, bits_upper, mask_upper, hpa;
  3050		struct cxl_decoder *cxld = &cxlrd->cxlsd.cxld;
  3051		struct cxl_region_params *p = &cxlr->params;
  3052		struct cxl_endpoint_decoder *cxled = NULL;
  3053		int hbiw = cxld->interleave_ways;
  3054		bool aligned;
  3055		u16 eig = 0;
  3056		u8 eiw = 0;
  3057		int pos;
  3058	
  3059		for (int i = 0; i < p->nr_targets; i++) {
  3060			cxled = p->targets[i];
  3061			if (cxlmd == cxled_to_memdev(cxled))
  3062				break;
  3063		}
  3064		if (!cxled || cxlmd != cxled_to_memdev(cxled))
  3065			return ULLONG_MAX;
  3066	
  3067		/* Remove the dpa base */
  3068		dpa_offset = dpa - cxl_dpa_resource_start(cxled);
  3069	
  3070		/* Unaligned calc: MOD3 interleaves not hbiw * 256MB aligned */
  3071		if (!is_power_of_2(hbiw)) {
  3072			u64 rem;
  3073	
  3074			div64_u64_rem(p->res->start, (u64)hbiw * SZ_256M, &rem);
  3075			aligned = (rem == 0);
> 3076			if (!aligned)
  3077				hpa = unaligned_dpa_to_hpa(cxld, p, cxled->pos,
  3078							   dpa_offset);
  3079			if (hpa == ULLONG_MAX)
  3080				return ULLONG_MAX;
  3081	
  3082			goto skip_aligned;
  3083		}
  3084	
  3085		/*
  3086		 * Aligned calc: all power-of-2 interleaves and MOD3 interleaves
  3087		 * that are aligned at hbiw * 256MB
  3088		 */
  3089		pos = cxled->pos;
  3090		ways_to_eiw(p->interleave_ways, &eiw);
  3091		granularity_to_eig(p->interleave_granularity, &eig);
  3092	
  3093		/*
  3094		 * The device position in the region interleave set was removed
  3095		 * from the offset at HPA->DPA translation. To reconstruct the
  3096		 * HPA, place the 'pos' in the offset.
  3097		 *
  3098		 * The placement of 'pos' in the HPA is determined by interleave
  3099		 * ways and granularity and is defined in the CXL Spec 3.0 Section
  3100		 * 8.2.4.19.13 Implementation Note: Device Decode Logic
  3101		 */
  3102	
  3103		mask_upper = GENMASK_ULL(51, eig + 8);
  3104	
  3105		if (eiw < 8) {
  3106			hpa_offset = (dpa_offset & mask_upper) << eiw;
  3107			hpa_offset |= pos << (eig + 8);
  3108		} else {
  3109			bits_upper = (dpa_offset & mask_upper) >> (eig + 8);
  3110			bits_upper = bits_upper * 3;
  3111			hpa_offset = ((bits_upper << (eiw - 8)) + pos) << (eig + 8);
  3112		}
  3113	
  3114		/* The lower bits remain unchanged */
  3115		hpa_offset |= dpa_offset & GENMASK_ULL(eig + 7, 0);
  3116	
  3117		/* Apply the hpa_offset to the region base address */
  3118		hpa = hpa_offset + p->res->start;
  3119	
  3120	skip_aligned:
  3121		hpa += p->cache_size;
  3122	
  3123		/* Root decoder translation overrides typical modulo decode */
  3124		if (has_hpa_to_spa(cxlrd))
  3125			hpa = cxlrd->ops->hpa_to_spa(cxlrd, hpa);
  3126	
  3127		if (!cxl_resource_contains_addr(p->res, hpa)) {
  3128			dev_dbg(&cxlr->dev,
  3129				"Addr trans fail: hpa 0x%llx not in region\n", hpa);
  3130			return ULLONG_MAX;
  3131		}
  3132		/* Chunk check applies to aligned modulo decodes only */
  3133		if (aligned && !has_hpa_to_spa(cxlrd) &&
  3134		    !cxl_is_hpa_in_chunk(hpa, cxlr, pos))
  3135			return ULLONG_MAX;
  3136	
  3137		return hpa;
  3138	}
  3139	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
