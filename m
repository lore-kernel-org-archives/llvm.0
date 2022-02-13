Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2E37D
	for <llvm@lists.linux.dev>; Sun, 13 Feb 2022 12:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644753775; x=1676289775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4SzdYCFyqm8kbz7kcpGO3u1kRBrYQerBXPZRhR2xmWQ=;
  b=KTNvSr1HV+Wo5DdOVvvS1wsdXa1Jfm0+idZ4piNqciAs8ip5VrTXls+9
   MBEMX2R5+6Z1mtOQt6WrjsmZkmVlmoG8tFyM8Ah5+jSPFVQx5TsAwyVhe
   wvGi3m5+BpDYKdCsd+haPrBIWAL3z2fVEbMcVNVou9f5XTkeB/40qr9M9
   uwJNpx7h0MbmVFjs70rqrq+Gtrw9HMusYjk4y5bPIQt6CW+sU2JJldM+f
   J/uXtWHjWVHOcDEpYSp9t+TokySunjw99e0qQ2v0HfI8BqbEUPWhggOpO
   5MNIYv5HvvL5vPT/X+hWG7JPV27vbZ3qbLc52SMSiHalku+74GCAhjCE7
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10256"; a="310680667"
X-IronPort-AV: E=Sophos;i="5.88,365,1635231600"; 
   d="scan'208";a="310680667"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2022 04:02:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,365,1635231600"; 
   d="scan'208";a="586807566"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 13 Feb 2022 04:02:52 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJDae-0007Sn-AQ; Sun, 13 Feb 2022 12:02:52 +0000
Date: Sun, 13 Feb 2022 20:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: [linux-next:master 4586/5417] include/linux/fortify-string.h:336:4:
 error: call to __read_overflow2_field declared with 'warning' attribute:
 detected read beyond size of field (2nd parameter); maybe use
 struct_group()?
Message-ID: <202202132020.DM0CzXLY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6d9bd4ad4ca08b1114e814c2c42383b8b13be631
commit: e9ebe9d15a978c03dbf5a1d091399d77b893a0bd [4586/5417] fortify: Add Clang support
config: arm-randconfig-c002-20220213 (https://download.01.org/0day-ci/archive/20220213/202202132020.DM0CzXLY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 478c237e21b2c3a83e46f26fcbeb3876682f9b14)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e9ebe9d15a978c03dbf5a1d091399d77b893a0bd
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e9ebe9d15a978c03dbf5a1d091399d77b893a0bd
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/nfc/pn533/ drivers/scsi/libfc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/nfc/pn533/pn533.c:9:
   In file included from include/linux/device.h:15:
   In file included from include/linux/dev_printk.h:16:
   In file included from include/linux/ratelimit.h:6:
   In file included from include/linux/sched.h:14:
   In file included from include/linux/pid.h:5:
   In file included from include/linux/rculist.h:11:
   In file included from include/linux/rcupdate.h:29:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:11:
   In file included from include/linux/string.h:253:
>> include/linux/fortify-string.h:336:4: error: call to __read_overflow2_field declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
                           __read_overflow2_field(q_size_field, size);
                           ^
>> include/linux/fortify-string.h:336:4: error: call to __read_overflow2_field declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
   2 errors generated.
--
   In file included from drivers/scsi/libfc/fc_elsct.c:17:
   In file included from include/scsi/libfc.h:11:
   In file included from include/linux/timer.h:8:
   In file included from include/linux/debugobjects.h:6:
   In file included from include/linux/spinlock.h:62:
   In file included from include/linux/lockdep.h:14:
   In file included from include/linux/smp.h:13:
   In file included from include/linux/cpumask.h:12:
   In file included from include/linux/bitmap.h:11:
   In file included from include/linux/string.h:253:
>> include/linux/fortify-string.h:328:4: error: call to __write_overflow_field declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
                           __write_overflow_field(p_size_field, size);
                           ^
>> include/linux/fortify-string.h:328:4: error: call to __write_overflow_field declared with 'warning' attribute: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror,-Wattribute-warning]
   2 errors generated.


vim +/warning +336 include/linux/fortify-string.h

