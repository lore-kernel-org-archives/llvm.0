Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B7A8C11;
	Sat, 15 Jul 2023 21:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689457749; x=1720993749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dWbob4Vhsn6kbSP2Xy0DcGFHiJMC4Zqa0BnJAm8qAyU=;
  b=IU9K/wTg6gB2d4Ra2cl0BsMSuiH/AP7P0HTxMBgSu8y8/UIqEvp4bu8g
   XLU2aQ8jhi+9L/NVvWP1KKt4EHtXOzApRXrhu9psG61KL321/0WmGIOQn
   bu4tYIstB8E6ZuBKStJNwCZSz2QcRw6NNRNuyuBFq4SipVm8lY1G2MdfQ
   ViWl/IKG89ZEWjYLrDgXsJ5dzv8QiucnrkyEuA/NqLeU8sS2TY8tQjAHZ
   ZUXrmbDhlwmRK9x+UWZ5zmf8O6ZONDfbgMgmcqZZ1YkLtpqcc5cypCfGS
   KYHGw9/oeO0gWgEl3+sRcTKU74w/Klrd2RDvjB5emXZMpqYstwJ/3USJ+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="350569832"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="350569832"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 14:49:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="969386258"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="969386258"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Jul 2023 14:49:07 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKn8U-0008Ne-0M;
	Sat, 15 Jul 2023 21:49:06 +0000
Date: Sun, 16 Jul 2023 05:48:29 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: net/mac80211/rx.c:4062:13: warning: stack frame size (10656) exceeds
 limit (8192) in 'ieee80211_rx_handlers'
Message-ID: <202307160536.eNpCzzGh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   831fe284d8275987596b7d640518dddba5735f61
commit: baa951a1c1771810f3a378a95fc93e81953027d5 mac80211: use the new drop reasons infrastructure
date:   3 months ago
config: riscv-randconfig-r021-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160536.eNpCzzGh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160536.eNpCzzGh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160536.eNpCzzGh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/mac80211/rx.c:4062:13: warning: stack frame size (10656) exceeds limit (8192) in 'ieee80211_rx_handlers' [-Wframe-larger-than]
   static void ieee80211_rx_handlers(struct ieee80211_rx_data *rx,
               ^
   1 warning generated.


vim +/ieee80211_rx_handlers +4062 net/mac80211/rx.c

aa0c86364f925c Christian Lamparter 2010-08-05  4061  
f9e124fbd8cbea Christian Lamparter 2013-02-04 @4062  static void ieee80211_rx_handlers(struct ieee80211_rx_data *rx,
f9e124fbd8cbea Christian Lamparter 2013-02-04  4063  				  struct sk_buff_head *frames)
aa0c86364f925c Christian Lamparter 2010-08-05  4064  {
aa0c86364f925c Christian Lamparter 2010-08-05  4065  	ieee80211_rx_result res = RX_DROP_MONITOR;
aa0c86364f925c Christian Lamparter 2010-08-05  4066  	struct sk_buff *skb;
8944b79fe9b1fe Johannes Berg       2008-01-31  4067  

:::::: The code at line 4062 was first introduced by commit
:::::: f9e124fbd8cbea974b5dc7e9dafddd17d21df7e2 mac80211: protect rx-path with spinlock

:::::: TO: Christian Lamparter <chunkeey@googlemail.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
