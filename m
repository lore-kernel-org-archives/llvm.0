Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E374BA89;
	Wed, 10 Jan 2024 15:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncj1kKWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704899290; x=1736435290;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GHd0Zwz89o9Tz/vJK50pXwnED3GJ5/OR0/l4ncq8E5c=;
  b=ncj1kKWjCWFnzt8R6rYUIV5b8hnDdDVbTz1pIGCzBdRCzGG07Po6ZIgU
   eyWAUH15rwqsv9bz0D/J+Y4IyeaXb2vaG6GqXPCV0fetqdGGqwl4ocz5y
   P8cipGclqbS4wPuEfyn5+sJMQe6GZ8O/hZTHp4SkFR0VlrQ/V6s2kqqMW
   f9ZJmFnNt/Rdlq/hNwI2KwV6ApES+ZvzlhOAvLL2Xy8oW3+PEvl1uN4NO
   yIr89orUuAybgiYNdjPz82nVaiiynzkJNDCk7a+M6Issn40jUCw4b7pwN
   am4/kuPOs+lIOOMS3byh1ZIgxIVzlsjWGK2PZLbYbxjeA1h61TQv/A8/r
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="11890492"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="11890492"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 07:08:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="16676071"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 10 Jan 2024 07:08:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNaBW-00079y-14;
	Wed, 10 Jan 2024 15:08:02 +0000
Date: Wed, 10 Jan 2024 23:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5 71/73]
 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:613:4: error: call to
 undeclared function 'ieee80211_refresh_tx_agg_session_timer'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202401102314.UOSSuKrv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git egrumbac_fixes_6.5
head:   62c3c8b5f77cbdf3d8f5cabf61afc9e8be0cfedf
commit: 02a9bdb93cd17e006612e7ad621c05f5937d6448 [71/73] MAC80211
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240110/202401102314.UOSSuKrv-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401102314.UOSSuKrv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401102314.UOSSuKrv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c:613:4: error: call to undeclared function 'ieee80211_refresh_tx_agg_session_timer'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     613 |                         ieee80211_refresh_tx_agg_session_timer(sta, tid);
         |                         ^
   1 error generated.
--
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:670:30: error: no member named 'ht_ldpc' in 'struct ieee80211_bss_conf'
     670 |         vc->ht_ldpc = vif->bss_conf.ht_ldpc;
         |                       ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:671:31: error: no member named 'vht_ldpc' in 'struct ieee80211_bss_conf'
     671 |         vc->vht_ldpc = vif->bss_conf.vht_ldpc;
         |                        ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:672:35: error: no member named 'vht_su_beamformer' in 'struct ieee80211_bss_conf'
     672 |         vc->vht_su_ebfer = vif->bss_conf.vht_su_beamformer;
         |                            ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:673:35: error: no member named 'vht_su_beamformee' in 'struct ieee80211_bss_conf'
     673 |         vc->vht_su_ebfee = vif->bss_conf.vht_su_beamformee;
         |                            ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:674:35: error: no member named 'vht_mu_beamformer' in 'struct ieee80211_bss_conf'
     674 |         vc->vht_mu_ebfer = vif->bss_conf.vht_mu_beamformer;
         |                            ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:675:35: error: no member named 'vht_mu_beamformee' in 'struct ieee80211_bss_conf'
     675 |         vc->vht_mu_ebfee = vif->bss_conf.vht_mu_beamformee;
         |                            ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:676:30: error: no member named 'he_ldpc' in 'struct ieee80211_bss_conf'
     676 |         vc->he_ldpc = vif->bss_conf.he_ldpc;
         |                       ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:677:34: error: no member named 'he_su_beamformer' in 'struct ieee80211_bss_conf'
     677 |         vc->he_su_ebfer = vif->bss_conf.he_su_beamformer;
         |                           ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:678:34: error: no member named 'he_su_beamformee' in 'struct ieee80211_bss_conf'
     678 |         vc->he_su_ebfee = vif->bss_conf.he_su_beamformee;
         |                           ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7915/main.c:679:34: error: no member named 'he_mu_beamformer' in 'struct ieee80211_bss_conf'
     679 |         vc->he_mu_ebfer = vif->bss_conf.he_mu_beamformer;
         |                           ~~~~~~~~~~~~~ ^
   10 errors generated.
