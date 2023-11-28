Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101EDD29A;
	Tue, 28 Nov 2023 09:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6SfYkpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701164608; x=1732700608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=47Ej6yoMs5q0oT/KAkqfjhy0ayMFym0CVVhgfEHM5kA=;
  b=N6SfYkpO692biSs1BbTNJ2ZGyqYfSBmV41R99wm347GhLC2ubxgId8oJ
   bFjzGeZCGMvAYTyiQsViPlxGZ25lvGI+Q3/J5ZUfjCO14oHd0gR/wL/o3
   OghuSE/YFxWHBHOjwK3DbNu24Y2LbJmXZGy8VBfhBWrwSW/Gcq5jO21si
   FJv7jQ9FFRaTLqRWf65oxYT0LXSqhcvi+PD1slPwHU1mN4Ur9mAvcIKVT
   mSyOHioiYjC23LTtj+PLFCA4GGw27DYxU9vRfZ2hF2SBlvA6c1RpniajX
   965Sq3j9qv176P1YUMtXV1YWShKwz0IQVym/w/uzBowvUDAFQzSrwRZ6I
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="424041077"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="424041077"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 01:43:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="10066780"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Nov 2023 01:43:26 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7ucm-0007Nb-0l;
	Tue, 28 Nov 2023 09:43:24 +0000
Date: Tue, 28 Nov 2023 17:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH] tracing: Allow creating instances with specified
 system events
Message-ID: <202311281631.XZ2umoXl-lkp@intel.com>
References: <20231127174108.3c331c9c@gandalf.local.home>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127174108.3c331c9c@gandalf.local.home>

Hi Steven,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mkp-scsi/for-next]
[also build test WARNING on jejb-scsi/for-next linus/master v6.7-rc3 next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Allow-creating-instances-with-specified-system-events/20231128-064317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
patch link:    https://lore.kernel.org/r/20231127174108.3c331c9c%40gandalf.local.home
patch subject: [RFC][PATCH] tracing: Allow creating instances with specified system events
config: i386-buildonly-randconfig-005-20231128 (https://download.01.org/0day-ci/archive/20231128/202311281631.XZ2umoXl-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311281631.XZ2umoXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311281631.XZ2umoXl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace.c:9640: warning: Function parameter or member 'systems' not described in 'trace_array_get_by_name'


vim +9640 kernel/trace/trace.c

277ba04461c274 Steven Rostedt          2012-08-03  9622  
28879787147358 Divya Indi              2019-11-20  9623  /**
28879787147358 Divya Indi              2019-11-20  9624   * trace_array_get_by_name - Create/Lookup a trace array, given its name.
28879787147358 Divya Indi              2019-11-20  9625   * @name: The name of the trace array to be looked up/created.
28879787147358 Divya Indi              2019-11-20  9626   *
28879787147358 Divya Indi              2019-11-20  9627   * Returns pointer to trace array with given name.
28879787147358 Divya Indi              2019-11-20  9628   * NULL, if it cannot be created.
28879787147358 Divya Indi              2019-11-20  9629   *
28879787147358 Divya Indi              2019-11-20  9630   * NOTE: This function increments the reference counter associated with the
28879787147358 Divya Indi              2019-11-20  9631   * trace array returned. This makes sure it cannot be freed while in use.
28879787147358 Divya Indi              2019-11-20  9632   * Use trace_array_put() once the trace array is no longer needed.
28394da2588816 Steven Rostedt (VMware  2020-01-24  9633)  * If the trace_array is to be freed, trace_array_destroy() needs to
28394da2588816 Steven Rostedt (VMware  2020-01-24  9634)  * be called after the trace_array_put(), or simply let user space delete
28394da2588816 Steven Rostedt (VMware  2020-01-24  9635)  * it from the tracefs instances directory. But until the
28394da2588816 Steven Rostedt (VMware  2020-01-24  9636)  * trace_array_put() is called, user space can not delete it.
28879787147358 Divya Indi              2019-11-20  9637   *
28879787147358 Divya Indi              2019-11-20  9638   */
d0f64c321316b8 Steven Rostedt (Google  2023-11-27  9639) struct trace_array *trace_array_get_by_name(const char *name, const char *systems)
f45d1225adb047 Divya Indi              2019-03-20 @9640  {
28879787147358 Divya Indi              2019-11-20  9641  	struct trace_array *tr;
28879787147358 Divya Indi              2019-11-20  9642  
28879787147358 Divya Indi              2019-11-20  9643  	mutex_lock(&event_mutex);
28879787147358 Divya Indi              2019-11-20  9644  	mutex_lock(&trace_types_lock);
28879787147358 Divya Indi              2019-11-20  9645  
28879787147358 Divya Indi              2019-11-20  9646  	list_for_each_entry(tr, &ftrace_trace_arrays, list) {
28879787147358 Divya Indi              2019-11-20  9647  		if (tr->name && strcmp(tr->name, name) == 0)
28879787147358 Divya Indi              2019-11-20  9648  			goto out_unlock;
28879787147358 Divya Indi              2019-11-20  9649  	}
28879787147358 Divya Indi              2019-11-20  9650  
d0f64c321316b8 Steven Rostedt (Google  2023-11-27  9651) 	tr = trace_array_create_systems(name, systems);
28879787147358 Divya Indi              2019-11-20  9652  
28879787147358 Divya Indi              2019-11-20  9653  	if (IS_ERR(tr))
28879787147358 Divya Indi              2019-11-20  9654  		tr = NULL;
28879787147358 Divya Indi              2019-11-20  9655  out_unlock:
28879787147358 Divya Indi              2019-11-20  9656  	if (tr)
28879787147358 Divya Indi              2019-11-20  9657  		tr->ref++;
28879787147358 Divya Indi              2019-11-20  9658  
28879787147358 Divya Indi              2019-11-20  9659  	mutex_unlock(&trace_types_lock);
28879787147358 Divya Indi              2019-11-20  9660  	mutex_unlock(&event_mutex);
28879787147358 Divya Indi              2019-11-20  9661  	return tr;
277ba04461c274 Steven Rostedt          2012-08-03  9662  }
28879787147358 Divya Indi              2019-11-20  9663  EXPORT_SYMBOL_GPL(trace_array_get_by_name);
277ba04461c274 Steven Rostedt          2012-08-03  9664  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
