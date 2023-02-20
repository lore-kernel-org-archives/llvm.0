Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1773763B8;
	Mon, 20 Feb 2023 13:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676900781; x=1708436781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dwNN84cEqMod2O2QIOu44ANYBN5+dzL5oUqQyQlC30g=;
  b=cT8c4981x0CrQeFz13Vls7PZwtUH2iS3Ciiu7W5/gjden9/VTOya/5lL
   7aI9wJQXPXpChtvlcbdNRzAjL9BO8MVYgUY7j8KxMR7jXQ5wQmcH+iagj
   G20uDoEPfJ0SPmcLfb19c2vGqr3bsz4JVl3/fA+IZxhvr5h9c3jyrUB2y
   okBukeqNrg2NZdMWFtFH0kx45XkqXkZ0BoAXlhJFujnWcKF7zFH8EOpz0
   SsBiJVAQ+LlnqT1ExGvTK1niJ0jsgFFuFRdmLK3c2cR59xGnjBzoFiAh7
   e1E0cqz/Hb4qExFLQzP+fSLLT4F34u605njiI4YuirA31vnP2Xm2+jhOn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="320527122"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="320527122"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 05:46:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="664636895"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="664636895"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Feb 2023 05:46:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU6Uj-000DxJ-2z;
	Mon, 20 Feb 2023 13:46:17 +0000
Date: Mon, 20 Feb 2023 21:45:48 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 15/21] net/mac80211/debugfs_netdev.c:191:1:
 warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char
 *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)')
 to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const v...
