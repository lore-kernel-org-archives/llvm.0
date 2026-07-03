Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C021263B9;
	Fri,  3 Jul 2026 20:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783108885; cv=none; b=uXWcoAYZTxXsPHvCm6WPel2uT5pK7WOEiLlx1Dv65N+GP6UX2PmY2CRw3v0B4rw9ahY5lM2a8JJEyMaDXVmyxs/GJwpwXQWmBEvQc/ZguSWTHZcr+O2fHzlg5vS+SpTi00wes9InMhjs2LKmDKbgT5gAtBHCrS7bgcOKW4gWfWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783108885; c=relaxed/simple;
	bh=MAhLEm7ol0QGwuM9sbHEk8zzFFmtfbMPmy9M/VDT/ng=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ln5lY/aM2uo9KgqtF8RHeWBzMo9/GpozsgJKgowJ8Wt5Yeqk4VKlM5EVnaG82l2Xzz5PDY0Cft9fa5bjROw/7vq6MwhYK87nasnjUJdH5zaiI9WDzuV3HuJzaBpvIllMV2MhR4QOcueeMxZ54viHgZgQ2lTZPoZbAdELpzH4Jqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dibwq02I; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dibwq02I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783108883; x=1814644883;
  h=date:from:to:cc:subject:message-id;
  bh=MAhLEm7ol0QGwuM9sbHEk8zzFFmtfbMPmy9M/VDT/ng=;
  b=Dibwq02IAAhQMYS8+G+YHg6pZUEcoj+yGLeaIoD1l97flLOdfJHbzVU7
   K2WAtYzJKETJ0Gt88XDdoai6ok3kDf3kjXhwGU1v0rHNDD8nO0UWCrf33
   6cv+DzOGyFNSJ8aTnnheB9uWj5QNADNk2ntm80m9oK/+PfxoofqjGhcEZ
   EkP7mU571e7eDVyTrZ9vQyojNm/TIuvB2XklT4bta7Zp5fxCILaUCk8f4
   Q8tIcgeR875v92BKyKt1McdEXfF69RK4TMBKUxV95L5H87HgIQrROCumH
   Qd5Ct05UQi0vyQ+0FawxaMmoAVDMQ1EDo9+rusp33P3vC5L1EHmwC7Adv
   A==;
X-CSE-ConnectionGUID: 0FpRZ3ZFQoOmNbnkD6GwEg==
X-CSE-MsgGUID: DYorCig6SAuu2eJIhYkUlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94506076"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="94506076"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 13:01:22 -0700
X-CSE-ConnectionGUID: lphVwFxUQ322GN8ja0y0MQ==
X-CSE-MsgGUID: dbzc79GjRtSELd6prlJF5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="249202263"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 03 Jul 2026 13:01:20 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfk4c-000000001Zl-2smC;
	Fri, 03 Jul 2026 20:01:18 +0000
Date: Fri, 03 Jul 2026 22:00:39 +0200
From: kernel test robot <lkp@intel.com>
To: "Ching-Te Ku" <ku920601@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, "Ping-Ke Shih" <pkshih@realtek.com>
Subject: drivers/net/wireless/realtek/rtw89/coex.c:7957:51: warning:
 overlapping comparisons always evaluate to true
