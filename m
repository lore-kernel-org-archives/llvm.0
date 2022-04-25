Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5567E
	for <llvm@lists.linux.dev>; Mon, 25 Apr 2022 10:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650883719; x=1682419719;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0mbIhck+jjU2XzbIxIhmt3HK+K6JOzbHyY1ebbKhTjQ=;
  b=Fr83paiMP7EaHJMNwW3U5zC2Oex3MetpnDEq01wvgQ3raM8FQVsIB+Om
   098hynJts1q+N7wwI6z8qe/ZJH5j7sSFuSj7Gx5kZAWkqXg7IbSTKCQK8
   BWqNvRujYMfKl335ZA+v+5tJWm5+BDz1fJpt7F+pa7naQNZjBPkZoulPw
   Wq8/6+XcM1mVPv/FeBBqLVR9XPzoU+cylSm+A11U07H7QvpO4DSXM0k27
   YE9NoGG5QxbO0wR/EKcsvB1j9Gmb5N3zuXN64NNC+h+ETLrfDN5mJJoeN
   mfuyXT1PMK1vXiRW2TCF67DKrN5x0d48qKxTzlLB8EFJ2RW2v6OVCu9t5
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10327"; a="325699432"
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="325699432"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2022 03:48:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,287,1643702400"; 
   d="scan'208";a="649643420"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 25 Apr 2022 03:48:15 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1niwGN-0002Lf-2P;
	Mon, 25 Apr 2022 10:48:15 +0000
Date: Mon, 25 Apr 2022 18:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Zqiang <qiang1.zhang@intel.com>, paulmck@kernel.org,
	frederic@kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, rcu@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rcu: Add nocb_cb_kthread check to
 rcu_is_callbacks_kthread()
Message-ID: <202204251856.LJC9zzoY-lkp@intel.com>
References: <20220425082309.3328723-1-qiang1.zhang@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220425082309.3328723-1-qiang1.zhang@intel.com>

