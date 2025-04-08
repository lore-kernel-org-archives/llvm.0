Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4304F205AD6;
	Tue,  8 Apr 2025 04:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744087111; cv=none; b=D6K8MnwkokC7rp2ofhjbcRDEqXOlb5QlaImqrYjIvCE2wJT2Qevr9aAh2RTHGlGbaY90LxI66wAsdAkIRu46Tmk8pQTI90BT4FGxZGKBHEN1dM2t2KNPNhfnCSsTj63/QiHTdKz3lHua5TQt7nb8jhwzL6Qi1kuEf6xcOGoCwyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744087111; c=relaxed/simple;
	bh=Zv55tHddw8z6nF2cxRg2YduP5dh4XvfzcppA91UjuN8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHXtZTBfuyhtAvPrqX9Q9NwqEYy5Yno/CGuD5VsP8VR6A5n1nQKdd4ccJdAg/urxSXKVtrPoDnrWbJjyznYsUpol3153YthpcBeOMN7+GJDEXK4lvzUZyaQjSc0W2s1Wv4ANrdn1+iTeiA4wAmboumxSEQNBhhKnM12i45kVOSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fj09ofMT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fj09ofMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744087108; x=1775623108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zv55tHddw8z6nF2cxRg2YduP5dh4XvfzcppA91UjuN8=;
  b=fj09ofMTaySOVuhxMT/IQ5Q9A5Yo9Ns7drO/DF5PvCXiZeRcO2Ch1d1U
   lWOJ6H3XYttLQQ/z1vEg5wcKwyjNa8YXelrswyzQYj0jMPjxbwTfBHb6n
   uCdeCgpRNgOrZPMSbbJCpmQH+Gafa5VyL98ML7CPNFInyYnRGviuPxONn
   cvymxrQ38ceU3YWlfXhj1OmuFr/Cnd4J17uCtH2fQVAFLy7NhJTHL48C5
   ZHTPcIyOqlkNLe8D+aORbWJ6FWETSC3R2eZJDC02wSquc4FxQ66H6v7K9
   PHY2UA9teMb2s3qaipan68kp1U1+Ynjecj49ce1EClTYm/0jiZ6jWXB29
   Q==;
X-CSE-ConnectionGUID: LXJUJ7SYRJmLKIVugnC4xw==
X-CSE-MsgGUID: QjzeXvQBTJeEJ+/NAPhPFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45386102"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45386102"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 21:38:27 -0700
X-CSE-ConnectionGUID: 9GusZXIOQqq1HNKXLyn80w==
X-CSE-MsgGUID: 9aNyijv7THCimtDWRKc+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="151338746"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Apr 2025 21:38:25 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u20j9-00047P-0C;
	Tue, 08 Apr 2025 04:38:23 +0000
Date: Tue, 8 Apr 2025 12:38:08 +0800
From: kernel test robot <lkp@intel.com>
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Subject: [ath:ath12k-split-phy 64/169]
 drivers/net/wireless/ath/ath12k/reg.c:243:11: warning: variable 'band' is
 used uninitialized whenever 'if' condition is false
