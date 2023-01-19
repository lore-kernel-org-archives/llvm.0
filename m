Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0E0A950;
	Thu, 19 Jan 2023 18:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674152707; x=1705688707;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u1TUuDptLEEsupT+RCtp6Kp30n28CSGifqto2IRadRE=;
  b=kU7e27fAl1rvA/uP58LY5msU0IDZ8+OqTLQpHFTFgM71IA052qhIkLBB
   EUzHYHyHbSdK2MpU0zbxCaP/RZjKbUSqO6SwQWjBRXjZqwoiVJBtgvaVM
   iu17SifBQEU4UE97IDOV5I45wq9sVlHWjLVD0TDtc50ej6PFKA9KYNtfb
   Vpr8ENl73E4ovFJh52ipEuFf6DtLcXm/6dNL9Rf+wqJVTpA4F+2BI9B8H
   Gq0/GxE+Ttt/p2RZNN3uI5emXK2vRJlKCiZVRyUCqTjp2wzmL1wcAIMpr
   h68KrLej/G1QknU8Mr1UCiEGdTEBDK+rPFYiVIn2gxEeO/NFxx9qbjhwW
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305741386"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="305741386"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 10:25:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="802743513"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; 
   d="scan'208";a="802743513"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2023 10:25:05 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIZaz-0001j2-05;
	Thu, 19 Jan 2023 18:25:05 +0000
Date: Fri, 20 Jan 2023 02:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_1 26/27] kernel/trace/ftrace.c:5862:6:
 error: call to undeclared function 'check_direct_multi'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202301200210.lm9fYmJI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_1
