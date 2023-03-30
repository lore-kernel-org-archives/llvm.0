Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E69455;
	Thu, 30 Mar 2023 20:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680207851; x=1711743851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ejJ2ob9r3zd5MOXVCKSUAkezn/Uccqx+g/5pNyGgtls=;
  b=nUWCvwAQfCcZwJKq+JOPerLnWLe41aBZRXLfB66E9lV4L2uke+ppXFwH
   GJ02JnKwOyuevNesgBLVPk4FlowYe8Ka0JFxtMvBehHMiWrrvfOPol+px
   76nuBxLySP/2tgwA+Hn/fHm3JMgI2Wtm2h7O1Hug5k+6CWaDa7We53OYT
   V/41hV0T4o8OQ56jTBNA5pF3zEJPneBMLDQIu+59PdxvNZN4+olBE6kER
   vS5JKP7QdF6dSQ7qMSw3nb4msezknUcO3e+OeXHBtKyrKMqDLqXW2EBDw
   yVMaJ2s6RnW0LqgZXovnsr9tNSIq023XtqVicwVm7KlbtKhdaOQ1T7KVk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="342923950"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="342923950"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 13:24:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="859036139"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="859036139"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 30 Mar 2023 13:24:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phyob-000LBY-0J;
	Thu, 30 Mar 2023 20:24:09 +0000
Date: Fri, 31 Mar 2023 04:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:for-kernelci 12/14] ld.lld: error:
 ./arch/arm/kernel/vmlinux.lds:16: unable to move location counter backward
 for: .text
Message-ID: <202303310439.K25YKOdu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git for-kernelci
head:   9c3f4caa18447f86f796e34e77de9e6dc4a8dfd1
commit: 10bdcdc04f3782a4b9b84de2267480e0bc4bf717 [12/14] ARM: vmlinux.lds: Add image header to decompressed kernel image
config: arm-randconfig-r003-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310439.K25YKOdu-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=10bdcdc04f3782a4b9b84de2267480e0bc4bf717
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb for-kernelci
        git checkout 10bdcdc04f3782a4b9b84de2267480e0bc4bf717
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303310439.K25YKOdu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: ./arch/arm/kernel/vmlinux.lds:16: unable to move location counter backward for: .text
>> ld.lld: error: ./arch/arm/kernel/vmlinux.lds:16: unable to move location counter backward for: .text
>> ld.lld: error: ./arch/arm/kernel/vmlinux.lds:16: unable to move location counter backward for: .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
