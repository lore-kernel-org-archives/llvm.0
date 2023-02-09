Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6FCA931;
	Thu,  9 Feb 2023 19:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675971959; x=1707507959;
  h=date:from:cc:subject:message-id:mime-version;
  bh=l6YKJxbw0G+8eGc6j9LnLVIQZRNh8NechLTDj9YBPus=;
  b=c+Ak4xdtsf2ESOUXNV1B9nsWvH5xvGHi7dwRvhpSyv+KmOU+g/LVgMj+
   9AYKWNUc0z4pr9elV0ht635MP1lgB+qYcNPuRwxvVU5hvyCBLe6BN1ROR
   cyqAsWNw2GHjt0oAwIK8MpPgBPQyux8gwXdfvOwpIJwbrEotD+bW50rMN
   LF+21bLYPCuWucRCbcjbo7NGv049wazEbbKPJsyEkh0u33daIO5BymWsV
   WK6wzXNAGF65yS7Rz8KF6uyNkBiCRijo7Lfxlg4g3CHmQ7h78sPizBMhT
   SFXkKxrwsP5lR39HEoyPtWKvg2SjdjgbJehRlkBg8xr6qnAUPwV2Nk+FY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="328861620"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="328861620"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 11:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="669725965"
X-IronPort-AV: E=Sophos;i="5.97,284,1669104000"; 
   d="scan'208";a="669725965"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Feb 2023 11:45:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQCrl-0005H9-17;
	Thu, 09 Feb 2023 19:45:57 +0000
Date: Fri, 10 Feb 2023 03:45:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: net/mac80211/he.c:158:33: warning: taking address of packed member
 'rx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in
 an unaligned pointer value
Message-ID: <202302100354.XRSFb57c-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git linux-rolling-lts
head:   8e8a6864e8bef6f8268dfe646c710df14663064f
commit: 7f7aa94bcaf03d0f18a6853d8f7dad6a4d25bbd6 mac80211: reduce peer HE MCS/NSS to own capabilities
date:   2 years, 1 month ago
config: mips-loongson2k_defconfig (https://download.01.org/0day-ci/archive/20230210/202302100354.XRSFb57c-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64el-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=7f7aa94bcaf03d0f18a6853d8f7dad6a4d25bbd6
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus stable/linux-rolling-lts
        git checkout 7f7aa94bcaf03d0f18a6853d8f7dad6a4d25bbd6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash net/ipv4/ net/ipv6/ net/mac80211/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100354.XRSFb57c-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/mac80211/he.c:9:
   In file included from net/mac80211/ieee80211_i.h:16:
   In file included from include/linux/if_ether.h:19:
   In file included from include/linux/skbuff.h:28:
   In file included from include/net/checksum.h:22:
   arch/mips/include/asm/checksum.h:161:9: error: unsupported inline asm: input with type 'unsigned long' matching output with type '__wsum' (aka 'unsigned int')
           : "0" ((__force unsigned long)daddr),
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from net/mac80211/he.c:9:
   In file included from net/mac80211/ieee80211_i.h:30:
   In file included from include/net/mac80211.h:22:
   In file included from include/net/codel.h:48:
   In file included from include/net/inet_ecn.h:9:
   In file included from include/net/inet_sock.h:22:
   In file included from include/net/sock.h:61:
   include/linux/poll.h:142:27: warning: division by zero is undefined [-Wdivision-by-zero]
                   M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
                                           ^~~~~~~~~
   include/linux/poll.h:140:32: note: expanded from macro 'M'
   #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:126:51: note: expanded from macro '__MAP'
           (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
                                                            ^ ~~~~~~~~~
   include/linux/poll.h:142:39: warning: division by zero is undefined [-Wdivision-by-zero]
                   M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
                                                       ^~~~~~~~~
   include/linux/poll.h:140:32: note: expanded from macro 'M'
   #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:126:51: note: expanded from macro '__MAP'
           (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
                                                            ^ ~~~~~~~~~
>> net/mac80211/he.c:158:33: warning: taking address of packed member 'rx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
           ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80,
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:159:12: warning: taking address of packed member 'rx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                         &he_cap->he_mcs_nss_supp.rx_mcs_80,
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/he.c:160:12: warning: taking address of packed member 'tx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                         &own_he_cap.he_mcs_nss_supp.tx_mcs_80,
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:161:12: warning: taking address of packed member 'tx_mcs_80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                         &he_cap->he_mcs_nss_supp.tx_mcs_80);
                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/he.c:169:34: warning: taking address of packed member 'rx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_160,
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:170:13: warning: taking address of packed member 'rx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                 &he_cap->he_mcs_nss_supp.rx_mcs_160,
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/he.c:171:13: warning: taking address of packed member 'tx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                 &own_he_cap.he_mcs_nss_supp.tx_mcs_160,
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:172:13: warning: taking address of packed member 'tx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                 &he_cap->he_mcs_nss_supp.tx_mcs_160);
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:174:29: warning: taking address of packed member 'rx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.rx_mcs_160);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:175:29: warning: taking address of packed member 'tx_mcs_160' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.tx_mcs_160);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/he.c:186:34: warning: taking address of packed member 'rx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   ieee80211_he_mcs_intersection(&own_he_cap.he_mcs_nss_supp.rx_mcs_80p80,
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:187:13: warning: taking address of packed member 'rx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                 &he_cap->he_mcs_nss_supp.rx_mcs_80p80,
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/he.c:188:13: warning: taking address of packed member 'tx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                 &own_he_cap.he_mcs_nss_supp.tx_mcs_80p80,
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:189:13: warning: taking address of packed member 'tx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                                                 &he_cap->he_mcs_nss_supp.tx_mcs_80p80);
                                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:191:29: warning: taking address of packed member 'rx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.rx_mcs_80p80);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/he.c:192:29: warning: taking address of packed member 'tx_mcs_80p80' of class or structure 'ieee80211_he_mcs_nss_supp' may result in an unaligned pointer value [-Waddress-of-packed-member]
                   ieee80211_he_mcs_disable(&he_cap->he_mcs_nss_supp.tx_mcs_80p80);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
https://github.com/intel/lkp-tests
