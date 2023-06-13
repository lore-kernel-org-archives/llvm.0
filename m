Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491C433E3;
	Tue, 13 Jun 2023 16:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686673991; x=1718209991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NyEH0miiW/Kp8Hnh01A3lEA0nT9tM0YmfXtKGe7rkLk=;
  b=O+ntw987/as12SJFeoQdSoRFyEzjayREtY3BSqVC+mNXRygZ0RiRyXcH
   HAGQh4qa+ZQSxg8ihnccHvoU5AbWmsOpAyDVQ3HZkjW3gGkh1ziCSeShH
   HnfeXnskJYSpDno62hf22MzVYPCMP2QE0txkx7nQB1IBpl0imBL9qbgVO
   yLgNomA7sV1PdrSIe6YIRIpiClIJVL/h6WvbFQ5bNtz+0XGPICq4DYv/9
   TsVeh2TZM5iby5TUgEOIK++qO3aHhTa2KL9WNUj8cDwskeuFxLkfY5qhb
   6EIGWxXbKiLMrrOIGd+OaOV4sRRyD5RjbNECuSZp0i/DMJ+5O/sRMvRlN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="355887550"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="355887550"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 09:33:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="1041842910"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="1041842910"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jun 2023 09:33:08 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q96x9-0001Xi-2u;
	Tue, 13 Jun 2023 16:33:07 +0000
Date: Wed, 14 Jun 2023 00:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 11/55] drivers/tty/serial/serial_core.c:3509:50:
 error: initializer element is not a compile-time constant
Message-ID: <202306140027.HlceCcM2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   f8c938871c78b165f3123967084c0f7b4f64a439
commit: bce176a3e06cb9fc5ea48be084a826e28d0885f3 [11/55] serial: make strlen of sysrq_toggle_seq[] a global constant
config: arm-randconfig-r024-20230612 (https://download.01.org/0day-ci/archive/20230614/202306140027.HlceCcM2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git/commit/?id=bce176a3e06cb9fc5ea48be084a826e28d0885f3
        git remote add jirislaby https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git
        git fetch --no-tags jirislaby devel
        git checkout bce176a3e06cb9fc5ea48be084a826e28d0885f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/tty/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140027.HlceCcM2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/serial_core.c:3509:50: error: initializer element is not a compile-time constant
   static const unsigned int sysrq_toggle_seq_len = strlen(sysrq_toggle_seq);
                                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +3509 drivers/tty/serial/serial_core.c

  3506	
  3507	#ifdef CONFIG_MAGIC_SYSRQ_SERIAL
  3508	static const u8 sysrq_toggle_seq[] = CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE;
> 3509	static const unsigned int sysrq_toggle_seq_len = strlen(sysrq_toggle_seq);
  3510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
