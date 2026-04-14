Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D63242D7F;
	Tue, 14 Apr 2026 14:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776175268; cv=none; b=n4ZYSTW5o9I66dNfZO9cc9y2bOXucbkVdx6YVZeoRcSBv/OdI6Xbl5HEUzs2Ibr5v76OSX6QSdkysterw+FbV2b3z4lSFmanbytHd9opsMfsRTAgbNI4WQT6r6LaLjoKb5rbgqzHyJfG05v7xcoRtLmwj1/6riWC4n2vl+6v23Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776175268; c=relaxed/simple;
	bh=TjIBq3qB1eaYJhbikgTt6mGmN8nmHrC54WbTaGjeRwg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lr9d7OJSlay7a8a2bzjJSdYzNTLtkmbNQL7iJcgBi4N275AXZlIaZcZl/nJTgz++nECSs5/U0lrhpSuzxZlfF+8ql+xMelZu7rQZj+hnW1pkXFbl7mGceL3dtvwcXSej5X27ZNV8j3ZOf67/Bc8dVFdeP2phF6A063rafCVYWQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXp3SeOM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXp3SeOM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776175267; x=1807711267;
  h=date:from:to:cc:subject:message-id;
  bh=TjIBq3qB1eaYJhbikgTt6mGmN8nmHrC54WbTaGjeRwg=;
  b=DXp3SeOMvmNagfw+DE0OHb5ZfoCv8R4RZ24iBQAKYP8ku6NOfa6fd6Kn
   GxUNw50smB/8EBBsqUiA1ivGPq69uO9ffHGDk5shSwvKTiVQsVssf3Ycr
   ZztAs9pfcBOqyGslZZFfXwtDwMLn55Hlog86LFUU9Sa6HoQdc2LxpZQ9w
   niBS43iZm1AbZpwAffpxy5lWyg0nmuwiw2wT6b1v1gzyXzjrjmd+gvaVN
   DlgFVUozvPNN3Uaclguwc6O46unKZbs8X8BTUKjI55AI7Qp1tMdLj7WkF
   F1gm5+pXLnig+1LV8i61DVDQTEi+3D3Uf0BIGbHa8CZXmXe4vBLZgumFC
   w==;
X-CSE-ConnectionGUID: EGG+M6ztQ7uGV3QAj5yfXA==
X-CSE-MsgGUID: bn3nwUGwTgaoNa6Pg9H80g==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77099874"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77099874"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 07:01:04 -0700
X-CSE-ConnectionGUID: ZmOXl0WxQ32ukuM/uHOWXg==
X-CSE-MsgGUID: fzm0POEeSte790MkB0/m4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="229075871"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Apr 2026 07:01:03 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCeK3-000000000Pz-4A3f;
	Tue, 14 Apr 2026 14:00:59 +0000
Date: Tue, 14 Apr 2026 16:00:29 +0200
From: kernel test robot <lkp@intel.com>
To: "Pablo Martin-Gomez" <pmartin-gomez@freebox.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: net/mac80211/he.c:112:1: error: conflicting types for
 '_ieee80211_he_cap_ie_to_sta_he_cap'
Message-ID: <202604141500.InyCG9L4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pablo-Martin-Gomez/wifi-nl80211-remove-EHT-IE-size-validation/20260414-014056
head:   27802dfbd9cea5146c1de2ae0dae896fb8e15a40
commit: 487358ffe18b5e9426c7620f6cb86f6b24c7828f wifi: make HE capa size check not read reserved bits
date:   20 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260414/202604141500.InyCG9L4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604141500.InyCG9L4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604141500.InyCG9L4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/mac80211/he.c:112:1: error: conflicting types for '_ieee80211_he_cap_ie_to_sta_he_cap'
     112 | _ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
         | ^
   net/mac80211/ieee80211_i.h:2339:1: note: previous declaration is here
    2339 | _ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
         | ^
