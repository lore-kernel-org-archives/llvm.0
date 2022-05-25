Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AACF7FF
	for <llvm@lists.linux.dev>; Wed, 25 May 2022 04:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653454724; x=1684990724;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lOGX5VEv5nSr4EzohX9ltE+U91lw+VsFXzW7yOO7l9A=;
  b=msYiqeByFPNKqOutdGE0km8l47gUfE7y1ia0pNP6I+U2rWe/TgHp02vM
   BUzPMSxNC/ix3xaL+tgFjpGfMmL5PWZvvQw1OMo4MLm2UwUWD4dywuMH5
   ECl3skFB5VEKYr7JX2OqIrKcXbMqc7JAfoIh38NcsHoQ23Jt/owuC/EUc
   JRs3GEzeuXMgh0XIi1YOrTjbDpbpFTzpaTG1ejCMcByKy5TBuPgKH6m6q
   Xe5KwEM4NDszkFWNb+DTyMXQo8vhtSN4gGAndYW6HBhekalvgJrcpIDC0
   j9f2nKgoreuZ6apWYSFtN8Da0m7hp9cfoxQPuF0qnqGzkpTcx+vTKx9mm
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="272535226"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="272535226"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 21:58:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; 
   d="scan'208";a="642224215"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 May 2022 21:58:41 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntj6X-0002ja-2p;
	Wed, 25 May 2022 04:58:41 +0000
Date: Wed, 25 May 2022 12:58:21 +0800
From: kernel test robot <lkp@intel.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: ld.lld: error: undefined symbol: pci_remap_iospace
Message-ID: <202205251247.nQ5cxSV6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tiezhu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fdaf9a5840acaab18694a19e0eb0aa51162eeeed
commit: 09d97da660ff77df20984496aa0abcd6b88819f2 MIPS: Only define pci_remap_iospace() for Ralink
date:   6 months ago
config: mips-randconfig-r022-20220524 (https://download.01.org/0day-ci/archive/20220525/202205251247.nQ5cxSV6-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=09d97da660ff77df20984496aa0abcd6b88819f2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 09d97da660ff77df20984496aa0abcd6b88819f2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pci_remap_iospace
   >>> referenced by pci.c
   >>>               pci/pci.o:(devm_pci_remap_iospace) in archive drivers/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
