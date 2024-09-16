Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3964C13211F;
	Mon, 16 Sep 2024 19:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726513709; cv=none; b=oLm6VsnCmFew0zC9qZtu6yPtIzWxeSDjraei7oPoTh+aS+aWpdLLKFxAWzKZRqWkzYi9Gh7rysEhppD0nVSNbkSEVZ89VBxp73DD0Yu9JMR39GEqMlRwcjFOWAR0agxJtMmqJ+cg+TmbU1rYUbqaR3AT0y1402zXUHIVzu9UYWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726513709; c=relaxed/simple;
	bh=CeAwyEAgBRfMX+EIphkq/kwRuoMHv2Xox2L/k4BkTOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZhIWpiPyE7MADBTcbdOAFVVoOI6jEK/EN2N1z4JjbB8Kog5Jy9gsCEeM5ijt9AxdYL+A/htqOVBnouZv660fHotSTDHc0vajzG3OYCAlElAgW+ipMoIGQduMwDebfomv6rj4SNAntfaR2sinb+mQIed8L2zNkBFNXNL3uU5ZaFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TCtMhLt7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TCtMhLt7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726513707; x=1758049707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CeAwyEAgBRfMX+EIphkq/kwRuoMHv2Xox2L/k4BkTOQ=;
  b=TCtMhLt7utM7Djzr4y9WOKCyExXm1zmBz6rr+FfOhethSIztd57XwOEv
   C9REqqpaPqsAWvkXSiKqkWCCLZiFVteK0MNhqHImHmBQli4BBXNzMLyPP
   QnbnHA4fN6ltR4t3j6X/n8kZsPEnPFzcO+n5e9oFUbjU3B2ImZdL3H0rP
   rC8bOBMWw4fFTPCCo4OBYON9dOFi+2uTkNzMuZNsGUAnFbOMxMDH9ObH2
   0EmSWC2p7S4YiBRT+4y1e34ryXpp1Q1AaDHsXp5gA0CIDE00NJEQFJCqs
   tsHHnsidDZfJRg4zoZoZrIvqIlXWJPm55diavY2q4Hzctnxvh3z0GMXJ7
   g==;
X-CSE-ConnectionGUID: HXtaaiSgQGiji5biyDvfSA==
X-CSE-MsgGUID: gYwLGI++SCq1PYy9SeOm+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25285775"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="25285775"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 12:08:26 -0700
X-CSE-ConnectionGUID: S8LjEUZORqS+3W5AIQRQvA==
X-CSE-MsgGUID: PHS9flbsRHOFbeCwkGIJbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68627115"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2024 12:08:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqH5C-000AQK-06;
	Mon, 16 Sep 2024 19:08:22 +0000
Date: Tue, 17 Sep 2024 03:07:27 +0800
From: kernel test robot <lkp@intel.com>
To: Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/6] percpu-refcount: Extend managed mode to allow runtime
 switching
Message-ID: <202409170250.ukGxk6pH-lkp@intel.com>
References: <20240916050811.473556-4-Neeraj.Upadhyay@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240916050811.473556-4-Neeraj.Upadhyay@amd.com>

