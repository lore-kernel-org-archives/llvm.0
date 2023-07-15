Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B8E15CD;
	Sat, 15 Jul 2023 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689429422; x=1720965422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CyWF7sJQI2YKGi5MoGb0iT7r2P9exMmOYB0hxnhZkQw=;
  b=HLNSVNT2IhBoKc9j7njOV38T/l938bMD/MdA1RZc+xfEgv+Urhu47Xvg
   m2zZ1ICUXK9YBwLzs7JjfeRD8BeHZmoJUlFSHPz1xja58vIlB+2MWhasb
   9mDbcWKe7sGh6l7xbLd7FiZ8Kkux04+hlwPSrVGbVRV3Uz9a8JrVWFyUw
   R5sJYGwDXngS2pJZcfZrLJw2G0/qX/IzWU/s+S+8Kt659veNoSf3XBwkT
   S67ytAEN5QYIBwZ+cDsRghwr3nJ43ymn5ZlrDGFz/4IjcKgeDXAvdQmUK
   8GGbJiqGJ5vX1iTDjtyovz1FTZahvCI6Oy/y2P5D6fSvi6nXUi2q/MFB/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="363123311"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="363123311"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 06:57:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="846780904"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="846780904"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Jul 2023 06:56:59 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKfla-0008BX-2Y;
	Sat, 15 Jul 2023 13:56:58 +0000
Date: Sat, 15 Jul 2023 21:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs 37/46] arch/arm64/mm/gcs.c:137:5: warning: no
 previous prototype for function 'arch_set_shadow_stack_status'
