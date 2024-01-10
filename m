Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0EDD3F8EE;
	Wed, 10 Jan 2024 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWz6YcqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704881706; x=1736417706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6XlY/aj8pAFnZxgzNHzuMwLSLvDsX8j1bhlZFlsKelU=;
  b=UWz6YcqYdHsmId2YXTLdXS9IjBrIPX00tsshDi1cabxzF8zYHfukMa2p
   cZR6atB/kDYwkJsYj73Dvm+GUSvM6FIzCLDcty5vUtoMDHMockPPCO1Up
   qFkhRUwFU4VVGClYLz8yxUkHtD7+s0jw8kWbYW9VB4qGJIWEml61fxy+K
   IMDgsjrwSD1x1z8ZW4QK++cnCaVbZEMcGzpmVN58s0/y8cDbZfqH92TB1
   QcQvzGGFz3YWVCzPmpoSobmY0apfbaMrd4W27ezTXdbU3xlMMmZTsQXt9
   X19pysB1vGaLXscK+S/u93C8xmdAic3zA80/KQ7KpEhC49oscC/VpaKt2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="11955642"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="11955642"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 02:15:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="852504030"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="852504030"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jan 2024 02:15:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNVbu-0006ru-1e;
	Wed, 10 Jan 2024 10:15:00 +0000
Date: Wed, 10 Jan 2024 18:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [iwlwifi-next:egrumbac_fixes_6.5 70/73]
 drivers/net/wireless/quantenna/qtnfmac/event.c:665:11: error: no member
 named 'assoc_link_id' in 'struct cfg80211_update_owe_info'
Message-ID: <202401101830.Iazg6C7f-lkp@intel.com>
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
commit: 5955fac6fe1c30c7fc4fa0e46b7bd35b5360264f [70/73] CFG80211
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240110/202401101830.Iazg6C7f-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401101830.Iazg6C7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401101830.Iazg6C7f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath6kl/cfg80211.c:1122:52: error: too many arguments to function call, expected 3, have 4
    1122 |         cfg80211_ch_switch_notify(vif->ndev, &chandef, 0, 0);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~                         ^
   include/net/cfg80211.h:8422:6: note: 'cfg80211_ch_switch_notify' declared here
    8422 | void cfg80211_ch_switch_notify(struct net_device *dev,
         |      ^                         ~~~~~~~~~~~~~~~~~~~~~~~
    8423 |                                struct cfg80211_chan_def *chandef,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8424 |                                unsigned int link_id);
         |                                ~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/net/wireless/quantenna/qtnfmac/event.c:481:55: error: too many arguments to function call, expected 3, have 4
     481 |                 cfg80211_ch_switch_notify(vif->netdev, &chandef, 0, 0);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~                           ^
   include/net/cfg80211.h:8422:6: note: 'cfg80211_ch_switch_notify' declared here
    8422 | void cfg80211_ch_switch_notify(struct net_device *dev,
         |      ^                         ~~~~~~~~~~~~~~~~~~~~~~~
    8423 |                                struct cfg80211_chan_def *chandef,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8424 |                                unsigned int link_id);
         |                                ~~~~~~~~~~~~~~~~~~~~
>> drivers/net/wireless/quantenna/qtnfmac/event.c:665:11: error: no member named 'assoc_link_id' in 'struct cfg80211_update_owe_info'
     665 |         owe_info.assoc_link_id = -1;
         |         ~~~~~~~~ ^
   2 errors generated.
--
>> drivers/net/wireless/virtual/mac80211_hwsim.c:3338:8: error: call to undeclared function 'nl80211_send_chandef'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3338 |         err = nl80211_send_chandef(msg, &request->chandef);
         |               ^
   1 error generated.
