Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEBE2564
	for <llvm@lists.linux.dev>; Fri,  8 Apr 2022 15:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649431416; x=1680967416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9H8BUXKRrkLgvJdGdu978TupPedHMZGCiuTf1WYFn5c=;
  b=XCMdts+rEpQ3i7mFtJkcD+EXapCPSf3vLNla98w3ph6QoXYNgHhjEU4I
   HSMoTKDtHsXn/bXdrM1f/fYZgiXj98MZFzI8DdOFcx4NO93NfwGO1WqQh
   v6ri7gsXhRMF87GhXSICKIyWIF22O5+kK4s9bQgUuVw7Hoa+9Zqm6bhn0
   b7bp3Oumc0i5rc9XNd2cGVkI5obZ7eAzT/rwjbXKePQs6h1nmwmUa5+70
   aCGkZB2fm5lgUE79DLybW+UMktoHzf8xJeOVn1FmBS0LBqzVDPzkYrYZR
   0CPJlcbqemyADTYQHMaXhePXFA4EwYYOsBmUyJqAnuBeylxoFyHIq/NpT
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="242211342"
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="242211342"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 08:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,245,1643702400"; 
   d="scan'208";a="659521417"
Received: from lkp-server02.sh.intel.com (HELO 7e80bc2a00a0) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 08 Apr 2022 08:23:33 -0700
Received: from kbuild by 7e80bc2a00a0 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncqST-0000OV-4I;
	Fri, 08 Apr 2022 15:23:33 +0000
Date: Fri, 8 Apr 2022 23:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Pasanen <dan.pasanen@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Dom Cobley <popcornmix@gmail.com>
Subject: [l1k:smsc95xx_5.17 21/887] ld.lld: error: undefined symbol:
 v4wb_dma_inv_range
Message-ID: <202204082305.3yjg0eTb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/l1k/linux smsc95xx_5.17
head:   05d68ced287b30f62f18f95b5476135ef669804a
commit: 158c801c65d225eb8dd0ca0eb79e7bee23710294 [21/887] arm: partially revert 702b94bff3c50542a6e4ab9a4f4cef093262fe65
config: arm-randconfig-r026-20220408 (https://download.01.org/0day-ci/archive/20220408/202204082305.3yjg0eTb-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c29a51b3a257908aebc01cd7c4655665db317d66)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/l1k/linux/commit/158c801c65d225eb8dd0ca0eb79e7bee23710294
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k smsc95xx_5.17
        git checkout 158c801c65d225eb8dd0ca0eb79e7bee23710294
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
   ld.lld: warning: lld uses blx instruction, no object with architecture supporting feature detected
>> ld.lld: error: undefined symbol: v4wb_dma_inv_range
   >>> referenced by proc-syms.c
   >>> mm/proc-syms.o:(__ksymtab_v4wb_dma_inv_range) in archive arch/arm/built-in.a
--
>> ld.lld: error: undefined symbol: v4wb_dma_clean_range
   >>> referenced by proc-syms.c
   >>> mm/proc-syms.o:(__ksymtab_v4wb_dma_clean_range) in archive arch/arm/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
