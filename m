Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DD91E500C;
	Tue, 11 Feb 2025 20:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739306826; cv=none; b=aS6NekE8bvILk/9Thi/3+1MArlNGfi6WGJhWMDlpwWbc4jIH7z16udjXJZLR2ce6grAxKAkf8w+eXMtO8Fv5E/kdcMILpX5/fU5XkMfTOf/3ExHcFBpCHTFC8lg0/AG0yCP4t4ayVlx7SGqfye6PIMLWQgNG8SDtMkCnsqcX5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739306826; c=relaxed/simple;
	bh=hajb7/kAFvWtbpSLOvYBvYq5iwtnpNfBWtOggEzKnR8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MLmZs9Df3kHpZawVkU57ypqaPDCiq2j3T3Wef/oluslNVMMFjpq4bt2aqkMFDd+kfuR88qVAnuV5YdEWPhfRpy5cTRxzuQTBtNXU1LUBxaMjVj5pB62bhS8jrZ49wuRFOZDl4I0pgTg+dBW/lkrAhQFZtST/xMDVwmjS8R7mwaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEpSSRxW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEpSSRxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739306825; x=1770842825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hajb7/kAFvWtbpSLOvYBvYq5iwtnpNfBWtOggEzKnR8=;
  b=lEpSSRxWTToloNQSXwB2cUZkdjK8zK5sIa259CB5EYrvlhI3e9yGhQzv
   CbeQySNvYhCpLfF9k/+Yhw2ejf30nR7Y5ghe1rFFUrN36W57NyFRFFTss
   0r5UFcKEjYOdQ6bWSmuMlB6f/tpro+A+AGSwKsDdHm0O7Wybov25N+hYN
   oeIvNXZqeduOlPwltlb/b4o1UKqzqlN5aTR9DuU4MeHgxrGAOwMc5i/j8
   Kt0SdGYkvyxN5QY+B1oaafwCLeXhXSIWgtSHLpRV791T27auQgGvx0Scj
   BeIomdZydeDXKf3Xws7kafyHG/EQ+nsPgRQrVghlz62CnL58zDEDyU5m8
   Q==;
X-CSE-ConnectionGUID: cHnNNbPwTTyTN7sbpQZSvQ==
X-CSE-MsgGUID: t5Gum7W/Sua5ClkQtAimUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="43707784"
X-IronPort-AV: E=Sophos;i="6.13,278,1732608000"; 
   d="scan'208";a="43707784"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2025 12:47:04 -0800
X-CSE-ConnectionGUID: jyKGdlTSQSSr3bTyEfKMKg==
X-CSE-MsgGUID: CBFPLd0/SZu32R6HaqJHIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113511039"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Feb 2025 12:47:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thx9o-0014gh-0s;
	Tue, 11 Feb 2025 20:47:00 +0000
Date: Wed, 12 Feb 2025 04:46:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mel Gorman <mgorman@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kees Cook <kees@kernel.org>
Subject: [kees:for-next/hardening 3/4] include/linux/thread_info.h:224:26:
 error: expected parameter declarator
Message-ID: <202502120459.8eOCkWHn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
head:   b6518de35d6fbca63d88dbc7e5059924cc82afdb
commit: 3d22200404765145fbbe2a0b5189c0a8f83dab29 [3/4] mm: security: Check early if HARDENED_USERCOPY is enabled
config: hexagon-randconfig-002-20250212 (https://download.01.org/0day-ci/archive/20250212/202502120459.8eOCkWHn-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 6807164500e9920638e2ab0cdb4bf8321d24f8eb)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502120459.8eOCkWHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502120459.8eOCkWHn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
   In file included from ./arch/hexagon/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
>> include/linux/thread_info.h:224:26: error: expected parameter declarator
     224 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |                          ^
   ./include/generated/autoconf.h:3305:45: note: expanded from macro 'CONFIG_HARDENED_USERCOPY_DEFAULT_ON'
    3305 | #define CONFIG_HARDENED_USERCOPY_DEFAULT_ON 1
         |                                             ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:14:
   In file included from include/linux/sem.h:5:
   In file included from include/uapi/linux/sem.h:5:
   In file included from include/linux/ipc.h:7:
   In file included from include/linux/rhashtable-types.h:12:
   In file included from include/linux/alloc_tag.h:11:
   In file included from include/linux/preempt.h:79:
   In file included from ./arch/hexagon/include/generated/asm/preempt.h:1:
   In file included from include/asm-generic/preempt.h:5:
>> include/linux/thread_info.h:224:26: error: expected ')'
   ./include/generated/autoconf.h:3305:45: note: expanded from macro 'CONFIG_HARDENED_USERCOPY_DEFAULT_ON'
    3305 | #define CONFIG_HARDENED_USERCOPY_DEFAULT_ON 1
         |                                             ^
   include/linux/thread_info.h:224:25: note: to match this '('
     224 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |                         ^
>> include/linux/thread_info.h:224:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     224 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         | ^
         | int
>> include/linux/thread_info.h:224:25: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
     224 | DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |                         ^
     225 |                            validate_usercopy_range);
         |                                                   
         |                                                   void
>> include/linux/thread_info.h:231:6: error: call to undeclared function 'static_branch_maybe'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     231 |             static_branch_maybe(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
         |             ^
>> include/linux/thread_info.h:232:6: error: use of undeclared identifier 'validate_usercopy_range'
     232 |                                 &validate_usercopy_range)) {
         |                                  ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/hexagon/kernel/asm-offsets.c:12:
   In file included from include/linux/compat.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \


vim +224 include/linux/thread_info.h

   219	
   220	#ifdef CONFIG_HARDENED_USERCOPY
   221	extern void __check_object_size(const void *ptr, unsigned long n,
   222						bool to_user);
   223	
 > 224	DECLARE_STATIC_KEY_MAYBE(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
   225				   validate_usercopy_range);
   226	
   227	static __always_inline void check_object_size(const void *ptr, unsigned long n,
   228						      bool to_user)
   229	{
   230		if (!__builtin_constant_p(n) &&
 > 231		    static_branch_maybe(CONFIG_HARDENED_USERCOPY_DEFAULT_ON,
 > 232					&validate_usercopy_range)) {
   233			__check_object_size(ptr, n, to_user);
   234		}
   235	}
   236	#else
   237	static inline void check_object_size(const void *ptr, unsigned long n,
   238					     bool to_user)
   239	{ }
   240	#endif /* CONFIG_HARDENED_USERCOPY */
   241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
