Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC33168
	for <llvm@lists.linux.dev>; Sat,  8 Jan 2022 11:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641639836; x=1673175836;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cI5lIDdhogBwStWiVae+zo7CMgHiA7QbJeKQbKjxHAw=;
  b=b70udXPqUWf2KEGqQk0bVYZVvnPulx36O360M5GiHlmjQm4JZw/Dp/Ux
   lten1OsQW43v9P5zvY+deUAI3gXcDl9kDNi4IHDbsiht3MGOEFIEtoyyn
   7Cj+en5fU7e7xcbFhUlvfcqKu+HoV7q55Y1Su3JQ0h72IkJP63iIijX8V
   AL8QrBErY2FJWc5sVo+ePD0YSs9LuYJpJvnbeZmE7qzOjKaiMzeMS2b1l
   DNb9SNYRPODe6QJw8tcf6hCrdu2ZDs0P4g4r+VupjjwwDsC6PZGSTHMrj
   ULpiomcJjZAygXk12JKel+7PxBDQmCQl+SAq5Zlj9PNSvG6Xk4XLZj/Ia
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10220"; a="243204827"
X-IronPort-AV: E=Sophos;i="5.88,272,1635231600"; 
   d="scan'208";a="243204827"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2022 03:03:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,272,1635231600"; 
   d="scan'208";a="473623032"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Jan 2022 03:03:52 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n69Vn-0000YZ-Ju; Sat, 08 Jan 2022 11:03:51 +0000
Date: Sat, 8 Jan 2022 19:03:43 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Don <joshdon@google.com>, Tejun Heo <tj@kernel.org>,
	Zefan Li <lizefan.x@bytedance.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>
Subject: Re: [PATCH 1/2] cgroup: add cpu.stat_percpu
Message-ID: <202201081834.qK6yea4m-lkp@intel.com>
References: <20220107234138.1765668-1-joshdon@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220107234138.1765668-1-joshdon@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Josh,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on tj-cgroup/for-next]
[also build test ERROR on tip/sched/core tip/master v5.16-rc8 next-20220107]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Josh-Don/cgroup-add-cpu-stat_percpu/20220108-074316
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
config: x86_64-randconfig-a014-20220107 (https://download.01.org/0day-ci/archive/20220108/202201081834.qK6yea4m-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/d70517c43ca623321dcca220ce4c9b93059dc763
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Josh-Don/cgroup-add-cpu-stat_percpu/20220108-074316
        git checkout d70517c43ca623321dcca220ce4c9b93059dc763
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> kernel/cgroup/rstat.c:519:9: error: '__section__' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
           static DEFINE_PER_CPU(struct cgroup_base_stat, cached_percpu_stats);
                  ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
           DEFINE_PER_CPU_SECTION(type, name, "")
           ^
   include/linux/percpu-defs.h:93:2: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
           __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
           ^
   include/linux/percpu-defs.h:54:2: note: expanded from macro '__PCPU_DUMMY_ATTRS'
           __section(".discard") __attribute__((unused))
           ^
   include/linux/compiler_attributes.h:276:56: note: expanded from macro '__section'
   #define __section(section)              __attribute__((__section__(section)))
                                                          ^
>> kernel/cgroup/rstat.c:519:9: error: non-extern declaration of '__pcpu_unique_cached_percpu_stats' follows extern declaration
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
           DEFINE_PER_CPU_SECTION(type, name, "")
           ^
   include/linux/percpu-defs.h:93:26: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
           __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;                   \
                                   ^
   <scratch space>:66:1: note: expanded from here
   __pcpu_unique_cached_percpu_stats
   ^
   kernel/cgroup/rstat.c:519:9: note: previous declaration is here
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
           DEFINE_PER_CPU_SECTION(type, name, "")
           ^
   include/linux/percpu-defs.h:92:33: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
           extern __PCPU_DUMMY_ATTRS char __pcpu_unique_##name;            \
                                          ^
   <scratch space>:65:1: note: expanded from here
   __pcpu_unique_cached_percpu_stats
   ^
>> kernel/cgroup/rstat.c:519:9: error: 'section' attribute only applies to functions, global variables, Objective-C methods, and Objective-C properties
           static DEFINE_PER_CPU(struct cgroup_base_stat, cached_percpu_stats);
                  ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
           DEFINE_PER_CPU_SECTION(type, name, "")
           ^
   include/linux/percpu-defs.h:95:2: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
           __PCPU_ATTRS(sec) __weak __typeof__(type) name
           ^
   include/linux/percpu-defs.h:50:26: note: expanded from macro '__PCPU_ATTRS'
           __percpu __attribute__((section(PER_CPU_BASE_SECTION sec)))     \
                                   ^
>> kernel/cgroup/rstat.c:519:49: error: non-extern declaration of 'cached_percpu_stats' follows extern declaration
           static DEFINE_PER_CPU(struct cgroup_base_stat, cached_percpu_stats);
                                                          ^
   kernel/cgroup/rstat.c:519:49: note: previous declaration is here
>> kernel/cgroup/rstat.c:519:9: error: weak declaration cannot have internal linkage
           static DEFINE_PER_CPU(struct cgroup_base_stat, cached_percpu_stats);
                  ^
   include/linux/percpu-defs.h:115:2: note: expanded from macro 'DEFINE_PER_CPU'
           DEFINE_PER_CPU_SECTION(type, name, "")
           ^
   include/linux/percpu-defs.h:95:20: note: expanded from macro 'DEFINE_PER_CPU_SECTION'
           __PCPU_ATTRS(sec) __weak __typeof__(type) name
                             ^
   include/linux/compiler_attributes.h:315:56: note: expanded from macro '__weak'
   #define __weak                          __attribute__((__weak__))
                                                          ^
   5 errors generated.


vim +/__section__ +519 kernel/cgroup/rstat.c

   515	
   516	void cgroup_base_stat_percpu_cputime_show(struct seq_file *seq)
   517	{
   518		static DEFINE_MUTEX(mutex);
 > 519		static DEFINE_PER_CPU(struct cgroup_base_stat, cached_percpu_stats);

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
