Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D999314D35;
	Sat, 14 Mar 2026 08:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773475802; cv=none; b=AluSEeqK3v7ntuSNzSvBVtebRKXYts3hu+meqgchAvnuhnWwI/pyB2sjRGKRwlFjvgeYeoqzwmtf+X0Cs5Wo5auk4KoojP0fiKDlK/PvQZAHNpts+m4MwkuauRhnn4ayAdR8aZVinFISuxFQj1Yf+Idn0RZ4K+3tZsACqcxhYJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773475802; c=relaxed/simple;
	bh=+4AgdqFOb2ygbgOiAa0mqpkoOtNg8UyP9uTOgaqJ1cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rVkIQMqUwa9guQZDVFnD3D3uhUnepwO4t9aqaKH8s/N2aLu7ZFnWY8dreFlLymnAd1BU7yyfp1w49xASZQBqBqeHe35OA+LPkCdfyNv+y5Ofj2FZsD/8GlQSiUMCt3UE4LwQnhbPeXPQ4P1IfgrgOUY1aGff2K4jK/lasvXPpjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLZKnGbD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLZKnGbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773475801; x=1805011801;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+4AgdqFOb2ygbgOiAa0mqpkoOtNg8UyP9uTOgaqJ1cE=;
  b=nLZKnGbDgrIw80SAw7reWTqZ3Xf5lovBg9ZLdjke5pveQyMbEIPMZk70
   NxbL1Z5u0BW2NQlYhN90RG+MKlr0ebY1xI5lhV/Z55Jx4bChJ4AsLs1Lg
   rhIVSh0ZqJ8ydpFMo7ShyRvs53giVclvs+bDsi39B5aCO4XBnUqo06h0U
   Rm/erakh6Wxpj+hUf5pVYNKv5j554U9+cOJuHJvCwif3al45+u4CAZGig
   BN7zKYTiNw/zlgpRXNPf6jct75btxvwXY4gqFtNizdxaDfAQn49kh+wKP
   ytDY8AnkGyYmC9gfJibAFzJJzgWy1GnWh/nZ22bOX2F+6SxqUAnLfTr/t
   g==;
X-CSE-ConnectionGUID: dJbru4B4Qw6cAAM5JiOe4g==
X-CSE-MsgGUID: L6iXI9HsRgmPN/if+0Du3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11728"; a="74690561"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="74690561"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 01:10:01 -0700
X-CSE-ConnectionGUID: s8pqu76fSCKL19s0jIkvUg==
X-CSE-MsgGUID: cNVw7CG6QHKSOY6o74mZug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="217748831"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Mar 2026 01:09:59 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1K4K-000000004qN-3oNt;
	Sat, 14 Mar 2026 08:09:56 +0000
Date: Sat, 14 Mar 2026 16:09:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 3/3] drm/i915/de: Implement register polling in the
 display code
Message-ID: <202603141514.jgf9tlEy-lkp@intel.com>
References: <20260313111028.25159-4-ville.syrjala@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313111028.25159-4-ville.syrjala@linux.intel.com>

Hi Ville,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20260311]
[cannot apply to drm-i915/for-linux-next-fixes drm-xe/drm-xe-next linus/master v7.0-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ville-Syrjala/drm-i915-de-Introduce-intel_de-c-and-move-intel_de_-read-write-8-there/20260314-004939
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260313111028.25159-4-ville.syrjala%40linux.intel.com
patch subject: [PATCH 3/3] drm/i915/de: Implement register polling in the display code
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260314/202603141514.jgf9tlEy-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7d47b695929cc7f85eeb0f87d0189adc04c1c629)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603141514.jgf9tlEy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603141514.jgf9tlEy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_de.c:72:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
      72 |         if (fast_timeout_us)
         |             ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_de.c:77:6: note: uninitialized use occurs here
      77 |         if (ret && slow_timeout_us)
         |             ^~~
   drivers/gpu/drm/i915/display/intel_de.c:72:2: note: remove the 'if' if its condition is always true
      72 |         if (fast_timeout_us)
         |         ^~~~~~~~~~~~~~~~~~~~
      73 |                 ret = __intel_de_wait_for_register(display, reg, mask, value,
   drivers/gpu/drm/i915/display/intel_de.c:70:9: note: initialize the variable 'ret' to silence this warning
      70 |         int ret;
         |                ^
         |                 = 0
   1 warning generated.


vim +72 drivers/gpu/drm/i915/display/intel_de.c

    62	
    63	static int intel_de_wait_for_register(struct intel_display *display,
    64					      i915_reg_t reg, u32 mask, u32 value,
    65					      unsigned int fast_timeout_us,
    66					      unsigned int slow_timeout_us,
    67					      u32 (*read)(struct intel_display *display, i915_reg_t reg),
    68					      u32 *out_value, bool is_atomic)
    69	{
    70		int ret;
    71	
  > 72		if (fast_timeout_us)
    73			ret = __intel_de_wait_for_register(display, reg, mask, value,
    74							   fast_timeout_us, read,
    75							   out_value, is_atomic);
    76	
    77		if (ret && slow_timeout_us)
    78			ret = __intel_de_wait_for_register(display, reg, mask, value,
    79							   slow_timeout_us, read,
    80							   out_value, is_atomic);
    81	
    82		return ret;
    83	}
    84	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
