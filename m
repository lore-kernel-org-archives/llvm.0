Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618A23D8F;
	Fri, 24 Feb 2023 22:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677278893; x=1708814893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8h2HZ4wjL92jH0KYqMWNlgAXJPgXeXZlJnU/Rlm70sU=;
  b=XmCy7+1A1SHKw3PYLC0QOS721PMaK6zGq+zFvpM6O+NNlnKEGF0KB03M
   QPOnMMURFRwVNsTEHi6biQZ6ffLrp2hwLeTDr1IKlTJz92cMbE2276EyB
   jk6ef7+4iI/Uzzdo/ZaMcRDAXirLDJb0begmPwPruunSmfsCma3uhGvX3
   bRtdPppBTxoD661/FAK5YB8auRyMeU8wwjTHVKTKGooEC1EPv5m8CZOc6
   cCcsVO/AcEtDzoBjuAI173/0w/o3wC63cGBOsVvxbUdiawAnOyUa0NEcl
   roi7c6eugi5LK0hAz3KGQe1AtLsKzhqksduKEMPPyA2rLQQ3lQenEPfC/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="321797417"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="321797417"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 14:48:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="675097492"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="675097492"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 24 Feb 2023 14:48:10 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVgrJ-0002m7-1w;
	Fri, 24 Feb 2023 22:48:09 +0000
Date: Sat, 25 Feb 2023 06:47:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:rcu/rcutop 1/1] kernel/rcu/tree.c:2783:1: warning: no
 previous prototype for function '__call_rcu_common'
Message-ID: <202302250651.QFIs7gUc-lkp@intel.com>
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
commit: 43245eb952b4ea3ac722e0b1cd3c9fcc4bc35a38 [1/1] debug: dynamic lazy wake debug
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230225/202302250651.QFIs7gUc-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=43245eb952b4ea3ac722e0b1cd3c9fcc4bc35a38
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern rcu/rcutop
        git checkout 43245eb952b4ea3ac722e0b1cd3c9fcc4bc35a38
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash kernel/rcu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250651.QFIs7gUc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:70:
   kernel/rcu/debug.h:168:5: warning: no previous prototype for function 'rcu_debug_ptr_queue' [-Wmissing-prototypes]
   int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
       ^
   kernel/rcu/debug.h:168:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
   ^
   static 
   kernel/rcu/debug.h:173:6: warning: no previous prototype for function 'rcu_debug_set_context' [-Wmissing-prototypes]
   void rcu_debug_set_context(struct rcu_data *rdp, void *ip_ptr)
        ^
   kernel/rcu/debug.h:173:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcu_debug_set_context(struct rcu_data *rdp, void *ip_ptr)
   ^
   static 
   kernel/rcu/debug.h:177:6: warning: no previous prototype for function 'rcu_debug_reset_context' [-Wmissing-prototypes]
   void rcu_debug_reset_context(void)
        ^
   kernel/rcu/debug.h:177:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcu_debug_reset_context(void)
   ^
   static 
   kernel/rcu/debug.h:181:6: warning: no previous prototype for function 'rcu_debug_init' [-Wmissing-prototypes]
   void rcu_debug_init(void)
        ^
   kernel/rcu/debug.h:181:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void rcu_debug_init(void)
   ^
   static 
   kernel/rcu/tree.c:2204:8: error: implicit declaration of function 'rcu_debug_ptr_unqueue' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           ret = rcu_debug_ptr_unqueue(rdp, ip);
                 ^
   kernel/rcu/tree.c:2204:8: note: did you mean 'rcu_debug_ptr_queue'?
   kernel/rcu/debug.h:168:5: note: 'rcu_debug_ptr_queue' declared here
   int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
       ^
   kernel/rcu/tree.c:2204:6: error: assigning to 'rcu_debug_entry' from incompatible type 'int'
           ret = rcu_debug_ptr_unqueue(rdp, ip);
               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/rcu/tree.c:2198:17: warning: no previous prototype for function 'rcu_debug_ptr_unqueue_lock' [-Wmissing-prototypes]
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
   kernel/rcu/debug.h:168:5: note: 'rcu_debug_ptr_queue' declared here
   int rcu_debug_ptr_queue(struct rcu_data *rdp, void* ip_ptr)
       ^
