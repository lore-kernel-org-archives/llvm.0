Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E878D37CAD;
	Tue, 26 Sep 2023 17:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695749581; x=1727285581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=enlD6+NXY+JhZrL95gwtUyll+2Ae4+mr8BOtN2dwET4=;
  b=OHX0HQUq9Lufw3zKBko/K9kRSb1vEEhHafIHe1daGZ3d0+pcjV8+FC4E
   kSoiktC7rbaJX4ogdU2g14OG+yKp4AVaYQxCDCaU0d+ttJVHMtWsuvBoq
   WHbqbUJYR7m3mzyu9hRtkngg6BmFvHdsyO3swdXbV7/KFtt3TFFZz3c0T
   PA76QMtkxkdY6oteJwGWLULMyb6Z0zBsPbqh0WlfP1dehK/evII7BbU61
   3Hum6fsQIgCt+xDNdG0kddHi6KORDLj830bof3sZitihzuqAasWrpf/iY
   dywXBveJi7xvhRojZ/LvNic/R51QXyicyCVR5xNVRU8LzO9zkIjPb+1AT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="366687369"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="366687369"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:32:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864478213"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="864478213"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2023 10:32:54 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlBvY-0003BO-08;
	Tue, 26 Sep 2023 17:32:52 +0000
Date: Wed, 27 Sep 2023 01:32:14 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/3] wifi: mac80211: remove RX_DROP_UNUSABLE
Message-ID: <202309270112.pVe4Qml2-lkp@intel.com>
References: <20230925172508.bc62dfb8a129.I9d64271b6d375aa87c8cac82145823374800b246@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925172508.bc62dfb8a129.I9d64271b6d375aa87c8cac82145823374800b246@changeid>