--
>> drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c:36:41: error: too many arguments to function call, expected 7, have 8
      35 |                 ieee80211_amsdu_to_8023s(skb, &list, priv->curr_addr,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~
      36 |                                          priv->wdev.iftype, 0, NULL, NULL, false);
         |                                                                            ^~~~~
   include/net/cfg80211.h:6309:6: note: 'ieee80211_amsdu_to_8023s' declared here
    6309 | void ieee80211_amsdu_to_8023s(struct sk_buff *skb, struct sk_buff_head *list,
         |      ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6310 |                               const u8 *addr, enum nl80211_iftype iftype,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6311 |                               const unsigned int extra_headroom,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    6312 |                               const u8 *check_da, const u8 *check_sa);
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/net/wireless/marvell/mwifiex/11h.c:291:65: error: too many arguments to function call, expected 3, have 4
     291 |         cfg80211_ch_switch_notify(priv->netdev, &priv->dfs_chandef, 0, 0);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~                                      ^
   include/net/cfg80211.h:8422:6: note: 'cfg80211_ch_switch_notify' declared here
    8422 | void cfg80211_ch_switch_notify(struct net_device *dev,
         |      ^                         ~~~~~~~~~~~~~~~~~~~~~~~
    8423 |                                struct cfg80211_chan_def *chandef,
         |                                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8424 |                                unsigned int link_id);
         |                                ~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +665 drivers/net/wireless/quantenna/qtnfmac/event.c

