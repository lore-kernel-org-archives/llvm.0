Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D991B4A38
	for <llvm@lists.linux.dev>; Thu, 14 Jul 2022 16:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657815748; x=1689351748;
  h=date:from:cc:subject:message-id:mime-version;
  bh=anTrC/UY7diQsptjXG0RpBpOqejLbQkfzKVHOEeRmwg=;
  b=XbIwt0C9hV6eT1PDRi2jj5bPRjiokGCj8m6K90B/N75cdqPCt2Mnk2k+
   cLh+G6AdAyUf/lFWkEypFtjqkWTRgqavOVovSusq28D9XyjDTn1cYvRVH
   ExSWJZLZe2TBWK4Jc720jhmNjIu2yKzeWgVZdCSF20541xInTu7HVMz3Q
   ZtHll289eL6q6hP92aYkIKxJ61VTTKy9MEy9eNI8wGtqTtp8J4UaYAWVc
   JDAQ5o+O3OQJb4sqiLu/BmdZvQhf09vQg2tvw9E1pmEtCYSHLhJw6nyic
   d4pBPgx/4zo65An0eGTyXWaL7Z397PvZil9ifOFi+9S4/b2mz5NsxM80D
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="286699853"
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="286699853"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2022 09:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,271,1650956400"; 
   d="scan'208";a="772680193"
Received: from lkp-server01.sh.intel.com (HELO fd2c14d642b4) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 14 Jul 2022 09:22:27 -0700
Received: from kbuild by fd2c14d642b4 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oC1be-0000r7-Mt;
	Thu, 14 Jul 2022 16:22:26 +0000
Date: Fri, 15 Jul 2022 00:21:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: Re: [PATCH linux-next] iov_iter: Fix repeated minus operation
Message-ID: <202207150000.o22VxhAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
In-Reply-To: <1657792294-56244-1-git-send-email-liuxp11@chinatelecom.cn>
References: <1657792294-56244-1-git-send-email-liuxp11@chinatelecom.cn>
TO: Liu Xinpeng <liuxp11@chinatelecom.cn>
TO: sfr@canb.auug.org.au
TO: viro@zeniv.linux.org.uk
TO: willy@infradead.org
CC: linux-kernel@vger.kernel.org
CC: Liu Xinpeng <liuxp11@chinatelecom.cn>

Hi Liu,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on next-20220714]

url:    https://github.com/intel-lab-lkp/linux/commits/Liu-Xinpeng/iov_iter-Fix-repeated-minus-operation/20220714-175339
base:    37b355fdaf31ee18bda9a93c2a438dc1cbf57ec9
config: riscv-randconfig-r031-20220714 (https://download.01.org/0day-ci/archive/20220715/202207150000.o22VxhAi-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5e61b9c556267086ef9b743a0b57df302eef831b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/2ab0e8fdd240ce1de894e6590b3d9ecacf02ca70
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Liu-Xinpeng/iov_iter-Fix-repeated-minus-operation/20220714-175339
        git checkout 2ab0e8fdd240ce1de894e6590b3d9ecacf02ca70
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: arch/riscv/built-in.a(kernel/cpu.o):(function riscv_of_processor_hartid: .text+0x10): relocation R_RISCV_HI20 out of range: 531532 is not in [-524288, 524287]; references __stack_chk_guard
   >>> referenced by cpu.c
   >>> defined in arch/riscv/built-in.a

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
