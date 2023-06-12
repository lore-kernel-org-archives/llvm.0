Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E943417CE;
	Mon, 12 Jun 2023 03:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686540238; x=1718076238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0bPo+tuNyB5YklMT9QDtheL7DW0qieFCGA54reALbXo=;
  b=OEhPMfL0suTcrdl5RSc+wiYMXrydxykb0kkYWYO0PI7kOWTwB3oEmxvk
   3QjbPpWQjN+297tQbjd2VrBQpXVwLsmmiAaxJZ/g6jGVghaFxByFGc0IO
   AtbBDhwEg1qryJKrZbGpVkit40qWXFtmJbpA+l+616sSoHaltW4AO6uUK
   /hU7P/Q8hP7r16iJxT543Nf3w2b55jqGl8JHduTRwOHVWnQxudupwNvRz
   iwuGYr0aCmFE3H5WUp/AyFWeEPEdkzaksboqdPPpGfTbn/MQCuI6/4oqa
   t2rq1UQj1YvFPRywadKdu6GIL9IIYGvFzbEusxrCLVg41K6yTJG4L++LW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="347580315"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="347580315"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2023 20:23:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10738"; a="885254924"
X-IronPort-AV: E=Sophos;i="6.00,235,1681196400"; 
   d="scan'208";a="885254924"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 Jun 2023 20:23:56 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8Y9r-00002e-2L;
	Mon, 12 Jun 2023 03:23:55 +0000
Date: Mon, 12 Jun 2023 11:23:39 +0800
From: kernel test robot <lkp@intel.com>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Kenny Ho <Kenny.Ho@amd.com>
Subject: [linux-next:master 5458/8413] include/linux/fortify-string.h:529:4:
 error: call to '__read_overflow2_field' declared with 'warning' attribute:
 detected read beyond size of field (2nd parameter); maybe use
 struct_group()?
