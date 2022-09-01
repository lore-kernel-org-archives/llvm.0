Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5B823D7
	for <llvm@lists.linux.dev>; Thu,  1 Sep 2022 12:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662036632; x=1693572632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DlIMpYko/Y2Es4sT+Pe1aXFnnl85LOJ8PPDtIU9pU9M=;
  b=JjVMnfB/QJBFyeohLQmsqi6P3vwlpnt8GXtg3g0RRchwRDKundGlT2WL
   UC0DNNB6UOdAoSLLEQt6wTn//9rqb9GiJOYi5xIiPLTDx8DRlCR0Um8GT
   cA13TLe1Mt0f/wE313a06x294M+v/Vf/Yye7f12tA9+Hm4/nPmdoCNrx8
   qGO8OtdZqtIAKnmyPrdvV85+568qZkWdyAcf3qM1Qe6zxrNTfNS4ZSYX7
   VMBqZF7ATuxAc7VLad2hzjjvHLqPRz8RA/rzHpgNqXNvippX6a4qAjAwt
   ObZ4rvHuv5mBCCk16fjoayB8Rzdv4pkn5BW13n48Boj1xeG/cN9KGZ3KC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="275451936"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="275451936"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2022 05:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="754809905"
Received: from lkp-server02.sh.intel.com (HELO b138c9e8658c) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2022 05:50:30 -0700
Received: from kbuild by b138c9e8658c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oTjeP-0000Ih-2T;
	Thu, 01 Sep 2022 12:50:29 +0000
Date: Thu, 1 Sep 2022 20:49:48 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:wireless/wireless-next/mld-wip 16/20]
 drivers/net/wireless/st/cw1200/sta.c:198:58: error: too few arguments to
 function call, expected 4, have 3
Message-ID: <202209012046.5sg4d0qh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block wireless/wireless-next/mld-wip
head:   10cf17b0508f56ee45e15ad2a612b64999264d4f
commit: 60286c25de214ab636d7af34c4c05db0023fd827 [16/20] wifi: mac80211: extend ieee80211_nullfunc_get() for MLO
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20220901/202209012046.5sg4d0qh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/60286c25de214ab636d7af34c4c05db0023fd827
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block wireless/wireless-next/mld-wip
        git checkout 60286c25de214ab636d7af34c4c05db0023fd827
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/wireless/st/cw1200/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/wireless/st/cw1200/sta.c:198:58: error: too few arguments to function call, expected 4, have 3
                   skb = ieee80211_nullfunc_get(priv->hw, priv->vif, false);
                         ~~~~~~~~~~~~~~~~~~~~~~                           ^
   include/net/mac80211.h:5319:17: note: 'ieee80211_nullfunc_get' declared here
   struct sk_buff *ieee80211_nullfunc_get(struct ieee80211_hw *hw,
                   ^
   drivers/net/wireless/st/cw1200/sta.c:2266:63: error: too few arguments to function call, expected 4, have 3
           frame.skb = ieee80211_nullfunc_get(priv->hw, priv->vif, false);
                       ~~~~~~~~~~~~~~~~~~~~~~                           ^
   include/net/mac80211.h:5319:17: note: 'ieee80211_nullfunc_get' declared here
   struct sk_buff *ieee80211_nullfunc_get(struct ieee80211_hw *hw,
                   ^
   2 errors generated.


vim +198 drivers/net/wireless/st/cw1200/sta.c

a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  146  
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  147  
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  148  void __cw1200_cqm_bssloss_sm(struct cw1200_common *priv,
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  149  			     int init, int good, int bad)
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  150  {
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  151  	int tx = 0;
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  152  
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  153  	priv->delayed_link_loss = 0;
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  154  	cancel_work_sync(&priv->bss_params_work);
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  155  
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  156  	pr_debug("[STA] CQM BSSLOSS_SM: state: %d init %d good %d bad: %d txlock: %d uj: %d\n",
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  157  		 priv->bss_loss_state,
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  158  		 init, good, bad,
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  159  		 atomic_read(&priv->tx_lock),
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  160  		 priv->delayed_unjoin);
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  161  
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  162  	/* If we have a pending unjoin */
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  163  	if (priv->delayed_unjoin)
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  164  		return;
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  165  
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  166  	if (init) {
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  167  		queue_delayed_work(priv->workqueue,
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  168  				   &priv->bss_loss_work,
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  169  				   HZ);
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  170  		priv->bss_loss_state = 0;
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  171  
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  172  		/* Skip the confimration procedure in P2P case */
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  173  		if (!priv->vif->p2p && !atomic_read(&priv->tx_lock))
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  174  			tx = 1;
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  175  	} else if (good) {
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  176  		cancel_delayed_work_sync(&priv->bss_loss_work);
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  177  		priv->bss_loss_state = 0;
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  178  		queue_work(priv->workqueue, &priv->bss_params_work);
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  179  	} else if (bad) {
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  180  		/* XXX Should we just keep going until we time out? */
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  181  		if (priv->bss_loss_state < 3)
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  182  			tx = 1;
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  183  	} else {
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  184  		cancel_delayed_work_sync(&priv->bss_loss_work);
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  185  		priv->bss_loss_state = 0;
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  186  	}
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  187  
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  188  	/* Bypass mitigation if it's disabled */
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  189  	if (!cw1200_bssloss_mitigation)
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  190  		tx = 0;
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  191  
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  192  	/* Spit out a NULL packet to our AP if necessary */
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  193  	if (tx) {
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  194  		struct sk_buff *skb;
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  195  
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  196  		priv->bss_loss_state++;
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  197  
7b6ddeaf27eca72 drivers/net/wireless/st/cw1200/sta.c Johannes Berg  2017-11-21 @198  		skb = ieee80211_nullfunc_get(priv->hw, priv->vif, false);
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  199  		WARN_ON(!skb);
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  200  		if (skb)
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  201  			cw1200_tx(priv->hw, NULL, skb);
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  202  	}
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  203  }
a910e4a94f6923c drivers/net/wireless/cw1200/sta.c    Solomon Peachy 2013-05-24  204  

:::::: The code at line 198 was first introduced by commit
:::::: 7b6ddeaf27eca72795ceeae2f0f347db1b5f9a30 mac80211: use QoS NDP for AP probing

:::::: TO: Johannes Berg <johannes.berg@intel.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