Hi Neeraj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-nonmm-unstable]
[also build test ERROR on linus/master dennis-percpu/for-next v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Neeraj-Upadhyay/percpu-refcount-Add-managed-mode-for-RCU-released-objects/20240916-131210
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240916050811.473556-4-Neeraj.Upadhyay%40amd.com
patch subject: [RFC 3/6] percpu-refcount: Extend managed mode to allow runtime switching
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240917/202409170250.ukGxk6pH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240917/202409170250.ukGxk6pH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409170250.ukGxk6pH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/percpu-refcount.c:741:19: error: use of undeclared identifier 'last_percpu_ref_node'; did you mean 'next_percpu_ref_node'?
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                          ^~~~~~~~~~~~~~~~~~~~
         |                          next_percpu_ref_node
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:477:10: note: expanded from macro '__native_word'
     477 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                 ^
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^
   lib/percpu-refcount.c:51:26: note: 'next_percpu_ref_node' declared here
      51 | static struct list_head *next_percpu_ref_node = &percpu_ref_manage_head;
         |                          ^
>> lib/percpu-refcount.c:741:19: error: use of undeclared identifier 'last_percpu_ref_node'; did you mean 'next_percpu_ref_node'?
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                          ^~~~~~~~~~~~~~~~~~~~
         |                          next_percpu_ref_node
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:477:39: note: expanded from macro '__native_word'
     477 |         (sizeof(t) == sizeof(char) || sizeof(t) == sizeof(short) || \
         |                                              ^
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^
   lib/percpu-refcount.c:51:26: note: 'next_percpu_ref_node' declared here
      51 | static struct list_head *next_percpu_ref_node = &percpu_ref_manage_head;
         |                          ^
>> lib/percpu-refcount.c:741:19: error: use of undeclared identifier 'last_percpu_ref_node'; did you mean 'next_percpu_ref_node'?
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                          ^~~~~~~~~~~~~~~~~~~~
         |                          next_percpu_ref_node
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:478:10: note: expanded from macro '__native_word'
     478 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                 ^
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^
   lib/percpu-refcount.c:51:26: note: 'next_percpu_ref_node' declared here
      51 | static struct list_head *next_percpu_ref_node = &percpu_ref_manage_head;
         |                          ^
>> lib/percpu-refcount.c:741:19: error: use of undeclared identifier 'last_percpu_ref_node'; did you mean 'next_percpu_ref_node'?
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                          ^~~~~~~~~~~~~~~~~~~~
         |                          next_percpu_ref_node
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:35: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                          ^
   include/linux/compiler_types.h:478:38: note: expanded from macro '__native_word'
     478 |          sizeof(t) == sizeof(int) || sizeof(t) == sizeof(long))
         |                                             ^
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^
   lib/percpu-refcount.c:51:26: note: 'next_percpu_ref_node' declared here
      51 | static struct list_head *next_percpu_ref_node = &percpu_ref_manage_head;
         |                          ^
>> lib/percpu-refcount.c:741:19: error: use of undeclared identifier 'last_percpu_ref_node'; did you mean 'next_percpu_ref_node'?
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                          ^~~~~~~~~~~~~~~~~~~~
         |                          next_percpu_ref_node
   include/asm-generic/rwonce.h:49:33: note: expanded from macro 'READ_ONCE'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |                                        ^
   include/asm-generic/rwonce.h:36:48: note: expanded from macro 'compiletime_assert_rwonce_type'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                                                       ^
   include/linux/compiler_types.h:510:22: note: expanded from macro 'compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:498:23: note: expanded from macro '_compiletime_assert'
     498 |         __compiletime_assert(condition, msg, prefix, suffix)
         |                              ^
   include/linux/compiler_types.h:490:9: note: expanded from macro '__compiletime_assert'
     490 |                 if (!(condition))                                       \
         |                       ^
   lib/percpu-refcount.c:51:26: note: 'next_percpu_ref_node' declared here
      51 | static struct list_head *next_percpu_ref_node = &percpu_ref_manage_head;
         |                          ^
>> lib/percpu-refcount.c:741:19: error: use of undeclared identifier 'last_percpu_ref_node'; did you mean 'next_percpu_ref_node'?
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                          ^~~~~~~~~~~~~~~~~~~~
         |                          next_percpu_ref_node
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:466:13: note: expanded from macro '__unqual_scalar_typeof'
     466 |                 _Generic((x),                                           \
         |                           ^
   lib/percpu-refcount.c:51:26: note: 'next_percpu_ref_node' declared here
      51 | static struct list_head *next_percpu_ref_node = &percpu_ref_manage_head;
         |                          ^
>> lib/percpu-refcount.c:741:19: error: use of undeclared identifier 'last_percpu_ref_node'; did you mean 'next_percpu_ref_node'?
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                          ^~~~~~~~~~~~~~~~~~~~
         |                          next_percpu_ref_node
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:65: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                  ^
   include/linux/compiler_types.h:473:15: note: expanded from macro '__unqual_scalar_typeof'
     473 |                          default: (x)))
         |                                    ^
   lib/percpu-refcount.c:51:26: note: 'next_percpu_ref_node' declared here
      51 | static struct list_head *next_percpu_ref_node = &percpu_ref_manage_head;
         |                          ^
>> lib/percpu-refcount.c:741:19: error: use of undeclared identifier 'last_percpu_ref_node'; did you mean 'next_percpu_ref_node'?
     741 |         while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
         |                          ^~~~~~~~~~~~~~~~~~~~
         |                          next_percpu_ref_node
   include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |                     ^
   include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   lib/percpu-refcount.c:51:26: note: 'next_percpu_ref_node' declared here
      51 | static struct list_head *next_percpu_ref_node = &percpu_ref_manage_head;
         |                          ^
   8 errors generated.


vim +741 lib/percpu-refcount.c

377193f4f16a1b Neeraj Upadhyay 2024-09-16  722  
377193f4f16a1b Neeraj Upadhyay 2024-09-16  723  void percpu_ref_test_flush_release_work(void)
377193f4f16a1b Neeraj Upadhyay 2024-09-16  724  {
377193f4f16a1b Neeraj Upadhyay 2024-09-16  725  	int max_flush = READ_ONCE(max_scan_count);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  726  	int max_count = 1000;
377193f4f16a1b Neeraj Upadhyay 2024-09-16  727  
377193f4f16a1b Neeraj Upadhyay 2024-09-16  728  	/* Complete any executing release work */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  729  	flush_delayed_work(&percpu_ref_release_work);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  730  	/* Scan till the end of the llist */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  731  	WRITE_ONCE(max_scan_count, INT_MAX);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  732  	/* max scan count update visible to release work */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  733  	smp_mb();
377193f4f16a1b Neeraj Upadhyay 2024-09-16  734  	flush_delayed_work(&percpu_ref_release_work);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  735  	/* max scan count update visible to release work */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  736  	smp_mb();
377193f4f16a1b Neeraj Upadhyay 2024-09-16  737  	WRITE_ONCE(max_scan_count, 1);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  738  	/* max scan count update visible to work */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  739  	smp_mb();
377193f4f16a1b Neeraj Upadhyay 2024-09-16  740  	flush_delayed_work(&percpu_ref_release_work);
377193f4f16a1b Neeraj Upadhyay 2024-09-16 @741  	while (READ_ONCE(last_percpu_ref_node) != NULL && max_count--)
377193f4f16a1b Neeraj Upadhyay 2024-09-16  742  		flush_delayed_work(&percpu_ref_release_work);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  743  	/* max scan count update visible to work */
377193f4f16a1b Neeraj Upadhyay 2024-09-16  744  	smp_mb();
377193f4f16a1b Neeraj Upadhyay 2024-09-16  745  	WRITE_ONCE(max_scan_count, max_flush);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  746  }
377193f4f16a1b Neeraj Upadhyay 2024-09-16  747  EXPORT_SYMBOL_GPL(percpu_ref_test_flush_release_work);
377193f4f16a1b Neeraj Upadhyay 2024-09-16  748  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
