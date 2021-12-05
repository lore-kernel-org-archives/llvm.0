Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A1B68
	for <llvm@lists.linux.dev>; Sun,  5 Dec 2021 04:16:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10188"; a="234673560"
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; 
   d="scan'208";a="234673560"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2021 20:16:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; 
   d="scan'208";a="461429477"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Dec 2021 20:16:19 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtiwk-000Jmy-RW; Sun, 05 Dec 2021 04:16:18 +0000
Date: Sun, 5 Dec 2021 12:15:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [PATCH 1/5] scheduler: Create SDTL_SKIP flag to skip topology
 level
Message-ID: <202112051257.nBNEtaW2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

In-Reply-To: <d6fe1f8972520f64c7e23d7e72fa298823813c6d.1638563225.git.tim.c.chen@linux.intel.com>
References: <d6fe1f8972520f64c7e23d7e72fa298823813c6d.1638563225.git.tim.c.chen@linux.intel.com>
TO: Tim Chen <tim.c.chen@linux.intel.com>
TO: Peter Zijlstra <peterz@infradead.org>
CC: Tim Chen <tim.c.chen@linux.intel.com>
CC: Arjan Van De Ven <arjan.van.de.ven@intel.com>
CC: Ricardo Neri <ricardo.neri@intel.com>
CC: Len Brown <len.brown@intel.com>
CC: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
CC: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
CC: Chen Yu <yu.c.chen@intel.com>
CC: Song Bao Hua <song.bao.hua@hisilicon.com>
CC: yangyicong <yangyicong@huawei.com>

Hi Tim,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tip/x86/core driver-core/driver-core-testing linus/master v5.16-rc3 next-20211203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tim-Chen/Make-Cluster-Scheduling-Configurable/20211204-053244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 8c92606ab81086db00cbb73347d124b4eb169b7e
config: x86_64-randconfig-a001-20211204 (https://download.01.org/0day-ci/archive/20211205/202112051257.nBNEtaW2-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/658a2785384667df007d97134a2e559933b45931
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tim-Chen/Make-Cluster-Scheduling-Configurable/20211204-053244
        git checkout 658a2785384667df007d97134a2e559933b45931
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   kernel/sched/topology.c:23:20: warning: unused function 'sched_debug' [-Wunused-function]
   static inline bool sched_debug(void)
                      ^
   1 warning generated.
>> kernel/sched/topology.o: warning: objtool: build_sched_domains()+0x3d9c: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
