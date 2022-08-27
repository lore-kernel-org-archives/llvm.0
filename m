Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B2E17C5
	for <llvm@lists.linux.dev>; Sat, 27 Aug 2022 06:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661581305; x=1693117305;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aXJC/E7x5q+usZCo0oNBegtsCOu6gFfwtcdSpeMxdpI=;
  b=bE15zcgQR+yW6NzGGt1juftZVuC7BbuTDz8196dFrECIwVDhMlI1oEqz
   kx5pYsrd6Isvp4HLJVQBYTxwR+9s2kXzX95glLNg1NCxuHAjJF6lJt8e9
   PHZwzN5g0WDVp/+h9CNAbwyiIrPyX437bOypZf7FhqH74jM/Lsd967ccz
   crAgDFiicUGQ3VM2aoJDyn5VfBt36hvUovAz6rkAVKTlqmrGJPm9fgSWe
   /+d89qkgkNkZATNPbCWsC92hnzwj8mWlJ2haoNgSS7zN1/AiY0tY52PcW
   tOeKkZ2VrHHgIk8DgLEMfNKHylVD3gRFlrGtqB447E67mwPRQEgYXIx+/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="320753173"
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="320753173"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2022 23:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,267,1654585200"; 
   d="scan'208";a="938991188"
Received: from lkp-server01.sh.intel.com (HELO 71b0d3b5b1bc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2022 23:21:40 -0700
Received: from kbuild by 71b0d3b5b1bc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oRpCN-000147-2w;
	Sat, 27 Aug 2022 06:21:39 +0000
Date: Sat, 27 Aug 2022 14:21:01 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ardb:efi-decompressor-v4 4/9]
 drivers/firmware/efi/libstub/intrinsics.c:18:7: error: definition of builtin
 function '__builtin_memcpy'
Message-ID: <202208271446.2z1VzPD0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-decompressor-v4
head:   2943178d7555c331c19e9cce9a83e47f9513f3b1
commit: 74f59f87ddbcbacc7232ac6800916260a0632126 [4/9] efi/libstub: use EFI provided memcpy/memset routines
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20220827/202208271446.2z1VzPD0-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=74f59f87ddbcbacc7232ac6800916260a0632126
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb efi-decompressor-v4
        git checkout 74f59f87ddbcbacc7232ac6800916260a0632126
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/intrinsics.c:18:7: error: definition of builtin function '__builtin_memcpy'
   void *memcpy(void *dst, const void *src, size_t len)
         ^
   arch/x86/include/asm/string_32.h:150:25: note: expanded from macro 'memcpy'
   #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
                           ^
>> drivers/firmware/efi/libstub/intrinsics.c:26:7: error: definition of builtin function '__builtin_memset'
   void *memset(void *dst, int c, size_t len)
         ^
   arch/x86/include/asm/string_32.h:195:29: note: expanded from macro 'memset'
   #define memset(s, c, count) __builtin_memset(s, c, count)
                               ^
   2 errors generated.


vim +/__builtin_memcpy +18 drivers/firmware/efi/libstub/intrinsics.c

    17	
  > 18	void *memcpy(void *dst, const void *src, size_t len)
    19	{
    20		efi_bs_call(copy_mem, dst, src, len);
    21		return dst;
    22	}
    23	
    24	extern void *memmove(void *dst, const void *src, size_t len) __alias(memcpy);
    25	
  > 26	void *memset(void *dst, int c, size_t len)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
