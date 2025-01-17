Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D05146013;
	Fri, 17 Jan 2025 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737125397; cv=none; b=RNCT6xuA8THomuc8pwqVjyKuR+xVVI9V/a2jwi4iJRlisQSLOiujDlXF3nMNLA921as2qhc6JO19e1Ph77hcW5u2aSYpw6h0UYoM7xs5N1x25Mc6PcwFbITKWpZO1QkjIQ4H61oxUPCm2auMsUqnjEOtWV2eCJ7wD7hEjjw6UM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737125397; c=relaxed/simple;
	bh=h8WffqvxaEsSYoYpTeiCx+GJWv4l84y/rXSd++RIEQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sZaLIucljonDZtBmDmfYMHT47Gb93RYGQwYU5QNRgFvl/US0p2Q+oVQWtBPhBnppsHmeSMiF0qw9rViirUe/h/SILtjWWjN4umbrbo2RGZFc6f6IP37FhmT1pls+AZtiS5+wwVq0OYKXF2KFM4W5r7VdWTzeV37Z8nfmExLdRlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQskXgYh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQskXgYh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737125395; x=1768661395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h8WffqvxaEsSYoYpTeiCx+GJWv4l84y/rXSd++RIEQI=;
  b=lQskXgYhceG5WDu9yjDvuu6Q5/MGI+7aV9+LLQ0qQV2uSi+4IDx1g6aR
   Q5lzQk7SF0+/8im8qLGd1SPqaMng08Yms/J/9zLTRXeg3Wmnl7vS9Z8ON
   TPq8L3+UgevgxpGjC8F/438QWEBn/TQQ85lPt4g5o0yAVZb+php0d3Oof
   7ITQjrTjRb3+P9JcDW3PgxftI3DIHLcRul6Bd9GPxcjlvmVI7QUxMKQ13
   jUyfdutUZP6lvPWiR/8uyWZCqhqXmm66i5+WrjStC4emN1PlU+LjD5EMQ
   xDcOk6q3ZaVd09neKKDQtAJfAibCnKZD8Z3qH2UqGezMrmdOCbNQYDAfe
   A==;
X-CSE-ConnectionGUID: PkSbFuM7TDyzluj5JanBcw==
X-CSE-MsgGUID: YhgpEVjhSoOPGb0t1L6t7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48145817"
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="48145817"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 06:49:55 -0800
X-CSE-ConnectionGUID: 9flunyZoT1eOniExet9rIQ==
X-CSE-MsgGUID: SMdUpBfXQmmppiwdjuv91Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,212,1732608000"; 
   d="scan'208";a="105618165"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jan 2025 06:49:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYnfS-000TL5-0c;
	Fri, 17 Jan 2025 14:49:50 +0000
Date: Fri, 17 Jan 2025 22:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Lakshmi Prasanna Eachuri <lakshmi.prasanna.eachuri@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:lkp_test 265/504] include/linux/fortify-string.h:571:4:
 warning: call to '__write_overflow_field' declared with 'warning' attribute:
 detected write beyond size of field (1st parameter); maybe use
 struct_group()?
Message-ID: <202501172230.aAblUhX8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   8a741e6807773939e52c55328c0952bf388b2e8e
commit: 692c5d72e6fede865e6e5f760e1676345e92b070 [265/504] drm: xlnx: Add HDCP2X TX support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250117/202501172230.aAblUhX8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501172230.aAblUhX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501172230.aAblUhX8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xlnx/hdcp/xlnx_hdcp2x_crypt.c:18:
   In file included from include/crypto/aes.h:10:
   In file included from include/linux/crypto.h:15:
   In file included from include/linux/completion.h:12:
   In file included from include/linux/swait.h:7:
   In file included from include/linux/spinlock.h:59:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/arm64/include/asm/irqflags.h:9:
   In file included from arch/arm64/include/asm/ptrace.h:11:
   In file included from arch/arm64/include/asm/cpufeature.h:27:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:13:
   In file included from include/linux/string.h:390:
>> include/linux/fortify-string.h:571:4: warning: call to '__write_overflow_field' declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Wattribute-warning]
     571 |                         __write_overflow_field(p_size_field, size);
         |                         ^
   1 warning generated.


