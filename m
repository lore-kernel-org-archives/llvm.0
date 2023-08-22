Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C032B554;
	Tue, 22 Aug 2023 17:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692724322; x=1724260322;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YZbwHZX/ypzTB8fsQWN3pubAer1mrEKpVZZ+f9taffQ=;
  b=BwMRuFXowK5ihifU2BPVpaLR+SWYFaJzCkuBa+7CYYD0W8ULKS1RClqZ
   nbHFZhgaNJWN5DivmBHSmp7L44rTR/MLWfhUP0zc8x8ACgZetJp1Jjkqb
   rebtDdqDIWTeEHIY5k4cB0cPI40+SMwxb6aYKTAtj6O8u7wmbeNarwXFt
   BZLOEjWA/yFi9cP4vhx2WzgBZA63OzJ+9WAMTZ3gXY5z2f2+as2/e99m1
   psk+qICApuBW0QwSv6V0BHTKaJe6R7XSD7Rvl7KLYkHTH9DnW7tf7JbEY
   EO2fWTMAX59KIQual/7NRa6GjN1Czuv8q3nKPMI1ii/pZXieDieIuIG00
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="440310141"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="440310141"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 10:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765828574"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="765828574"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 22 Aug 2023 10:11:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYUuu-0000Me-20;
	Tue, 22 Aug 2023 17:11:44 +0000
Date: Wed, 23 Aug 2023 01:11:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: net/mac80211/he.c:158:33: warning: taking address of packed member
 'rx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in
 an unaligned pointer value
Message-ID: <202308230147.BOqgraxe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
net/mac80211/he.c: 158:33: warning: taking address of packed member
 'rx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in
 an unaligned pointer value [-Waddress-of-packed-member]
net/mac80211/he.c: 160:12: warning: taking address of packed member
 'tx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in
 an unaligned pointer value [-Waddress-of-packed-member]
net/mac80211/he.c: 169:34: warning: taking address of packed member
 'rx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in
 an unaligned pointer value [-Waddress-of-packed-member]
net/mac80211/he.c: 171:13: warning: taking address of packed member
 'tx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in
 an unaligned pointer value [-Waddress-of-packed-member]
net/mac80211/he.c: 186:34: warning: taking address of packed member
 'rx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result
 in an unaligned pointer value [-Waddress-of-packed-member]
net/mac80211/he.c: 188:13: warning: taking address of packed member
 'tx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result
 in an unaligned pointer value [-Waddress-of-packed-member]

TO: Wen Gong <wgong@codeaurora.org>
CC: Johannes Berg <johannes.berg@intel.com>

Hi Wen,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux-5.15.y
head:   fc9952e796d10f995ee74ab63b7f990fec0d8eca
commit: 7f7aa94bcaf03d0f18a6853d8f7dad6a4d25bbd6 mac80211: reduce peer HE MCS/NSS to own capabilities
date:   2 years, 7 months ago
config: mips-loongson2k_defconfig (https://download.01.org/0day-ci/archive/20230823/202308230147.BOqgraxe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230147.BOqgraxe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230147.BOqgraxe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/mac80211/he.c:9:
   In file included from net/mac80211/ieee80211_i.h:16:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/net/checksum.h:22:
   arch/mips/include/asm/checksum.h:161:9: error: unsupported inline asm: input with type 'unsigned long' matching output with type '__wsum' (aka 'unsigned int')
     161 |         : "=r" (sum)
         |                 ~~~
     162 |         : "0" ((__force unsigned long)daddr),
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/mac80211/he.c:9:
   In file included from net/mac80211/ieee80211_i.h:30:
   In file included from include/net/mac80211.h:22:
   In file included from include/net/codel.h:48:
   In file included from include/net/inet_ecn.h:9:
   In file included from include/net/inet_sock.h:22:
   In file included from include/net/sock.h:61:
   include/linux/poll.h:142:27: warning: division by zero is undefined [-Wdivision-by-zero]
     142 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:140:32: note: expanded from macro 'M'
     140 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:126:51: note: expanded from macro '__MAP'
     126 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:142:39: warning: division by zero is undefined [-Wdivision-by-zero]
     142 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:140:32: note: expanded from macro 'M'
     140 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:126:51: note: expanded from macro '__MAP'
     126 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
>> net/mac80211/he.c:158:33: warning: taking address of packed member 'rx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     158 |         ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:159:12: warning: taking address of packed member 'rx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     159 |                                       &he_cap->he_mcs_nss_supp.rx_mcs_80,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/he.c:160:12: warning: taking address of packed member 'tx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     160 |                                       &own_he_cap.he_mcs_nss_supp.tx_mcs_80,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:161:12: warning: taking address of packed member 'tx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     161 |                                       &he_cap->he_mcs_nss_supp.tx_mcs_80);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/he.c:169:34: warning: taking address of packed member 'rx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     169 |                 ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_160,
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:170:13: warning: taking address of packed member 'rx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     170 |                                               &he_cap->he_mcs_nss_supp.rx_mcs_160,
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/he.c:171:13: warning: taking address of packed member 'tx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     171 |                                               &own_he_cap.he_mcs_nss_supp.tx_mcs_160,
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:172:13: warning: taking address of packed member 'tx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     172 |                                               &he_cap->he_mcs_nss_supp.tx_mcs_160);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:174:29: warning: taking address of packed member 'rx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     174 |                 ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.rx_mcs_160);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:175:29: warning: taking address of packed member 'tx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     175 |                 ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.tx_mcs_160);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/he.c:186:34: warning: taking address of packed member 'rx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     186 |                 ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80p80,
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:187:13: warning: taking address of packed member 'rx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     187 |                                               &he_cap->he_mcs_nss_supp.rx_mcs_80p80,
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/he.c:188:13: warning: taking address of packed member 'tx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     188 |                                               &own_he_cap.he_mcs_nss_supp.tx_mcs_80p80,
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:189:13: warning: taking address of packed member 'tx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     189 |                                               &he_cap->he_mcs_nss_supp.tx_mcs_80p80);
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:191:29: warning: taking address of packed member 'rx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     191 |                 ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.rx_mcs_80p80);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:192:29: warning: taking address of packed member 'tx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
     192 |                 ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.tx_mcs_80p80);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   18 warnings and 1 error generated.


