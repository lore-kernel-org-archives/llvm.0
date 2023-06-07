Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A892410E2;
	Wed,  7 Jun 2023 05:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686116383; x=1717652383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gLyKPFlziNHPYmzhXuJkEAEGkYASQHWfge3eaRZJBxM=;
  b=iVeMiq1APF0Hk7gwvZyl+DD7JcyzfyDAEYYdtVoMBZJwNCaN8rl23m3d
   /EJ+EmsbQK8DRdvwwCuMWibqqZSFvmaRSGxVeL/pS9z5wfpRhaze+wrZb
   zWvhCxT5SqBU98qzVjP7xtLWrUPPs3EQlGW3KeperbESuo/QksxjM3bUw
   +r61+261QshOd0dPv2JN5BicEiLaJZsSnb6NSps1je1tG2+ZxWq2D7QQR
   Qs3cwe0AiV5vhwaLLgstR94eJsu75MqujFmQCvOJRASJcreZQsRabsaK8
   ULCqhpLJPP2SrxPKtCeBGUbqPAVJBWsb8b0DCckOGQNLro5rpigHxhsNt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336515946"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="336515946"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 22:39:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="659800531"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="659800531"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Jun 2023 22:39:40 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6ltU-0006CR-0H;
	Wed, 07 Jun 2023 05:39:40 +0000
Date: Wed, 7 Jun 2023 13:39:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ilan Peer <ilan.peer@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 45/49] net/mac80211/mlme.c:7337:49: error: no
 member named 'disabled' in 'struct cfg80211_assoc_link'
