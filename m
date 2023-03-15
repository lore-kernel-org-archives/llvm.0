Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDBE3C02;
	Wed, 15 Mar 2023 12:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678882441; x=1710418441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lP0ntLj/eggGVFXcTENtJn493fDFl2BG9qwYUPuYyxs=;
  b=JOZwaRJzmCE3hR5rQ/LCnGku6qcK5BlRxDHSVvuB711EXa2J6J3V1F/m
   twhmOLY5oAvHGEZ4FwBGairoCwxr44itgXCJXwzpBOjFALdBk075RFTLL
   5weLVZdEDwt5O7sUmPtWRlr5/vnxt/N5xd7NxxcxCXkdWoaqeGGpOyylB
   oHqDDJc1q6wAAj7uH6TMR3MpipDMVRefO2/+JjSAeJdypQaKHUhhJPjQk
   yVr5Rg0n7zfYL1UDDLLRY3dWRuAMj8bjD2STRa3fHsxqLcgknEMtVkTrG
   nXarvugQEOx7+bj2G+uhWFh2FRT1QDgB41DEK+EynHk5YCvVPZ5L2cNmQ
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="335170384"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="335170384"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 05:13:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="803264961"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="803264961"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Mar 2023 05:13:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcQ0m-0007eZ-35;
	Wed, 15 Mar 2023 12:13:44 +0000
Date: Wed, 15 Mar 2023 20:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Qais Yousef (Google)" <qyousef@layalina.io>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [linux-stable-rc:queue/5.10 96/108] kernel/sched/sched.h:2560:22:
 error: no member named 'cpu_capacity_inverted' in 'struct rq'
Message-ID: <202303152040.QoTm3sJv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   e6a15a9d1bcf661f6bb79a1c2dce0c796234ac80
commit: db4f76185823d00afb688cbd63fdf7200de209ea [96/108] sched/fair: Detect capacity inversion
config: x86_64-randconfig-a012-20230313 (https://download.01.org/0day-ci/archive/20230315/202303152040.QoTm3sJv-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=db4f76185823d00afb688cbd63fdf7200de209ea
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout db4f76185823d00afb688cbd63fdf7200de209ea
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303152040.QoTm3sJv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/core.c:13:
>> kernel/sched/sched.h:2560:22: error: no member named 'cpu_capacity_inverted' in 'struct rq'
           return cpu_rq(cpu)->cpu_capacity_inverted;
                  ~~~~~~~~~~~  ^
   1 error generated.


vim +2560 kernel/sched/sched.h

  2544	
  2545	/*
  2546	 * Returns inverted capacity if the CPU is in capacity inversion state.
  2547	 * 0 otherwise.
  2548	 *
  2549	 * Capacity inversion detection only considers thermal impact where actual
  2550	 * performance points (OPPs) gets dropped.
  2551	 *
  2552	 * Capacity inversion state happens when another performance domain that has
  2553	 * equal or lower capacity_orig_of() becomes effectively larger than the perf
  2554	 * domain this CPU belongs to due to thermal pressure throttling it hard.
  2555	 *
  2556	 * See comment in update_cpu_capacity().
  2557	 */
  2558	static inline unsigned long cpu_in_capacity_inversion(int cpu)
  2559	{
> 2560		return cpu_rq(cpu)->cpu_capacity_inverted;
  2561	}
  2562	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