vim +571 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  515  
f68f2ff91512c1 Kees Cook      2021-04-20  516  /*
f68f2ff91512c1 Kees Cook      2021-04-20  517   * To make sure the compiler can enforce protection against buffer overflows,
f68f2ff91512c1 Kees Cook      2021-04-20  518   * memcpy(), memmove(), and memset() must not be used beyond individual
f68f2ff91512c1 Kees Cook      2021-04-20  519   * struct members. If you need to copy across multiple members, please use
f68f2ff91512c1 Kees Cook      2021-04-20  520   * struct_group() to create a named mirror of an anonymous struct union.
f68f2ff91512c1 Kees Cook      2021-04-20  521   * (e.g. see struct sk_buff.) Read overflow checking is currently only
f68f2ff91512c1 Kees Cook      2021-04-20  522   * done when a write overflow is also present, or when building with W=1.
f68f2ff91512c1 Kees Cook      2021-04-20  523   *
f68f2ff91512c1 Kees Cook      2021-04-20  524   * Mitigation coverage matrix
f68f2ff91512c1 Kees Cook      2021-04-20  525   *					Bounds checking at:
f68f2ff91512c1 Kees Cook      2021-04-20  526   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  527   *					| Compile time  |   Run time    |
f68f2ff91512c1 Kees Cook      2021-04-20  528   * memcpy() argument sizes:		| write | read  | write | read  |
f68f2ff91512c1 Kees Cook      2021-04-20  529   *        dest     source   length      +-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  530   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  531   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  532   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  533   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  534   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  535   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  536   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  537   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  538   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  539   *
f68f2ff91512c1 Kees Cook      2021-04-20  540   * y = perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  541   * n = cannot perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  542   * n/a = no run-time bounds checking needed since compile-time deterministic
f68f2ff91512c1 Kees Cook      2021-04-20  543   * B = can perform run-time bounds checking (currently unimplemented)
f68f2ff91512c1 Kees Cook      2021-04-20  544   * V = vulnerable to run-time overflow (will need refactoring to solve)
f68f2ff91512c1 Kees Cook      2021-04-20  545   *
f68f2ff91512c1 Kees Cook      2021-04-20  546   */
54d9469bc515dc Kees Cook      2021-06-24  547  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
f68f2ff91512c1 Kees Cook      2021-04-20  548  					 const size_t p_size,
f68f2ff91512c1 Kees Cook      2021-04-20  549  					 const size_t q_size,
f68f2ff91512c1 Kees Cook      2021-04-20  550  					 const size_t p_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  551  					 const size_t q_size_field,
475ddf1fce1ec4 Kees Cook      2023-04-07  552  					 const u8 func)
a28a6e860c6cf2 Francis Laniel 2021-02-25  553  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  554  	if (__builtin_constant_p(size)) {
f68f2ff91512c1 Kees Cook      2021-04-20  555  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  556  		 * Length argument is a constant expression, so we
f68f2ff91512c1 Kees Cook      2021-04-20  557  		 * can perform compile-time bounds checking where
fa35198f39571b Kees Cook      2022-09-19  558  		 * buffer sizes are also known at compile time.
f68f2ff91512c1 Kees Cook      2021-04-20  559  		 */
f68f2ff91512c1 Kees Cook      2021-04-20  560  
f68f2ff91512c1 Kees Cook      2021-04-20  561  		/* Error when size is larger than enclosing struct. */
fa35198f39571b Kees Cook      2022-09-19  562  		if (__compiletime_lessthan(p_size_field, p_size) &&
fa35198f39571b Kees Cook      2022-09-19  563  		    __compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  564  			__write_overflow();
fa35198f39571b Kees Cook      2022-09-19  565  		if (__compiletime_lessthan(q_size_field, q_size) &&
fa35198f39571b Kees Cook      2022-09-19  566  		    __compiletime_lessthan(q_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  567  			__read_overflow2();
f68f2ff91512c1 Kees Cook      2021-04-20  568  
f68f2ff91512c1 Kees Cook      2021-04-20  569  		/* Warn when write size argument larger than dest field. */
fa35198f39571b Kees Cook      2022-09-19  570  		if (__compiletime_lessthan(p_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20 @571  			__write_overflow_field(p_size_field, size);
f68f2ff91512c1 Kees Cook      2021-04-20  572  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  573  		 * Warn for source field over-read when building with W=1
f68f2ff91512c1 Kees Cook      2021-04-20  574  		 * or when an over-write happened, so both can be fixed at
f68f2ff91512c1 Kees Cook      2021-04-20  575  		 * the same time.
f68f2ff91512c1 Kees Cook      2021-04-20  576  		 */
fa35198f39571b Kees Cook      2022-09-19  577  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) ||
fa35198f39571b Kees Cook      2022-09-19  578  		     __compiletime_lessthan(p_size_field, size)) &&
fa35198f39571b Kees Cook      2022-09-19  579  		    __compiletime_lessthan(q_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20  580  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  581  	}
f68f2ff91512c1 Kees Cook      2021-04-20  582  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  583  	 * At this point, length argument may not be a constant expression,
f68f2ff91512c1 Kees Cook      2021-04-20  584  	 * so run-time bounds checking can be done where buffer sizes are
f68f2ff91512c1 Kees Cook      2021-04-20  585  	 * known. (This is not an "else" because the above checks may only
f68f2ff91512c1 Kees Cook      2021-04-20  586  	 * be compile-time warnings, and we want to still warn for run-time
f68f2ff91512c1 Kees Cook      2021-04-20  587  	 * overflows.)
f68f2ff91512c1 Kees Cook      2021-04-20  588  	 */
f68f2ff91512c1 Kees Cook      2021-04-20  589  
f68f2ff91512c1 Kees Cook      2021-04-20  590  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  591  	 * Always stop accesses beyond the struct that contains the
f68f2ff91512c1 Kees Cook      2021-04-20  592  	 * field, when the buffer's remaining size is known.
311fb40aa0569a Kees Cook      2022-09-02  593  	 * (The SIZE_MAX test is to optimize away checks where the buffer
f68f2ff91512c1 Kees Cook      2021-04-20  594  	 * lengths are unknown.)
f68f2ff91512c1 Kees Cook      2021-04-20  595  	 */
475ddf1fce1ec4 Kees Cook      2023-04-07  596  	if (p_size != SIZE_MAX && p_size < size)
3d965b33e40d97 Kees Cook      2023-04-07  597  		fortify_panic(func, FORTIFY_WRITE, p_size, size, true);
475ddf1fce1ec4 Kees Cook      2023-04-07  598  	else if (q_size != SIZE_MAX && q_size < size)
3d965b33e40d97 Kees Cook      2023-04-07  599  		fortify_panic(func, FORTIFY_READ, p_size, size, true);
54d9469bc515dc Kees Cook      2021-06-24  600  
54d9469bc515dc Kees Cook      2021-06-24  601  	/*
54d9469bc515dc Kees Cook      2021-06-24  602  	 * Warn when writing beyond destination field size.
54d9469bc515dc Kees Cook      2021-06-24  603  	 *
2003e483a81cc2 Kees Cook      2024-06-19  604  	 * Note the implementation of __builtin_*object_size() behaves
54d9469bc515dc Kees Cook      2021-06-24  605  	 * like sizeof() when not directly referencing a flexible
54d9469bc515dc Kees Cook      2021-06-24  606  	 * array member, which means there will be many bounds checks
54d9469bc515dc Kees Cook      2021-06-24  607  	 * that will appear at run-time, without a way for them to be
54d9469bc515dc Kees Cook      2021-06-24  608  	 * detected at compile-time (as can be done when the destination
54d9469bc515dc Kees Cook      2021-06-24  609  	 * is specifically the flexible array member).
54d9469bc515dc Kees Cook      2021-06-24  610  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
54d9469bc515dc Kees Cook      2021-06-24  611  	 */
2003e483a81cc2 Kees Cook      2024-06-19  612  	if (p_size_field != SIZE_MAX &&
54d9469bc515dc Kees Cook      2021-06-24  613  	    p_size != p_size_field && p_size_field < size)
54d9469bc515dc Kees Cook      2021-06-24  614  		return true;
54d9469bc515dc Kees Cook      2021-06-24  615  
54d9469bc515dc Kees Cook      2021-06-24  616  	return false;
a28a6e860c6cf2 Francis Laniel 2021-02-25  617  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  618  

:::::: The code at line 571 was first introduced by commit
:::::: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