45e31710b1ca2b Kees Cook      2021-06-16  267  
45e31710b1ca2b Kees Cook      2021-06-16  268  /*
45e31710b1ca2b Kees Cook      2021-06-16  269   * __builtin_object_size() must be captured here to avoid evaluating argument
45e31710b1ca2b Kees Cook      2021-06-16  270   * side-effects further into the macro layers.
45e31710b1ca2b Kees Cook      2021-06-16  271   */
45e31710b1ca2b Kees Cook      2021-06-16  272  #define memset(p, c, s) __fortify_memset_chk(p, c, s,			\
45e31710b1ca2b Kees Cook      2021-06-16  273  		__builtin_object_size(p, 0), __builtin_object_size(p, 1))
a28a6e860c6cf2 Francis Laniel 2021-02-25  274  
9b106a9037d705 Kees Cook      2021-04-20  275  /*
9b106a9037d705 Kees Cook      2021-04-20  276   * To make sure the compiler can enforce protection against buffer overflows,
9b106a9037d705 Kees Cook      2021-04-20  277   * memcpy(), memmove(), and memset() must not be used beyond individual
9b106a9037d705 Kees Cook      2021-04-20  278   * struct members. If you need to copy across multiple members, please use
9b106a9037d705 Kees Cook      2021-04-20  279   * struct_group() to create a named mirror of an anonymous struct union.
9b106a9037d705 Kees Cook      2021-04-20  280   * (e.g. see struct sk_buff.) Read overflow checking is currently only
9b106a9037d705 Kees Cook      2021-04-20  281   * done when a write overflow is also present, or when building with W=1.
9b106a9037d705 Kees Cook      2021-04-20  282   *
9b106a9037d705 Kees Cook      2021-04-20  283   * Mitigation coverage matrix
9b106a9037d705 Kees Cook      2021-04-20  284   *					Bounds checking at:
9b106a9037d705 Kees Cook      2021-04-20  285   *					+-------+-------+-------+-------+
9b106a9037d705 Kees Cook      2021-04-20  286   *					| Compile time  |   Run time    |
9b106a9037d705 Kees Cook      2021-04-20  287   * memcpy() argument sizes:		| write | read  | write | read  |
9b106a9037d705 Kees Cook      2021-04-20  288   *        dest     source   length      +-------+-------+-------+-------+
9b106a9037d705 Kees Cook      2021-04-20  289   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
9b106a9037d705 Kees Cook      2021-04-20  290   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
9b106a9037d705 Kees Cook      2021-04-20  291   * memcpy(known,   known,   dynamic)	|   n   |   n   |   B   |   B   |
9b106a9037d705 Kees Cook      2021-04-20  292   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   B   |   V   |
9b106a9037d705 Kees Cook      2021-04-20  293   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
9b106a9037d705 Kees Cook      2021-04-20  294   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
9b106a9037d705 Kees Cook      2021-04-20  295   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
9b106a9037d705 Kees Cook      2021-04-20  296   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
9b106a9037d705 Kees Cook      2021-04-20  297   *					+-------+-------+-------+-------+
9b106a9037d705 Kees Cook      2021-04-20  298   *
9b106a9037d705 Kees Cook      2021-04-20  299   * y = perform deterministic compile-time bounds checking
9b106a9037d705 Kees Cook      2021-04-20  300   * n = cannot perform deterministic compile-time bounds checking
9b106a9037d705 Kees Cook      2021-04-20  301   * n/a = no run-time bounds checking needed since compile-time deterministic
9b106a9037d705 Kees Cook      2021-04-20  302   * B = can perform run-time bounds checking (currently unimplemented)
9b106a9037d705 Kees Cook      2021-04-20  303   * V = vulnerable to run-time overflow (will need refactoring to solve)
9b106a9037d705 Kees Cook      2021-04-20  304   *
9b106a9037d705 Kees Cook      2021-04-20  305   */
9b106a9037d705 Kees Cook      2021-04-20  306  __FORTIFY_INLINE void fortify_memcpy_chk(__kernel_size_t size,
9b106a9037d705 Kees Cook      2021-04-20  307  					 const size_t p_size,
9b106a9037d705 Kees Cook      2021-04-20  308  					 const size_t q_size,
9b106a9037d705 Kees Cook      2021-04-20  309  					 const size_t p_size_field,
9b106a9037d705 Kees Cook      2021-04-20  310  					 const size_t q_size_field,
9b106a9037d705 Kees Cook      2021-04-20  311  					 const char *func)
a28a6e860c6cf2 Francis Laniel 2021-02-25  312  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  313  	if (__builtin_constant_p(size)) {
9b106a9037d705 Kees Cook      2021-04-20  314  		/*
9b106a9037d705 Kees Cook      2021-04-20  315  		 * Length argument is a constant expression, so we
9b106a9037d705 Kees Cook      2021-04-20  316  		 * can perform compile-time bounds checking where
9b106a9037d705 Kees Cook      2021-04-20  317  		 * buffer sizes are known.
9b106a9037d705 Kees Cook      2021-04-20  318  		 */
9b106a9037d705 Kees Cook      2021-04-20  319  
9b106a9037d705 Kees Cook      2021-04-20  320  		/* Error when size is larger than enclosing struct. */
9b106a9037d705 Kees Cook      2021-04-20  321  		if (p_size > p_size_field && p_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  322  			__write_overflow();
9b106a9037d705 Kees Cook      2021-04-20  323  		if (q_size > q_size_field && q_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  324  			__read_overflow2();
9b106a9037d705 Kees Cook      2021-04-20  325  
9b106a9037d705 Kees Cook      2021-04-20  326  		/* Warn when write size argument larger than dest field. */
9b106a9037d705 Kees Cook      2021-04-20  327  		if (p_size_field < size)
9b106a9037d705 Kees Cook      2021-04-20 @328  			__write_overflow_field(p_size_field, size);
9b106a9037d705 Kees Cook      2021-04-20  329  		/*
9b106a9037d705 Kees Cook      2021-04-20  330  		 * Warn for source field over-read when building with W=1
9b106a9037d705 Kees Cook      2021-04-20  331  		 * or when an over-write happened, so both can be fixed at
9b106a9037d705 Kees Cook      2021-04-20  332  		 * the same time.
9b106a9037d705 Kees Cook      2021-04-20  333  		 */
9b106a9037d705 Kees Cook      2021-04-20  334  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) || p_size_field < size) &&
9b106a9037d705 Kees Cook      2021-04-20  335  		    q_size_field < size)
9b106a9037d705 Kees Cook      2021-04-20 @336  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  337  	}
9b106a9037d705 Kees Cook      2021-04-20  338  	/*
9b106a9037d705 Kees Cook      2021-04-20  339  	 * At this point, length argument may not be a constant expression,
9b106a9037d705 Kees Cook      2021-04-20  340  	 * so run-time bounds checking can be done where buffer sizes are
9b106a9037d705 Kees Cook      2021-04-20  341  	 * known. (This is not an "else" because the above checks may only
9b106a9037d705 Kees Cook      2021-04-20  342  	 * be compile-time warnings, and we want to still warn for run-time
9b106a9037d705 Kees Cook      2021-04-20  343  	 * overflows.)
9b106a9037d705 Kees Cook      2021-04-20  344  	 */
9b106a9037d705 Kees Cook      2021-04-20  345  
9b106a9037d705 Kees Cook      2021-04-20  346  	/*
9b106a9037d705 Kees Cook      2021-04-20  347  	 * Always stop accesses beyond the struct that contains the
9b106a9037d705 Kees Cook      2021-04-20  348  	 * field, when the buffer's remaining size is known.
9b106a9037d705 Kees Cook      2021-04-20  349  	 * (The -1 test is to optimize away checks where the buffer
9b106a9037d705 Kees Cook      2021-04-20  350  	 * lengths are unknown.)
9b106a9037d705 Kees Cook      2021-04-20  351  	 */
9b106a9037d705 Kees Cook      2021-04-20  352  	if ((p_size != (size_t)(-1) && p_size < size) ||
9b106a9037d705 Kees Cook      2021-04-20  353  	    (q_size != (size_t)(-1) && q_size < size))
9b106a9037d705 Kees Cook      2021-04-20  354  		fortify_panic(func);
a28a6e860c6cf2 Francis Laniel 2021-02-25  355  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  356  

:::::: The code at line 336 was first introduced by commit
:::::: 9b106a9037d705d0c5cbc747b6fed7cbb33b0e00 fortify: Detect struct member overflows in memcpy() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
