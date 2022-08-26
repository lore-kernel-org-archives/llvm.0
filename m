Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B8F28E8
	for <llvm@lists.linux.dev>; Fri, 26 Aug 2022 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661508328; x=1693044328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RT2l6I70dS2D1qFm0X2jCIsJzv3TAYMiItWXNDSgPu8=;
  b=HskdwLNI1Mp2kgfcXtrf4APxZL5R6OGmvo5JWsx6u8EF7o0MUF3D9U0I
   aF8J0oB2tSbtKeNFG+7NakGnJT8UoSBVq6eVujTcrPHNqF3cg6xjQ+pW4
   Qb2QpwrACDIuABn7W0HnCLO5O0yD/8A3Ws28vjyaI+nnyLnu4ASHl/U7g
   oATSq1iQvj5elXCqB6TGC7Aa8S1oEHjDz2E3bJ8LwBY3d3TYPQsjr9NOv
   guKP+2tddVXZ7P7AwL0vWlowlnbj3Uycux6cSslO8CuAXf4Kbp1aPeWS2
   U9xwk+DtCMK00xmpK6aRcDGVuIILWsNietgqAnJDPgoviHbXSP/w2iO0K
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="380765433"
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="380765433"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 03:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="587247174"
Received: from lkp-server02.sh.intel.com (HELO 34e741d32628) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 26 Aug 2022 03:05:26 -0700
Received: from kbuild by 34e741d32628 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRWDN-0003tW-2J;
	Fri, 26 Aug 2022 10:05:25 +0000
Date: Fri, 26 Aug 2022 18:04:36 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [peterz-queue:perf/wip.rewrite 8/8] drivers/perf/arm_pmu.c:560:21:
 error: no member named 'filter_match' in 'struct arm_pmu'
Message-ID: <202208261745.ErnwTbzL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/wip.rewrite
head:   b149fd14e2fb487c8d8b07d353421101c33bbf2b
commit: b149fd14e2fb487c8d8b07d353421101c33bbf2b [8/8] Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
config: arm64-randconfig-r021-20220823 (https://download.01.org/0day-ci/archive/20220826/202208261745.ErnwTbzL-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 5364f4940711561b8c0a549c39c654413b704c28)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=b149fd14e2fb487c8d8b07d353421101c33bbf2b
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue perf/wip.rewrite
        git checkout b149fd14e2fb487c8d8b07d353421101c33bbf2b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/perf/arm_pmu.c:560:21: error: no member named 'filter_match' in 'struct arm_pmu'
           if (ret && armpmu->filter_match)
                      ~~~~~~  ^
   drivers/perf/arm_pmu.c:561:18: error: no member named 'filter_match' in 'struct arm_pmu'
                   return armpmu->filter_match(event);
                          ~~~~~~  ^
>> drivers/perf/arm_pmu.c:888:4: error: field designator 'filter_match' does not refer to any field in type 'struct pmu'
                   .filter_match   = armpmu_filter_match,
                    ^
   3 errors generated.


vim +560 drivers/perf/arm_pmu.c

1b8873a0c6ec51 arch/arm/kernel/perf_event.c Jamie Iles   2010-02-02  547  
c904e32a69b7c7 arch/arm/kernel/perf_event.c Mark Rutland 2015-05-13  548  /*
c904e32a69b7c7 arch/arm/kernel/perf_event.c Mark Rutland 2015-05-13  549   * In heterogeneous systems, events are specific to a particular
c904e32a69b7c7 arch/arm/kernel/perf_event.c Mark Rutland 2015-05-13  550   * microarchitecture, and aren't suitable for another. Thus, only match CPUs of
c904e32a69b7c7 arch/arm/kernel/perf_event.c Mark Rutland 2015-05-13  551   * the same microarchitecture.
c904e32a69b7c7 arch/arm/kernel/perf_event.c Mark Rutland 2015-05-13  552   */
c904e32a69b7c7 arch/arm/kernel/perf_event.c Mark Rutland 2015-05-13  553  static int armpmu_filter_match(struct perf_event *event)
c904e32a69b7c7 arch/arm/kernel/perf_event.c Mark Rutland 2015-05-13  554  {
c904e32a69b7c7 arch/arm/kernel/perf_event.c Mark Rutland 2015-05-13  555  	struct arm_pmu *armpmu = to_arm_pmu(event->pmu);
c904e32a69b7c7 arch/arm/kernel/perf_event.c Mark Rutland 2015-05-13  556  	unsigned int cpu = smp_processor_id();
ca2b497253ad01 drivers/perf/arm_pmu.c       Will Deacon  2018-10-05  557  	int ret;
ca2b497253ad01 drivers/perf/arm_pmu.c       Will Deacon  2018-10-05  558  
ca2b497253ad01 drivers/perf/arm_pmu.c       Will Deacon  2018-10-05  559  	ret = cpumask_test_cpu(cpu, &armpmu->supported_cpus);
ca2b497253ad01 drivers/perf/arm_pmu.c       Will Deacon  2018-10-05 @560  	if (ret && armpmu->filter_match)
ca2b497253ad01 drivers/perf/arm_pmu.c       Will Deacon  2018-10-05  561  		return armpmu->filter_match(event);
ca2b497253ad01 drivers/perf/arm_pmu.c       Will Deacon  2018-10-05  562  
ca2b497253ad01 drivers/perf/arm_pmu.c       Will Deacon  2018-10-05  563  	return ret;
c904e32a69b7c7 arch/arm/kernel/perf_event.c Mark Rutland 2015-05-13  564  }
c904e32a69b7c7 arch/arm/kernel/perf_event.c Mark Rutland 2015-05-13  565  

:::::: The code at line 560 was first introduced by commit
:::::: ca2b497253ad01c80061a1f3ee9eb91b5d54a849 arm64: perf: Reject stand-alone CHAIN events for PMUv3

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
