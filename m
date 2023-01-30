Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6AF2560;
	Mon, 30 Jan 2023 13:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675086246; x=1706622246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RFFF1oMHCNWKpJ36tft+uuv1KABksRbxfGI1sA4RZ+E=;
  b=W/7YQoc5buCcER2FeTC40sxQPRhdRHTt6C5bHle+X+dhqH7PW6XKg/jy
   epqEaNulaBkJOxr0uiFaRkqqenyWjiyOGrFwD7yCmrlfA6xmCJLoFwHuZ
   DPn39jDDPAXh1M9kIfa5yYfe6OJaw302Z4SkIkGdoqOLYM9ZZ38c1IOD+
   AkRoAwXsiDjmgktPDQIr2bidHMd4gZbs/9LdcOiGr49A+/Vpdpy99YwRz
   /EzZ8IgouwjL95Ekil/UJcNw6UBNPIFaXEMKHcRRkgR8wzGl26I5kUxwz
   5pSUj6jEO65Q20MoRePmUldG9bdbMlkDyOxMNS95zpfZvyf8bes+sFlCK
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="328833615"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="328833615"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 05:44:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="664092421"
X-IronPort-AV: E=Sophos;i="5.97,258,1669104000"; 
   d="scan'208";a="664092421"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 05:44:04 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMUS3-0003eQ-1b;
	Mon, 30 Jan 2023 13:44:03 +0000
Date: Mon, 30 Jan 2023 21:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [madvenka786:orc_v3 19/22] ld.lld: error: assignment to symbol
 __init_end does not converge
Message-ID: <202301302140.hr5SXp0F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/madvenka786/linux orc_v3
head:   33c010545114392f0152f7e72cd33fb80561a68c
commit: 9474eebed6b146dab922696d894d33fc1c15a599 [19/22] arm64: unwinder: Add a reliability check in the unwinder based on ORC
config: arm64-randconfig-r011-20230129 (https://download.01.org/0day-ci/archive/20230130/202301302140.hr5SXp0F-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/madvenka786/linux/commit/9474eebed6b146dab922696d894d33fc1c15a599
        git remote add madvenka786 https://github.com/madvenka786/linux
        git fetch --no-tags madvenka786 orc_v3
        git checkout 9474eebed6b146dab922696d894d33fc1c15a599
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: assignment to symbol __init_end does not converge

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
