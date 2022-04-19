Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6261BA2A
	for <llvm@lists.linux.dev>; Tue, 19 Apr 2022 02:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650333854; x=1681869854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cy4RBDRq3Z1jUYH3+htvSnG5PZeChy9u/sV+BySmM+E=;
  b=jyxeT7M1leDu28P+la+Yj27Kxw0QCn6w029+fiu2g+a1wtL1DHEwlmyN
   Q8tEqIiEi1vdxyVLE08ktZCOj2CH5kSMRxvfSKVDxKVR8dzJA4tUqbAOA
   WirwvGdOjX0IXWUbHy3gjzSbQ66oXDKxSNk8vkVrgphJkvOxEgxFDE7Ns
   xBbmqv5+ValiK7ODVDoRhcx2gTRzPD96uSlbvBjXL4MzbIRB6pMWxJkgP
   /MBghinrBcPT+WSIwZnumZJQxClAJ29PY+Zi9vDUdZamkW+Dj8Bbs8HOz
   AUSZCY82jW4kg2drEPT8ZknpKnnt9roUmwyNj0/Bx8jG62U8iTcr1Azf/
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="262513404"
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="262513404"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 19:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="529108189"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Apr 2022 19:04:12 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngdDv-0005Bg-C0;
	Tue, 19 Apr 2022 02:04:11 +0000
Date: Tue, 19 Apr 2022 10:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH rcu 08/11] srcu: Drop needless initialization of sdp in
 srcu_gp_start()
Message-ID: <202204191057.dy5dzVNo-lkp@intel.com>
References: <20220418225359.3945217-8-paulmck@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220418225359.3945217-8-paulmck@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Paul,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on linux/master v5.18-rc3]
[cannot apply to paulmck-rcu/dev paulmck-rcu/rcu/next next-20220414]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Paul-E-McKenney/Miscellaneous-fixes-for-v5-19/20220419-065730
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b2d229d4ddb17db541098b83524d901257e93845
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220419/202204191057.dy5dzVNo-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/375cc5ddcf9646bfab6ec257cfa297439ed15273
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Paul-E-McKenney/Miscellaneous-fixes-for-v5-19/20220419-065730
        git checkout 375cc5ddcf9646bfab6ec257cfa297439ed15273
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/rcu/srcutree.c:443:25: warning: variable 'sdp' is uninitialized when used here [-Wuninitialized]
           rcu_segcblist_advance(&sdp->srcu_cblist,
                                  ^~~
   kernel/rcu/srcutree.c:437:23: note: initialize the variable 'sdp' to silence this warning
           struct srcu_data *sdp;
                                ^
                                 = NULL
   1 warning generated.


vim +/sdp +443 kernel/rcu/srcutree.c

dad81a2026841b Paul E. McKenney 2017-03-25  431  
dad81a2026841b Paul E. McKenney 2017-03-25  432  /*
dad81a2026841b Paul E. McKenney 2017-03-25  433   * Start an SRCU grace period.
dad81a2026841b Paul E. McKenney 2017-03-25  434   */
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  435  static void srcu_gp_start(struct srcu_struct *ssp)
dad81a2026841b Paul E. McKenney 2017-03-25  436  {
375cc5ddcf9646 Lukas Bulwahn    2022-04-18  437  	struct srcu_data *sdp;
dad81a2026841b Paul E. McKenney 2017-03-25  438  	int state;
dad81a2026841b Paul E. McKenney 2017-03-25  439  
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  440  	lockdep_assert_held(&ACCESS_PRIVATE(ssp, lock));
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  441  	WARN_ON_ONCE(ULONG_CMP_GE(ssp->srcu_gp_seq, ssp->srcu_gp_seq_needed));
eb4c2382272ae7 Dennis Krein     2018-10-26  442  	spin_lock_rcu_node(sdp);  /* Interrupts already disabled. */
da915ad5cf25b5 Paul E. McKenney 2017-04-05 @443  	rcu_segcblist_advance(&sdp->srcu_cblist,
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  444  			      rcu_seq_current(&ssp->srcu_gp_seq));
da915ad5cf25b5 Paul E. McKenney 2017-04-05  445  	(void)rcu_segcblist_accelerate(&sdp->srcu_cblist,
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  446  				       rcu_seq_snap(&ssp->srcu_gp_seq));
eb4c2382272ae7 Dennis Krein     2018-10-26  447  	spin_unlock_rcu_node(sdp);  /* Interrupts remain disabled. */
2da4b2a7fd8de5 Paul E. McKenney 2017-04-25  448  	smp_mb(); /* Order prior store to ->srcu_gp_seq_needed vs. GP start. */
aacb5d91ab1bfb Paul E. McKenney 2018-10-28  449  	rcu_seq_start(&ssp->srcu_gp_seq);
710426068dc60f Paul E. McKenney 2020-01-03  450  	state = rcu_seq_state(ssp->srcu_gp_seq);
dad81a2026841b Paul E. McKenney 2017-03-25  451  	WARN_ON_ONCE(state != SRCU_STATE_SCAN1);
dad81a2026841b Paul E. McKenney 2017-03-25  452  }
dad81a2026841b Paul E. McKenney 2017-03-25  453  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
