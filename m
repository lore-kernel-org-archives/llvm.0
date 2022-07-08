Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE2F812
	for <llvm@lists.linux.dev>; Fri,  8 Jul 2022 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657282975; x=1688818975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/b6oSgob0axMLhl+tmowZfmCN7BmV1qtva+EHaPKcn4=;
  b=YWXgSFrqF4h1EnxmgakpeLgKHco7ayHI1YEMldWYUsP7zUO03zmX27gS
   m9hjSsbjofGSJnn/ZGyQW73Z2GX66ZYM5muBmbivZ7Y2tHzvbOosaWPTA
   UKfzqZZ4Cosg2IMJKuqF8FYaeLbgAOw4dmSn1SduzMEJb3h4jruD+I659
   TmAyXlOzxz+ytSh2CDrJ92R//3KZ9bZvc1yfVL6831PKMkrqoLaPYLLM5
   9Kf642WqhlJr/GIoXQkIvud3c7eUOCLuJ+6JXJs4tJl0QrJr0kWsZrcdM
   QN/Q5PLm9nPb5GUxC2uChYfBCa5ou1acL1m/wDhRIp7ycD+m2t78frKsz
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285010387"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="285010387"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2022 05:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; 
   d="scan'208";a="840289288"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Jul 2022 05:22:47 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9n0R-000NSc-59;
	Fri, 08 Jul 2022 12:22:47 +0000
Date: Fri, 8 Jul 2022 20:22:31 +0800
From: kernel test robot <lkp@intel.com>
To: Gang Li <ligang.bdlg@bytedance.com>, mhocko@suse.com,
	akpm@linux-foundation.org, surenb@google.com
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	viro@zeniv.linux.org.uk, ebiederm@xmission.com,
	keescook@chromium.org, rostedt@goodmis.org, mingo@redhat.com,
	peterz@infradead.org, acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, david@redhat.com, imbrenda@linux.ibm.com,
	adobriyan@gmail.com, yang.yang29@zte.com.cn, brauner@kernel.org,
	stephen.s.brennan@oracle.com, zhengqi.arch@bytedance.com,
	haolee.swjtu@gmail.com, xu.xin16@zte.com.cn,
	Liam.Howlett@oracle.com, ohoono.kwon@samsung.com
Subject: Re: [PATCH v2 2/5] mm: add numa_count field for rss_stat
Message-ID: <202207082038.SqmV8UHt-lkp@intel.com>
References: <20220708082129.80115-3-ligang.bdlg@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708082129.80115-3-ligang.bdlg@bytedance.com>

Hi Gang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Gang-Li/mm-oom-Introduce-per-numa-node-oom-for-CONSTRAINT_-MEMORY_POLICY-CPUSET/20220708-162505
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
config: hexagon-randconfig-r045-20220707 (https://download.01.org/0day-ci/archive/20220708/202207082038.SqmV8UHt-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 562c3467a6738aa89203f72fc1d1343e5baadf3c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/84248e4f2ab2c6afec10ad8e54ed3d2a09b5996e
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gang-Li/mm-oom-Introduce-per-numa-node-oom-for-CONSTRAINT_-MEMORY_POLICY-CPUSET/20220708-162505
        git checkout 84248e4f2ab2c6afec10ad8e54ed3d2a09b5996e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   kernel/fork.c:166:13: warning: no previous prototype for function 'arch_release_task_struct' [-Wmissing-prototypes]
   void __weak arch_release_task_struct(struct task_struct *tsk)
               ^
   kernel/fork.c:166:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __weak arch_release_task_struct(struct task_struct *tsk)
   ^
   static 
>> kernel/fork.c:871:6: warning: no previous prototype for function 'rss_stat_free' [-Wmissing-prototypes]
   void rss_stat_free(struct task_struct *p) {}
        ^
   kernel/fork.c:871:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rss_stat_free(struct task_struct *p) {}
   ^
   static 
   kernel/fork.c:894:20: warning: no previous prototype for function 'arch_task_cache_init' [-Wmissing-prototypes]
   void __init __weak arch_task_cache_init(void) { }
                      ^
   kernel/fork.c:894:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void __init __weak arch_task_cache_init(void) { }
   ^
   static 
   kernel/fork.c:989:12: warning: no previous prototype for function 'arch_dup_task_struct' [-Wmissing-prototypes]
   int __weak arch_dup_task_struct(struct task_struct *dst,
              ^
   kernel/fork.c:989:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __weak arch_dup_task_struct(struct task_struct *dst,
   ^
   static 
>> kernel/fork.c:1108:1: warning: unused label 'free_stack' [-Wunused-label]
   free_stack:
   ^~~~~~~~~~~
>> kernel/fork.c:2206:13: error: no member named 'rss_stat' in 'struct task_struct'
           memset(&p->rss_stat, 0, sizeof(p->rss_stat));
                   ~  ^
   kernel/fork.c:2206:36: error: no member named 'rss_stat' in 'struct task_struct'
           memset(&p->rss_stat, 0, sizeof(p->rss_stat));
                                          ~  ^
   5 warnings and 2 errors generated.


vim +2206 kernel/fork.c

0f2122045b9462 Jens Axboe        2020-09-13  2202  
84248e4f2ab2c6 Gang Li           2022-07-08  2203  #ifdef SPLIT_RSS_NUMA_COUNTING
84248e4f2ab2c6 Gang Li           2022-07-08  2204  	memset(&p->rss_stat, 0, sizeof(p->rss_stat) - sizeof(p->rss_stat.numa_count));
84248e4f2ab2c6 Gang Li           2022-07-08  2205  #else
a3a2e76c77fa22 KAMEZAWA Hiroyuki 2010-04-06 @2206  	memset(&p->rss_stat, 0, sizeof(p->rss_stat));
a3a2e76c77fa22 KAMEZAWA Hiroyuki 2010-04-06  2207  #endif
172ba844a8851c Balbir Singh      2007-07-09  2208  
6976675d94042f Arjan van de Ven  2008-09-01  2209  	p->default_timer_slack_ns = current->timer_slack_ns;
6976675d94042f Arjan van de Ven  2008-09-01  2210  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
