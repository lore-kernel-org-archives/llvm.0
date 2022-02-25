Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9710EB
	for <llvm@lists.linux.dev>; Fri, 25 Feb 2022 12:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645793289; x=1677329289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0UzBsK8y2iQaAbuzl+TvKEQv2YG32E6hH7WzIhC5PH4=;
  b=kV+io/canr0En6/SSpJnEAskCZMS640yLj8XxFjYzfEQjSSS+lm7vEcC
   shBzobm1R08hBX2RjQSvfUIxuV+qZjNrvT/ZGtrS2T/Li32kygQ5RYDCd
   H+IV5NhxbWorW5tr/zhyDiU7aZM4UqMb5giM2xIdYmDNiCIfO31eeXRH0
   3z5Ns4VtUJ36JkUhmSYmC0odQlFKCzB1LF0QAOkFQpZrisHD4QkLubV73
   vfaIRHQi/VLbJq3J3LL1G9CMrV7hACPMTWyJUDV1Jw8hMCRpL0V3mqjMt
   QXoSox+w7RcUX2/mbHI679CJL8g+IO3WJ4T0K3W4RF3meiBojavnJ0qvG
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10268"; a="252218045"
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="252218045"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2022 04:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,136,1643702400"; 
   d="scan'208";a="491969037"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Feb 2022 04:48:07 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nNa11-0004JI-6C; Fri, 25 Feb 2022 12:48:07 +0000
Date: Fri, 25 Feb 2022 20:47:40 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: ld.lld: error: undefined symbol: pci_remap_iospace
Message-ID: <202202252051.nEOp7nyy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   53ab78cd6d5aba25575a7cfb95729336ba9497d8
commit: 09d97da660ff77df20984496aa0abcd6b88819f2 MIPS: Only define pci_remap_iospace() for Ralink
date:   3 months ago
config: mips-randconfig-r006-20220225 (https://download.01.org/0day-ci/archive/20220225/202202252051.nEOp7nyy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=09d97da660ff77df20984496aa0abcd6b88819f2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 09d97da660ff77df20984496aa0abcd6b88819f2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pci_remap_iospace
   >>> referenced by pci.c
   >>>               pci/pci.o:(devm_pci_remap_iospace) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
