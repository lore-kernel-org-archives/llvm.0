Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2193B3C06;
	Fri,  5 Jun 2026 06:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780639281; cv=none; b=l23QkxZL/aWXwmhZeFJzBCNUNajNMUpu3QuTzzywB3Q4wY37k5NYqO+yIQAKIurjXqKaafUM39sG5s8Zla/c+CNUCWskzbmY8CezA7aslLZ4ArmWxLSk7dCRc1WW7CxL3sxNuDIGQ0R1iGyWeeMR6uCNZklsX7Lb1/YIkBg4ABY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780639281; c=relaxed/simple;
	bh=tY6regCDfxsJMRTuKfW2fWQKp1ZiqWp9qdTqXQawT8c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jxCaqUC24BALdnKOfbDV3bf2VZCjLtn74TQZSXJ3Nwz2rXdbDpZthgQAT6Pyi0+11dZVZukFICwVsSgneEjYWcpfySDP114tWxnINUHcFk3KQaF3QdkOYoryPvB7K9wQGEQm9SSo42wuY6xZU71bQn9W2UwwcnwJxBXTKY0iTq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIaxdI8m; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIaxdI8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780639279; x=1812175279;
  h=date:from:to:cc:subject:message-id;
  bh=tY6regCDfxsJMRTuKfW2fWQKp1ZiqWp9qdTqXQawT8c=;
  b=IIaxdI8mpuNytUfVJ4D9foWY/xtEKyGiYGitzfe6J7+rYUwlDkEZB8ik
   HxCr8B7zq3dv5ZOQ/UO38DawKaryJXJu+DQ+ZM/zXbUHDhNjGxiufgybK
   bq4mrszRmaCa0ddK1hnyHDLIp+JoYNAhKh7ywJ+86CbWBv/xXq0sm7GUW
   aMJzals4+7N5pZIKisR8gvVxzGX5FOpgIONCZddDUUs4zJNkMAdZEZTKU
   6ytrlAiIgOvoHNSDZl1Txha+TwvaJXKenag3CdQOXVQB/O5Mal+6exDja
   mrdQQ43/FXNJOyGMrzB29nI5JJVU6OqGlH2r3Po4gxsVWR2Ta86+Jm4dD
   w==;
X-CSE-ConnectionGUID: eODHcOihTxSbJY83U8aUoQ==
X-CSE-MsgGUID: ljqvUvn0R361gYgDmDOQ/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="91786421"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="91786421"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 23:01:19 -0700
X-CSE-ConnectionGUID: mhpXvIVfR+uc9hPPVCek3Q==
X-CSE-MsgGUID: Wzy+QJ92TsmavLj4irrY0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249088734"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Jun 2026 23:01:16 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVNcH-00000000Fau-1wUa;
	Fri, 05 Jun 2026 06:01:13 +0000
Date: Fri, 05 Jun 2026 14:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
 Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [ath:master 2/4] net/wireless/nl80211.c:6993:36: error: no
 member named 'he_oper' in 'struct cfg80211_ap_settings'