vim +158 net/mac80211/he.c

   105	
   106	void
   107	ieee80211_he_cap_ie_to_sta_he_cap(struct ieee80211_sub_if_data *sdata,
   108					  struct ieee80211_supported_band *sband,
   109					  const u8 *he_cap_ie, u8 he_cap_len,
   110					  const struct ieee80211_he_6ghz_capa *he_6ghz_capa,
   111					  struct sta_info *sta)
   112	{
   113		struct ieee80211_sta_he_cap *he_cap = &sta->sta.he_cap;
   114		struct ieee80211_sta_he_cap own_he_cap = sband->iftype_data->he_cap;
   115		struct ieee80211_he_cap_elem *he_cap_ie_elem = (void *)he_cap_ie;
   116		u8 he_ppe_size;
   117		u8 mcs_nss_size;
   118		u8 he_total_size;
   119		bool own_160, peer_160, own_80p80, peer_80p80;
   120	
   121		memset(he_cap, 0, sizeof(*he_cap));
   122	
   123		if (!he_cap_ie || !ieee80211_get_he_sta_cap(sband))
   124			return;
   125	
   126		/* Make sure size is OK */
   127		mcs_nss_size = ieee80211_he_mcs_nss_size(he_cap_ie_elem);
   128		he_ppe_size =
   129			ieee80211_he_ppe_size(he_cap_ie[sizeof(he_cap->he_cap_elem) +
   130							mcs_nss_size],
   131					      he_cap_ie_elem->phy_cap_info);
   132		he_total_size = sizeof(he_cap->he_cap_elem) + mcs_nss_size +
   133				he_ppe_size;
   134		if (he_cap_len < he_total_size)
   135			return;
   136	
   137		memcpy(&he_cap->he_cap_elem, he_cap_ie, sizeof(he_cap->he_cap_elem));
   138	
   139		/* HE Tx/Rx HE MCS NSS Support Field */
   140		memcpy(&he_cap->he_mcs_nss_supp,
   141		       &he_cap_ie[sizeof(he_cap->he_cap_elem)], mcs_nss_size);
   142	
   143		/* Check if there are (optional) PPE Thresholds */
   144		if (he_cap->he_cap_elem.phy_cap_info[6] &
   145		    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT)
   146			memcpy(he_cap->ppe_thres,
   147			       &he_cap_ie[sizeof(he_cap->he_cap_elem) + mcs_nss_size],
   148			       he_ppe_size);
   149	
   150		he_cap->has_he = true;
   151	
   152		sta->cur_max_bandwidth = ieee80211_sta_cap_rx_bw(sta);
   153		sta->sta.bandwidth = ieee80211_sta_cur_vht_bw(sta);
   154	
   155		if (sband->band == NL80211_BAND_6GHZ && he_6ghz_capa)
   156			ieee80211_update_from_he_6ghz_capa(he_6ghz_capa, sta);
   157	
 > 158		ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80,
 > 159					      &he_cap->he_mcs_nss_supp.rx_mcs_80,
 > 160					      &own_he_cap.he_mcs_nss_supp.tx_mcs_80,
 > 161					      &he_cap->he_mcs_nss_supp.tx_mcs_80);
   162	
   163		own_160 = own_he_cap.he_cap_elem.phy_cap_info[0] &
   164			  IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
   165		peer_160 = he_cap->he_cap_elem.phy_cap_info[0] &
   166			   IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
   167	
   168		if (peer_160 && own_160) {
 > 169			ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_160,
   170						      &he_cap->he_mcs_nss_supp.rx_mcs_160,
 > 171						      &own_he_cap.he_mcs_nss_supp.tx_mcs_160,
 > 172						      &he_cap->he_mcs_nss_supp.tx_mcs_160);
   173		} else if (peer_160 && !own_160) {
   174			ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.rx_mcs_160);
 > 175			ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.tx_mcs_160);
   176			he_cap->he_cap_elem.phy_cap_info[0] &=
   177				~IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G;
   178		}
   179	
   180		own_80p80 = own_he_cap.he_cap_elem.phy_cap_info[0] &
   181			    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
   182		peer_80p80 = he_cap->he_cap_elem.phy_cap_info[0] &
   183			     IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
   184	
   185		if (peer_80p80 && own_80p80) {
 > 186			ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80p80,
   187						      &he_cap->he_mcs_nss_supp.rx_mcs_80p80,
 > 188						      &own_he_cap.he_mcs_nss_supp.tx_mcs_80p80,
   189						      &he_cap->he_mcs_nss_supp.tx_mcs_80p80);
   190		} else if (peer_80p80 && !own_80p80) {
   191			ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.rx_mcs_80p80);
   192			ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.tx_mcs_80p80);
   193			he_cap->he_cap_elem.phy_cap_info[0] &=
   194				~IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G;
   195		}
   196	}
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
