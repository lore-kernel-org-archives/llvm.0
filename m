Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712E234CF5;
	Wed, 30 Jul 2025 01:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753839710; cv=none; b=ajta0LV9ct3q6jFgfAt0JSQIcyHiIkd7OsC7vO7jW6AK3Po9FqZ+AXZnAS72ay6fJxD9anfFSItDzzCfD45R9BLnFwGq0vqcakHHUry+s8cxWslHE6LKl9lvoNrXbQIQYwCYvGpk70Hj3e+6aTim3O/yS9p0NZLRg4R6y6Rhh0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753839710; c=relaxed/simple;
	bh=C0YOX8tRP08SwcKwTKh5XuGxjapurQZ0E3BcTYfv7TQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnX4kityzaKmBc6tAMLt94hKQfOK5SN69CsX9KWrAzx9epM9J2nX2yZU83GBp1C3DPsGePUvfnawIyU6G3PdJ6/vR8k7xJdZB48nZPVveG5XNo3SDMd9HrzasR9fWEiB78fZKO1d/KInOGoY4rXcqXgN7sfzmPHv27ubOmOJHms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOfDJzow; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOfDJzow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753839707; x=1785375707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C0YOX8tRP08SwcKwTKh5XuGxjapurQZ0E3BcTYfv7TQ=;
  b=FOfDJzowAYMQjBHdVDsykO+EDxpcymJ1WRSGUUki/1NJ/VXLRcBb4klW
   cA9M1sc7cErboTjlJyBNgdyWEcLvBIi6WCe2ONfbPf87peNrzGFRo/eJ2
   ky+EutWTYdiPqZ3sQLwPw8fPcefInLv16RTOOzoFE4FG42SBh9fF+J6mE
   KZ+IBE3eMTSljIGmxoX6bG8eHI1DL9eW4JnSA/dXyE57kjo0PrzQcksC7
   fxBeLb7NW01is+HTuwxuRGb9rJbm8jAt8HlcpIoKhHdncAkxY6Aq8AltE
   boTfrsRwtC/4mPKyRd+N09kstfDJWL9sFhMQRYFwNKaMtB9uN4l+nJguu
   w==;
X-CSE-ConnectionGUID: 9DM/bcKIQMqxIiuw8aRfYw==
X-CSE-MsgGUID: iKlLJrlJQJmdqR4Fz5X8jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="59953741"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="59953741"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 18:41:46 -0700
X-CSE-ConnectionGUID: wXoZuoSiRveJZ3vH4iMSTQ==
X-CSE-MsgGUID: rOisV2MqRfGKlDY24ABawQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="200033573"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jul 2025 18:41:45 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugvp9-0001rL-0C;
	Wed, 30 Jul 2025 01:41:43 +0000
Date: Wed, 30 Jul 2025 09:41:25 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 04/10] ftrace: Add modify_ftrace_direct_hash function
Message-ID: <202507300954.QwO5Jhbb-lkp@intel.com>
References: <20250729102813.1531457-5-jolsa@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729102813.1531457-5-jolsa@kernel.org>

Hi Jiri,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on trace/for-next]
[also build test WARNING on bpf-next/net bpf-next/master bpf/master linus/master v6.16 next-20250729]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jiri-Olsa/ftrace-Make-alloc_and_copy_ftrace_hash-direct-friendly/20250729-183143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20250729102813.1531457-5-jolsa%40kernel.org
patch subject: [RFC 04/10] ftrace: Add modify_ftrace_direct_hash function
config: x86_64-buildonly-randconfig-003-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300954.QwO5Jhbb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300954.QwO5Jhbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300954.QwO5Jhbb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/events/callchain.c:11:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:559:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     559 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:559:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     559 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:564:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     564 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:564:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     564 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:569:5: warning: no previous prototype for function 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     569 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         |     ^
   include/linux/ftrace.h:569:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     569 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         | ^
         | static 
   3 warnings generated.
--
   In file included from kernel/events/core.c:34:
   In file included from include/linux/syscalls.h:94:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:10:
   In file included from include/linux/perf_event.h:43:
   include/linux/ftrace.h:559:5: warning: no previous prototype for function 'register_ftrace_direct_hash' [-Wmissing-prototypes]
     559 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:559:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     559 | int register_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
   include/linux/ftrace.h:564:5: warning: no previous prototype for function 'unregister_ftrace_direct_hash' [-Wmissing-prototypes]
     564 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         |     ^
   include/linux/ftrace.h:564:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     564 | int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
         | ^
         | static 
>> include/linux/ftrace.h:569:5: warning: no previous prototype for function 'modify_ftrace_direct_hash' [-Wmissing-prototypes]
     569 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         |     ^
   include/linux/ftrace.h:569:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     569 | int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
         | ^
         | static 
   kernel/events/core.c:215:20: warning: unused function 'class_perf_ctx_lock_destructor' [-Wunused-function]
     215 | static inline void class_perf_ctx_lock_destructor(class_perf_ctx_lock_t *_T)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/events/core.c:219:1: warning: unused function 'class_perf_ctx_lock_constructor' [-Wunused-function]
     219 | class_perf_ctx_lock_constructor(struct perf_cpu_context *cpuctx,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +/modify_ftrace_direct_hash +569 include/linux/ftrace.h

   563	
 > 564	int unregister_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash)
   565	{
   566		return -ENODEV;
   567	}
   568	
 > 569	int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
   570	{
   571		return -ENODEV;
   572	}
   573	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