Message-ID: <202306071324.abOflbQ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pending
head:   ce597ee65ce5ac4bea4c688122607c23dcbe72a9
commit: f8b1987d09267f4951f1b3add6352600122c9e47 [45/49] wifi: mac80211: Support disabled links during association
config: i386-randconfig-i061-20230607 (https://download.01.org/0day-ci/archive/20230607/202306071324.abOflbQ5-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=f8b1987d09267f4951f1b3add6352600122c9e47
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pending
        git checkout f8b1987d09267f4951f1b3add6352600122c9e47
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash net/mac80211/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071324.abOflbQ5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/mac80211/mlme.c:7337:49: error: no member named 'disabled' in 'struct cfg80211_assoc_link'
                           assoc_data->link[i].disabled = req->links[i].disabled;
                                                          ~~~~~~~~~~~~~ ^
   1 error generated.


vim +7337 net/mac80211/mlme.c

  7133	
  7134	int ieee80211_mgd_assoc(struct ieee80211_sub_if_data *sdata,
  7135				struct cfg80211_assoc_request *req)
  7136	{
  7137		unsigned int assoc_link_id = req->link_id < 0 ? 0 : req->link_id;
  7138		struct ieee80211_local *local = sdata->local;
  7139		struct ieee80211_if_managed *ifmgd = &sdata->u.mgd;
  7140		struct ieee80211_mgd_assoc_data *assoc_data;
  7141		const struct element *ssid_elem;
  7142		struct ieee80211_vif_cfg *vif_cfg = &sdata->vif.cfg;
  7143		ieee80211_conn_flags_t conn_flags = 0;
  7144		struct ieee80211_link_data *link;
  7145		struct cfg80211_bss *cbss;
  7146		struct ieee80211_bss *bss;
  7147		bool override;
  7148		int i, err;
  7149		size_t size = sizeof(*assoc_data) + req->ie_len;
  7150	
  7151		for (i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++)
  7152			size += req->links[i].elems_len;
  7153	
  7154		/* FIXME: no support for 4-addr MLO yet */
  7155		if (sdata->u.mgd.use_4addr && req->link_id >= 0)
  7156			return -EOPNOTSUPP;
  7157	
  7158		assoc_data = kzalloc(size, GFP_KERNEL);
  7159		if (!assoc_data)
  7160			return -ENOMEM;
  7161	
  7162		cbss = req->link_id < 0 ? req->bss : req->links[req->link_id].bss;
  7163	
  7164		rcu_read_lock();
  7165		ssid_elem = ieee80211_bss_get_elem(cbss, WLAN_EID_SSID);
  7166		if (!ssid_elem || ssid_elem->datalen > sizeof(assoc_data->ssid)) {
  7167			rcu_read_unlock();
  7168			kfree(assoc_data);
  7169			return -EINVAL;
  7170		}
  7171		memcpy(assoc_data->ssid, ssid_elem->data, ssid_elem->datalen);
  7172		assoc_data->ssid_len = ssid_elem->datalen;
  7173		memcpy(vif_cfg->ssid, assoc_data->ssid, assoc_data->ssid_len);
  7174		vif_cfg->ssid_len = assoc_data->ssid_len;
  7175		rcu_read_unlock();
  7176	
  7177		if (req->ap_mld_addr) {
  7178			for (i = 0; i < IEEE80211_MLD_MAX_NUM_LINKS; i++) {
  7179				if (!req->links[i].bss)
  7180					continue;
  7181				link = sdata_dereference(sdata->link[i], sdata);
  7182				if (link)
  7183					ether_addr_copy(assoc_data->link[i].addr,
  7184							link->conf->addr);
  7185				else
  7186					eth_random_addr(assoc_data->link[i].addr);
  7187			}
  7188		} else {
  7189			memcpy(assoc_data->link[0].addr, sdata->vif.addr, ETH_ALEN);
  7190		}
  7191	
  7192		assoc_data->s1g = cbss->channel->band == NL80211_BAND_S1GHZ;
  7193	
  7194		memcpy(assoc_data->ap_addr,
  7195		       req->ap_mld_addr ?: req->bss->bssid,
  7196		       ETH_ALEN);
  7197	
  7198		if (ifmgd->associated) {
  7199			u8 frame_buf[IEEE80211_DEAUTH_FRAME_LEN];
  7200	
  7201			sdata_info(sdata,
  7202				   "disconnect from AP %pM for new assoc to %pM\n",
  7203				   sdata->vif.cfg.ap_addr, assoc_data->ap_addr);
  7204			ieee80211_set_disassoc(sdata, IEEE80211_STYPE_DEAUTH,
  7205					       WLAN_REASON_UNSPECIFIED,
  7206					       false, frame_buf);
  7207	
  7208			ieee80211_report_disconnect(sdata, frame_buf,
  7209						    sizeof(frame_buf), true,
  7210						    WLAN_REASON_UNSPECIFIED,
  7211						    false);
  7212		}
  7213	
  7214		if (ifmgd->auth_data && !ifmgd->auth_data->done) {
  7215			err = -EBUSY;
  7216			goto err_free;
  7217		}
  7218	
  7219		if (ifmgd->assoc_data) {
  7220			err = -EBUSY;
  7221			goto err_free;
  7222		}
  7223	
  7224		if (ifmgd->auth_data) {
  7225			bool match;
  7226	
  7227			/* keep sta info, bssid if matching */
  7228			match = ether_addr_equal(ifmgd->auth_data->ap_addr,
  7229						 assoc_data->ap_addr) &&
  7230				ifmgd->auth_data->link_id == req->link_id;
  7231			ieee80211_destroy_auth_data(sdata, match);
  7232		}
  7233	
  7234		/* prepare assoc data */
  7235	
  7236		bss = (void *)cbss->priv;
  7237		assoc_data->wmm = bss->wmm_used &&
  7238				  (local->hw.queues >= IEEE80211_NUM_ACS);
  7239	
  7240		/*
  7241		 * IEEE802.11n does not allow TKIP/WEP as pairwise ciphers in HT mode.
  7242		 * We still associate in non-HT mode (11a/b/g) if any one of these
  7243		 * ciphers is configured as pairwise.
  7244		 * We can set this to true for non-11n hardware, that'll be checked
  7245		 * separately along with the peer capabilities.
  7246		 */
  7247		for (i = 0; i < req->crypto.n_ciphers_pairwise; i++) {
  7248			if (req->crypto.ciphers_pairwise[i] == WLAN_CIPHER_SUITE_WEP40 ||
  7249			    req->crypto.ciphers_pairwise[i] == WLAN_CIPHER_SUITE_TKIP ||
  7250			    req->crypto.ciphers_pairwise[i] == WLAN_CIPHER_SUITE_WEP104) {
  7251				conn_flags |= IEEE80211_CONN_DISABLE_HT;
  7252				conn_flags |= IEEE80211_CONN_DISABLE_VHT;
  7253				conn_flags |= IEEE80211_CONN_DISABLE_HE;
  7254				conn_flags |= IEEE80211_CONN_DISABLE_EHT;
  7255				netdev_info(sdata->dev,
  7256					    "disabling HT/VHT/HE due to WEP/TKIP use\n");
  7257			}
  7258		}
  7259	
  7260		/* also disable HT/VHT/HE/EHT if the AP doesn't use WMM */
  7261		if (!bss->wmm_used) {
  7262			conn_flags |= IEEE80211_CONN_DISABLE_HT;
  7263			conn_flags |= IEEE80211_CONN_DISABLE_VHT;
  7264			conn_flags |= IEEE80211_CONN_DISABLE_HE;
  7265			conn_flags |= IEEE80211_CONN_DISABLE_EHT;
  7266			netdev_info(sdata->dev,
  7267				    "disabling HT/VHT/HE as WMM/QoS is not supported by the AP\n");
  7268		}
  7269	
  7270		if (req->flags & ASSOC_REQ_DISABLE_HT) {
  7271			mlme_dbg(sdata, "HT disabled by flag, disabling HT/VHT/HE\n");
  7272			conn_flags |= IEEE80211_CONN_DISABLE_HT;
  7273			conn_flags |= IEEE80211_CONN_DISABLE_VHT;
  7274			conn_flags |= IEEE80211_CONN_DISABLE_HE;
  7275			conn_flags |= IEEE80211_CONN_DISABLE_EHT;
  7276		}
  7277	
  7278		if (req->flags & ASSOC_REQ_DISABLE_VHT) {
  7279			mlme_dbg(sdata, "VHT disabled by flag, disabling VHT\n");
  7280			conn_flags |= IEEE80211_CONN_DISABLE_VHT;
  7281		}
  7282	
  7283		if (req->flags & ASSOC_REQ_DISABLE_HE) {
  7284			mlme_dbg(sdata, "HE disabled by flag, disabling HE/EHT\n");
  7285			conn_flags |= IEEE80211_CONN_DISABLE_HE;
  7286			conn_flags |= IEEE80211_CONN_DISABLE_EHT;
  7287		}
  7288	
  7289		if (req->flags & ASSOC_REQ_DISABLE_EHT)
  7290			conn_flags |= IEEE80211_CONN_DISABLE_EHT;
  7291	
  7292		memcpy(&ifmgd->ht_capa, &req->ht_capa, sizeof(ifmgd->ht_capa));
  7293		memcpy(&ifmgd->ht_capa_mask, &req->ht_capa_mask,
  7294		       sizeof(ifmgd->ht_capa_mask));
  7295	
  7296		memcpy(&ifmgd->vht_capa, &req->vht_capa, sizeof(ifmgd->vht_capa));
  7297		memcpy(&ifmgd->vht_capa_mask, &req->vht_capa_mask,
  7298		       sizeof(ifmgd->vht_capa_mask));
  7299	
  7300		memcpy(&ifmgd->s1g_capa, &req->s1g_capa, sizeof(ifmgd->s1g_capa));
  7301		memcpy(&ifmgd->s1g_capa_mask, &req->s1g_capa_mask,
  7302		       sizeof(ifmgd->s1g_capa_mask));
  7303	
  7304		if (req->ie && req->ie_len) {
  7305			memcpy(assoc_data->ie, req->ie, req->ie_len);
  7306			assoc_data->ie_len = req->ie_len;
  7307			assoc_data->ie_pos = assoc_data->ie + assoc_data->ie_len;
  7308		} else {
  7309			assoc_data->ie_pos = assoc_data->ie;
  7310		}
  7311	
  7312		if (req->fils_kek) {
  7313			/* should already be checked in cfg80211 - so warn */
  7314			if (WARN_ON(req->fils_kek_len > FILS_MAX_KEK_LEN)) {
  7315				err = -EINVAL;
  7316				goto err_free;
  7317			}
  7318			memcpy(assoc_data->fils_kek, req->fils_kek,
  7319			       req->fils_kek_len);
  7320			assoc_data->fils_kek_len = req->fils_kek_len;
  7321		}
  7322	
  7323		if (req->fils_nonces)
  7324			memcpy(assoc_data->fils_nonces, req->fils_nonces,
  7325			       2 * FILS_NONCE_LEN);
  7326	
  7327		/* default timeout */
  7328		assoc_data->timeout = jiffies;
  7329		assoc_data->timeout_started = true;
  7330	
  7331		assoc_data->assoc_link_id = assoc_link_id;
  7332	
  7333		if (req->ap_mld_addr) {
  7334			for (i = 0; i < ARRAY_SIZE(assoc_data->link); i++) {
  7335				assoc_data->link[i].conn_flags = conn_flags;
  7336				assoc_data->link[i].bss = req->links[i].bss;
> 7337				assoc_data->link[i].disabled = req->links[i].disabled;
  7338			}
  7339	
  7340			/* if there was no authentication, set up the link */
  7341			err = ieee80211_vif_set_links(sdata, BIT(assoc_link_id), 0);
  7342			if (err)
  7343				goto err_clear;
  7344		} else {
  7345			assoc_data->link[0].conn_flags = conn_flags;
  7346			assoc_data->link[0].bss = cbss;
  7347		}
  7348	
  7349		link = sdata_dereference(sdata->link[assoc_link_id], sdata);
  7350		if (WARN_ON(!link)) {
  7351			err = -EINVAL;
  7352			goto err_clear;
  7353		}
  7354	
  7355		/* keep old conn_flags from ieee80211_prep_channel() from auth */
  7356		conn_flags |= link->u.mgd.conn_flags;
  7357		conn_flags |= ieee80211_setup_assoc_link(sdata, assoc_data, req,
  7358							 conn_flags, assoc_link_id);
  7359		override = link->u.mgd.conn_flags != conn_flags;
  7360		link->u.mgd.conn_flags |= conn_flags;
  7361	
  7362		if (WARN((sdata->vif.driver_flags & IEEE80211_VIF_SUPPORTS_UAPSD) &&
  7363			 ieee80211_hw_check(&local->hw, PS_NULLFUNC_STACK),
  7364		     "U-APSD not supported with HW_PS_NULLFUNC_STACK\n"))
  7365			sdata->vif.driver_flags &= ~IEEE80211_VIF_SUPPORTS_UAPSD;
  7366	
  7367		if (bss->wmm_used && bss->uapsd_supported &&
  7368		    (sdata->vif.driver_flags & IEEE80211_VIF_SUPPORTS_UAPSD)) {
  7369			assoc_data->uapsd = true;
  7370			ifmgd->flags |= IEEE80211_STA_UAPSD_ENABLED;
  7371		} else {
  7372			assoc_data->uapsd = false;
  7373			ifmgd->flags &= ~IEEE80211_STA_UAPSD_ENABLED;
  7374		}
  7375	
  7376		if (req->prev_bssid)
  7377			memcpy(assoc_data->prev_ap_addr, req->prev_bssid, ETH_ALEN);
  7378	
  7379		if (req->use_mfp) {
  7380			ifmgd->mfp = IEEE80211_MFP_REQUIRED;
  7381			ifmgd->flags |= IEEE80211_STA_MFP_ENABLED;
  7382		} else {
  7383			ifmgd->mfp = IEEE80211_MFP_DISABLED;
  7384			ifmgd->flags &= ~IEEE80211_STA_MFP_ENABLED;
  7385		}
  7386	
  7387		if (req->flags & ASSOC_REQ_USE_RRM)
  7388			ifmgd->flags |= IEEE80211_STA_ENABLE_RRM;
  7389		else
  7390			ifmgd->flags &= ~IEEE80211_STA_ENABLE_RRM;
  7391	
  7392		if (req->crypto.control_port)
  7393			ifmgd->flags |= IEEE80211_STA_CONTROL_PORT;
  7394		else
  7395			ifmgd->flags &= ~IEEE80211_STA_CONTROL_PORT;
  7396	
  7397		sdata->control_port_protocol = req->crypto.control_port_ethertype;
  7398		sdata->control_port_no_encrypt = req->crypto.control_port_no_encrypt;
  7399		sdata->control_port_over_nl80211 =
  7400						req->crypto.control_port_over_nl80211;
  7401		sdata->control_port_no_preauth = req->crypto.control_port_no_preauth;
  7402	
  7403		/* kick off associate process */
  7404		ifmgd->assoc_data = assoc_data;
  7405	
  7406		for (i = 0; i < ARRAY_SIZE(assoc_data->link); i++) {
  7407			if (!assoc_data->link[i].bss)
  7408				continue;
  7409			if (i == assoc_data->assoc_link_id)
  7410				continue;
  7411			/* only calculate the flags, hence link == NULL */
  7412			err = ieee80211_prep_channel(sdata, NULL, assoc_data->link[i].bss,
  7413						     &assoc_data->link[i].conn_flags);
  7414			if (err)
  7415				goto err_clear;
  7416		}
  7417	
  7418		/* needed for transmitting the assoc frames properly */
  7419		memcpy(sdata->vif.cfg.ap_addr, assoc_data->ap_addr, ETH_ALEN);
  7420	
  7421		err = ieee80211_prep_connection(sdata, cbss, req->link_id,
  7422						req->ap_mld_addr, true, override);
  7423		if (err)
  7424			goto err_clear;
  7425	
  7426		assoc_data->link[assoc_data->assoc_link_id].conn_flags =
  7427			link->u.mgd.conn_flags;
  7428	
  7429		if (ieee80211_hw_check(&sdata->local->hw, NEED_DTIM_BEFORE_ASSOC)) {
  7430			const struct cfg80211_bss_ies *beacon_ies;
  7431	
  7432			rcu_read_lock();
  7433			beacon_ies = rcu_dereference(req->bss->beacon_ies);
  7434	
  7435			if (beacon_ies) {
  7436				/*
  7437				 * Wait up to one beacon interval ...
  7438				 * should this be more if we miss one?
  7439				 */
  7440				sdata_info(sdata, "waiting for beacon from %pM\n",
  7441					   link->u.mgd.bssid);
  7442				assoc_data->timeout = TU_TO_EXP_TIME(req->bss->beacon_interval);
  7443				assoc_data->timeout_started = true;
  7444				assoc_data->need_beacon = true;
  7445			}
  7446			rcu_read_unlock();
  7447		}
  7448	
  7449		run_again(sdata, assoc_data->timeout);
  7450	
  7451		return 0;
  7452	 err_clear:
  7453		eth_zero_addr(sdata->deflink.u.mgd.bssid);
  7454		ieee80211_link_info_change_notify(sdata, &sdata->deflink,
  7455						  BSS_CHANGED_BSSID);
  7456		ifmgd->assoc_data = NULL;
  7457	 err_free:
  7458		kfree(assoc_data);
  7459		return err;
  7460	}
  7461	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