Message-ID: <202307152153.qVglN5AE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   b74369f3118f3aa07e067adae1f42db39f143397
commit: d21b0b3e80f82892db3e57c60aebdd4c53519e3c [37/46] arm64: Add Kconfig for Guarded Control Stack (GCS)
config: arm64-randconfig-r006-20230715 (https://download.01.org/0day-ci/archive/20230715/202307152153.qVglN5AE-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307152153.qVglN5AE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307152153.qVglN5AE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/gcs.c:137:5: warning: no previous prototype for function 'arch_set_shadow_stack_status' [-Wmissing-prototypes]
   int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
       ^
   arch/arm64/mm/gcs.c:137:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
   ^
   static 
>> arch/arm64/mm/gcs.c:189:5: warning: no previous prototype for function 'arch_get_shadow_stack_status' [-Wmissing-prototypes]
   int arch_get_shadow_stack_status(struct task_struct *task,
       ^
   arch/arm64/mm/gcs.c:189:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int arch_get_shadow_stack_status(struct task_struct *task,
   ^
   static 
   2 warnings generated.


vim +/arch_set_shadow_stack_status +137 arch/arm64/mm/gcs.c

688ff8cacd9951 Mark Brown 2023-04-05  136  
688ff8cacd9951 Mark Brown 2023-04-05 @137  int arch_set_shadow_stack_status(struct task_struct *task, unsigned long arg)
688ff8cacd9951 Mark Brown 2023-04-05  138  {
688ff8cacd9951 Mark Brown 2023-04-05  139  	unsigned long gcs, size;
688ff8cacd9951 Mark Brown 2023-04-05  140  
688ff8cacd9951 Mark Brown 2023-04-05  141  	if (!system_supports_gcs())
688ff8cacd9951 Mark Brown 2023-04-05  142  		return -EINVAL;
688ff8cacd9951 Mark Brown 2023-04-05  143  
688ff8cacd9951 Mark Brown 2023-04-05  144  	if (is_compat_thread(task_thread_info(task)))
688ff8cacd9951 Mark Brown 2023-04-05  145  		return -EINVAL;
688ff8cacd9951 Mark Brown 2023-04-05  146  
688ff8cacd9951 Mark Brown 2023-04-05  147  	/* Reject unknown flags */
688ff8cacd9951 Mark Brown 2023-04-05  148  	if (arg & ~PR_SHADOW_STACK_SUPPORTED_STATUS_MASK)
688ff8cacd9951 Mark Brown 2023-04-05  149  		return -EINVAL;
688ff8cacd9951 Mark Brown 2023-04-05  150  
688ff8cacd9951 Mark Brown 2023-04-05  151  	/* If the task has been locked block any attempted changes */
688ff8cacd9951 Mark Brown 2023-04-05  152  	if (task->thread.gcs_el0_mode & PR_SHADOW_STACK_LOCK)
688ff8cacd9951 Mark Brown 2023-04-05  153  		return -EBUSY;
688ff8cacd9951 Mark Brown 2023-04-05  154  
688ff8cacd9951 Mark Brown 2023-04-05  155  	/* Drop flags other than lock if disabling */
688ff8cacd9951 Mark Brown 2023-04-05  156  	if (!(arg & PR_SHADOW_STACK_ENABLE))
688ff8cacd9951 Mark Brown 2023-04-05  157  		arg &= ~PR_SHADOW_STACK_LOCK;
688ff8cacd9951 Mark Brown 2023-04-05  158  
688ff8cacd9951 Mark Brown 2023-04-05  159  	/* If we are enabling GCS then make sure we have a stack */
688ff8cacd9951 Mark Brown 2023-04-05  160  	if (arg & PR_SHADOW_STACK_ENABLE) {
688ff8cacd9951 Mark Brown 2023-04-05  161  		if (!task_gcs_el0_enabled(task)) {
688ff8cacd9951 Mark Brown 2023-04-05  162  			/* Do not allow GCS to be reenabled */
688ff8cacd9951 Mark Brown 2023-04-05  163  			if (task->thread.gcs_base)
688ff8cacd9951 Mark Brown 2023-04-05  164  				return -EINVAL;
688ff8cacd9951 Mark Brown 2023-04-05  165  
688ff8cacd9951 Mark Brown 2023-04-05  166  			size = gcs_size(0);
688ff8cacd9951 Mark Brown 2023-04-05  167  			gcs = alloc_gcs(task->thread.gcspr_el0, size,
688ff8cacd9951 Mark Brown 2023-04-05  168  					0, 0);
688ff8cacd9951 Mark Brown 2023-04-05  169  			if (!gcs)
688ff8cacd9951 Mark Brown 2023-04-05  170  				return -ENOMEM;
688ff8cacd9951 Mark Brown 2023-04-05  171  
688ff8cacd9951 Mark Brown 2023-04-05  172  			task->thread.gcspr_el0 = gcs + size - sizeof(u64);
688ff8cacd9951 Mark Brown 2023-04-05  173  			task->thread.gcs_base = gcs;
688ff8cacd9951 Mark Brown 2023-04-05  174  			task->thread.gcs_size = size;
688ff8cacd9951 Mark Brown 2023-04-05  175  			if (task == current)
688ff8cacd9951 Mark Brown 2023-04-05  176  				write_sysreg_s(task->thread.gcspr_el0,
688ff8cacd9951 Mark Brown 2023-04-05  177  					       SYS_GCSPR_EL0);
688ff8cacd9951 Mark Brown 2023-04-05  178  
688ff8cacd9951 Mark Brown 2023-04-05  179  		}
688ff8cacd9951 Mark Brown 2023-04-05  180  	}
688ff8cacd9951 Mark Brown 2023-04-05  181  
688ff8cacd9951 Mark Brown 2023-04-05  182  	task->thread.gcs_el0_mode = arg;
688ff8cacd9951 Mark Brown 2023-04-05  183  	if (task == current)
688ff8cacd9951 Mark Brown 2023-04-05  184  		gcs_set_el0_mode(task);
688ff8cacd9951 Mark Brown 2023-04-05  185  
688ff8cacd9951 Mark Brown 2023-04-05  186  	return 0;
688ff8cacd9951 Mark Brown 2023-04-05  187  }
688ff8cacd9951 Mark Brown 2023-04-05  188  
688ff8cacd9951 Mark Brown 2023-04-05 @189  int arch_get_shadow_stack_status(struct task_struct *task,

:::::: The code at line 137 was first introduced by commit
:::::: 688ff8cacd99518f46a420dbb4a02de6e671e5ae arm64/gcs: Implement shadow stack prctl() interface

:::::: TO: Mark Brown <broonie@kernel.org>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
