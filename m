Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BDCA63B6;
	Mon, 27 Mar 2023 17:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679939542; x=1711475542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BmjrhcqgLJ3BooY8ptESHeneL3Cm5ZJwLHL8Jw0nAlw=;
  b=OLaZ8ldo9XaIft4vJFHIH4Wk1w76YPXhF7WvVbFk2+1Hy71V7yNYF5nz
   laNn6eg6gTJoNMykxSvBgqqPEsSVq68Z5B2eafHAreJOOm8nSLTiuG99z
   5W+Iak618IuuBXwn5v5s2mK792lFSxN0ffIDdTDSiRPwg2jpRHcqc08EZ
   X2QN477Xv7SrQh/QZzEimlvwkl+v9YdugYME+9wmkOczQBdb3jF+T8qeL
   VX+mpbLo/1i9zn8rlrB8dPbDupj2mEVp9F7KihsIemk3UFpNoYorr1VAt
   HOZ1MlsNesCccMlQW4LtLd4wuPrHteSIQMwYc0tHpxF/4WQkrWXGiNJdx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="328783632"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="328783632"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 10:52:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="677062104"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; 
   d="scan'208";a="677062104"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Mar 2023 10:52:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pgr12-000Hst-0A;
	Mon, 27 Mar 2023 17:52:20 +0000
Date: Tue, 28 Mar 2023 01:51:22 +0800
From: kernel test robot <lkp@intel.com>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-5.4.y 3529/7947] ld.lld: error: net/nfc/af_nfc.o:
 contains a compressed section, but zlib is not available
Message-ID: <202303280154.O0dnQV02-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Duoming,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   6849d8c4a61a93bb3abf2f65c84ec1ebfa9a9fb6
commit: 85aecdef77f9c5b5c0d8988db6681960f0d46ab3 [3529/7947] nfc: replace improper check device_is_registered() in netlink related functions
config: x86_64-randconfig-a016-20230327 (https://download.01.org/0day-ci/archive/20230328/202303280154.O0dnQV02-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=85aecdef77f9c5b5c0d8988db6681960f0d46ab3
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout 85aecdef77f9c5b5c0d8988db6681960f0d46ab3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303280154.O0dnQV02-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
   ld.lld: error: net/nfc/netlink.o: contains a compressed section, but zlib is not available
>> ld.lld: error: net/nfc/af_nfc.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
