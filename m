Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940592F2918;
	Wed, 24 Dec 2025 13:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766583965; cv=none; b=av+mLYBZI6LkawY93ZcXsgzVGgiSoJGJspZb6N6qS0Im1syiQXhA6bu7CtfnCK/zvfow3XevzP/QV9js0HdxjuIibe9kLNSDkMCbcZtatXYMMMO1VrTzsZc17HSztiPqKCfe7xYJNCu0wP8tO62A/YAi9jZsdU2fcGxsonYoPGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766583965; c=relaxed/simple;
	bh=/d91pAxAO2VuPVofRj/M6dRUJOyR68jCa4G2snyUv8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSSUuCiH456dHiDYhwXWKpl02rLvx75XNZ0bNqbKxb8hVslak0ptglv4tBVLwMjN7ZPFZU4EkmmbJEKoNOLlAyzPiPKBREC+B1C5FkowL2cPE5uHaHd4tXGLjmo3Ch3evlMGqabzxQH6yqQGMXeHUvPwFP3c5ieevIJazeVmetg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lx5P0E2b; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lx5P0E2b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766583963; x=1798119963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/d91pAxAO2VuPVofRj/M6dRUJOyR68jCa4G2snyUv8g=;
  b=Lx5P0E2bkanpWm1p+8d6FpnjsG6+EmbojTBtA7B267eA3oPQJbz39mR8
   W6HoqTL+tE//38h2/2dFz4RAYmrR/jWPTPR3rDj+a+ZZ2DBryZg77Qt+8
   3Kh9tqq8opkedz2nCnUw461fwO2D95lXBoz5iCSGAJlGcKc9iwqtppB/N
   yvpuziXHaoFfP8ZxurHwlA7AvVr/1H6hcLc0Y5/WJUlCMGweLWjPwfqBv
   qL5L8uIhpl+jbFkGEg3Xr6vEkAlTPkYgwixspnQk1Pmf5F/96dNppZhXh
   yaiNqqgyw8c4ftF5kScTwfDibYqLq0p46QOQEwz0s8AKiajdPoKbyAeFO
   Q==;
X-CSE-ConnectionGUID: 3y/repLRTEKZZbWQy+W0Kg==
X-CSE-MsgGUID: Uo/wJ19AS26N51IgH3wo7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68473060"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="68473060"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 05:46:02 -0800
X-CSE-ConnectionGUID: 1kV1MSVbQEmK7frEI5p81A==
X-CSE-MsgGUID: qwRHu9mpSJu7ErxGnSj0XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="200002622"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Dec 2025 05:46:00 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYPAz-0000000037d-0v75;
	Wed, 24 Dec 2025 13:45:25 +0000
Date: Wed, 24 Dec 2025 21:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Khaled Saleh <khaled.saleh.req@gmail.com>, rostedt@goodmis.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
	linux-kernel@vger.kernel.org,
	Khaled Saleh <khaled.saleh.req@gmail.com>
Subject: Re: [PATCH] trace: make ftrace likely counters atomic
Message-ID: <202512242156.fyUcX7CR-lkp@intel.com>
References: <20251223203715.10954-1-khaled.saleh.req@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223203715.10954-1-khaled.saleh.req@gmail.com>

Hi Khaled,

kernel test robot noticed the following build errors:

[auto build test ERROR on trace/for-next]
[also build test ERROR on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khaled-Saleh/trace-make-ftrace-likely-counters-atomic/20251224-044106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace for-next
patch link:    https://lore.kernel.org/r/20251223203715.10954-1-khaled.saleh.req%40gmail.com
patch subject: [PATCH] trace: make ftrace likely counters atomic
config: hexagon-randconfig-002-20251224 (https://download.01.org/0day-ci/archive/20251224/202512242156.fyUcX7CR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512242156.fyUcX7CR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512242156.fyUcX7CR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/trace/trace_branch.c:219:19: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'atomic_long_t *' (aka 'atomic_t *') [-Wincompatible-pointer-types]
     219 |                 atomic_long_inc(&f->data.correct);
         |                                 ^~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:3589:32: note: passing argument to parameter 'v' here
    3589 | atomic_long_inc(atomic_long_t *v)
         |                                ^
   kernel/trace/trace_branch.c:221:18: error: incompatible pointer types passing 'unsigned long *' to parameter of type 'atomic_long_t *' (aka 'atomic_t *') [-Wincompatible-pointer-types]
     221 |         atomic_long_inc(&f->data.incorrect);
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:3589:32: note: passing argument to parameter 'v' here
    3589 | atomic_long_inc(atomic_long_t *v)
         |                                ^
   2 errors generated.


vim +219 kernel/trace/trace_branch.c

   198	
   199	void ftrace_likely_update(struct ftrace_likely_data *f, int val,
   200				  int expect, int is_constant)
   201	{
   202		unsigned long flags = user_access_save();
   203	
   204		/* A constant is always correct */
   205		if (is_constant) {
   206			f->constant++;
   207			val = expect;
   208		}
   209		/*
   210		 * I would love to have a trace point here instead, but the
   211		 * trace point code is so inundated with unlikely and likely
   212		 * conditions that the recursive nightmare that exists is too
   213		 * much to try to get working. At least for now.
   214		 */
   215		trace_likely_condition(f, val, expect);
   216	
   217		/* FIXME: Make this atomic! */
   218		if (val == expect) {
 > 219			atomic_long_inc(&f->data.correct);
   220		} else {
   221		atomic_long_inc(&f->data.incorrect);
   222		}
   223	
   224		user_access_restore(flags);
   225	}
   226	EXPORT_SYMBOL(ftrace_likely_update);
   227	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
