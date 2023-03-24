Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52F23C26;
	Fri, 24 Mar 2023 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679648651; x=1711184651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QYcsRVyjJDvXX8ifW06A+9/ytrnuXbQ3M6t4xwFKZQ4=;
  b=S0COYh1NNdBPAMBpJqr5YqUvzldE0kmTcBvfHWxoR2GXtlf06tQchtoX
   wd9x+X1qWLAd8qVa0grwwwejoJzJqKmVM1jVvu7YsuxO6UDt/OK5u5a1M
   gQaCUCUZp990OOrhyMa5QpIL45UO8wzdEkDlzHquv8qWt1+PRq3V5eQe0
   JOuSJ0aQN2fywWg0008u3cz0r/NyTLh9odg+ynH2qO7XDqeHv27qfoLMu
   ZdJVHL0IMxaLXK2PhL9i5oJSD0PbM0ouA4qqCgzLp1ZgRk2MISwFUdspa
   m5wtqiaxwNu6sMcjSvBwBXN1kWayvvsyqpXGrmiJZ9Ph6IHYmHMHDR9Ch
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="319385470"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="319385470"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 02:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="793371937"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="793371937"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2023 02:04:07 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfdLD-000F9o-1F;
	Fri, 24 Mar 2023 09:04:07 +0000
Date: Fri, 24 Mar 2023 17:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Arnd Bergmann <arnd@kernel.org>,
	Jarkko Sakkinen <jarkko@kernel.org>
Subject: [niks:has_ioport_v4 4/39] drivers/char/tpm/tpm_infineon.c:57:24:
 error: use of undeclared identifier 'TPM_INF_IO_PORT'
Message-ID: <202303241614.EqRa1WCi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git has_ioport_v4
head:   53b49a3f5a95d058e0deb169b87e695d69033f5c
commit: 07c67f2075061c0893444807c2afa4de6e7d08f5 [4/39] char: impi, tpm: depend on HAS_IOPORT
config: i386-randconfig-a015 (https://download.01.org/0day-ci/archive/20230324/202303241614.EqRa1WCi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git/commit/?id=07c67f2075061c0893444807c2afa4de6e7d08f5
        git remote add niks https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git
        git fetch --no-tags niks has_ioport_v4
        git checkout 07c67f2075061c0893444807c2afa4de6e7d08f5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/char/tpm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241614.EqRa1WCi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_infineon.c:16:
   In file included from drivers/char/tpm/tpm.h:28:
   include/linux/tpm_eventlog.h:167:6: warning: variable 'mapping_size' set but not used [-Wunused-but-set-variable]
           int mapping_size;
               ^
>> drivers/char/tpm/tpm_infineon.c:57:24: error: use of undeclared identifier 'TPM_INF_IO_PORT'
           if (tpm_dev.iotype == TPM_INF_IO_PORT)
                                 ^
   drivers/char/tpm/tpm_infineon.c:67:24: error: use of undeclared identifier 'TPM_INF_IO_PORT'
           if (tpm_dev.iotype == TPM_INF_IO_PORT)
                                 ^
   drivers/char/tpm/tpm_infineon.c:76:24: error: use of undeclared identifier 'TPM_INF_IO_PORT'
           if (tpm_dev.iotype == TPM_INF_IO_PORT)
                                 ^
   drivers/char/tpm/tpm_infineon.c:86:24: error: use of undeclared identifier 'TPM_INF_IO_PORT'
           if (tpm_dev.iotype == TPM_INF_IO_PORT)
                                 ^
   drivers/char/tpm/tpm_infineon.c:411:20: error: use of undeclared identifier 'TPM_INF_IO_PORT'
                   tpm_dev.iotype = TPM_INF_IO_PORT;
                                    ^
   drivers/char/tpm/tpm_infineon.c:543:23: error: use of undeclared identifier 'TPM_INF_IO_PORT'
                            tpm_dev.iotype == TPM_INF_IO_PORT ?
                                              ^
   drivers/char/tpm/tpm_infineon.c:546:23: error: use of undeclared identifier 'TPM_INF_IO_PORT'
                            tpm_dev.iotype == TPM_INF_IO_PORT ?
                                              ^
   drivers/char/tpm/tpm_infineon.c:570:24: error: use of undeclared identifier 'TPM_INF_IO_PORT'
           if (tpm_dev.iotype == TPM_INF_IO_PORT) {
                                 ^
   drivers/char/tpm/tpm_infineon.c:588:24: error: use of undeclared identifier 'TPM_INF_IO_PORT'
           if (tpm_dev.iotype == TPM_INF_IO_PORT) {
                                 ^
   1 warning and 9 errors generated.


vim +/TPM_INF_IO_PORT +57 drivers/char/tpm/tpm_infineon.c

d954e8edee5de9 Alex Williamson 2007-05-08  53  
d954e8edee5de9 Alex Williamson 2007-05-08  54  static inline void tpm_data_out(unsigned char data, unsigned char offset)
d954e8edee5de9 Alex Williamson 2007-05-08  55  {
07c67f2075061c Niklas Schnelle 2021-12-20  56  #ifdef CONFIG_HAS_IOPORT
d954e8edee5de9 Alex Williamson 2007-05-08 @57  	if (tpm_dev.iotype == TPM_INF_IO_PORT)
d954e8edee5de9 Alex Williamson 2007-05-08  58  		outb(data, tpm_dev.data_regs + offset);
d954e8edee5de9 Alex Williamson 2007-05-08  59  	else
07c67f2075061c Niklas Schnelle 2021-12-20  60  #endif
d954e8edee5de9 Alex Williamson 2007-05-08  61  		writeb(data, tpm_dev.mem_base + tpm_dev.data_regs + offset);
d954e8edee5de9 Alex Williamson 2007-05-08  62  }
d954e8edee5de9 Alex Williamson 2007-05-08  63  

:::::: The code at line 57 was first introduced by commit
:::::: d954e8edee5de90f8625c041ce177e04ae2c88fe tpm_infineon: add support for devices in mmio space

:::::: TO: Alex Williamson <alex.williamson@hp.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