98f44cb0655cbe Igor Mitsyanko       2017-05-11  434  
97883695d596e2 Sergey Matyukevich   2017-07-28  435  static int
97883695d596e2 Sergey Matyukevich   2017-07-28  436  qtnf_event_handle_freq_change(struct qtnf_wmac *mac,
97883695d596e2 Sergey Matyukevich   2017-07-28  437  			      const struct qlink_event_freq_change *data,
97883695d596e2 Sergey Matyukevich   2017-07-28  438  			      u16 len)
97883695d596e2 Sergey Matyukevich   2017-07-28  439  {
97883695d596e2 Sergey Matyukevich   2017-07-28  440  	struct wiphy *wiphy = priv_to_wiphy(mac);
97883695d596e2 Sergey Matyukevich   2017-07-28  441  	struct cfg80211_chan_def chandef;
97883695d596e2 Sergey Matyukevich   2017-07-28  442  	struct qtnf_vif *vif;
97883695d596e2 Sergey Matyukevich   2017-07-28  443  	int i;
97883695d596e2 Sergey Matyukevich   2017-07-28  444  
97883695d596e2 Sergey Matyukevich   2017-07-28  445  	if (len < sizeof(*data)) {
fac7f9bf14814f Igor Mitsyanko       2017-09-21  446  		pr_err("MAC%u: payload is too short\n", mac->macid);
97883695d596e2 Sergey Matyukevich   2017-07-28  447  		return -EINVAL;
97883695d596e2 Sergey Matyukevich   2017-07-28  448  	}
97883695d596e2 Sergey Matyukevich   2017-07-28  449  
115af851234fc2 Igor Mitsyanko       2017-09-21  450  	if (!wiphy->registered)
115af851234fc2 Igor Mitsyanko       2017-09-21  451  		return 0;
115af851234fc2 Igor Mitsyanko       2017-09-21  452  
fac7f9bf14814f Igor Mitsyanko       2017-09-21  453  	qlink_chandef_q2cfg(wiphy, &data->chan, &chandef);
fac7f9bf14814f Igor Mitsyanko       2017-09-21  454  
fac7f9bf14814f Igor Mitsyanko       2017-09-21  455  	if (!cfg80211_chandef_valid(&chandef)) {
5bf374ab91ad36 Sergey Matyukevich   2017-12-19  456  		pr_err("MAC%u: bad channel freq=%u cf1=%u cf2=%u bw=%u\n",
5bf374ab91ad36 Sergey Matyukevich   2017-12-19  457  		       mac->macid, chandef.chan->center_freq,
fac7f9bf14814f Igor Mitsyanko       2017-09-21  458  		       chandef.center_freq1, chandef.center_freq2,
fac7f9bf14814f Igor Mitsyanko       2017-09-21  459  		       chandef.width);
97883695d596e2 Sergey Matyukevich   2017-07-28  460  		return -EINVAL;
97883695d596e2 Sergey Matyukevich   2017-07-28  461  	}
97883695d596e2 Sergey Matyukevich   2017-07-28  462  
fac7f9bf14814f Igor Mitsyanko       2017-09-21  463  	pr_debug("MAC%d: new channel ieee=%u freq1=%u freq2=%u bw=%u\n",
fac7f9bf14814f Igor Mitsyanko       2017-09-21  464  		 mac->macid, chandef.chan->hw_value, chandef.center_freq1,
fac7f9bf14814f Igor Mitsyanko       2017-09-21  465  		 chandef.center_freq2, chandef.width);
97883695d596e2 Sergey Matyukevich   2017-07-28  466  
97883695d596e2 Sergey Matyukevich   2017-07-28  467  	for (i = 0; i < QTNF_MAX_INTF; i++) {
97883695d596e2 Sergey Matyukevich   2017-07-28  468  		vif = &mac->iflist[i];
4f87d486faf194 Sergey Matyukevich   2019-04-09  469  
97883695d596e2 Sergey Matyukevich   2017-07-28  470  		if (vif->wdev.iftype == NL80211_IFTYPE_UNSPECIFIED)
97883695d596e2 Sergey Matyukevich   2017-07-28  471  			continue;
97883695d596e2 Sergey Matyukevich   2017-07-28  472  
4f87d486faf194 Sergey Matyukevich   2019-04-09  473  		if (vif->wdev.iftype == NL80211_IFTYPE_STATION &&
7b0a0e3c3a8826 Johannes Berg        2022-04-14  474  		    !vif->wdev.connected)
4f87d486faf194 Sergey Matyukevich   2019-04-09  475  			continue;
4f87d486faf194 Sergey Matyukevich   2019-04-09  476  
4f87d486faf194 Sergey Matyukevich   2019-04-09  477  		if (!vif->netdev)
4f87d486faf194 Sergey Matyukevich   2019-04-09  478  			continue;
4f87d486faf194 Sergey Matyukevich   2019-04-09  479  
97883695d596e2 Sergey Matyukevich   2017-07-28  480  		mutex_lock(&vif->wdev.mtx);
b345f0637c0042 Aloka Dixit          2023-01-30 @481  		cfg80211_ch_switch_notify(vif->netdev, &chandef, 0, 0);
97883695d596e2 Sergey Matyukevich   2017-07-28  482  		mutex_unlock(&vif->wdev.mtx);
97883695d596e2 Sergey Matyukevich   2017-07-28  483  	}
97883695d596e2 Sergey Matyukevich   2017-07-28  484  
97883695d596e2 Sergey Matyukevich   2017-07-28  485  	return 0;
97883695d596e2 Sergey Matyukevich   2017-07-28  486  }
97883695d596e2 Sergey Matyukevich   2017-07-28  487  
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  488  static int qtnf_event_handle_radar(struct qtnf_vif *vif,
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  489  				   const struct qlink_event_radar *ev,
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  490  				   u16 len)
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  491  {
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  492  	struct wiphy *wiphy = priv_to_wiphy(vif->mac);
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  493  	struct cfg80211_chan_def chandef;
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  494  
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  495  	if (len < sizeof(*ev)) {
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  496  		pr_err("MAC%u: payload is too short\n", vif->mac->macid);
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  497  		return -EINVAL;
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  498  	}
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  499  
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  500  	if (!wiphy->registered || !vif->netdev)
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  501  		return 0;
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  502  
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  503  	qlink_chandef_q2cfg(wiphy, &ev->chan, &chandef);
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  504  
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  505  	if (!cfg80211_chandef_valid(&chandef)) {
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  506  		pr_err("MAC%u: bad channel f1=%u f2=%u bw=%u\n",
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  507  		       vif->mac->macid,
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  508  		       chandef.center_freq1, chandef.center_freq2,
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  509  		       chandef.width);
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  510  		return -EINVAL;
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  511  	}
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  512  
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  513  	pr_info("%s: radar event=%u f1=%u f2=%u bw=%u\n",
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  514  		vif->netdev->name, ev->event,
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  515  		chandef.center_freq1, chandef.center_freq2,
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  516  		chandef.width);
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  517  
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  518  	switch (ev->event) {
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  519  	case QLINK_RADAR_DETECTED:
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  520  		cfg80211_radar_event(wiphy, &chandef, GFP_KERNEL);
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  521  		break;
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  522  	case QLINK_RADAR_CAC_FINISHED:
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  523  		if (!vif->wdev.cac_started)
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  524  			break;
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  525  
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  526  		cfg80211_cac_event(vif->netdev, &chandef,
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  527  				   NL80211_RADAR_CAC_FINISHED, GFP_KERNEL);
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  528  		break;
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  529  	case QLINK_RADAR_CAC_ABORTED:
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  530  		if (!vif->wdev.cac_started)
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  531  			break;
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  532  
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  533  		cfg80211_cac_event(vif->netdev, &chandef,
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  534  				   NL80211_RADAR_CAC_ABORTED, GFP_KERNEL);
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  535  		break;
fbb93020b89bc0 Dmitry Lebed         2018-03-26  536  	case QLINK_RADAR_CAC_STARTED:
fbb93020b89bc0 Dmitry Lebed         2018-03-26  537  		if (vif->wdev.cac_started)
fbb93020b89bc0 Dmitry Lebed         2018-03-26  538  			break;
fbb93020b89bc0 Dmitry Lebed         2018-03-26  539  
fbb93020b89bc0 Dmitry Lebed         2018-03-26  540  		if (!wiphy_ext_feature_isset(wiphy,
fbb93020b89bc0 Dmitry Lebed         2018-03-26  541  					     NL80211_EXT_FEATURE_DFS_OFFLOAD))
fbb93020b89bc0 Dmitry Lebed         2018-03-26  542  			break;
fbb93020b89bc0 Dmitry Lebed         2018-03-26  543  
fbb93020b89bc0 Dmitry Lebed         2018-03-26  544  		cfg80211_cac_event(vif->netdev, &chandef,
fbb93020b89bc0 Dmitry Lebed         2018-03-26  545  				   NL80211_RADAR_CAC_STARTED, GFP_KERNEL);
fbb93020b89bc0 Dmitry Lebed         2018-03-26  546  		break;
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  547  	default:
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  548  		pr_warn("%s: unhandled radar event %u\n",
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  549  			vif->netdev->name, ev->event);
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  550  		break;
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  551  	}
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  552  
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  553  	return 0;
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  554  }
b05ee456fd21d7 Igor Mitsyanko       2017-12-19  555  
47b08e75a66988 Sergey Matyukevich   2019-02-05  556  static int
47b08e75a66988 Sergey Matyukevich   2019-02-05  557  qtnf_event_handle_external_auth(struct qtnf_vif *vif,
47b08e75a66988 Sergey Matyukevich   2019-02-05  558  				const struct qlink_event_external_auth *ev,
47b08e75a66988 Sergey Matyukevich   2019-02-05  559  				u16 len)
47b08e75a66988 Sergey Matyukevich   2019-02-05  560  {
47b08e75a66988 Sergey Matyukevich   2019-02-05  561  	struct cfg80211_external_auth_params auth = {0};
47b08e75a66988 Sergey Matyukevich   2019-02-05  562  	struct wiphy *wiphy = priv_to_wiphy(vif->mac);
47b08e75a66988 Sergey Matyukevich   2019-02-05  563  	int ret;
47b08e75a66988 Sergey Matyukevich   2019-02-05  564  
47b08e75a66988 Sergey Matyukevich   2019-02-05  565  	if (len < sizeof(*ev)) {
47b08e75a66988 Sergey Matyukevich   2019-02-05  566  		pr_err("MAC%u: payload is too short\n", vif->mac->macid);
47b08e75a66988 Sergey Matyukevich   2019-02-05  567  		return -EINVAL;
47b08e75a66988 Sergey Matyukevich   2019-02-05  568  	}
47b08e75a66988 Sergey Matyukevich   2019-02-05  569  
47b08e75a66988 Sergey Matyukevich   2019-02-05  570  	if (!wiphy->registered || !vif->netdev)
47b08e75a66988 Sergey Matyukevich   2019-02-05  571  		return 0;
47b08e75a66988 Sergey Matyukevich   2019-02-05  572  
47b08e75a66988 Sergey Matyukevich   2019-02-05  573  	if (ev->ssid_len) {
130f634da1af64 Lee Gibson           2021-04-19  574  		int len = clamp_val(ev->ssid_len, 0, IEEE80211_MAX_SSID_LEN);
130f634da1af64 Lee Gibson           2021-04-19  575  
130f634da1af64 Lee Gibson           2021-04-19  576  		memcpy(auth.ssid.ssid, ev->ssid, len);
130f634da1af64 Lee Gibson           2021-04-19  577  		auth.ssid.ssid_len = len;
47b08e75a66988 Sergey Matyukevich   2019-02-05  578  	}
47b08e75a66988 Sergey Matyukevich   2019-02-05  579  
47b08e75a66988 Sergey Matyukevich   2019-02-05  580  	auth.key_mgmt_suite = le32_to_cpu(ev->akm_suite);
47b08e75a66988 Sergey Matyukevich   2019-02-05  581  	ether_addr_copy(auth.bssid, ev->bssid);
47b08e75a66988 Sergey Matyukevich   2019-02-05  582  	auth.action = ev->action;
47b08e75a66988 Sergey Matyukevich   2019-02-05  583  
b3860e7a3e7197 Sergey Matyukevich   2020-02-13  584  	pr_debug("%s: external SAE processing: bss=%pM action=%u akm=%u\n",
47b08e75a66988 Sergey Matyukevich   2019-02-05  585  		 vif->netdev->name, auth.bssid, auth.action,
47b08e75a66988 Sergey Matyukevich   2019-02-05  586  		 auth.key_mgmt_suite);
47b08e75a66988 Sergey Matyukevich   2019-02-05  587  
47b08e75a66988 Sergey Matyukevich   2019-02-05  588  	ret = cfg80211_external_auth_request(vif->netdev, &auth, GFP_KERNEL);
47b08e75a66988 Sergey Matyukevich   2019-02-05  589  	if (ret)
47b08e75a66988 Sergey Matyukevich   2019-02-05  590  		pr_warn("failed to offload external auth request\n");
47b08e75a66988 Sergey Matyukevich   2019-02-05  591  
47b08e75a66988 Sergey Matyukevich   2019-02-05  592  	return ret;
47b08e75a66988 Sergey Matyukevich   2019-02-05  593  }
47b08e75a66988 Sergey Matyukevich   2019-02-05  594  
239ce8a79778b6 Sergey Matyukevich   2019-11-13  595  static int
239ce8a79778b6 Sergey Matyukevich   2019-11-13  596  qtnf_event_handle_mic_failure(struct qtnf_vif *vif,
239ce8a79778b6 Sergey Matyukevich   2019-11-13  597  			      const struct qlink_event_mic_failure *mic_ev,
239ce8a79778b6 Sergey Matyukevich   2019-11-13  598  			      u16 len)
239ce8a79778b6 Sergey Matyukevich   2019-11-13  599  {
239ce8a79778b6 Sergey Matyukevich   2019-11-13  600  	struct wiphy *wiphy = priv_to_wiphy(vif->mac);
239ce8a79778b6 Sergey Matyukevich   2019-11-13  601  	u8 pairwise;
239ce8a79778b6 Sergey Matyukevich   2019-11-13  602  
239ce8a79778b6 Sergey Matyukevich   2019-11-13  603  	if (len < sizeof(*mic_ev)) {
239ce8a79778b6 Sergey Matyukevich   2019-11-13  604  		pr_err("VIF%u.%u: payload is too short (%u < %zu)\n",
239ce8a79778b6 Sergey Matyukevich   2019-11-13  605  		       vif->mac->macid, vif->vifid, len,
239ce8a79778b6 Sergey Matyukevich   2019-11-13  606  		       sizeof(struct qlink_event_mic_failure));
239ce8a79778b6 Sergey Matyukevich   2019-11-13  607  		return -EINVAL;
239ce8a79778b6 Sergey Matyukevich   2019-11-13  608  	}
239ce8a79778b6 Sergey Matyukevich   2019-11-13  609  
239ce8a79778b6 Sergey Matyukevich   2019-11-13  610  	if (!wiphy->registered || !vif->netdev)
239ce8a79778b6 Sergey Matyukevich   2019-11-13  611  		return 0;
239ce8a79778b6 Sergey Matyukevich   2019-11-13  612  
239ce8a79778b6 Sergey Matyukevich   2019-11-13  613  	if (vif->wdev.iftype != NL80211_IFTYPE_STATION) {
239ce8a79778b6 Sergey Matyukevich   2019-11-13  614  		pr_err("VIF%u.%u: MIC_FAILURE event when not in STA mode\n",
239ce8a79778b6 Sergey Matyukevich   2019-11-13  615  		       vif->mac->macid, vif->vifid);
239ce8a79778b6 Sergey Matyukevich   2019-11-13  616  		return -EPROTO;
239ce8a79778b6 Sergey Matyukevich   2019-11-13  617  	}
239ce8a79778b6 Sergey Matyukevich   2019-11-13  618  
239ce8a79778b6 Sergey Matyukevich   2019-11-13  619  	pairwise = mic_ev->pairwise ?
239ce8a79778b6 Sergey Matyukevich   2019-11-13  620  		NL80211_KEYTYPE_PAIRWISE : NL80211_KEYTYPE_GROUP;
239ce8a79778b6 Sergey Matyukevich   2019-11-13  621  
239ce8a79778b6 Sergey Matyukevich   2019-11-13  622  	pr_info("%s: MIC error: src=%pM key_index=%u pairwise=%u\n",
239ce8a79778b6 Sergey Matyukevich   2019-11-13  623  		vif->netdev->name, mic_ev->src, mic_ev->key_index, pairwise);
239ce8a79778b6 Sergey Matyukevich   2019-11-13  624  
239ce8a79778b6 Sergey Matyukevich   2019-11-13  625  	cfg80211_michael_mic_failure(vif->netdev, mic_ev->src, pairwise,
239ce8a79778b6 Sergey Matyukevich   2019-11-13  626  				     mic_ev->key_index, NULL, GFP_KERNEL);
239ce8a79778b6 Sergey Matyukevich   2019-11-13  627  
239ce8a79778b6 Sergey Matyukevich   2019-11-13  628  	return 0;
239ce8a79778b6 Sergey Matyukevich   2019-11-13  629  }
239ce8a79778b6 Sergey Matyukevich   2019-11-13  630  
44d09764856f69 Sergey Matyukevich   2020-02-13  631  static int
44d09764856f69 Sergey Matyukevich   2020-02-13  632  qtnf_event_handle_update_owe(struct qtnf_vif *vif,
44d09764856f69 Sergey Matyukevich   2020-02-13  633  			     const struct qlink_event_update_owe *owe_ev,
44d09764856f69 Sergey Matyukevich   2020-02-13  634  			     u16 len)
44d09764856f69 Sergey Matyukevich   2020-02-13  635  {
44d09764856f69 Sergey Matyukevich   2020-02-13  636  	struct wiphy *wiphy = priv_to_wiphy(vif->mac);
44d09764856f69 Sergey Matyukevich   2020-02-13  637  	struct cfg80211_update_owe_info owe_info = {};
44d09764856f69 Sergey Matyukevich   2020-02-13  638  	const u16 ie_len = len - sizeof(*owe_ev);
44d09764856f69 Sergey Matyukevich   2020-02-13  639  	u8 *ie;
44d09764856f69 Sergey Matyukevich   2020-02-13  640  
44d09764856f69 Sergey Matyukevich   2020-02-13  641  	if (len < sizeof(*owe_ev)) {
44d09764856f69 Sergey Matyukevich   2020-02-13  642  		pr_err("VIF%u.%u: payload is too short (%u < %zu)\n",
44d09764856f69 Sergey Matyukevich   2020-02-13  643  		       vif->mac->macid, vif->vifid, len,
44d09764856f69 Sergey Matyukevich   2020-02-13  644  		       sizeof(struct qlink_event_update_owe));
44d09764856f69 Sergey Matyukevich   2020-02-13  645  		return -EINVAL;
44d09764856f69 Sergey Matyukevich   2020-02-13  646  	}
44d09764856f69 Sergey Matyukevich   2020-02-13  647  
44d09764856f69 Sergey Matyukevich   2020-02-13  648  	if (!wiphy->registered || !vif->netdev)
44d09764856f69 Sergey Matyukevich   2020-02-13  649  		return 0;
44d09764856f69 Sergey Matyukevich   2020-02-13  650  
44d09764856f69 Sergey Matyukevich   2020-02-13  651  	if (vif->wdev.iftype != NL80211_IFTYPE_AP) {
44d09764856f69 Sergey Matyukevich   2020-02-13  652  		pr_err("VIF%u.%u: UPDATE_OWE event when not in AP mode\n",
44d09764856f69 Sergey Matyukevich   2020-02-13  653  		       vif->mac->macid, vif->vifid);
44d09764856f69 Sergey Matyukevich   2020-02-13  654  		return -EPROTO;
44d09764856f69 Sergey Matyukevich   2020-02-13  655  	}
44d09764856f69 Sergey Matyukevich   2020-02-13  656  
44d09764856f69 Sergey Matyukevich   2020-02-13  657  	ie = kzalloc(ie_len, GFP_KERNEL);
44d09764856f69 Sergey Matyukevich   2020-02-13  658  	if (!ie)
44d09764856f69 Sergey Matyukevich   2020-02-13  659  		return -ENOMEM;
44d09764856f69 Sergey Matyukevich   2020-02-13  660  
44d09764856f69 Sergey Matyukevich   2020-02-13  661  	memcpy(owe_info.peer, owe_ev->peer, ETH_ALEN);
44d09764856f69 Sergey Matyukevich   2020-02-13  662  	memcpy(ie, owe_ev->ies, ie_len);
44d09764856f69 Sergey Matyukevich   2020-02-13  663  	owe_info.ie_len = ie_len;
44d09764856f69 Sergey Matyukevich   2020-02-13  664  	owe_info.ie = ie;
8bb588d9750197 Veerendranath Jakkam 2023-01-26 @665  	owe_info.assoc_link_id = -1;
44d09764856f69 Sergey Matyukevich   2020-02-13  666  
44d09764856f69 Sergey Matyukevich   2020-02-13  667  	pr_info("%s: external OWE processing: peer=%pM\n",
44d09764856f69 Sergey Matyukevich   2020-02-13  668  		vif->netdev->name, owe_ev->peer);
44d09764856f69 Sergey Matyukevich   2020-02-13  669  
44d09764856f69 Sergey Matyukevich   2020-02-13  670  	cfg80211_update_owe_info_event(vif->netdev, &owe_info, GFP_KERNEL);
44d09764856f69 Sergey Matyukevich   2020-02-13  671  	kfree(ie);
44d09764856f69 Sergey Matyukevich   2020-02-13  672  
44d09764856f69 Sergey Matyukevich   2020-02-13  673  	return 0;
44d09764856f69 Sergey Matyukevich   2020-02-13  674  }
44d09764856f69 Sergey Matyukevich   2020-02-13  675  

:::::: The code at line 665 was first introduced by commit
:::::: 8bb588d975019748ebdab9448e9a274b7463c13b wifi: cfg80211: Extend cfg80211_update_owe_info_event() for MLD AP

:::::: TO: Veerendranath Jakkam <quic_vjakkam@quicinc.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
