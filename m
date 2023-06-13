Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCB529114;
	Tue, 13 Jun 2023 11:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686655980; x=1718191980;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P/m8bxEp70Vw63G15hQqPKoZ0wCdmAI/ISuqJcnY9N8=;
  b=d3kgvAbloUJUCnNZUbdZa19/+QIs/nUGCyMlu2yvOv2Nn4HFUN+LFEzf
   w9MtuFPSstvnZQfGtLroeCLXp5MbNuUQlfqUTFBPSAuCePhbmCB45Kpmv
   XwTMfKQmT4usfeSlMHbm+8eBmCuDEn5btMDfkktMIulQchUp2Vw6zccTu
   3jxvGAwxv4xHnGCTorYg1REsbFaOgmI/+TrMgocneMaP44iYSq4OQkHHN
   pAI/cmqbm9ScFpOPQOHjhxCRGScVVJ1ZGSbfPhj8potcuwexkVeSJfxHw
   vIKh/yIVV2hiDq+wyRCNurllegAQJKyp2tfs0fS1pOjTbkxpazkAjHUsA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="337940994"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="337940994"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 04:32:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="711607764"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="711607764"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Jun 2023 04:32:53 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q92Ga-0001Ii-1r;
	Tue, 13 Jun 2023 11:32:52 +0000