>> kernel/rcu/tree.c:2783:1: warning: no previous prototype for function '__call_rcu_common' [-Wmissing-prototypes]
   __call_rcu_common(struct rcu_head *head, rcu_callback_t func, bool lazy)
   ^
   kernel/rcu/tree.c:2782:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void
   ^
   static 
   kernel/rcu/tree.c:4441:17: error: implicit declaration of function 'rcu_debug_ptr_unqueue' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   WARN_ON_ONCE(!rcu_debug_ptr_unqueue(rdp, rh).valid);
                                 ^
   kernel/rcu/tree.c:4441:47: error: member reference base type 'int' is not a structure or union
                   WARN_ON_ONCE(!rcu_debug_ptr_unqueue(rdp, rh).valid);
                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON_ONCE'
           int __ret_warn_on = !!(condition);                      \
                                  ^~~~~~~~~
   kernel/rcu/tree.c:4913:8: error: no member named 'rcu_debug_ptrs' in 'struct rcu_data'
                   rdp->rcu_debug_ptrs[i].valid = false;
                   ~~~  ^
   kernel/rcu/tree.c:4914:8: error: no member named 'rcu_debug_ptrs' in 'struct rcu_data'
                   rdp->rcu_debug_ptrs[i].in_flight = false;
                   ~~~  ^
   6 warnings and 7 errors generated.


vim +/__call_rcu_common +2783 kernel/rcu/tree.c

