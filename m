Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E89CA20
	for <llvm@lists.linux.dev>; Mon, 18 Jul 2022 03:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658114247; x=1689650247;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wHnlpTyopzPYx4i3Zg8EzixyCbO3HkFrf2vWUj6FbC8=;
  b=juKDjtI6FcIGd3tNWGvxEHidnJt2dXRU69MwtN0s0Z+C+HSmCRNFIGoI
   WBXloh5eWayjLFXKns4+npFpUziy6SIFl1xtn4va5ij5D4te4EMFOocOK
   d0WsoRsCAxWoHyjb2kbNd6fULgoJGWNCVen1AGFUSXUHoplfCNidJk/h2
   7YClKdZD7CT6zmAn2cXClUteVl4UOCUnulqvPlgm1xYAqcz8omb+ISpVj
   lpqa4F1QL5dfwMiRXfFqszJktlZJOQaOIQcUIVQBag2ekGe2zS5tggEPV
   H4g/4vuFinmXf3cvXU4xcAEOFgdzLMoS+TnK3OvouxF7r++qq6zu18q/v
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10411"; a="265904767"
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="265904767"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2022 20:17:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,280,1650956400"; 
   d="scan'208";a="547317801"
Received: from lkp-server02.sh.intel.com (HELO ff137eb26ff1) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Jul 2022 20:17:11 -0700
Received: from kbuild by ff137eb26ff1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oDHFv-0003yU-78;
	Mon, 18 Jul 2022 03:17:11 +0000
Date: Mon, 18 Jul 2022 11:16:23 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, daniel@iogearbox.net,
	kernel-team@fb.com, jolsa@kernel.org, rostedt@goodmis.org,
	Song Liu <song@kernel.org>
Subject: Re: [PATCH v3 bpf-next 2/4] ftrace: allow IPMODIFY and DIRECT ops on
 the same function
Message-ID: <202207181116.PO2cQ09B-lkp@intel.com>
References: <20220718001405.2236811-3-song@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718001405.2236811-3-song@kernel.org>

Hi Song,

