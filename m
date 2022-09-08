Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5C55CA6
	for <llvm@lists.linux.dev>; Thu,  8 Sep 2022 20:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662668251; x=1694204251;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AbjYMadHnJrO2BRZtz1Y0SklCk/+BqZcKLXpD/0d3Sw=;
  b=QN0Eta+EM+qxfJ43fWwizJGLc67yEIYv84XeWUUfFTSfE+dnahOUyeQA
   9rwM0K8vRGdHAzRXiGHX2+tXwCHuuSbW/z5UZmtX6FtvJgQXxafOwaYOX
   flrHUzuWZN/3tg6HRt+ZMhOoukIweVdwXh8j/EZctbBeqypiDwAff8OwR
   5mGqL6IDfTxw5SpNMCRbBq0lieF1kRmpODmG8XIcGxI71Fc1tqVploAua
   hv6dWzY/emi7GkhiMw2SIp+dfLXmA9BuSkK4jYP2uF6c/fslOugY/Hm/S
   02JPwFbWgWR2588qvMT5GXmzA6tXrA3G2Zswh1uyZaw5ZwWm2qXUUnOEF
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="277049089"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="277049089"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2022 13:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; 
   d="scan'208";a="645246136"
Received: from lkp-server02.sh.intel.com (HELO b2938d2e5c5a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 08 Sep 2022 13:17:29 -0700
Received: from kbuild by b2938d2e5c5a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oWNxo-0000IH-24;
	Thu, 08 Sep 2022 20:17:28 +0000
Date: Fri, 9 Sep 2022 04:17:26 +0800
From: kernel test robot <lkp@intel.com>
To: Matteo Croce <mcroce@microsoft.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive 2/42] arch/riscv/lib/string.c:113:7: error:
 redefinition of '__memmove'
Message-ID: <202209090450.atBceE0E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   044c1f5e968de7d30940431fbb90da599074ea1c
commit: 77842bff71e70078f7d70d35da62fbb03d929cda [2/42] riscv: optimized memmove
config: riscv-randconfig-r021-20220907 (https://download.01.org/0day-ci/archive/20220909/202209090450.atBceE0E-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/77842bff71e70078f7d70d35da62fbb03d929cda
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout 77842bff71e70078f7d70d35da62fbb03d929cda
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/riscv/lib/string.c:90:57: warning: attribute declaration must precede definition [-Wignored-attributes]
   void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
                                                           ^
   include/linux/compiler_attributes.h:372:56: note: expanded from macro '__weak'
   #define __weak                          __attribute__((__weak__))
                                                          ^
   arch/riscv/lib/string.c:31:7: note: previous definition is here
   void *__memcpy(void *dest, const void *src, size_t count)
         ^
   arch/riscv/lib/string.c:90:7: error: redefinition of '__memcpy'
   void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy);
         ^
   arch/riscv/include/asm/string.h:25:31: note: expanded from macro 'memcpy'
   #define memcpy(dst, src, len) __memcpy(dst, src, len)
                                 ^
   arch/riscv/lib/string.c:31:7: note: previous definition is here
   void *__memcpy(void *dest, const void *src, size_t count)
         ^
   arch/riscv/lib/string.c:113:58: warning: attribute declaration must precede definition [-Wignored-attributes]
   void *memmove(void *dest, const void *src, size_t count) __weak __alias(__memmove);
                                                            ^
   include/linux/compiler_attributes.h:372:56: note: expanded from macro '__weak'
   #define __weak                          __attribute__((__weak__))
                                                          ^
   arch/riscv/lib/string.c:97:7: note: previous definition is here
   void *__memmove(void *dest, const void *src, size_t count)
         ^
>> arch/riscv/lib/string.c:113:7: error: redefinition of '__memmove'
   void *memmove(void *dest, const void *src, size_t count) __weak __alias(__memmove);
         ^
   arch/riscv/include/asm/string.h:27:32: note: expanded from macro 'memmove'
   #define memmove(dst, src, len) __memmove(dst, src, len)
                                  ^
   arch/riscv/lib/string.c:97:7: note: previous definition is here
   void *__memmove(void *dest, const void *src, size_t count)
         ^
   2 warnings and 2 errors generated.


vim +/__memmove +113 arch/riscv/lib/string.c

   112	
 > 113	void *memmove(void *dest, const void *src, size_t count) __weak __alias(__memmove);

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
