Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3CA1FD0;
	Sat,  4 Feb 2023 13:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675515768; x=1707051768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m3lkeicJn4elJsy3oGzSq+g8VYesUSZjMKagaQclHgQ=;
  b=j164/05z5doFLmYozogYhP2hwgRptIcJSu3ymyW2C4k7pUvvINIUZrxH
   /rO4ffMBHmDNY+O4kOtFtctt5Y5h71Gx8evyIvm91pszH3T3Nmf8VwZLq
   71+v6TK/auVjhK5/QFnie3q1eIcC+mDCv5m2bECOBlfbKLdQfS/tTkR0S
   xxxvB12EefOpDDS9Gjwh+r4lq57v7ALqZYK0JkUI/NpAbhRsIWh3W6sdA
   X7KHR0fqqR7Q4wysnUcPZ31UYmXjXjXUMIJF2PlyLbyy3ouB6s8AWaUjf
   1QZgWJiIzt4k/wqWBOFRj35ftqULXwKqT3G8EAJZEeot0D2RLpfTeamwI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="312598440"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="312598440"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2023 05:02:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="729546941"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="729546941"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Feb 2023 05:02:44 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOIBn-0001JU-3B;
	Sat, 04 Feb 2023 13:02:44 +0000
Date: Sat, 4 Feb 2023 21:02:02 +0800
From: kernel test robot <lkp@intel.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:mtk-test 23/39]
 drivers/gpu/drm/bridge/analogix/anx7625.c:1591:6: warning: variable 'event'
 set but not used
Message-ID: <202302042140.ICI35RL1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-test
head:   14d84237ad57de7b0f267d290ae87e40842965b4
commit: e188f8d5589fc51e365bafe7210b281174a54b76 [23/39] drm/bridge: anx7625: Drop device lock before drm_helper_hpd_irq_event()
config: i386-randconfig-a006 (https://download.01.org/0day-ci/archive/20230204/202302042140.ICI35RL1-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git/commit/?id=e188f8d5589fc51e365bafe7210b281174a54b76
        git remote add wens https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git
        git fetch --no-tags wens mtk-test
        git checkout e188f8d5589fc51e365bafe7210b281174a54b76
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/bridge/analogix/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/analogix/anx7625.c:1591:6: warning: variable 'event' set but not used [-Wunused-but-set-variable]
           int event;
               ^
   1 warning generated.


vim +/event +1591 drivers/gpu/drm/bridge/analogix/anx7625.c

8bdfc5dae4e3ba Xin Ji       2020-09-18  1588  
8bdfc5dae4e3ba Xin Ji       2020-09-18  1589  static void anx7625_work_func(struct work_struct *work)
8bdfc5dae4e3ba Xin Ji       2020-09-18  1590  {
8bdfc5dae4e3ba Xin Ji       2020-09-18 @1591  	int event;
8bdfc5dae4e3ba Xin Ji       2020-09-18  1592  	struct anx7625_data *ctx = container_of(work,
8bdfc5dae4e3ba Xin Ji       2020-09-18  1593  						struct anx7625_data, work);
8bdfc5dae4e3ba Xin Ji       2020-09-18  1594  
8bdfc5dae4e3ba Xin Ji       2020-09-18  1595  	mutex_lock(&ctx->lock);
60487584a79abd Pi-Hsun Shih 2021-05-17  1596  
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1597  	if (pm_runtime_suspended(&ctx->client->dev)) {
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1598  		mutex_unlock(&ctx->lock);
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1599  		return;
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1600  	}
60487584a79abd Pi-Hsun Shih 2021-05-17  1601  
8bdfc5dae4e3ba Xin Ji       2020-09-18  1602  	event = anx7625_hpd_change_detect(ctx);
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1603  
e188f8d5589fc5 Chen-Yu Tsai 2023-01-16  1604  	mutex_unlock(&ctx->lock);
8bdfc5dae4e3ba Xin Ji       2020-09-18  1605  
8bdfc5dae4e3ba Xin Ji       2020-09-18  1606  	if (ctx->bridge_attached)
8bdfc5dae4e3ba Xin Ji       2020-09-18  1607  		drm_helper_hpd_irq_event(ctx->bridge.dev);
8bdfc5dae4e3ba Xin Ji       2020-09-18  1608  }
8bdfc5dae4e3ba Xin Ji       2020-09-18  1609  

:::::: The code at line 1591 was first introduced by commit
:::::: 8bdfc5dae4e3ba4d99dfb430ef43249e5f1b7730 drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP

:::::: TO: Xin Ji <xji@analogixsemi.com>
:::::: CC: Sam Ravnborg <sam@ravnborg.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
