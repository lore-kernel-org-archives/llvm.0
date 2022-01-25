Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F0B173
	for <llvm@lists.linux.dev>; Tue, 25 Jan 2022 10:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643105558; x=1674641558;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v0SdaECwPDQ74nD/9rSwr8Aj3eUHXBLpZFp+WthGZZo=;
  b=AkG/u3ji3+I2gRHn+eAsC995pP5Ads37CKd1bjDkTU934IgzGcRIaEpF
   lkcJi5dDube1owX5SOhZGxr/xenBDqb4RZdVRL+HE2LLs+QXzNk+vLaqA
   c4/isFSRbXNOWzG967lgxVbmIKwIcYYI9vUgIsGFWgzg5slgDr7qrIbCN
   qr/i34W33vefVRycmbZo3RvqkDcwsIMzuk25hRiSiLQR9W8HV+OaYuaV8
   Q9DFihInsm3T4fDlP4GySi4q7kTgRaMZ9lNQv/K1YhU87CMWgS2uMRYr+
   3MsGVj66PszegG/pBCm+VJEa0ttTA1G83FQYymAcc++jXaERG0/Lgl5cb
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="270714685"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="270714685"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 02:12:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; 
   d="scan'208";a="673945873"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jan 2022 02:12:36 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCIoV-000Jiz-TC; Tue, 25 Jan 2022 10:12:35 +0000
Date: Tue, 25 Jan 2022 18:12:24 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [kees:for-next/memcpy 9/9] include/linux/fortify-string.h:324:4:
 warning: call to __read_overflow2_field declared with 'warning' attribute:
 detected read beyond size of field (2nd parameter); maybe use
 struct_group()?
