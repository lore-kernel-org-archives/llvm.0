Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED9B40849;
	Tue, 18 Mar 2025 00:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742259125; cv=none; b=EWzJv5Xw4AQg0/cgxLJpMtC/RnIkdEHLDTtYjkvUUW15YlpPjUwBmNbJVoTm/tl/Q8lUtOjJoSfYEp1JSZ25hD8Ttss+qfv+vmnMk9N+cYKQuSEDqB0BzcnBpSMnewVNRS9deimgWonlgDpNhlyW9l6GowBfCAvy0Eqn8AghhEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742259125; c=relaxed/simple;
	bh=uqjluGoSoz1Do0NQKp+ajk2Z1RNnacGAG8cG6QPiT+g=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IRh3j7JJebbZWcPSn6M4k50E8cHKUTN6uFy1AkGFBNEFmZKx8sqS6++h905qzlpbL+6mqxGAMzGf8sgN4dSLn8xeLYOS+b8d/6C4QGVtG9lWTJ6R3+QY48x1ZQu8os5EkP6nqIVKHakUtCD2SBwJT7LhjWkzHyyKgdLtgPw7RBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLABzPyA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLABzPyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742259123; x=1773795123;
  h=date:from:cc:subject:message-id:mime-version;
  bh=uqjluGoSoz1Do0NQKp+ajk2Z1RNnacGAG8cG6QPiT+g=;
  b=eLABzPyAwr/mrdTIo6FYKYqpHJRS5oLKLLwJC+oV07EdgBdc8PgF7FO2
   hFa5pH5Z8hk71PPTbQhRGds7VcacXhbSJU4Ys7TpJ3omReeabTv8RnDad
   L/aIzuehk0nF7o8HmL1EuOOCEotaPdwmnoexB1hTE851RHjInfxIwfCQ5
   9hJurpUP8UABd//AUUoFRImXVZtZ1ZPgN5c19NceYgZC2julU30dYdmUV
   zkroi67gSzkWeQPV41KlMnHwZI8phtcYgbsra7Q042XGHd7jNFbxb4mg9
   YQ9kM9TgLzuNtDFzpPBbV3lgtraQzz1lnzN5e+9FwTXAecqFa3e2AwJW9
   g==;
X-CSE-ConnectionGUID: XAwSa/kETX2ov1vPhX3Rfw==
X-CSE-MsgGUID: +SfKghfmSIOelBU0yKQcPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="54006785"
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="54006785"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2025 17:52:02 -0700
X-CSE-ConnectionGUID: J1q7PrQrSYWBB/ToZPEFww==
X-CSE-MsgGUID: D+ANgsWLRYOJsYDYD+PbfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,255,1736841600"; 
   d="scan'208";a="122091480"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Mar 2025 17:52:01 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuLBW-000DG3-2g;
	Tue, 18 Mar 2025 00:51:58 +0000
Date: Tue, 18 Mar 2025 08:51:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH 3/3] ubsan/overflow: Enable ignorelist parsing and add
 type filter
Message-ID: <202503180815.hABxOEAV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20250307041914.937329-3-kees@kernel.org>
References: <20250307041914.937329-3-kees@kernel.org>
TO: Kees Cook <kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/hardening]
[also build test ERROR on masahiroy-kbuild/for-next masahiroy-kbuild/fixes kees/for-next/pstore linus/master v6.14-rc7]
[cannot apply to kees/for-next/kspp next-20250317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/ubsan-overflow-Rework-integer-overflow-sanitizer-option-to-turn-on-everything/20250307-122130
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20250307041914.937329-3-kees%40kernel.org
patch subject: [PATCH 3/3] ubsan/overflow: Enable ignorelist parsing and add type filter
config: x86_64-randconfig-074-20250318 (https://download.01.org/0day-ci/archive/20250318/202503180815.hABxOEAV-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250318/202503180815.hABxOEAV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503180815.hABxOEAV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/fortify_kunit.c:43:
   In file included from include/kunit/device.h:16:
   In file included from include/kunit/test.h:22:
   In file included from include/linux/kref.h:16:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:80:
   In file included from arch/x86/include/asm/paravirt.h:21:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:13:
   In file included from include/linux/string.h:392:
>> include/linux/fortify-string.h:719:4: error: call to '__read_overflow' declared with 'error' attribute: detected read beyond size of object (1st parameter)
     719 |                         __read_overflow();
         |                         ^
   1 error generated.


vim +719 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  710  
92df138a8d663c Kees Cook      2022-02-08  711  __FORTIFY_INLINE __diagnose_as(__builtin_memcmp, 1, 2, 3)
281d0c962752fb Kees Cook      2022-02-08  712  int memcmp(const void * const POS0 p, const void * const POS0 q, __kernel_size_t size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  713  {
21a2c74b0a2a78 Kees Cook      2023-04-07  714  	const size_t p_size = __struct_size(p);
21a2c74b0a2a78 Kees Cook      2023-04-07  715  	const size_t q_size = __struct_size(q);
a28a6e860c6cf2 Francis Laniel 2021-02-25  716  
a28a6e860c6cf2 Francis Laniel 2021-02-25  717  	if (__builtin_constant_p(size)) {
fa35198f39571b Kees Cook      2022-09-19  718  		if (__compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25 @719  			__read_overflow();
fa35198f39571b Kees Cook      2022-09-19  720  		if (__compiletime_lessthan(q_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  721  			__read_overflow2();
a28a6e860c6cf2 Francis Laniel 2021-02-25  722  	}
3d965b33e40d97 Kees Cook      2023-04-07  723  	if (p_size < size)
3d965b33e40d97 Kees Cook      2023-04-07  724  		fortify_panic(FORTIFY_FUNC_memcmp, FORTIFY_READ, p_size, size, INT_MIN);
3d965b33e40d97 Kees Cook      2023-04-07  725  	else if (q_size < size)
3d965b33e40d97 Kees Cook      2023-04-07  726  		fortify_panic(FORTIFY_FUNC_memcmp, FORTIFY_READ, q_size, size, INT_MIN);
a28a6e860c6cf2 Francis Laniel 2021-02-25  727  	return __underlying_memcmp(p, q, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  728  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  729  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
