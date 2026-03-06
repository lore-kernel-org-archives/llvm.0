Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAE23AA1B4;
	Fri,  6 Mar 2026 18:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772820751; cv=none; b=gSlol8Q3Q6QG2LQBh60rtHbIeWvcR1ldew4D20jatpK4GY7iWq3ti5A3aOm28g77zkOUIlmB1gsjwS4/aQyHqa/QY1sFbRT1hB0ter50Ug1h/87smBBGdEc+CpT+jQtStW6VKdPb5efdBCt2E3C5F8VtaZBoV3vL4uiIKSeyYN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772820751; c=relaxed/simple;
	bh=zVhYjOw+I6u92TO095x5XFtS85cPfEqbRrthDoFLnNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBQ1kYhS39GBWh9A4XnPQvVkTnR52S0B1ytBsuteWjzr+ZMceTyUjzw/wCpEJFrv+RlKtj3X7+SQskx80nrTl5b6G5Mj99RU+tI4FKk44s7jZ+iFaE+9QXmXm6HYx3MSJ/GyCOU9wld2g/42lyt8JgmwQvlT23kzjCAMdOvoCrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QGZJlx3A; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QGZJlx3A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772820749; x=1804356749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zVhYjOw+I6u92TO095x5XFtS85cPfEqbRrthDoFLnNc=;
  b=QGZJlx3AfzgSMk4Men3jLx1cVocsk82LEiGQynJoM8iGSyrO0HzFiL5g
   Y4eo0sX2D0uU9fngLKWqg8Yp6po667oZN4e0PEeeSljsvk/UyASr0RZbV
   Vki/u34u+lsJ3pvyyBUtle53yZ35DdjIVTEtavcQuRB0KtqWmQ9OwjCM6
   A/3ak7oCchDdlM9SgwANHgP0wMNSa+2praN2CZf/0uZRuOuct0zFc/cTl
   UoDWkQfsloYNq2nojIszmflsgnrwfG3dBtySFxScyc5UjKBj3m63ckOX+
   rucOvZ1Gg/VXWltwuAdhWAOloXOM81mXCoRqmziCWkTa9zS7zfLsE5bVZ
   w==;
X-CSE-ConnectionGUID: Sg1YIKRXRXCgYlbgPc+QmA==
X-CSE-MsgGUID: xS2aimKJQPOB8Ksm2Vjl3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84260309"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84260309"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 10:12:29 -0800
X-CSE-ConnectionGUID: eXx3q8ylRZ2iHBQfejXGSQ==
X-CSE-MsgGUID: sPHjagL1SsWEUOD35cTfwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="257005763"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Mar 2026 10:12:27 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyZey-000000001Bd-471q;
	Fri, 06 Mar 2026 18:12:24 +0000
Date: Sat, 7 Mar 2026 02:12:16 +0800
From: kernel test robot <lkp@intel.com>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] locking: add mutex_lock_nospin()
Message-ID: <202603070239.YyGTDfDj-lkp@intel.com>
References: <20260304074650.58165-2-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304074650.58165-2-laoar.shao@gmail.com>

Hi Yafang,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/locking/core]
[also build test ERROR on linus/master v7.0-rc2 next-20260305]
[cannot apply to trace/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yafang-Shao/locking-add-mutex_lock_nospin/20260304-155633
base:   tip/locking/core
patch link:    https://lore.kernel.org/r/20260304074650.58165-2-laoar.shao%40gmail.com
patch subject: [RFC PATCH 1/2] locking: add mutex_lock_nospin()
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20260307/202603070239.YyGTDfDj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603070239.YyGTDfDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603070239.YyGTDfDj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/locking/mutex.c:299:3: error: call to undeclared function '__mutex_lock_nospin'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     299 |                 __mutex_lock_nospin(lock);
         |                 ^
   kernel/locking/mutex.c:299:3: note: did you mean 'mutex_lock_nospin'?
   kernel/locking/mutex.c:294:14: note: 'mutex_lock_nospin' declared here
     294 | void __sched mutex_lock_nospin(struct mutex *lock)
         |              ^
     295 | {
     296 |         might_sleep();
     297 | 
     298 |         if (!__mutex_trylock_fast(lock))
     299 |                 __mutex_lock_nospin(lock);
         |                 ~~~~~~~~~~~~~~~~~~~
         |                 mutex_lock_nospin
>> kernel/locking/mutex.c:630:48: error: too many arguments to function call, expected 3, have 4
     630 |             mutex_optimistic_spin(lock, ww_ctx, NULL, nospin)) {
         |             ~~~~~~~~~~~~~~~~~~~~~                     ^~~~~~
   kernel/locking/mutex.c:532:1: note: 'mutex_optimistic_spin' declared here
     532 | mutex_optimistic_spin(struct mutex *lock, struct ww_acquire_ctx *ww_ctx,
         | ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     533 |                       struct mutex_waiter *waiter)
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/locking/mutex.c:731:53: error: too many arguments to function call, expected 3, have 4
     731 |                         if (mutex_optimistic_spin(lock, ww_ctx, &waiter, nospin))
         |                             ~~~~~~~~~~~~~~~~~~~~~                        ^~~~~~
   kernel/locking/mutex.c:532:1: note: 'mutex_optimistic_spin' declared here
     532 | mutex_optimistic_spin(struct mutex *lock, struct ww_acquire_ctx *ww_ctx,
         | ^                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     533 |                       struct mutex_waiter *waiter)
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/locking/mutex.c:792:1: warning: no previous prototype for function '__mutex_lock_nospin' [-Wmissing-prototypes]
     792 | __mutex_lock_nospin(struct mutex *lock, unsigned int state, unsigned int subclass,
         | ^
   kernel/locking/mutex.c:791:8: note: declare 'static' if the function is not intended to be used outside of this translation unit
     791 | static int __sched
         |        ^
   1 warning and 3 errors generated.


vim +/__mutex_lock_nospin +299 kernel/locking/mutex.c

   293	
   294	void __sched mutex_lock_nospin(struct mutex *lock)
   295	{
   296		might_sleep();
   297	
   298		if (!__mutex_trylock_fast(lock))
 > 299			__mutex_lock_nospin(lock);
   300	}
   301	#endif
   302	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
