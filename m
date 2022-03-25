Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA807E
	for <llvm@lists.linux.dev>; Fri, 25 Mar 2022 17:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648231145; x=1679767145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=bwmb2/HWJJZwbbB1HuThxLKNSY4+zLVvjYPsO3mOgug=;
  b=egOtYWEin41nnRzrbAxs3KLdwWz1zQzaU5tKPiY+brPebV4n9mhBvT2p
   OQQmflkWHXY5duIGpXU37eQZD8kg4YNcFArlaVJ877SyQB3cvlkZ3M7Uk
   ZInzfxuWboraqAvn6F3NJ9Ps8AAJuQjIEssoP0lk+prlJrPaUvDlVEOU/
   azWM4A3+x6i8/jLgTbkO+8auVI05ACZMMCJOngi4Zp3TN/CZdUM2yYgCH
   vT29YeDJ81X0mi7+q3JfrIxtHtE+CM4yNhAEH+k2i8xNuSO8JCG/4DDcw
   HmpLMpPW9u6STN+Hgv/Kv/Equ9hugcKxx4hxXZCDQR5PpLFLhB2LIBJ++
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="238626797"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="238626797"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 10:59:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="545170602"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Mar 2022 10:59:03 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nXoDG-000MSr-PH; Fri, 25 Mar 2022 17:59:02 +0000
Date: Sat, 26 Mar 2022 01:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH] mac80211: mlme: Handle Puncturing information
 received from the AP
Message-ID: <202203260107.bl4oXnRb-lkp@intel.com>
References: <20220325140859.e48bf244f157.I3547481d49f958389f59dfeba3fcc75e72b0aa6e@changeid>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
config: arm-randconfig-r014-20220325 (https://download.01.org/0day-ci/archive/20220326/202203260107.bl4oXnRb-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/wireless/intersil/p54/ drivers/staging/wfx/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/staging/wfx/main.c:144:22: error: incompatible function pointer types initializing 'void (*)(struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, u64)' (aka 'void (*)(struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, unsigned long long)') with an expression of type 'void (struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, u32)' (aka 'void (struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, unsigned int)') [-Werror,-Wincompatible-function-pointer-types]
           .bss_info_changed       = wfx_bss_info_changed,
                                     ^~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/net/wireless/intersil/p54/main.c:718:22: error: incompatible function pointer types initializing 'void (*)(struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, u64)' (aka 'void (*)(struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, unsigned long long)') with an expression of type 'void (struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, u32)' (aka 'void (struct ieee80211_hw *, struct ieee80211_vif *, struct ieee80211_bss_conf *, unsigned int)') [-Werror,-Wincompatible-function-pointer-types]
           .bss_info_changed       = p54_bss_info_changed,
                                     ^~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +144 drivers/staging/wfx/main.c

40115bbc40e2fd Jérôme Pouiller 2019-09-19  123  
e16e7f0716a6ba Jérôme Pouiller 2019-09-19  124  static const struct ieee80211_ops wfx_ops = {
e16e7f0716a6ba Jérôme Pouiller 2019-09-19  125  	.start			= wfx_start,
e16e7f0716a6ba Jérôme Pouiller 2019-09-19  126  	.stop			= wfx_stop,
e16e7f0716a6ba Jérôme Pouiller 2019-09-19  127  	.add_interface		= wfx_add_interface,
e16e7f0716a6ba Jérôme Pouiller 2019-09-19  128  	.remove_interface	= wfx_remove_interface,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  129  	.config                 = wfx_config,
9bca45f3d6924f Jérôme Pouiller 2019-09-19  130  	.tx			= wfx_tx,
e836ad4e2da4c4 Jérôme Pouiller 2020-04-10  131  	.join_ibss		= wfx_join_ibss,
e836ad4e2da4c4 Jérôme Pouiller 2020-04-10  132  	.leave_ibss		= wfx_leave_ibss,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  133  	.conf_tx		= wfx_conf_tx,
1a61af0f8cbecd Jérôme Pouiller 2019-09-19  134  	.hw_scan		= wfx_hw_scan,
4337074be76d85 Jérôme Pouiller 2019-12-17  135  	.cancel_hw_scan		= wfx_cancel_hw_scan,
cba1d8976db003 Jérôme Pouiller 2020-04-10  136  	.start_ap		= wfx_start_ap,
cba1d8976db003 Jérôme Pouiller 2020-04-10  137  	.stop_ap		= wfx_stop_ap,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  138  	.sta_add		= wfx_sta_add,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  139  	.sta_remove		= wfx_sta_remove,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  140  	.set_tim		= wfx_set_tim,
fb2490f693ee01 Jérôme Pouiller 2019-09-19  141  	.set_key		= wfx_set_key,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  142  	.set_rts_threshold	= wfx_set_rts_threshold,
7a44644c9379eb Jérôme Pouiller 2020-04-20  143  	.set_default_unicast_key = wfx_set_default_unicast_key,
40115bbc40e2fd Jérôme Pouiller 2019-09-19 @144  	.bss_info_changed	= wfx_bss_info_changed,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  145  	.configure_filter	= wfx_configure_filter,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  146  	.ampdu_action		= wfx_ampdu_action,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  147  	.flush			= wfx_flush,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  148  	.add_chanctx		= wfx_add_chanctx,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  149  	.remove_chanctx		= wfx_remove_chanctx,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  150  	.change_chanctx		= wfx_change_chanctx,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  151  	.assign_vif_chanctx	= wfx_assign_vif_chanctx,
40115bbc40e2fd Jérôme Pouiller 2019-09-19  152  	.unassign_vif_chanctx	= wfx_unassign_vif_chanctx,
e16e7f0716a6ba Jérôme Pouiller 2019-09-19  153  };
e16e7f0716a6ba Jérôme Pouiller 2019-09-19  154  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