I love your patch! Yet something to improve:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Song-Liu/ftrace-host-klp-and-bpf-trampoline-together/20220718-081533
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
config: powerpc-randconfig-r023-20220717 (https://download.01.org/0day-ci/archive/20220718/202207181116.PO2cQ09B-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d74b88c69dc2644bd0dc5d64e2d7413a0d4040e5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/1535f287d288f9b7540ec50f56da1fe437ac6512
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Song-Liu/ftrace-host-klp-and-bpf-trampoline-together/20220718-081533
        git checkout 1535f287d288f9b7540ec50f56da1fe437ac6512
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/trace/ftrace.c:299:5: warning: no previous prototype for function '__register_ftrace_function' [-Wmissing-prototypes]
   int __register_ftrace_function(struct ftrace_ops *ops)
       ^
   kernel/trace/ftrace.c:299:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __register_ftrace_function(struct ftrace_ops *ops)
   ^
   static 
   kernel/trace/ftrace.c:342:5: warning: no previous prototype for function '__unregister_ftrace_function' [-Wmissing-prototypes]
   int __unregister_ftrace_function(struct ftrace_ops *ops)
       ^
   kernel/trace/ftrace.c:342:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __unregister_ftrace_function(struct ftrace_ops *ops)
   ^
   static 
   kernel/trace/ftrace.c:4030:15: warning: no previous prototype for function 'arch_ftrace_match_adjust' [-Wmissing-prototypes]
   char * __weak arch_ftrace_match_adjust(char *str, const char *search)
                 ^
   kernel/trace/ftrace.c:4030:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   char * __weak arch_ftrace_match_adjust(char *str, const char *search)
   ^
   static 
>> kernel/trace/ftrace.c:8082:14: error: use of undeclared identifier 'direct_mutex'; did you mean 'event_mutex'?
           mutex_lock(&direct_mutex);
                       ^~~~~~~~~~~~
                       event_mutex
   include/linux/mutex.h:187:44: note: expanded from macro 'mutex_lock'
   #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                              ^
   kernel/trace/trace.h:1523:21: note: 'event_mutex' declared here
   extern struct mutex event_mutex;
                       ^
   kernel/trace/ftrace.c:8122:16: error: use of undeclared identifier 'direct_mutex'; did you mean 'event_mutex'?
           mutex_unlock(&direct_mutex);
                         ^~~~~~~~~~~~
                         event_mutex
   kernel/trace/trace.h:1523:21: note: 'event_mutex' declared here
   extern struct mutex event_mutex;
                       ^
   kernel/trace/ftrace.c:8158:17: error: use of undeclared identifier 'direct_mutex'; did you mean 'event_mutex'?
                   mutex_unlock(&direct_mutex);
                                 ^~~~~~~~~~~~
                                 event_mutex
   kernel/trace/trace.h:1523:21: note: 'event_mutex' declared here
   extern struct mutex event_mutex;
                       ^
   kernel/trace/ftrace.c:8178:14: error: use of undeclared identifier 'direct_mutex'; did you mean 'event_mutex'?
           mutex_lock(&direct_mutex);
                       ^~~~~~~~~~~~
                       event_mutex
   include/linux/mutex.h:187:44: note: expanded from macro 'mutex_lock'
   #define mutex_lock(lock) mutex_lock_nested(lock, 0)
                                              ^
   kernel/trace/trace.h:1523:21: note: 'event_mutex' declared here
   extern struct mutex event_mutex;
                       ^
   kernel/trace/ftrace.c:8203:16: error: use of undeclared identifier 'direct_mutex'; did you mean 'event_mutex'?
           mutex_unlock(&direct_mutex);
                         ^~~~~~~~~~~~
                         event_mutex
   kernel/trace/trace.h:1523:21: note: 'event_mutex' declared here
   extern struct mutex event_mutex;
                       ^
   3 warnings and 5 errors generated.


vim +8082 kernel/trace/ftrace.c

  8051	
  8052	/*
  8053	 * When registering ftrace_ops with IPMODIFY, it is necessary to make sure
  8054	 * it doesn't conflict with any direct ftrace_ops. If there is existing
  8055	 * direct ftrace_ops on a kernel function being patched, call
  8056	 * FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_PEER on it to enable sharing.
  8057	 *
  8058	 * @ops:     ftrace_ops being registered.
  8059	 *
  8060	 * Returns:
  8061	 *         0 - @ops does not have IPMODIFY or @ops itself is DIRECT, no
  8062	 *             change needed;
  8063	 *         1 - @ops has IPMODIFY, hold direct_mutex;
  8064	 *         -EBUSY - currently registered DIRECT ftrace_ops cannot share the
  8065	 *                  same function with IPMODIFY, abort the register.
  8066	 *         -EAGAIN - cannot make changes to currently registered DIRECT
  8067	 *                   ftrace_ops due to rare race conditions. Should retry
  8068	 *                   later. This is needed to avoid potential deadlocks
  8069	 *                   on the DIRECT ftrace_ops side.
  8070	 */
  8071	static int prepare_direct_functions_for_ipmodify(struct ftrace_ops *ops)
  8072		__acquires(&direct_mutex)
  8073	{
  8074		struct ftrace_func_entry *entry;
  8075		struct ftrace_hash *hash;
  8076		struct ftrace_ops *op;
  8077		int size, i, ret;
  8078	
  8079		if (!(ops->flags & FTRACE_OPS_FL_IPMODIFY))
  8080			return 0;
  8081	
> 8082		mutex_lock(&direct_mutex);
  8083	
  8084		hash = ops->func_hash->filter_hash;
  8085		size = 1 << hash->size_bits;
  8086		for (i = 0; i < size; i++) {
  8087			hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
  8088				unsigned long ip = entry->ip;
  8089				bool found_op = false;
  8090	
  8091				mutex_lock(&ftrace_lock);
  8092				do_for_each_ftrace_op(op, ftrace_ops_list) {
  8093					if (!(op->flags & FTRACE_OPS_FL_DIRECT))
  8094						continue;
  8095					if (ops_references_ip(op, ip)) {
  8096						found_op = true;
  8097						break;
  8098					}
  8099				} while_for_each_ftrace_op(op);
  8100				mutex_unlock(&ftrace_lock);
  8101	
  8102				if (found_op) {
  8103					if (!op->ops_func) {
  8104						ret = -EBUSY;
  8105						goto err_out;
  8106					}
  8107					ret = op->ops_func(op, FTRACE_OPS_CMD_ENABLE_SHARE_IPMODIFY_PEER);
  8108					if (ret)
  8109						goto err_out;
  8110				}
  8111			}
  8112		}
  8113	
  8114		/*
  8115		 * Didn't find any overlap with direct ftrace_ops, or the direct
  8116		 * function can share with ipmodify. Hold direct_mutex to make sure
  8117		 * this doesn't change until we are done.
  8118		 */
  8119		return 1;
  8120	
  8121	err_out:
  8122		mutex_unlock(&direct_mutex);
  8123		return ret;
  8124	}
  8125	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
