Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7822E282B;
	Fri, 16 Oct 2026 01:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792113746; cv=none; b=FO4iawDirK8Cr1fPnmjhRNM9MVszWHgmMpopoCBDIGtpfCT5MnPiAVuXPUtY/BnMGvlLHqbGsXC9TzYy6Ecpq0XGXdlwcV3TqEK2cEB3Dv7tdLbGgcQqNhKOG402r86G1msN8fjTm88vtVymXTSm45u26ymWQfknqxZ8SF6qT7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792113746; c=relaxed/simple;
	bh=xwW3geS7NTLBw0wTSJ1HDN43irNs82bHCIk1paXYgfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bqS0fvxmaS7Hs7JWqyfAvhS8cve/9+IFPvlxRJtig+BEuarT2chfYkBAIysJnVZpHCzrKqbvEMPVYfM+xEIfLTceWq6RFpGsWFXUjN7asljug76EwMVOmJFx5eWh+sOoRaVQaZsm+N17QS1i7zpce5JpgszvetCdhQQi65uIz8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VNYhd6nO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VNYhd6nO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792113744; x=1823649744;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xwW3geS7NTLBw0wTSJ1HDN43irNs82bHCIk1paXYgfo=;
  b=VNYhd6nOJJAbtDj7nvJi+w0EhPbZzhryJmunuIVmb/IUyrEdrhvbcHo8
   B8bTdheRsacBiCDTdF2OOTnIfQePk/2BOMa199qB7PFALUO/S6ZMyFqgW
   brxH6bAdqoy7fH6tgCo6LaBWqne/pYBauN8QczRfhGiW05eHegD8PllTO
   sTw3OF17Tbtc1CFOfZ0tv5uCrxAclyeElxCNjqk67MV9u/yqb3fd93wTR
   kJL0Tr6M/Oh29S4iyyU4nfdS6vHS16GxzWHeV6Vzms8caqRtElpYlE0ti
   F5nuygnU2uvDhZMjBzEZWkFOE5UuJQIAvfdApsOaH416VRUnb+7WMd1Oi
   w==;
X-CSE-ConnectionGUID: ZZ2IGjZRQg6oWcDI0vP7EQ==
X-CSE-MsgGUID: F5VJPe7cSsiU6XfKSAoAsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="910343"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="910343"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 18:22:24 -0700
X-CSE-ConnectionGUID: Lv5V6VB2QtGhXdHYpDfLcg==
X-CSE-MsgGUID: if/VIz2VSEa9v57lhON+3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="3657518"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 15 Oct 2026 18:22:23 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHWeK-00000000HO2-2u3b;
	Fri, 16 Oct 2026 01:22:20 +0000
Date: Fri, 16 Oct 2026 09:21:45 +0800
From: kernel test robot <lkp@intel.com>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC v3 1/8] drm: Move sink link rates reading helpers out
 of i915
Message-ID: <202610160925.QJrMX394-lkp@intel.com>
References: <20261012-feat_link_cap-v3-1-7517f4aba0f3@bootlin.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-feat_link_cap-v3-1-7517f4aba0f3@bootlin.com>

Hi Kory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 34e9ab0182494d7599dc9759bc216550d814b396]

url:    https://github.com/intel-lab-lkp/linux/commits/Kory-Maincent/drm-Move-sink-link-rates-reading-helpers-out-of-i915/20261012-171056
base:   34e9ab0182494d7599dc9759bc216550d814b396
patch link:    https://lore.kernel.org/r/20261012-feat_link_cap-v3-1-7517f4aba0f3%40bootlin.com
patch subject: [PATCH RFC v3 1/8] drm: Move sink link rates reading helpers out of i915
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20261016/202610160925.QJrMX394-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610160925.QJrMX394-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610160925.QJrMX394-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_dp_helper.c:4947:7: error: call to undeclared function 'drm_dp_tunnel_bw_alloc_is_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4947 |         if (!drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
         |              ^
>> drivers/gpu/drm/display/drm_dp_helper.c:4954:9: error: call to undeclared function 'drm_dp_tunnel_128b132b_dprx_rates'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4954 |         return drm_dp_tunnel_128b132b_dprx_rates(tunnel);
         |                ^
   drivers/gpu/drm/display/drm_dp_helper.c:4954:9: note: did you mean 'drm_dprx_128b132b_link_rates'?
   drivers/gpu/drm/display/drm_dp_helper.c:4944:11: note: 'drm_dprx_128b132b_link_rates' declared here
    4944 | static u8 drm_dprx_128b132b_link_rates(const struct drm_dp_tunnel *tunnel,
         |           ^
    4945 |                                        u8 uhbr_rates)
    4946 | {
    4947 |         if (!drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
    4948 |                 return uhbr_rates;
    4949 | 
    4950 |         static_assert(DP_TUNNELING_10GBPS_PER_LANE_SUPPORT == DP_UHBR10 &&
    4951 |                       DP_TUNNELING_13_5GBPS_PER_LANE_SUPPORT == DP_UHBR13_5 &&
    4952 |                       DP_TUNNELING_20GBPS_PER_LANE_SUPPORT == DP_UHBR20);
    4953 | 
    4954 |         return drm_dp_tunnel_128b132b_dprx_rates(tunnel);
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                drm_dprx_128b132b_link_rates
   drivers/gpu/drm/display/drm_dp_helper.c:4960:16: error: call to undeclared function 'drm_dp_tunnel_bw_alloc_is_enabled'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4960 |         if (tunnel && drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
         |                       ^
>> drivers/gpu/drm/display/drm_dp_helper.c:4961:10: error: call to undeclared function 'drm_dp_tunnel_128b132b_supported'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    4961 |                 return drm_dp_tunnel_128b132b_supported(tunnel);
         |                        ^
   drivers/gpu/drm/display/drm_dp_helper.c:4961:10: note: did you mean 'drm_dp_128b132b_supported'?
   include/drm/display/drm_dp_helper.h:283:1: note: 'drm_dp_128b132b_supported' declared here
     283 | drm_dp_128b132b_supported(const u8 dpcd[DP_RECEIVER_CAP_SIZE])
         | ^
   4 errors generated.


vim +/drm_dp_tunnel_bw_alloc_is_enabled +4947 drivers/gpu/drm/display/drm_dp_helper.c

  4943	
  4944	static u8 drm_dprx_128b132b_link_rates(const struct drm_dp_tunnel *tunnel,
  4945					       u8 uhbr_rates)
  4946	{
> 4947		if (!drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
  4948			return uhbr_rates;
  4949	
  4950		static_assert(DP_TUNNELING_10GBPS_PER_LANE_SUPPORT == DP_UHBR10 &&
  4951			      DP_TUNNELING_13_5GBPS_PER_LANE_SUPPORT == DP_UHBR13_5 &&
  4952			      DP_TUNNELING_20GBPS_PER_LANE_SUPPORT == DP_UHBR20);
  4953	
> 4954		return drm_dp_tunnel_128b132b_dprx_rates(tunnel);
  4955	}
  4956	
  4957	static bool drm_dprx_supports_128b132b(const struct drm_dp_tunnel *tunnel,
  4958					       const u8 dpcd[DP_RECEIVER_CAP_SIZE])
  4959	{
> 4960		if (tunnel && drm_dp_tunnel_bw_alloc_is_enabled(tunnel))
> 4961			return drm_dp_tunnel_128b132b_supported(tunnel);
  4962		else
  4963			return drm_dp_128b132b_supported(dpcd);
  4964	}
  4965	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
