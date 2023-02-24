Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E52BA40;
	Fri, 24 Feb 2023 22:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677277631; x=1708813631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R8w2IOsdILlSyfVMyZ18sbro1uvr9geIWV3RPnumMno=;
  b=U0AlDmhM2Uq5v3wyPKLfhTWrNI1SMwu2iXwERQny0A4X3YKdGgPn9y3R
   0BI8Epzq6WC8EQMxkLNMbCd9JdMZy0HbkKbzdAq2u0S9hKeakMR1xsmRF
   0XUQOGPo5JNgvPBppymIS7L9QSNUaAsFcxCFJtpsgYH7rY2F6xfv+XT24
   kFTktZF6t3HN7p6eyGMXBXcMhkA+GOXrStbqWPX4sSyIc2yGtQcIdnOG3
   2l9yoqW4GxP2GCpGFww0DvErCSA46cyO6nelBmKuha+lTiQPUAe5kqmGz
   RpxCuzSsdhNi+dFlj7TUg57o4IrcOZYhixLD8cRmMu9k8gnNr0ZVTYQAJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="396104567"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="396104567"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 14:27:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="782527241"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="782527241"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2023 14:27:09 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVgWy-0002lP-3D;
	Fri, 24 Feb 2023 22:27:09 +0000
Date: Sat, 25 Feb 2023 06:26:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop 1/1] kernel/rcu/debug.h:162:5: warning: no
 previous prototype for function 'rcu_debug_ptr_queue'
Message-ID: <202302250607.p3sNFmDa-lkp@intel.com>
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
config: mips-buildonly-randconfig-r003-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250607.p3sNFmDa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips64-linux-gnuabi64
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=561427c949299c3f6b3a42b5fa4b035aa5bb419a
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop
        git checkout 561427c949299c3f6b3a42b5fa4b035aa5bb419a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250607.p3sNFmDa-lkp@intel.com/

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
   kernel/rcu/tree.c:2204:8: error: call to undeclared function 'rcu_debug_ptr_unqueue'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
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
   include/asm-generic/bug.h:180:41: note: expanded from macro 'WARN_ON_ONCE'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:167:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
                                  ^~~~~~~~~
   kernel/rcu/debug.h:162:5: note: 'rcu_debug_ptr_queue' declared here
   int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
       ^
   kernel/rcu/tree.c:4440:17: error: call to undeclared function 'rcu_debug_ptr_unqueue'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   WARN_ON_ONCE(!rcu_debug_ptr_unqueue(rdp, rh).valid);
                                 ^
   kernel/rcu/tree.c:4440:47: error: member reference base type 'int' is not a structure or union
                   WARN_ON_ONCE(!rcu_debug_ptr_unqueue(rdp, rh).valid);
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:180:41: note: expanded from macro 'WARN_ON_ONCE'
   #define WARN_ON_ONCE(condition) WARN_ON(condition)
                                           ^~~~~~~~~
   include/asm-generic/bug.h:167:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on = !!(condition);                              \
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
