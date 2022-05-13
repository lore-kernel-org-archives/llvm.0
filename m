Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5D52598
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652441682; x=1683977682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RXfsKO0LSh69xJrO0LkwO1HcUpg+7526NohhqiMOFTA=;
  b=F6zRKgSsD1sR1iDQ06ayxYmm8a/IHjktdO5sjnEz4CopKXOc71r2SSkm
   6vzfD0tq6DBu/7fHst1Rm/yPtPSaBP/KlnoO5ZCO/4W8+5IjIxIGJVQcC
   p359srxyNjM7Z5FzOVYNJQFMMa1DdUJAXFd459TnhxDY5/EP273pxWxxA
   B1QGO6Dkg3P6NhvGskYbltvAz3MH7Pqpbsz5QtRJiyKdsDyL+4ijIM7Xz
   7DGv88zRLt+tSSUBdmteW09J/dFzzEcPJqhmLzBHvfLt8927ouMg0eD8a
   fa28LnpJBZvjiV++0KcELm90HeWs0nYoUSdtUlhnOQEDXQDC1uk/7PySA
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="267878337"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="267878337"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 04:34:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="740123180"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 13 May 2022 04:34:37 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npTZ6-000Lh2-J0;
	Fri, 13 May 2022 11:34:36 +0000
Date: Fri, 13 May 2022 19:33:56 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Don <joshdon@google.com>, Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-kernel@vger.kernel.org,
	Cruz Zhao <CruzZhao@linux.alibaba.com>, Tejun Heo <tj@kernel.org>,
	Josh Don <joshdon@google.com>
Subject: Re: [PATCH] sched/core: add forced idle accounting for cgroups
Message-ID: <202205131951.zAnitpiH-lkp@intel.com>
References: <20220513005427.2507335-1-joshdon@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220513005427.2507335-1-joshdon@google.com>

Hi Josh,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on tip/master linux/master linus/master v5.18-rc6 next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Josh-Don/sched-core-add-forced-idle-accounting-for-cgroups/20220513-085621
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 734387ec2f9d77b00276042b1fa7c95f48ee879d
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220513/202205131951.zAnitpiH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519dacab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/21dca7763777c1985d6f5ac289e6e0c20d429d05
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Josh-Don/sched-core-add-forced-idle-accounting-for-cgroups/20220513-085621
        git checkout 21dca7763777c1985d6f5ac289e6e0c20d429d05
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __udivdi3
   >>> referenced by core.c
   >>>               sched/core.o:(cpu_extra_stat_show) in archive kernel/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
