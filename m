Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6465533C52A;
	Fri, 13 Feb 2026 23:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771024853; cv=none; b=Sf2ohaemLy4OQScwYGR0OvZWX8wRwua/dYVXGWyqszIRDu6MYfQuHrxx5GUwoTMb5p3ykL5cXj+nLzeI/fPVjvQMa+wSl1rRvK4oy1KUkrejd4b+Qxe3ZC5euDS2HdjyvdlJJRIzfimUC9LWjrQnEEi2yQSCSTmzJy0mCy+TQaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771024853; c=relaxed/simple;
	bh=EkQtcVmiJ8ec56l6tnyPvJJpdOdXvQyvqzGPx4Fwt9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=aPwbI6QZl1NTBUeGWlqrwIZ1b2K8YV6isuUl4avFWPK9rnXYkRT9bMGIwgyt6vDF1x3MlHN5jxR0XJHML0zRam+UV83oZy/phGfe7O52z+FZ+0bQKHGtHt6NpkpQhcRdYNdA7j1OWTxaMpSbau0gZjDxSqBahkbwLmg3EO4gFcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wbc8Y/Bd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wbc8Y/Bd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771024852; x=1802560852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EkQtcVmiJ8ec56l6tnyPvJJpdOdXvQyvqzGPx4Fwt9g=;
  b=Wbc8Y/Bd4Y44zS/Osz24UXLNtpqKZL04tGw0Af8garl7b1UJaNTIJZ3m
   tdDj2aDsyxgsdgej/VgEr4ono468+GYXb2KbJdMzbydfsM8pFY2cah2wj
   /zwn1EDGRnjAsw81jvurLzynISk8PEOyGRioML48bnqjL8yhmDYknDCgd
   kIy8REFjKrKA7LKgWSSCnzBfqyBExnVdxtUPa929PUQTjdlJZtd1HMmkk
   UUE8aK4N6Ia05s4/LdazE+CHHsgKl7QNX6ZK/8l5TCUUPYsSaeo61iXwL
   RAxXoe5G3qkXjEE6QULckSJUwaXG5X+hRymNBqUCYWUvq23B878RiCUpH
   w==;
X-CSE-ConnectionGUID: Q1FE0S+CQhmTEtJlFpZOKg==
X-CSE-MsgGUID: VzfdXvXJR/qtSyZf4uOj/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="72388595"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="72388595"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:20:52 -0800
X-CSE-ConnectionGUID: 7W+sUFmDSdCk37Hj29PTvQ==
X-CSE-MsgGUID: SPPu+G0iSwq1YTG6h6xeXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="211711519"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2026 15:20:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr2Su-00000000vtp-10N7;
	Fri, 13 Feb 2026 23:20:48 +0000
Date: Sat, 14 Feb 2026 07:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat_32bit_time 3/4]
 lib/vdso/gettimeofday.c:343:2: error: call to undeclared function
 'BUILD_BUG_ON'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202602140732.Qkr1m15w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat_32bit_time
head:   1a400ee33c91f1c010e4fcbddc3781afdc8ff201
commit: 194ed9d5b6d11d446fde4eaa8724406aa7cd5fe2 [3/4] generic
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260214/202602140732.Qkr1m15w-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140732.Qkr1m15w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140732.Qkr1m15w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
>> lib/vdso/gettimeofday.c:343:2: error: call to undeclared function 'BUILD_BUG_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     343 |         BUILD_BUG_ON(!IS_ENABLED(CONFIG_VDSO_COMPAT_32BIT_TIME));
         |         ^
   lib/vdso/gettimeofday.c:496:2: error: call to undeclared function 'BUILD_BUG_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     496 |         BUILD_BUG_ON(!IS_ENABLED(CONFIG_VDSO_COMPAT_32BIT_TIME));
         |         ^
   2 errors generated.
   make[3]: *** [arch/arm64/kernel/vdso32/Makefile:135: arch/arm64/kernel/vdso32/vgettimeofday.o] Error 1
   make[3]: Target 'arch/arm64/kernel/vdso32/vdso.so' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:208: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/BUILD_BUG_ON +343 lib/vdso/gettimeofday.c

   334	
   335	#ifdef BUILD_VDSO32
   336	static __maybe_unused int
   337	__cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
   338				     struct old_timespec32 *res)
   339	{
   340		struct __kernel_timespec ts;
   341		bool ok;
   342	
 > 343		BUILD_BUG_ON(!IS_ENABLED(CONFIG_VDSO_COMPAT_32BIT_TIME));
   344	
   345		ok = __cvdso_clock_gettime_common(vd, clock, &ts);
   346	
   347		if (unlikely(!ok))
   348			return clock_gettime32_fallback(clock, res);
   349	
   350		/* For ok == true */
   351		res->tv_sec = ts.tv_sec;
   352		res->tv_nsec = ts.tv_nsec;
   353	
   354		return 0;
   355	}
   356	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