Message-ID: <202606051350.TYjbkXmP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git master
head:   d54e5a797eebf0ef8c91f628aac578128b39a0b1
commit: da16cf9abfd30e79c6c7ed7c4f8bf8b1316b934b [2/4] Merge remote-tracking branch 'wireless-next/main'
config: sparc64-randconfig-002-20260605 (https://download.01.org/0day-ci/archive/20260605/202606051350.TYjbkXmP-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 7917772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051350.TYjbkXmP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051350.TYjbkXmP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/wireless/nl80211.c:6993:36: error: no member named 'he_oper' in 'struct cfg80211_ap_settings'
    6993 |         if (!!params->he_cap != !!params->he_oper)
         |                                   ~~~~~~  ^
>> net/wireless/nl80211.c:6996:37: error: no member named 'eht_oper' in 'struct cfg80211_ap_settings'
    6996 |         if (!!params->eht_cap != !!params->eht_oper)
         |                                    ~~~~~~  ^
   2 errors generated.


vim +6993 net/wireless/nl80211.c

7443dcd1f1718a Aloka Dixit   2020-09-11  6942  
66cd794e3c30b8 Johannes Berg 2017-02-07  6943  /*
66cd794e3c30b8 Johannes Berg 2017-02-07  6944   * Since the nl80211 API didn't include, from the beginning, attributes about
a384ae96990250 Johannes Berg 2026-04-15  6945   * HT/VHT/... capabilities, we parse them out of the elements and check for
a384ae96990250 Johannes Berg 2026-04-15  6946   * validity for use by drivers/mac80211.
66cd794e3c30b8 Johannes Berg 2017-02-07  6947   */
d642e759b73cbf Johannes Berg 2026-04-15  6948  static int nl80211_calculate_ap_capabilities(struct genl_info *info,
d642e759b73cbf Johannes Berg 2026-04-15  6949  					     struct cfg80211_ap_settings *params)
66cd794e3c30b8 Johannes Berg 2017-02-07  6950  {
a384ae96990250 Johannes Berg 2026-04-15  6951  	size_t ies_len = params->beacon.tail_len;
a384ae96990250 Johannes Berg 2026-04-15  6952  	const u8 *ies = params->beacon.tail;
153e2a11c99b73 Johannes Berg 2021-09-30  6953  	const struct element *cap;
66cd794e3c30b8 Johannes Berg 2017-02-07  6954  
153e2a11c99b73 Johannes Berg 2021-09-30  6955  	cap = cfg80211_find_elem(WLAN_EID_HT_CAPABILITY, ies, ies_len);
d642e759b73cbf Johannes Berg 2026-04-15  6956  	if (cap) {
d642e759b73cbf Johannes Berg 2026-04-15  6957  		if (cap->datalen < sizeof(*params->ht_cap)) {
d642e759b73cbf Johannes Berg 2026-04-15  6958  			GENL_SET_ERR_MSG(info, "bad HT capability in beacon");
d642e759b73cbf Johannes Berg 2026-04-15  6959  			return -EINVAL;
d642e759b73cbf Johannes Berg 2026-04-15  6960  		}
153e2a11c99b73 Johannes Berg 2021-09-30  6961  		params->ht_cap = (void *)cap->data;
d642e759b73cbf Johannes Berg 2026-04-15  6962  	}
d642e759b73cbf Johannes Berg 2026-04-15  6963  
153e2a11c99b73 Johannes Berg 2021-09-30  6964  	cap = cfg80211_find_elem(WLAN_EID_VHT_CAPABILITY, ies, ies_len);
d642e759b73cbf Johannes Berg 2026-04-15  6965  	if (cap) {
d642e759b73cbf Johannes Berg 2026-04-15  6966  		if (cap->datalen < sizeof(*params->vht_cap)) {
d642e759b73cbf Johannes Berg 2026-04-15  6967  			GENL_SET_ERR_MSG(info, "bad VHT capability in beacon");
d642e759b73cbf Johannes Berg 2026-04-15  6968  			return -EINVAL;
d642e759b73cbf Johannes Berg 2026-04-15  6969  		}
153e2a11c99b73 Johannes Berg 2021-09-30  6970  		params->vht_cap = (void *)cap->data;
d642e759b73cbf Johannes Berg 2026-04-15  6971  	}
d642e759b73cbf Johannes Berg 2026-04-15  6972  
153e2a11c99b73 Johannes Berg 2021-09-30  6973  	cap = cfg80211_find_ext_elem(WLAN_EID_EXT_HE_CAPABILITY, ies, ies_len);
d642e759b73cbf Johannes Berg 2026-04-15  6974  	if (cap) {
d642e759b73cbf Johannes Berg 2026-04-15  6975  		if (cap->datalen < sizeof(*params->he_cap) + 1) {
d642e759b73cbf Johannes Berg 2026-04-15  6976  			GENL_SET_ERR_MSG(info, "bad HE capability in beacon");
d642e759b73cbf Johannes Berg 2026-04-15  6977  			return -EINVAL;
d642e759b73cbf Johannes Berg 2026-04-15  6978  		}
153e2a11c99b73 Johannes Berg 2021-09-30  6979  		params->he_cap = (void *)(cap->data + 1);
d642e759b73cbf Johannes Berg 2026-04-15  6980  	}
d642e759b73cbf Johannes Berg 2026-04-15  6981  
8bc65d38ee4668 Aloka Dixit   2022-05-22  6982  	cap = cfg80211_find_ext_elem(WLAN_EID_EXT_EHT_CAPABILITY, ies, ies_len);
8bc65d38ee4668 Aloka Dixit   2022-05-22  6983  	if (cap) {
8bc65d38ee4668 Aloka Dixit   2022-05-22  6984  		params->eht_cap = (void *)(cap->data + 1);
8bc65d38ee4668 Aloka Dixit   2022-05-22  6985  		if (!ieee80211_eht_capa_size_ok((const u8 *)params->he_cap,
8bc65d38ee4668 Aloka Dixit   2022-05-22  6986  						(const u8 *)params->eht_cap,
d642e759b73cbf Johannes Berg 2026-04-15  6987  						cap->datalen - 1, true)) {
d642e759b73cbf Johannes Berg 2026-04-15  6988  			GENL_SET_ERR_MSG(info, "bad EHT capability in beacon");
8bc65d38ee4668 Aloka Dixit   2022-05-22  6989  			return -EINVAL;
8bc65d38ee4668 Aloka Dixit   2022-05-22  6990  		}
8bc65d38ee4668 Aloka Dixit   2022-05-22  6991  	}
072e6f7f416f5d Johannes Berg 2026-01-30  6992  
cb9959ab5f9961 Johannes Berg 2026-06-03 @6993  	if (!!params->he_cap != !!params->he_oper)
cb9959ab5f9961 Johannes Berg 2026-06-03  6994  		return -EINVAL;
cb9959ab5f9961 Johannes Berg 2026-06-03  6995  
cb9959ab5f9961 Johannes Berg 2026-06-03 @6996  	if (!!params->eht_cap != !!params->eht_oper)
cb9959ab5f9961 Johannes Berg 2026-06-03  6997  		return -EINVAL;
cb9959ab5f9961 Johannes Berg 2026-06-03  6998  
8bc65d38ee4668 Aloka Dixit   2022-05-22  6999  	return 0;
66cd794e3c30b8 Johannes Berg 2017-02-07  7000  }
66cd794e3c30b8 Johannes Berg 2017-02-07  7001  

:::::: The code at line 6993 was first introduced by commit
:::::: cb9959ab5f99611d27a06586add84811fe8102dc wifi: cfg80211: enforce HE/EHT cap/oper consistency

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
