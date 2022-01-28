Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D132C9E
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 11:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643368096; x=1674904096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fDZOKESPgVeaUsBhwCohnVG42X85+ylvqRZHNE4n3ww=;
  b=Gi28kS3pm/ZvXSfsPxfpsU74lNuAh1XMGLvh0ss6KFF9c6KpMlt73SWC
   EjSPv3cHiyPRaKdhp92Jt3A6YHltLfd0Z5zwanufVfojcX9K6xSc2DYrl
   0c5cjhGQuZt2zXkHsgkw8I1POAHNeevgYUlEHE6V6yP0r+roNBKEJ+Jgr
   XCrZeWDCL/o9tR3moSP2/36UIFuNSn7IpN5BV4XVsxNy4xEBqojCIg5bx
   HKqDEcwSyH2lbi48k8t66WFAXkWbGsxSpDeZAlc7MAhNbu40RHMTlhIaI
   75Qf1XoDzJzvVwc/64fQDY1X9CgO7eQ5NSWW/8Y7PgIPIcgcf3eE6Pj3e
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="307815519"
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; 
   d="scan'208";a="307815519"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2022 03:08:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,323,1635231600"; 
   d="scan'208";a="697060468"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Jan 2022 03:08:14 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDP6z-000Nld-Kh; Fri, 28 Jan 2022 11:08:13 +0000
Date: Fri, 28 Jan 2022 19:07:42 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	GNU/Weeb Mailing List <gwml@gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev 94/94]
 kernel/rcu/srcutree.c:313:6: warning: no previous prototype for function
 'spin_lock_irqsave_ssp_contention'
Message-ID: <202201281920.PD1buizH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev
head:   903a93309e5a59497d3c178cabb67ecc6c843a69
commit: 903a93309e5a59497d3c178cabb67ecc6c843a69 [94/94] srcu: Add contention-triggered addition of srcu_node tree
config: arm-s5pv210_defconfig (https://download.01.org/0day-ci/archive/20220128/202201281920.PD1buizH-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/903a93309e5a59497d3c178cabb67ecc6c843a69
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev
        git checkout 903a93309e5a59497d3c178cabb67ecc6c843a69
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/rcu/srcutree.c:313:6: warning: no previous prototype for function 'spin_lock_irqsave_ssp_contention' [-Wmissing-prototypes]
   void spin_lock_irqsave_ssp_contention(struct srcu_struct *ssp, unsigned long *flags)
        ^
   kernel/rcu/srcutree.c:313:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void spin_lock_irqsave_ssp_contention(struct srcu_struct *ssp, unsigned long *flags)
   ^
   static 
   1 warning generated.


vim +/spin_lock_irqsave_ssp_contention +313 kernel/rcu/srcutree.c

   306	
   307	/*
   308	 * Acquire the specified srcu_struct structure's ->lock, but check for
   309	 * excessive contention, which results in initiation of a transition
   310	 * to SRCU_SIZE_BIG.  But only if the srcutree.convert_to_big module
   311	 * parameter permits this.
   312	 */
 > 313	void spin_lock_irqsave_ssp_contention(struct srcu_struct *ssp, unsigned long *flags)
   314	{
   315		unsigned long j;
   316	
   317		if (spin_trylock_irqsave_rcu_node(ssp, *flags))
   318			return;
   319		spin_lock_irqsave_rcu_node(ssp, *flags);
   320		if (!(convert_to_big & 0x10) || ssp->srcu_size_state)
   321			return;
   322		j = jiffies;
   323		if (ssp->srcu_size_jiffies != j) {
   324			ssp->srcu_size_jiffies = j;
   325			ssp->srcu_n_lock_retries = 0;
   326		}
   327		if (++ssp->srcu_n_lock_retries <= small_contention_lim)
   328			return;
   329		__srcu_transition_to_big(ssp);
   330	}
   331	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
