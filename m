Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8B3BA3B;
	Fri, 24 Feb 2023 22:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677276373; x=1708812373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iRDawgnnNIaRur9hoY3REouJW5aIOwMOjJK0DJDQR/M=;
  b=im2uYM2nZyhXMRWk6TsJz/dJ30CkJf59m06kbBrFh7/aHvmjezEU6CNq
   hHuoOQa3bbDYuJYA6X5Uhc149a4eCju1/QMkEQNrCKEVlWbcLs8sqRInT
   F+qJpMSye1r/m/a9du2wkd8ARLBnM0jSiB+L4wxtqIE5UTUdFKMAA99Lv
   bvlrYcn90JELihuvjM1jhi5Zay6xlz0C8gSs+Rik0uzno2mpa7ozSN5Cs
   7yNplRLocczvj6VRS+csu3wZ0IMtrLuTZDj+hjKCb65pKdPpM6Lv/qnyt
   U427blS09x80T3jfx79pMFLLeiHFS0HAyiVcRVp9K+18PaWGUWSiFJuXM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="419823110"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="419823110"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 14:06:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="815877482"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="815877482"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2023 14:06:09 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVgCe-0002kt-2H;
	Fri, 24 Feb 2023 22:06:08 +0000
Date: Sat, 25 Feb 2023 06:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop 1/1] kernel/rcu/debug.h:162:5: warning: no
 previous prototype for function 'rcu_debug_ptr_queue'
Message-ID: <202302250502.V09VH4JS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/rcutop
head:   43245eb952b4ea3ac722e0b1cd3c9fcc4bc35a38
commit: 561427c949299c3f6b3a42b5fa4b035aa5bb419a [1/1] debug: dynamic lazy wake debug
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230225/202302250502.V09VH4JS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=561427c949299c3f6b3a42b5fa4b035aa5bb419a
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop
        git checkout 561427c949299c3f6b3a42b5fa4b035aa5bb419a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250502.V09VH4JS-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:70:
>> kernel/rcu/debug.h:162:5: warning: no previous prototype for function 'rcu_debug_ptr_queue' [-Wmissing-prototypes]
   int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
       ^
   kernel/rcu/debug.h:162:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
   ^
   static 
   kernel/rcu/debug.h:167:6: warning: no previous prototype for function 'rcu_debug_set_context' [-Wmissing-prototypes]
   void rcu_debug_set_context(struct rcu_data *rdp, void *ip_ptr)
        ^
   kernel/rcu/debug.h:167:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcu_debug_set_context(struct rcu_data *rdp, void *ip_ptr)
   ^
   static 
   kernel/rcu/debug.h:171:6: warning: no previous prototype for function 'rcu_debug_reset_context' [-Wmissing-prototypes]
   void rcu_debug_reset_context(void)
        ^
   kernel/rcu/debug.h:171:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcu_debug_reset_context(void)
   ^
   static 
   kernel/rcu/debug.h:175:6: warning: no previous prototype for function 'rcu_debug_init' [-Wmissing-prototypes]
   void rcu_debug_init(void)
        ^
   kernel/rcu/debug.h:175:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcu_debug_init(void)
   ^
   static 
   kernel/rcu/tree.c:2204:8: error: implicit declaration of function 'rcu_debug_ptr_unqueue' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ret = rcu_debug_ptr_unqueue(rdp, ip);
                 ^
   kernel/rcu/tree.c:2204:8: note: did you mean 'rcu_debug_ptr_queue'?
   kernel/rcu/debug.h:162:5: note: 'rcu_debug_ptr_queue' declared here
   int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
       ^
   kernel/rcu/tree.c:2204:6: error: assigning to 'rcu_debug_entry' from incompatible type 'int'
           ret = rcu_debug_ptr_unqueue(rdp, ip);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/rcu/tree.c:2198:17: warning: no previous prototype for function 'rcu_debug_ptr_unqueue_lock' [-Wmissing-prototypes]
   rcu_debug_entry rcu_debug_ptr_unqueue_lock(struct rcu_data *rdp, void *ip)
                   ^
   kernel/rcu/tree.c:2198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   rcu_debug_entry rcu_debug_ptr_unqueue_lock(struct rcu_data *rdp, void *ip)
   ^
   static 
   kernel/rcu/tree.c:2220:44: error: too many arguments to function call, expected 2, have 3
           WARN_ON_ONCE(rcu_debug_ptr_queue(rdp, ip, lazy));
                        ~~~~~~~~~~~~~~~~~~~          ^~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                      \
                                  ^~~~~~~~~
   kernel/rcu/debug.h:162:5: note: 'rcu_debug_ptr_queue' declared here
   int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
       ^
   kernel/rcu/tree.c:4440:17: error: implicit declaration of function 'rcu_debug_ptr_unqueue' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   WARN_ON_ONCE(!rcu_debug_ptr_unqueue(rdp, rh).valid);
                                 ^
   kernel/rcu/tree.c:4440:47: error: member reference base type 'int' is not a structure or union
                   WARN_ON_ONCE(!rcu_debug_ptr_unqueue(rdp, rh).valid);
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                      \
                                  ^~~~~~~~~
   kernel/rcu/tree.c:4912:8: error: no member named 'rcu_debug_ptrs' in 'struct rcu_data'
                   rdp->rcu_debug_ptrs[i].valid = false;
                   ~~~  ^
   kernel/rcu/tree.c:4913:8: error: no member named 'rcu_debug_ptrs' in 'struct rcu_data'
                   rdp->rcu_debug_ptrs[i].in_flight = false;
                   ~~~  ^
   5 warnings and 7 errors generated.


vim +/rcu_debug_ptr_queue +162 kernel/rcu/debug.h

   151	
   152	void rcu_debug_init(void)
   153	{
   154		int ret;
   155		pr_info("RCU Lazy CB debugging is turned on, system may be slow.\n");
   156	
   157		ret = register_trace_sched_waking(probe_waking, NULL);
   158		if (ret)
   159			pr_info("RCU: Lazy debug ched_waking probe could not be registered.");
   160	}
   161	#else
 > 162	int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
   163	{
   164		return -1;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
