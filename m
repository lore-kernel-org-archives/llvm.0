Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CA323DE
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 12:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645013738; x=1676549738;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=V3WXst2UAa4+FudQeKgnaqEuNtLgDf+Kth3SHU50NJU=;
  b=jUZA11fnOUdrr1R8vxDzUA+PheIUMOj4Lzwd8gQQa0gHF0ZLN0CsD5Pd
   okofIuaMXWb8wfh/MTh1cGQoDXlzq3pIO96z5TXV8UuEyMNezyBJonZdW
   LkWcMny4gYbRvCwuKVGGjCfulXYvlU69osdiE5d+1ifIXZllozlrtKewg
   Ab43XsNSZScDSnd18N620UcLkT31UjMEGlir7Dd/y76eANa5hAP6S59cJ
   v5XZhOzeV5H5J/U8AbDT6ruogX5vi1vrDz1ZiteZxIyBhvuGIFjRrEvqn
   azceFg+xBz3Ivyyt9BgHU8ii2Dpkin3L4LMdtxecdsbAZxyAM7LuxgtC9
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="230552495"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="230552495"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 04:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="588398004"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2022 04:15:36 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKJDb-000Amj-V0; Wed, 16 Feb 2022 12:15:35 +0000
Date: Wed, 16 Feb 2022 20:15:17 +0800
From: kernel test robot <lkp@intel.com>
To: Xin Hao <xhao@linux.alibaba.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH V1 3/5] mm/damon: Add 'damon_region' NUMA access
 statistics core implementation
Message-ID: <202202162010.gxDXd2ex-lkp@intel.com>
References: <de07c5a70a0a2f5aa86fe92581acd0b3ac8a8e18.1645024354.git.xhao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de07c5a70a0a2f5aa86fe92581acd0b3ac8a8e18.1645024354.git.xhao@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Xin,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc4]
[cannot apply to hnaz-mm/master rostedt-trace/for-next next-20220216]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Xin-Hao/mm-damon-Add-NUMA-access-statistics-function-support/20220216-163243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git c5d9ae265b105d9a67575fb67bd4650a6fc08e25
config: hexagon-randconfig-r045-20220216 (https://download.01.org/0day-ci/archive/20220216/202202162010.gxDXd2ex-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f84003da496b71b9f13c4de140de21d70a73a408
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Xin-Hao/mm-damon-Add-NUMA-access-statistics-function-support/20220216-163243
        git checkout f84003da496b71b9f13c4de140de21d70a73a408
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash mm/damon/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   mm/damon/core.c:1023:29: error: implicit declaration of function 'damon_get_task_struct' [-Werror,-Wimplicit-function-declaration]
                           struct task_struct *ts = damon_get_task_struct(t);
                                                    ^
   mm/damon/core.c:1023:29: note: did you mean 'get_task_struct'?
   include/linux/sched/task.h:104:35: note: 'get_task_struct' declared here
   static inline struct task_struct *get_task_struct(struct task_struct *t)
                                     ^
>> mm/damon/core.c:1023:24: warning: incompatible integer to pointer conversion initializing 'struct task_struct *' with an expression of type 'int' [-Wint-conversion]
                           struct task_struct *ts = damon_get_task_struct(t);
                                               ^    ~~~~~~~~~~~~~~~~~~~~~~~~
   mm/damon/core.c:1058:6: error: redefinition of 'damon_numa_fault'
   void damon_numa_fault(int page_nid, int node_id, struct vm_fault *vmf)
        ^
   include/linux/damon.h:525:20: note: previous definition is here
   static inline void damon_numa_fault(int page_nid, int node_id, struct vm_fault *vmf) { }
                      ^
   1 warning and 2 errors generated.


vim +1023 mm/damon/core.c

  1009	
  1010	static struct damon_target *get_damon_target(struct task_struct *task)
  1011	{
  1012		int i;
  1013		unsigned long id1, id2;
  1014		struct damon_target *t;
  1015	
  1016		rcu_read_lock();
  1017		for (i = 0; i < READ_ONCE(dbgfs_nr_ctxs); i++) {
  1018			struct damon_ctx *ctx = rcu_dereference(dbgfs_ctxs[i]);
  1019	
  1020			if (!ctx || !ctx->kdamond)
  1021				continue;
  1022			damon_for_each_target(t, dbgfs_ctxs[i]) {
> 1023				struct task_struct *ts = damon_get_task_struct(t);
  1024	
  1025				if (ts) {
  1026					id1 = (unsigned long)pid_vnr((struct pid *)t->id);
  1027					id2 = (unsigned long)pid_vnr(get_task_pid(task, PIDTYPE_PID));
  1028					put_task_struct(ts);
  1029					if (id1 == id2)
  1030						return t;
  1031				}
  1032			}
  1033		}
  1034		rcu_read_unlock();
  1035	
  1036		return NULL;
  1037	}
  1038	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
