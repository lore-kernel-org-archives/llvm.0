Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4655E27A90F;
	Fri, 25 Apr 2025 15:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745595214; cv=none; b=KIrbGf+dVgH50uM1XMqpNfDu876TzBgsctS3MLfU+7oe6SyoyvEz3k81bjNm1/iIHykGohL38LQz2ZWOGqjghXe7DFp43A4OM5vn+ppcnx/Jm6/Zy9/5Jq8GNnBbsQGM0g14ub98BMDVvMvmboMxEuaaG6MQ52exQWo/P2LpCP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745595214; c=relaxed/simple;
	bh=gvS0qA2h0URKv08JqzPta5fpynmYOVn2vFyaSGB7UoY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OH2T2lIwR4wNWS5A1ki28T4gVsBC3x9v74qPaUj9VL+i0Q3huvxvEg+XY+IvIUCuG0YFZgKtZsBy1ga9ECzqDtPN9KrlhmXWuXBHb4jgcEdbW757J7HVF7UmElub6j3sqeyEopcGj2h2NlDbg5y83j2zoioPv8S7cQ+si+Wq8CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVBQCmV9; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVBQCmV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745595211; x=1777131211;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gvS0qA2h0URKv08JqzPta5fpynmYOVn2vFyaSGB7UoY=;
  b=SVBQCmV9mHFwyAzNzlUqfQdlY8YTU16KtayQ1GwkdGCbkrovJ5PJ/ktx
   6OtdV/ISkHU2pXDlAPONDPjpljN/1L2a9hvlZxZoL/FMDfo8FkLczHJgB
   flwK3vNNBu73bFCW/z3u8rG4stgQS2o5sTH1zqKJEcb8p8ui8wnyCuU2D
   BkXZY1EC36unMKnhdIdvK1TnoA64RStomMl1SBEPQ+QxCOqdaR4sJWEoQ
   yIZOen7C37BGwKnNB2ylW24eHOHANnEZb5eeyG7PALU0eo1VDQo5AXOE5
   lVneRt3V/yD4Vr0ZTsAWEWfrKHBIJF7fOg4tC4rzjhMbIAC2ojcoMI9dS
   w==;
X-CSE-ConnectionGUID: kjZs+1oqSvC8KL3sCqOqpg==
X-CSE-MsgGUID: uSOT9srNTL69jWtlR00Odg==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="51068553"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51068553"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 08:33:30 -0700
X-CSE-ConnectionGUID: nojkNIp4RzOCXjmE6frFdw==
X-CSE-MsgGUID: wwvLVohQS52+Fd6juIiKzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="133435937"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Apr 2025 08:33:29 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8L3O-0005JN-2V;
	Fri, 25 Apr 2025 15:33:26 +0000
Date: Fri, 25 Apr 2025 23:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH wireless-next v7 1/3] wifi: cfg80211: Add Support to Set
 RTS Threshold for each Radio
Message-ID: <202504252342.Myui0D81-lkp@intel.com>
References: <20250424134752.871886-2-quic_rdevanat@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424134752.871886-2-quic_rdevanat@quicinc.com>

Hi Roopni,

kernel test robot noticed the following build warnings:

[auto build test WARNING on f600832794c91d7021d7337104734246b02a2b86]

url:    https://github.com/intel-lab-lkp/linux/commits/Roopni-Devanathan/wifi-cfg80211-Add-Support-to-Set-RTS-Threshold-for-each-Radio/20250424-215112
base:   f600832794c91d7021d7337104734246b02a2b86
patch link:    https://lore.kernel.org/r/20250424134752.871886-2-quic_rdevanat%40quicinc.com
patch subject: [PATCH wireless-next v7 1/3] wifi: cfg80211: Add Support to Set RTS Threshold for each Radio
config: arm64-randconfig-001-20250425 (https://download.01.org/0day-ci/archive/20250425/202504252342.Myui0D81-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504252342.Myui0D81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504252342.Myui0D81-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/wireless/nl80211.c:3625:3: warning: variable 'changed' is uninitialized when used here [-Wuninitialized]
    3625 |                 changed |= WIPHY_PARAM_RTS_THRESHOLD;
         |                 ^~~~~~~
   net/wireless/nl80211.c:3616:47: note: initialize the variable 'changed' to silence this warning
    3616 |         u32 rts_threshold, old_rts_threshold, changed;
         |                                                      ^
         |                                                       = 0
   1 warning generated.


vim +/changed +3625 net/wireless/nl80211.c

  3611	
  3612	static int nl80211_set_wiphy_radio(struct genl_info *info,
  3613					   struct cfg80211_registered_device *rdev,
  3614					   u8 radio_id)
  3615	{
  3616		u32 rts_threshold, old_rts_threshold, changed;
  3617		int result = 0;
  3618	
  3619		if (!rdev->ops->set_wiphy_params)
  3620			return -EOPNOTSUPP;
  3621	
  3622		if (info->attrs[NL80211_ATTR_WIPHY_RTS_THRESHOLD]) {
  3623			rts_threshold = nla_get_u32(
  3624					info->attrs[NL80211_ATTR_WIPHY_RTS_THRESHOLD]);
> 3625			changed |= WIPHY_PARAM_RTS_THRESHOLD;
  3626		}
  3627	
  3628		if (changed) {
  3629			old_rts_threshold = rdev->wiphy.radio_cfg[radio_id].rts_threshold;
  3630	
  3631			rdev->wiphy.radio_cfg[radio_id].rts_threshold = rts_threshold;
  3632	
  3633			result = rdev_set_wiphy_params(rdev, radio_id, changed);
  3634			if (result)
  3635				rdev->wiphy.radio_cfg[radio_id].rts_threshold = old_rts_threshold;
  3636		}
  3637	
  3638		return result;
  3639	}
  3640	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
