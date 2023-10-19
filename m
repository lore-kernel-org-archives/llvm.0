Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86E42F32;
	Thu, 19 Oct 2023 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hC61ytg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697721734; x=1729257734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V6fNCVrBZak03ofrKj5h/effpk2MBi/SUU+OVWKd6ks=;
  b=hC61ytg2YPIZ2aFwxWGj4zFOtxKdt/C2+KdrLtjgcBG/V+UkYVWVFMpr
   sBF3aL2JSBc61etwuUFOv5divNr7GIZK2CPzdHaJdL6sFt195qgBe8fC/
   hjH+EECTk/G3ePWDs+4PQ4VecPgSOktK7jnIC52Izmr5n507c1AZ0LOw7
   iGFi91kVVuBkP4Za8Hna4D/krETLeHCYFi7zUWJOak/K9606FJtNictVC
   WLWRy7HL1RkoesNJPJEHq82LgelrU+2oQfUHRfGWO2/oQFcI2tDIi/u6K
   lQlfElXv2ctq1umdW1+ZFNfM2NWdJFnHQKpMSIv0ueD7battm8BKzLube
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385124544"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="385124544"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 06:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="757028502"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="757028502"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 19 Oct 2023 06:22:11 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtSyX-00028k-0w;
	Thu, 19 Oct 2023 13:22:09 +0000
Date: Thu, 19 Oct 2023 21:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/ilb-no-needs-kick 1/3] kernel/sched/fair.c:11304:33:
 error: use of undeclared identifier 'nohz'
Message-ID: <202310192109.TvZ8nH5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/ilb-no-needs-kick
head:   6a27fea4c21f111a2cb84908a209092104ed18fa
commit: 52bc56376f3116e32c1cd4f9e00b9fff380ec0c3 [1/3] sched/nohz: Update nohz.next_balance directly without IPIs (v2)
config: powerpc-akebono_defconfig (https://download.01.org/0day-ci/archive/20231019/202310192109.TvZ8nH5G-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310192109.TvZ8nH5G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310192109.TvZ8nH5G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/fair.c:11304:33: error: use of undeclared identifier 'nohz'
    11304 |                 nohz_next_balance = READ_ONCE(nohz.next_balance);
          |                                               ^
>> kernel/sched/fair.c:11304:33: error: use of undeclared identifier 'nohz'
>> kernel/sched/fair.c:11304:33: error: use of undeclared identifier 'nohz'
>> kernel/sched/fair.c:11304:33: error: use of undeclared identifier 'nohz'
>> kernel/sched/fair.c:11304:33: error: use of undeclared identifier 'nohz'
>> kernel/sched/fair.c:11304:33: error: use of undeclared identifier 'nohz'
>> kernel/sched/fair.c:11304:33: error: use of undeclared identifier 'nohz'
>> kernel/sched/fair.c:11304:21: error: assigning to 'unsigned long' from incompatible type 'void'
    11304 |                 nohz_next_balance = READ_ONCE(nohz.next_balance);
          |                                   ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:24: error: use of undeclared identifier 'nohz'
    11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
          |                               ^
   kernel/sched/fair.c:11307:24: error: use of undeclared identifier 'nohz'
>> kernel/sched/fair.c:11307:11: error: expected ';' at end of declaration
    11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
          |                  ^
   include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from macro 'try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:191:41: note: expanded from macro 'raw_try_cmpxchg'
     191 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                                ^
>> kernel/sched/fair.c:11307:11: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from macro 'try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:192:2: note: expanded from macro 'raw_try_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |         ^
>> kernel/sched/fair.c:11307:11: error: use of undeclared identifier '___o'
   include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from macro 'try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:192:29: note: expanded from macro 'raw_try_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                                    ^
>> kernel/sched/fair.c:11307:11: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from macro 'try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:193:15: note: expanded from macro 'raw_try_cmpxchg'
     193 |         if (unlikely(___r != ___o)) \
         |                      ^
>> kernel/sched/fair.c:11307:11: error: use of undeclared identifier '___o'
   include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from macro 'try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:193:23: note: expanded from macro 'raw_try_cmpxchg'
     193 |         if (unlikely(___r != ___o)) \
         |                              ^
>> kernel/sched/fair.c:11307:11: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from macro 'try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:194:12: note: expanded from macro 'raw_try_cmpxchg'
     194 |                 *___op = ___r; \
         |                          ^
>> kernel/sched/fair.c:11307:11: error: use of undeclared identifier '___r'
   include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from macro 'try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:195:9: note: expanded from macro 'raw_try_cmpxchg'
     195 |         likely(___r == ___o); \
         |                ^
>> kernel/sched/fair.c:11307:11: error: use of undeclared identifier '___o'
   include/linux/atomic/atomic-instrumented.h:4838:2: note: expanded from macro 'try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^
   include/linux/atomic/atomic-arch-fallback.h:195:17: note: expanded from macro 'raw_try_cmpxchg'
     195 |         likely(___r == ___o); \
         |                        ^
>> kernel/sched/fair.c:11307:10: error: invalid argument type 'void' to unary expression
    11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    11308 |                              next_balance));
          |                              ~~~~~~~~~~~~~
   kernel/sched/fair.c:12831:6: warning: no previous prototype for function 'free_fair_sched_group' [-Wmissing-prototypes]
    12831 | void free_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:12831:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12831 | void free_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:12833:5: warning: no previous prototype for function 'alloc_fair_sched_group' [-Wmissing-prototypes]
    12833 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          |     ^
   kernel/sched/fair.c:12833:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12833 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
          | ^
          | static 
   kernel/sched/fair.c:12838:6: warning: no previous prototype for function 'online_fair_sched_group' [-Wmissing-prototypes]
    12838 | void online_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:12838:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12838 | void online_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   kernel/sched/fair.c:12840:6: warning: no previous prototype for function 'unregister_fair_sched_group' [-Wmissing-prototypes]
    12840 | void unregister_fair_sched_group(struct task_group *tg) { }
          |      ^
   kernel/sched/fair.c:12840:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12840 | void unregister_fair_sched_group(struct task_group *tg) { }
          | ^
          | static 
   4 warnings and 19 errors generated.


vim +/nohz +11304 kernel/sched/fair.c

 11296	
 11297	static inline void
 11298	update_nohz_next_balance(unsigned long next_balance)
 11299	{
 11300		unsigned long nohz_next_balance;
 11301	
 11302		/* In event of a race, only update with the earliest next_balance. */
 11303		do {
 11304			nohz_next_balance = READ_ONCE(nohz.next_balance);
 11305			if (!time_after(nohz_next_balance, next_balance))
 11306				break;
 11307		} while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
 11308				     next_balance));
 11309	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
