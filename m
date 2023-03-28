Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B3F187D;
	Tue, 28 Mar 2023 09:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679997181; x=1711533181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VvHKiHHujPzUVMa/FQVQBnvsf4z6UCE3bQfOnP4K5Cc=;
  b=aYbAFNEDrB74ssHAUBeVXfD/1cbBowDtc9OWNKTBil09qH8CEJpQIhw2
   kPyHkb9uaaEZxDW4g9A7MggFWUCYy3fkbjdY4edGo+OXey2MS7sQmHRoR
   c2cN5BUdTN799O1Nybcb7yAVAGdWCSAK8L+4LhbAeIiLXiI//oKG+JDxL
   04xtfS88bYd85QFbe3SQTdOpXJ5ff1idSWGfBZAij/wJehJSp58CiN/YW
   LIZIeprQh6LyRUEIqHub1ddkVLKTAzxJsEJ2cXPLzyXopT4xl8aHgCtVC
   3kLmCfjtn1CU1qhtp7g+5QnkOkpYPHrT2uMMXwXPfBPz91YcMmB0z4Ega
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="324418181"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="324418181"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 02:53:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="1013494720"
X-IronPort-AV: E=Sophos;i="5.98,297,1673942400"; 
   d="scan'208";a="1013494720"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Mar 2023 02:53:00 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph60h-000IRn-0b;
	Tue, 28 Mar 2023 09:52:59 +0000
Date: Tue, 28 Mar 2023 17:52:53 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:gpu/rust-wip 6/13] mm/shmem.c:96:8: warning: 'const'
 type qualifier on return type has no effect
Message-ID: <202303281736.7aGJPWvC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux gpu/rust-wip
head:   788bde65c9dd9d364288b590d05f3592ed46a06c
commit: c15ef6af2bc472ba996ba60b3a55350ad94ce88f [6/13] shmem: 16K on 4K hack
config: i386-randconfig-a011-20230327 (https://download.01.org/0day-ci/archive/20230328/202303281736.7aGJPWvC-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/AsahiLinux/linux/commit/c15ef6af2bc472ba996ba60b3a55350ad94ce88f
        git remote add asahilinux https://github.com/AsahiLinux/linux
        git fetch --no-tags asahilinux gpu/rust-wip
        git checkout c15ef6af2bc472ba996ba60b3a55350ad94ce88f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281736.7aGJPWvC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shmem.c:96:8: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
   static const unsigned long shmem_base_nr(struct address_space *mapping) {
          ^~~~~~
   1 warning generated.


vim +/const +96 mm/shmem.c

    95	
  > 96	static const unsigned long shmem_base_nr(struct address_space *mapping) {
    97		return 1L << mapping->order;
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