>> net/mac80211/he.c:226:9: error: too many arguments to function call, expected 6, have 7
     221 |         _ieee80211_he_cap_ie_to_sta_he_cap(sdata, own_he_cap, he_cap_ie,
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     222 |                                            he_cap_len,
     223 |                                            (sband->band == NL80211_BAND_6GHZ) ?
     224 |                                                 he_6ghz_capa : NULL,
     225 |                                            link_sta,
     226 |                                            sband->band);
         |                                            ^~~~~~~~~~~
   net/mac80211/ieee80211_i.h:2339:1: note: '_ieee80211_he_cap_ie_to_sta_he_cap' declared here
    2339 | _ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
         | ^                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2340 |                                    const struct ieee80211_sta_he_cap *own_he_cap,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2341 |                                    const u8 *he_cap_ie, u8 he_cap_len,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2342 |                                    const struct ieee80211_he_6ghz_capa *he_6ghz_capa,
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2343 |                                    struct link_sta_info *link_sta);
         |                                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> net/wireless/nl80211.c:295:62: error: too few arguments to function call, expected 3, have 2
     295 |         if (!ieee80211_he_capa_size_ok(nla_data(attr), nla_len(attr)))
         |              ~~~~~~~~~~~~~~~~~~~~~~~~~                              ^
   include/linux/ieee80211-he.h:512:20: note: 'ieee80211_he_capa_size_ok' declared here
     512 | static inline bool ieee80211_he_capa_size_ok(const u8 *data, u8 len, enum nl80211_band band)
         |                    ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +/_ieee80211_he_cap_ie_to_sta_he_cap +112 net/mac80211/he.c

