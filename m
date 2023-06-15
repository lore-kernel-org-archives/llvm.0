Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5F320E0;
	Thu, 15 Jun 2023 11:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686828169; x=1718364169;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=116F3/yC9e2Y/2nrti3FoTM8GkLnOVOOFoERu342pTk=;
  b=RdtncISh6vK3wv2lL3aykrh4Hn6tjFlYOPv6L1in/0cmA5MQP1jnXFKC
   UOQbkUrQVHO0W1vY8n3cCjA3y/1JSjJq8LVb1QJz93jND31I8yHx+6L4Q
   /t9v2OKwpYR5ethezs02e9SFs0d9KghHX4CR8FXR4dIy6RZCqD2c6luYK
   6Zi95giN9TipW0eDt+spMrYBOB+ILRBQgIoSXHMnWmCPL2/1Nqw/b+gZw
   Fp/Qe3Sc78MLNwe4i0YuBEt+Ivm85ByfdVBeKLb3mpsm6TJDVdzVHfMOc
   XKP0VnCHUYmR6F04MsIGhwXaYl+I4/0HouaIRx91ccaQapLrEEiHApPZ4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="358875418"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="358875418"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 04:22:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="802300149"
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="scan'208";a="802300149"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2023 04:22:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1q9l3t-003vZ9-2r;
	Thu, 15 Jun 2023 14:22:45 +0300
Date: Thu, 15 Jun 2023 14:22:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <lkp@intel.com>
Cc: Alexander Lobakin <alexandr.lobakin@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>
Subject: Re: lib/test_bitmap.c:920:2: error: call to
 '__compiletime_assert_239' declared with 'error' attribute: BUILD_BUG_ON
 failed: !__builtin_constant_p(res)
Message-ID: <ZIr0hZV/jcpZkRq2@smile.fi.intel.com>
References: <202306151433.QKcn7ZNn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202306151433.QKcn7ZNn-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 15, 2023 at 02:32:02PM +0800, kernel test robot wrote:
> Hi Alexander,
> 
> FYI, the error/warning still remains.
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   b6dad5178ceaf23f369c3711062ce1f2afc33644
> commit: dc34d5036692c614eef23c1130ee42a201c316bf lib: test_bitmap: add compile-time optimization/evaluations assertions
> date:   12 months ago
> config: arm64-randconfig-r025-20230615 (https://download.01.org/0day-ci/archive/20230615/202306151433.QKcn7ZNn-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce (this is a W=1 build):
>         mkdir -p ~/bin
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install arm64 cross compiling tool for clang build
>         # apt-get install binutils-aarch64-linux-gnu
>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dc34d5036692c614eef23c1130ee42a201c316bf
>         git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>         git fetch --no-tags linus master
>         git checkout dc34d5036692c614eef23c1130ee42a201c316bf
>         # save the config file
>         mkdir build_dir && cp config build_dir/.config
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash lib/
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306151433.QKcn7ZNn-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):

>    888		/*
>    889		 * Equals to `unsigned long bitmap[1] = { GENMASK(6, 5), }`.
>    890		 * Clang on s390 optimizes bitops at compile-time as intended, but at
>    891		 * the same time stops treating @bitmap and @bitopvar as compile-time
>    892		 * constants after regular test_bit() is executed, thus triggering the
>    893		 * build bugs below. So, call const_test_bit() there directly until
>    894		 * the compiler is fixed.
>    895		 */
>    896		bitmap_clear(bitmap, 0, BITS_PER_LONG);
>    897	#if defined(__s390__) && defined(__clang__)
>    898		if (!const_test_bit(7, bitmap))
>    899	#else
>    900		if (!test_bit(7, bitmap))
>    901	#endif

Hmm... Reveals the bug in clang/arm64?

>    919		res = !test_bit(18, &bitopvar);
>  > 920		BUILD_BUG_ON(!__builtin_constant_p(res));
>    921		BUILD_BUG_ON(!res);


-- 
With Best Regards,
Andy Shevchenko


