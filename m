Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157CF2C82
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 12:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643199356; x=1674735356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=26ItzPYPQ3Duqca6mkSSB2OFe6OwHmU+4+XxL8bpWiQ=;
  b=RkKNIJfer7eFxq1JEzHRUo0h+P0VOflfx53eL0rKlFqrPIU4YsYu16VZ
   yOitzBxImpd55+eLIV/4Yfq3rtH2fJUt6ZRawlsp0zDLiF4LeGSzwL6HB
   OttYIuDre2nMMVsh21rlK1KVUr5E76h0kJJU913hUq8wUqiRpTuwZvh/K
   u+t0h5tL1D71FJunr27rbf61Y1BOHwaWrRVVCMWQLjlv/lorz8y418EiX
   kwdTEsuJhR/s4SQ1a9We09/VPLT9Gad/p+HVumzZ+PHf+cfjpBkKqiGZl
   5UAG0SgKtZa9EHdOp6z0btDSxsBGO8riGNqUn3Wp7iySfbuULgzRFDPfy
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="245370324"
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="245370324"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 04:15:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,318,1635231600"; 
   d="scan'208";a="628288074"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 26 Jan 2022 04:15:53 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nChDM-000LAe-IV; Wed, 26 Jan 2022 12:15:52 +0000
Date: Wed, 26 Jan 2022 20:15:04 +0800
From: kernel test robot <lkp@intel.com>
To: Stephan =?iso-8859-1?Q?M=FCller?= <smueller@chronox.de>,
	herbert@gondor.apana.org.au
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-crypto@vger.kernel.org, simo@redhat.com,
	Nicolai Stange <nstange@suse.de>
Subject: Re: [PATCH 1/7] crypto: DRBG - remove internal reseeding operation
Message-ID: <202201262050.xFgnR1Kx-lkp@intel.com>
References: <2450379.h6RI2rZIcs@positron.chronox.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2450379.h6RI2rZIcs@positron.chronox.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Stephan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on herbert-cryptodev-2.6/master]
[also build test ERROR on herbert-crypto-2.6/master linus/master v5.17-rc1 next-20220125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Stephan-M-ller/Common-entropy-source-and-DRNG-management/20220126-150911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
config: hexagon-buildonly-randconfig-r003-20220124 (https://download.01.org/0day-ci/archive/20220126/202201262050.xFgnR1Kx-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/14ec08bbd20e04299353eb31a9d43d4ac9af2b22
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Stephan-M-ller/Common-entropy-source-and-DRNG-management/20220126-150911
        git checkout 14ec08bbd20e04299353eb31a9d43d4ac9af2b22
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   crypto/drbg.c:204:30: warning: unused function 'drbg_sec_strength' [-Wunused-function]
   static inline unsigned short drbg_sec_strength(drbg_flag_t flags)
                                ^
>> crypto/drbg.c:1742:2: error: call to __compiletime_assert_223 declared with 'error' attribute: BUILD_BUG_ON failed: ARRAY_SIZE(drbg_cores) != ARRAY_SIZE(drbg_algs)
           BUILD_BUG_ON(ARRAY_SIZE(drbg_cores) != ARRAY_SIZE(drbg_algs));
           ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
           BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:335:2: note: expanded from macro 'compiletime_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
           ^
   include/linux/compiler_types.h:323:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:316:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:63:1: note: expanded from here
   __compiletime_assert_223
   ^
   1 warning and 1 error generated.


vim +/error +1742 crypto/drbg.c

  1732	
  1733	static int __init drbg_init(void)
  1734	{
  1735		unsigned int i;
  1736		int ret;
  1737	
  1738		ret = drbg_healthcheck_sanity();
  1739		if (ret)
  1740			return ret;
  1741	
> 1742		BUILD_BUG_ON(ARRAY_SIZE(drbg_cores) != ARRAY_SIZE(drbg_algs));
  1743	
  1744		/*
  1745		 * As the order of placing them into the drbg_algs array matters
  1746		 * (the later DRBGs receive a higher cra_priority) we register the
  1747		 * prediction resistance DRBGs first as the should not be too
  1748		 * interesting.
  1749		 */
  1750		for (i = 0; i < ARRAY_SIZE(drbg_cores); i++)
  1751			drbg_fill_array(&drbg_algs[i], &drbg_cores[i]);
  1752		return crypto_register_rngs(drbg_algs, ARRAY_SIZE(drbg_cores));
  1753	}
  1754	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
