Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A6639FDC;
	Wed,  6 Dec 2023 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bm1qRo/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701869323; x=1733405323;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=heRP5XOWXfTCte61m2JqTwM7NejPYsMOyDFl96ZxBlE=;
  b=bm1qRo/yTUVlABeBL5Sb9tAyNYYnA/RuslITnfl4xuCPGzBdWnf5F7cN
   O1qIyTpHLsZihpWhyEJCYelz3FKlkmmp2MNrbhL3XUG+cqHEUvZfVf4Yh
   wJ7O+c6eLgF+aH/SZvEAgyfbd65r8o2Xmx/2SoZ/ak9ngATY/MVNrcBC+
   yRcii2DV1bcg6ny6i5pYsqMaKBWEcJIn0c8Ql32bX4UGu6GUVHesctfnT
   U5FSaPXbU8eQyjju6dsojiQbpcJop0+CP7e2Y1S7mqhNNj3hUNr81v68q
   4SIq/nFGbTPpCBccItT+TuU5z2TaggCam7k6gu3wN937mOqSJ50CDmvG6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="900388"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="900388"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 05:28:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="775007511"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="775007511"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 06 Dec 2023 05:28:38 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rArx6-000Apw-2j;
	Wed, 06 Dec 2023 13:28:36 +0000
Date: Wed, 6 Dec 2023 21:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	Kees Cook <keescook@chromium.org>, Petr Mladek <pmladek@suse.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marco Elver <elver@google.com>
Subject: Re: [PATCH v2] lib: test_bitops: add compile-time
 optimization/evaluations assertions
Message-ID: <202312062158.60c1e6yt-lkp@intel.com>
References: <20231130102717.1297492-1-mailhol.vincent@wanadoo.fr>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130102717.1297492-1-mailhol.vincent@wanadoo.fr>

Hi Vincent,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on linus/master v6.7-rc4 next-20231206]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vincent-Mailhol/lib-test_bitops-add-compile-time-optimization-evaluations-assertions/20231130-182837
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231130102717.1297492-1-mailhol.vincent%40wanadoo.fr
patch subject: [PATCH v2] lib: test_bitops: add compile-time optimization/evaluations assertions
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20231206/202312062158.60c1e6yt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312062158.60c1e6yt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062158.60c1e6yt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_bitops.c:74:2: error: call to '__compiletime_assert_178' declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(__test_expr)
      74 |         test_const_eval(__ffs(BIT(n)) == n);
         |         ^
   lib/test_bitops.c:59:2: note: expanded from macro 'test_const_eval'
      59 |         BUILD_BUG_ON(!__builtin_constant_p(__test_expr));       \
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:423:2: note: expanded from macro '_compiletime_assert'
     423 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:416:4: note: expanded from macro '__compiletime_assert'
     416 |                         prefix ## suffix();                             \
         |                         ^
   <scratch space>:18:1: note: expanded from here
      18 | __compiletime_assert_178
         | ^
   1 error generated.


vim +74 lib/test_bitops.c

    62	
    63	static void test_bitops_const_eval(void)
    64	{
    65		/*
    66		 * On any supported optimization level (-O2, -Os) and if
    67		 * invoked with a compile-time constant argument, the compiler
    68		 * must be able to fold into a constant expression all the bit
    69		 * find functions. Namely: __ffs(), ffs(), ffz(), __fls(),
    70		 * fls() and fls64(). Otherwise, trigger a build bug.
    71		 */
    72		const int n = 10;
    73	
  > 74		test_const_eval(__ffs(BIT(n)) == n);
    75		test_const_eval(ffs(BIT(n)) == n + 1);
    76		test_const_eval(ffz(~BIT(n)) == n);
    77		test_const_eval(__fls(BIT(n)) == n);
    78		test_const_eval(fls(BIT(n)) == n + 1);
    79		test_const_eval(fls64(BIT_ULL(n)) == n + 1);
    80	}
    81	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
