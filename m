Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF2D1C757;
	Mon, 12 Jun 2023 15:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686583850; x=1718119850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hsY7cdk3+yXxCH81fXMhYa8Wte/52CPyooEnklUk1oA=;
  b=kjUTK0RZs2TS96roXEsOI5Qflurpzz/p2xWCEwPeHMsKoxmw8Ru5FkMe
   4lDHhf35Yz58NIhPDFGF5vkeYnSiG2e0A0j7y5PpZ1gZUqBFGrQK7AhiY
   EJZcu52645oyViBc+j8fQA8GSuRi5tsiwf7AkEj142pas9d4avR/A84Jr
   UtzLaIOBFNnwsKKZ1M5magbgv39kheJ6zrxB7E8VLJIpXRLAR4EkPIHP1
   SxAIYNoUfenyVOfz8P+eIDPoX1BVrobLe0sZ8qiQ+gp/CYVVpjFCXfdGf
   pGwsFKikJ3WPb9PLH4lYYMvaLOpyzoyUx7L6p+Oese1J4t34aAO48UzUm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="360560512"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="360560512"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 08:30:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="741070982"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="741070982"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Jun 2023 08:30:30 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8jV0-0000Mi-0i;
	Mon, 12 Jun 2023 15:30:30 +0000
Date: Mon, 12 Jun 2023 23:29:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [linux-next:master 4217/8413] lib/kunit/executor_test.c:138:4:
 warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void
 (*)(void *)') converts to incompatible function type
Message-ID: <202306122325.N7YrihQV-lkp@intel.com>
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
commit: 00e63f8afcfc6bf93d75141c51d35e8a40e86363 [4217/8413] kunit: executor_test: Use kunit_add_action()
config: hexagon-randconfig-r045-20230612 (https://download.01.org/0day-ci/archive/20230612/202306122325.N7YrihQV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=00e63f8afcfc6bf93d75141c51d35e8a40e86363
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 00e63f8afcfc6bf93d75141c51d35e8a40e86363
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306122325.N7YrihQV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/kunit/executor.c:223:
>> lib/kunit/executor_test.c:138:4: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
     138 |                         (kunit_action_t *)kfree,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


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
