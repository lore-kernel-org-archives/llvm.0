Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A5715B8;
	Tue, 18 Apr 2023 03:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681788321; x=1713324321;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Da/7OObouVCAsPM/qB21fVUMQTn+NhnmRiEz30cKMwA=;
  b=AHDxPxfjMW7u5i882xj4W0Zh6JG/hIV6l9sKbs/cVKhlkS8gRLtrvAaZ
   +qnWaqcqidgV3e1GnEPBWwaqCvKf2H1+TiMwFsMObfKT8oHVzss7Ocmiq
   fNVnheWK5Dj99ru5DAd41kmB5oig6pPj9vgDVFsdBOgOpjRaKLmVHCDvM
   c0Uh6u1EVjrfT+3K8HvLbBOok/+it0UOxGhpQ1ZH7FSBcifT8sW94uPjc
   cGgdwXoQ9/7Vm9sLr/ePx9ZaDBYPwXHqW9rgU9UBIKfodlGk2h6TPDpnT
   QAjferAtlV09qotiGTzBBgVLXkE/KDpE/4BGSvBcMpfgcK146yNccXpX2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="345062341"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="345062341"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 20:25:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="684405061"
X-IronPort-AV: E=Sophos;i="5.99,206,1677571200"; 
   d="scan'208";a="684405061"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 Apr 2023 20:25:17 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poby0-000cuZ-1e;
	Tue, 18 Apr 2023 03:25:16 +0000
Date: Tue, 18 Apr 2023 11:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] f2fs: remove power-of-two limitation fo zoned device
Message-ID: <202304181150.stMAx7pw-lkp@intel.com>
References: <20230418004049.3262659-1-jaegeuk@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418004049.3262659-1-jaegeuk@kernel.org>

Hi Jaegeuk,

kernel test robot noticed the following build errors:

[auto build test ERROR on jaegeuk-f2fs/dev-test]
[also build test ERROR on jaegeuk-f2fs/dev next-20230417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jaegeuk-Kim/f2fs-remove-power-of-two-limitation-fo-zoned-device/20230418-084241
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20230418004049.3262659-1-jaegeuk%40kernel.org
patch subject: [PATCH] f2fs: remove power-of-two limitation fo zoned device
config: arm-randconfig-r022-20230416 (https://download.01.org/0day-ci/archive/20230418/202304181150.stMAx7pw-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 9638da200e00bd069e6dd63604e14cbafede9324)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/50158b3d258eb40eb81f3460d91c71126c08cdb8
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jaegeuk-Kim/f2fs-remove-power-of-two-limitation-fo-zoned-device/20230418-084241
        git checkout 50158b3d258eb40eb81f3460d91c71126c08cdb8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304181150.stMAx7pw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __aeabi_ldivmod
   >>> referenced by gc.c:2097 (fs/f2fs/gc.c:2097)
   >>>               fs/f2fs/gc.o:(update_fs_metadata) in archive vmlinux.a
   >>> did you mean: __aeabi_idivmod
   >>> defined in: arch/arm/lib/lib.a(lib1funcs.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