b2b00ddf193bf8 kernel/rcu/tree.c Paul E. McKenney        2019-10-30  2781  
43245eb952b4ea kernel/rcu/tree.c Joel Fernandes (Google  2022-10-07  2782) void
3cb278e73be58b kernel/rcu/tree.c Joel Fernandes (Google  2022-10-16 @2783) __call_rcu_common(struct rcu_head *head, rcu_callback_t func, bool lazy)
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2784  {
b4b7914a6a73fc kernel/rcu/tree.c Paul E. McKenney        2020-12-08  2785  	static atomic_t doublefrees;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2786  	unsigned long flags;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2787  	struct rcu_data *rdp;
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2788  	bool was_alldone;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2789  
b8f2ed538477d9 kernel/rcu/tree.c Paul E. McKenney        2016-08-23  2790  	/* Misaligned rcu_head! */
b8f2ed538477d9 kernel/rcu/tree.c Paul E. McKenney        2016-08-23  2791  	WARN_ON_ONCE((unsigned long)head & (sizeof(void *) - 1));
b8f2ed538477d9 kernel/rcu/tree.c Paul E. McKenney        2016-08-23  2792  
ae15018456c44b kernel/rcutree.c  Paul E. McKenney        2013-04-23  2793  	if (debug_rcu_head_queue(head)) {
fa3c66476975ab kernel/rcu/tree.c Paul E. McKenney        2017-05-03  2794  		/*
fa3c66476975ab kernel/rcu/tree.c Paul E. McKenney        2017-05-03  2795  		 * Probable double call_rcu(), so leak the callback.
fa3c66476975ab kernel/rcu/tree.c Paul E. McKenney        2017-05-03  2796  		 * Use rcu:rcu_callback trace event to find the previous
1fe09ebe7a9c99 kernel/rcu/tree.c Paul E. McKenney        2021-12-18  2797  		 * time callback was passed to call_rcu().
fa3c66476975ab kernel/rcu/tree.c Paul E. McKenney        2017-05-03  2798  		 */
b4b7914a6a73fc kernel/rcu/tree.c Paul E. McKenney        2020-12-08  2799  		if (atomic_inc_return(&doublefrees) < 4) {
b4b7914a6a73fc kernel/rcu/tree.c Paul E. McKenney        2020-12-08  2800  			pr_err("%s(): Double-freed CB %p->%pS()!!!  ", __func__, head, head->func);
b4b7914a6a73fc kernel/rcu/tree.c Paul E. McKenney        2020-12-08  2801  			mem_dump_obj(head);
b4b7914a6a73fc kernel/rcu/tree.c Paul E. McKenney        2020-12-08  2802  		}
7d0ae8086b8283 kernel/rcu/tree.c Paul E. McKenney        2015-03-03  2803  		WRITE_ONCE(head->func, rcu_leak_callback);
ae15018456c44b kernel/rcutree.c  Paul E. McKenney        2013-04-23  2804  		return;
ae15018456c44b kernel/rcutree.c  Paul E. McKenney        2013-04-23  2805  	}
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2806  	head->func = func;
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2807  	head->next = NULL;
300c0c5e721834 kernel/rcu/tree.c Jun Miao                2021-11-16  2808  	kasan_record_aux_stack_noalloc(head);
d818cc76e2b4d5 kernel/rcu/tree.c Zqiang                  2021-12-26  2809  	local_irq_save(flags);
da1df50d16171f kernel/rcu/tree.c Paul E. McKenney        2018-07-03  2810  	rdp = this_cpu_ptr(&rcu_data);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2811  
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2812  	/* Add the callback to our list. */
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2813  	if (unlikely(!rcu_segcblist_is_enabled(&rdp->cblist))) {
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2814  		// This can trigger due to call_rcu() from offline CPU:
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2815  		WARN_ON_ONCE(rcu_scheduler_active != RCU_SCHEDULER_INACTIVE);
34404ca8fb252c kernel/rcu/tree.c Paul E. McKenney        2015-01-19  2816  		WARN_ON_ONCE(!rcu_is_watching());
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2817  		// Very early boot, before rcu_init().  Initialize if needed
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2818  		// and then drop through to queue the callback.
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2819  		if (rcu_segcblist_empty(&rdp->cblist))
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2820  			rcu_segcblist_init(&rdp->cblist);
143da9c2fc030a kernel/rcu/tree.c Paul E. McKenney        2015-01-19  2821  	}
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2822) 
b2b00ddf193bf8 kernel/rcu/tree.c Paul E. McKenney        2019-10-30  2823  	check_cb_ovld(rdp);
43245eb952b4ea kernel/rcu/tree.c Joel Fernandes (Google  2022-10-07  2824) 
43245eb952b4ea kernel/rcu/tree.c Joel Fernandes (Google  2022-10-07  2825) 	trace_dump_stack(0);
43245eb952b4ea kernel/rcu/tree.c Joel Fernandes (Google  2022-10-07  2826) 	rcu_debug_ptr_queue_lock(rdp, (void *)head, lazy);
43245eb952b4ea kernel/rcu/tree.c Joel Fernandes (Google  2022-10-07  2827) 
3cb278e73be58b kernel/rcu/tree.c Joel Fernandes (Google  2022-10-16  2828) 	if (rcu_nocb_try_bypass(rdp, head, &was_alldone, flags, lazy))
d1b222c6be1f8b kernel/rcu/tree.c Paul E. McKenney        2019-07-02  2829  		return; // Enqueued onto ->nocb_bypass, so just leave.
43245eb952b4ea kernel/rcu/tree.c Joel Fernandes (Google  2022-10-07  2830) 
b692dc4adfcff5 kernel/rcu/tree.c Paul E. McKenney        2020-02-11  2831  	// If no-CBs CPU gets here, rcu_nocb_try_bypass() acquired ->nocb_lock.
77a40f97030b27 kernel/rcu/tree.c Joel Fernandes (Google  2019-08-30  2832) 	rcu_segcblist_enqueue(&rdp->cblist, head);
c408b215f58f71 kernel/rcu/tree.c Uladzislau Rezki (Sony  2020-05-25  2833) 	if (__is_kvfree_rcu_offset((unsigned long)func))
c408b215f58f71 kernel/rcu/tree.c Uladzislau Rezki (Sony  2020-05-25  2834) 		trace_rcu_kvfree_callback(rcu_state.name, head,
3c779dfef2c452 kernel/rcu/tree.c Paul E. McKenney        2018-07-05  2835  					 (unsigned long)func,
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2836  					 rcu_segcblist_n_cbs(&rdp->cblist));
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney        2011-06-25  2837  	else
3c779dfef2c452 kernel/rcu/tree.c Paul E. McKenney        2018-07-05  2838  		trace_rcu_callback(rcu_state.name, head,
15fecf89e46a96 kernel/rcu/tree.c Paul E. McKenney        2017-02-08  2839  				   rcu_segcblist_n_cbs(&rdp->cblist));
d4c08f2ac311a3 kernel/rcutree.c  Paul E. McKenney        2011-06-25  2840  
3afe7fa535491e kernel/rcu/tree.c Joel Fernandes (Google  2020-11-14  2841) 	trace_rcu_segcb_stats(&rdp->cblist, TPS("SegCBQueued"));
3afe7fa535491e kernel/rcu/tree.c Joel Fernandes (Google  2020-11-14  2842) 
29154c57e35a19 kernel/rcutree.c  Paul E. McKenney        2012-05-30  2843  	/* Go handle any RCU core processing required. */
3820b513a2e33d kernel/rcu/tree.c Frederic Weisbecker     2020-11-12  2844  	if (unlikely(rcu_rdp_is_offloaded(rdp))) {
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2845  		__call_rcu_nocb_wake(rdp, was_alldone, flags); /* unlocks */
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2846  	} else {
5c7d89676bc519 kernel/rcu/tree.c Paul E. McKenney        2018-07-03  2847  		__call_rcu_core(rdp, head, flags);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2848  		local_irq_restore(flags);
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2849  	}
5d6742b37727e1 kernel/rcu/tree.c Paul E. McKenney        2019-05-15  2850  }
64db4cfff99c04 kernel/rcutree.c  Paul E. McKenney        2008-12-18  2851  

:::::: The code at line 2783 was first introduced by commit
:::::: 3cb278e73be58bfb780ecd55129296d2f74c1fb7 rcu: Make call_rcu() lazy to save power

:::::: TO: Joel Fernandes (Google) <joel@joelfernandes.org>
:::::: CC: Paul E. McKenney <paulmck@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
