Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5A18460;
	Thu, 27 Apr 2023 16:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682611902; x=1714147902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8j7BMajVfsWd44Yp2KprOdW46ldBUmqAU1g/b3XFdwk=;
  b=alPkQuzg9cRsbXiHkHpGmzG7n1jNnXdqiyENzvGES1nPYQKS9YFN9TrH
   3gEOcfPsWPSzh/NuZixEpLoZLPFvMiRoZL+AgvtKLFTB7ZM4fbBkuzeCn
   //uU4qDH4W5Y1us4JkiWhi3eUFwmHyYNaL3Y9UoH36ZemZPEocUCASSFz
   ms05L3mzd98Y7ZWa2NyClArFslb+R1HUkLI9z1ZvwHE4/MjkxiTeToqhj
   B2ry7D6aTMdotdPEdEGTHytH26Q0DNXo65pLTxf9rVnNsb4Hhhe4oFC9y
   8oz9z0DZNKK/iiAWK+Tkiu9H5gHl1XCsp7614aYH0lhEZrowMceXjvSA1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="410546104"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="410546104"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 09:09:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="724979840"
X-IronPort-AV: E=Sophos;i="5.99,230,1677571200"; 
   d="scan'208";a="724979840"
Received: from lkp-server01.sh.intel.com (HELO 1e0e07564161) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 27 Apr 2023 09:09:27 -0700
Received: from kbuild by 1e0e07564161 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps4BS-0000Jh-1S;
	Thu, 27 Apr 2023 16:09:26 +0000
Date: Fri, 28 Apr 2023 00:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:next 1/1] include/linux/tpm.h:285:2: error:
 redefinition of enumerator 'TPM_CHIP_FLAG_FIRMWARE_UPGRADE'
Message-ID: <202304280042.LghqIBZQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git next
head:   e2f14081c68395f0b0f9072bbf5e56450b1cb3f8
commit: e2f14081c68395f0b0f9072bbf5e56450b1cb3f8 [1/1] tpm: Re-enable TPM chip boostrapping non-tpm_tis TPM drivers
config: riscv-buildonly-randconfig-r003-20230427 (https://download.01.org/0day-ci/archive/20230428/202304280042.LghqIBZQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/commit/?id=e2f14081c68395f0b0f9072bbf5e56450b1cb3f8
        git remote add jarkko-tpmdd git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git
        git fetch --no-tags jarkko-tpmdd next
        git checkout e2f14081c68395f0b0f9072bbf5e56450b1cb3f8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash security/keys/trusted-keys/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280042.LghqIBZQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from security/keys/trusted-keys/trusted_core.c:10:
   In file included from include/keys/trusted-type.h:12:
>> include/linux/tpm.h:285:2: error: redefinition of enumerator 'TPM_CHIP_FLAG_FIRMWARE_UPGRADE'
           TPM_CHIP_FLAG_FIRMWARE_UPGRADE          = BIT(7),
           ^
   include/linux/tpm.h:284:2: note: previous definition is here
           TPM_CHIP_FLAG_FIRMWARE_UPGRADE          = BIT(7),
           ^
   include/linux/tpm.h:286:2: error: redefinition of enumerator 'TPM_CHIP_FLAG_FIRMWARE_UPGRADE'
           TPM_CHIP_FLAG_FIRMWARE_UPGRADE          = BIT(7),
           ^
   include/linux/tpm.h:284:2: note: previous definition is here
           TPM_CHIP_FLAG_FIRMWARE_UPGRADE          = BIT(7),
           ^
   2 errors generated.


vim +/TPM_CHIP_FLAG_FIRMWARE_UPGRADE +285 include/linux/tpm.h

   275	
   276	enum tpm_chip_flags {
   277		TPM_CHIP_FLAG_BOOTSTRAPPED		= BIT(0),
   278		TPM_CHIP_FLAG_TPM2			= BIT(1),
   279		TPM_CHIP_FLAG_IRQ			= BIT(2),
   280		TPM_CHIP_FLAG_VIRTUAL			= BIT(3),
   281		TPM_CHIP_FLAG_HAVE_TIMEOUTS		= BIT(4),
   282		TPM_CHIP_FLAG_ALWAYS_POWERED		= BIT(5),
   283		TPM_CHIP_FLAG_FIRMWARE_POWER_MANAGED	= BIT(6),
   284		TPM_CHIP_FLAG_FIRMWARE_UPGRADE		= BIT(7),
 > 285		TPM_CHIP_FLAG_FIRMWARE_UPGRADE		= BIT(7),
   286		TPM_CHIP_FLAG_FIRMWARE_UPGRADE		= BIT(7),
   287	};
   288	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