Message-ID: <202504081251.hX88VR4a-lkp@intel.com>
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
commit: 831c6c9cc5355e281e53da62045bf950f8d9e3ca [64/169] wifi: ath12k: combine channel list for splitphy
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250408/202504081251.hX88VR4a-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081251.hX88VR4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081251.hX88VR4a-lkp@intel.com/

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
   drivers/net/wireless/ath/ath12k/reg.c:263:13: warning: variable 'freq_low' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     263 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:268:35: note: uninitialized use occurs here
     268 |         ath12k_mac_update_freq_range(ar, freq_low, freq_high);
         |                                          ^~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:263:9: note: remove the 'if' if its condition is always true
     263 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:263:13: warning: variable 'freq_low' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     263 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:268:35: note: uninitialized use occurs here
     268 |         ath12k_mac_update_freq_range(ar, freq_low, freq_high);
         |                                          ^~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:263:13: note: remove the '&&' if its condition is always true
     263 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:228:22: note: initialize the variable 'freq_low' to silence this warning
     228 |         u32 phy_id, freq_low, freq_high, supported_bands, band;
         |                             ^
         |                              = 0
   drivers/net/wireless/ath/ath12k/reg.c:263:13: warning: variable 'freq_high' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     263 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:268:45: note: uninitialized use occurs here
     268 |         ath12k_mac_update_freq_range(ar, freq_low, freq_high);
         |                                                    ^~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:263:9: note: remove the 'if' if its condition is always true
     263 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:263:13: warning: variable 'freq_high' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     263 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:268:45: note: uninitialized use occurs here
     268 |         ath12k_mac_update_freq_range(ar, freq_low, freq_high);
         |                                                    ^~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:263:13: note: remove the '&&' if its condition is always true
     263 |         } else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:228:33: note: initialize the variable 'freq_high' to silence this warning
     228 |         u32 phy_id, freq_low, freq_high, supported_bands, band;
         |                                        ^
         |                                         = 0
>> drivers/net/wireless/ath/ath12k/reg.c:243:11: warning: variable 'band' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     243 |         else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:246:32: note: uninitialized use occurs here
     246 |         update_band = &ar->mac.sbands[band];
         |                                       ^~~~
   drivers/net/wireless/ath/ath12k/reg.c:243:7: note: remove the 'if' if its condition is always true
     243 |         else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz)
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     244 |                 band = NL80211_BAND_6GHZ;
>> drivers/net/wireless/ath/ath12k/reg.c:243:11: warning: variable 'band' is used uninitialized whenever '&&' condition is false [-Wsometimes-uninitialized]
     243 |         else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:246:32: note: uninitialized use occurs here
     246 |         update_band = &ar->mac.sbands[band];
         |                                       ^~~~
   drivers/net/wireless/ath/ath12k/reg.c:243:11: note: remove the '&&' if its condition is always true
     243 |         else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath12k/reg.c:228:56: note: initialize the variable 'band' to silence this warning
     228 |         u32 phy_id, freq_low, freq_high, supported_bands, band;
         |                                                               ^
         |                                                                = 0
   9 warnings generated.


vim +243 drivers/net/wireless/ath/ath12k/reg.c

