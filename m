Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3616D10A2C;
	Mon, 20 Nov 2023 09:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLk3v5q+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700472300; x=1732008300;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XpEv2V+j7O9EaHckwm01mbsqDnEzOyXH/O2rZ7SL8CE=;
  b=hLk3v5q+6+v5C7BfejYO1NkWc4CQYcQb6pDF87X2ZLLtY9YoWiW1nYkl
   nLLH/I/XaN8a2WlL0hbccb4pildmRGTsbd3+fIHuU3iUMWjPoglZAV3hr
   fVQK+gVPQ4K2HjtKayX2vFSFVrQOOfFDPS6tm5AnAVhPvXs7FuFomHIxA
   fFBAEpmmx7fG0Xrs63ZnLLz2LN5PG2ASw1uV9lWrRjVapCLTo14++OQZF
   /cAO+OqeNk90aHgGtaGYy8ixurahxmI/p9g59UYJ0SzUQvZMpHihFdCU7
   ln+CXJXm+khIlCqckdQBTkTLzQoaREXrF2T8et9vwirVLF1u2Bo0QluoT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="376618011"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="376618011"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 01:24:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="801103188"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="801103188"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 01:24:27 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r50W1-0006GD-0X;
	Mon, 20 Nov 2023 09:24:25 +0000
Date: Mon, 20 Nov 2023 17:23:22 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/220-tso 3/4] arch/arm64/kernel/process.c:544:5:
 warning: no previous prototype for function 'arch_prctl_mem_model_get'
Message-ID: <202311201703.SyraK0kl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/220-tso
head:   308062b9b17efd95c1c98c7c2cf667f620492fce
commit: 358a9e2c2286df9864eff73ff2baeb4efe94c66e [3/4] arm64: Implement PR_{GET,SET}_MEM_MODEL for always-TSO CPUs
config: arm64-randconfig-001-20231120 (https://download.01.org/0day-ci/archive/20231120/202311201703.SyraK0kl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311201703.SyraK0kl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201703.SyraK0kl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/process.c:544:5: warning: no previous prototype for function 'arch_prctl_mem_model_get' [-Wmissing-prototypes]
     544 | int arch_prctl_mem_model_get(struct task_struct *t)
         |     ^
   arch/arm64/kernel/process.c:544:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     544 | int arch_prctl_mem_model_get(struct task_struct *t)
         | ^
         | static 
>> arch/arm64/kernel/process.c:549:5: warning: no previous prototype for function 'arch_prctl_mem_model_set' [-Wmissing-prototypes]
     549 | int arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
         |     ^
   arch/arm64/kernel/process.c:549:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     549 | int arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
         | ^
         | static 
   2 warnings generated.


vim +/arch_prctl_mem_model_get +544 arch/arm64/kernel/process.c

   542	
   543	#ifdef CONFIG_ARM64_MEMORY_MODEL_CONTROL
 > 544	int arch_prctl_mem_model_get(struct task_struct *t)
   545	{
   546		return PR_SET_MEM_MODEL_DEFAULT;
   547	}
   548	
 > 549	int arch_prctl_mem_model_set(struct task_struct *t, unsigned long val)
   550	{
   551		if (cpus_have_const_cap(ARM64_HAS_TSO_FIXED) &&
   552		    val == PR_SET_MEM_MODEL_TSO)
   553			return 0;
   554	
   555		if (val == PR_SET_MEM_MODEL_DEFAULT)
   556			return 0;
   557	
   558		return -EINVAL;
   559	}
   560	#endif
   561	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
