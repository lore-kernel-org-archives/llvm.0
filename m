Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B38338596;
	Fri,  6 Mar 2026 07:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772780950; cv=none; b=C8FeaVK8wV+xxavRrEkkasDnDfo4zLYP1sX934bBCQYT6glyylfTaf+6WLjM7PlQ4MAH7AhKruo1C4uIj0DZIhydEavhtcbpVKobwyM2BnXR+wOYj4mzkW+HINBfLFW0Bn6jpbkP43znUh7lYM/X1CqC3b2oUx1INPdoKLCWeLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772780950; c=relaxed/simple;
	bh=F5Bu+D4xjAzDxlsi6Nqg16rGAE0DS0Chsp166metLFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sSW0/R3jAWK4pEMtrlHFSWEaJ7ZsaoNXOMyEBMjL9ujM5mCdCcfsHr1Z+lbu/yrnY9+71QooORlzZ0EVLT5KZHu0beGZa9g7bQuhJC8BXy/JMdgUTS+7M/RPbieRDbyAYhmoTa/Ke6CfEsvAQPahijAWbTFp9N6vSoRbv56dP3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BM6UvE/g; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BM6UvE/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772780948; x=1804316948;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=F5Bu+D4xjAzDxlsi6Nqg16rGAE0DS0Chsp166metLFc=;
  b=BM6UvE/gYE5WbmRiD957NuN1N/4StoLMrl4vS2kfdxE8gOItv/dm6ARf
   vNMrMO0+IBfXwnFFtcBMTUwL/AbfvriFOtpSNbm3zLZZfnbENj8oHVPmV
   wo392gm65eYpfv4aZ7xhL8WGCYrfLDJrIqs4USld82cUmQAfAwbdtOe9k
   gAi+D+OjyjMGk0+vAsNa0sLwYJjrtkBkuzlzAn2YC/Y49AL/VxGLN4Dx0
   72+npQihSNkX418veQmu/brSN0X6DLpUfKwcbP9ss979Dd7Iu0EEMpA9J
   ruGtt9SPmlcLoLE8AXzdhfA5psociTH1V/MhQxhT5X+afFioHUh9w08s+
   Q==;
X-CSE-ConnectionGUID: Xghf9xgjRlaAYx5ZbxOxsA==
X-CSE-MsgGUID: ZsAYlpPySL6ySA83qf+vcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73787765"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="73787765"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 23:09:08 -0800
X-CSE-ConnectionGUID: 9Bm7P1pWSquFV17jWgQ+Fg==
X-CSE-MsgGUID: 44SOo2CiQDe67XH1V7cwLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="218175135"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 05 Mar 2026 23:09:07 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyPJ2-000000000Uj-16aW;
	Fri, 06 Mar 2026 07:09:04 +0000
Date: Fri, 6 Mar 2026 15:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC DRAFT POC 01/11] kthread: refactor
 __kthread_create_on_node() to take a struct argument
