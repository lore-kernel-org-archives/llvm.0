Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6AF26AF5;
	Thu, 23 Jan 2025 08:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737619401; cv=none; b=lPkPL5VmU3ym2qlRXzl333GJawoCHMRm78nGUzDRQF47/h4sCyAawpcmVgzMqDyyLiJVtMhiU3PVOyfz+Nn4f4dtuzs2iyup2ytOTvcmYz7G+dbouZZAiXcw/tUsI+fMoUK11fheNvKrReByccxsyEwOJdOs9RSxCiV+OCqI9TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737619401; c=relaxed/simple;
	bh=/se8P4KTT0Lrdhagi2bnRCwMe/IvgFk2gWNs6gJzsSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oCMGZWJLoUU77eBdXUDqTnlaDbdjfuq9DDR2t3vjD7S4G6FAaqt61lu7PVsewfc4bwR91zoXvbLdt/ot5ypq3bL+nJ1k3zxNOcU0u8HgArsyefH3PTI4MboLGesZNrI9f5dlnp5gtflozOSKN3z+KOIgRrrHyFpwcX6zzq0pa/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wo517BGn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wo517BGn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737619399; x=1769155399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/se8P4KTT0Lrdhagi2bnRCwMe/IvgFk2gWNs6gJzsSI=;
  b=Wo517BGnYB/2Zl8Ug/bQUn6Zm/MVQRxuh3KmqZGINN/NCh/uQ66ErLSP
   RwXLLWy4n25Z9oXH29uxq6D5NBD65ILB5D+TaqKtLEso7sDZaQDZy/qhf
   eKlnXPTG8K6XH+880goT6Um7uzg7rGZHRJm36gpD/1VAJVVui/8YuAY4L
   wRTWbmjrQzIaYN9aKvGEGzpdDYIvDYYDYVA54olIOXuinN6kWoDUGkM3I
   ZijwrgOh6TrOYzzturPfiWnwPlqNHVMf2g3+36VoftrLk49FhZV5Rdwz3
   XkpwO23BsfJp64P09dNghY9hlsIkqG+hndp+97BGPHA3ej3c+wGmgkh0w
   g==;
X-CSE-ConnectionGUID: 6p1rZFsMRTS74irf37tcnQ==
X-CSE-MsgGUID: MkEJX6RUTsuC9x1vr4cWMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38356587"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="38356587"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 00:03:17 -0800
X-CSE-ConnectionGUID: pVojxfXVTre8wDeWFdQBIA==
X-CSE-MsgGUID: Cp7OlIc3RQe7UEnzkgz1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112033618"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2025 00:03:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tasBF-000au3-21;
	Thu, 23 Jan 2025 08:03:13 +0000
Date: Thu, 23 Jan 2025 16:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: Sarika Sharma <quic_sarishar@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 2/3] wifi: ath12k: add link support for multi-link in
 arsta
Message-ID: <202501231541.MkWxZOQ7-lkp@intel.com>
References: <20250122133424.1226555-3-quic_sarishar@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122133424.1226555-3-quic_sarishar@quicinc.com>

Hi Sarika,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on e7ef944b3e2c31b608800925e784f67596375770]

url:    https://github.com/intel-lab-lkp/linux/commits/Sarika-Sharma/wifi-mac80211-correct-RX-stats-packet-increment-for-multi-link/20250122-213719
base:   e7ef944b3e2c31b608800925e784f67596375770
patch link:    https://lore.kernel.org/r/20250122133424.1226555-3-quic_sarishar%40quicinc.com
patch subject: [PATCH RFC 2/3] wifi: ath12k: add link support for multi-link in arsta
config: i386-buildonly-randconfig-006-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231541.MkWxZOQ7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231541.MkWxZOQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231541.MkWxZOQ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/dp_rx.c:1364:24: warning: variable 'sta' set but not used [-Wunused-but-set-variable]
    1364 |         struct ieee80211_sta *sta;
         |                               ^
   1 warning generated.


vim +/sta +1364 drivers/net/wireless/ath/ath12k/dp_rx.c

