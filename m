Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5181288CC;
	Tue,  8 Apr 2025 02:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744080555; cv=none; b=NhIHM6arJWOqd2NsR7SWiUE9JBIyHwuvUjRZ82sG+r7XTAoHfKyocN4TTI/fqmpzz24QZdKKb0iGni6qSGc2NK4s8xVJOXRBAJt9bzY2TTPVoiP7qwGc0I0lXIHZSXSh7G0klWlpdzniCh7OOSTGjG1YcSMTIvl3767p0wocnwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744080555; c=relaxed/simple;
	bh=L/v7CecpC6BTmGaF7wHdxMqFWHXkCPsXe5K4czaw6IY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UAaexQM0056XaN+oGDnnaHfsS6APTMZ1dJCqpaafoOfPTuZIDFxzPhzDh45a1hOJmjll7YwkE8yardqwK8TsKY7TXCl8FrpFWnpWGX1lMdv57A9TN8WMoH80tgR/c+vP19DzM/kzGG3+xKeFDjJqJuRcZz7zUXBwGrhCvKFqC6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pzd29ZU1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pzd29ZU1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744080553; x=1775616553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L/v7CecpC6BTmGaF7wHdxMqFWHXkCPsXe5K4czaw6IY=;
  b=Pzd29ZU1j+xldlp2+WTJbkyH4SMsJNe8kbj6zymnCV6CxV/QbgJFyFqT
   AKr5naQU18je7LU++00sqWyyZI9La41Jl9feVwaIFxBrhwOwTXnOxCDXQ
   Qr9rYgVxTHNz93DF8IpxJ+1n5NANtphp9sUStoyAXTy41Ulz/peFPHxEU
   cnzA8Jyh4TI9kwGc9SMFVE/b8Q9it4laQluN+Iiu8ibPqL8ETYJ7wMgBF
   ya5jdSdH5pjg5GbtU3ebeZlSszojd6RfTXa3PEwNnWfMhcaPaSW9xw1B7
   NpduC//Y7Ju9/SkNqRHPeYRoSnyiG5TK4x7Ak0HNBB46pgIpK0zgeiuG/
   g==;
X-CSE-ConnectionGUID: KBCJiVrFRrGmbgcv+0Owag==
X-CSE-MsgGUID: Zhf1au/iSRK6Qh2x+96N5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="67967873"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="67967873"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:49:13 -0700
X-CSE-ConnectionGUID: Zt6bYxM7R4yHZPedmvcmEQ==
X-CSE-MsgGUID: tedNJ8sHT0WQ4JQCmThVJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="127886676"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Apr 2025 19:49:10 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1z1P-00042Z-21;
	Tue, 08 Apr 2025 02:49:07 +0000
Date: Tue, 8 Apr 2025 10:48:30 +0800
From: kernel test robot <lkp@intel.com>
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Rajat Soni <quic_rajson@quicinc.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [ath:ath12k-split-phy 63/169]
 drivers/net/wireless/ath/ath12k/reg.c:245:13: warning: variable 'freq_low'
 is used uninitialized whenever 'if' condition is false
Message-ID: <202504081054.5RQgJOIZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
head:   31d82c3b3b8782ff326a188f2ae78d3d9f333448
commit: 6ca04f359a7046dac7b96fc29808568513406aea [63/169] wifi: ath12k: Update frequency range if reg rules changes
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250408/202504081054.5RQgJOIZ-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081054.5RQgJOIZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081054.5RQgJOIZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath12k/reg.c:6:
   In file included from include/linux/rtnetlink.h:7:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath12k/reg.c:245:13: warning: variable 'freq_low' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     245 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:250:35: note: uninitialized use occurs here
     250 |         ath12k_mac_update_freq_range(ar, freq_low, freq_high);
         |                                          ^~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:245:9: note: remove the 'if' if its condition is always true
     245 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath12k/reg.c:245:13: warning: variable 'freq_low' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     245 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:250:35: note: uninitialized use occurs here
     250 |         ath12k_mac_update_freq_range(ar, freq_low, freq_high);
         |                                          ^~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:245:13: note: remove the '&&' if its condition is always true
     245 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:211:22: note: initialize the variable 'freq_low' to silence this warning
     211 |         u32 phy_id, freq_low, freq_high, supported_bands, band;
         |                             ^
         |                              = 0
>> drivers/net/wireless/ath/ath12k/reg.c:245:13: warning: variable 'freq_high' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     245 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:250:45: note: uninitialized use occurs here
     250 |         ath12k_mac_update_freq_range(ar, freq_low, freq_high);
         |                                                    ^~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:245:9: note: remove the 'if' if its condition is always true
     245 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath12k/reg.c:245:13: warning: variable 'freq_high' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     245 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:250:45: note: uninitialized use occurs here
     250 |         ath12k_mac_update_freq_range(ar, freq_low, freq_high);
         |                                                    ^~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:245:13: note: remove the '&&' if its condition is always true
     245 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:211:33: note: initialize the variable 'freq_high' to silence this warning
     211 |         u32 phy_id, freq_low, freq_high, supported_bands, band;
         |                                        ^
         |                                         = 0
   7 warnings generated.