Message-ID: <202603061512.U95TckFJ-lkp@intel.com>
References: <20260303-work-kthread-nullfs-v1-1-87e559b94375@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-work-kthread-nullfs-v1-1-87e559b94375@kernel.org>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 10047142d6ce3b8562546c61f3cf57f852b9b950]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Brauner/kthread-refactor-__kthread_create_on_node-to-take-a-struct-argument/20260303-220058
base:   10047142d6ce3b8562546c61f3cf57f852b9b950
patch link:    https://lore.kernel.org/r/20260303-work-kthread-nullfs-v1-1-87e559b94375%40kernel.org
patch subject: [PATCH RFC DRAFT POC 01/11] kthread: refactor __kthread_create_on_node() to take a struct argument
config: um-randconfig-002-20260306 (https://download.01.org/0day-ci/archive/20260306/202603061512.U95TckFJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c32caeec8158d634bb71ab8911a6031248b9fc47)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603061512.U95TckFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603061512.U95TckFJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/kthread.c:510:58: warning: diagnostic behavior may be improved by adding the 'format(printf, 2, 0)' attribute to the declaration of '__kthread_create_on_node' [-Wmissing-format-attribute]
     483 |         create->full_name = kvasprintf(GFP_KERNEL, namefmt, args);
         |                                                                 ^
   kernel/kthread.c:483:28: note: '__kthread_create_on_node' declared here
     483 | static struct task_struct *__kthread_create_on_node(const struct kthread_create_info *info,
         |                            ^
   1 warning generated.


vim +510 kernel/kthread.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  482  
1400954662846ff Christian Brauner 2026-03-03  483  static struct task_struct *__kthread_create_on_node(const struct kthread_create_info *info,
^1da177e4c3f415 Linus Torvalds    2005-04-16  484  						    const char namefmt[],
255451e45345bcd Petr Mladek       2016-10-11  485  						    va_list args)
^1da177e4c3f415 Linus Torvalds    2005-04-16  486  {
786235eeba0e1e8 Tetsuo Handa      2013-11-12  487  	DECLARE_COMPLETION_ONSTACK(done);
1400954662846ff Christian Brauner 2026-03-03  488  	struct kthread_worker *worker = NULL;
786235eeba0e1e8 Tetsuo Handa      2013-11-12  489  	struct task_struct *task;
1400954662846ff Christian Brauner 2026-03-03  490  	struct kthread_create_info *create;
786235eeba0e1e8 Tetsuo Handa      2013-11-12  491  
1400954662846ff Christian Brauner 2026-03-03  492  	create = kmalloc_obj(*create);
786235eeba0e1e8 Tetsuo Handa      2013-11-12  493  	if (!create)
786235eeba0e1e8 Tetsuo Handa      2013-11-12  494  		return ERR_PTR(-ENOMEM);
1400954662846ff Christian Brauner 2026-03-03  495  
1400954662846ff Christian Brauner 2026-03-03  496  	*create = *info;
1400954662846ff Christian Brauner 2026-03-03  497  
1400954662846ff Christian Brauner 2026-03-03  498  	if (create->kthread_worker) {
1400954662846ff Christian Brauner 2026-03-03  499  		worker = kzalloc_obj(*worker);
1400954662846ff Christian Brauner 2026-03-03  500  		if (!worker) {
1400954662846ff Christian Brauner 2026-03-03  501  			kfree(create);
1400954662846ff Christian Brauner 2026-03-03  502  			return ERR_PTR(-ENOMEM);
1400954662846ff Christian Brauner 2026-03-03  503  		}
1400954662846ff Christian Brauner 2026-03-03  504  		kthread_init_worker(worker);
1400954662846ff Christian Brauner 2026-03-03  505  		create->threadfn = kthread_worker_fn;
1400954662846ff Christian Brauner 2026-03-03  506  		create->data = worker;
1400954662846ff Christian Brauner 2026-03-03  507  	}
1400954662846ff Christian Brauner 2026-03-03  508  
786235eeba0e1e8 Tetsuo Handa      2013-11-12  509  	create->done = &done;
73e0c116594d99f Mike Christie     2023-03-10 @510  	create->full_name = kvasprintf(GFP_KERNEL, namefmt, args);
73e0c116594d99f Mike Christie     2023-03-10  511  	if (!create->full_name) {
73e0c116594d99f Mike Christie     2023-03-10  512  		task = ERR_PTR(-ENOMEM);
73e0c116594d99f Mike Christie     2023-03-10  513  		goto free_create;
73e0c116594d99f Mike Christie     2023-03-10  514  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  515  
73c279927f89561 Eric W. Biederman 2007-05-09  516  	spin_lock(&kthread_create_lock);
786235eeba0e1e8 Tetsuo Handa      2013-11-12  517  	list_add_tail(&create->list, &kthread_create_list);
73c279927f89561 Eric W. Biederman 2007-05-09  518  	spin_unlock(&kthread_create_lock);
73c279927f89561 Eric W. Biederman 2007-05-09  519  
cbd9b67bd3883df Dmitry Adamushko  2008-04-29  520  	wake_up_process(kthreadd_task);
786235eeba0e1e8 Tetsuo Handa      2013-11-12  521  	/*
786235eeba0e1e8 Tetsuo Handa      2013-11-12  522  	 * Wait for completion in killable state, for I might be chosen by
786235eeba0e1e8 Tetsuo Handa      2013-11-12  523  	 * the OOM killer while kthreadd is trying to allocate memory for
786235eeba0e1e8 Tetsuo Handa      2013-11-12  524  	 * new kernel thread.
786235eeba0e1e8 Tetsuo Handa      2013-11-12  525  	 */
786235eeba0e1e8 Tetsuo Handa      2013-11-12  526  	if (unlikely(wait_for_completion_killable(&done))) {
786235eeba0e1e8 Tetsuo Handa      2013-11-12  527  		/*
d25c83c6606ffc3 Petr Mladek       2022-03-15  528  		 * If I was killed by a fatal signal before kthreadd (or new
d25c83c6606ffc3 Petr Mladek       2022-03-15  529  		 * kernel thread) calls complete(), leave the cleanup of this
d25c83c6606ffc3 Petr Mladek       2022-03-15  530  		 * structure to that thread.
786235eeba0e1e8 Tetsuo Handa      2013-11-12  531  		 */
786235eeba0e1e8 Tetsuo Handa      2013-11-12  532  		if (xchg(&create->done, NULL))
8fe6929cfd43c44 Tetsuo Handa      2014-06-04  533  			return ERR_PTR(-EINTR);
786235eeba0e1e8 Tetsuo Handa      2013-11-12  534  		/*
786235eeba0e1e8 Tetsuo Handa      2013-11-12  535  		 * kthreadd (or new kernel thread) will call complete()
786235eeba0e1e8 Tetsuo Handa      2013-11-12  536  		 * shortly.
786235eeba0e1e8 Tetsuo Handa      2013-11-12  537  		 */
786235eeba0e1e8 Tetsuo Handa      2013-11-12  538  		wait_for_completion(&done);
786235eeba0e1e8 Tetsuo Handa      2013-11-12  539  	}
786235eeba0e1e8 Tetsuo Handa      2013-11-12  540  	task = create->result;
73e0c116594d99f Mike Christie     2023-03-10  541  free_create:
1400954662846ff Christian Brauner 2026-03-03  542  	if (IS_ERR(task))
1400954662846ff Christian Brauner 2026-03-03  543  		kfree(worker);
786235eeba0e1e8 Tetsuo Handa      2013-11-12  544  	kfree(create);
786235eeba0e1e8 Tetsuo Handa      2013-11-12  545  	return task;
^1da177e4c3f415 Linus Torvalds    2005-04-16  546  }
255451e45345bcd Petr Mladek       2016-10-11  547  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
