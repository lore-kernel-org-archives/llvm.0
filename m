Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08564567F;
	Wed, 15 Mar 2023 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678901404; x=1710437404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7LOMUZAXKb5vaGx+Mieqx4b2kv/FGBRPvQdB9yX0RJU=;
  b=iKtjBgwyp3JyL0TYSFOyvjlJN1ukPF+gOPXJ2Wedm4cwH9GX6Own4VgQ
   B7RBVEHqwCCzIejdKBYU6t8jhrLuQnQ0Z/NT7Af/JYEBW/YG+q2KnRLrL
   NEDD8QrflP12ZmEx+T9bW54jU30asbKVx/XGcWzM5oqjMDFogjH857dXF
   TMb0xu14CwENlZQIY2kqi+2cI1qZpACKRFnLskOAV6EDz2jtuWayDdgeu
   fl6rLMr1En6kBdGCD6A5VtG9Py6Ck7yYRpR5SOvNfoMNkIJSU2Z1xk/Pa
   pR/ONJDzbAvfESjnD3fiq/K5codd+JUqcNT7/8tNIfGQ//pru1CkbeAgV
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="318171921"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="318171921"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 10:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="709755697"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="709755697"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Mar 2023 10:30:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcUwq-0007vD-0e;
	Wed, 15 Mar 2023 17:30:00 +0000
Date: Thu, 16 Mar 2023 01:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	"Qais Yousef (Google)" <qyousef@layalina.io>
Subject: [linux-stable-rc:linux-5.10.y 9981/9999]
 kernel/sched/sched.h:2560:22: error: no member named 'cpu_capacity_inverted'
 in 'struct rq'
Message-ID: <202303160148.SwuV7dSc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.10.y
head:   420b6d10bae34ef9aa0d118b31afec6107595e72
commit: ad3483567b602cacd53a6409ba669d09cf77af0a [9981/9999] sched/fair: Detect capacity inversion
config: mips-randconfig-r023-20230312 (https://download.01.org/0day-ci/archive/20230316/202303160148.SwuV7dSc-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=ad3483567b602cacd53a6409ba669d09cf77af0a
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.10.y
        git checkout ad3483567b602cacd53a6409ba669d09cf77af0a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160148.SwuV7dSc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/clock.c:56:
>> kernel/sched/sched.h:2560:22: error: no member named 'cpu_capacity_inverted' in 'struct rq'
           return cpu_rq(cpu)->cpu_capacity_inverted;
                  ~~~~~~~~~~~  ^
   1 error generated.
--
   In file included from kernel/sched/core.c:13:
>> kernel/sched/sched.h:2560:22: error: no member named 'cpu_capacity_inverted' in 'struct rq'
           return cpu_rq(cpu)->cpu_capacity_inverted;
                  ~~~~~~~~~~~  ^
   kernel/sched/core.c:2430:13: warning: variable 'rq' set but not used [-Wunused-but-set-variable]
           struct rq *rq;
                      ^
   1 warning and 1 error generated.


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