d889913205cf7e Kalle Valo    2022-11-28  1357  
d889913205cf7e Kalle Valo    2022-11-28  1358  static void
d889913205cf7e Kalle Valo    2022-11-28  1359  ath12k_update_per_peer_tx_stats(struct ath12k *ar,
d889913205cf7e Kalle Valo    2022-11-28  1360  				struct htt_ppdu_stats *ppdu_stats, u8 user)
d889913205cf7e Kalle Valo    2022-11-28  1361  {
d889913205cf7e Kalle Valo    2022-11-28  1362  	struct ath12k_base *ab = ar->ab;
d889913205cf7e Kalle Valo    2022-11-28  1363  	struct ath12k_peer *peer;
d889913205cf7e Kalle Valo    2022-11-28 @1364  	struct ieee80211_sta *sta;
b89b5dbea65294 Sriram R      2024-10-15  1365  	struct ath12k_link_sta *arsta;
d889913205cf7e Kalle Valo    2022-11-28  1366  	struct htt_ppdu_stats_user_rate *user_rate;
d889913205cf7e Kalle Valo    2022-11-28  1367  	struct ath12k_per_peer_tx_stats *peer_stats = &ar->peer_tx_stats;
d889913205cf7e Kalle Valo    2022-11-28  1368  	struct htt_ppdu_user_stats *usr_stats = &ppdu_stats->user_stats[user];
d889913205cf7e Kalle Valo    2022-11-28  1369  	struct htt_ppdu_stats_common *common = &ppdu_stats->common;
d889913205cf7e Kalle Valo    2022-11-28  1370  	int ret;
d889913205cf7e Kalle Valo    2022-11-28  1371  	u8 flags, mcs, nss, bw, sgi, dcm, rate_idx = 0;
d889913205cf7e Kalle Valo    2022-11-28  1372  	u32 v, succ_bytes = 0;
d889913205cf7e Kalle Valo    2022-11-28  1373  	u16 tones, rate = 0, succ_pkts = 0;
d889913205cf7e Kalle Valo    2022-11-28  1374  	u32 tx_duration = 0;
d889913205cf7e Kalle Valo    2022-11-28  1375  	u8 tid = HTT_PPDU_STATS_NON_QOS_TID;
d889913205cf7e Kalle Valo    2022-11-28  1376  	bool is_ampdu = false;
d889913205cf7e Kalle Valo    2022-11-28  1377  
d889913205cf7e Kalle Valo    2022-11-28  1378  	if (!(usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_RATE)))
d889913205cf7e Kalle Valo    2022-11-28  1379  		return;
d889913205cf7e Kalle Valo    2022-11-28  1380  
d889913205cf7e Kalle Valo    2022-11-28  1381  	if (usr_stats->tlv_flags & BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_COMMON))
d889913205cf7e Kalle Valo    2022-11-28  1382  		is_ampdu =
d889913205cf7e Kalle Valo    2022-11-28  1383  			HTT_USR_CMPLTN_IS_AMPDU(usr_stats->cmpltn_cmn.flags);
d889913205cf7e Kalle Valo    2022-11-28  1384  
d889913205cf7e Kalle Valo    2022-11-28  1385  	if (usr_stats->tlv_flags &
d889913205cf7e Kalle Valo    2022-11-28  1386  	    BIT(HTT_PPDU_STATS_TAG_USR_COMPLTN_ACK_BA_STATUS)) {
d889913205cf7e Kalle Valo    2022-11-28  1387  		succ_bytes = le32_to_cpu(usr_stats->ack_ba.success_bytes);
d889913205cf7e Kalle Valo    2022-11-28  1388  		succ_pkts = le32_get_bits(usr_stats->ack_ba.info,
d889913205cf7e Kalle Valo    2022-11-28  1389  					  HTT_PPDU_STATS_ACK_BA_INFO_NUM_MSDU_M);
d889913205cf7e Kalle Valo    2022-11-28  1390  		tid = le32_get_bits(usr_stats->ack_ba.info,
d889913205cf7e Kalle Valo    2022-11-28  1391  				    HTT_PPDU_STATS_ACK_BA_INFO_TID_NUM);
d889913205cf7e Kalle Valo    2022-11-28  1392  	}
d889913205cf7e Kalle Valo    2022-11-28  1393  
d889913205cf7e Kalle Valo    2022-11-28  1394  	if (common->fes_duration_us)
d889913205cf7e Kalle Valo    2022-11-28  1395  		tx_duration = le32_to_cpu(common->fes_duration_us);
d889913205cf7e Kalle Valo    2022-11-28  1396  
d889913205cf7e Kalle Valo    2022-11-28  1397  	user_rate = &usr_stats->rate;
d889913205cf7e Kalle Valo    2022-11-28  1398  	flags = HTT_USR_RATE_PREAMBLE(user_rate->rate_flags);
d889913205cf7e Kalle Valo    2022-11-28  1399  	bw = HTT_USR_RATE_BW(user_rate->rate_flags) - 2;
d889913205cf7e Kalle Valo    2022-11-28  1400  	nss = HTT_USR_RATE_NSS(user_rate->rate_flags) + 1;
d889913205cf7e Kalle Valo    2022-11-28  1401  	mcs = HTT_USR_RATE_MCS(user_rate->rate_flags);
d889913205cf7e Kalle Valo    2022-11-28  1402  	sgi = HTT_USR_RATE_GI(user_rate->rate_flags);
d889913205cf7e Kalle Valo    2022-11-28  1403  	dcm = HTT_USR_RATE_DCM(user_rate->rate_flags);
d889913205cf7e Kalle Valo    2022-11-28  1404  
d889913205cf7e Kalle Valo    2022-11-28  1405  	/* Note: If host configured fixed rates and in some other special
d889913205cf7e Kalle Valo    2022-11-28  1406  	 * cases, the broadcast/management frames are sent in different rates.
d889913205cf7e Kalle Valo    2022-11-28  1407  	 * Firmware rate's control to be skipped for this?
d889913205cf7e Kalle Valo    2022-11-28  1408  	 */
d889913205cf7e Kalle Valo    2022-11-28  1409  
d889913205cf7e Kalle Valo    2022-11-28  1410  	if (flags == WMI_RATE_PREAMBLE_HE && mcs > ATH12K_HE_MCS_MAX) {
d889913205cf7e Kalle Valo    2022-11-28  1411  		ath12k_warn(ab, "Invalid HE mcs %d peer stats",  mcs);
d889913205cf7e Kalle Valo    2022-11-28  1412  		return;
d889913205cf7e Kalle Valo    2022-11-28  1413  	}
d889913205cf7e Kalle Valo    2022-11-28  1414  
d889913205cf7e Kalle Valo    2022-11-28  1415  	if (flags == WMI_RATE_PREAMBLE_VHT && mcs > ATH12K_VHT_MCS_MAX) {
d889913205cf7e Kalle Valo    2022-11-28  1416  		ath12k_warn(ab, "Invalid VHT mcs %d peer stats",  mcs);
d889913205cf7e Kalle Valo    2022-11-28  1417  		return;
d889913205cf7e Kalle Valo    2022-11-28  1418  	}
d889913205cf7e Kalle Valo    2022-11-28  1419  
d889913205cf7e Kalle Valo    2022-11-28  1420  	if (flags == WMI_RATE_PREAMBLE_HT && (mcs > ATH12K_HT_MCS_MAX || nss < 1)) {
d889913205cf7e Kalle Valo    2022-11-28  1421  		ath12k_warn(ab, "Invalid HT mcs %d nss %d peer stats",
d889913205cf7e Kalle Valo    2022-11-28  1422  			    mcs, nss);
d889913205cf7e Kalle Valo    2022-11-28  1423  		return;
d889913205cf7e Kalle Valo    2022-11-28  1424  	}
d889913205cf7e Kalle Valo    2022-11-28  1425  
d889913205cf7e Kalle Valo    2022-11-28  1426  	if (flags == WMI_RATE_PREAMBLE_CCK || flags == WMI_RATE_PREAMBLE_OFDM) {
d889913205cf7e Kalle Valo    2022-11-28  1427  		ret = ath12k_mac_hw_ratecode_to_legacy_rate(mcs,
d889913205cf7e Kalle Valo    2022-11-28  1428  							    flags,
d889913205cf7e Kalle Valo    2022-11-28  1429  							    &rate_idx,
d889913205cf7e Kalle Valo    2022-11-28  1430  							    &rate);
d889913205cf7e Kalle Valo    2022-11-28  1431  		if (ret < 0)
d889913205cf7e Kalle Valo    2022-11-28  1432  			return;
d889913205cf7e Kalle Valo    2022-11-28  1433  	}
d889913205cf7e Kalle Valo    2022-11-28  1434  
d889913205cf7e Kalle Valo    2022-11-28  1435  	rcu_read_lock();
d889913205cf7e Kalle Valo    2022-11-28  1436  	spin_lock_bh(&ab->base_lock);
d889913205cf7e Kalle Valo    2022-11-28  1437  	peer = ath12k_peer_find_by_id(ab, usr_stats->peer_id);
d889913205cf7e Kalle Valo    2022-11-28  1438  
d889913205cf7e Kalle Valo    2022-11-28  1439  	if (!peer || !peer->sta) {
d889913205cf7e Kalle Valo    2022-11-28  1440  		spin_unlock_bh(&ab->base_lock);
d889913205cf7e Kalle Valo    2022-11-28  1441  		rcu_read_unlock();
d889913205cf7e Kalle Valo    2022-11-28  1442  		return;
d889913205cf7e Kalle Valo    2022-11-28  1443  	}
d889913205cf7e Kalle Valo    2022-11-28  1444  
d889913205cf7e Kalle Valo    2022-11-28  1445  	sta = peer->sta;
16188cf35df3cd Sarika Sharma 2025-01-22  1446  	arsta = ath12k_peer_get_link_sta(ab, peer);
16188cf35df3cd Sarika Sharma 2025-01-22  1447  	if (!arsta) {
16188cf35df3cd Sarika Sharma 2025-01-22  1448  		spin_unlock_bh(&ab->base_lock);
16188cf35df3cd Sarika Sharma 2025-01-22  1449  		rcu_read_unlock();
16188cf35df3cd Sarika Sharma 2025-01-22  1450  		return;
16188cf35df3cd Sarika Sharma 2025-01-22  1451  	}
d889913205cf7e Kalle Valo    2022-11-28  1452  
d889913205cf7e Kalle Valo    2022-11-28  1453  	memset(&arsta->txrate, 0, sizeof(arsta->txrate));
d889913205cf7e Kalle Valo    2022-11-28  1454  
d889913205cf7e Kalle Valo    2022-11-28  1455  	switch (flags) {
d889913205cf7e Kalle Valo    2022-11-28  1456  	case WMI_RATE_PREAMBLE_OFDM:
d889913205cf7e Kalle Valo    2022-11-28  1457  		arsta->txrate.legacy = rate;
d889913205cf7e Kalle Valo    2022-11-28  1458  		break;
d889913205cf7e Kalle Valo    2022-11-28  1459  	case WMI_RATE_PREAMBLE_CCK:
d889913205cf7e Kalle Valo    2022-11-28  1460  		arsta->txrate.legacy = rate;
d889913205cf7e Kalle Valo    2022-11-28  1461  		break;
d889913205cf7e Kalle Valo    2022-11-28  1462  	case WMI_RATE_PREAMBLE_HT:
d889913205cf7e Kalle Valo    2022-11-28  1463  		arsta->txrate.mcs = mcs + 8 * (nss - 1);
d889913205cf7e Kalle Valo    2022-11-28  1464  		arsta->txrate.flags = RATE_INFO_FLAGS_MCS;
d889913205cf7e Kalle Valo    2022-11-28  1465  		if (sgi)
d889913205cf7e Kalle Valo    2022-11-28  1466  			arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
d889913205cf7e Kalle Valo    2022-11-28  1467  		break;
d889913205cf7e Kalle Valo    2022-11-28  1468  	case WMI_RATE_PREAMBLE_VHT:
d889913205cf7e Kalle Valo    2022-11-28  1469  		arsta->txrate.mcs = mcs;
d889913205cf7e Kalle Valo    2022-11-28  1470  		arsta->txrate.flags = RATE_INFO_FLAGS_VHT_MCS;
d889913205cf7e Kalle Valo    2022-11-28  1471  		if (sgi)
d889913205cf7e Kalle Valo    2022-11-28  1472  			arsta->txrate.flags |= RATE_INFO_FLAGS_SHORT_GI;
d889913205cf7e Kalle Valo    2022-11-28  1473  		break;
d889913205cf7e Kalle Valo    2022-11-28  1474  	case WMI_RATE_PREAMBLE_HE:
d889913205cf7e Kalle Valo    2022-11-28  1475  		arsta->txrate.mcs = mcs;
d889913205cf7e Kalle Valo    2022-11-28  1476  		arsta->txrate.flags = RATE_INFO_FLAGS_HE_MCS;
d889913205cf7e Kalle Valo    2022-11-28  1477  		arsta->txrate.he_dcm = dcm;
d889913205cf7e Kalle Valo    2022-11-28  1478  		arsta->txrate.he_gi = ath12k_he_gi_to_nl80211_he_gi(sgi);
d889913205cf7e Kalle Valo    2022-11-28  1479  		tones = le16_to_cpu(user_rate->ru_end) -
d889913205cf7e Kalle Valo    2022-11-28  1480  			le16_to_cpu(user_rate->ru_start) + 1;
d889913205cf7e Kalle Valo    2022-11-28  1481  		v = ath12k_he_ru_tones_to_nl80211_he_ru_alloc(tones);
d889913205cf7e Kalle Valo    2022-11-28  1482  		arsta->txrate.he_ru_alloc = v;
d889913205cf7e Kalle Valo    2022-11-28  1483  		break;
d889913205cf7e Kalle Valo    2022-11-28  1484  	}
d889913205cf7e Kalle Valo    2022-11-28  1485  
d889913205cf7e Kalle Valo    2022-11-28  1486  	arsta->txrate.nss = nss;
d889913205cf7e Kalle Valo    2022-11-28  1487  	arsta->txrate.bw = ath12k_mac_bw_to_mac80211_bw(bw);
d889913205cf7e Kalle Valo    2022-11-28  1488  	arsta->tx_duration += tx_duration;
d889913205cf7e Kalle Valo    2022-11-28  1489  	memcpy(&arsta->last_txrate, &arsta->txrate, sizeof(struct rate_info));
d889913205cf7e Kalle Valo    2022-11-28  1490  
d889913205cf7e Kalle Valo    2022-11-28  1491  	/* PPDU stats reported for mgmt packet doesn't have valid tx bytes.
d889913205cf7e Kalle Valo    2022-11-28  1492  	 * So skip peer stats update for mgmt packets.
d889913205cf7e Kalle Valo    2022-11-28  1493  	 */
d889913205cf7e Kalle Valo    2022-11-28  1494  	if (tid < HTT_PPDU_STATS_NON_QOS_TID) {
d889913205cf7e Kalle Valo    2022-11-28  1495  		memset(peer_stats, 0, sizeof(*peer_stats));
d889913205cf7e Kalle Valo    2022-11-28  1496  		peer_stats->succ_pkts = succ_pkts;
d889913205cf7e Kalle Valo    2022-11-28  1497  		peer_stats->succ_bytes = succ_bytes;
d889913205cf7e Kalle Valo    2022-11-28  1498  		peer_stats->is_ampdu = is_ampdu;
d889913205cf7e Kalle Valo    2022-11-28  1499  		peer_stats->duration = tx_duration;
d889913205cf7e Kalle Valo    2022-11-28  1500  		peer_stats->ba_fails =
d889913205cf7e Kalle Valo    2022-11-28  1501  			HTT_USR_CMPLTN_LONG_RETRY(usr_stats->cmpltn_cmn.flags) +
d889913205cf7e Kalle Valo    2022-11-28  1502  			HTT_USR_CMPLTN_SHORT_RETRY(usr_stats->cmpltn_cmn.flags);
d889913205cf7e Kalle Valo    2022-11-28  1503  	}
d889913205cf7e Kalle Valo    2022-11-28  1504  
d889913205cf7e Kalle Valo    2022-11-28  1505  	spin_unlock_bh(&ab->base_lock);
d889913205cf7e Kalle Valo    2022-11-28  1506  	rcu_read_unlock();
d889913205cf7e Kalle Valo    2022-11-28  1507  }
d889913205cf7e Kalle Valo    2022-11-28  1508  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