7f7aa94bcaf03d Wen Gong            2020-12-25  110  
41cbb0f5a29592 Luca Coelho         2018-06-09  111  void
b5b5ffa94a3b04 Miri Korenblit      2026-03-20 @112  _ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  113  				   const struct ieee80211_sta_he_cap *own_he_cap_ptr,
41cbb0f5a29592 Luca Coelho         2018-06-09  114  				   const u8 *he_cap_ie, u8 he_cap_len,
1bb9a8a4c81d03 Johannes Berg       2020-05-28  115  				   const struct ieee80211_he_6ghz_capa *he_6ghz_capa,
487358ffe18b5e Pablo Martin-Gomez  2026-04-10  116  				   struct link_sta_info *link_sta,
487358ffe18b5e Pablo Martin-Gomez  2026-04-10  117  				   enum nl80211_band band)
41cbb0f5a29592 Luca Coelho         2018-06-09  118  {
c71420db653aba Johannes Berg       2022-06-15  119  	struct ieee80211_sta_he_cap *he_cap = &link_sta->pub->he_cap;
95f83ee8d857f0 Abinaya Kalaiselvan 2021-06-23  120  	struct ieee80211_sta_he_cap own_he_cap;
41cbb0f5a29592 Luca Coelho         2018-06-09  121  	struct ieee80211_he_cap_elem *he_cap_ie_elem = (void *)he_cap_ie;
41cbb0f5a29592 Luca Coelho         2018-06-09  122  	u8 he_ppe_size;
41cbb0f5a29592 Luca Coelho         2018-06-09  123  	u8 mcs_nss_size;
41cbb0f5a29592 Luca Coelho         2018-06-09  124  	u8 he_total_size;
7f7aa94bcaf03d Wen Gong            2020-12-25  125  	bool own_160, peer_160, own_80p80, peer_80p80;
41cbb0f5a29592 Luca Coelho         2018-06-09  126  
41cbb0f5a29592 Luca Coelho         2018-06-09  127  	memset(he_cap, 0, sizeof(*he_cap));
41cbb0f5a29592 Luca Coelho         2018-06-09  128  
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  129  	if (!he_cap_ie || !own_he_cap_ptr || !own_he_cap_ptr->has_he)
c37ab22bb1a43c Johannes Berg       2023-06-04  130  		return;
c37ab22bb1a43c Johannes Berg       2023-06-04  131  
27e9b326b67440 Miri Korenblit      2026-03-26  132  	/* NDI station are using the capabilities from the NMI station */
27e9b326b67440 Miri Korenblit      2026-03-26  133  	if (WARN_ON_ONCE(sdata->vif.type == NL80211_IFTYPE_NAN_DATA))
27e9b326b67440 Miri Korenblit      2026-03-26  134  		return;
27e9b326b67440 Miri Korenblit      2026-03-26  135  
c37ab22bb1a43c Johannes Berg       2023-06-04  136  	own_he_cap = *own_he_cap_ptr;
95f83ee8d857f0 Abinaya Kalaiselvan 2021-06-23  137  
41cbb0f5a29592 Luca Coelho         2018-06-09  138  	/* Make sure size is OK */
487358ffe18b5e Pablo Martin-Gomez  2026-04-10  139  	mcs_nss_size = ieee80211_he_mcs_nss_size(he_cap_ie_elem, band);
41cbb0f5a29592 Luca Coelho         2018-06-09  140  	he_ppe_size =
41cbb0f5a29592 Luca Coelho         2018-06-09  141  		ieee80211_he_ppe_size(he_cap_ie[sizeof(he_cap->he_cap_elem) +
41cbb0f5a29592 Luca Coelho         2018-06-09  142  						mcs_nss_size],
41cbb0f5a29592 Luca Coelho         2018-06-09  143  				      he_cap_ie_elem->phy_cap_info);
41cbb0f5a29592 Luca Coelho         2018-06-09  144  	he_total_size = sizeof(he_cap->he_cap_elem) + mcs_nss_size +
41cbb0f5a29592 Luca Coelho         2018-06-09  145  			he_ppe_size;
41cbb0f5a29592 Luca Coelho         2018-06-09  146  	if (he_cap_len < he_total_size)
41cbb0f5a29592 Luca Coelho         2018-06-09  147  		return;
41cbb0f5a29592 Luca Coelho         2018-06-09  148  
41cbb0f5a29592 Luca Coelho         2018-06-09  149  	memcpy(&he_cap->he_cap_elem, he_cap_ie, sizeof(he_cap->he_cap_elem));
41cbb0f5a29592 Luca Coelho         2018-06-09  150  
41cbb0f5a29592 Luca Coelho         2018-06-09  151  	/* HE Tx/Rx HE MCS NSS Support Field */
41cbb0f5a29592 Luca Coelho         2018-06-09  152  	memcpy(&he_cap->he_mcs_nss_supp,
41cbb0f5a29592 Luca Coelho         2018-06-09  153  	       &he_cap_ie[sizeof(he_cap->he_cap_elem)], mcs_nss_size);
41cbb0f5a29592 Luca Coelho         2018-06-09  154  
41cbb0f5a29592 Luca Coelho         2018-06-09  155  	/* Check if there are (optional) PPE Thresholds */
41cbb0f5a29592 Luca Coelho         2018-06-09  156  	if (he_cap->he_cap_elem.phy_cap_info[6] &
41cbb0f5a29592 Luca Coelho         2018-06-09  157  	    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT)
41cbb0f5a29592 Luca Coelho         2018-06-09  158  		memcpy(he_cap->ppe_thres,
41cbb0f5a29592 Luca Coelho         2018-06-09  159  		       &he_cap_ie[sizeof(he_cap->he_cap_elem) + mcs_nss_size],
41cbb0f5a29592 Luca Coelho         2018-06-09  160  		       he_ppe_size);
41cbb0f5a29592 Luca Coelho         2018-06-09  161  
41cbb0f5a29592 Luca Coelho         2018-06-09  162  	he_cap->has_he = true;
cf2c9cc3980fb2 Johannes Berg       2020-01-31  163  
c71420db653aba Johannes Berg       2022-06-15  164  	link_sta->cur_max_bandwidth = ieee80211_sta_cap_rx_bw(link_sta);
27e9b326b67440 Miri Korenblit      2026-03-26  165  	if (sdata->vif.type != NL80211_IFTYPE_NAN)
c71420db653aba Johannes Berg       2022-06-15  166  		link_sta->pub->bandwidth = ieee80211_sta_cur_vht_bw(link_sta);
1bb9a8a4c81d03 Johannes Berg       2020-05-28  167  
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  168  	if (he_6ghz_capa)
c71420db653aba Johannes Berg       2022-06-15  169  		ieee80211_update_from_he_6ghz_capa(he_6ghz_capa, link_sta);
7f7aa94bcaf03d Wen Gong            2020-12-25  170  
7f7aa94bcaf03d Wen Gong            2020-12-25  171  	ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80,
7f7aa94bcaf03d Wen Gong            2020-12-25  172  				      &he_cap->he_mcs_nss_supp.rx_mcs_80,
7f7aa94bcaf03d Wen Gong            2020-12-25  173  				      &own_he_cap.he_mcs_nss_supp.tx_mcs_80,
7f7aa94bcaf03d Wen Gong            2020-12-25  174  				      &he_cap->he_mcs_nss_supp.tx_mcs_80);
7f7aa94bcaf03d Wen Gong            2020-12-25  175  
7f7aa94bcaf03d Wen Gong            2020-12-25  176  	own_160 = own_he_cap.he_cap_elem.phy_cap_info[0] &
7f7aa94bcaf03d Wen Gong            2020-12-25  177  		  IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
7f7aa94bcaf03d Wen Gong            2020-12-25  178  	peer_160 = he_cap->he_cap_elem.phy_cap_info[0] &
7f7aa94bcaf03d Wen Gong            2020-12-25  179  		   IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
7f7aa94bcaf03d Wen Gong            2020-12-25  180  
7f7aa94bcaf03d Wen Gong            2020-12-25  181  	if (peer_160 && own_160) {
7f7aa94bcaf03d Wen Gong            2020-12-25  182  		ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_160,
7f7aa94bcaf03d Wen Gong            2020-12-25  183  					      &he_cap->he_mcs_nss_supp.rx_mcs_160,
7f7aa94bcaf03d Wen Gong            2020-12-25  184  					      &own_he_cap.he_mcs_nss_supp.tx_mcs_160,
7f7aa94bcaf03d Wen Gong            2020-12-25  185  					      &he_cap->he_mcs_nss_supp.tx_mcs_160);
7f7aa94bcaf03d Wen Gong            2020-12-25  186  	} else if (peer_160 && !own_160) {
7f7aa94bcaf03d Wen Gong            2020-12-25  187  		ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.rx_mcs_160);
7f7aa94bcaf03d Wen Gong            2020-12-25  188  		ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.tx_mcs_160);
7f7aa94bcaf03d Wen Gong            2020-12-25  189  		he_cap->he_cap_elem.phy_cap_info[0] &=
7f7aa94bcaf03d Wen Gong            2020-12-25  190  			~IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
7f7aa94bcaf03d Wen Gong            2020-12-25  191  	}
7f7aa94bcaf03d Wen Gong            2020-12-25  192  
7f7aa94bcaf03d Wen Gong            2020-12-25  193  	own_80p80 = own_he_cap.he_cap_elem.phy_cap_info[0] &
7f7aa94bcaf03d Wen Gong            2020-12-25  194  		    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
7f7aa94bcaf03d Wen Gong            2020-12-25  195  	peer_80p80 = he_cap->he_cap_elem.phy_cap_info[0] &
7f7aa94bcaf03d Wen Gong            2020-12-25  196  		     IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
7f7aa94bcaf03d Wen Gong            2020-12-25  197  
7f7aa94bcaf03d Wen Gong            2020-12-25  198  	if (peer_80p80 && own_80p80) {
7f7aa94bcaf03d Wen Gong            2020-12-25  199  		ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80p80,
7f7aa94bcaf03d Wen Gong            2020-12-25  200  					      &he_cap->he_mcs_nss_supp.rx_mcs_80p80,
7f7aa94bcaf03d Wen Gong            2020-12-25  201  					      &own_he_cap.he_mcs_nss_supp.tx_mcs_80p80,
7f7aa94bcaf03d Wen Gong            2020-12-25  202  					      &he_cap->he_mcs_nss_supp.tx_mcs_80p80);
7f7aa94bcaf03d Wen Gong            2020-12-25  203  	} else if (peer_80p80 && !own_80p80) {
7f7aa94bcaf03d Wen Gong            2020-12-25  204  		ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.rx_mcs_80p80);
7f7aa94bcaf03d Wen Gong            2020-12-25  205  		ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.tx_mcs_80p80);
7f7aa94bcaf03d Wen Gong            2020-12-25  206  		he_cap->he_cap_elem.phy_cap_info[0] &=
7f7aa94bcaf03d Wen Gong            2020-12-25  207  			~IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
7f7aa94bcaf03d Wen Gong            2020-12-25  208  	}
41cbb0f5a29592 Luca Coelho         2018-06-09  209  }
697f6c507c7499 John Crispin        2019-07-29  210  
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  211  void
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  212  ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  213  				  struct ieee80211_supported_band *sband,
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  214  				  const u8 *he_cap_ie, u8 he_cap_len,
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  215  				  const struct ieee80211_he_6ghz_capa *he_6ghz_capa,
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  216  				  struct link_sta_info *link_sta)
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  217  {
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  218  	const struct ieee80211_sta_he_cap *own_he_cap =
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  219  		ieee80211_get_he_iftype_cap_vif(sband, &sdata->vif);
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  220  
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  221  	_ieee80211_he_cap_ie_to_sta_he_cap(sdata, own_he_cap, he_cap_ie,
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  222  					   he_cap_len,
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  223  					   (sband->band == NL80211_BAND_6GHZ) ?
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  224  						he_6ghz_capa : NULL,
487358ffe18b5e Pablo Martin-Gomez  2026-04-10  225  					   link_sta,
487358ffe18b5e Pablo Martin-Gomez  2026-04-10 @226  					   sband->band);
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  227  }
b5b5ffa94a3b04 Miri Korenblit      2026-03-20  228  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