Hi Zqiang,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on paulmck-rcu/dev]
[also build test ERROR on v5.18-rc4 next-20220422]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Zqiang/rcu-Add-nocb_cb_kthread-check-to-rcu_is_callbacks_kthread/20220425-162445
base:   https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git dev
config: arm-randconfig-r026-20220425 (https://download.01.org/0day-ci/archive/20220425/202204251856.LJC9zzoY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/c909d116f928cbb9de2daf60a572f3f8a81cc4f4
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Zqiang/rcu-Add-nocb_cb_kthread-check-to-rcu_is_callbacks_kthread/20220425-162445
        git checkout c909d116f928cbb9de2daf60a572f3f8a81cc4f4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:318:9: note: expanded from macro '__pcpu_size_call_return'
           typeof(variable) pscr_ret__;                                    \
                  ^~~~~~~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:319:22: note: expanded from macro '__pcpu_size_call_return'
           __verify_pcpu_ptr(&(variable));                                 \
                               ^~~~~~~~
   include/linux/percpu-defs.h:219:47: note: expanded from macro '__verify_pcpu_ptr'
           const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
                                                        ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:320:16: note: expanded from macro '__pcpu_size_call_return'
           switch(sizeof(variable)) {                                      \
                         ^~~~~~~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:321:31: note: expanded from macro '__pcpu_size_call_return'
           case 1: pscr_ret__ = stem##1(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:259:20: note: expanded from macro 'VERIFY_PERCPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
                             ^~~
   include/linux/percpu-defs.h:219:47: note: expanded from macro '__verify_pcpu_ptr'
           const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
                                                        ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:321:31: note: expanded from macro '__pcpu_size_call_return'
           case 1: pscr_ret__ = stem##1(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:264:38: note: expanded from macro 'raw_cpu_ptr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                               ^~~
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:260:12: note: expanded from macro 'VERIFY_PERCPU_PTR'
           (typeof(*(__p)) __kernel __force *)(__p);                       \
                     ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:321:31: note: expanded from macro '__pcpu_size_call_return'
           case 1: pscr_ret__ = stem##1(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:264:38: note: expanded from macro 'raw_cpu_ptr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                               ^~~
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:260:38: note: expanded from macro 'VERIFY_PERCPU_PTR'
           (typeof(*(__p)) __kernel __force *)(__p);                       \
                                               ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:3: error: indirection requires pointer operand ('void' invalid)
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
           ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:321:23: note: expanded from macro '__pcpu_size_call_return'
           case 1: pscr_ret__ = stem##1(variable); break;                  \
                                ^~~~~~~~~~~~~~~~~
   <scratch space>:40:1: note: expanded from here
   raw_cpu_read_1
   ^
   include/asm-generic/percpu.h:195:30: note: expanded from macro 'raw_cpu_read_1'
   #define raw_cpu_read_1(pcp)             raw_cpu_generic_read(pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:67:2: note: expanded from macro 'raw_cpu_generic_read'
           *raw_cpu_ptr(&(pcp));                                           \
           ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:322:31: note: expanded from macro '__pcpu_size_call_return'
           case 2: pscr_ret__ = stem##2(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:259:20: note: expanded from macro 'VERIFY_PERCPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
                             ^~~
   include/linux/percpu-defs.h:219:47: note: expanded from macro '__verify_pcpu_ptr'
           const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
                                                        ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:322:31: note: expanded from macro '__pcpu_size_call_return'
           case 2: pscr_ret__ = stem##2(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:264:38: note: expanded from macro 'raw_cpu_ptr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                               ^~~
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:260:12: note: expanded from macro 'VERIFY_PERCPU_PTR'
           (typeof(*(__p)) __kernel __force *)(__p);                       \
                     ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:322:31: note: expanded from macro '__pcpu_size_call_return'
           case 2: pscr_ret__ = stem##2(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:264:38: note: expanded from macro 'raw_cpu_ptr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                               ^~~
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:260:38: note: expanded from macro 'VERIFY_PERCPU_PTR'
           (typeof(*(__p)) __kernel __force *)(__p);                       \
                                               ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:3: error: indirection requires pointer operand ('void' invalid)
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
           ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:322:23: note: expanded from macro '__pcpu_size_call_return'
           case 2: pscr_ret__ = stem##2(variable); break;                  \
                                ^~~~~~~~~~~~~~~~~
   <scratch space>:41:1: note: expanded from here
   raw_cpu_read_2
   ^
   include/asm-generic/percpu.h:198:30: note: expanded from macro 'raw_cpu_read_2'
   #define raw_cpu_read_2(pcp)             raw_cpu_generic_read(pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:67:2: note: expanded from macro 'raw_cpu_generic_read'
           *raw_cpu_ptr(&(pcp));                                           \
           ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:323:31: note: expanded from macro '__pcpu_size_call_return'
           case 4: pscr_ret__ = stem##4(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:259:20: note: expanded from macro 'VERIFY_PERCPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
                             ^~~
   include/linux/percpu-defs.h:219:47: note: expanded from macro '__verify_pcpu_ptr'
           const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
                                                        ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:323:31: note: expanded from macro '__pcpu_size_call_return'
           case 4: pscr_ret__ = stem##4(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:264:38: note: expanded from macro 'raw_cpu_ptr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                               ^~~
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:260:12: note: expanded from macro 'VERIFY_PERCPU_PTR'
           (typeof(*(__p)) __kernel __force *)(__p);                       \
                     ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:323:31: note: expanded from macro '__pcpu_size_call_return'
           case 4: pscr_ret__ = stem##4(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:264:38: note: expanded from macro 'raw_cpu_ptr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                               ^~~
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:260:38: note: expanded from macro 'VERIFY_PERCPU_PTR'
           (typeof(*(__p)) __kernel __force *)(__p);                       \
                                               ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:3: error: indirection requires pointer operand ('void' invalid)
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
           ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:323:23: note: expanded from macro '__pcpu_size_call_return'
           case 4: pscr_ret__ = stem##4(variable); break;                  \
                                ^~~~~~~~~~~~~~~~~
   <scratch space>:42:1: note: expanded from here
   raw_cpu_read_4
   ^
   include/asm-generic/percpu.h:201:30: note: expanded from macro 'raw_cpu_read_4'
   #define raw_cpu_read_4(pcp)             raw_cpu_generic_read(pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:67:2: note: expanded from macro 'raw_cpu_generic_read'
           *raw_cpu_ptr(&(pcp));                                           \
           ^~~~~~~~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:324:31: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:259:20: note: expanded from macro 'VERIFY_PERCPU_PTR'
           __verify_pcpu_ptr(__p);                                         \
                             ^~~
   include/linux/percpu-defs.h:219:47: note: expanded from macro '__verify_pcpu_ptr'
           const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
                                                        ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:324:31: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:264:38: note: expanded from macro 'raw_cpu_ptr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                               ^~~
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:260:12: note: expanded from macro 'VERIFY_PERCPU_PTR'
           (typeof(*(__p)) __kernel __force *)(__p);                       \
                     ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:28: error: no member named 'nocb_cb_kthread' in 'struct rcu_data'
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                                   ~~~~~~~~ ^
   include/linux/percpu-defs.h:446:15: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
                        ^~~
   include/linux/percpu-defs.h:420:67: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                                                                  ^~~
   include/linux/percpu-defs.h:324:31: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                        ^~~~~~~~
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/percpu-defs.h:264:38: note: expanded from macro 'raw_cpu_ptr'
   #define raw_cpu_ptr(ptr)        per_cpu_ptr(ptr, 0)
                                               ^~~
   include/linux/percpu-defs.h:263:65: note: expanded from macro 'per_cpu_ptr'
   #define per_cpu_ptr(ptr, cpu)   ({ (void)(cpu); VERIFY_PERCPU_PTR(ptr); })
                                                                     ^~~
   include/linux/percpu-defs.h:260:38: note: expanded from macro 'VERIFY_PERCPU_PTR'
           (typeof(*(__p)) __kernel __force *)(__p);                       \
                                               ^~~
   In file included from kernel/rcu/tree.c:5032:
>> kernel/rcu/tree_plugin.h:1161:3: error: indirection requires pointer operand ('void' invalid)
                   __this_cpu_read(rcu_data.nocb_cb_kthread) == current;
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:446:2: note: expanded from macro '__this_cpu_read'
           raw_cpu_read(pcp);                                              \
           ^~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:420:28: note: expanded from macro 'raw_cpu_read'
   #define raw_cpu_read(pcp)               __pcpu_size_call_return(raw_cpu_read_, pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:324:23: note: expanded from macro '__pcpu_size_call_return'
           case 8: pscr_ret__ = stem##8(variable); break;                  \
                                ^~~~~~~~~~~~~~~~~
   <scratch space>:43:1: note: expanded from here
   raw_cpu_read_8
   ^
   include/asm-generic/percpu.h:204:30: note: expanded from macro 'raw_cpu_read_8'
   #define raw_cpu_read_8(pcp)             raw_cpu_generic_read(pcp)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:67:2: note: expanded from macro 'raw_cpu_generic_read'
           *raw_cpu_ptr(&(pcp));                                           \
           ^~~~~~~~~~~~~~~~~~~~
   19 errors generated.


vim +1161 kernel/rcu/tree_plugin.h

  1153	
  1154	/*
  1155	 * Is the current CPU running the RCU-callbacks kthread?
  1156	 * Caller must have preemption disabled.
  1157	 */
  1158	static bool rcu_is_callbacks_kthread(void)
  1159	{
  1160		return __this_cpu_read(rcu_data.rcu_cpu_kthread_task) == current ||
> 1161			__this_cpu_read(rcu_data.nocb_cb_kthread) == current;
  1162	}
  1163	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