Hi Johannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v6.6-rc3 next-20230926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Berg/wifi-mac80211-split-ieee80211_drop_unencrypted_mgmt-return-value/20230925-232650
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20230925172508.bc62dfb8a129.I9d64271b6d375aa87c8cac82145823374800b246%40changeid
patch subject: [PATCH 1/3] wifi: mac80211: remove RX_DROP_UNUSABLE
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230927/202309270112.pVe4Qml2-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270112.pVe4Qml2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270112.pVe4Qml2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/mac80211/rx.c:2115:52: error: use of undeclared identifier 'RX_DROP_UNUSABLE'; did you mean '___RX_DROP_UNUSABLE'?
           if (unlikely(ieee80211_is_beacon(fc) && (result & RX_DROP_UNUSABLE) &&
                                                             ^~~~~~~~~~~~~~~~
                                                             ___RX_DROP_UNUSABLE
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/mac80211/drop.h:71:2: note: '___RX_DROP_UNUSABLE' declared here
           ___RX_DROP_UNUSABLE = SKB_DROP_REASON_SUBSYS_MAC80211_UNUSABLE <<
           ^
   1 error generated.


vim +2115 net/mac80211/rx.c

af2d14b01c32d7 Jouni Malinen    2020-02-22  1878  
86c228a7627f3f Johan Almbladh   2013-08-14  1879  static ieee80211_rx_result debug_noinline
86c228a7627f3f Johan Almbladh   2013-08-14  1880  ieee80211_rx_h_decrypt(struct ieee80211_rx_data *rx)
86c228a7627f3f Johan Almbladh   2013-08-14  1881  {
86c228a7627f3f Johan Almbladh   2013-08-14  1882  	struct sk_buff *skb = rx->skb;
86c228a7627f3f Johan Almbladh   2013-08-14  1883  	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
86c228a7627f3f Johan Almbladh   2013-08-14  1884  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
86c228a7627f3f Johan Almbladh   2013-08-14  1885  	int keyidx;
b39c205d1ce048 Johannes Berg    2023-09-25  1886  	ieee80211_rx_result result = RX_DROP_U_DECRYPT_FAIL;
86c228a7627f3f Johan Almbladh   2013-08-14  1887  	struct ieee80211_key *sta_ptk = NULL;
96fc6efb9ad9d0 Alexander Wetzel 2019-03-19  1888  	struct ieee80211_key *ptk_idx = NULL;
86c228a7627f3f Johan Almbladh   2013-08-14  1889  	int mmie_keyidx = -1;
86c228a7627f3f Johan Almbladh   2013-08-14  1890  	__le16 fc;
86c228a7627f3f Johan Almbladh   2013-08-14  1891  
09a740ce352e1a Thomas Pedersen  2020-09-21  1892  	if (ieee80211_is_ext(hdr->frame_control))
09a740ce352e1a Thomas Pedersen  2020-09-21  1893  		return RX_CONTINUE;
09a740ce352e1a Thomas Pedersen  2020-09-21  1894  
86c228a7627f3f Johan Almbladh   2013-08-14  1895  	/*
86c228a7627f3f Johan Almbladh   2013-08-14  1896  	 * Key selection 101
86c228a7627f3f Johan Almbladh   2013-08-14  1897  	 *
af2d14b01c32d7 Jouni Malinen    2020-02-22  1898  	 * There are five types of keys:
86c228a7627f3f Johan Almbladh   2013-08-14  1899  	 *  - GTK (group keys)
86c228a7627f3f Johan Almbladh   2013-08-14  1900  	 *  - IGTK (group keys for management frames)
af2d14b01c32d7 Jouni Malinen    2020-02-22  1901  	 *  - BIGTK (group keys for Beacon frames)
86c228a7627f3f Johan Almbladh   2013-08-14  1902  	 *  - PTK (pairwise keys)
86c228a7627f3f Johan Almbladh   2013-08-14  1903  	 *  - STK (station-to-station pairwise keys)
86c228a7627f3f Johan Almbladh   2013-08-14  1904  	 *
86c228a7627f3f Johan Almbladh   2013-08-14  1905  	 * When selecting a key, we have to distinguish between multicast
86c228a7627f3f Johan Almbladh   2013-08-14  1906  	 * (including broadcast) and unicast frames, the latter can only
af2d14b01c32d7 Jouni Malinen    2020-02-22  1907  	 * use PTKs and STKs while the former always use GTKs, IGTKs, and
af2d14b01c32d7 Jouni Malinen    2020-02-22  1908  	 * BIGTKs. Unless, of course, actual WEP keys ("pre-RSNA") are used,
af2d14b01c32d7 Jouni Malinen    2020-02-22  1909  	 * then unicast frames can also use key indices like GTKs. Hence, if we
86c228a7627f3f Johan Almbladh   2013-08-14  1910  	 * don't have a PTK/STK we check the key index for a WEP key.
86c228a7627f3f Johan Almbladh   2013-08-14  1911  	 *
86c228a7627f3f Johan Almbladh   2013-08-14  1912  	 * Note that in a regular BSS, multicast frames are sent by the
86c228a7627f3f Johan Almbladh   2013-08-14  1913  	 * AP only, associated stations unicast the frame to the AP first
86c228a7627f3f Johan Almbladh   2013-08-14  1914  	 * which then multicasts it on their behalf.
86c228a7627f3f Johan Almbladh   2013-08-14  1915  	 *
86c228a7627f3f Johan Almbladh   2013-08-14  1916  	 * There is also a slight problem in IBSS mode: GTKs are negotiated
86c228a7627f3f Johan Almbladh   2013-08-14  1917  	 * with each station, that is something we don't currently handle.
86c228a7627f3f Johan Almbladh   2013-08-14  1918  	 * The spec seems to expect that one negotiates the same key with
86c228a7627f3f Johan Almbladh   2013-08-14  1919  	 * every station but there's no such requirement; VLANs could be
86c228a7627f3f Johan Almbladh   2013-08-14  1920  	 * possible.
86c228a7627f3f Johan Almbladh   2013-08-14  1921  	 */
86c228a7627f3f Johan Almbladh   2013-08-14  1922  
86c228a7627f3f Johan Almbladh   2013-08-14  1923  	/* start without a key */
86c228a7627f3f Johan Almbladh   2013-08-14  1924  	rx->key = NULL;
2475b1cc0d5283 Max Stepanov     2013-03-24  1925  	fc = hdr->frame_control;
86c228a7627f3f Johan Almbladh   2013-08-14  1926  
2475b1cc0d5283 Max Stepanov     2013-03-24  1927  	if (rx->sta) {
2475b1cc0d5283 Max Stepanov     2013-03-24  1928  		int keyid = rx->sta->ptk_idx;
96fc6efb9ad9d0 Alexander Wetzel 2019-03-19  1929  		sta_ptk = rcu_dereference(rx->sta->ptk[keyid]);
86c228a7627f3f Johan Almbladh   2013-08-14  1930  
77dfc2bc0bb4b8 Xing Song        2021-11-01  1931  		if (ieee80211_has_protected(fc) &&
77dfc2bc0bb4b8 Xing Song        2021-11-01  1932  		    !(status->flag & RX_FLAG_IV_STRIPPED)) {
23a5f0af6ff431 Johannes Berg    2022-02-09  1933  			keyid = ieee80211_get_keyid(rx->skb);
96fc6efb9ad9d0 Alexander Wetzel 2019-03-19  1934  
2475b1cc0d5283 Max Stepanov     2013-03-24  1935  			if (unlikely(keyid < 0))
b39c205d1ce048 Johannes Berg    2023-09-25  1936  				return RX_DROP_U_NO_KEY_ID;
96fc6efb9ad9d0 Alexander Wetzel 2019-03-19  1937  
96fc6efb9ad9d0 Alexander Wetzel 2019-03-19  1938  			ptk_idx = rcu_dereference(rx->sta->ptk[keyid]);
2475b1cc0d5283 Max Stepanov     2013-03-24  1939  		}
2475b1cc0d5283 Max Stepanov     2013-03-24  1940  	}
86c228a7627f3f Johan Almbladh   2013-08-14  1941  
86c228a7627f3f Johan Almbladh   2013-08-14  1942  	if (!ieee80211_has_protected(fc))
86c228a7627f3f Johan Almbladh   2013-08-14  1943  		mmie_keyidx = ieee80211_get_mmie_keyidx(rx->skb);
86c228a7627f3f Johan Almbladh   2013-08-14  1944  
86c228a7627f3f Johan Almbladh   2013-08-14  1945  	if (!is_multicast_ether_addr(hdr->addr1) && sta_ptk) {
96fc6efb9ad9d0 Alexander Wetzel 2019-03-19  1946  		rx->key = ptk_idx ? ptk_idx : sta_ptk;
86c228a7627f3f Johan Almbladh   2013-08-14  1947  		if ((status->flag & RX_FLAG_DECRYPTED) &&
86c228a7627f3f Johan Almbladh   2013-08-14  1948  		    (status->flag & RX_FLAG_IV_STRIPPED))
86c228a7627f3f Johan Almbladh   2013-08-14  1949  			return RX_CONTINUE;
86c228a7627f3f Johan Almbladh   2013-08-14  1950  		/* Skip decryption if the frame is not protected. */
86c228a7627f3f Johan Almbladh   2013-08-14  1951  		if (!ieee80211_has_protected(fc))
86c228a7627f3f Johan Almbladh   2013-08-14  1952  			return RX_CONTINUE;
af2d14b01c32d7 Jouni Malinen    2020-02-22  1953  	} else if (mmie_keyidx >= 0 && ieee80211_is_beacon(fc)) {
af2d14b01c32d7 Jouni Malinen    2020-02-22  1954  		/* Broadcast/multicast robust management frame / BIP */
af2d14b01c32d7 Jouni Malinen    2020-02-22  1955  		if ((status->flag & RX_FLAG_DECRYPTED) &&
af2d14b01c32d7 Jouni Malinen    2020-02-22  1956  		    (status->flag & RX_FLAG_IV_STRIPPED))
af2d14b01c32d7 Jouni Malinen    2020-02-22  1957  			return RX_CONTINUE;
af2d14b01c32d7 Jouni Malinen    2020-02-22  1958  
af2d14b01c32d7 Jouni Malinen    2020-02-22  1959  		if (mmie_keyidx < NUM_DEFAULT_KEYS + NUM_DEFAULT_MGMT_KEYS ||
af2d14b01c32d7 Jouni Malinen    2020-02-22  1960  		    mmie_keyidx >= NUM_DEFAULT_KEYS + NUM_DEFAULT_MGMT_KEYS +
9eaf183af741e3 Jouni Malinen    2020-04-01  1961  				   NUM_DEFAULT_BEACON_KEYS) {
b2d03cabe2b2e1 Johannes Berg    2022-10-05  1962  			if (rx->sdata->dev)
9eaf183af741e3 Jouni Malinen    2020-04-01  1963  				cfg80211_rx_unprot_mlme_mgmt(rx->sdata->dev,
9eaf183af741e3 Jouni Malinen    2020-04-01  1964  							     skb->data,
9eaf183af741e3 Jouni Malinen    2020-04-01  1965  							     skb->len);
baa951a1c17718 Johannes Berg    2023-04-19  1966  			return RX_DROP_M_BAD_BCN_KEYIDX;
9eaf183af741e3 Jouni Malinen    2020-04-01  1967  		}
af2d14b01c32d7 Jouni Malinen    2020-02-22  1968  
af2d14b01c32d7 Jouni Malinen    2020-02-22  1969  		rx->key = ieee80211_rx_get_bigtk(rx, mmie_keyidx);
af2d14b01c32d7 Jouni Malinen    2020-02-22  1970  		if (!rx->key)
af2d14b01c32d7 Jouni Malinen    2020-02-22  1971  			return RX_CONTINUE; /* Beacon protection not in use */
86c228a7627f3f Johan Almbladh   2013-08-14  1972  	} else if (mmie_keyidx >= 0) {
86c228a7627f3f Johan Almbladh   2013-08-14  1973  		/* Broadcast/multicast robust management frame / BIP */
86c228a7627f3f Johan Almbladh   2013-08-14  1974  		if ((status->flag & RX_FLAG_DECRYPTED) &&
86c228a7627f3f Johan Almbladh   2013-08-14  1975  		    (status->flag & RX_FLAG_IV_STRIPPED))
86c228a7627f3f Johan Almbladh   2013-08-14  1976  			return RX_CONTINUE;
86c228a7627f3f Johan Almbladh   2013-08-14  1977  
86c228a7627f3f Johan Almbladh   2013-08-14  1978  		if (mmie_keyidx < NUM_DEFAULT_KEYS ||
86c228a7627f3f Johan Almbladh   2013-08-14  1979  		    mmie_keyidx >= NUM_DEFAULT_KEYS + NUM_DEFAULT_MGMT_KEYS)
baa951a1c17718 Johannes Berg    2023-04-19  1980  			return RX_DROP_M_BAD_MGMT_KEYIDX; /* unexpected BIP keyidx */
ccdde7c74ffd7e Johannes Berg    2022-08-17  1981  		if (rx->link_sta) {
46f6b06050b736 Masashi Honma    2016-06-22  1982  			if (ieee80211_is_group_privacy_action(skb) &&
46f6b06050b736 Masashi Honma    2016-06-22  1983  			    test_sta_flag(rx->sta, WLAN_STA_MFP))
46f6b06050b736 Masashi Honma    2016-06-22  1984  				return RX_DROP_MONITOR;
46f6b06050b736 Masashi Honma    2016-06-22  1985  
ccdde7c74ffd7e Johannes Berg    2022-08-17  1986  			rx->key = rcu_dereference(rx->link_sta->gtk[mmie_keyidx]);
46f6b06050b736 Masashi Honma    2016-06-22  1987  		}
86c228a7627f3f Johan Almbladh   2013-08-14  1988  		if (!rx->key)
ccdde7c74ffd7e Johannes Berg    2022-08-17  1989  			rx->key = rcu_dereference(rx->link->gtk[mmie_keyidx]);
86c228a7627f3f Johan Almbladh   2013-08-14  1990  	} else if (!ieee80211_has_protected(fc)) {
86c228a7627f3f Johan Almbladh   2013-08-14  1991  		/*
86c228a7627f3f Johan Almbladh   2013-08-14  1992  		 * The frame was not protected, so skip decryption. However, we
86c228a7627f3f Johan Almbladh   2013-08-14  1993  		 * need to set rx->key if there is a key that could have been
86c228a7627f3f Johan Almbladh   2013-08-14  1994  		 * used so that the frame may be dropped if encryption would
86c228a7627f3f Johan Almbladh   2013-08-14  1995  		 * have been expected.
86c228a7627f3f Johan Almbladh   2013-08-14  1996  		 */
86c228a7627f3f Johan Almbladh   2013-08-14  1997  		struct ieee80211_key *key = NULL;
86c228a7627f3f Johan Almbladh   2013-08-14  1998  		int i;
86c228a7627f3f Johan Almbladh   2013-08-14  1999  
af2d14b01c32d7 Jouni Malinen    2020-02-22  2000  		if (ieee80211_is_beacon(fc)) {
af2d14b01c32d7 Jouni Malinen    2020-02-22  2001  			key = ieee80211_rx_get_bigtk(rx, -1);
af2d14b01c32d7 Jouni Malinen    2020-02-22  2002  		} else if (ieee80211_is_mgmt(fc) &&
af2d14b01c32d7 Jouni Malinen    2020-02-22  2003  			   is_multicast_ether_addr(hdr->addr1)) {
ccdde7c74ffd7e Johannes Berg    2022-08-17  2004  			key = rcu_dereference(rx->link->default_mgmt_key);
af2d14b01c32d7 Jouni Malinen    2020-02-22  2005  		} else {
ccdde7c74ffd7e Johannes Berg    2022-08-17  2006  			if (rx->link_sta) {
86c228a7627f3f Johan Almbladh   2013-08-14  2007  				for (i = 0; i < NUM_DEFAULT_KEYS; i++) {
ccdde7c74ffd7e Johannes Berg    2022-08-17  2008  					key = rcu_dereference(rx->link_sta->gtk[i]);
86c228a7627f3f Johan Almbladh   2013-08-14  2009  					if (key)
86c228a7627f3f Johan Almbladh   2013-08-14  2010  						break;
86c228a7627f3f Johan Almbladh   2013-08-14  2011  				}
86c228a7627f3f Johan Almbladh   2013-08-14  2012  			}
86c228a7627f3f Johan Almbladh   2013-08-14  2013  			if (!key) {
86c228a7627f3f Johan Almbladh   2013-08-14  2014  				for (i = 0; i < NUM_DEFAULT_KEYS; i++) {
ccdde7c74ffd7e Johannes Berg    2022-08-17  2015  					key = rcu_dereference(rx->link->gtk[i]);
86c228a7627f3f Johan Almbladh   2013-08-14  2016  					if (key)
86c228a7627f3f Johan Almbladh   2013-08-14  2017  						break;
86c228a7627f3f Johan Almbladh   2013-08-14  2018  				}
86c228a7627f3f Johan Almbladh   2013-08-14  2019  			}
af2d14b01c32d7 Jouni Malinen    2020-02-22  2020  		}
86c228a7627f3f Johan Almbladh   2013-08-14  2021  		if (key)
86c228a7627f3f Johan Almbladh   2013-08-14  2022  			rx->key = key;
86c228a7627f3f Johan Almbladh   2013-08-14  2023  		return RX_CONTINUE;
86c228a7627f3f Johan Almbladh   2013-08-14  2024  	} else {
86c228a7627f3f Johan Almbladh   2013-08-14  2025  		/*
86c228a7627f3f Johan Almbladh   2013-08-14  2026  		 * The device doesn't give us the IV so we won't be
86c228a7627f3f Johan Almbladh   2013-08-14  2027  		 * able to look up the key. That's ok though, we
86c228a7627f3f Johan Almbladh   2013-08-14  2028  		 * don't need to decrypt the frame, we just won't
86c228a7627f3f Johan Almbladh   2013-08-14  2029  		 * be able to keep statistics accurate.
86c228a7627f3f Johan Almbladh   2013-08-14  2030  		 * Except for key threshold notifications, should
86c228a7627f3f Johan Almbladh   2013-08-14  2031  		 * we somehow allow the driver to tell us which key
86c228a7627f3f Johan Almbladh   2013-08-14  2032  		 * the hardware used if this flag is set?
86c228a7627f3f Johan Almbladh   2013-08-14  2033  		 */
86c228a7627f3f Johan Almbladh   2013-08-14  2034  		if ((status->flag & RX_FLAG_DECRYPTED) &&
86c228a7627f3f Johan Almbladh   2013-08-14  2035  		    (status->flag & RX_FLAG_IV_STRIPPED))
86c228a7627f3f Johan Almbladh   2013-08-14  2036  			return RX_CONTINUE;
86c228a7627f3f Johan Almbladh   2013-08-14  2037  
23a5f0af6ff431 Johannes Berg    2022-02-09  2038  		keyidx = ieee80211_get_keyid(rx->skb);
2475b1cc0d5283 Max Stepanov     2013-03-24  2039  
2475b1cc0d5283 Max Stepanov     2013-03-24  2040  		if (unlikely(keyidx < 0))
b39c205d1ce048 Johannes Berg    2023-09-25  2041  			return RX_DROP_U_NO_KEY_ID;
86c228a7627f3f Johan Almbladh   2013-08-14  2042  
86c228a7627f3f Johan Almbladh   2013-08-14  2043  		/* check per-station GTK first, if multicast packet */
ccdde7c74ffd7e Johannes Berg    2022-08-17  2044  		if (is_multicast_ether_addr(hdr->addr1) && rx->link_sta)
ccdde7c74ffd7e Johannes Berg    2022-08-17  2045  			rx->key = rcu_dereference(rx->link_sta->gtk[keyidx]);
86c228a7627f3f Johan Almbladh   2013-08-14  2046  
86c228a7627f3f Johan Almbladh   2013-08-14  2047  		/* if not found, try default key */
86c228a7627f3f Johan Almbladh   2013-08-14  2048  		if (!rx->key) {
bfd8403adddd09 Johannes Berg    2022-05-16  2049  			if (is_multicast_ether_addr(hdr->addr1))
ccdde7c74ffd7e Johannes Berg    2022-08-17  2050  				rx->key = rcu_dereference(rx->link->gtk[keyidx]);
bfd8403adddd09 Johannes Berg    2022-05-16  2051  			if (!rx->key)
86c228a7627f3f Johan Almbladh   2013-08-14  2052  				rx->key = rcu_dereference(rx->sdata->keys[keyidx]);
86c228a7627f3f Johan Almbladh   2013-08-14  2053  
86c228a7627f3f Johan Almbladh   2013-08-14  2054  			/*
86c228a7627f3f Johan Almbladh   2013-08-14  2055  			 * RSNA-protected unicast frames should always be
86c228a7627f3f Johan Almbladh   2013-08-14  2056  			 * sent with pairwise or station-to-station keys,
86c228a7627f3f Johan Almbladh   2013-08-14  2057  			 * but for WEP we allow using a key index as well.
86c228a7627f3f Johan Almbladh   2013-08-14  2058  			 */
86c228a7627f3f Johan Almbladh   2013-08-14  2059  			if (rx->key &&
86c228a7627f3f Johan Almbladh   2013-08-14  2060  			    rx->key->conf.cipher != WLAN_CIPHER_SUITE_WEP40 &&
86c228a7627f3f Johan Almbladh   2013-08-14  2061  			    rx->key->conf.cipher != WLAN_CIPHER_SUITE_WEP104 &&
86c228a7627f3f Johan Almbladh   2013-08-14  2062  			    !is_multicast_ether_addr(hdr->addr1))
86c228a7627f3f Johan Almbladh   2013-08-14  2063  				rx->key = NULL;
86c228a7627f3f Johan Almbladh   2013-08-14  2064  		}
86c228a7627f3f Johan Almbladh   2013-08-14  2065  	}
86c228a7627f3f Johan Almbladh   2013-08-14  2066  
86c228a7627f3f Johan Almbladh   2013-08-14  2067  	if (rx->key) {
86c228a7627f3f Johan Almbladh   2013-08-14  2068  		if (unlikely(rx->key->flags & KEY_FLAG_TAINTED))
86c228a7627f3f Johan Almbladh   2013-08-14  2069  			return RX_DROP_MONITOR;
86c228a7627f3f Johan Almbladh   2013-08-14  2070  
86c228a7627f3f Johan Almbladh   2013-08-14  2071  		/* TODO: add threshold stuff again */
86c228a7627f3f Johan Almbladh   2013-08-14  2072  	} else {
86c228a7627f3f Johan Almbladh   2013-08-14  2073  		return RX_DROP_MONITOR;
86c228a7627f3f Johan Almbladh   2013-08-14  2074  	}
86c228a7627f3f Johan Almbladh   2013-08-14  2075  
86c228a7627f3f Johan Almbladh   2013-08-14  2076  	switch (rx->key->conf.cipher) {
86c228a7627f3f Johan Almbladh   2013-08-14  2077  	case WLAN_CIPHER_SUITE_WEP40:
86c228a7627f3f Johan Almbladh   2013-08-14  2078  	case WLAN_CIPHER_SUITE_WEP104:
86c228a7627f3f Johan Almbladh   2013-08-14  2079  		result = ieee80211_crypto_wep_decrypt(rx);
86c228a7627f3f Johan Almbladh   2013-08-14  2080  		break;
86c228a7627f3f Johan Almbladh   2013-08-14  2081  	case WLAN_CIPHER_SUITE_TKIP:
86c228a7627f3f Johan Almbladh   2013-08-14  2082  		result = ieee80211_crypto_tkip_decrypt(rx);
86c228a7627f3f Johan Almbladh   2013-08-14  2083  		break;
86c228a7627f3f Johan Almbladh   2013-08-14  2084  	case WLAN_CIPHER_SUITE_CCMP:
2b2ba0db1c820d Jouni Malinen    2015-01-24  2085  		result = ieee80211_crypto_ccmp_decrypt(
2b2ba0db1c820d Jouni Malinen    2015-01-24  2086  			rx, IEEE80211_CCMP_MIC_LEN);
2b2ba0db1c820d Jouni Malinen    2015-01-24  2087  		break;
2b2ba0db1c820d Jouni Malinen    2015-01-24  2088  	case WLAN_CIPHER_SUITE_CCMP_256:
2b2ba0db1c820d Jouni Malinen    2015-01-24  2089  		result = ieee80211_crypto_ccmp_decrypt(
2b2ba0db1c820d Jouni Malinen    2015-01-24  2090  			rx, IEEE80211_CCMP_256_MIC_LEN);
86c228a7627f3f Johan Almbladh   2013-08-14  2091  		break;
86c228a7627f3f Johan Almbladh   2013-08-14  2092  	case WLAN_CIPHER_SUITE_AES_CMAC:
86c228a7627f3f Johan Almbladh   2013-08-14  2093  		result = ieee80211_crypto_aes_cmac_decrypt(rx);
86c228a7627f3f Johan Almbladh   2013-08-14  2094  		break;
56c52da2d554f0 Jouni Malinen    2015-01-24  2095  	case WLAN_CIPHER_SUITE_BIP_CMAC_256:
56c52da2d554f0 Jouni Malinen    2015-01-24  2096  		result = ieee80211_crypto_aes_cmac_256_decrypt(rx);
56c52da2d554f0 Jouni Malinen    2015-01-24  2097  		break;
8ade538bf39b1e Jouni Malinen    2015-01-24  2098  	case WLAN_CIPHER_SUITE_BIP_GMAC_128:
8ade538bf39b1e Jouni Malinen    2015-01-24  2099  	case WLAN_CIPHER_SUITE_BIP_GMAC_256:
8ade538bf39b1e Jouni Malinen    2015-01-24  2100  		result = ieee80211_crypto_aes_gmac_decrypt(rx);
8ade538bf39b1e Jouni Malinen    2015-01-24  2101  		break;
00b9cfa3ff3840 Jouni Malinen    2015-01-24  2102  	case WLAN_CIPHER_SUITE_GCMP:
00b9cfa3ff3840 Jouni Malinen    2015-01-24  2103  	case WLAN_CIPHER_SUITE_GCMP_256:
00b9cfa3ff3840 Jouni Malinen    2015-01-24  2104  		result = ieee80211_crypto_gcmp_decrypt(rx);
00b9cfa3ff3840 Jouni Malinen    2015-01-24  2105  		break;
86c228a7627f3f Johan Almbladh   2013-08-14  2106  	default:
b39c205d1ce048 Johannes Berg    2023-09-25  2107  		result = RX_DROP_U_BAD_CIPHER;
86c228a7627f3f Johan Almbladh   2013-08-14  2108  	}
86c228a7627f3f Johan Almbladh   2013-08-14  2109  
86c228a7627f3f Johan Almbladh   2013-08-14  2110  	/* the hdr variable is invalid after the decrypt handlers */
86c228a7627f3f Johan Almbladh   2013-08-14  2111  
86c228a7627f3f Johan Almbladh   2013-08-14  2112  	/* either the frame has been decrypted or will be dropped */
86c228a7627f3f Johan Almbladh   2013-08-14  2113  	status->flag |= RX_FLAG_DECRYPTED;
86c228a7627f3f Johan Almbladh   2013-08-14  2114  
7f4e09700bdc13 Benjamin Berg    2023-06-21 @2115  	if (unlikely(ieee80211_is_beacon(fc) && (result & RX_DROP_UNUSABLE) &&
b2d03cabe2b2e1 Johannes Berg    2022-10-05  2116  		     rx->sdata->dev))
9eaf183af741e3 Jouni Malinen    2020-04-01  2117  		cfg80211_rx_unprot_mlme_mgmt(rx->sdata->dev,
9eaf183af741e3 Jouni Malinen    2020-04-01  2118  					     skb->data, skb->len);
9eaf183af741e3 Jouni Malinen    2020-04-01  2119  
86c228a7627f3f Johan Almbladh   2013-08-14  2120  	return result;
86c228a7627f3f Johan Almbladh   2013-08-14  2121  }
86c228a7627f3f Johan Almbladh   2013-08-14  2122  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