Message-ID: <202302202117.lJIxA1He-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pending
head:   b550c611e3d7418f1d2944f4bf0e0597044e377d
commit: 976fdb8844a790ca65be62f06bdef4d8185004b7 [15/21] wifi: mac80211: add netdev per-link debugfs data and driver hook
config: arm64-randconfig-r003-20230219 (https://download.01.org/0day-ci/archive/20230220/202302202117.lJIxA1He-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=976fdb8844a790ca65be62f06bdef4d8185004b7
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pending
        git checkout 976fdb8844a790ca65be62f06bdef4d8185004b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash net/mac80211/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302202117.lJIxA1He-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/mac80211/debugfs_netdev.c:191:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(rc_rateidx_mask_2ghz, rc_rateidx_mask[NL80211_BAND_2GHZ],
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:193:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(rc_rateidx_mask_5ghz, rc_rateidx_mask[NL80211_BAND_5GHZ],
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:195:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(rc_rateidx_mcs_mask_2ghz,
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:197:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(rc_rateidx_mcs_mask_5ghz,
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:214:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE_R(rc_rateidx_vht_mcs_mask_2ghz);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:230:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE_R(rc_rateidx_vht_mcs_mask_5ghz);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:232:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(flags, flags, HEX);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:233:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(state, state, LHEX);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/debugfs_netdev.c:234:1: warning: cast from 'ssize_t (*)(const struct ieee80211_link_data *, char *, int)' (aka 'long (*)(const struct ieee80211_link_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_LINK_FILE(txpower, conf->txpower, DEC);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:188:2: note: expanded from macro 'IEEE80211_IF_LINK_FILE'
           IEEE80211_IF_LINK_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:173:2: note: expanded from macro 'IEEE80211_IF_LINK_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:235:1: warning: cast from 'ssize_t (*)(const struct ieee80211_link_data *, char *, int)' (aka 'long (*)(const struct ieee80211_link_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_LINK_FILE(ap_power_level, ap_power_level, DEC);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:188:2: note: expanded from macro 'IEEE80211_IF_LINK_FILE'
           IEEE80211_IF_LINK_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:173:2: note: expanded from macro 'IEEE80211_IF_LINK_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:236:1: warning: cast from 'ssize_t (*)(const struct ieee80211_link_data *, char *, int)' (aka 'long (*)(const struct ieee80211_link_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_LINK_FILE(user_power_level, user_power_level, DEC);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:188:2: note: expanded from macro 'IEEE80211_IF_LINK_FILE'
           IEEE80211_IF_LINK_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:173:2: note: expanded from macro 'IEEE80211_IF_LINK_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:256:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE_R(hw_queues);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:259:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(bssid, deflink.u.mgd.bssid, MAC);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:260:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(aid, vif.cfg.aid, DEC);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:261:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(beacon_timeout, u.mgd.beacon_timeout, JIFFIES_TO_MS);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:323:1: warning: cast from 'ssize_t (*)(const struct ieee80211_link_data *, char *, int)' (aka 'long (*)(const struct ieee80211_link_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_LINK_FILE_RW(smps);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:181:2: note: expanded from macro 'IEEE80211_IF_LINK_FILE_RW'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/debugfs_netdev.c:323:1: warning: cast from 'ssize_t (*)(struct ieee80211_link_data *, const char *, int)' (aka 'long (*)(struct ieee80211_link_data *, const char *, int)') to 'ssize_t (*)(void *, const char *, int)' (aka 'long (*)(void *, const char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_LINK_FILE_RW(smps);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:182:2: note: expanded from macro 'IEEE80211_IF_LINK_FILE_RW'
           _IEEE80211_IF_FILE_W_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:147:3: note: expanded from macro '_IEEE80211_IF_FILE_W_FN'
                   (ssize_t (*)(void *, const char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/debugfs_netdev.c:389:1: warning: cast from 'ssize_t (*)(struct ieee80211_sub_if_data *, const char *, int)' (aka 'long (*)(struct ieee80211_sub_if_data *, const char *, int)') to 'ssize_t (*)(void *, const char *, int)' (aka 'long (*)(void *, const char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE_W(tkip_mic_test);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:158:2: note: expanded from macro 'IEEE80211_IF_FILE_W'
           _IEEE80211_IF_FILE_W_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:147:3: note: expanded from macro '_IEEE80211_IF_FILE_W_FN'
                   (ssize_t (*)(void *, const char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:401:1: warning: cast from 'ssize_t (*)(struct ieee80211_sub_if_data *, const char *, int)' (aka 'long (*)(struct ieee80211_sub_if_data *, const char *, int)') to 'ssize_t (*)(void *, const char *, int)' (aka 'long (*)(void *, const char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE_W(beacon_loss);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:158:2: note: expanded from macro 'IEEE80211_IF_FILE_W'
           _IEEE80211_IF_FILE_W_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:147:3: note: expanded from macro '_IEEE80211_IF_FILE_W_FN'
                   (ssize_t (*)(void *, const char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:429:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE_RW(uapsd_queues);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:162:2: note: expanded from macro 'IEEE80211_IF_FILE_RW'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:429:1: warning: cast from 'ssize_t (*)(struct ieee80211_sub_if_data *, const char *, int)' (aka 'long (*)(struct ieee80211_sub_if_data *, const char *, int)') to 'ssize_t (*)(void *, const char *, int)' (aka 'long (*)(void *, const char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE_RW(uapsd_queues);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:163:2: note: expanded from macro 'IEEE80211_IF_FILE_RW'
           _IEEE80211_IF_FILE_W_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:147:3: note: expanded from macro '_IEEE80211_IF_FILE_W_FN'
                   (ssize_t (*)(void *, const char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:457:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE_RW(uapsd_max_sp_len);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:162:2: note: expanded from macro 'IEEE80211_IF_FILE_RW'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:457:1: warning: cast from 'ssize_t (*)(struct ieee80211_sub_if_data *, const char *, int)' (aka 'long (*)(struct ieee80211_sub_if_data *, const char *, int)') to 'ssize_t (*)(void *, const char *, int)' (aka 'long (*)(void *, const char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE_RW(uapsd_max_sp_len);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:163:2: note: expanded from macro 'IEEE80211_IF_FILE_RW'
           _IEEE80211_IF_FILE_W_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:147:3: note: expanded from macro '_IEEE80211_IF_FILE_W_FN'
                   (ssize_t (*)(void *, const char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:485:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE_RW(tdls_wider_bw);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:162:2: note: expanded from macro 'IEEE80211_IF_FILE_RW'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:485:1: warning: cast from 'ssize_t (*)(struct ieee80211_sub_if_data *, const char *, int)' (aka 'long (*)(struct ieee80211_sub_if_data *, const char *, int)') to 'ssize_t (*)(void *, const char *, int)' (aka 'long (*)(void *, const char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE_RW(tdls_wider_bw);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:163:2: note: expanded from macro 'IEEE80211_IF_FILE_RW'
           _IEEE80211_IF_FILE_W_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:147:3: note: expanded from macro '_IEEE80211_IF_FILE_W_FN'
                   (ssize_t (*)(void *, const char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:488:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(num_mcast_sta, u.ap.num_mcast_sta, ATOMIC);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:489:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(num_sta_ps, u.ap.ps.num_sta_ps, ATOMIC);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:154:2: note: expanded from macro 'IEEE80211_IF_FILE_R'
           _IEEE80211_IF_FILE_R_FN(name)                                   \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:135:3: note: expanded from macro '_IEEE80211_IF_FILE_R_FN'
                   (ssize_t (*)(const void *, char *, int))                \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:490:1: warning: cast from 'ssize_t (*)(const struct ieee80211_sub_if_data *, char *, int)' (aka 'long (*)(const struct ieee80211_sub_if_data *, char *, int)') to 'ssize_t (*)(const void *, char *, int)' (aka 'long (*)(const void *, char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
   IEEE80211_IF_FILE(dtim_count, u.ap.ps.dtim_count, DEC);
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/mac80211/debugfs_netdev.c:169:2: note: expanded from macro 'IEEE80211_IF_FILE'
           IEEE80211_IF_FILE_R(name)


vim +191 net/mac80211/debugfs_netdev.c

4cd3c4ecfcbf07 Johannes Berg     2014-01-06  152  
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  153  #define IEEE80211_IF_FILE_R(name)					\
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  154  	_IEEE80211_IF_FILE_R_FN(name)					\
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  155  	_IEEE80211_IF_FILE_OPS(name, ieee80211_if_read_##name, NULL)
0f78231bffb868 Johannes Berg     2009-12-01  156  
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  157  #define IEEE80211_IF_FILE_W(name)					\
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  158  	_IEEE80211_IF_FILE_W_FN(name)					\
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  159  	_IEEE80211_IF_FILE_OPS(name, NULL, ieee80211_if_write_##name)
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  160  
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  161  #define IEEE80211_IF_FILE_RW(name)					\
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  162  	_IEEE80211_IF_FILE_R_FN(name)					\
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  163  	_IEEE80211_IF_FILE_W_FN(name)					\
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  164  	_IEEE80211_IF_FILE_OPS(name, ieee80211_if_read_##name,		\
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  165  			       ieee80211_if_write_##name)
0f78231bffb868 Johannes Berg     2009-12-01  166  
e9f207f0ff90bf Jiri Benc         2007-05-05  167  #define IEEE80211_IF_FILE(name, field, format)				\
976fdb8844a790 Benjamin Berg     2022-09-09  168  	IEEE80211_IF_FMT_##format(name, struct ieee80211_sub_if_data, field) \
4cd3c4ecfcbf07 Johannes Berg     2014-01-06 @169  	IEEE80211_IF_FILE_R(name)
e9f207f0ff90bf Jiri Benc         2007-05-05  170  
976fdb8844a790 Benjamin Berg     2022-09-09  171  /* Same but with a link_ prefix in the ops variable name and different type */
976fdb8844a790 Benjamin Berg     2022-09-09  172  #define IEEE80211_IF_LINK_FILE_R(name)					\
976fdb8844a790 Benjamin Berg     2022-09-09  173  	_IEEE80211_IF_FILE_R_FN(name)					\
976fdb8844a790 Benjamin Berg     2022-09-09  174  	_IEEE80211_IF_FILE_OPS(link_##name, ieee80211_if_read_##name, NULL)
976fdb8844a790 Benjamin Berg     2022-09-09  175  
976fdb8844a790 Benjamin Berg     2022-09-09  176  #define IEEE80211_IF_LINK_FILE_W(name)					\
976fdb8844a790 Benjamin Berg     2022-09-09  177  	_IEEE80211_IF_FILE_W_FN(name)					\
976fdb8844a790 Benjamin Berg     2022-09-09  178  	_IEEE80211_IF_FILE_OPS(link_##name, NULL, ieee80211_if_write_##name)
976fdb8844a790 Benjamin Berg     2022-09-09  179  
976fdb8844a790 Benjamin Berg     2022-09-09  180  #define IEEE80211_IF_LINK_FILE_RW(name)					\
976fdb8844a790 Benjamin Berg     2022-09-09  181  	_IEEE80211_IF_FILE_R_FN(name)					\
976fdb8844a790 Benjamin Berg     2022-09-09  182  	_IEEE80211_IF_FILE_W_FN(name)					\
976fdb8844a790 Benjamin Berg     2022-09-09  183  	_IEEE80211_IF_FILE_OPS(link_##name, ieee80211_if_read_##name,	\
976fdb8844a790 Benjamin Berg     2022-09-09  184  			       ieee80211_if_write_##name)
976fdb8844a790 Benjamin Berg     2022-09-09  185  
976fdb8844a790 Benjamin Berg     2022-09-09  186  #define IEEE80211_IF_LINK_FILE(name, field, format)				\
976fdb8844a790 Benjamin Berg     2022-09-09  187  	IEEE80211_IF_FMT_##format(name, struct ieee80211_link_data, field) \
976fdb8844a790 Benjamin Berg     2022-09-09  188  	IEEE80211_IF_LINK_FILE_R(name)
976fdb8844a790 Benjamin Berg     2022-09-09  189  
e9f207f0ff90bf Jiri Benc         2007-05-05  190  /* common attributes */
57fbcce37be7c1 Johannes Berg     2016-04-12 @191  IEEE80211_IF_FILE(rc_rateidx_mask_2ghz, rc_rateidx_mask[NL80211_BAND_2GHZ],
37eb0b164cf9fa Jouni Malinen     2010-01-06  192  		  HEX);
57fbcce37be7c1 Johannes Berg     2016-04-12  193  IEEE80211_IF_FILE(rc_rateidx_mask_5ghz, rc_rateidx_mask[NL80211_BAND_5GHZ],
37eb0b164cf9fa Jouni Malinen     2010-01-06  194  		  HEX);
19468413e8d98d Simon Wunderlich  2012-01-28  195  IEEE80211_IF_FILE(rc_rateidx_mcs_mask_2ghz,
57fbcce37be7c1 Johannes Berg     2016-04-12  196  		  rc_rateidx_mcs_mask[NL80211_BAND_2GHZ], HEXARRAY);
19468413e8d98d Simon Wunderlich  2012-01-28  197  IEEE80211_IF_FILE(rc_rateidx_mcs_mask_5ghz,
57fbcce37be7c1 Johannes Berg     2016-04-12  198  		  rc_rateidx_mcs_mask[NL80211_BAND_5GHZ], HEXARRAY);
19468413e8d98d Simon Wunderlich  2012-01-28  199  
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  200  static ssize_t ieee80211_if_fmt_rc_rateidx_vht_mcs_mask_2ghz(
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  201  				const struct ieee80211_sub_if_data *sdata,
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  202  				char *buf, int buflen)
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  203  {
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  204  	int i, len = 0;
57fbcce37be7c1 Johannes Berg     2016-04-12  205  	const u16 *mask = sdata->rc_rateidx_vht_mcs_mask[NL80211_BAND_2GHZ];
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  206  
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  207  	for (i = 0; i < NL80211_VHT_NSS_MAX; i++)
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  208  		len += scnprintf(buf + len, buflen - len, "%04x ", mask[i]);
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  209  	len += scnprintf(buf + len, buflen - len, "\n");
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  210  
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  211  	return len;
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  212  }
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  213  
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  214  IEEE80211_IF_FILE_R(rc_rateidx_vht_mcs_mask_2ghz);
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  215  
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  216  static ssize_t ieee80211_if_fmt_rc_rateidx_vht_mcs_mask_5ghz(
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  217  				const struct ieee80211_sub_if_data *sdata,
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  218  				char *buf, int buflen)
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  219  {
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  220  	int i, len = 0;
57fbcce37be7c1 Johannes Berg     2016-04-12  221  	const u16 *mask = sdata->rc_rateidx_vht_mcs_mask[NL80211_BAND_5GHZ];
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  222  
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  223  	for (i = 0; i < NL80211_VHT_NSS_MAX; i++)
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  224  		len += scnprintf(buf + len, buflen - len, "%04x ", mask[i]);
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  225  	len += scnprintf(buf + len, buflen - len, "\n");
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  226  
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  227  	return len;
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  228  }
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  229  
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  230  IEEE80211_IF_FILE_R(rc_rateidx_vht_mcs_mask_5ghz);
b119ad6e726cc8 Lorenzo Bianconi  2015-08-06  231  
4914b3bb7fa6ba Ben Greear        2011-01-27  232  IEEE80211_IF_FILE(flags, flags, HEX);
4914b3bb7fa6ba Ben Greear        2011-01-27  233  IEEE80211_IF_FILE(state, state, LHEX);
976fdb8844a790 Benjamin Berg     2022-09-09 @234  IEEE80211_IF_LINK_FILE(txpower, conf->txpower, DEC);
976fdb8844a790 Benjamin Berg     2022-09-09  235  IEEE80211_IF_LINK_FILE(ap_power_level, ap_power_level, DEC);
976fdb8844a790 Benjamin Berg     2022-09-09  236  IEEE80211_IF_LINK_FILE(user_power_level, user_power_level, DEC);
e9f207f0ff90bf Jiri Benc         2007-05-05  237  
08643315e55fd7 Johannes Berg     2012-11-08  238  static ssize_t
08643315e55fd7 Johannes Berg     2012-11-08  239  ieee80211_if_fmt_hw_queues(const struct ieee80211_sub_if_data *sdata,
08643315e55fd7 Johannes Berg     2012-11-08  240  			   char *buf, int buflen)
08643315e55fd7 Johannes Berg     2012-11-08  241  {
08643315e55fd7 Johannes Berg     2012-11-08  242  	int len;
08643315e55fd7 Johannes Berg     2012-11-08  243  
08643315e55fd7 Johannes Berg     2012-11-08  244  	len = scnprintf(buf, buflen, "AC queues: VO:%d VI:%d BE:%d BK:%d\n",
08643315e55fd7 Johannes Berg     2012-11-08  245  			sdata->vif.hw_queue[IEEE80211_AC_VO],
08643315e55fd7 Johannes Berg     2012-11-08  246  			sdata->vif.hw_queue[IEEE80211_AC_VI],
08643315e55fd7 Johannes Berg     2012-11-08  247  			sdata->vif.hw_queue[IEEE80211_AC_BE],
08643315e55fd7 Johannes Berg     2012-11-08  248  			sdata->vif.hw_queue[IEEE80211_AC_BK]);
08643315e55fd7 Johannes Berg     2012-11-08  249  
08643315e55fd7 Johannes Berg     2012-11-08  250  	if (sdata->vif.type == NL80211_IFTYPE_AP)
08643315e55fd7 Johannes Berg     2012-11-08  251  		len += scnprintf(buf + len, buflen - len, "cab queue: %d\n",
08643315e55fd7 Johannes Berg     2012-11-08  252  				 sdata->vif.cab_queue);
08643315e55fd7 Johannes Berg     2012-11-08  253  
08643315e55fd7 Johannes Berg     2012-11-08  254  	return len;
08643315e55fd7 Johannes Berg     2012-11-08  255  }
4cd3c4ecfcbf07 Johannes Berg     2014-01-06  256  IEEE80211_IF_FILE_R(hw_queues);
08643315e55fd7 Johannes Berg     2012-11-08  257  
469002983fc90c Johannes Berg     2009-02-15  258  /* STA attributes */
bfd8403adddd09 Johannes Berg     2022-05-16  259  IEEE80211_IF_FILE(bssid, deflink.u.mgd.bssid, MAC);
f276e20b182dbf Johannes Berg     2022-05-10  260  IEEE80211_IF_FILE(aid, vif.cfg.aid, DEC);
78e443e4c66b6e Ben Greear        2013-03-25  261  IEEE80211_IF_FILE(beacon_timeout, u.mgd.beacon_timeout, JIFFIES_TO_MS);
e9f207f0ff90bf Jiri Benc         2007-05-05  262  
976fdb8844a790 Benjamin Berg     2022-09-09  263  static int ieee80211_set_smps(struct ieee80211_link_data *link,
0f78231bffb868 Johannes Berg     2009-12-01  264  			      enum ieee80211_smps_mode smps_mode)
0f78231bffb868 Johannes Berg     2009-12-01  265  {
976fdb8844a790 Benjamin Berg     2022-09-09  266  	struct ieee80211_sub_if_data *sdata = link->sdata;
0f78231bffb868 Johannes Berg     2009-12-01  267  	struct ieee80211_local *local = sdata->local;
0f78231bffb868 Johannes Berg     2009-12-01  268  	int err;
0f78231bffb868 Johannes Berg     2009-12-01  269  
0d8614b4b926d0 Eliad Peller      2014-09-10  270  	if (!(local->hw.wiphy->features & NL80211_FEATURE_STATIC_SMPS) &&
0f78231bffb868 Johannes Berg     2009-12-01  271  	    smps_mode == IEEE80211_SMPS_STATIC)
0f78231bffb868 Johannes Berg     2009-12-01  272  		return -EINVAL;
0f78231bffb868 Johannes Berg     2009-12-01  273  
0f78231bffb868 Johannes Berg     2009-12-01  274  	/* auto should be dynamic if in PS mode */
0d8614b4b926d0 Eliad Peller      2014-09-10  275  	if (!(local->hw.wiphy->features & NL80211_FEATURE_DYNAMIC_SMPS) &&
0f78231bffb868 Johannes Berg     2009-12-01  276  	    (smps_mode == IEEE80211_SMPS_DYNAMIC ||
0f78231bffb868 Johannes Berg     2009-12-01  277  	     smps_mode == IEEE80211_SMPS_AUTOMATIC))
0f78231bffb868 Johannes Berg     2009-12-01  278  		return -EINVAL;
0f78231bffb868 Johannes Berg     2009-12-01  279  
52b4810bed8369 Ilan Peer         2020-01-31  280  	if (sdata->vif.type != NL80211_IFTYPE_STATION)
0f78231bffb868 Johannes Berg     2009-12-01  281  		return -EOPNOTSUPP;
0f78231bffb868 Johannes Berg     2009-12-01  282  
8d61ffa5e01c5f Johannes Berg     2013-05-10  283  	sdata_lock(sdata);
976fdb8844a790 Benjamin Berg     2022-09-09  284  	err = __ieee80211_request_smps_mgd(link->sdata, link, smps_mode);
8d61ffa5e01c5f Johannes Berg     2013-05-10  285  	sdata_unlock(sdata);
0f78231bffb868 Johannes Berg     2009-12-01  286  
0f78231bffb868 Johannes Berg     2009-12-01  287  	return err;
0f78231bffb868 Johannes Berg     2009-12-01  288  }
0f78231bffb868 Johannes Berg     2009-12-01  289  
0f78231bffb868 Johannes Berg     2009-12-01  290  static const char *smps_modes[IEEE80211_SMPS_NUM_MODES] = {
0f78231bffb868 Johannes Berg     2009-12-01  291  	[IEEE80211_SMPS_AUTOMATIC] = "auto",
0f78231bffb868 Johannes Berg     2009-12-01  292  	[IEEE80211_SMPS_OFF] = "off",
0f78231bffb868 Johannes Berg     2009-12-01  293  	[IEEE80211_SMPS_STATIC] = "static",
0f78231bffb868 Johannes Berg     2009-12-01  294  	[IEEE80211_SMPS_DYNAMIC] = "dynamic",
0f78231bffb868 Johannes Berg     2009-12-01  295  };
0f78231bffb868 Johannes Berg     2009-12-01  296  
976fdb8844a790 Benjamin Berg     2022-09-09  297  static ssize_t ieee80211_if_fmt_smps(const struct ieee80211_link_data *link,
0f78231bffb868 Johannes Berg     2009-12-01  298  				     char *buf, int buflen)
0f78231bffb868 Johannes Berg     2009-12-01  299  {
976fdb8844a790 Benjamin Berg     2022-09-09  300  	if (link->sdata->vif.type == NL80211_IFTYPE_STATION)
0f78231bffb868 Johannes Berg     2009-12-01  301  		return snprintf(buf, buflen, "request: %s\nused: %s\n",
976fdb8844a790 Benjamin Berg     2022-09-09  302  				smps_modes[link->u.mgd.req_smps],
976fdb8844a790 Benjamin Berg     2022-09-09  303  				smps_modes[link->smps_mode]);
687da132234feb Emmanuel Grumbach 2013-10-01  304  	return -EINVAL;
0f78231bffb868 Johannes Berg     2009-12-01  305  }
0f78231bffb868 Johannes Berg     2009-12-01  306  
976fdb8844a790 Benjamin Berg     2022-09-09  307  static ssize_t ieee80211_if_parse_smps(struct ieee80211_link_data *link,
0f78231bffb868 Johannes Berg     2009-12-01  308  				       const char *buf, int buflen)
0f78231bffb868 Johannes Berg     2009-12-01  309  {
0f78231bffb868 Johannes Berg     2009-12-01  310  	enum ieee80211_smps_mode mode;
0f78231bffb868 Johannes Berg     2009-12-01  311  
0f78231bffb868 Johannes Berg     2009-12-01  312  	for (mode = 0; mode < IEEE80211_SMPS_NUM_MODES; mode++) {
0f78231bffb868 Johannes Berg     2009-12-01  313  		if (strncmp(buf, smps_modes[mode], buflen) == 0) {
976fdb8844a790 Benjamin Berg     2022-09-09  314  			int err = ieee80211_set_smps(link, mode);
0f78231bffb868 Johannes Berg     2009-12-01  315  			if (!err)
0f78231bffb868 Johannes Berg     2009-12-01  316  				return buflen;
0f78231bffb868 Johannes Berg     2009-12-01  317  			return err;
0f78231bffb868 Johannes Berg     2009-12-01  318  		}
0f78231bffb868 Johannes Berg     2009-12-01  319  	}
0f78231bffb868 Johannes Berg     2009-12-01  320  
0f78231bffb868 Johannes Berg     2009-12-01  321  	return -EINVAL;
0f78231bffb868 Johannes Berg     2009-12-01  322  }
976fdb8844a790 Benjamin Berg     2022-09-09 @323  IEEE80211_IF_LINK_FILE_RW(smps);
681d119047761c Jouni Malinen     2011-02-03  324  
681d119047761c Jouni Malinen     2011-02-03  325  static ssize_t ieee80211_if_parse_tkip_mic_test(
681d119047761c Jouni Malinen     2011-02-03  326  	struct ieee80211_sub_if_data *sdata, const char *buf, int buflen)
681d119047761c Jouni Malinen     2011-02-03  327  {
681d119047761c Jouni Malinen     2011-02-03  328  	struct ieee80211_local *local = sdata->local;
681d119047761c Jouni Malinen     2011-02-03  329  	u8 addr[ETH_ALEN];
681d119047761c Jouni Malinen     2011-02-03  330  	struct sk_buff *skb;
681d119047761c Jouni Malinen     2011-02-03  331  	struct ieee80211_hdr *hdr;
681d119047761c Jouni Malinen     2011-02-03  332  	__le16 fc;
681d119047761c Jouni Malinen     2011-02-03  333  
28656a111af701 Johannes Berg     2012-11-05  334  	if (!mac_pton(buf, addr))
681d119047761c Jouni Malinen     2011-02-03  335  		return -EINVAL;
681d119047761c Jouni Malinen     2011-02-03  336  
681d119047761c Jouni Malinen     2011-02-03  337  	if (!ieee80211_sdata_running(sdata))
681d119047761c Jouni Malinen     2011-02-03  338  		return -ENOTCONN;
681d119047761c Jouni Malinen     2011-02-03  339  
681d119047761c Jouni Malinen     2011-02-03  340  	skb = dev_alloc_skb(local->hw.extra_tx_headroom + 24 + 100);
681d119047761c Jouni Malinen     2011-02-03  341  	if (!skb)
681d119047761c Jouni Malinen     2011-02-03  342  		return -ENOMEM;
681d119047761c Jouni Malinen     2011-02-03  343  	skb_reserve(skb, local->hw.extra_tx_headroom);
681d119047761c Jouni Malinen     2011-02-03  344  
b080db585384b9 Johannes Berg     2017-06-16  345  	hdr = skb_put_zero(skb, 24);
681d119047761c Jouni Malinen     2011-02-03  346  	fc = cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA);
681d119047761c Jouni Malinen     2011-02-03  347  
681d119047761c Jouni Malinen     2011-02-03  348  	switch (sdata->vif.type) {
681d119047761c Jouni Malinen     2011-02-03  349  	case NL80211_IFTYPE_AP:
681d119047761c Jouni Malinen     2011-02-03  350  		fc |= cpu_to_le16(IEEE80211_FCTL_FROMDS);
681d119047761c Jouni Malinen     2011-02-03  351  		/* DA BSSID SA */
681d119047761c Jouni Malinen     2011-02-03  352  		memcpy(hdr->addr1, addr, ETH_ALEN);
681d119047761c Jouni Malinen     2011-02-03  353  		memcpy(hdr->addr2, sdata->vif.addr, ETH_ALEN);
681d119047761c Jouni Malinen     2011-02-03  354  		memcpy(hdr->addr3, sdata->vif.addr, ETH_ALEN);
681d119047761c Jouni Malinen     2011-02-03  355  		break;
681d119047761c Jouni Malinen     2011-02-03  356  	case NL80211_IFTYPE_STATION:
681d119047761c Jouni Malinen     2011-02-03  357  		fc |= cpu_to_le16(IEEE80211_FCTL_TODS);
681d119047761c Jouni Malinen     2011-02-03  358  		/* BSSID SA DA */
8d61ffa5e01c5f Johannes Berg     2013-05-10  359  		sdata_lock(sdata);
41c97a2032e753 Johannes Berg     2012-11-05  360  		if (!sdata->u.mgd.associated) {
8d61ffa5e01c5f Johannes Berg     2013-05-10  361  			sdata_unlock(sdata);
681d119047761c Jouni Malinen     2011-02-03  362  			dev_kfree_skb(skb);
681d119047761c Jouni Malinen     2011-02-03  363  			return -ENOTCONN;
681d119047761c Jouni Malinen     2011-02-03  364  		}
bfd8403adddd09 Johannes Berg     2022-05-16  365  		memcpy(hdr->addr1, sdata->deflink.u.mgd.bssid, ETH_ALEN);
681d119047761c Jouni Malinen     2011-02-03  366  		memcpy(hdr->addr2, sdata->vif.addr, ETH_ALEN);
681d119047761c Jouni Malinen     2011-02-03  367  		memcpy(hdr->addr3, addr, ETH_ALEN);
8d61ffa5e01c5f Johannes Berg     2013-05-10  368  		sdata_unlock(sdata);
681d119047761c Jouni Malinen     2011-02-03  369  		break;
681d119047761c Jouni Malinen     2011-02-03  370  	default:
681d119047761c Jouni Malinen     2011-02-03  371  		dev_kfree_skb(skb);
681d119047761c Jouni Malinen     2011-02-03  372  		return -EOPNOTSUPP;
681d119047761c Jouni Malinen     2011-02-03  373  	}
681d119047761c Jouni Malinen     2011-02-03  374  	hdr->frame_control = fc;
681d119047761c Jouni Malinen     2011-02-03  375  
681d119047761c Jouni Malinen     2011-02-03  376  	/*
681d119047761c Jouni Malinen     2011-02-03  377  	 * Add some length to the test frame to make it look bit more valid.
681d119047761c Jouni Malinen     2011-02-03  378  	 * The exact contents does not matter since the recipient is required
681d119047761c Jouni Malinen     2011-02-03  379  	 * to drop this because of the Michael MIC failure.
681d119047761c Jouni Malinen     2011-02-03  380  	 */
b080db585384b9 Johannes Berg     2017-06-16  381  	skb_put_zero(skb, 50);
681d119047761c Jouni Malinen     2011-02-03  382  
681d119047761c Jouni Malinen     2011-02-03  383  	IEEE80211_SKB_CB(skb)->flags |= IEEE80211_TX_INTFL_TKIP_MIC_FAILURE;
681d119047761c Jouni Malinen     2011-02-03  384  
681d119047761c Jouni Malinen     2011-02-03  385  	ieee80211_tx_skb(sdata, skb);
681d119047761c Jouni Malinen     2011-02-03  386  
681d119047761c Jouni Malinen     2011-02-03  387  	return buflen;
681d119047761c Jouni Malinen     2011-02-03  388  }
4cd3c4ecfcbf07 Johannes Berg     2014-01-06 @389  IEEE80211_IF_FILE_W(tkip_mic_test);
681d119047761c Jouni Malinen     2011-02-03  390  

:::::: The code at line 191 was first introduced by commit
:::::: 57fbcce37be7c1d2622b56587c10ade00e96afa3 cfg80211: remove enum ieee80211_band

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
