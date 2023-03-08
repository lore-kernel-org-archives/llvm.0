Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD1C657;
	Wed,  8 Mar 2023 21:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678309321; x=1709845321;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4h+DzKQ2OlM6SP8197YncaUzixfIkTFeYm9PCu84nEQ=;
  b=K3QiMwuU0OLDcapLJzk6wEuNZzQqp4Lra6ghGPcYAaBFdF0zVXE0lVda
   qXF6UWhPLAHJ9w5ztYXtcu1pp93RkUNJ3Srqzc3RZTrW5tNBvEPWB0Z0x
   QR2xf+j2V7KaQ9sVvgT/g3a62yKI2CbYjtD5qea52K3H/LftX+R5CLC9o
   pdSliyqRx7gLAz35t35N4E9mEnmEExYqDp7c4I63+VwIfq+Slo4V0ZduT
   IKr2PVbZm4udAOgfajOGt7aRQg4Xg1DtsTIgFikcJbGS3X7l3YHEhPEdo
   fxFuF5F4c0AsKK4McjKIAVJbk3dhsge0qW9gT1NZ49icigNYu8aE6OZut
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="315932426"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="315932426"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2023 13:02:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="627080662"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; 
   d="scan'208";a="627080662"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2023 13:01:58 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pa0v7-0002Or-2B;
	Wed, 08 Mar 2023 21:01:57 +0000
Date: Thu, 9 Mar 2023 05:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrey Konovalov <andreyknvl@gmail.com>
Subject: ld.lld: error: undefined symbol: memcpy
Message-ID: <202303090422.ss2Hbm4f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   63355b9884b3d1677de6bd1517cd2b8a9bf53978
commit: 36be5cba99f6f9984a9a9f0454f95a38f4184d3e kasan: treat meminstrinsic as builtins in uninstrumented files
date:   6 days ago
config: powerpc-randconfig-r036-20230305 (https://download.01.org/0day-ci/archive/20230309/202303090422.ss2Hbm4f-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=36be5cba99f6f9984a9a9f0454f95a38f4184d3e
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 36be5cba99f6f9984a9a9f0454f95a38f4184d3e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303090422.ss2Hbm4f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: memcpy
   >>> referenced by xmon.c:1896 (arch/powerpc/xmon/xmon.c:1896)
   >>>               arch/powerpc/xmon/xmon.o:(prregs) in archive vmlinux.a
   >>> referenced by zstd_compress.c:4814 (lib/zstd/compress/zstd_compress.c:4814)
   >>>               lib/zstd/compress/zstd_compress.o:(ZSTD_createCDict_advanced2) in archive vmlinux.a
   >>> referenced by zstd_compress.c:4910 (lib/zstd/compress/zstd_compress.c:4910)
   >>>               lib/zstd/compress/zstd_compress.o:(ZSTD_initStaticCDict) in archive vmlinux.a
   >>> referenced 5 more times
--
>> ld.lld: error: undefined symbol: memset
   >>> referenced by slab_common.c:579 (mm/slab_common.c:579)
   >>>               mm/slab_common.o:(kmem_dump_obj) in archive vmlinux.a
   >>> referenced by kasan_test.c:558 (mm/kasan/kasan_test.c:558)
   >>>               mm/kasan/kasan_test.o:(kmalloc_oob_in_memset) in archive vmlinux.a
   >>> referenced by kasan_test.c:505 (mm/kasan/kasan_test.c:505)
   >>>               mm/kasan/kasan_test.o:(kmalloc_oob_memset_2) in archive vmlinux.a
   >>> referenced 10 more times

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