--
>> drivers/net/wireless/ti/wlcore/main.c:2046:36: error: too few arguments to function call, expected 3, have 2
    2046 |         ieee80211_chswitch_done(vif, false);
         |         ~~~~~~~~~~~~~~~~~~~~~~~           ^
   include/net/mac80211.h:6461:6: note: 'ieee80211_chswitch_done' declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6462 |                              unsigned int link_id);
         |                              ~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/main.c:3033:37: error: too few arguments to function call, expected 3, have 2
    3033 |                 ieee80211_chswitch_done(vif, false);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~           ^
   include/net/mac80211.h:6461:6: note: 'ieee80211_chswitch_done' declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6462 |                              unsigned int link_id);
         |                              ~~~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ti/wlcore/main.c:5454:38: error: too few arguments to function call, expected 3, have 2
    5454 |                         ieee80211_chswitch_done(vif, false);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~           ^
   include/net/mac80211.h:6461:6: note: 'ieee80211_chswitch_done' declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6462 |                              unsigned int link_id);
         |                              ~~~~~~~~~~~~~~~~~~~~
   3 errors generated.
--
>> drivers/net/wireless/ti/wlcore/event.c:232:40: error: too few arguments to function call, expected 3, have 2
     232 |                         ieee80211_chswitch_done(vif, success);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~             ^
   include/net/mac80211.h:6461:6: note: 'ieee80211_chswitch_done' declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6462 |                              unsigned int link_id);
         |                              ~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1076:25: error: no member named 'eht_su_beamformee' in 'struct ieee80211_bss_conf'
    1076 |                         return vif->bss_conf.eht_su_beamformee &&
         |                                ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1079:25: error: no member named 'eht_su_beamformer' in 'struct ieee80211_bss_conf'
    1079 |                         return vif->bss_conf.eht_su_beamformer &&
         |                                ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1087:25: error: no member named 'he_su_beamformee' in 'struct ieee80211_bss_conf'
    1087 |                         return vif->bss_conf.he_su_beamformee &&
         |                                ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1090:25: error: no member named 'he_su_beamformer' in 'struct ieee80211_bss_conf'
    1090 |                         return vif->bss_conf.he_su_beamformer &&
         |                                ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1098:25: error: no member named 'vht_su_beamformee' in 'struct ieee80211_bss_conf'
    1098 |                         return vif->bss_conf.vht_su_beamformee &&
         |                                ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1101:25: error: no member named 'vht_su_beamformer' in 'struct ieee80211_bss_conf'
    1101 |                         return vif->bss_conf.vht_su_beamformer &&
         |                                ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1586:21: error: no member named 'ht_ldpc' in 'struct ieee80211_bss_conf'
    1586 |                 if (vif->bss_conf.ht_ldpc &&
         |                     ~~~~~~~~~~~~~ ^
>> drivers/net/wireless/mediatek/mt76/mt7996/mcu.c:1612:21: error: no member named 'vht_ldpc' in 'struct ieee80211_bss_conf'
    1612 |                 if (vif->bss_conf.vht_ldpc &&
         |                     ~~~~~~~~~~~~~ ^
   8 errors generated.
--
>> drivers/net/wireless/virtual/mac80211_hwsim.c:2249:9: error: call to undeclared function 'ieee80211_beacon_get_template_ema_list'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2249 |                 ema = ieee80211_beacon_get_template_ema_list(hw, vif, link_id);
         |                       ^
   drivers/net/wireless/virtual/mac80211_hwsim.c:2249:9: note: did you mean 'ieee80211_beacon_get_template'?
   include/net/mac80211.h:5275:1: note: 'ieee80211_beacon_get_template' declared here
    5275 | ieee80211_beacon_get_template(struct ieee80211_hw *hw,
         | ^
>> drivers/net/wireless/virtual/mac80211_hwsim.c:2249:7: error: incompatible integer to pointer conversion assigning to 'struct ieee80211_ema_beacons *' from 'int' [-Wint-conversion]
    2249 |                 ema = ieee80211_beacon_get_template_ema_list(hw, vif, link_id);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/virtual/mac80211_hwsim.c:2250:19: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    2250 |                 if (!ema || !ema->cnt)
         |                              ~~~^
   drivers/net/wireless/virtual/mac80211_hwsim.c:2246:10: note: forward declaration of 'struct ieee80211_ema_beacons'
    2246 |                 struct ieee80211_ema_beacons *ema;
         |                        ^
   drivers/net/wireless/virtual/mac80211_hwsim.c:2253:22: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    2253 |                 for (i = 0; i < ema->cnt; i++) {
         |                                 ~~~^
   drivers/net/wireless/virtual/mac80211_hwsim.c:2246:10: note: forward declaration of 'struct ieee80211_ema_beacons'
    2246 |                 struct ieee80211_ema_beacons *ema;
         |                        ^
   drivers/net/wireless/virtual/mac80211_hwsim.c:2255:13: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    2255 |                                                    ema->bcn[i].skb);
         |                                                    ~~~^
   drivers/net/wireless/virtual/mac80211_hwsim.c:2246:10: note: forward declaration of 'struct ieee80211_ema_beacons'
    2246 |                 struct ieee80211_ema_beacons *ema;
         |                        ^
   drivers/net/wireless/virtual/mac80211_hwsim.c:2256:7: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    2256 |                         ema->bcn[i].skb = NULL; /* Already freed */
         |                         ~~~^
   drivers/net/wireless/virtual/mac80211_hwsim.c:2246:10: note: forward declaration of 'struct ieee80211_ema_beacons'
    2246 |                 struct ieee80211_ema_beacons *ema;
         |                        ^
>> drivers/net/wireless/virtual/mac80211_hwsim.c:2258:3: error: call to undeclared function 'ieee80211_beacon_free_ema_list'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2258 |                 ieee80211_beacon_free_ema_list(ema);
         |                 ^
   drivers/net/wireless/virtual/mac80211_hwsim.c:2258:3: note: did you mean 'ieee80211_beacon_get_template'?
   include/net/mac80211.h:5275:1: note: 'ieee80211_beacon_get_template' declared here
    5275 | ieee80211_beacon_get_template(struct ieee80211_hw *hw,
         | ^
   drivers/net/wireless/virtual/mac80211_hwsim.c:3338:8: error: call to undeclared function 'nl80211_send_chandef'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3338 |         err = nl80211_send_chandef(msg, &request->chandef);
         |               ^
   8 errors generated.
--
>> drivers/net/wireless/intel/iwlegacy/common.c:4093:46: error: too few arguments to function call, expected 3, have 2
    4093 |                 ieee80211_chswitch_done(il->vif, is_success);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~                    ^
   include/net/mac80211.h:6461:6: note: 'ieee80211_chswitch_done' declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6462 |                              unsigned int link_id);
         |                              ~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   drivers/net/wireless/intel/iwlegacy/4965-mac.c:4234:7: warning: variable 'len' set but not used [-Wunused-but-set-variable]
    4234 |                 int len;
         |                     ^
>> drivers/net/wireless/intel/iwlegacy/4965-mac.c:6125:41: error: too few arguments to function call, expected 3, have 2
    6125 |                 ieee80211_chswitch_done(il->vif, false);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~               ^
   include/net/mac80211.h:6461:6: note: 'ieee80211_chswitch_done' declared here
    6461 | void ieee80211_chswitch_done(struct ieee80211_vif *vif, bool success,
         |      ^                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6462 |                              unsigned int link_id);
         |                              ~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
>> drivers/net/wireless/ath/ath11k/wmi.c:3959:3: error: call to undeclared function 'ieee80211_obss_color_collision_notify'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3959 |                 ieee80211_obss_color_collision_notify(arvif->vif, ev->obss_color_bitmap,
         |                 ^
   drivers/net/wireless/ath/ath11k/wmi.c:3959:3: note: did you mean 'ieeee80211_obss_color_collision_notify'?
   include/net/mac80211.h:7301:1: note: 'ieeee80211_obss_color_collision_notify' declared here
    7301 | ieeee80211_obss_color_collision_notify(struct ieee80211_vif *vif,
         | ^
   1 error generated.
--
>> drivers/net/wireless/ath/ath11k/mac.c:1469:12: error: call to undeclared function 'ieee80211_beacon_get_template_ema_list'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1469 |         beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
         |                   ^
   drivers/net/wireless/ath/ath11k/mac.c:1469:12: note: did you mean 'ieee80211_beacon_get_template'?
   include/net/mac80211.h:5275:1: note: 'ieee80211_beacon_get_template' declared here
    5275 | ieee80211_beacon_get_template(struct ieee80211_hw *hw,
         | ^
>> drivers/net/wireless/ath/ath11k/mac.c:1469:10: error: incompatible integer to pointer conversion assigning to 'struct ieee80211_ema_beacons *' from 'int' [-Wint-conversion]
    1469 |         beacons = ieee80211_beacon_get_template_ema_list(tx_arvif->ar->hw,
         |                 ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1470 |                                                          tx_arvif->vif, 0);
         |                                                          ~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/ath/ath11k/mac.c:1471:26: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    1471 |         if (!beacons || !beacons->cnt) {
         |                          ~~~~~~~^
   drivers/net/wireless/ath/ath11k/mac.c:1461:9: note: forward declaration of 'struct ieee80211_ema_beacons'
    1461 |         struct ieee80211_ema_beacons *beacons;
         |                ^
   drivers/net/wireless/ath/ath11k/mac.c:1478:46: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    1478 |                 ath11k_mac_set_vif_params(tx_arvif, beacons->bcn[0].skb);
         |                                                     ~~~~~~~^
   drivers/net/wireless/ath/ath11k/mac.c:1461:9: note: forward declaration of 'struct ieee80211_ema_beacons'
    1461 |         struct ieee80211_ema_beacons *beacons;
         |                ^
   drivers/net/wireless/ath/ath11k/mac.c:1482:25: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    1482 |         for (i = 0; i < beacons->cnt; i++) {
         |                         ~~~~~~~^
   drivers/net/wireless/ath/ath11k/mac.c:1461:9: note: forward declaration of 'struct ieee80211_ema_beacons'
    1461 |         struct ieee80211_ema_beacons *beacons;
         |                ^
   drivers/net/wireless/ath/ath11k/mac.c:1486:16: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    1486 |                                                                 beacons->bcn[i].skb);
         |                                                                 ~~~~~~~^
   drivers/net/wireless/ath/ath11k/mac.c:1461:9: note: forward declaration of 'struct ieee80211_ema_beacons'
    1461 |         struct ieee80211_ema_beacons *beacons;
         |                ^
   drivers/net/wireless/ath/ath11k/mac.c:1488:19: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    1488 |                 params = beacons->cnt;
         |                          ~~~~~~~^
   drivers/net/wireless/ath/ath11k/mac.c:1461:9: note: forward declaration of 'struct ieee80211_ema_beacons'
    1461 |         struct ieee80211_ema_beacons *beacons;
         |                ^
   drivers/net/wireless/ath/ath11k/mac.c:1491:31: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    1491 |                 params |= ((i + 1 == beacons->cnt ? 1 : 0) << WMI_EMA_LAST_TMPL_SHIFT);
         |                                      ~~~~~~~^
   drivers/net/wireless/ath/ath11k/mac.c:1461:9: note: forward declaration of 'struct ieee80211_ema_beacons'
    1461 |         struct ieee80211_ema_beacons *beacons;
         |                ^
   drivers/net/wireless/ath/ath11k/mac.c:1494:16: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    1494 |                                           &beacons->bcn[i].offs,
         |                                            ~~~~~~~^
   drivers/net/wireless/ath/ath11k/mac.c:1461:9: note: forward declaration of 'struct ieee80211_ema_beacons'
    1461 |         struct ieee80211_ema_beacons *beacons;
         |                ^
   drivers/net/wireless/ath/ath11k/mac.c:1495:15: error: incomplete definition of type 'struct ieee80211_ema_beacons'
    1495 |                                           beacons->bcn[i].skb, params);
         |                                           ~~~~~~~^
   drivers/net/wireless/ath/ath11k/mac.c:1461:9: note: forward declaration of 'struct ieee80211_ema_beacons'
    1461 |         struct ieee80211_ema_beacons *beacons;
         |                ^
>> drivers/net/wireless/ath/ath11k/mac.c:1504:2: error: call to undeclared function 'ieee80211_beacon_free_ema_list'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1504 |         ieee80211_beacon_free_ema_list(beacons);
         |         ^
   drivers/net/wireless/ath/ath11k/mac.c:1504:2: note: did you mean 'ieee80211_beacon_get_template'?
   include/net/mac80211.h:5275:1: note: 'ieee80211_beacon_get_template' declared here
    5275 | ieee80211_beacon_get_template(struct ieee80211_hw *hw,
         | ^
>> drivers/net/wireless/ath/ath11k/mac.c:2893:27: error: no member named 'he_su_beamformer' in 'struct ieee80211_bss_conf'
    2893 |         if (arvif->vif->bss_conf.he_su_beamformer) {
         |             ~~~~~~~~~~~~~~~~~~~~ ^
>> drivers/net/wireless/ath/ath11k/mac.c:2895:28: error: no member named 'he_mu_beamformer' in 'struct ieee80211_bss_conf'
    2895 |                 if (arvif->vif->bss_conf.he_mu_beamformer &&
         |                     ~~~~~~~~~~~~~~~~~~~~ ^
>> drivers/net/wireless/ath/ath11k/mac.c:2904:28: error: no member named 'he_full_ul_mumimo' in 'struct ieee80211_bss_conf'
    2904 |                 if (arvif->vif->bss_conf.he_full_ul_mumimo)
         |                     ~~~~~~~~~~~~~~~~~~~~ ^
>> drivers/net/wireless/ath/ath11k/mac.c:2907:28: error: no member named 'he_su_beamformee' in 'struct ieee80211_bss_conf'
    2907 |                 if (arvif->vif->bss_conf.he_su_beamformee)
         |                     ~~~~~~~~~~~~~~~~~~~~ ^
   15 errors generated.


vim +/ieee80211_refresh_tx_agg_session_timer +613 drivers/net/wireless/mediatek/mt76/mt76_connac_mac.c

b932425b63143c Lorenzo Bianconi 2022-06-07  581  
43eaa3689507a9 Ryder Lee        2022-08-11  582  bool mt76_connac2_mac_fill_txs(struct mt76_dev *dev, struct mt76_wcid *wcid,
43eaa3689507a9 Ryder Lee        2022-08-11  583  			       __le32 *txs_data)
b932425b63143c Lorenzo Bianconi 2022-06-07  584  {
dc877523e6c450 Ryder Lee        2022-08-11  585  	struct mt76_sta_stats *stats = &wcid->stats;
b932425b63143c Lorenzo Bianconi 2022-06-07  586  	struct ieee80211_supported_band *sband;
b932425b63143c Lorenzo Bianconi 2022-06-07  587  	struct mt76_phy *mphy;
b932425b63143c Lorenzo Bianconi 2022-06-07  588  	struct rate_info rate = {};
b932425b63143c Lorenzo Bianconi 2022-06-07  589  	bool cck = false;
fa67120bc8c78e Evelyn Tsai      2022-11-11  590  	u32 txrate, txs, mode, stbc;
b932425b63143c Lorenzo Bianconi 2022-06-07  591  
b932425b63143c Lorenzo Bianconi 2022-06-07  592  	txs = le32_to_cpu(txs_data[0]);
b932425b63143c Lorenzo Bianconi 2022-06-07  593  
43eaa3689507a9 Ryder Lee        2022-08-11  594  	/* PPDU based reporting */
feae00c6468ce1 Peter Chiu       2023-05-10  595  	if (mtk_wed_device_active(&dev->mmio.wed) &&
feae00c6468ce1 Peter Chiu       2023-05-10  596  	    FIELD_GET(MT_TXS0_TXS_FORMAT, txs) > 1) {
43eaa3689507a9 Ryder Lee        2022-08-11  597  		stats->tx_bytes +=
c7ab7a29ef5c07 Ryder Lee        2023-04-24  598  			le32_get_bits(txs_data[5], MT_TXS5_MPDU_TX_BYTE) -
c7ab7a29ef5c07 Ryder Lee        2023-04-24  599  			le32_get_bits(txs_data[7], MT_TXS7_MPDU_RETRY_BYTE);
43eaa3689507a9 Ryder Lee        2022-08-11  600  		stats->tx_failed +=
43eaa3689507a9 Ryder Lee        2022-08-11  601  			le32_get_bits(txs_data[6], MT_TXS6_MPDU_FAIL_CNT);
43eaa3689507a9 Ryder Lee        2022-08-11  602  		stats->tx_retries +=
43eaa3689507a9 Ryder Lee        2022-08-11  603  			le32_get_bits(txs_data[7], MT_TXS7_MPDU_RETRY_CNT);
1a1ff6c3b338a6 Ryder Lee        2023-02-18  604  
1a1ff6c3b338a6 Ryder Lee        2023-02-18  605  		if (wcid->sta) {
1a1ff6c3b338a6 Ryder Lee        2023-02-18  606  			struct ieee80211_sta *sta;
1a1ff6c3b338a6 Ryder Lee        2023-02-18  607  			u8 tid;
1a1ff6c3b338a6 Ryder Lee        2023-02-18  608  
1a1ff6c3b338a6 Ryder Lee        2023-02-18  609  			sta = container_of((void *)wcid, struct ieee80211_sta,
1a1ff6c3b338a6 Ryder Lee        2023-02-18  610  					   drv_priv);
1a1ff6c3b338a6 Ryder Lee        2023-02-18  611  			tid = FIELD_GET(MT_TXS0_TID, txs);
1a1ff6c3b338a6 Ryder Lee        2023-02-18  612  
1a1ff6c3b338a6 Ryder Lee        2023-02-18 @613  			ieee80211_refresh_tx_agg_session_timer(sta, tid);
1a1ff6c3b338a6 Ryder Lee        2023-02-18  614  		}
43eaa3689507a9 Ryder Lee        2022-08-11  615  	}
b932425b63143c Lorenzo Bianconi 2022-06-07  616  
b932425b63143c Lorenzo Bianconi 2022-06-07  617  	txrate = FIELD_GET(MT_TXS0_TX_RATE, txs);
b932425b63143c Lorenzo Bianconi 2022-06-07  618  
b932425b63143c Lorenzo Bianconi 2022-06-07  619  	rate.mcs = FIELD_GET(MT_TX_RATE_IDX, txrate);
b932425b63143c Lorenzo Bianconi 2022-06-07  620  	rate.nss = FIELD_GET(MT_TX_RATE_NSS, txrate) + 1;
fa67120bc8c78e Evelyn Tsai      2022-11-11  621  	stbc = FIELD_GET(MT_TX_RATE_STBC, txrate);
fa67120bc8c78e Evelyn Tsai      2022-11-11  622  
fa67120bc8c78e Evelyn Tsai      2022-11-11  623  	if (stbc && rate.nss > 1)
fa67120bc8c78e Evelyn Tsai      2022-11-11  624  		rate.nss >>= 1;
b932425b63143c Lorenzo Bianconi 2022-06-07  625  
b932425b63143c Lorenzo Bianconi 2022-06-07  626  	if (rate.nss - 1 < ARRAY_SIZE(stats->tx_nss))
b932425b63143c Lorenzo Bianconi 2022-06-07  627  		stats->tx_nss[rate.nss - 1]++;
b932425b63143c Lorenzo Bianconi 2022-06-07  628  	if (rate.mcs < ARRAY_SIZE(stats->tx_mcs))
b932425b63143c Lorenzo Bianconi 2022-06-07  629  		stats->tx_mcs[rate.mcs]++;
b932425b63143c Lorenzo Bianconi 2022-06-07  630  
b932425b63143c Lorenzo Bianconi 2022-06-07  631  	mode = FIELD_GET(MT_TX_RATE_MODE, txrate);
b932425b63143c Lorenzo Bianconi 2022-06-07  632  	switch (mode) {
b932425b63143c Lorenzo Bianconi 2022-06-07  633  	case MT_PHY_TYPE_CCK:
b932425b63143c Lorenzo Bianconi 2022-06-07  634  		cck = true;
b932425b63143c Lorenzo Bianconi 2022-06-07  635  		fallthrough;
b932425b63143c Lorenzo Bianconi 2022-06-07  636  	case MT_PHY_TYPE_OFDM:
b932425b63143c Lorenzo Bianconi 2022-06-07  637  		mphy = &dev->phy;
a1a99d7bddad6b Lorenzo Bianconi 2022-07-04  638  		if (wcid->phy_idx == MT_BAND1 && dev->phys[MT_BAND1])
dc44c45c8cd062 Lorenzo Bianconi 2022-07-04  639  			mphy = dev->phys[MT_BAND1];
b932425b63143c Lorenzo Bianconi 2022-06-07  640  
b932425b63143c Lorenzo Bianconi 2022-06-07  641  		if (mphy->chandef.chan->band == NL80211_BAND_5GHZ)
b932425b63143c Lorenzo Bianconi 2022-06-07  642  			sband = &mphy->sband_5g.sband;
b932425b63143c Lorenzo Bianconi 2022-06-07  643  		else if (mphy->chandef.chan->band == NL80211_BAND_6GHZ)
b932425b63143c Lorenzo Bianconi 2022-06-07  644  			sband = &mphy->sband_6g.sband;
b932425b63143c Lorenzo Bianconi 2022-06-07  645  		else
b932425b63143c Lorenzo Bianconi 2022-06-07  646  			sband = &mphy->sband_2g.sband;
b932425b63143c Lorenzo Bianconi 2022-06-07  647  
b932425b63143c Lorenzo Bianconi 2022-06-07  648  		rate.mcs = mt76_get_rate(mphy->dev, sband, rate.mcs, cck);
b932425b63143c Lorenzo Bianconi 2022-06-07  649  		rate.legacy = sband->bitrates[rate.mcs].bitrate;
b932425b63143c Lorenzo Bianconi 2022-06-07  650  		break;
b932425b63143c Lorenzo Bianconi 2022-06-07  651  	case MT_PHY_TYPE_HT:
b932425b63143c Lorenzo Bianconi 2022-06-07  652  	case MT_PHY_TYPE_HT_GF:
b932425b63143c Lorenzo Bianconi 2022-06-07  653  		if (rate.mcs > 31)
43eaa3689507a9 Ryder Lee        2022-08-11  654  			return false;
b932425b63143c Lorenzo Bianconi 2022-06-07  655  
b932425b63143c Lorenzo Bianconi 2022-06-07  656  		rate.flags = RATE_INFO_FLAGS_MCS;
b932425b63143c Lorenzo Bianconi 2022-06-07  657  		if (wcid->rate.flags & RATE_INFO_FLAGS_SHORT_GI)
b932425b63143c Lorenzo Bianconi 2022-06-07  658  			rate.flags |= RATE_INFO_FLAGS_SHORT_GI;
b932425b63143c Lorenzo Bianconi 2022-06-07  659  		break;
b932425b63143c Lorenzo Bianconi 2022-06-07  660  	case MT_PHY_TYPE_VHT:
b932425b63143c Lorenzo Bianconi 2022-06-07  661  		if (rate.mcs > 9)
43eaa3689507a9 Ryder Lee        2022-08-11  662  			return false;
b932425b63143c Lorenzo Bianconi 2022-06-07  663  
b932425b63143c Lorenzo Bianconi 2022-06-07  664  		rate.flags = RATE_INFO_FLAGS_VHT_MCS;
b932425b63143c Lorenzo Bianconi 2022-06-07  665  		break;
b932425b63143c Lorenzo Bianconi 2022-06-07  666  	case MT_PHY_TYPE_HE_SU:
b932425b63143c Lorenzo Bianconi 2022-06-07  667  	case MT_PHY_TYPE_HE_EXT_SU:
b932425b63143c Lorenzo Bianconi 2022-06-07  668  	case MT_PHY_TYPE_HE_TB:
b932425b63143c Lorenzo Bianconi 2022-06-07  669  	case MT_PHY_TYPE_HE_MU:
b932425b63143c Lorenzo Bianconi 2022-06-07  670  		if (rate.mcs > 11)
43eaa3689507a9 Ryder Lee        2022-08-11  671  			return false;
b932425b63143c Lorenzo Bianconi 2022-06-07  672  
b932425b63143c Lorenzo Bianconi 2022-06-07  673  		rate.he_gi = wcid->rate.he_gi;
b932425b63143c Lorenzo Bianconi 2022-06-07  674  		rate.he_dcm = FIELD_GET(MT_TX_RATE_DCM, txrate);
b932425b63143c Lorenzo Bianconi 2022-06-07  675  		rate.flags = RATE_INFO_FLAGS_HE_MCS;
b932425b63143c Lorenzo Bianconi 2022-06-07  676  		break;
b932425b63143c Lorenzo Bianconi 2022-06-07  677  	default:
43eaa3689507a9 Ryder Lee        2022-08-11  678  		return false;
b932425b63143c Lorenzo Bianconi 2022-06-07  679  	}
b932425b63143c Lorenzo Bianconi 2022-06-07  680  
b932425b63143c Lorenzo Bianconi 2022-06-07  681  	stats->tx_mode[mode]++;
b932425b63143c Lorenzo Bianconi 2022-06-07  682  
b932425b63143c Lorenzo Bianconi 2022-06-07  683  	switch (FIELD_GET(MT_TXS0_BW, txs)) {
b932425b63143c Lorenzo Bianconi 2022-06-07  684  	case IEEE80211_STA_RX_BW_160:
b932425b63143c Lorenzo Bianconi 2022-06-07  685  		rate.bw = RATE_INFO_BW_160;
b932425b63143c Lorenzo Bianconi 2022-06-07  686  		stats->tx_bw[3]++;
b932425b63143c Lorenzo Bianconi 2022-06-07  687  		break;
b932425b63143c Lorenzo Bianconi 2022-06-07  688  	case IEEE80211_STA_RX_BW_80:
b932425b63143c Lorenzo Bianconi 2022-06-07  689  		rate.bw = RATE_INFO_BW_80;
b932425b63143c Lorenzo Bianconi 2022-06-07  690  		stats->tx_bw[2]++;
b932425b63143c Lorenzo Bianconi 2022-06-07  691  		break;
b932425b63143c Lorenzo Bianconi 2022-06-07  692  	case IEEE80211_STA_RX_BW_40:
b932425b63143c Lorenzo Bianconi 2022-06-07  693  		rate.bw = RATE_INFO_BW_40;
b932425b63143c Lorenzo Bianconi 2022-06-07  694  		stats->tx_bw[1]++;
b932425b63143c Lorenzo Bianconi 2022-06-07  695  		break;
b932425b63143c Lorenzo Bianconi 2022-06-07  696  	default:
b932425b63143c Lorenzo Bianconi 2022-06-07  697  		rate.bw = RATE_INFO_BW_20;
b932425b63143c Lorenzo Bianconi 2022-06-07  698  		stats->tx_bw[0]++;
b932425b63143c Lorenzo Bianconi 2022-06-07  699  		break;
b932425b63143c Lorenzo Bianconi 2022-06-07  700  	}
b932425b63143c Lorenzo Bianconi 2022-06-07  701  	wcid->rate = rate;
b932425b63143c Lorenzo Bianconi 2022-06-07  702  
43eaa3689507a9 Ryder Lee        2022-08-11  703  	return true;
43eaa3689507a9 Ryder Lee        2022-08-11  704  }
43eaa3689507a9 Ryder Lee        2022-08-11  705  EXPORT_SYMBOL_GPL(mt76_connac2_mac_fill_txs);
43eaa3689507a9 Ryder Lee        2022-08-11  706  

:::::: The code at line 613 was first introduced by commit
:::::: 1a1ff6c3b338a6e9ef8d187fbae3d8f823a300ce wifi: mt76: connac: refresh tx session timer for WED device

:::::: TO: Ryder Lee <ryder.lee@mediatek.com>
:::::: CC: Felix Fietkau <nbd@nbd.name>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
