Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E4D2C82
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642576887; x=1674112887;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9Cs0/eYhOxqWtZtqx6m6V7eRm9ZISPAQYWTdhpFB4M=;
  b=Nsgb3AcHIhFpUmQd/BoWhgOh42DBBUtZYw7BSHQDQw4N08ESagIaHzZc
   rYSOJxAzQDRYMhRewaW8TDwnqP1YYscv4uwLVvvsKTOMZu2eImPJBQqo6
   ouxEyy16TpfMChqad5oEJHGjYIf/pwJzSFpMj6PeaL67QdDllu1azfWQS
   Z5uVyq2hR4dwb90gzygrBR7952dxul38i1WV32TQVKLPTqoSAL+fAVOO2
   hZVxZz6SR2VbDxCq/sc0DqDDCpRYe+2dsHq2V/I15KfAnD0o9ha/cvHBR
   uozJGgvV3XkHrEbuYihOAuD4hYlUcTzTDns3IaT/+xVJhD3nvCkXbYlpt
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="232367402"
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; 
   d="scan'208";a="232367402"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 23:21:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,299,1635231600"; 
   d="scan'208";a="532150752"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 23:21:21 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nA5HV-000DMj-51; Wed, 19 Jan 2022 07:21:21 +0000
Date: Wed, 19 Jan 2022 15:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive 21/80] ld.lld: error: duplicate symbol: memset
Message-ID: <202201191516.DcDnH6lu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/esmil/linux visionfive
head:   e46c3a7e373e6faa03399f1a41c29cf7546c37cb
commit: 55f013c0bc3e224cf34271c3cc11f7443b11553f [21/80] riscv: optimized memset
config: riscv-randconfig-r042-20220118 (https://download.01.org/0day-ci/archive/20220119/202201191516.DcDnH6lu-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b7138a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/55f013c0bc3e224cf34271c3cc11f7443b11553f
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout 55f013c0bc3e224cf34271c3cc11f7443b11553f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: memset
   >>> defined at shadow.c
   >>> kasan/shadow.o:(memset) in archive mm/built-in.a
   >>> defined at string.c
   >>> string.o:(.text+0x1398) in archive lib/lib.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