head:   747784185d106a06b429736196d8817cb2d12a6f
commit: 7123e09cc1ac548e8e3baa43005779ae0dc181e0 [26/27] ftrace: Add set_filter_ftrace_direct_multi function
config: arm-randconfig-r023-20230118 (https://download.01.org/0day-ci/archive/20230120/202301200210.lm9fYmJI-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git/commit/?id=7123e09cc1ac548e8e3baa43005779ae0dc181e0
        git remote add jolsa-perf https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git
        git fetch --no-tags jolsa-perf bpf/tracing_multi_1
        git checkout 7123e09cc1ac548e8e3baa43005779ae0dc181e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from kernel/trace/ftrace.c:46:
   In file included from kernel/trace/trace_output.h:6:
   In file included from kernel/trace/trace.h:17:
   include/linux/trace_events.h:798:5: warning: no previous prototype for function 'bpf_tracing_multi_attach' [-Wmissing-prototypes]
   int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
       ^
   include/linux/trace_events.h:798:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int bpf_tracing_multi_attach(struct bpf_prog *prog, const union bpf_attr *attr)
   ^
   static 
   kernel/trace/ftrace.c:300:5: warning: no previous prototype for function '__register_ftrace_function' [-Wmissing-prototypes]
   int __register_ftrace_function(struct ftrace_ops *ops)
       ^
   kernel/trace/ftrace.c:300:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __register_ftrace_function(struct ftrace_ops *ops)
   ^
   static 
   kernel/trace/ftrace.c:343:5: warning: no previous prototype for function '__unregister_ftrace_function' [-Wmissing-prototypes]
   int __unregister_ftrace_function(struct ftrace_ops *ops)
       ^
   kernel/trace/ftrace.c:343:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __unregister_ftrace_function(struct ftrace_ops *ops)
   ^
   static 
   kernel/trace/ftrace.c:4010:15: warning: no previous prototype for function 'arch_ftrace_match_adjust' [-Wmissing-prototypes]
   char * __weak arch_ftrace_match_adjust(char *str, const char *search)
                 ^
   kernel/trace/ftrace.c:4010:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   char * __weak arch_ftrace_match_adjust(char *str, const char *search)
   ^
   static 
>> kernel/trace/ftrace.c:5862:6: error: call to undeclared function 'check_direct_multi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (check_direct_multi(ops))
               ^
>> kernel/trace/ftrace.c:5874:14: error: use of undeclared identifier 'direct_mutex'; did you mean 'event_mutex'?
           mutex_lock(&direct_mutex);
                       ^~~~~~~~~~~~
                       event_mutex
   include/linux/mutex.h:187:44: note: expanded from macro 'mutex_lock'
   #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                              ^
   kernel/trace/trace.h:1509:21: note: 'event_mutex' declared here
   extern struct mutex event_mutex;
                       ^
>> kernel/trace/ftrace.c:5894:8: error: call to undeclared function 'add_direct_functions_hash'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           err = add_direct_functions_hash(hash_add, addr, &free_hash);
                 ^
>> kernel/trace/ftrace.c:5896:3: error: call to undeclared function 'remove_direct_functions_hash'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   remove_direct_functions_hash(hash_add, addr);
                   ^
   kernel/trace/ftrace.c:5900:2: error: call to undeclared function 'remove_direct_functions_hash'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           remove_direct_functions_hash(hash_del, addr);
           ^
   kernel/trace/ftrace.c:5909:16: error: use of undeclared identifier 'direct_mutex'; did you mean 'event_mutex'?
           mutex_unlock(&direct_mutex);
                         ^~~~~~~~~~~~
                         event_mutex
   kernel/trace/trace.h:1509:21: note: 'event_mutex' declared here
   extern struct mutex event_mutex;
                       ^
   kernel/trace/ftrace.c:5853:5: warning: no previous prototype for function 'set_filter_ftrace_direct_multi' [-Wmissing-prototypes]
   int set_filter_ftrace_direct_multi(struct ftrace_ops *ops, unsigned long *ips,
       ^
   kernel/trace/ftrace.c:5853:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_filter_ftrace_direct_multi(struct ftrace_ops *ops, unsigned long *ips,
   ^
   static 
   5 warnings and 6 errors generated.


vim +/check_direct_multi +5862 kernel/trace/ftrace.c

  5852	
  5853	int set_filter_ftrace_direct_multi(struct ftrace_ops *ops, unsigned long *ips,
  5854					   unsigned int cnt, unsigned long addr)
  5855	{
  5856		struct ftrace_hash *free_hash = NULL, *rollback_hash = NULL;
  5857		struct ftrace_hash *hash = ops->func_hash->filter_hash;
  5858		struct ftrace_hash *hash_del = NULL, *hash_add = NULL;
  5859		struct ftrace_func_entry *entry;
  5860		int size, i, err = -ENOMEM;
  5861	
> 5862		if (check_direct_multi(ops))
  5863			return -EINVAL;
  5864		if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
  5865			return -EINVAL;
  5866	
  5867		sort(ips, cnt, sizeof(*ips), ips_cmp, NULL);
  5868	
  5869		hash_add = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
  5870		hash_del = alloc_ftrace_hash(FTRACE_HASH_DEFAULT_BITS);
  5871		if (!hash_add || !hash_del)
  5872			goto out;
  5873	
> 5874		mutex_lock(&direct_mutex);
  5875	
  5876		size = 1 << hash->size_bits;
  5877		for (i = 0; i < size; i++) {
  5878			hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
  5879				if (bsearch(&entry->ip, ips, cnt, sizeof(*ips), ips_cmp))
  5880					continue;
  5881				if (add_hash_entry(hash_del, entry->ip) < 0)
  5882					goto out_unlock;
  5883			}
  5884		}
  5885	
  5886		for (i = 0; i < cnt; i++) {
  5887			entry = ftrace_lookup_ip(hash, ips[i]);
  5888			if (!entry)
  5889				continue;
  5890			if (add_hash_entry(hash_add, entry->ip) < 0)
  5891				goto out_unlock;
  5892		}
  5893	
> 5894		err = add_direct_functions_hash(hash_add, addr, &free_hash);
  5895		if (err) {
> 5896			remove_direct_functions_hash(hash_add, addr);
  5897			goto out_unlock;
  5898		}
  5899	
  5900		remove_direct_functions_hash(hash_del, addr);
  5901	
  5902		err = ftrace_set_filter_ips(ops, ips, cnt, 0, 1);
  5903		if (err) {
  5904			WARN_ON_ONCE(add_direct_functions_hash(hash_del, addr, &rollback_hash));
  5905			remove_direct_functions_hash(hash_add, addr);
  5906		}
  5907	
  5908	out_unlock:
  5909		mutex_unlock(&direct_mutex);
  5910	out:
  5911		if (free_hash || rollback_hash) {
  5912			synchronize_rcu_tasks();
  5913			free_ftrace_hash(free_hash);
  5914			free_ftrace_hash(rollback_hash);
  5915		}
  5916		free_ftrace_hash(hash_add);
  5917		free_ftrace_hash(hash_del);
  5918		return err;
  5919	}
  5920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
