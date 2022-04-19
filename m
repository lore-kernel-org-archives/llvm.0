Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C796A23
	for <llvm@lists.linux.dev>; Tue, 19 Apr 2022 03:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650338783; x=1681874783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+QISWs4fMwsMVKIBPuBSRZ9kMAUjuYmYVVU7WsKJDw=;
  b=GPqjBiqcPh6pU6wnwN9zaIaFbQkfuZNcsA4G4lRo+RdzwFt3loDYQK7R
   x65SYnST+GzoEaq37asDc5zqcPbsaRlRA4o2IJKaZrqXW7KjrJzZxH4uN
   yDSQ56+40DNJw/P6JSvDOY6Mx5MnMxmonfQzzIeNB5hSLkEWpiN7CvH/U
   ZvSUPMiAOlp5FH/5civcYfOmZcJanP4kVfM6ctZ0K6929zbIg5Kgr3R4c
   agUT5x60w/4GPwhH3bqiJMgDLcFW9Og71nL68MMpQj2DaF2qYVqg8OtCi
   4UgwM79Fr3e5GcaueXinki6wj+HjbLTSW68McQeZ6rB+AxCpd54MShXhZ
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="263125977"
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="263125977"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 20:26:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="561559520"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 18 Apr 2022 20:26:21 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngeVQ-0005Hv-AF;
	Tue, 19 Apr 2022 03:26:20 +0000
Date: Tue, 19 Apr 2022 11:26:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1662/2356]
 include/linux/bpf-cgroup-api.h:99:17: warning: incompatible integer to
 pointer conversion initializing 'struct cgroup *' with an expression of type
 'int'
Message-ID: <202204191109.jMo5t4hA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   af93551cf39027d176f30b9beafc60a4c130998a
commit: 946f6b0a519a1210d974a40c8400726c341e0bd6 [1662/2356] headers/deps: cgroup: Split <linux/bpf-cgroup.h> into <linux/bpf-cgroup-types.h> and <linux/bpf-cgroup-api.h>
config: x86_64-randconfig-a013-20220418 (https://download.01.org/0day-ci/archive/20220419/202204191109.jMo5t4hA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=946f6b0a519a1210d974a40c8400726c341e0bd6
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 946f6b0a519a1210d974a40c8400726c341e0bd6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/bpf/ mm/ net/ipv4/ sound/soc/codecs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/cgroup.c:17:
   include/linux/bpf-cgroup-api.h:99:24: error: implicit declaration of function 'sock_cgroup_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
                                 ^
>> include/linux/bpf-cgroup-api.h:99:17: warning: incompatible integer to pointer conversion initializing 'struct cgroup *' with an expression of type 'int' [-Wint-conversion]
           struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
                          ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/bpf/cgroup.c:31:
   In file included from kernel/bpf/../cgroup/cgroup-internal.h:7:
   include/linux/cgroup_api.h:875:30: error: static declaration of 'sock_cgroup_ptr' follows non-static declaration
   static inline struct cgroup *sock_cgroup_ptr(struct sock_cgroup_data *skcd)
                                ^
   include/linux/bpf-cgroup-api.h:99:24: note: previous implicit declaration is here
           struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
                                 ^
   1 warning and 2 errors generated.
--
   In file included from net/ipv4/udp.c:103:
   include/linux/bpf-cgroup-api.h:99:24: error: implicit declaration of function 'sock_cgroup_ptr' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
                                 ^
>> include/linux/bpf-cgroup-api.h:99:17: warning: incompatible integer to pointer conversion initializing 'struct cgroup *' with an expression of type 'int' [-Wint-conversion]
           struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
                          ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +99 include/linux/bpf-cgroup-api.h

    90	
    91	int bpf_percpu_cgroup_storage_copy(struct bpf_map *map, void *key, void *value);
    92	int bpf_percpu_cgroup_storage_update(struct bpf_map *map, void *key,
    93					     void *value, u64 flags);
    94	
    95	/* Opportunistic check to see whether we have any BPF program attached*/
    96	static inline bool cgroup_bpf_sock_enabled(struct sock *sk,
    97						   enum cgroup_bpf_attach_type type)
    98	{
  > 99		struct cgroup *cgrp = sock_cgroup_ptr(&sk->sk_cgrp_data);
   100		struct bpf_prog_array *array;
   101	
   102		array = rcu_access_pointer(cgrp->bpf.effective[type]);
   103		return array != &bpf_empty_prog_array.hdr;
   104	}
   105	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
