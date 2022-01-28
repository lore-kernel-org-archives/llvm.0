Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9AD168
	for <llvm@lists.linux.dev>; Fri, 28 Jan 2022 03:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643342334; x=1674878334;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BR4Yqa7ykBYTQwkzjXPFMgmOOrl9yMvDCOwba+0V+4k=;
  b=et8jing7wvLYWTleqOwt0FKMcwFPLRHG9rd2M4RdVGrGO3OVjvA8o2Fx
   9xB32rWylZFL7MO+l7+XVEhaZjygVaqj6lqL+JvstH270Y+QPVf6TbIS8
   DnTs9a6nS33HT/q6cqzDyJRazYXcFWP9o1p4lW4aOtNMdqWk8B9GbcSqd
   4bzhI4xdk6w8Vcj9CvvMJin8NE/qOJnpF3o1rhhM+UhPGsI6LJSeXR0D9
   EWT4IrI29U9swwUpbwZ2Qajy6M0BJqXWPwl/jLCGUT8T356SHf4IXT1OJ
   LFs7XyBf2Z0BxbIuoBvvX+axgA1KJyNYzvQIkOpX4do/x3Tv1HHMsuaSV
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="227019121"
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; 
   d="scan'208";a="227019121"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2022 19:58:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,322,1635231600"; 
   d="scan'208";a="628969092"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Jan 2022 19:58:52 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDIPU-000NQB-2Y; Fri, 28 Jan 2022 03:58:52 +0000
Date: Fri, 28 Jan 2022 11:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: Bob Pearson <rpearsonhpe@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH v9 24/26] RDMA/rxe: Add wait_for_completion to pool
 objects
Message-ID: <202201281100.RzpcbUSw-lkp@intel.com>
References: <20220127213755.31697-25-rpearsonhpe@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127213755.31697-25-rpearsonhpe@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Bob,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on rdma/for-next]
[also build test WARNING on v5.17-rc1 next-20220127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Bob-Pearson/RDMA-rxe-Move-rxe_mcast_add-delete-to-rxe_mcast-c/20220128-063757
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma.git for-next
config: x86_64-randconfig-a016-20220124 (https://download.01.org/0day-ci/archive/20220128/202201281100.RzpcbUSw-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/0b97a20ee58915580069267b6e4ec2e643dc12b5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bob-Pearson/RDMA-rxe-Move-rxe_mcast_add-delete-to-rxe_mcast-c/20220128-063757
        git checkout 0b97a20ee58915580069267b6e4ec2e643dc12b5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/infiniband/sw/rxe/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/infiniband/sw/rxe/rxe_pool.c:287:2: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (timeout) {
           ^~~~~~~~~~~~
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if_var'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/infiniband/sw/rxe/rxe_pool.c:303:9: note: uninitialized use occurs here
           return ret;
                  ^~~
   drivers/infiniband/sw/rxe/rxe_pool.c:287:2: note: remove the 'if' if its condition is always true
           if (timeout) {
           ^~~~~~~~~~~~~
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/infiniband/sw/rxe/rxe_pool.c:285:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   1 warning generated.


vim +287 drivers/infiniband/sw/rxe/rxe_pool.c

   279	
   280	int __rxe_wait(struct rxe_pool_elem *elem)
   281	{
   282		struct rxe_pool *pool = elem->pool;
   283		static int timeout = RXE_POOL_TIMEOUT;
   284		static int timeout_failures;
   285		int ret;
   286	
 > 287		if (timeout) {

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
