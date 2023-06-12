Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A4A17AB7;
	Mon, 12 Jun 2023 17:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686590879; x=1718126879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wr26ymbSaqmp1BGBK1IL633YfgYmRWMNHjHSpJko55M=;
  b=bfqfDw+ASkjzDiUx28XtCUg6/EMM43eo0PX7CrxmMQX292P2d3xt2Jlm
   gEXcIfeDUMVIID1EQ6ck3JP6BUxEUar6mJS/Wblm3m+XzewDvG4LcJZx3
   T/zWv4hnAEYBz6oyATHotKX5VRWA90uhj8Mqve4p8XSGIPrV/kKPcxAnn
   yHaRiOT4Val+sUVlG9gvj9yuZQtEnkx9ckODmGAURHLtFdBOMudbpIYHg
   AV51hr+9xi8Us1faKS3FXr6Oxf7SnXSWVtft7gL3f5aA7//Z1azIhfpec
   nV4ab+D/cUL0o/fjQ2adxpHBo9J5Bj/JAXEDvFRPC1eoI1KrfHiIDlBTM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="356997110"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="356997110"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 10:27:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="824050854"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="824050854"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 12 Jun 2023 10:27:50 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8lKY-0000VM-2A;
	Mon, 12 Jun 2023 17:27:50 +0000
Date: Tue, 13 Jun 2023 01:27:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Maxime Ripard <maxime@cerno.tech>
Subject: [linux-next:master 4218/8413] lib/kunit/test.c:764:38: warning: cast
 from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)')
 converts to incompatible function type
Message-ID: <202306130136.ZO9p5nTK-lkp@intel.com>
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
commit: 57e3cded99e9c840bc5310878d0a7f4e7768a296 [4218/8413] kunit: kmalloc_array: Use kunit_add_action()
config: hexagon-randconfig-r045-20230612 (https://download.01.org/0day-ci/archive/20230613/202306130136.ZO9p5nTK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=57e3cded99e9c840bc5310878d0a7f4e7768a296
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 57e3cded99e9c840bc5310878d0a7f4e7768a296
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/kunit/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130136.ZO9p5nTK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/kunit/test.c:764:38: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
     764 |         if (kunit_add_action_or_reset(test, (kunit_action_t *)kfree, data) != 0)
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/test.c:776:29: warning: cast from 'void (*)(const void *)' to 'kunit_action_t *' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]
     776 |         kunit_release_action(test, (kunit_action_t *)kfree, (void *)ptr);
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +764 lib/kunit/test.c

   754	
   755	void *kunit_kmalloc_array(struct kunit *test, size_t n, size_t size, gfp_t gfp)
   756	{
   757		void *data;
   758	
   759		data = kmalloc_array(n, size, gfp);
   760	
   761		if (!data)
   762			return NULL;
   763	
 > 764		if (kunit_add_action_or_reset(test, (kunit_action_t *)kfree, data) != 0)
   765			return NULL;
   766	
   767		return data;
   768	}
   769	EXPORT_SYMBOL_GPL(kunit_kmalloc_array);
   770	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