Date: Tue, 13 Jun 2023 19:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Sisodiya <mukesh.sisodiya@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending-all 76/144]
 drivers/net/wireless/marvell/mwifiex/cfg80211.c:4247:15: error: incompatible
 function pointer types initializing 'int (*)(struct wiphy *, struct
 net_device *, const u8 *, int, u8, u8, u16, u32, bool, const u8 *, size_t)'
 (aka 'int (*)(struct wiphy *, stru...
Message-ID: <202306131926.I4MtXuVF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pending-all
head:   30163f6d537308480c525bbe4f72c8fec844779b
commit: 4e10e897db1f505a66db3e8a8eda57155a43cb3c [76/144] wifi: cfg80211: make TDLS management link-aware
config: powerpc-randconfig-r003-20230612 (https://download.01.org/0day-ci/archive/20230613/202306131926.I4MtXuVF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=4e10e897db1f505a66db3e8a8eda57155a43cb3c
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pending-all
        git checkout 4e10e897db1f505a66db3e8a8eda57155a43cb3c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/net/wireless/marvell/mwifiex/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306131926.I4MtXuVF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/marvell/mwifiex/cfg80211.c:4247:15: error: incompatible function pointer types initializing 'int (*)(struct wiphy *, struct net_device *, const u8 *, int, u8, u8, u16, u32, bool, const u8 *, size_t)' (aka 'int (*)(struct wiphy *, struct net_device *, const unsigned char *, int, unsigned char, unsigned char, unsigned short, unsigned int, _Bool, const unsigned char *, unsigned int)') with an expression of type 'int (struct wiphy *, struct net_device *, const u8 *, u8, u8, u16, u32, bool, const u8 *, size_t)' (aka 'int (struct wiphy *, struct net_device *, const unsigned char *, unsigned char, unsigned char, unsigned short, unsigned int, _Bool, const unsigned char *, unsigned int)') [-Wincompatible-function-pointer-types]
    4247 |         .tdls_mgmt = mwifiex_cfg80211_tdls_mgmt,
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +4247 drivers/net/wireless/marvell/mwifiex/cfg80211.c

1f4dfd8a1e911c drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil            2014-02-07  4203  
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4204  /* station cfg80211 operations */
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4205  static struct cfg80211_ops mwifiex_cfg80211_ops = {
93a1df48d22429 drivers/net/wireless/mwifiex/cfg80211.c         Yogesh Ashok Powar       2011-09-26  4206  	.add_virtual_intf = mwifiex_add_virtual_intf,
93a1df48d22429 drivers/net/wireless/mwifiex/cfg80211.c         Yogesh Ashok Powar       2011-09-26  4207  	.del_virtual_intf = mwifiex_del_virtual_intf,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4208  	.change_virtual_intf = mwifiex_cfg80211_change_virtual_intf,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4209  	.scan = mwifiex_cfg80211_scan,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4210  	.connect = mwifiex_cfg80211_connect,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4211  	.disconnect = mwifiex_cfg80211_disconnect,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4212  	.get_station = mwifiex_cfg80211_get_station,
f85aae6bec6707 drivers/net/wireless/mwifiex/cfg80211.c         Amitkumar Karwar         2012-03-15  4213  	.dump_station = mwifiex_cfg80211_dump_station,
6bc6c49f1e2f3a drivers/net/wireless/mwifiex/cfg80211.c         Xinming Hu               2014-10-31  4214  	.dump_survey = mwifiex_cfg80211_dump_survey,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4215  	.set_wiphy_params = mwifiex_cfg80211_set_wiphy_params,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4216  	.join_ibss = mwifiex_cfg80211_join_ibss,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4217  	.leave_ibss = mwifiex_cfg80211_leave_ibss,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4218  	.add_key = mwifiex_cfg80211_add_key,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4219  	.del_key = mwifiex_cfg80211_del_key,
89951db2be5310 drivers/net/wireless/marvell/mwifiex/cfg80211.c Ganapathi Bhat           2016-09-20  4220  	.set_default_mgmt_key = mwifiex_cfg80211_set_default_mgmt_key,
e39faa73ef14f6 drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao               2012-09-25  4221  	.mgmt_tx = mwifiex_cfg80211_mgmt_tx,
6cd536fe62ef58 drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Berg            2020-04-17  4222  	.update_mgmt_frame_registrations =
6cd536fe62ef58 drivers/net/wireless/marvell/mwifiex/cfg80211.c Johannes Berg            2020-04-17  4223  		mwifiex_cfg80211_update_mgmt_frame_registrations,
7feb4c48313d58 drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao               2012-09-25  4224  	.remain_on_channel = mwifiex_cfg80211_remain_on_channel,
7feb4c48313d58 drivers/net/wireless/mwifiex/cfg80211.c         Stone Piao               2012-09-25  4225  	.cancel_remain_on_channel = mwifiex_cfg80211_cancel_remain_on_channel,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4226  	.set_default_key = mwifiex_cfg80211_set_default_key,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4227  	.set_power_mgmt = mwifiex_cfg80211_set_power_mgmt,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4228  	.set_tx_power = mwifiex_cfg80211_set_tx_power,
7d54bacadce17f drivers/net/wireless/marvell/mwifiex/cfg80211.c Javier Martinez Canillas 2016-06-06  4229  	.get_tx_power = mwifiex_cfg80211_get_tx_power,
5d82c53a380ca9 drivers/net/wireless/mwifiex/cfg80211.c         Yogesh Ashok Powar       2011-07-11  4230  	.set_bitrate_mask = mwifiex_cfg80211_set_bitrate_mask,
12190c5d80bd3c drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil            2012-05-08  4231  	.start_ap = mwifiex_cfg80211_start_ap,
12190c5d80bd3c drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil            2012-05-08  4232  	.stop_ap = mwifiex_cfg80211_stop_ap,
5370c83684d9e7 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil            2012-06-28  4233  	.change_beacon = mwifiex_cfg80211_change_beacon,
fa444bf88ce2ba drivers/net/wireless/mwifiex/cfg80211.c         Amitkumar Karwar         2012-03-15  4234  	.set_cqm_rssi_config = mwifiex_cfg80211_set_cqm_rssi_config,
8a279d5b4dc128 drivers/net/wireless/mwifiex/cfg80211.c         Amitkumar Karwar         2012-07-02  4235  	.set_antenna = mwifiex_cfg80211_set_antenna,
3ee712857958c2 drivers/net/wireless/marvell/mwifiex/cfg80211.c Shengzhen Li             2016-06-06  4236  	.get_antenna = mwifiex_cfg80211_get_antenna,
0f9e9b8ba72bc7 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil            2013-05-17  4237  	.del_station = mwifiex_cfg80211_del_station,
0c9b7f22e8e1f3 drivers/net/wireless/marvell/mwifiex/cfg80211.c Xinming Hu               2016-01-13  4238  	.sched_scan_start = mwifiex_cfg80211_sched_scan_start,
0c9b7f22e8e1f3 drivers/net/wireless/marvell/mwifiex/cfg80211.c Xinming Hu               2016-01-13  4239  	.sched_scan_stop = mwifiex_cfg80211_sched_scan_stop,
7da060c1c01b10 drivers/net/wireless/mwifiex/cfg80211.c         Amitkumar Karwar         2013-03-04  4240  #ifdef CONFIG_PM
7da060c1c01b10 drivers/net/wireless/mwifiex/cfg80211.c         Amitkumar Karwar         2013-03-04  4241  	.suspend = mwifiex_cfg80211_suspend,
7da060c1c01b10 drivers/net/wireless/mwifiex/cfg80211.c         Amitkumar Karwar         2013-03-04  4242  	.resume = mwifiex_cfg80211_resume,
7da060c1c01b10 drivers/net/wireless/mwifiex/cfg80211.c         Amitkumar Karwar         2013-03-04  4243  	.set_wakeup = mwifiex_cfg80211_set_wakeup,
f6b1cbe029f682 drivers/net/wireless/marvell/mwifiex/cfg80211.c Ganapathi Bhat           2016-04-05  4244  	.set_rekey_data = mwifiex_set_rekey_data,
7da060c1c01b10 drivers/net/wireless/mwifiex/cfg80211.c         Amitkumar Karwar         2013-03-04  4245  #endif
d1e2586f484dfc drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2013-08-09  4246  	.set_coalesce = mwifiex_cfg80211_set_coalesce,
b23bce29656801 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil            2014-02-07 @4247  	.tdls_mgmt = mwifiex_cfg80211_tdls_mgmt,
429d90d2212b56 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil            2014-02-07  4248  	.tdls_oper = mwifiex_cfg80211_tdls_oper,
b04975970676d7 drivers/net/wireless/mwifiex/cfg80211.c         Xinming Hu               2015-06-22  4249  	.tdls_channel_switch = mwifiex_cfg80211_tdls_chan_switch,
b04975970676d7 drivers/net/wireless/mwifiex/cfg80211.c         Xinming Hu               2015-06-22  4250  	.tdls_cancel_channel_switch = mwifiex_cfg80211_tdls_cancel_chan_switch,
e48e0de0053f07 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil            2014-02-07  4251  	.add_station = mwifiex_cfg80211_add_station,
1f4dfd8a1e911c drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil            2014-02-07  4252  	.change_station = mwifiex_cfg80211_change_station,
3935ccc14d2c68 drivers/net/wireless/marvell/mwifiex/cfg80211.c Xinming Hu               2016-09-02  4253  	CFG80211_TESTMODE_CMD(mwifiex_tm_cmd)
7ee38bf4edeac8 drivers/net/wireless/mwifiex/cfg80211.c         Xinming Hu               2015-06-03  4254  	.get_channel = mwifiex_cfg80211_get_channel,
85afb18621be39 drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil            2015-01-28  4255  	.start_radar_detection = mwifiex_cfg80211_start_radar_detection,
7d652034d1a08b drivers/net/wireless/mwifiex/cfg80211.c         Avinash Patil            2015-01-28  4256  	.channel_switch = mwifiex_cfg80211_channel_switch,
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4257  };
5e6e3a92b9a4c9 drivers/net/wireless/mwifiex/cfg80211.c         Bing Zhao                2011-03-21  4258  

:::::: The code at line 4247 was first introduced by commit
:::::: b23bce296568011b76c27103032dea5a90291d8a mwifiex: add tdls_mgmt handler support

:::::: TO: Avinash Patil <patila@marvell.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
