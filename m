Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D412CA2
	for <llvm@lists.linux.dev>; Sat, 29 Jan 2022 17:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643478747; x=1675014747;
  h=date:from:cc:subject:message-id:mime-version;
  bh=w3BtKR/hrXZy5BdK+jfcNQZXlT773tuJcOD2x12UvFI=;
  b=OMP2dfnVkoaBVPonVOiZHL1Jh/YDC6zd/BOvsjcznP1/7Eh91FJ2yvOc
   mO1iSf8RQF4WIxboTCAi6PWL5L7YXYRp3AwolcmKUjUE13+r3DnNNbsKd
   aLM9hgTp3PJO32EJUAyQuOSmApM2X/DZKRQITB9xmXQcbg31iPf1+wuL0
   u2GhserDm2+Z/er7dA0rOFdknOH55l7k/4W/3c4tYDwUF+FY+CBzkObbn
   r4hF5JFN3kNwRoCoMLbfmSfvTOSbeARx6OIud+gXJsTHbprbmcSLcOo56
   vf0JGl6zkXnFUK91FkzcbYdKRnQsFfCMShKS6jEb4EOccREMJo4STfqG/
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="246125448"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="246125448"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 09:52:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="582184335"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 29 Jan 2022 09:52:25 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nDrth-000PT2-1j; Sat, 29 Jan 2022 17:52:25 +0000
Date: Sun, 30 Jan 2022 01:52:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: error: unknown target CPU 'r4300'
Message-ID: <202201300120.a2540qQc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Lauri Kasanen <cand@gmx.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

Hi Lauri,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb323ee75d24e7acc2f188d123ba6df46159cf09
commit: baec970aa5ba11099ad7a91773350c91fb2113f0 mips: Add N64 machine type
date:   1 year ago
config: mips-randconfig-c004-20220129 (https://download.01.org/0day-ci/archive/20220130/202201300120.a2540qQc-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=baec970aa5ba11099ad7a91773350c91fb2113f0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout baec970aa5ba11099ad7a91773350c91fb2113f0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> error: unknown target CPU 'r4300'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
>> error: unknown target CPU 'r4300'
   note: valid target CPU values are: mips1, mips2, mips3, mips4, mips5, mips32, mips32r2, mips32r3, mips32r5, mips32r6, mips64, mips64r2, mips64r3, mips64r5, mips64r6, octeon, octeon+, p5600
   make[2]: *** [scripts/Makefile.build:117: kernel/bounds.s] Error 1
   make[2]: Target 'missing-syscalls' not remade because of errors.
   make[1]: *** [arch/mips/Makefile:418: archprepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
