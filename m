Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4462C6D39;
	Mon, 20 Feb 2023 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676907563; x=1708443563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PMCt83pZLxr12BMqPPOh/iHpUdrkv8wVpPR8CfRhDp8=;
  b=eSlSoQBumHB2wm7q9A4cv5vznIG94560T4tB5DGrcaflH02ak9mRAqXF
   37klIxIaiSeq6Jn0R8nRl+mG0ZpCudL8oDYB+N7tvE0BKcZz34SZo/p18
   /2w/BqGZwqiMm9OlXEh0IxZOJ2DvfJXxpn8r75V1idlQ2CGcL1SFIALeF
   0T5Zlw9f735QdoJXehHBmHjpA58WsnucB9KV08pVoZnh7bCc/p+1+uuDJ
   j8YLKInruK+lueWkHy75ea97Vx+ebucViV9V3gtCu3AMISDoS3hT6bC8B
   YssIzCIAPTJ29fhba5mqvaZOgbAaDbd+l6lpGK3JVa33vSzWdAPeIPAYu
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="331093298"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="331093298"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 07:39:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="760209795"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="760209795"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Feb 2023 07:39:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU8G8-000E1f-2F;
	Mon, 20 Feb 2023 15:39:20 +0000
Date: Mon, 20 Feb 2023 23:38:33 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 15/21] ld.lld: error: duplicate symbol:
 ieee80211_link_debugfs_add
Message-ID: <202302202310.WDDrKxzM-lkp@intel.com>
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
config: x86_64-randconfig-a015-20230220 (https://download.01.org/0day-ci/archive/20230220/202302202310.WDDrKxzM-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=976fdb8844a790ca65be62f06bdef4d8185004b7
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pending
        git checkout 976fdb8844a790ca65be62f06bdef4d8185004b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302202310.WDDrKxzM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from net/mac80211/driver-ops.c:11:
>> net/mac80211/debugfs_netdev.h:30:6: warning: no previous prototype for function 'ieee80211_link_debugfs_add' [-Wmissing-prototypes]
   void ieee80211_link_debugfs_add(struct ieee80211_link_data *link) {}
        ^
   net/mac80211/debugfs_netdev.h:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ieee80211_link_debugfs_add(struct ieee80211_link_data *link) {}
   ^
   static 
>> net/mac80211/debugfs_netdev.h:31:6: warning: no previous prototype for function 'ieee80211_link_debugfs_remove' [-Wmissing-prototypes]
   void ieee80211_link_debugfs_remove(struct ieee80211_link_data *link) {}
        ^
   net/mac80211/debugfs_netdev.h:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ieee80211_link_debugfs_remove(struct ieee80211_link_data *link) {}
   ^
   static 
>> net/mac80211/debugfs_netdev.h:33:6: warning: no previous prototype for function 'ieee80211_link_debugfs_drv_add' [-Wmissing-prototypes]
   void ieee80211_link_debugfs_drv_add(struct ieee80211_link_data *link) {}
        ^
   net/mac80211/debugfs_netdev.h:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ieee80211_link_debugfs_drv_add(struct ieee80211_link_data *link) {}
   ^
   static 
>> net/mac80211/debugfs_netdev.h:34:6: warning: no previous prototype for function 'ieee80211_link_debugfs_drv_remove' [-Wmissing-prototypes]
   void ieee80211_link_debugfs_drv_remove(struct ieee80211_link_data *link) {}
        ^
   net/mac80211/debugfs_netdev.h:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void ieee80211_link_debugfs_drv_remove(struct ieee80211_link_data *link) {}
   ^
   static 
   4 warnings generated.
--
>> ld.lld: error: duplicate symbol: ieee80211_link_debugfs_add
   >>> defined at debugfs_netdev.h:30 (net/mac80211/debugfs_netdev.h:30)
   >>>            net/mac80211/driver-ops.o:(ieee80211_link_debugfs_add)
   >>> defined at debugfs_netdev.h:30 (net/mac80211/debugfs_netdev.h:30)
   >>>            net/mac80211/iface.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: ieee80211_link_debugfs_remove
   >>> defined at debugfs_netdev.h:31 (net/mac80211/debugfs_netdev.h:31)
   >>>            net/mac80211/driver-ops.o:(ieee80211_link_debugfs_remove)
   >>> defined at debugfs_netdev.h:31 (net/mac80211/debugfs_netdev.h:31)
   >>>            net/mac80211/iface.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: ieee80211_link_debugfs_drv_add
   >>> defined at debugfs_netdev.h:33 (net/mac80211/debugfs_netdev.h:33)
   >>>            net/mac80211/driver-ops.o:(ieee80211_link_debugfs_drv_add)
   >>> defined at debugfs_netdev.h:33 (net/mac80211/debugfs_netdev.h:33)
   >>>            net/mac80211/iface.o:(.text+0x20)
--
>> ld.lld: error: duplicate symbol: ieee80211_link_debugfs_drv_remove
   >>> defined at debugfs_netdev.h:34 (net/mac80211/debugfs_netdev.h:34)
   >>>            net/mac80211/driver-ops.o:(ieee80211_link_debugfs_drv_remove)
   >>> defined at debugfs_netdev.h:34 (net/mac80211/debugfs_netdev.h:34)
   >>>            net/mac80211/iface.o:(.text+0x30)
--
>> ld.lld: error: duplicate symbol: ieee80211_link_debugfs_add
   >>> defined at debugfs_netdev.h:30 (net/mac80211/debugfs_netdev.h:30)
   >>>            net/mac80211/driver-ops.o:(ieee80211_link_debugfs_add)
   >>> defined at debugfs_netdev.h:30 (net/mac80211/debugfs_netdev.h:30)
   >>>            net/mac80211/link.o:(.text+0x0)
--
>> ld.lld: error: duplicate symbol: ieee80211_link_debugfs_remove
   >>> defined at debugfs_netdev.h:31 (net/mac80211/debugfs_netdev.h:31)
   >>>            net/mac80211/driver-ops.o:(ieee80211_link_debugfs_remove)
   >>> defined at debugfs_netdev.h:31 (net/mac80211/debugfs_netdev.h:31)
   >>>            net/mac80211/link.o:(.text+0x10)
--
>> ld.lld: error: duplicate symbol: ieee80211_link_debugfs_drv_add
   >>> defined at debugfs_netdev.h:33 (net/mac80211/debugfs_netdev.h:33)
   >>>            net/mac80211/driver-ops.o:(ieee80211_link_debugfs_drv_add)
   >>> defined at debugfs_netdev.h:33 (net/mac80211/debugfs_netdev.h:33)
   >>>            net/mac80211/link.o:(.text+0x20)
--
>> ld.lld: error: duplicate symbol: ieee80211_link_debugfs_drv_remove
   >>> defined at debugfs_netdev.h:34 (net/mac80211/debugfs_netdev.h:34)
   >>>            net/mac80211/driver-ops.o:(ieee80211_link_debugfs_drv_remove)
   >>> defined at debugfs_netdev.h:34 (net/mac80211/debugfs_netdev.h:34)
   >>>            net/mac80211/link.o:(.text+0x30)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
