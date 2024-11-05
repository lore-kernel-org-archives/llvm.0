Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B8B214413;
	Tue,  5 Nov 2024 20:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730839734; cv=none; b=f9ZZKi9hfHeB7CnIMPsBLuRA9YEoqP0c7n5EFsn9Bmk5tGqgL8pzsP4oGoBlTcWshO7zluc/SjS4JTSyCljEEWa4GUPhprl35rx1S2EZZABcp63Q2u60Eem0elZIa+H0yN0xStxBrQsizt7AUYxaOLern8vkeEHgAM2FIRNxfX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730839734; c=relaxed/simple;
	bh=O+UCtqG1h9LcdLR0ShAEQ4c+93aZzXDmoLnxRFGQ5qY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzMHWz2ZyZ2Jt7loUoFT9lWTvyiLUidgpdd1RI1MvRmgQOxtX9PUJODA3XAyTDPTbs4nzrlmiXPLWqv2xoPRdeDeTwxWdvBxaAHxQgtF5dOLqngkAZ8+GCIaYWlSnxO6fHMPFe8Okyo2HaLn+Fa5CBXyFoIZLFpsbgjVM+Sjag0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K0Hlc0Vl; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0Hlc0Vl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730839733; x=1762375733;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O+UCtqG1h9LcdLR0ShAEQ4c+93aZzXDmoLnxRFGQ5qY=;
  b=K0Hlc0Vl3YGkm9r3U0Jrs3kgyf7P2vHluBdv0pbtCPOVGFDGqnMHTPZM
   E3iUqpTCxbQyNEIuvHYeGvJ5+QrqIqH/hnfj3vNSfrVNMOV/WRGapR8VC
   Tn4GueD4sc9UbbE4uswbLCubWHy0IQ/KyZvhRJXQrno1wnodaUuFT6eBb
   W986gtCS7socXWidiJ7u3fRszY7YJUsHVSeU6n0+CW64LE+h0Vism8EmG
   dK8+ShDXKQggFdZLtwpVtZbJ3oQXDVHc5cvIC9xjGMKdNzDnGQFxNTCob
   scni0//+/s9p+NaQCLqHqPEoZEHrqk8PyU6781JZGbNQ9/AE/763NJ18K
   A==;
X-CSE-ConnectionGUID: 8wxhH6wjRYqjFc54kpJ1Dw==
X-CSE-MsgGUID: teiTJQvTRtSMC5s8zD0lqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="34307222"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="34307222"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 12:48:51 -0800
X-CSE-ConnectionGUID: rz0DLgUaTTW4UAXUGcXSng==
X-CSE-MsgGUID: LL8cV2+kRiaEZXd/rUVePA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; 
   d="scan'208";a="88117725"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Nov 2024 12:48:48 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8QTl-000mSH-2m;
	Tue, 05 Nov 2024 20:48:45 +0000
Date: Wed, 6 Nov 2024 04:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	intel-xe@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 2/9] drm/xe/display: Add intel_plane_initial_vblank_wait
Message-ID: <202411060402.TB3RmJ09-lkp@intel.com>
References: <20241105121857.17389-2-maarten.lankhorst@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105121857.17389-2-maarten.lankhorst@linux.intel.com>

Hi Maarten,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20241105]
[cannot apply to linus/master drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-tip/drm-tip v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maarten-Lankhorst/drm-xe-display-Add-intel_plane_initial_vblank_wait/20241105-202047
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20241105121857.17389-2-maarten.lankhorst%40linux.intel.com
patch subject: [PATCH 2/9] drm/xe/display: Add intel_plane_initial_vblank_wait
config: i386-defconfig (https://download.01.org/0day-ci/archive/20241106/202411060402.TB3RmJ09-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411060402.TB3RmJ09-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411060402.TB3RmJ09-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/i915/display/intel_plane_initial.c:8:
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
>> drivers/gpu/drm/i915/display/intel_plane_initial.c:17:38: error: a parameter list without types is only allowed in a function definition
      17 | void intel_plane_initial_vblank_wait(plane);(struct intel_plane *plane)
         |                                      ^
>> drivers/gpu/drm/i915/display/intel_plane_initial.c:17:46: error: expected identifier or '('
      17 | void intel_plane_initial_vblank_wait(plane);(struct intel_plane *plane)
         |                                              ^
>> drivers/gpu/drm/i915/display/intel_plane_initial.c:17:46: error: expected ')'
   drivers/gpu/drm/i915/display/intel_plane_initial.c:17:45: note: to match this '('
      17 | void intel_plane_initial_vblank_wait(plane);(struct intel_plane *plane)
         |                                             ^
>> drivers/gpu/drm/i915/display/intel_plane_initial.c:448:4: error: call to undeclared function 'intel_initial_vblank_wait'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     448 |                         intel_initial_vblank_wait(crtc);
         |                         ^
   drivers/gpu/drm/i915/display/intel_plane_initial.c:448:4: note: did you mean 'intel_plane_initial_vblank_wait'?
   drivers/gpu/drm/i915/display/intel_plane_initial.h:11:6: note: 'intel_plane_initial_vblank_wait' declared here
      11 | void intel_plane_initial_vblank_wait(struct intel_plane *plane);
         |      ^
   1 warning and 4 errors generated.


vim +17 drivers/gpu/drm/i915/display/intel_plane_initial.c

    16	
  > 17	void intel_plane_initial_vblank_wait(plane);(struct intel_plane *plane)
    18	{
    19		struct intel_crtc *crtc = intel_crtc_for_pipe(to_intel_display(plane), plane->pipe);
    20	
    21		intel_crtc_wait_for_next_vblank(crtc);
    22	}
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
