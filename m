Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F6B33E5
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652374326; x=1683910326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6EsLrPZq9VoVd+QDt72C6r7MLxI0LAYkym5Cf6VH2w4=;
  b=k/7gPRBg/Mx36YI1lCJ7myW9t/PUmXG84jCvc90amFYgXBgaOZVgavdD
   3vjRjvA9jslk03c/RBuh5cuFsC8BF+7mkrfX2nYiYhiOHFlHy55PMgypR
   fjLQCECcdQ9XzJZvDU/E7/SKuMKQbqfzYtlgjc/IFmNqjFm3DOWsx11A2
   ruSn7k+uMjP4iEmxMODxp9VONFWoXEEJYxAlvNl/ozCJ7CAHVAva4rSdh
   kkSWOeof62il6iGcyxb1e5Qlg3dUnUE/qc35GWLPUkjwL00r+005jBbja
   ASwpw5lRXyAS40p/AnYwzVfU20EGM7Ii7hWJIKUmpdT8WNwF9qEdQl1J8
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="252110528"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="252110528"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 09:31:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="698100982"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 May 2022 09:31:37 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npBiy-000Kg4-TY;
	Thu, 12 May 2022 16:31:36 +0000
Date: Fri, 13 May 2022 00:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: Gang Li <ligang.bdlg@bytedance.com>, akpm@linux-foundation.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, songmuchun@bytedance.com,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	ebiederm@xmission.com, keescook@chromium.org,
	viro@zeniv.linux.org.uk, rostedt@goodmis.org, mingo@redhat.com,
	peterz@infradead.org, acme@kernel.org, mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com, jolsa@kernel.org,
	namhyung@kernel.org, david@redhat.com, imbrenda@linux.ibm.com,
	apopple@nvidia.com, adobriyan@gmail.com,
	stephen.s.brennan@oracle.com, ohoono.kwon@samsung.com,
	haolee.swjtu@gmail.com, kaleshsingh@google.com,
	zhengqi.arch@bytedance.com, peterx@redhat.com, shy828301@gmail.com,
	surenb@google.com
Subject: Re: [PATCH 2/5 v1] mm: add numa_count field for rss_stat
Message-ID: <202205130046.1baess3J-lkp@intel.com>
References: <20220512044634.63586-3-ligang.bdlg@bytedance.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512044634.63586-3-ligang.bdlg@bytedance.com>

Hi Gang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on s390/features]
[also build test ERROR on kees/for-next/execve tip/perf/core linus/master v5.18-rc6]
[cannot apply to akpm-mm/mm-everything rostedt-trace/for-next next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Gang-Li/mm-oom-Introduce-per-numa-node-oom-for-CONSTRAINT_MEMORY_POLICY/20220512-124948
base:   https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git features
config: x86_64-randconfig-a003-20220509 (https://download.01.org/0day-ci/archive/20220513/202205130046.1baess3J-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3e724f844e3fe45cdffd9f359d140a424aeb462c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gang-Li/mm-oom-Introduce-per-numa-node-oom-for-CONSTRAINT_MEMORY_POLICY/20220512-124948
        git checkout 3e724f844e3fe45cdffd9f359d140a424aeb462c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> kernel/fork.c:878:6: warning: no previous prototype for function 'rss_stat_free' [-Wmissing-prototypes]
   void rss_stat_free(struct task_struct *p) {}
        ^
   kernel/fork.c:878:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rss_stat_free(struct task_struct *p) {}
   ^
   static 
>> kernel/fork.c:1110:1: warning: unused label 'free_stack' [-Wunused-label]
   free_stack:
   ^~~~~~~~~~~
>> kernel/fork.c:2207:36: error: no member named 'rss_stat' in 'struct task_struct'
           memset(&p->rss_stat, 0, sizeof(p->rss_stat));
                                          ~  ^
   include/linux/fortify-string.h:272:52: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                                                      ^
   include/linux/fortify-string.h:263:35: note: expanded from macro '__fortify_memset_chk'
           size_t __fortify_size = (size_t)(size);                         \
                                            ^~~~
   kernel/fork.c:2207:13: error: no member named 'rss_stat' in 'struct task_struct'
           memset(&p->rss_stat, 0, sizeof(p->rss_stat));
                   ~  ^
   include/linux/fortify-string.h:273:25: note: expanded from macro 'memset'
                   __builtin_object_size(p, 0), __builtin_object_size(p, 1))
                                         ^
   include/linux/fortify-string.h:264:37: note: expanded from macro '__fortify_memset_chk'
           fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
                                              ^~~~~~
   kernel/fork.c:2207:13: error: no member named 'rss_stat' in 'struct task_struct'
           memset(&p->rss_stat, 0, sizeof(p->rss_stat));
                   ~  ^
   include/linux/fortify-string.h:273:54: note: expanded from macro 'memset'
                   __builtin_object_size(p, 0), __builtin_object_size(p, 1))
                                                                      ^
   include/linux/fortify-string.h:264:45: note: expanded from macro '__fortify_memset_chk'
           fortify_memset_chk(__fortify_size, p_size, p_size_field),       \
                                                      ^~~~~~~~~~~~
   kernel/fork.c:2207:13: error: no member named 'rss_stat' in 'struct task_struct'
           memset(&p->rss_stat, 0, sizeof(p->rss_stat));
                   ~  ^
   include/linux/fortify-string.h:272:46: note: expanded from macro 'memset'
   #define memset(p, c, s) __fortify_memset_chk(p, c, s,                   \
                                                ^
   include/linux/fortify-string.h:265:22: note: expanded from macro '__fortify_memset_chk'
           __underlying_memset(p, c, __fortify_size);                      \
                               ^
   2 warnings and 4 errors generated.


vim +2207 kernel/fork.c

0f2122045b9462 Jens Axboe        2020-09-13  2203  
3e724f844e3fe4 Gang Li           2022-05-12  2204  #ifdef SPLIT_RSS_NUMA_COUNTING
3e724f844e3fe4 Gang Li           2022-05-12  2205  	memset(&p->rss_stat, 0, sizeof(p->rss_stat) - sizeof(p->rss_stat.numa_count));
3e724f844e3fe4 Gang Li           2022-05-12  2206  #else
a3a2e76c77fa22 KAMEZAWA Hiroyuki 2010-04-06 @2207  	memset(&p->rss_stat, 0, sizeof(p->rss_stat));
a3a2e76c77fa22 KAMEZAWA Hiroyuki 2010-04-06  2208  #endif
172ba844a8851c Balbir Singh      2007-07-09  2209  
6976675d94042f Arjan van de Ven  2008-09-01  2210  	p->default_timer_slack_ns = current->timer_slack_ns;
6976675d94042f Arjan van de Ven  2008-09-01  2211  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
