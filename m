Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F85AA94F;
	Tue, 31 Jan 2023 21:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675201410; x=1706737410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N5pKVjnRbm/AFcF4+8mvc6nK/cwX4hjfN+puOvUUt58=;
  b=J4fMcKGhhXD0GVNmJNbH3Rw6i2duzaylwK2sopp1bKE+iBHU7z079nms
   dhvc6ZH6pYXgVQ3kOyzUzscWaHUapR24I/2SbTDQjmh/JEvY9PCF/PZE/
   UGcJyNb4vod2mm7pc4vrIs06F1eLTuRjgReiW5Lqlt1Z6s5l+r2L9dlbV
   d2Te2MkEewSgCdQJG47GyymPdo9yf4CyK+avWNqDeZk3mG7W+yxcYti2s
   H+AR9/HSDhHC/F+sUyC0d6w7tZAHu0q1ODQA8IuuUkt753ivBcwzVsXy4
   dGNHRywKROw3FPHShc1sfCMxcmI8eTLsqWqawvkLFVjSO6u1O7ALTgJaC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="414178673"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="414178673"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 13:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="614608311"
X-IronPort-AV: E=Sophos;i="5.97,261,1669104000"; 
   d="scan'208";a="614608311"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 31 Jan 2023 13:43:26 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMyPV-0004j6-2W;
	Tue, 31 Jan 2023 21:43:25 +0000
Date: Wed, 1 Feb 2023 05:42:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/rt-throttle 2/3] kernel/sched/rt.c:1322:2: error: must
 use 'struct' tag to refer to type 'rt_rq'
Message-ID: <202302010534.mQzfWMsK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/rt-throttle
head:   43445d190f0aaee241b3ba09ae5f196d54d0f1b5
commit: c9c5078dcd7dfce0cc79f320335f7dc345570981 [2/3] sched/rt: Track the number of immediate running rt_se
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230201/202302010534.mQzfWMsK-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=c9c5078dcd7dfce0cc79f320335f7dc345570981
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern sched/rt-throttle
        git checkout c9c5078dcd7dfce0cc79f320335f7dc345570981
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
>> kernel/sched/rt.c:1322:2: error: must use 'struct' tag to refer to type 'rt_rq'
           rt_rq->rt_se_running--;
           ^
           struct 
>> kernel/sched/rt.c:1322:7: error: expected identifier or '('
           rt_rq->rt_se_running--;
                ^
   2 errors generated.


vim +1322 kernel/sched/rt.c

  1314	
  1315	static void __delist_rt_entity(struct sched_rt_entity *rt_se, struct rt_prio_array *array)
  1316	{
  1317		list_del_init(&rt_se->run_list);
  1318	
  1319		if (list_empty(array->queue + rt_se_prio(rt_se)))
  1320			__clear_bit(rt_se_prio(rt_se), array->bitmap);
  1321	
> 1322		rt_rq->rt_se_running--;
  1323		rt_se->on_list = 0;
  1324	}
  1325	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
