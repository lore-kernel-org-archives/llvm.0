Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B20613D503;
	Tue, 23 Jul 2024 21:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721770976; cv=none; b=ewxfsdWELKN7SwHYKPTcArJW2ibxVVdThnUV31FlMn8Sq7UDenVHS8vb1xTHhGE1kK+qGw4Ol+rxcD7D184tsXf6DuXlmsBZQQJ5oOMangm44/R77fOBJRAHd6Ify7V6q3m/7R1YhWLeOp0aFl6j5b03dyuErnpccDUY7RraXDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721770976; c=relaxed/simple;
	bh=dj1KZK51DTCMRhlcbZn0oVYnVn0JIWgOO7CRfRCYi2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jh+NXFLTckoXhdJxbzVZzEyqXD0ian49QHLbuNOu0Y9s3JIhvrumlyfEZDKNN8BSt2Eeo3sisVQi0Z0CsYqQjPMUjO3HpwSVlvwRbm6lOjrN4tR+CLc5WX5AFTyg35UAI2ohfY30K/0742rLV3786+w3ookFsAbyJI0ygyZNkUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=butplfRO; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="butplfRO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721770975; x=1753306975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dj1KZK51DTCMRhlcbZn0oVYnVn0JIWgOO7CRfRCYi2E=;
  b=butplfROvKToMim5ES1Vd8bvuDlm2w1ttFqB0oLMn0J5P9wFZ0fguigT
   beTM8jrE6z75R8pdlxGxRek7KdwjNndazRgtkyQMGqeXYA8dCAUAeJzkJ
   miUEtvEcVFswKBIoQ5MjU5RQ1PID8y1UdeqDDyoH1EVMszzdkDmIk8ueL
   8jS8ectpK3BlmDicgryO6L7JFzyleyGaBaa2ea0scplDyVjNLS2m0FaG+
   FiCYpsRE3d3guYiDOxtIXYBFjXU+17Xkjgy88xpCCfKQHG738VqlJIN9P
   XGj+lpfgJOi7CEZSlHawBR0xXBhfGHY6xl397ESxzryaMIHUc6LcedE9r
   g==;
X-CSE-ConnectionGUID: JbcGIBPsT4eJGtSyVwdfDg==
X-CSE-MsgGUID: ojSZDMJDQ/6Tk/EBTDP9gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11142"; a="44845436"
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="44845436"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 14:42:54 -0700
X-CSE-ConnectionGUID: sY/8/4diTbiaAQBlLr86yg==
X-CSE-MsgGUID: ne8C00JZRI2LKJu6Vd4axA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,231,1716274800"; 
   d="scan'208";a="52308516"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Jul 2024 14:42:53 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWNHW-000mNM-2A;
	Tue, 23 Jul 2024 21:42:50 +0000
Date: Wed, 24 Jul 2024 05:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 7/9] drm/i915/gt: Allow the creation of multi-mode
 CCS masks
Message-ID: <202407240533.cEF8jOoJ-lkp@intel.com>
References: <20240723112046.123938-8-andi.shyti@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723112046.123938-8-andi.shyti@linux.intel.com>

Hi Andi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.10 next-20240723]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andi-Shyti/drm-i915-gt-Refactor-uabi-engine-class-instance-list-creation/20240723-192341
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240723112046.123938-8-andi.shyti%40linux.intel.com
patch subject: [RFC PATCH 7/9] drm/i915/gt: Allow the creation of multi-mode CCS masks
config: i386-randconfig-001-20240724 (https://download.01.org/0day-ci/archive/20240724/202407240533.cEF8jOoJ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407240533.cEF8jOoJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407240533.cEF8jOoJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c:62:6: warning: variable 'mode_val' set but not used [-Wunused-but-set-variable]
      62 |         u32 mode_val = 0;
         |             ^
   1 warning generated.


vim +/mode_val +62 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c

    58	
    59	void intel_gt_apply_ccs_mode(struct intel_gt *gt, u32 mode)
    60	{
    61		unsigned long cslices_mask = gt->ccs.cslice_mask;
  > 62		u32 mode_val = 0;
    63		int ccs_id;
    64		int cslice;
    65		u32 m = mode;
    66	
    67		lockdep_assert_held(&gt->ccs.mutex);
    68	
    69		if (!IS_DG2(gt->i915))
    70			return;
    71	
    72		/*
    73		 * The mode has two bit dedicated for each engine
    74		 * that will be used for the CCS balancing algorithm:
    75		 *
    76		 *    BIT | CCS slice
    77		 *   ------------------
    78		 *     0  | CCS slice
    79		 *     1  |     0
    80		 *   ------------------
    81		 *     2  | CCS slice
    82		 *     3  |     1
    83		 *   ------------------
    84		 *     4  | CCS slice
    85		 *     5  |     2
    86		 *   ------------------
    87		 *     6  | CCS slice
    88		 *     7  |     3
    89		 *   ------------------
    90		 *
    91		 * When a CCS slice is not available, then we will write 0x7,
    92		 * oterwise we will write the user engine id which load will
    93		 * be forwarded to that slice.
    94		 *
    95		 * The possible configurations are:
    96		 *
    97		 * 1 engine (ccs0):
    98		 *   slice 0, 1, 2, 3: ccs0
    99		 *
   100		 * 2 engines (ccs0, ccs1):
   101		 *   slice 0, 2: ccs0
   102		 *   slice 1, 3: ccs1
   103		 *
   104		 * 4 engines (ccs0, ccs1, ccs2, ccs3):
   105		 *   slice 0: ccs0
   106		 *   slice 1: ccs1
   107		 *   slice 2: ccs2
   108		 *   slice 3: ccs3
   109		 */
   110		ccs_id = __ffs(cslices_mask);
   111	
   112		for (cslice = 0; cslice < I915_MAX_CCS; cslice++) {
   113			if (!(cslices_mask & BIT(cslice))) {
   114				/*
   115				 * If not available, mark the slice as unavailable
   116				 * and no task will be dispatched here.
   117				 */
   118				mode_val |= XEHP_CCS_MODE_CSLICE(cslice,
   119							     XEHP_CCS_MODE_CSLICE_MASK);
   120				continue;
   121			}
   122	
   123			mode_val |= XEHP_CCS_MODE_CSLICE(cslice, ccs_id);
   124	
   125			if (!m) {
   126				m = mode;
   127				ccs_id = __ffs(cslices_mask);
   128				continue;
   129			}
   130	
   131			m--;
   132			ccs_id = find_next_bit(&cslices_mask, I915_MAX_CCS, ccs_id + 1);
   133		}
   134	
   135		gt->ccs.mode_reg_val = mode;
   136	}
   137	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