Message-ID: <202607032153.rVIyuBbI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Ping-Ke-Shih/wifi-rtw89-coex-Add-Init-info-version-10/20260703-195949
head:   3838fb6a6e17533236a69064edbe55af1024858b
commit: 868edae4d5e556502d903a8c6bea0b9d3f5558a9 wifi: rtw89: coex: Add WiFi/Bluetooth adapter binding info
date:   8 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260703/202607032153.rVIyuBbI-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260703/202607032153.rVIyuBbI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607032153.rVIyuBbI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/realtek/rtw89/coex.c:7957:51: warning: overlapping comparisons always evaluate to true [-Wtautological-overlap-compare]
    7957 |                 if (wl->role_info.link_mode != BTC_WLINK_2G_MCC ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~
    7958 |                     wl->role_info.link_mode != BTC_WLINK_25G_MCC ||
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +7957 drivers/net/wireless/realtek/rtw89/coex.c

  7909	
  7910	#define _bind_is_btonly 0x7
  7911	static void _set_coex_binding(struct rtw89_btc *btc)
  7912	{
  7913		struct rtw89_btc_cx *cx = &btc->cx;
  7914		struct rtw89_btc_extsoc_info *bt2 =  &cx->bt_ext;
  7915		struct rtw89_btc_bt_info *bt0 = &cx->bt0;
  7916		struct rtw89_btc_bt_info *bt1 = &cx->bt1;
  7917		struct rtw89_btc_wl_info *wl = &cx->wl;
  7918		struct rtw89_btc_dm *dm = &btc->dm;
  7919		u8 path_hwb[BTC_RF_NUM] = {RTW89_PHY_0, RTW89_PHY_1};
  7920		u8 wl_rf_band[RTW89_BAND_NUM] = {};
  7921		u8 i, j, val = 0;
  7922	
  7923		/*
  7924		 * sit_xmap(Space-Interaction) = ant_xmap | xtk_xmap
  7925		 * 1: WL-BT space-interference, always 1 if BTG/BTA/SPDT = 1
  7926		 * if dedicated-ant, it may be 1 if BT-Tx is bigger than WL-Rx(xtk_xmap)
  7927		 *
  7928		 * ant_xmap(ANT-Division-Multiplexing)
  7929		 * ==> dedicated-ant->0, BTG/BTA/SPDT->1
  7930		 *
  7931		 * xtk_xmap(Cross-talk map)-> calculate WL/BT interference by SIR
  7932		 * ==> 1: interference, 0: no-interference
  7933		 *
  7934		 * fdm_map(Frequency-Division-Multiplexing): WL/BT RF_Band overlap-map
  7935		 * 2bit-map: bit[1]:5GHz/6GHz, bit[0]:2.4GHz
  7936		 */
  7937		for (i = 0; i < RTW89_PHY_NUM; i++) {
  7938			if (wl->rf_band_map[i] & BIT(RTW89_BAND_2G))
  7939				wl_rf_band[i] |= BIT(RTW89_BAND_2G);
  7940	
  7941			if (wl->rf_band_map[i] & (BIT(RTW89_BAND_5G) | BIT(RTW89_BAND_6G)))
  7942				wl_rf_band[i] |= BIT(RTW89_BAND_5G);
  7943	
  7944			dm->fit_xmap[i][BTC_BT_1ST] = wl_rf_band[i] & bt0->rf_band_map;
  7945			dm->fit_xmap[i][BTC_BT_2ND] = wl_rf_band[i] & bt1->rf_band_map;
  7946			dm->fit_xmap[i][BTC_BT_EXT] = wl_rf_band[i] & bt2->rf_band_map;
  7947		}
  7948	
  7949		/*
  7950		 * if MR_WTYPE_MLD2L1R_NONMLD, FW will change 2+0/0+2/1+1
  7951		 * Therefore, BTC_MLO_RF_xxx is not real-time state.
  7952		 * if link mode change by _ntfy_generic(BTC_GNTFY_MRCX_INFO)
  7953		 * the HW-BAND is decided by wl->mlo_info.mrcx_act_hwb_map
  7954		 * In this case, BTC_RF_S0->HWB0, BTC_RF_S1->HWB1
  7955		 */
  7956		if (wl->mlo_info.wtype == RTW89_MR_WTYPE_MLD2L1R_NONMLD) {
> 7957			if (wl->role_info.link_mode != BTC_WLINK_2G_MCC ||
  7958			    wl->role_info.link_mode != BTC_WLINK_25G_MCC ||
  7959			    wl->role_info.link_mode != BTC_WLINK_25G_DBCC) {/* mode chg */
  7960				if (wl->mlo_info.mrcx_act_hwb_map == BIT(RTW89_PHY_1))
  7961					path_hwb[BTC_RF_S0] = RTW89_PHY_1;/* S0/1->HWB1 */
  7962				else
  7963					path_hwb[BTC_RF_S1] = RTW89_PHY_0;/* S0/1->HWB0 */
  7964			}
  7965		} else {
  7966			if (wl->mlo_info.rf_combination == BTC_MLO_RF_2_PLUS_0)
  7967				path_hwb[BTC_RF_S1] = RTW89_PHY_0; /* 2+0 RF-S0/1->HWB0 */
  7968			else if (wl->mlo_info.rf_combination == BTC_MLO_RF_0_PLUS_2)
  7969				path_hwb[BTC_RF_S0] = RTW89_PHY_1; /* 2+0 RF-S0/1->HWB1 */
  7970		}
  7971	
  7972		/*
  7973		 * tdd_map = sit_xmap * fdm_map, 1: WL-RF-Sx vs. BTx take TDD-Action
  7974		 * fdd_map =(!sit_xmap) * fdm_map, 1: WL-RF-Sx vs.BTx take FDD-Action
  7975		 * co-rx map = ant_xmap * fdm_map 1:WL/BT co-rx (for halbb-btg-ctrl)
  7976		 * sit_xmap,ant_xmap = 0 or 1, so tdd/fdd use multiplication (*)
  7977		 */
  7978	
  7979		for (i = 0; i < BTC_RF_NUM; i++)
  7980			for (j = 0; j < BTC_ALL_BT_EZL; j++) {
  7981				dm->tdd_map[i][j] = dm->sit_xmap[i][j] *
  7982						    dm->fit_xmap[path_hwb[i]][j];
  7983				dm->fdd_map[i][j] = !dm->sit_xmap[i][j] *
  7984						     dm->fit_xmap[path_hwb[i]][j];
  7985				dm->corx_map[i][j] = dm->ant_xmap[i][j] *
  7986						     dm->fit_xmap[path_hwb[i]][j];
  7987		}
  7988	
  7989		/* TDD-Binding */
  7990		_set_bind_info(btc, BTC_MECH_TDD);
  7991	
  7992		/* FDD-Binding */
  7993		_set_bind_info(btc, BTC_MECH_FDD);
  7994	
  7995		dm->out_of_band = !dm->tdd_bind.rf_band && !dm->fdd_bind.rf_band;
  7996		dm->fdd_en = !!dm->fdd_bind.rf_band;
  7997		dm->tdd_en = !!dm->tdd_bind.rf_band;
  7998	
  7999		/* set BT on/off state for GNT_WL Combined-MUX control */
  8000		if (bt0->enable.now)
  8001			val |= BIT(0);
  8002	
  8003		if (bt1->enable.now)
  8004			val |= BIT(1);
  8005	
  8006		if (bt2->func_type)
  8007			val |= BIT(2);
  8008	
  8009		dm->ost_info.bt_enable_state = dm->bt_only ? _bind_is_btonly : val;
  8010	}
  8011	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
