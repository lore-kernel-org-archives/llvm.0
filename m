Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A404DA20;
	Wed, 22 Feb 2023 00:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677025373; x=1708561373;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WLxfUPNfxYrHSvas9MaWqJUxARmlLuLEB2nmCay016c=;
  b=RoS+8CcbiWpe3oL4mq+6zA2uMjkJjXNpR16E3fVV5pOLgXrpIFjtHBPe
   nRLcTnH4MTjoeJn91dkv6+6W849ICoeluw8Ssy00xMWOLXN2wwDJKY2kE
   VkIIgxxrIg3N4gtbede9OthNqLasQnIvHnJ1Pmqa2FTSQRxeSsndk58Z2
   Pa3UcG+PK/pfL0P7r5/ExR1O6ea7PeeZSP9uMebFx/hYHgi5SqO6j95Ht
   hd5b6bTfJCm+KZtx9zd7IgmVRej3aUT/GR2aGxrCAW3dgBWCaugKGx5aK
   AQX61y6NqesSm3wwnviqer1a5eU+5Vks3ijuBQWeRC3LZpz3PxAEFAd3N
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="331462634"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="331462634"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 16:22:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="702208173"
X-IronPort-AV: E=Sophos;i="5.97,317,1669104000"; 
   d="scan'208";a="702208173"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 21 Feb 2023 16:22:51 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUcuI-0000P7-1R;
	Wed, 22 Feb 2023 00:22:50 +0000
Date: Wed, 22 Feb 2023 08:22:47 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Maloszewski <michal.maloszewski@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Anirudh Venkataramanan <anirudh.venkataramanan@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>
Subject: [stable:linux-5.4.y 1621/7282] ld.lld: error:
 drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: contains a compressed
 section, but zlib is not available
Message-ID: <202302220849.jpUklWJU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.4.y
head:   59342376e8f0c704299dc7a2c14fed07ffb962e2
commit: ab1be91cf1ec6572eb8a9c093fd739625f1e3ed9 [1621/7282] iavf: Fix reporting when setting descriptor count
config: x86_64-randconfig-r011-20230220 (https://download.01.org/0day-ci/archive/20230222/202302220849.jpUklWJU-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=ab1be91cf1ec6572eb8a9c093fd739625f1e3ed9
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.4.y
        git checkout ab1be91cf1ec6572eb8a9c093fd739625f1e3ed9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302220849.jpUklWJU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_main.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_main.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_main.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_main.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_main.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_main.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_main.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_main.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_main.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_main.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_ethtool.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_ethtool.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_ethtool.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_ethtool.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_ethtool.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_ethtool.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_ethtool.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_ethtool.o: contains a compressed section, but zlib is not available
   ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_ethtool.o: contains a compressed section, but zlib is not available
>> ld.lld: error: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: contains a compressed section, but zlib is not available
   ld.lld: error: too many errors emitted, stopping now (use -error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