vim +245 drivers/net/wireless/ath/ath12k/reg.c

   207	
   208	int ath12k_regd_update(struct ath12k *ar, bool init)
   209	{
   210		struct ath12k_wmi_hal_reg_capabilities_ext_arg *reg_cap;
   211		u32 phy_id, freq_low, freq_high, supported_bands, band;
   212		struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
   213		struct ieee80211_hw *hw = ah->hw;
   214		struct ieee80211_regdomain *regd, *regd_copy = NULL;
   215		int ret, regd_len, pdev_id;
   216		struct ath12k_base *ab;
   217		int i;
   218	
   219		ab = ar->ab;
   220	
   221		supported_bands = ar->pdev->cap.supported_bands;
   222		if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP)
   223			band = NL80211_BAND_2GHZ;
   224		else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6ghz)
   225			band = NL80211_BAND_5GHZ;
   226		else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz)
   227			band = NL80211_BAND_6GHZ;
   228	
   229		reg_cap = &ab->hal_reg_cap[ar->pdev_idx];
   230	
   231		if (ab->hw_params->single_pdev_only && !ar->supports_6ghz) {
   232			phy_id = ar->pdev->cap.band[band].phy_id;
   233			reg_cap = &ab->hal_reg_cap[phy_id];
   234		}
   235	
   236		/* Possible that due to reg change, current limits for supported
   237		 * frequency changed. Update that
   238		 */
   239		if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
   240			freq_low = max(reg_cap->low_2ghz_chan, ab->reg_freq_2ghz.start_freq);
   241			freq_high = min(reg_cap->high_2ghz_chan, ab->reg_freq_2ghz.end_freq);
   242		} else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6ghz) {
   243			freq_low = max(reg_cap->low_5ghz_chan, ab->reg_freq_5ghz.start_freq);
   244			freq_high = min(reg_cap->high_5ghz_chan, ab->reg_freq_5ghz.end_freq);
 > 245		} else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
   246			freq_low = max(reg_cap->low_5ghz_chan, ab->reg_freq_6ghz.start_freq);
   247			freq_high = min(reg_cap->high_5ghz_chan, ab->reg_freq_6ghz.end_freq);
   248		}
   249	
   250		ath12k_mac_update_freq_range(ar, freq_low, freq_high);
   251	
   252		ath12k_dbg(ab, ATH12K_DBG_REG, "pdev %u reg updated freq limits %u->%u MHz\n",
   253			   ar->pdev->pdev_id, freq_low,
   254			   freq_high);
   255	
   256		/* If one of the radios within ah has already updated the regd for
   257		 * the wiphy, then avoid setting regd again
   258		 */
   259		if (ah->regd_updated)
   260			return 0;
   261	
   262		/* firmware provides reg rules which are similar for 2 GHz and 5 GHz
   263		 * pdev but 6 GHz pdev has superset of all rules including rules for
   264		 * all bands, we prefer 6 GHz pdev's rules to be used for setup of
   265		 * the wiphy regd.
   266		 * If 6 GHz pdev was part of the ath12k_hw, wait for the 6 GHz pdev,
   267		 * else pick the first pdev which calls this function and use its
   268		 * regd to update global hw regd.
   269		 * The regd_updated flag set at the end will not allow any further
   270		 * updates.
   271		 */
   272		if (ah->use_6ghz_regd && !ar->supports_6ghz)
   273			return 0;
   274	
   275		pdev_id = ar->pdev_idx;
   276	
   277		spin_lock_bh(&ab->base_lock);
   278	
   279		if (init) {
   280			/* Apply the regd received during init through
   281			 * WMI_REG_CHAN_LIST_CC event. In case of failure to
   282			 * receive the regd, initialize with a default world
   283			 * regulatory.
   284			 */
   285			if (ab->default_regd[pdev_id]) {
   286				regd = ab->default_regd[pdev_id];
   287			} else {
   288				ath12k_warn(ab,
   289					    "failed to receive default regd during init\n");
   290				regd = (struct ieee80211_regdomain *)&ath12k_world_regd;
   291			}
   292		} else {
   293			regd = ab->new_regd[pdev_id];
   294		}
   295	
   296		if (!regd) {
   297			ret = -EINVAL;
   298			spin_unlock_bh(&ab->base_lock);
   299			goto err;
   300		}
   301	
   302		regd_len = sizeof(*regd) + (regd->n_reg_rules *
   303			sizeof(struct ieee80211_reg_rule));
   304	
   305		regd_copy = kzalloc(regd_len, GFP_ATOMIC);
   306		if (regd_copy)
   307			ath12k_copy_regd(regd, regd_copy);
   308	
   309		spin_unlock_bh(&ab->base_lock);
   310	
   311		if (!regd_copy) {
   312			ret = -ENOMEM;
   313			goto err;
   314		}
   315	
   316		rtnl_lock();
   317		wiphy_lock(hw->wiphy);
   318		ret = regulatory_set_wiphy_regd_sync(hw->wiphy, regd_copy);
   319		wiphy_unlock(hw->wiphy);
   320		rtnl_unlock();
   321	
   322		kfree(regd_copy);
   323	
   324		if (ret)
   325			goto err;
   326	
   327		if (ah->state != ATH12K_HW_STATE_ON)
   328			goto skip;
   329	
   330		ah->regd_updated = true;
   331		/* Apply the new regd to all the radios, this is expected to be received only once
   332		 * since we check for ah->regd_updated and allow here only once.
   333		 */
   334		for_each_ar(ah, ar, i) {
   335			ab = ar->ab;
   336			ret = ath12k_reg_update_chan_list(ar);
   337			if (ret)
   338				goto err;
   339		}
   340	skip:
   341		return 0;
   342	err:
   343		ath12k_warn(ab, "failed to perform regd update : %d\n", ret);
   344		return ret;
   345	}
   346	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
