Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F2BA23
	for <llvm@lists.linux.dev>; Tue, 19 Apr 2022 03:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30CB4C385A7;
	Tue, 19 Apr 2022 03:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650338716;
	bh=UqM/hgA6B6cqEi+M+jUJMPG4V76AYj2j0wMKZiopQOg=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=LB9fyQ+OHrqA7VjF743yv3RzNvIPzcMTam0jPDklbcUGINGnAT/LCK/p78Hzlzmb8
	 ZkjxCdfYIL4LxLagL6DTIf4NO45BYhLwevb4alcHA/txnOtQ6r0q5uwY+k738YuoPF
	 4MSS+byJ7hQBN8R7fcYdHKYbyqsBtdFljFZsK4kR0S61oS+C6V443rMyG1dchX1YtX
	 Qvf28B1LK+DIoCrsNhBTk/AyB/gEvo8UA2RtGd6li5tZWHnrrSURpvgMFpJ1wt+FWa
	 ghXzVizESuZSdf3zsBlYVDeQbZecrVhXumtAvxQsVyCSwrVNqDUSTCSdrL5QDFemQj
	 Rm/ZBEUCbxlew==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D1BF85C0A23; Mon, 18 Apr 2022 20:25:15 -0700 (PDT)
Date: Mon, 18 Apr 2022 20:25:15 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH rcu 08/11] srcu: Drop needless initialization of sdp in
 srcu_gp_start()
Message-ID: <20220419032515.GA4285@paulmck-ThinkPad-P17-Gen-1>
Reply-To: paulmck@kernel.org
References: <20220418225359.3945217-8-paulmck@kernel.org>
 <202204191057.dy5dzVNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202204191057.dy5dzVNo-lkp@intel.com>

On Tue, Apr 19, 2022 at 10:03:17AM +0800, kernel test robot wrote:
> Hi "Paul,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on linus/master]
> [also build test WARNING on linux/master v5.18-rc3]
> [cannot apply to paulmck-rcu/dev paulmck-rcu/rcu/next next-20220414]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]

I recently updated my patch-generation scripts, and they apparently
need help.  Please ignore this patch.  The 21/21 variant is the correct
version.

							Thanx, Paul

> url:    https://github.com/intel-lab-lkp/linux/commits/Paul-E-McKenney/Miscellaneous-fixes-for-v5-19/20220419-065730
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git b2d229d4ddb17db541098b83524d901257e93845
> config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220419/202204191057.dy5dzVNo-lkp@intel.com/config)
> compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/intel-lab-lkp/linux/commit/375cc5ddcf9646bfab6ec257cfa297439ed15273
>         git remote add linux-review https://github.com/intel-lab-lkp/linux
>         git fetch --no-tags linux-review Paul-E-McKenney/Miscellaneous-fixes-for-v5-19/20220419-065730
>         git checkout 375cc5ddcf9646bfab6ec257cfa297439ed15273
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/rcu/
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
> >> kernel/rcu/srcutree.c:443:25: warning: variable 'sdp' is uninitialized when used here [-Wuninitialized]
>            rcu_segcblist_advance(&sdp->srcu_cblist,
>                                   ^~~
>    kernel/rcu/srcutree.c:437:23: note: initialize the variable 'sdp' to silence this warning
>            struct srcu_data *sdp;
>                                 ^
>                                  = NULL
>    1 warning generated.
> 
> 
> vim +/sdp +443 kernel/rcu/srcutree.c
> 
> dad81a2026841b Paul E. McKenney 2017-03-25  431  
> dad81a2026841b Paul E. McKenney 2017-03-25  432  /*
> dad81a2026841b Paul E. McKenney 2017-03-25  433   * Start an SRCU grace period.
> dad81a2026841b Paul E. McKenney 2017-03-25  434   */
> aacb5d91ab1bfb Paul E. McKenney 2018-10-28  435  static void srcu_gp_start(struct srcu_struct *ssp)
> dad81a2026841b Paul E. McKenney 2017-03-25  436  {
> 375cc5ddcf9646 Lukas Bulwahn    2022-04-18  437  	struct srcu_data *sdp;
> dad81a2026841b Paul E. McKenney 2017-03-25  438  	int state;
> dad81a2026841b Paul E. McKenney 2017-03-25  439  
> aacb5d91ab1bfb Paul E. McKenney 2018-10-28  440  	lockdep_assert_held(&ACCESS_PRIVATE(ssp, lock));
> aacb5d91ab1bfb Paul E. McKenney 2018-10-28  441  	WARN_ON_ONCE(ULONG_CMP_GE(ssp->srcu_gp_seq, ssp->srcu_gp_seq_needed));
> eb4c2382272ae7 Dennis Krein     2018-10-26  442  	spin_lock_rcu_node(sdp);  /* Interrupts already disabled. */
> da915ad5cf25b5 Paul E. McKenney 2017-04-05 @443  	rcu_segcblist_advance(&sdp->srcu_cblist,
> aacb5d91ab1bfb Paul E. McKenney 2018-10-28  444  			      rcu_seq_current(&ssp->srcu_gp_seq));
> da915ad5cf25b5 Paul E. McKenney 2017-04-05  445  	(void)rcu_segcblist_accelerate(&sdp->srcu_cblist,
> aacb5d91ab1bfb Paul E. McKenney 2018-10-28  446  				       rcu_seq_snap(&ssp->srcu_gp_seq));
> eb4c2382272ae7 Dennis Krein     2018-10-26  447  	spin_unlock_rcu_node(sdp);  /* Interrupts remain disabled. */
> 2da4b2a7fd8de5 Paul E. McKenney 2017-04-25  448  	smp_mb(); /* Order prior store to ->srcu_gp_seq_needed vs. GP start. */
> aacb5d91ab1bfb Paul E. McKenney 2018-10-28  449  	rcu_seq_start(&ssp->srcu_gp_seq);
> 710426068dc60f Paul E. McKenney 2020-01-03  450  	state = rcu_seq_state(ssp->srcu_gp_seq);
> dad81a2026841b Paul E. McKenney 2017-03-25  451  	WARN_ON_ONCE(state != SRCU_STATE_SCAN1);
> dad81a2026841b Paul E. McKenney 2017-03-25  452  }
> dad81a2026841b Paul E. McKenney 2017-03-25  453  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://01.org/lkp
