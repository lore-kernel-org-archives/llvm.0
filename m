Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C56D6FDF;
	Wed,  7 Jun 2023 07:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686124792; x=1717660792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NoFlxkcl6dsp02PL0p/mMZMu+Iej+IaPNUmMCwXnMpg=;
  b=jCifeWKrinyD7RWVsKg71APBrTRbKK9rHA6u7DS2KV1afffY+sDdp/tE
   RN8TBAnR+lcUyQ4yS8gYH5kpjUvHfHRYvCY/o5lvpi8bJPXeynKxOh+t9
   hqnCAUAS0NxLzMtLyw62OL9qjruemDgtdFTMf3uX8WLRulnJrrzF+nmsz
   5dhWV7214RfV7+xBblCCcbvwbPZ5nfF82hl1UecUsL6VDrYqlWYjAJwyv
   Hgz2VQiqZYDM6n4gGqb03CtzjwHkhsNdp8w0Z3ZlioWfESwQMcCpBon4N
   X5ZgWrHHcBQGOw9cspMjeJIoyehU4cpTn2fxUHbtgSX+NawEUJLGindSe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="360244761"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="360244761"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 00:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="799200418"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; 
   d="scan'208";a="799200418"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jun 2023 00:59:49 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6o56-0006Lv-30;
	Wed, 07 Jun 2023 07:59:48 +0000
Date: Wed, 7 Jun 2023 15:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [linux-next:master 4264/7747] lib/kunit/executor_test.c:138:4:
 error: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void
 (*)(void *)') converts to incompatible function type
Message-ID: <202306071513.vCmugxAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abbd8bb42915d9ed06df11b430bf4ecb3d8ac5ad
commit: 00e63f8afcfc6bf93d75141c51d35e8a40e86363 [4264/7747] kunit: executor_test: Use kunit_add_action()
config: riscv-randconfig-r032-20230607 (https://download.01.org/0day-ci/archive/20230607/202306071513.vCmugxAi-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=00e63f8afcfc6bf93d75141c51d35e8a40e86363
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 00e63f8afcfc6bf93d75141c51d35e8a40e86363
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306071513.vCmugxAi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/kunit/executor.c:223:
>> lib/kunit/executor_test.c:138:4: error: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Werror,-Wcast-function-type-strict]
                           (kunit_action_t *)kfree,
                           ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +138 lib/kunit/executor_test.c

   127	
   128	/* Use the resource API to register a call to kfree(to_free).
   129	 * Since we never actually use the resource, it's safe to use on const data.
   130	 */
   131	static void kfree_at_end(struct kunit *test, const void *to_free)
   132	{
   133		/* kfree() handles NULL already, but avoid allocating a no-op cleanup. */
   134		if (IS_ERR_OR_NULL(to_free))
   135			return;
   136	
   137		kunit_add_action(test,
 > 138				(kunit_action_t *)kfree,
   139				(void *)to_free);
   140	}
   141	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
