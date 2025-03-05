Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D27124E4B4;
	Wed,  5 Mar 2025 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741208168; cv=none; b=tD/Y+jrHRhLr4TuryVXqdCjlwn1Or43ogdzxaY/lNk1p6IucaSOkwn+w/rFq0BKYEt5aSHpblyRcguKX0sFpQu+N+ryVQUbYn/YFGiffch2yhdvHnPRwe2FovRMqSofdOQP7p+OIpyaP44L7tyBofDCJtQ/GkrFwTi05M6lbvj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741208168; c=relaxed/simple;
	bh=+k6dY/PoFWBtL569CffqKAyR6CnD1fZJpf3OX6UjG9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4olcOvul7CQljgUIq2grbVh9OWQFiKPAVBDQLYGfWI/VJP+l6cjnLdeHYrv3ydM9z7QDbcRLrqL8nNT+Nzg25VB0avM0c8B0lk5I99KaTvJ3wrbx419YRN7wg2BoIhIzSgVLSltp8cPmqNhUMZUnoygyEIy4a5Z6n92oqXt2Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nd4afPia; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nd4afPia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741208165; x=1772744165;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+k6dY/PoFWBtL569CffqKAyR6CnD1fZJpf3OX6UjG9s=;
  b=nd4afPiaHKgxbuADyzOowDPFBKAkLE3H3crNqy8sgXKX77orYJYJw+Ub
   41qXcOC0605RgumD2KCIz17n251JyyeB4rhTdMeVp1MTtDKUuiqK+1kiL
   QWDoEthbRPwrSMa5EyS753pnWYYlx9fz1WnKfWcFIe+JyQsTMf9S/lWYD
   +rT3c+aEJoP0iin8wp0pdAiUTDKOYbxTSimh5w6JBtJoCNhcfU8OLjaAF
   hGSQk6pdWuiz8Nm4zSKWE+HQlR6auM4Vm2AvI/CPgVT1Dew9wmCyWTN0e
   nvbfjrCSirJgXnoQd4Mk1Y/BxYUDDQWTtYngq0EFOGgcGuuh3/67G2Q99
   w==;
X-CSE-ConnectionGUID: hkIXvX5TQrag0GdKICqojg==
X-CSE-MsgGUID: K6uxNtySTBmd4nvYMNiSxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52403797"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="52403797"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 12:56:05 -0800
X-CSE-ConnectionGUID: 0CymtJysQDyEzzq+vfifDg==
X-CSE-MsgGUID: 4l1RchMiRGiFDYfsrvSAxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="118816241"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2025 12:56:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpvmZ-000MBy-1M;
	Wed, 05 Mar 2025 20:55:59 +0000
Date: Thu, 6 Mar 2025 04:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: Uma Shankar <uma.shankar@intel.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	ville.syrjala@linux.intel.com, harry.wentland@amd.com,
	pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com,
	jadahl@redhat.com, mwen@igalia.com, contact@emersion.fr,
	naveen1.kumar@intel.com, dmitry.baryshkov@linaro.org
Subject: Re: [v3 01/23] drm: color pipeline base work
Message-ID: <202503060428.qINtTEJ1-lkp@intel.com>
References: <20250305132608.2379253-2-uma.shankar@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305132608.2379253-2-uma.shankar@intel.com>

Hi Uma,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250305]
[also build test WARNING on v6.14-rc5]
[cannot apply to drm-exynos/exynos-drm-next linus/master v6.14-rc5 v6.14-rc4 v6.14-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Uma-Shankar/drm-color-pipeline-base-work/20250306-011827
base:   next-20250305
patch link:    https://lore.kernel.org/r/20250305132608.2379253-2-uma.shankar%40intel.com
patch subject: [v3 01/23] drm: color pipeline base work
config: i386-buildonly-randconfig-003-20250306 (https://download.01.org/0day-ci/archive/20250306/202503060428.qINtTEJ1-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503060428.qINtTEJ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503060428.qINtTEJ1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/drm_colorop.c:30:
   In file included from include/drm/drm_plane.h:33:
   In file included from include/drm/drm_util.h:36:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2306:
   include/linux/vmstat.h:507:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     507 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/drm_colorop.c:162:6: warning: no previous prototype for function 'drm_colorop_cleanup' [-Wmissing-prototypes]
     162 | void drm_colorop_cleanup(struct drm_colorop *colorop)
         |      ^
   drivers/gpu/drm/drm_colorop.c:162:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     162 | void drm_colorop_cleanup(struct drm_colorop *colorop)
         | ^
         | static 
   2 warnings generated.


vim +/drm_colorop_cleanup +162 drivers/gpu/drm/drm_colorop.c

   156	
   157	/**
   158	 * drm_colorop_cleanup - Cleanup a drm_colorop object in color_pipeline
   159	 *
   160	 * @colorop: The drm_colorop object to be cleaned
   161	 */
 > 162	void drm_colorop_cleanup(struct drm_colorop *colorop)
   163	{
   164		struct drm_device *dev = colorop->dev;
   165		struct drm_mode_config *config = &dev->mode_config;
   166	
   167		list_del(&colorop->head);
   168		config->num_colorop--;
   169	
   170		if (colorop->state && colorop->state->data) {
   171			drm_property_blob_put(colorop->state->data);
   172			colorop->state->data = NULL;
   173		}
   174	
   175		kfree(colorop->state);
   176		kfree(colorop);
   177	}
   178	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