Message-ID: <202306121127.dP9U2Nnl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   53ab6975c12d1ad86c599a8927e8c698b144d669
commit: a0fd5a5f676c78e0cc9218c2d80c9211a41e8550 [5458/8413] drm/amd/amdgpu: introduce DRM_AMDGPU_WERROR
config: powerpc-randconfig-r034-20230612 (https://download.01.org/0day-ci/archive/20230612/202306121127.dP9U2Nnl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=a0fd5a5f676c78e0cc9218c2d80c9211a41e8550
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout a0fd5a5f676c78e0cc9218c2d80c9211a41e8550
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306121127.dP9U2Nnl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu11/sienna_cichlid_ppt.c:26:
   In file included from include/linux/firmware.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
   In file included from include/linux/spinlock.h:63:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:11:
   In file included from include/linux/string.h:254:
>> include/linux/fortify-string.h:529:4: error: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
     529 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   1 error generated.


vim +529 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  464  
f68f2ff91512c1 Kees Cook      2021-04-20  465  /*
f68f2ff91512c1 Kees Cook      2021-04-20  466   * To make sure the compiler can enforce protection against buffer overflows,
f68f2ff91512c1 Kees Cook      2021-04-20  467   * memcpy(), memmove(), and memset() must not be used beyond individual
f68f2ff91512c1 Kees Cook      2021-04-20  468   * struct members. If you need to copy across multiple members, please use
f68f2ff91512c1 Kees Cook      2021-04-20  469   * struct_group() to create a named mirror of an anonymous struct union.
f68f2ff91512c1 Kees Cook      2021-04-20  470   * (e.g. see struct sk_buff.) Read overflow checking is currently only
f68f2ff91512c1 Kees Cook      2021-04-20  471   * done when a write overflow is also present, or when building with W=1.
f68f2ff91512c1 Kees Cook      2021-04-20  472   *
f68f2ff91512c1 Kees Cook      2021-04-20  473   * Mitigation coverage matrix
f68f2ff91512c1 Kees Cook      2021-04-20  474   *					Bounds checking at:
f68f2ff91512c1 Kees Cook      2021-04-20  475   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  476   *					| Compile time  |   Run time    |
f68f2ff91512c1 Kees Cook      2021-04-20  477   * memcpy() argument sizes:		| write | read  | write | read  |
f68f2ff91512c1 Kees Cook      2021-04-20  478   *        dest     source   length      +-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  479   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  480   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  481   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  482   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  483   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
f68f2ff91512c1 Kees Cook      2021-04-20  484   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  485   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
f68f2ff91512c1 Kees Cook      2021-04-20  486   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
f68f2ff91512c1 Kees Cook      2021-04-20  487   *					+-------+-------+-------+-------+
f68f2ff91512c1 Kees Cook      2021-04-20  488   *
f68f2ff91512c1 Kees Cook      2021-04-20  489   * y = perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  490   * n = cannot perform deterministic compile-time bounds checking
f68f2ff91512c1 Kees Cook      2021-04-20  491   * n/a = no run-time bounds checking needed since compile-time deterministic
f68f2ff91512c1 Kees Cook      2021-04-20  492   * B = can perform run-time bounds checking (currently unimplemented)
f68f2ff91512c1 Kees Cook      2021-04-20  493   * V = vulnerable to run-time overflow (will need refactoring to solve)
f68f2ff91512c1 Kees Cook      2021-04-20  494   *
f68f2ff91512c1 Kees Cook      2021-04-20  495   */
54d9469bc515dc Kees Cook      2021-06-24  496  __FORTIFY_INLINE bool fortify_memcpy_chk(__kernel_size_t size,
f68f2ff91512c1 Kees Cook      2021-04-20  497  					 const size_t p_size,
f68f2ff91512c1 Kees Cook      2021-04-20  498  					 const size_t q_size,
f68f2ff91512c1 Kees Cook      2021-04-20  499  					 const size_t p_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  500  					 const size_t q_size_field,
f68f2ff91512c1 Kees Cook      2021-04-20  501  					 const char *func)
a28a6e860c6cf2 Francis Laniel 2021-02-25  502  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  503  	if (__builtin_constant_p(size)) {
f68f2ff91512c1 Kees Cook      2021-04-20  504  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  505  		 * Length argument is a constant expression, so we
f68f2ff91512c1 Kees Cook      2021-04-20  506  		 * can perform compile-time bounds checking where
fa35198f39571b Kees Cook      2022-09-19  507  		 * buffer sizes are also known at compile time.
f68f2ff91512c1 Kees Cook      2021-04-20  508  		 */
f68f2ff91512c1 Kees Cook      2021-04-20  509  
f68f2ff91512c1 Kees Cook      2021-04-20  510  		/* Error when size is larger than enclosing struct. */
fa35198f39571b Kees Cook      2022-09-19  511  		if (__compiletime_lessthan(p_size_field, p_size) &&
fa35198f39571b Kees Cook      2022-09-19  512  		    __compiletime_lessthan(p_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  513  			__write_overflow();
fa35198f39571b Kees Cook      2022-09-19  514  		if (__compiletime_lessthan(q_size_field, q_size) &&
fa35198f39571b Kees Cook      2022-09-19  515  		    __compiletime_lessthan(q_size, size))
a28a6e860c6cf2 Francis Laniel 2021-02-25  516  			__read_overflow2();
f68f2ff91512c1 Kees Cook      2021-04-20  517  
f68f2ff91512c1 Kees Cook      2021-04-20  518  		/* Warn when write size argument larger than dest field. */
fa35198f39571b Kees Cook      2022-09-19  519  		if (__compiletime_lessthan(p_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20  520  			__write_overflow_field(p_size_field, size);
f68f2ff91512c1 Kees Cook      2021-04-20  521  		/*
f68f2ff91512c1 Kees Cook      2021-04-20  522  		 * Warn for source field over-read when building with W=1
f68f2ff91512c1 Kees Cook      2021-04-20  523  		 * or when an over-write happened, so both can be fixed at
f68f2ff91512c1 Kees Cook      2021-04-20  524  		 * the same time.
f68f2ff91512c1 Kees Cook      2021-04-20  525  		 */
fa35198f39571b Kees Cook      2022-09-19  526  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) ||
fa35198f39571b Kees Cook      2022-09-19  527  		     __compiletime_lessthan(p_size_field, size)) &&
fa35198f39571b Kees Cook      2022-09-19  528  		    __compiletime_lessthan(q_size_field, size))
f68f2ff91512c1 Kees Cook      2021-04-20 @529  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  530  	}
f68f2ff91512c1 Kees Cook      2021-04-20  531  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  532  	 * At this point, length argument may not be a constant expression,
f68f2ff91512c1 Kees Cook      2021-04-20  533  	 * so run-time bounds checking can be done where buffer sizes are
f68f2ff91512c1 Kees Cook      2021-04-20  534  	 * known. (This is not an "else" because the above checks may only
f68f2ff91512c1 Kees Cook      2021-04-20  535  	 * be compile-time warnings, and we want to still warn for run-time
f68f2ff91512c1 Kees Cook      2021-04-20  536  	 * overflows.)
f68f2ff91512c1 Kees Cook      2021-04-20  537  	 */
f68f2ff91512c1 Kees Cook      2021-04-20  538  
f68f2ff91512c1 Kees Cook      2021-04-20  539  	/*
f68f2ff91512c1 Kees Cook      2021-04-20  540  	 * Always stop accesses beyond the struct that contains the
f68f2ff91512c1 Kees Cook      2021-04-20  541  	 * field, when the buffer's remaining size is known.
311fb40aa0569a Kees Cook      2022-09-02  542  	 * (The SIZE_MAX test is to optimize away checks where the buffer
f68f2ff91512c1 Kees Cook      2021-04-20  543  	 * lengths are unknown.)
f68f2ff91512c1 Kees Cook      2021-04-20  544  	 */
311fb40aa0569a Kees Cook      2022-09-02  545  	if ((p_size != SIZE_MAX && p_size < size) ||
311fb40aa0569a Kees Cook      2022-09-02  546  	    (q_size != SIZE_MAX && q_size < size))
f68f2ff91512c1 Kees Cook      2021-04-20  547  		fortify_panic(func);
54d9469bc515dc Kees Cook      2021-06-24  548  
54d9469bc515dc Kees Cook      2021-06-24  549  	/*
54d9469bc515dc Kees Cook      2021-06-24  550  	 * Warn when writing beyond destination field size.
54d9469bc515dc Kees Cook      2021-06-24  551  	 *
54d9469bc515dc Kees Cook      2021-06-24  552  	 * We must ignore p_size_field == 0 for existing 0-element
54d9469bc515dc Kees Cook      2021-06-24  553  	 * fake flexible arrays, until they are all converted to
54d9469bc515dc Kees Cook      2021-06-24  554  	 * proper flexible arrays.
54d9469bc515dc Kees Cook      2021-06-24  555  	 *
9f7d69c5cd2390 Kees Cook      2022-09-19  556  	 * The implementation of __builtin_*object_size() behaves
54d9469bc515dc Kees Cook      2021-06-24  557  	 * like sizeof() when not directly referencing a flexible
54d9469bc515dc Kees Cook      2021-06-24  558  	 * array member, which means there will be many bounds checks
54d9469bc515dc Kees Cook      2021-06-24  559  	 * that will appear at run-time, without a way for them to be
54d9469bc515dc Kees Cook      2021-06-24  560  	 * detected at compile-time (as can be done when the destination
54d9469bc515dc Kees Cook      2021-06-24  561  	 * is specifically the flexible array member).
54d9469bc515dc Kees Cook      2021-06-24  562  	 * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101832
54d9469bc515dc Kees Cook      2021-06-24  563  	 */
54d9469bc515dc Kees Cook      2021-06-24  564  	if (p_size_field != 0 && p_size_field != SIZE_MAX &&
54d9469bc515dc Kees Cook      2021-06-24  565  	    p_size != p_size_field && p_size_field < size)
54d9469bc515dc Kees Cook      2021-06-24  566  		return true;
54d9469bc515dc Kees Cook      2021-06-24  567  
54d9469bc515dc Kees Cook      2021-06-24  568  	return false;
a28a6e860c6cf2 Francis Laniel 2021-02-25  569  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  570  

:::::: The code at line 529 was first introduced by commit
:::::: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct member overflows in memcpy() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
