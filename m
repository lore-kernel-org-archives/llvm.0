Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7B71F9ECE;
	Tue, 15 Oct 2024 17:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729011762; cv=none; b=l8J8Wwl4+X2+2ACJt5ZnZC7NMVeftcKr7iiXzdcudGzGxImhRMDK0xdF7L47tpvt/82Yqj671+NiU2zTPqeQ/f4HjS4OGynFrdE1rJZ9Qq9WqGnsQzpCSYIuur7VCyodrA05qwVlbKMr3DeuJV1npaw/o2xtG26cYWtdg/qWN8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729011762; c=relaxed/simple;
	bh=25hxaowDpDYK8TbQdGfXRUfKvGkgzt+94kBWLP8fHPg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Di8XuYw2xf0KM47J+muFj3pBRYDdOpnPuwPZkRDm/5TdDrqgLpP0fnqbzXgicR0gZESSMouoQoK050BCSym6I9I9vtAo0ucYzkJbfqF2hj8/FxFQHMeM/j2qqTMkvor2V5B0RiBIfYCVlcoCAh5+fBWuqE1T9ZNoNA4AD/dbk+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVEy19Cq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVEy19Cq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729011761; x=1760547761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=25hxaowDpDYK8TbQdGfXRUfKvGkgzt+94kBWLP8fHPg=;
  b=BVEy19CqfS6trmppdI2a0By8mswxYT+J5U2nLf11LWKYhNVa2kq25f5U
   mywUZVylxRhRCbE5+qMMi9GcGVbb5FZ4bGoYMWaBNRWq5qjqOeWMjrEfi
   hLCu20NKR6l9jlhp5HmD2PUGKs5n4Gfi4j1+sD4jQ+WHHa7HDzsnFV+/y
   pUVwG3Mfg1zP0gkQKhZRkSV9ftyJyNUDZ78fdznsZweTaaJpWYf0tMGgY
   BTercVS86bnvDJFwMgxwU1daRZ+dgEwmmxwES6+FPIOIGYb/kjaUNCBGE
   eIHzBWPdWQGLe65grFIl06ssAwup5SoTc1yv3aEz1ZNN0y+iUHetvLIUn
   A==;
X-CSE-ConnectionGUID: OjxhCVDwTEm9EJDXLCeZFw==
X-CSE-MsgGUID: nDG4u00ORRyzG4vmrmzE5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50957232"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="50957232"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 10:02:40 -0700
X-CSE-ConnectionGUID: Bz2CBDoUQRq+0/Vjxz6R0Q==
X-CSE-MsgGUID: OvGl0Vz1S8+8azJHYkXYfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="108691617"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Oct 2024 10:02:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0kwO-000Jdz-17;
	Tue, 15 Oct 2024 17:02:36 +0000
Date: Wed, 16 Oct 2024 01:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH 6/9] drm/i915/display: Add DSC pixel replication
Message-ID: <202410160018.hjWyI23D-lkp@intel.com>
References: <20241014081000.2844245-7-ankit.k.nautiyal@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241014081000.2844245-7-ankit.k.nautiyal@intel.com>

Hi Ankit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on next-20241015]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.12-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankit-Nautiyal/drm-i915-display-Prepare-for-dsc-3-stream-splitter/20241014-161007
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20241014081000.2844245-7-ankit.k.nautiyal%40intel.com
patch subject: [PATCH 6/9] drm/i915/display: Add DSC pixel replication
config: i386-defconfig (https://download.01.org/0day-ci/archive/20241016/202410160018.hjWyI23D-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410160018.hjWyI23D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160018.hjWyI23D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/display/intel_vdsc.c:1022:6: warning: variable 'dss_ctl3' is uninitialized when used here [-Wuninitialized]
    1022 |         if (dss_ctl3 & DSC_PIXEL_REPLICATION_MASK)
         |             ^~~~~~~~
   drivers/gpu/drm/i915/display/intel_vdsc.c:991:34: note: initialize the variable 'dss_ctl3' to silence this warning
     991 |         u32 dss_ctl1, dss_ctl2, dss_ctl3;
         |                                         ^
         |                                          = 0
   1 warning generated.


vim +/dss_ctl3 +1022 drivers/gpu/drm/i915/display/intel_vdsc.c

   983	
   984	void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
   985	{
   986		struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
   987		struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
   988		enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
   989		enum intel_display_power_domain power_domain;
   990		intel_wakeref_t wakeref;
   991		u32 dss_ctl1, dss_ctl2, dss_ctl3;
   992	
   993		if (!intel_dsc_source_support(crtc_state))
   994			return;
   995	
   996		power_domain = intel_dsc_power_domain(crtc, cpu_transcoder);
   997	
   998		wakeref = intel_display_power_get_if_enabled(dev_priv, power_domain);
   999		if (!wakeref)
  1000			return;
  1001	
  1002		dss_ctl1 = intel_de_read(dev_priv, dss_ctl1_reg(crtc, cpu_transcoder));
  1003		dss_ctl2 = intel_de_read(dev_priv, dss_ctl2_reg(crtc, cpu_transcoder));
  1004	
  1005		if (IS_BATTLEMAGE(dev_priv))
  1006			dss_ctl3 = intel_de_read(dev_priv, BMG_PIPE_DSS_CTL3(crtc_state->cpu_transcoder));
  1007	
  1008		crtc_state->dsc.compression_enable = dss_ctl2 & VDSC0_ENABLE;
  1009		if (!crtc_state->dsc.compression_enable)
  1010			goto out;
  1011	
  1012		if (dss_ctl1 & JOINER_ENABLE) {
  1013			if (dss_ctl2 & (VDSC2_ENABLE | SMALL_JOINER_CONFIG_3_ENGINES))
  1014				crtc_state->dsc.dsc_split = INTEL_DSC_SPLIT_3_STREAMS;
  1015	
  1016			else if (dss_ctl2 & VDSC1_ENABLE)
  1017				crtc_state->dsc.dsc_split = INTEL_DSC_SPLIT_2_STREAMS;
  1018		} else {
  1019			crtc_state->dsc.dsc_split = INTEL_DSC_SPLIT_DISABLED;
  1020		}
  1021	
> 1022		if (dss_ctl3 & DSC_PIXEL_REPLICATION_MASK)
  1023			crtc_state->dsc.pixel_replication_count =
  1024				dss_ctl3 & DSC_PIXEL_REPLICATION_MASK;
  1025	
  1026		intel_dsc_get_pps_config(crtc_state);
  1027	out:
  1028		intel_display_power_put(dev_priv, power_domain, wakeref);
  1029	}
  1030	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
