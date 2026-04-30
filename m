Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ECB1A6807;
	Thu, 30 Apr 2026 05:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777525716; cv=none; b=EapyMUwgSbwIFsy55ymVKRC1jWgKczTTIGpJ0Rb4vAfYeI1QiGn9pQWmo1G8Ic4dIT2mMlDpODNzhSUV/0JyeU67OD27ctT+qumzGZTlmXD5griK1/vdRJQMEpoJwuIShhCODUo1kuu2NzkoBh736skyrL3wIGCRmHXTN83I/3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777525716; c=relaxed/simple;
	bh=e7aJ/jt3+EzrCDJpBSChJgGbMMdquB8i67wdArIv8MM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HRDzQuhOulkHDSCDuBkvVjggrN8Y+ug6m2HO33uAaq8cF1qt8gniVCJM5Dy2hR+OHfqQ/LIbaILhxBMfpt2K6krR3/X3NyflIAIXNPztiU62dWzZvB69CMA4YJ47n7yd82go7KFXRWqLAOw/595PARshxpoW8XMV5q2I/+GzwoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I/uxM0JZ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/uxM0JZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777525715; x=1809061715;
  h=date:from:to:cc:subject:message-id;
  bh=e7aJ/jt3+EzrCDJpBSChJgGbMMdquB8i67wdArIv8MM=;
  b=I/uxM0JZAU3PjCsoRNMvbmVTvbZmPA4IlDxgGlUGbflAcqVAWYynkolp
   3YStRl49vF4W/BteE0ci1TtNFVDHFkVzGzKIWwThLx4/IGd7bexwKOAYC
   GkcaZzMYv2cFt22puvsnAgABhjJLaAHfQvmzToWBmp/raJkHjvymhxeg8
   lAw3gg4XGibSSr3leNW/IF4P4CEQh/6UfcE/v4AJ3C3JU7lejnzADReYq
   37o0gNzu1DMnqi/kh0aFJ+VKsS4NqKQKynl6mZLAnPI4BnPuLsD4SfU4x
   f5ROrFhdt7Ewdm0v+PFzfQ7ogsu+6v7Zp7+43kzuVkkAwx5kuVtSjShm1
   g==;
X-CSE-ConnectionGUID: VP33U9U0SMacMDwlgCfJsw==
X-CSE-MsgGUID: R9cJ7mOkTGi+fNSwoSmRZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78490658"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="78490658"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 22:08:35 -0700
X-CSE-ConnectionGUID: dsgIHKLxQambFKg6FGbSrg==
X-CSE-MsgGUID: y2rw4JdYTQ+Ps0cmEGmZ6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="227972585"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 29 Apr 2026 22:08:32 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIJdW-000000004kn-1XlZ;
	Thu, 30 Apr 2026 05:08:30 +0000
Date: Thu, 30 Apr 2026 07:07:59 +0200
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: drivers/net/wireless/virtual/mac80211_hwsim_nan.c:97:12:
 warning: address of array 'conf->cluster_id' will always evaluate to 'true'
Message-ID: <202604300631.LcjE8F8k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Miri-Korenblit/wifi-mac80211-track-the-id-of-the-NAN-cluster-we-joined/20260430-070259
head:   e0435b199cd58dfc68f8fdfe1fe2bcec997c731c
commit: be631fda189889f9d902d39905c931f3a8364bf3 wifi: mac80211_hwsim: split NAN handling into separate file
date:   6 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260430/202604300631.LcjE8F8k-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604300631.LcjE8F8k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604300631.LcjE8F8k-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/virtual/mac80211_hwsim_nan.c:97:12: warning: address of array 'conf->cluster_id' will always evaluate to 'true' [-Wpointer-bool-conversion]
      97 |         if (conf->cluster_id && !is_zero_ether_addr(conf->cluster_id) &&
         |             ~~~~~~^~~~~~~~~~ ~~
   1 warning generated.


vim +97 drivers/net/wireless/virtual/mac80211_hwsim_nan.c

    68	
    69	int mac80211_hwsim_nan_start(struct ieee80211_hw *hw,
    70				     struct ieee80211_vif *vif,
    71				     struct cfg80211_nan_conf *conf)
    72	{
    73		struct mac80211_hwsim_data *data = hw->priv;
    74		u64 tsf = mac80211_hwsim_get_tsf(hw, NULL);
    75		u32 dw_int = 512 * 1000;
    76		u64 until_dw = dw_int - do_div(tsf, dw_int);
    77		struct wireless_dev *wdev = ieee80211_vif_to_wdev(vif);
    78	
    79		if (vif->type != NL80211_IFTYPE_NAN)
    80			return -EINVAL;
    81	
    82		if (data->nan.device_vif)
    83			return -EALREADY;
    84	
    85		/* set this before starting the timer, as preemption might occur */
    86		data->nan.device_vif = vif;
    87		data->nan.bands = conf->bands;
    88		data->nan.curr_dw_band = NL80211_BAND_2GHZ;
    89	
    90		wiphy_debug(hw->wiphy, "nan_started, next_dw=%llu\n",
    91			    until_dw);
    92	
    93		hrtimer_start(&data->nan.timer,
    94			      ns_to_ktime(until_dw * NSEC_PER_USEC),
    95			      HRTIMER_MODE_REL_SOFT);
    96	
  > 97		if (conf->cluster_id && !is_zero_ether_addr(conf->cluster_id) &&
    98		    is_zero_ether_addr(hwsim_nan_cluster_id)) {
    99			memcpy(hwsim_nan_cluster_id, conf->cluster_id, ETH_ALEN);
   100		} else if (is_zero_ether_addr(hwsim_nan_cluster_id)) {
   101			hwsim_nan_cluster_id[0] = 0x50;
   102			hwsim_nan_cluster_id[1] = 0x6f;
   103			hwsim_nan_cluster_id[2] = 0x9a;
   104			hwsim_nan_cluster_id[3] = 0x01;
   105			hwsim_nan_cluster_id[4] = get_random_u8();
   106			hwsim_nan_cluster_id[5] = get_random_u8();
   107		}
   108	
   109		data->nan.notify_dw = conf->enable_dw_notification;
   110	
   111		cfg80211_nan_cluster_joined(wdev, hwsim_nan_cluster_id, true,
   112					    GFP_KERNEL);
   113	
   114		return 0;
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
