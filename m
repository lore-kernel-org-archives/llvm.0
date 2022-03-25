Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F557E
	for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 18:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648232946; x=1679768946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+OHXq1tRfc9vF3xTFDyNPbaqv4svxDpHLDlNDMkhQzU=;
  b=nsSoLbAUL3lZQG82GZAXQFHakzDomxWQzmlOEoN332nvxmx0golQD2iV
   fcCny3scqG1wY3LsOc7TIYzaGLWPqYiSAMBgJvdVq7nfzZlKeqd7zPhpU
   xMJcUroeBWTCvONCrjIPhHRDyA8wIZqI0bTxcDiUL+sbw5ibiX8KE6x4I
   hoT0rTdlWFCl2PgKsPAus+jZao0w/ppWB7DWK/1QFEtBnZFfIWAdm8X2c
   flcfwbKUTnz28uZXtUsYGDqvm8QiLLieTgCfqL6qqpU+mUPxJVLlGOVNk
   jkFN3Bg7e0IsNXFpknMndOHwV9uCBk+IKb8wct9PZ6Y24/FX8ZSYU2yta
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="257522291"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="257522291"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 11:29:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="584550811"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Mar 2022 11:29:04 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nXogJ-000MU8-G8; Fri, 25 Mar 2022 18:29:03 +0000
Date: Sat, 26 Mar 2022 02:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] mac80211: mlme: Handle Puncturing information
 received from the AP
Message-ID: <202203260259.DnrkqrVM-lkp@intel.com>
References: <20220325140859.e48bf244f157.I3547481d49f958389f59dfeba3fcc75e72b0aa6e@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220325140859.e48bf244f157.I3547481d49f958389f59dfeba3fcc75e72b0aa6e@changeid>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Johannes,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main next-20220325]
[cannot apply to v5.17]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Johannes-Berg/mac80211-mlme-Handle-Puncturing-information-received-from-the-AP/20220325-210959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
config: arm-mvebu_v5_defconfig (https://download.01.org/0day-ci/archive/20220326/202203260259.DnrkqrVM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/b248fa1a2c7cfef75823796440bf6fdd81090ac2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Johannes-Berg/mac80211-mlme-Handle-Puncturing-information-received-from-the-AP/20220325-210959
        git checkout b248fa1a2c7cfef75823796440bf6fdd81090ac2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/wireless/marvell/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/wireless/marvell/mwl8k.c:5618:22: error: incompatible function pointer types initializing 'void (*)(struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, u64)' (aka 'void (*)(struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, unsigned long long)') with an expression of type 'void (struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, u32)' (aka 'void (struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, unsigned int)') [-Werror,-Wincompatible-function-pointer-types]
           .bss_info_changed       = mwl8k_bss_info_changed,
                                     ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +5618 drivers/net/wireless/marvell/mwl8k.c

4c924f42c9c9f6 drivers/net/wireless/mwl8k.c Yogesh Ashok Powar 2014-02-25  5610  
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5611  static const struct ieee80211_ops mwl8k_ops = {
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5612  	.tx			= mwl8k_tx,
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5613  	.start			= mwl8k_start,
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5614  	.stop			= mwl8k_stop,
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5615  	.add_interface		= mwl8k_add_interface,
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5616  	.remove_interface	= mwl8k_remove_interface,
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5617  	.config			= mwl8k_config,
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10 @5618  	.bss_info_changed	= mwl8k_bss_info_changed,
3ac64beecd2740 drivers/net/wireless/mwl8k.c Johannes Berg      2009-08-17  5619  	.prepare_multicast	= mwl8k_prepare_multicast,
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5620  	.configure_filter	= mwl8k_configure_filter,
fcdc403c31ed5b drivers/net/wireless/mwl8k.c Nishant Sarmukadam 2010-12-30  5621  	.set_key                = mwl8k_set_key,
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5622  	.set_rts_threshold	= mwl8k_set_rts_threshold,
4a6967b88af02e drivers/net/wireless/mwl8k.c Johannes Berg      2010-02-19  5623  	.sta_add		= mwl8k_sta_add,
4a6967b88af02e drivers/net/wireless/mwl8k.c Johannes Berg      2010-02-19  5624  	.sta_remove		= mwl8k_sta_remove,
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5625  	.conf_tx		= mwl8k_conf_tx,
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5626  	.get_stats		= mwl8k_get_stats,
0d462bbb0e2086 drivers/net/wireless/mwl8k.c John W. Linville   2010-07-28  5627  	.get_survey		= mwl8k_get_survey,
a2292d83b5dcb7 drivers/net/wireless/mwl8k.c Lennert Buytenhek  2010-01-04  5628  	.ampdu_action		= mwl8k_ampdu_action,
4c924f42c9c9f6 drivers/net/wireless/mwl8k.c Yogesh Ashok Powar 2014-02-25  5629  	.sw_scan_start		= mwl8k_sw_scan_start,
4c924f42c9c9f6 drivers/net/wireless/mwl8k.c Yogesh Ashok Powar 2014-02-25  5630  	.sw_scan_complete	= mwl8k_sw_scan_complete,
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5631  };
a66098daacee2f drivers/net/wireless/mwl8k.c Lennert Buytenhek  2009-03-10  5632  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
