Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966DF7404E;
	Sat, 14 Feb 2026 19:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771098358; cv=none; b=UNTUFsa4JUgitlsebKhAMDKRnPM733Svt4sDEYokeXSkSl4cIyir++SgeY1IUtsY495+BvWmFiOwi0IFWLD8Fm+YF4/EE4eItuvD5hmSXaTOznKkCyeW3a+dwxjRGBZj5AX5xjzAqx3qSd18S/egcymAknd6HdqoTWbWLJQnBEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771098358; c=relaxed/simple;
	bh=LnMulOjHBpalCWaX5XuW59wU19kckTlawfQObC2i2UE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sak4rO1Yro0ZCoWGK+7LvgGYknroCeUM8OQ5wPt9hbPpdm9zhaBb/iXSxu1/saguc0UexwXcyU1TG43oURtBuqF/9+iHXAXYOXT9G5crU13f3kmwIy50lGONGbobIqdfNXHlVGtflPCB6mXWqNuixs/uUHuHVPWnPmltA5dZWv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kt3Rv7me; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kt3Rv7me"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771098354; x=1802634354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LnMulOjHBpalCWaX5XuW59wU19kckTlawfQObC2i2UE=;
  b=kt3Rv7meJaJDsMlm1wt34UbGl9QTjuwZx2fZ3Ku+FmigNn3EGuwVEyha
   psBKsEPbnFXcCndRjOvKGc03Ohe44tLn1USBMmDdzXrlqRgt8OM4vOnIL
   LtzfWZmJOdyWxMOW+6Ta3mfssUU7zit7fSY5A4CZPm8rB3b/znxL3hmiO
   RyBHgUxrQEpWCdHCqM5+bKqUS5ox0PHk+c5k9zx2eDzmHeINLB4I6JH+s
   nx0GYFldV1CedrIZo66zriDaA32C49seeHZ6VOftGBlP83FgGLmYviTLp
   vxhdaH/yhYHuGK2Fv9LSkxFqJ/nq2QLglW0a72ktLsGEgud9YbImXOeEn
   w==;
X-CSE-ConnectionGUID: avYsXzUlTOOVQ83swLIO+w==
X-CSE-MsgGUID: fAdp9TS0SMursWfUBzby7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="97707833"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="97707833"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 11:45:53 -0800
X-CSE-ConnectionGUID: KUJvVvTyTFygS7i/pGOfTQ==
X-CSE-MsgGUID: 7wxuTchXRza8PMioZHlbTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="213055050"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Feb 2026 11:45:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrLaN-00000000wvI-0ksz;
	Sat, 14 Feb 2026 19:45:47 +0000
Date: Sun, 15 Feb 2026 03:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Sun Jian <sun.jian.kdev@gmail.com>, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Cc: oe-kbuild-all@lists.linux.dev, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	justinstitt@google.com, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Sun Jian <sun.jian.kdev@gmail.com>
Subject: Re: [PATCH] sched: rcu: fix rq->{curr,donor} address space
 annotations
Message-ID: <202602150345.VAM4TsvX-lkp@intel.com>
References: <20260214102005.1398306-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214102005.1398306-1-sun.jian.kdev@gmail.com>

Hi Sun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on peterz-queue/sched/core]
[also build test WARNING on linus/master v6.19 next-20260213]
[cannot apply to tip/sched/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Sun-Jian/sched-rcu-fix-rq-curr-donor-address-space-annotations/20260214-182109
base:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
patch link:    https://lore.kernel.org/r/20260214102005.1398306-1-sun.jian.kdev%40gmail.com
patch subject: [PATCH] sched: rcu: fix rq->{curr,donor} address space annotations
config: microblaze-randconfig-r131-20260214 (https://download.01.org/0day-ci/archive/20260215/202602150345.VAM4TsvX-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602150345.VAM4TsvX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602150345.VAM4TsvX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:1493:31: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1815:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1815:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1815:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1512:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1512:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1512:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1513:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1513:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1513:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1574:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1574:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1574:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1616:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1616:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1616:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1641:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1641:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1641:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1982:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1982:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:1982:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2005:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2005:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2005:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2356:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2356:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2356:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2358:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2358:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2358:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2358:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2358:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2358:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2922:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2922:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2922:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2932:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2932:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2932:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3038:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3038:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:3038:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2539:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2539:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2539:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2549:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2549:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2549:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1198:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1198:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1198:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1198:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1198:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1198:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1296:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1296:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1296:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1815:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1815:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1815:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1815:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1815:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1815:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1941:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1941:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1941:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2758:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2758:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2758:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2419:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2419:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2419:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2420:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2420:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2420:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2494:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2494:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2494:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3083:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:3083:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:3083:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:3085:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3085:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3085:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3087:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:3087:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:3087:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3340:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3340:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3340:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3393:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1382:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1573:15: sparse: sparse: dereference of noderef expression
   kernel/sched/rt.c:1958:13: sparse: sparse: dereference of noderef expression
   kernel/sched/rt.c:1979:23: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/sched.h:2812:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:2316:45: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/sched.h:2812:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:2359:32: sparse: sparse: dereference of noderef expression
   kernel/sched/rt.c:2360:32: sparse: sparse: dereference of noderef expression
   kernel/sched/rt.c:2441:33: sparse: sparse: dereference of noderef expression
   kernel/sched/rt.c:2479:33: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/pelt.c:480:50: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/deadline.c:1169:19: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:1808:11: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:2384:11: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:2493:15: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:2548:34: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:2579:15: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:2923:54: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:2923:54: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:2924:15: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:3046:50: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:3046:50: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/sched.h:2812:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:3086:16: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:3394:54: sparse: sparse: dereference of noderef expression
   kernel/sched/deadline.c:3394:54: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1307:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1665:15: sparse: sparse: dereference of noderef expression

vim +2812 kernel/sched/sched.h

04746ed80bcf31 Ingo Molnar               2024-04-07  2809  
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2810  static inline struct task_struct *get_push_task(struct rq *rq)
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2811  {
af0c8b2bf67b25 Peter Zijlstra            2024-10-09 @2812  	struct task_struct *p = rq->donor;
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2813  
5cb9eaa3d274f7 Peter Zijlstra            2020-11-17  2814  	lockdep_assert_rq_held(rq);
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2815  
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2816  	if (rq->push_busy)
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2817  		return NULL;
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2818  
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2819  	if (p->nr_cpus_allowed == 1)
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2820  		return NULL;
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2821  
e681dcbaa4b284 Sebastian Andrzej Siewior 2021-08-26  2822  	if (p->migration_disabled)
e681dcbaa4b284 Sebastian Andrzej Siewior 2021-08-26  2823  		return NULL;
e681dcbaa4b284 Sebastian Andrzej Siewior 2021-08-26  2824  
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2825  	rq->push_busy = true;
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2826  	return get_task_struct(p);
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2827  }
a7c81556ec4d34 Peter Zijlstra            2020-09-28  2828  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
