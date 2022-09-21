Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E50E1365
	for <llvm@lists.linux.dev>; Wed, 21 Sep 2022 01:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663722955; x=1695258955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e26F26g8QmxrZhvE6Nka2LOszyC14tafaQA1+o5P0mM=;
  b=J7t0pDwF7OLJsR8WUT5a5xLyXE+ijTGHKX/vwt0DWRR9Uv0nbPEBElUk
   8CTV7+cDGz2toTV7wZDV/qQaGzLDW4xaMToxWQikXxFg3pl2rf59DYtG5
   niyQqlURpJAthoCL6y3nMQKerPLMaycjl+s9912/QwtRjLfM0ExafJTqJ
   KUCLCWL4H/ZufhxmH3HxNwW1GEmLZaEVVf9yr3yHo6EXKUhaXBiP3d9uL
   3cjKq1ebjXxfDEL7QCSv4HGeNpDjx/hzdCxdOB+ZGjCzTIuS/zXyas1S6
   986ewQqVoPVnwFYnBf/E59Rbb172NcYT4p60nHaJcbq2nTDkk9ucwSV4G
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="299851774"
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="299851774"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 18:15:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,332,1654585200"; 
   d="scan'208";a="947925168"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Sep 2022 18:15:53 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oaoLA-00035l-2y;
	Wed, 21 Sep 2022 01:15:52 +0000
Date: Wed, 21 Sep 2022 09:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:paulmck/linux-rcu/dev.2022.09.03a 36/36]
 kernel/rcu/srcutree.c:647:1: error: use of undeclared identifier 'u'
Message-ID: <202209210942.YUFSaizJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block paulmck/linux-rcu/dev.2022.09.03a
head:   607762184099b5d0b6765f69673fafa1d7eb4d30
commit: 607762184099b5d0b6765f69673fafa1d7eb4d30 [36/36] srcu: Check for consistent per-CPU per-srcu_struct NMI safety
config: arm-randconfig-r013-20220921 (https://download.01.org/0day-ci/archive/20220921/202209210942.YUFSaizJ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/ammarfaizi2/linux-block/commit/607762184099b5d0b6765f69673fafa1d7eb4d30
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block paulmck/linux-rcu/dev.2022.09.03a
        git checkout 607762184099b5d0b6765f69673fafa1d7eb4d30
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/rcu/srcutree.c:647:1: error: use of undeclared identifier 'u'
   u);
   ^
   1 error generated.


vim +/u +647 kernel/rcu/srcutree.c

   628	
   629	/*
   630	 * Check for consistent NMI safety.
   631	 */
   632	static void srcu_check_nmi_safety(struct srcu_struct *ssp, bool nmi_safe)
   633	{
   634		int nmi_safe_mask = 1 << nmi_safe;
   635		int old_nmi_safe_mask;
   636		struct srcu_data *sdp;
   637	
   638		if (!IS_ENABLED(CONFIG_PROVE_RCU))
   639			return;
   640		sdp = raw_cpu_ptr(ssp->sda);
   641		old_nmi_safe_mask = READ_ONCE(sdp->srcu_nmi_safety);
   642		if (!old_nmi_safe_mask) {
   643			WRITE_ONCE(sdp->srcu_nmi_safety, nmi_safe_mask);
   644			return;
   645		}
   646		WARN_ONCE(old_nmi_safe_mask != nmi_safe_mask, "CPU %d old state %d new state %d\n", sdp->cpu, old_nmi_safe_mask, nmi_safe_mask);
 > 647	u);
   648	}
   649	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
