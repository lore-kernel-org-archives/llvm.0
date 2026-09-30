Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5C5466AE5;
	Wed, 30 Sep 2026 08:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790756106; cv=none; b=BRR6+8qGnLURyKtEByM8kK2E5rCCon5Qmxr6TAip06TnHVKKSarLy76Q7eRIw1YJIh6PyUCk5UsXcBU9ZqC8ct+sDTt8EWSEo8bcA9JNxMhu4TQXnjoxIqORquTehaEY2QTbnDxiAxCR1nofbLaaxtfPWYc3uBkAPvOShZDl2zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790756106; c=relaxed/simple;
	bh=BWrZ6yMivpp14WpUba3Trbm72Gkex04IeJblW4SgEI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jMFV+r/gUOnUAKS3ffkzAujYC2asYRuhp0yD8hgB8ewseXLbr8B5hwn+CN0tYocgrOeuDylM8QEWSxsRovqTj1xzlRE/1dEAtHrxXTqUFuhzwvoedhjqCVKqEyk0VSgF4c2pxJ48a88TCtD+V4mJ1OJr0JHmqhORjG9yH8P9Ido=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsNViFFq; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsNViFFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790756103; x=1822292103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BWrZ6yMivpp14WpUba3Trbm72Gkex04IeJblW4SgEI4=;
  b=MsNViFFqKYuM38emgFCCuRVftmVFiFlyGsY/BTYujQgRbEpcbFVLJuXU
   AwpsWZXcdQ2CNS1BosLwWYcy8YRB63cQwWJqjpSaVL+CIDkAkSYZEYczV
   gfjUnt9Go4gq8dbz3f0G/C8vivyuihxw0UnmNe+FS+1Al/dJjnRu0LwJu
   mUz2vwg84z1/WsSJzA9xWJU7IvNTwaZ4tnwvk92IKfwWbMhacACOkzRHG
   GkwdXV3Pd/1UF/JUQkv6Y8E1g1PASg3RH9vUfBjnXOhHVxvWGwzvV25Ov
   B/SI7YjhlKtoo1JeuUdlJuxd5ZZDHW4q8W/rEfeRPjS2k3zLo3lmS71Ch
   g==;
X-CSE-ConnectionGUID: zjKv12ebQhySqlw+1bus/Q==
X-CSE-MsgGUID: Wu53EKIOTu+M52fxVE4eXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95298339"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="95298339"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 01:15:02 -0700
X-CSE-ConnectionGUID: ALMYOA1OSR6vl0n0H8bnMA==
X-CSE-MsgGUID: MLKk/A6rT5+kA0deIE5pZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="274751140"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Sep 2026 01:15:01 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBpSs-00000000QMk-00kz;
	Wed, 30 Sep 2026 08:14:58 +0000
Date: Wed, 30 Sep 2026 16:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Thomas Gleixner <tglx@kernel.org>,
 "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Subject: [tip:timers/vdso 4/4]
 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:288:24: error:
 call to undeclared function 'BITS_PER_TYPE'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202609301648.OQYqz8q1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/vdso
head:   ca46a07c4b68246c4e400ce3649ab7228a878d8f
commit: ca46a07c4b68246c4e400ce3649ab7228a878d8f [4/4] vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20260930/202609301648.OQYqz8q1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609301648.OQYqz8q1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609301648.OQYqz8q1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/vdso/vclock_gettime.c:22:
>> arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c:288:24: error: call to undeclared function 'BITS_PER_TYPE'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     288 |         BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
         |                               ^
   1 error generated.


vim +/BITS_PER_TYPE +288 arch/sparc/include/uapi/../../../../lib/vdso/gettimeofday.c

   273	
   274	static __always_inline bool
   275	__cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
   276				     struct __kernel_timespec *ts)
   277	{
   278		const struct vdso_clock *vc = vd->clock_data;
   279		u32 msk;
   280	
   281		if (!vdso_clockid_valid(clock))
   282			return false;
   283	
   284		/*
   285		 * Convert the clockid to a bitmask and use it to check which
   286		 * clocks are handled in the VDSO directly.
   287		 */
 > 288		BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
   289		msk = 1U << clock;
   290		if (likely(msk & VDSO_HRES))
   291			vc = &vc[CS_HRES_COARSE];
   292		else if (msk & VDSO_COARSE)
   293			return do_coarse(vd, &vc[CS_HRES_COARSE], clock, ts);
   294		else if (msk & VDSO_RAW)
   295			vc = &vc[CS_RAW];
   296		else if (msk & VDSO_AUX)
   297			return do_aux(vd, clock, ts);
   298		else
   299			return false;
   300	
   301		return do_hres(vd, vc, clock, ts);
   302	}
   303	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
