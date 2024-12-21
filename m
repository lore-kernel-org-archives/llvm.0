Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B901D163;
	Sat, 21 Dec 2024 00:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734742178; cv=none; b=rPAw/BpeW8wbVMUR8yU1RvLkODbVgkXaoxwPNzpsYU8GHK9/w7ub+Grlt4zrxUitAoQmL7MZn7DDJgRwPA300KacVVlEz4HgPtQr/1JoysnY/zDM/NYt1/6EZU2eVeV7+338aXf7IiVyPCz6H1f6iP1CHVzerSUzpDWE8mDPaAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734742178; c=relaxed/simple;
	bh=SzgwfS2cTODjJJ5XiWD7nvBWwFJN8ilIS7chkmT7L8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPdhQWC4K4CMKt1XZ3ncqylZPltBgvqKLOzzoZH2IvsWNd3Zwdd8IDPyNi2fWcOscwwTMvDqifzCDUx47notXKQ75uSBSk8u71iyl6ZsvFSrsCpg3f9OBAgdbYyXfdL/pvUH0SC6EnRngEp/7S/kQITX67/shUtVgVUGzpY8faw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GgOOZrUk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GgOOZrUk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734742177; x=1766278177;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SzgwfS2cTODjJJ5XiWD7nvBWwFJN8ilIS7chkmT7L8E=;
  b=GgOOZrUkPYWfVUVGpbt19z9uE5H8BZaCFQwiwqumPdbxpMN8ZgqCjG8A
   iEZTAc4ZIiXrP8qzS09PAdLa0KrFgJP0tqSm54LHtjYz22OpmD5yVKAYf
   NxlrpRk/tBTribKBzscCqdA9B7hsPHnnSEFn8F2zwHh26JlXAwmSvOm2D
   euE95eGjYz14hJsY7PNI8OdivfcuZSA46yXR+Zckrg6Ksu7Az+hrC2lOg
   wDr8dWERd3+Nzkz6lDwKgQSrAJ0VMEdd9t/de50q/Ubv+ct4O2P0w4fnX
   pJZFExa/EfgIvqGXrk16V0783Oev9xRAwWo1GrkbnaYL5mimBiiDmCwHn
   A==;
X-CSE-ConnectionGUID: v9ErIK5pTqquoCJppET5mA==
X-CSE-MsgGUID: Luwo6DedRHCPOUSlZ1Yetw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35518951"
X-IronPort-AV: E=Sophos;i="6.12,252,1728975600"; 
   d="scan'208";a="35518951"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 16:49:36 -0800
X-CSE-ConnectionGUID: 18HuGdZCQW6o5NlrJiA6sg==
X-CSE-MsgGUID: bzCuv69gTI++//YcDZWJ7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129606671"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Dec 2024 16:49:34 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOngR-0001nv-2y;
	Sat, 21 Dec 2024 00:49:31 +0000
Date: Sat, 21 Dec 2024 08:49:08 +0800
From: kernel test robot <lkp@intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>, intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	uma.shankar@intel.com, arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
Message-ID: <202412210826.fD0cAxev-lkp@intel.com>
References: <20241213060317.2674290-3-suraj.kandpal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241213060317.2674290-3-suraj.kandpal@intel.com>

Hi Suraj,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-dp-Add-the-DPCD-register-required-for-Extended-wake-timeout/20241213-140525
base:   linus/master
patch link:    https://lore.kernel.org/r/20241213060317.2674290-3-suraj.kandpal%40intel.com
patch subject: [PATCH 2/2] drm/i915/lttpr: Enable Extended Wake Timeout
config: powerpc-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210826.fD0cAxev-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210826.fD0cAxev-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210826.fD0cAxev-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_dp_link_training.c:148:48: error: initializer overrides prior initialization of this subobject [-Werror,-Winitializer-overrides]
                           [DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
                                                                       ^~
   drivers/gpu/drm/i915/display/intel_dp_link_training.c:146:48: note: previous initialization is here
                           [DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
                                                                       ^~
   1 error generated.


vim +148 drivers/gpu/drm/i915/display/intel_dp_link_training.c

   136	
   137	void intel_dp_lttpr_wake_timeout_setup(struct intel_dp *intel_dp)
   138	{
   139		struct intel_display *display = to_intel_display(intel_dp);
   140		u8 val = 1;
   141		int ret;
   142	
   143		if (intel_dp_lttpr_transparent_mode_enabled(intel_dp)) {
   144			static const u8 timeout_mapping[] = {
   145				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_1_MS] = 1,
   146				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
   147				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_40_MS] = 40,
 > 148				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS] = 20,
   149				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_80_MS] = 80,
   150				[DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_100_MS] = 100,
   151			};
   152	
   153			ret = drm_dp_dpcd_readb(&intel_dp->aux,
   154						DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_REQUEST, &val);
   155			if (ret != 1) {
   156				drm_dbg_kms(display->drm,
   157					    "Failed to read Extended sleep wake timeout request\n");
   158				return;
   159			}
   160	
   161			val = (val < sizeof(timeout_mapping) && timeout_mapping[val]) ?
   162				timeout_mapping[val] : 1;
   163	
   164			drm_dp_dpcd_writeb(&intel_dp->aux, DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_GRANT,
   165					   DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_GRANTED);
   166		} else {
   167			ret = drm_dp_dpcd_readb(&intel_dp->aux,
   168						DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT, &val);
   169			if (ret != 1) {
   170				drm_dbg_kms(display->drm,
   171					    "Failed to read Extended sleep wake timeout request\n");
   172				return;
   173			}
   174	
   175			val = (val & DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) ?
   176				(val & DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK) * 10 : 1;
   177	
   178			drm_dp_dpcd_writeb(&intel_dp->aux, DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT,
   179					   DP_EXTENDED_WAKE_TIMEOUT_GRANT);
   180		}
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