831c6c9cc5355e Rameshkumar Sundaram   2025-02-11  223  
d889913205cf7e Kalle Valo             2022-11-28  224  int ath12k_regd_update(struct ath12k *ar, bool init)
d889913205cf7e Kalle Valo             2022-11-28  225  {
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  226  	struct ath12k_wmi_hal_reg_capabilities_ext_arg *reg_cap;
831c6c9cc5355e Rameshkumar Sundaram   2025-02-11  227  	struct ieee80211_supported_band *update_band;
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  228  	u32 phy_id, freq_low, freq_high, supported_bands, band;
9b4e5caaf5905e Karthikeyan Periyasamy 2024-05-03  229  	struct ath12k_hw *ah = ath12k_ar_to_ah(ar);
9b4e5caaf5905e Karthikeyan Periyasamy 2024-05-03  230  	struct ieee80211_hw *hw = ah->hw;
d889913205cf7e Kalle Valo             2022-11-28  231  	struct ieee80211_regdomain *regd, *regd_copy = NULL;
d889913205cf7e Kalle Valo             2022-11-28  232  	int ret, regd_len, pdev_id;
d889913205cf7e Kalle Valo             2022-11-28  233  	struct ath12k_base *ab;
0da00e45ee9ab1 Sriram R               2024-04-09  234  	int i;
d889913205cf7e Kalle Valo             2022-11-28  235  
d889913205cf7e Kalle Valo             2022-11-28  236  	ab = ar->ab;
0da00e45ee9ab1 Sriram R               2024-04-09  237  
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  238  	supported_bands = ar->pdev->cap.supported_bands;
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  239  	if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP)
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  240  		band = NL80211_BAND_2GHZ;
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  241  	else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6ghz)
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  242  		band = NL80211_BAND_5GHZ;
6ca04f359a7046 Aditya Kumar Singh     2025-03-27 @243  	else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz)
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  244  		band = NL80211_BAND_6GHZ;
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  245  
831c6c9cc5355e Rameshkumar Sundaram   2025-02-11  246  	update_band = &ar->mac.sbands[band];
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  247  	reg_cap = &ab->hal_reg_cap[ar->pdev_idx];
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  248  
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  249  	if (ab->hw_params->single_pdev_only && !ar->supports_6ghz) {
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  250  		phy_id = ar->pdev->cap.band[band].phy_id;
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  251  		reg_cap = &ab->hal_reg_cap[phy_id];
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  252  	}
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  253  
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  254  	/* Possible that due to reg change, current limits for supported
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  255  	 * frequency changed. Update that
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  256  	 */
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  257  	if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  258  		freq_low = max(reg_cap->low_2ghz_chan, ab->reg_freq_2ghz.start_freq);
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  259  		freq_high = min(reg_cap->high_2ghz_chan, ab->reg_freq_2ghz.end_freq);
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  260  	} else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6ghz) {
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  261  		freq_low = max(reg_cap->low_5ghz_chan, ab->reg_freq_5ghz.start_freq);
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  262  		freq_high = min(reg_cap->high_5ghz_chan, ab->reg_freq_5ghz.end_freq);
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  263  	} else if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && ar->supports_6ghz) {
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  264  		freq_low = max(reg_cap->low_5ghz_chan, ab->reg_freq_6ghz.start_freq);
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  265  		freq_high = min(reg_cap->high_5ghz_chan, ab->reg_freq_6ghz.end_freq);
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  266  	}
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  267  
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  268  	ath12k_mac_update_freq_range(ar, freq_low, freq_high);
831c6c9cc5355e Rameshkumar Sundaram   2025-02-11  269  	ar->num_channels = ath12k_reg_get_num_chans_in_band(ar, update_band);
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  270  
831c6c9cc5355e Rameshkumar Sundaram   2025-02-11  271  	ath12k_dbg(ab, ATH12K_DBG_REG, "pdev %u reg updated freq limits %u->%u MHz, no. of channels %u\n",
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  272  		   ar->pdev->pdev_id, freq_low,
831c6c9cc5355e Rameshkumar Sundaram   2025-02-11  273  		   freq_high, ar->num_channels);
6ca04f359a7046 Aditya Kumar Singh     2025-03-27  274  
0da00e45ee9ab1 Sriram R               2024-04-09  275  	/* If one of the radios within ah has already updated the regd for
0da00e45ee9ab1 Sriram R               2024-04-09  276  	 * the wiphy, then avoid setting regd again
0da00e45ee9ab1 Sriram R               2024-04-09  277  	 */
0da00e45ee9ab1 Sriram R               2024-04-09  278  	if (ah->regd_updated)
0da00e45ee9ab1 Sriram R               2024-04-09  279  		return 0;
0da00e45ee9ab1 Sriram R               2024-04-09  280  
0da00e45ee9ab1 Sriram R               2024-04-09  281  	/* firmware provides reg rules which are similar for 2 GHz and 5 GHz
0da00e45ee9ab1 Sriram R               2024-04-09  282  	 * pdev but 6 GHz pdev has superset of all rules including rules for
0da00e45ee9ab1 Sriram R               2024-04-09  283  	 * all bands, we prefer 6 GHz pdev's rules to be used for setup of
0da00e45ee9ab1 Sriram R               2024-04-09  284  	 * the wiphy regd.
0da00e45ee9ab1 Sriram R               2024-04-09  285  	 * If 6 GHz pdev was part of the ath12k_hw, wait for the 6 GHz pdev,
0da00e45ee9ab1 Sriram R               2024-04-09  286  	 * else pick the first pdev which calls this function and use its
0da00e45ee9ab1 Sriram R               2024-04-09  287  	 * regd to update global hw regd.
0da00e45ee9ab1 Sriram R               2024-04-09  288  	 * The regd_updated flag set at the end will not allow any further
0da00e45ee9ab1 Sriram R               2024-04-09  289  	 * updates.
0da00e45ee9ab1 Sriram R               2024-04-09  290  	 */
0da00e45ee9ab1 Sriram R               2024-04-09  291  	if (ah->use_6ghz_regd && !ar->supports_6ghz)
0da00e45ee9ab1 Sriram R               2024-04-09  292  		return 0;
0da00e45ee9ab1 Sriram R               2024-04-09  293  
d889913205cf7e Kalle Valo             2022-11-28  294  	pdev_id = ar->pdev_idx;
d889913205cf7e Kalle Valo             2022-11-28  295  
d889913205cf7e Kalle Valo             2022-11-28  296  	spin_lock_bh(&ab->base_lock);
d889913205cf7e Kalle Valo             2022-11-28  297  
d889913205cf7e Kalle Valo             2022-11-28  298  	if (init) {
d889913205cf7e Kalle Valo             2022-11-28  299  		/* Apply the regd received during init through
d889913205cf7e Kalle Valo             2022-11-28  300  		 * WMI_REG_CHAN_LIST_CC event. In case of failure to
d889913205cf7e Kalle Valo             2022-11-28  301  		 * receive the regd, initialize with a default world
d889913205cf7e Kalle Valo             2022-11-28  302  		 * regulatory.
d889913205cf7e Kalle Valo             2022-11-28  303  		 */
d889913205cf7e Kalle Valo             2022-11-28  304  		if (ab->default_regd[pdev_id]) {
d889913205cf7e Kalle Valo             2022-11-28  305  			regd = ab->default_regd[pdev_id];
d889913205cf7e Kalle Valo             2022-11-28  306  		} else {
d889913205cf7e Kalle Valo             2022-11-28  307  			ath12k_warn(ab,
d889913205cf7e Kalle Valo             2022-11-28  308  				    "failed to receive default regd during init\n");
d889913205cf7e Kalle Valo             2022-11-28  309  			regd = (struct ieee80211_regdomain *)&ath12k_world_regd;
d889913205cf7e Kalle Valo             2022-11-28  310  		}
d889913205cf7e Kalle Valo             2022-11-28  311  	} else {
d889913205cf7e Kalle Valo             2022-11-28  312  		regd = ab->new_regd[pdev_id];
d889913205cf7e Kalle Valo             2022-11-28  313  	}
d889913205cf7e Kalle Valo             2022-11-28  314  
d889913205cf7e Kalle Valo             2022-11-28  315  	if (!regd) {
d889913205cf7e Kalle Valo             2022-11-28  316  		ret = -EINVAL;
d889913205cf7e Kalle Valo             2022-11-28  317  		spin_unlock_bh(&ab->base_lock);
d889913205cf7e Kalle Valo             2022-11-28  318  		goto err;
d889913205cf7e Kalle Valo             2022-11-28  319  	}
d889913205cf7e Kalle Valo             2022-11-28  320  
d889913205cf7e Kalle Valo             2022-11-28  321  	regd_len = sizeof(*regd) + (regd->n_reg_rules *
d889913205cf7e Kalle Valo             2022-11-28  322  		sizeof(struct ieee80211_reg_rule));
d889913205cf7e Kalle Valo             2022-11-28  323  
d889913205cf7e Kalle Valo             2022-11-28  324  	regd_copy = kzalloc(regd_len, GFP_ATOMIC);
d889913205cf7e Kalle Valo             2022-11-28  325  	if (regd_copy)
d889913205cf7e Kalle Valo             2022-11-28  326  		ath12k_copy_regd(regd, regd_copy);
d889913205cf7e Kalle Valo             2022-11-28  327  
d889913205cf7e Kalle Valo             2022-11-28  328  	spin_unlock_bh(&ab->base_lock);
d889913205cf7e Kalle Valo             2022-11-28  329  
d889913205cf7e Kalle Valo             2022-11-28  330  	if (!regd_copy) {
d889913205cf7e Kalle Valo             2022-11-28  331  		ret = -ENOMEM;
d889913205cf7e Kalle Valo             2022-11-28  332  		goto err;
d889913205cf7e Kalle Valo             2022-11-28  333  	}
d889913205cf7e Kalle Valo             2022-11-28  334  
d889913205cf7e Kalle Valo             2022-11-28  335  	rtnl_lock();
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  336  	wiphy_lock(hw->wiphy);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  337  	ret = regulatory_set_wiphy_regd_sync(hw->wiphy, regd_copy);
940b57fd0e7710 Karthikeyan Periyasamy 2023-11-21  338  	wiphy_unlock(hw->wiphy);
d889913205cf7e Kalle Valo             2022-11-28  339  	rtnl_unlock();
d889913205cf7e Kalle Valo             2022-11-28  340  
d889913205cf7e Kalle Valo             2022-11-28  341  	kfree(regd_copy);
d889913205cf7e Kalle Valo             2022-11-28  342  
d889913205cf7e Kalle Valo             2022-11-28  343  	if (ret)
d889913205cf7e Kalle Valo             2022-11-28  344  		goto err;
d889913205cf7e Kalle Valo             2022-11-28  345  
9b4e5caaf5905e Karthikeyan Periyasamy 2024-05-03  346  	if (ah->state != ATH12K_HW_STATE_ON)
9b4e5caaf5905e Karthikeyan Periyasamy 2024-05-03  347  		goto skip;
9b4e5caaf5905e Karthikeyan Periyasamy 2024-05-03  348  
0da00e45ee9ab1 Sriram R               2024-04-09  349  	ah->regd_updated = true;
0da00e45ee9ab1 Sriram R               2024-04-09  350  	/* Apply the new regd to all the radios, this is expected to be received only once
0da00e45ee9ab1 Sriram R               2024-04-09  351  	 * since we check for ah->regd_updated and allow here only once.
0da00e45ee9ab1 Sriram R               2024-04-09  352  	 */
0da00e45ee9ab1 Sriram R               2024-04-09  353  	for_each_ar(ah, ar, i) {
0da00e45ee9ab1 Sriram R               2024-04-09  354  		ab = ar->ab;
d889913205cf7e Kalle Valo             2022-11-28  355  		ret = ath12k_reg_update_chan_list(ar);
d889913205cf7e Kalle Valo             2022-11-28  356  		if (ret)
d889913205cf7e Kalle Valo             2022-11-28  357  			goto err;
d889913205cf7e Kalle Valo             2022-11-28  358  	}
9b4e5caaf5905e Karthikeyan Periyasamy 2024-05-03  359  skip:
d889913205cf7e Kalle Valo             2022-11-28  360  	return 0;
d889913205cf7e Kalle Valo             2022-11-28  361  err:
d889913205cf7e Kalle Valo             2022-11-28  362  	ath12k_warn(ab, "failed to perform regd update : %d\n", ret);
d889913205cf7e Kalle Valo             2022-11-28  363  	return ret;
d889913205cf7e Kalle Valo             2022-11-28  364  }
d889913205cf7e Kalle Valo             2022-11-28  365  

:::::: The code at line 243 was first introduced by commit
:::::: 6ca04f359a7046dac7b96fc29808568513406aea wifi: ath12k: Update frequency range if reg rules changes

:::::: TO: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
:::::: CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
