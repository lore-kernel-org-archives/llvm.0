Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603B07F;
	Sat, 22 Apr 2023 06:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682144504; x=1713680504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ip++V1eGFm2A5b4QNmaZXK0QYq6XNTUM8fn8nWt34wQ=;
  b=BDAaL4n8NNrq017BNn917AW7aIG3jc1HV/5jTJDoU4aPeUx+trcmkHrS
   RhNj7ZWmXyatMaqlLshsADATAluwS12CxQBR5gFzG4Tiuo7Ns6gMpMGG2
   nz3R4l5Gt91eZ3k0+h0OF6vAyYrvpUz+iq1DQx4niq1JpZKjnurMTgPaS
   5C/rhkd2AnwgIVwBMh5tYHvCoDJCH8hgtEhAeVaAV5sKpkqkKpEZMFUmx
   Iv2x115ypUtcDSb+twRud9PzxKLOsDkkb9fOyQMi8H0zD/mtyVDBI/Bhp
   bnCZx/cmuSZlJi+U+rBGkoyBOxMN067WpVesLKql0NeSUXEYp0b3MmpJK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="348931376"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="348931376"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 23:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="866911093"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="866911093"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 21 Apr 2023 23:21:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq6cq-000h7e-2K;
	Sat, 22 Apr 2023 06:21:36 +0000
Date: Sat, 22 Apr 2023 14:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [stable:linux-4.19.y 5696/5797] ld.lld: error:
 drivers/usb/chipidea/debug.o: contains a compressed section, but zlib is not
 available
Message-ID: <202304221429.SuEfL73V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   a5b79a58cfc02977cd4d5c1e20454cd98e88f749
commit: 0752a5caecf47d008d1def0bcaf22d30984bb414 [5696/5797] usb: chipidea: core: fix possible concurrent when switch role
config: x86_64-randconfig-a012-20230417 (https://download.01.org/0day-ci/archive/20230422/202304221429.SuEfL73V-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=0752a5caecf47d008d1def0bcaf22d30984bb414
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 0752a5caecf47d008d1def0bcaf22d30984bb414
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/usb/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221429.SuEfL73V-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: drivers/usb/chipidea/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/core.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/otg.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/otg.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/otg.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/otg.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/otg.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/otg.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/otg.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/otg.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/usb/chipidea/otg.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/usb/chipidea/debug.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
