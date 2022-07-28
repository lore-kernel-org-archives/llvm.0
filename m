Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C2F1101
	for <llvm@lists.linux.dev>; Thu, 28 Jul 2022 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658999704; x=1690535704;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qWGmdHmLrk+oEbVhU7csvrWkmvJ6LR1bxNgJW2W9H18=;
  b=jp4HtpBpMB5Q4KjczchUDbjA5XDyIjPyMTE4S1hdNJvMYjhJSdf+g8Py
   94dlbdW89l5VZ8kIOVwRIsEKXcLEARPbmEzZgkR7r1qup8SCKKPhbOJlD
   R0kAemAoWCSgmX5AznCFQQoV2N7lHJ825AaeG/CWAyn127+lRytt7ZLJr
   1sV3IWdffRjqPtUujQ4mcf3hfEIW6D3cpGZ8lLX/HkdK3OVsZTcz2/FqD
   8uGYmzx0WoU66C9IYg3esFFf2BvbNB8kqMj955cSXpPY/FKknF3+D20qT
   btV+zLeqrnBwBT5GU+KZzLI7KMpSz3Mk+PSpkfMA474vT3ALcbqfFpkGK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="350171070"
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="350171070"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2022 02:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,196,1654585200"; 
   d="scan'208";a="576377651"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Jul 2022 02:15:01 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oGzbh-0009r4-0w;
	Thu, 28 Jul 2022 09:15:01 +0000
Date: Thu, 28 Jul 2022 17:14:13 +0800
From: kernel test robot <lkp@intel.com>
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Subject: [linux-next:master 4288/13276] coherent.c:undefined reference to
 `memunmap'
Message-ID: <202207281724.oBZnmI4E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark-PK,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9250d2f72dc46a808b6aa23bf50dd670f1f52ddc
commit: e61c451476e61450f6771ce03bbc01210a09be16 [4288/13276] dma-mapping: Add dma_release_coherent_memory to DMA API
config: s390-randconfig-r002-20220728 (https://download.01.org/0day-ci/archive/20220728/202207281724.oBZnmI4E-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 8dfaecc4c24494337933aff9d9166486ca0949f1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e61c451476e61450f6771ce03bbc01210a09be16
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e61c451476e61450f6771ce03bbc01210a09be16
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   /opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: kernel/dma/coherent.o: in function `dma_declare_coherent_memory':
   coherent.c:(.text+0x48): undefined reference to `memremap'
   /opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: coherent.c:(.text+0x14a): undefined reference to `memunmap'
   /opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: coherent.c:(.text+0x180): undefined reference to `memunmap'
   /opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: kernel/dma/coherent.o: in function `dma_release_coherent_memory':
>> coherent.c:(.text+0x1e2): undefined reference to `memunmap'
   /opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: kernel/dma/coherent.o: in function `rmem_dma_device_init':
   coherent.c:(.text+0x634): undefined reference to `memremap'
   /opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: coherent.c:(.text+0x740): undefined reference to `memunmap'
   /opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: drivers/crypto/ccree/cc_driver.o: in function `ccree_probe':
   cc_driver.c:(.text+0x3d8): undefined reference to `devm_ioremap_resource'
   /opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: drivers/crypto/ccree/cc_debugfs.o: in function `cc_debugfs_init':
   cc_debugfs.c:(.text+0x94): undefined reference to `debugfs_create_regset32'
   /opt/cross/gcc-12.1.0-nolibc/s390x-linux/bin/s390x-linux-ld: cc_debugfs.c:(.text+0x13a): undefined reference to `debugfs_create_regset32'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