Message-ID: <202201251831.4t5TPp18-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/memcpy
head:   6303361147fc8984dd259b54c189592cd0551ab6
commit: 6303361147fc8984dd259b54c189592cd0551ab6 [9/9] fortify: Work around Clang inlining bugs
config: arm-randconfig-c002-20220124 (https://download.01.org/0day-ci/archive/20220125/202201251831.4t5TPp18-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e128e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?id=6303361147fc8984dd259b54c189592cd0551ab6
        git remote add kees https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
        git fetch --no-tags kees for-next/memcpy
        git checkout 6303361147fc8984dd259b54c189592cd0551ab6
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/net/wireless/ath/ath9k/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath9k/xmit.c:17:
   In file included from include/linux/dma-mapping.h:6:
   In file included from include/linux/string.h:253:
>> include/linux/fortify-string.h:324:4: warning: call to __read_overflow2_field declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
                           __read_overflow2_field(q_size_field, size);
                           ^
>> include/linux/fortify-string.h:324:4: warning: call to __read_overflow2_field declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
   2 warnings generated.


vim +/warning +324 include/linux/fortify-string.h

6f6f253efa1346 Kees Cook      2021-06-16  255  
6f6f253efa1346 Kees Cook      2021-06-16  256  /*
6f6f253efa1346 Kees Cook      2021-06-16  257   * __builtin_object_size() must be captured here to avoid evaluating argument
6f6f253efa1346 Kees Cook      2021-06-16  258   * side-effects further into the macro layers.
6f6f253efa1346 Kees Cook      2021-06-16  259   */
6f6f253efa1346 Kees Cook      2021-06-16  260  #define memset(p, c, s) __fortify_memset_chk(p, c, s,			\
6f6f253efa1346 Kees Cook      2021-06-16  261  		__builtin_object_size(p, 0), __builtin_object_size(p, 1))
a28a6e860c6cf2 Francis Laniel 2021-02-25  262  
602670289b69b2 Kees Cook      2021-04-20  263  /*
602670289b69b2 Kees Cook      2021-04-20  264   * To make sure the compiler can enforce protection against buffer overflows,
602670289b69b2 Kees Cook      2021-04-20  265   * memcpy(), memmove(), and memset() must not be used beyond individual
602670289b69b2 Kees Cook      2021-04-20  266   * struct members. If you need to copy across multiple members, please use
602670289b69b2 Kees Cook      2021-04-20  267   * struct_group() to create a named mirror of an anonymous struct union.
602670289b69b2 Kees Cook      2021-04-20  268   * (e.g. see struct sk_buff.)
602670289b69b2 Kees Cook      2021-04-20  269   *
602670289b69b2 Kees Cook      2021-04-20  270   * Mitigation coverage
602670289b69b2 Kees Cook      2021-04-20  271   *					Bounds checking at:
602670289b69b2 Kees Cook      2021-04-20  272   *					+-------+-------+-------+-------+
602670289b69b2 Kees Cook      2021-04-20  273   *					| Compile time  | Run time      |
602670289b69b2 Kees Cook      2021-04-20  274   * memcpy() argument sizes:		| write | read  | write | read  |
602670289b69b2 Kees Cook      2021-04-20  275   *					+-------+-------+-------+-------+
602670289b69b2 Kees Cook      2021-04-20  276   * memcpy(known,   known,   constant)	|   y   |   y   |  n/a  |  n/a  |
602670289b69b2 Kees Cook      2021-04-20  277   * memcpy(unknown, known,   constant)	|   n   |   y   |   V   |  n/a  |
602670289b69b2 Kees Cook      2021-04-20  278   * memcpy(known,   unknown, constant)	|   y   |   n   |  n/a  |   V   |
602670289b69b2 Kees Cook      2021-04-20  279   * memcpy(unknown, unknown, constant)	|   n   |   n   |   V   |   V   |
602670289b69b2 Kees Cook      2021-04-20  280   * memcpy(known,   known,   dynamic)	|   n   |   n   |   b   |   B   |
602670289b69b2 Kees Cook      2021-04-20  281   * memcpy(unknown, known,   dynamic)	|   n   |   n   |   V   |   B   |
602670289b69b2 Kees Cook      2021-04-20  282   * memcpy(known,   unknown, dynamic)	|   n   |   n   |   b   |   V   |
602670289b69b2 Kees Cook      2021-04-20  283   * memcpy(unknown, unknown, dynamic)	|   n   |   n   |   V   |   V   |
602670289b69b2 Kees Cook      2021-04-20  284   *					+-------+-------+-------+-------+
602670289b69b2 Kees Cook      2021-04-20  285   *
602670289b69b2 Kees Cook      2021-04-20  286   * y = deterministic compile-time bounds checking
602670289b69b2 Kees Cook      2021-04-20  287   * n = cannot do deterministic compile-time bounds checking
602670289b69b2 Kees Cook      2021-04-20  288   * n/a = no run-time bounds checking needed since compile-time deterministic
602670289b69b2 Kees Cook      2021-04-20  289   * b = perform run-time bounds checking
602670289b69b2 Kees Cook      2021-04-20  290   * B = can perform run-time bounds checking, but current unenforced
602670289b69b2 Kees Cook      2021-04-20  291   * V = vulnerable to run-time overflow
602670289b69b2 Kees Cook      2021-04-20  292   *
602670289b69b2 Kees Cook      2021-04-20  293   */
602670289b69b2 Kees Cook      2021-04-20  294  __FORTIFY_INLINE void fortify_memcpy_chk(__kernel_size_t size,
602670289b69b2 Kees Cook      2021-04-20  295  					 const size_t p_size,
602670289b69b2 Kees Cook      2021-04-20  296  					 const size_t q_size,
602670289b69b2 Kees Cook      2021-04-20  297  					 const size_t p_size_field,
602670289b69b2 Kees Cook      2021-04-20  298  					 const size_t q_size_field,
602670289b69b2 Kees Cook      2021-04-20  299  					 const char *func)
a28a6e860c6cf2 Francis Laniel 2021-02-25  300  {
a28a6e860c6cf2 Francis Laniel 2021-02-25  301  	if (__builtin_constant_p(size)) {
602670289b69b2 Kees Cook      2021-04-20  302  		/*
602670289b69b2 Kees Cook      2021-04-20  303  		 * Length argument is a constant expression, so we
602670289b69b2 Kees Cook      2021-04-20  304  		 * can perform compile-time bounds checking where
602670289b69b2 Kees Cook      2021-04-20  305  		 * buffer sizes are known.
602670289b69b2 Kees Cook      2021-04-20  306  		 */
602670289b69b2 Kees Cook      2021-04-20  307  
602670289b69b2 Kees Cook      2021-04-20  308  		/* Error when size is larger than enclosing struct. */
602670289b69b2 Kees Cook      2021-04-20  309  		if (p_size > p_size_field && p_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  310  			__write_overflow();
602670289b69b2 Kees Cook      2021-04-20  311  		if (q_size > q_size_field && q_size < size)
a28a6e860c6cf2 Francis Laniel 2021-02-25  312  			__read_overflow2();
602670289b69b2 Kees Cook      2021-04-20  313  
602670289b69b2 Kees Cook      2021-04-20  314  		/* Warn when write size argument larger than dest field. */
602670289b69b2 Kees Cook      2021-04-20  315  		if (p_size_field < size)
602670289b69b2 Kees Cook      2021-04-20  316  			__write_overflow_field(p_size_field, size);
602670289b69b2 Kees Cook      2021-04-20  317  		/*
602670289b69b2 Kees Cook      2021-04-20  318  		 * Warn for source field over-read when building with W=1
602670289b69b2 Kees Cook      2021-04-20  319  		 * or when an over-write happened, so both can be fixed at
602670289b69b2 Kees Cook      2021-04-20  320  		 * the same time.
602670289b69b2 Kees Cook      2021-04-20  321  		 */
602670289b69b2 Kees Cook      2021-04-20  322  		if ((IS_ENABLED(KBUILD_EXTRA_WARN1) || p_size_field < size) &&
602670289b69b2 Kees Cook      2021-04-20  323  		    q_size_field < size)
602670289b69b2 Kees Cook      2021-04-20 @324  			__read_overflow2_field(q_size_field, size);
a28a6e860c6cf2 Francis Laniel 2021-02-25  325  	}
602670289b69b2 Kees Cook      2021-04-20  326  	/*
602670289b69b2 Kees Cook      2021-04-20  327  	 * At this point, length argument may not be a constant expression,
602670289b69b2 Kees Cook      2021-04-20  328  	 * so run-time bounds checking can be done where buffer sizes are
602670289b69b2 Kees Cook      2021-04-20  329  	 * known. (This is not an "else" because the above checks may only
602670289b69b2 Kees Cook      2021-04-20  330  	 * be compile-time warnings, and we want to still warn for run-time
602670289b69b2 Kees Cook      2021-04-20  331  	 * overflows.)
602670289b69b2 Kees Cook      2021-04-20  332  	 */
602670289b69b2 Kees Cook      2021-04-20  333  
602670289b69b2 Kees Cook      2021-04-20  334  	/*
602670289b69b2 Kees Cook      2021-04-20  335  	 * Always stop accesses beyond the struct that contains the
602670289b69b2 Kees Cook      2021-04-20  336  	 * field, when the buffer's remaining size is known.
602670289b69b2 Kees Cook      2021-04-20  337  	 * (The -1 test is to optimize away checks where the buffer
602670289b69b2 Kees Cook      2021-04-20  338  	 * lengths are unknown.)
602670289b69b2 Kees Cook      2021-04-20  339  	 */
602670289b69b2 Kees Cook      2021-04-20  340  	if ((p_size != (size_t)(-1) && p_size < size) ||
602670289b69b2 Kees Cook      2021-04-20  341  	    (q_size != (size_t)(-1) && q_size < size))
602670289b69b2 Kees Cook      2021-04-20  342  		fortify_panic(func);
a28a6e860c6cf2 Francis Laniel 2021-02-25  343  }
a28a6e860c6cf2 Francis Laniel 2021-02-25  344  

:::::: The code at line 324 was first introduced by commit
:::::: 602670289b69b2fded3a0b2240c4877e3a015ac6 fortify: Detect struct member overflows in memcpy() at compile-time

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
