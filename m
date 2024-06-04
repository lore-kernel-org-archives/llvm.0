Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AC04A07;
	Tue,  4 Jun 2024 01:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717465292; cv=none; b=GtpgVXcmOMqFtA3geEsv4DH0Cf3QGwMlQVW5sRC667SVUIKndw0bXtHbZgAYjSEhjOS4w5vb7/9paGW5/ITJCeAUUvQdsFunWshPFJmjIqlWE01DfQGT8VF914IbXK0GmIQd56VvagrEBNwqy1BID2fWR0Taly8lDOMV9Ja7nFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717465292; c=relaxed/simple;
	bh=+IlcEpeLInZMsPQNqW7j6WVXPHrM+sm6GR24FdelvMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ad/nSzwuc1/5fGN3jDaTmvWnS07b3EI6QQucONHyFvYtMWH8pbIlGcH01yjFQH1H5pCU/EC91HVkIwKOpSYPHkygHjaE0ZQUHlTQRHEJ2zEoFHh+I27qzOFS6LOctZHQt4yzii5pIwLXbmIKhUkpwab7AGecH44EOlX9v7oeFYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6C/CMF+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6C/CMF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717465291; x=1749001291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+IlcEpeLInZMsPQNqW7j6WVXPHrM+sm6GR24FdelvMc=;
  b=Z6C/CMF+uIYehhDsBqSAQbwK7CZiUC+dXPSB6eiHQuPeoQj04vyZmDt6
   y5rc+3yQKh30dxtXwg8XGvUisZBqx6z24+hOZsuJG3mgx1Xv9UmSsbHUt
   lMV+GoREhB4eo71wNCrD30mpbSMj7UTz677w4bNScI10VLWKOuQe433tI
   00D3HwUZ87DVwfKEUyHQNXYCfXql+YKK8H3A5GHA8ybeB74YB/6LT3xI+
   xNBN1LLPiWMOg4BLBwv38EoxjJ1wRLhfNsQ9oeEjL90fJaDwtunQEIznc
   KX55tRPSKrgVkwqZ3fkpPSuGcR2ekyzwEhvqIpZven262gnj/FwgcCPVj
   Q==;
X-CSE-ConnectionGUID: lZxmnkNGSlKv7JLewwdVrQ==
X-CSE-MsgGUID: sub9p904Rc2oYEoaoq+zSw==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13931608"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="13931608"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 18:41:30 -0700
X-CSE-ConnectionGUID: t/Jbv0P2SbWe4+8ixqNhwg==
X-CSE-MsgGUID: /tc9JLHIS/CjZeTxIoAlyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; 
   d="scan'208";a="37181243"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jun 2024 18:41:27 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEJAy-000MQB-2E;
	Tue, 04 Jun 2024 01:41:24 +0000
Date: Tue, 4 Jun 2024 09:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-6.10 5/5] io_uring/napi.c:284:4: error:
 incompatible pointer types passing 'unsigned int *' to parameter of type
 'uint64_t *' (aka 'unsigned long long *')
Message-ID: <202406040947.kFGqTrFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-6.10
head:   104fdbcf07a71a2435c3737c57b2927d0af260af
commit: 104fdbcf07a71a2435c3737c57b2927d0af260af [5/5] io_uring/napi: fix timeout calculation
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240604/202406040947.kFGqTrFC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240604/202406040947.kFGqTrFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406040947.kFGqTrFC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> io_uring/napi.c:284:4: warning: comparison of distinct pointer types ('typeof ((poll_to)) *' (aka 'unsigned int *') and 'uint64_t *' (aka 'unsigned long long *')) [-Wcompare-distinct-pointer-types]
                           do_div(poll_to, 1000);
                           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:222:28: note: expanded from macro 'do_div'
           (void)(((typeof((n)) *)0) == ((uint64_t *)0));  \
                  ~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
>> io_uring/napi.c:284:4: error: incompatible pointer types passing 'unsigned int *' to parameter of type 'uint64_t *' (aka 'unsigned long long *') [-Werror,-Wincompatible-pointer-types]
                           do_div(poll_to, 1000);
                           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:238:22: note: expanded from macro 'do_div'
                   __rem = __div64_32(&(n), __base);       \
                                      ^~~~
   arch/arm/include/asm/div64.h:24:45: note: passing argument to parameter 'n' here
   static inline uint32_t __div64_32(uint64_t *n, uint32_t base)
                                               ^
>> io_uring/napi.c:284:4: warning: shift count >= width of type [-Wshift-count-overflow]
                           do_div(poll_to, 1000);
                           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/div64.h:234:25: note: expanded from macro 'do_div'
           } else if (likely(((n) >> 32) == 0)) {          \
                                  ^  ~~
   include/linux/compiler.h:76:40: note: expanded from macro 'likely'
   # define likely(x)      __builtin_expect(!!(x), 1)
                                               ^
   2 warnings and 1 error generated.


vim +284 io_uring/napi.c

   262	
   263	/*
   264	 * __io_napi_adjust_timeout() - adjust busy loop timeout
   265	 * @ctx: pointer to io-uring context structure
   266	 * @iowq: pointer to io wait queue
   267	 * @ts: pointer to timespec or NULL
   268	 *
   269	 * Adjust the busy loop timeout according to timespec and busy poll timeout.
   270	 * If the specified NAPI timeout is bigger than the wait timeout, then adjust
   271	 * the NAPI timeout accordingly.
   272	 */
   273	void __io_napi_adjust_timeout(struct io_ring_ctx *ctx, struct io_wait_queue *iowq,
   274				      struct timespec64 *ts)
   275	{
   276		unsigned int poll_to = READ_ONCE(ctx->napi_busy_poll_to);
   277	
   278		if (ts) {
   279			struct timespec64 poll_to_ts;
   280	
   281			poll_to_ts = ns_to_timespec64(1000 * (s64)poll_to);
   282			if (timespec64_compare(ts, &poll_to_ts) < 0) {
   283				poll_to = timespec64_to_ns(ts);
 > 284				do_div(poll_to, 1000);
   285			}
   286		}
   287	
   288		iowq->napi_busy_poll_to = poll_to;
   289	}
   290	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
