Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226F533D8
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647003727; x=1678539727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0nqluSQ8r5IJ3BfjMoXfkA5pM/vYkb+BwHqp2NsdFTc=;
  b=SNl12gwaZc0MXSUirJVpEWmqVD6DRxT1808VoQIc5a9iIQcHzQOOjDQr
   gW94NDUlSgyv+4qtbJcgSloERyK3inuFMg2/PhOkLnFRcWxY/JEzAGy0a
   Dq2cVp84iicJ50QcLcfpWMhTNsOKe+xHAGLyQTy6WX3TFWgMPDmkgZZyO
   bu8fFhFUqZMoYxFaTd269k1MXfFY7S7ET7AyJ35HZlamPils7yVDRW+Fw
   sNTp8G/J8HW4JKCJrgBnM/oO3bTE2uDjuW67oLGRuchHN/n8fT6Zf5O6I
   rxhYxjoz1Ktl/OOGQm0bdf80oCyimxi0HjTo3LTKRyISH4lDEWz5iCrTI
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="254395508"
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="254395508"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 05:02:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,173,1643702400"; 
   d="scan'208";a="644926847"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 11 Mar 2022 05:02:04 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSeuC-0006Qi-4H; Fri, 11 Mar 2022 13:02:04 +0000
Date: Fri, 11 Mar 2022 21:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [arm-integrator:kernel-in-vmalloc-v5.17-rc1 6/8]
 arch/arm/include/asm/memory.h:332:5: error: use of undeclared identifier
 'KERNEL_PFN_OFFSET'
Message-ID: <202203112027.GAmJRxFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v5.17-rc1
head:   66e9038ef48dc66c07b12443b73e2d1f3f12cbab
commit: 5976b9fa0b76bace6d7b038a7e1941175da8f5c5 [6/8] ARM: Compile the kernel into VMALLOC
config: arm-randconfig-r032-20220310 (https://download.01.org/0day-ci/archive/20220311/202203112027.GAmJRxFY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=5976b9fa0b76bace6d7b038a7e1941175da8f5c5
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v5.17-rc1
        git checkout 5976b9fa0b76bace6d7b038a7e1941175da8f5c5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:11:
   In file included from include/linux/sched.h:12:
   In file included from arch/arm/include/asm/current.h:50:
   In file included from include/asm-generic/current.h:5:
   In file included from include/linux/thread_info.h:60:
   In file included from arch/arm/include/asm/thread_info.h:14:
   In file included from arch/arm/include/asm/page.h:160:
>> arch/arm/include/asm/memory.h:332:5: error: use of undeclared identifier 'KERNEL_PFN_OFFSET'
                                   KERNEL_PFN_OFFSET);
                                   ^
   1 error generated.
   make[2]: *** [scripts/Makefile.build:121: arch/arm/kernel/asm-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1191: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/KERNEL_PFN_OFFSET +332 arch/arm/include/asm/memory.h

   322	
   323	static inline unsigned long virt_to_pfn(unsigned long kaddr)
   324	{
   325		if (!IS_ENABLED(CONFIG_ARM_KERNEL_IN_VMALLOC)) {
   326			return (((kaddr - PAGE_OFFSET) >> PAGE_SHIFT) +
   327				PHYS_PFN_OFFSET);
   328		} else {
   329			if ((kaddr >= KERNEL_OFFSET) &&
   330			    (kaddr < (KERNEL_OFFSET + KERNEL_SECTION_SIZE))) {
   331				return (((kaddr - KERNEL_OFFSET) >> PAGE_SHIFT) +
 > 332					KERNEL_PFN_OFFSET);
   333			} else {
   334				return (((kaddr - PAGE_OFFSET) >> PAGE_SHIFT) +
   335					PHYS_PFN_OFFSET);
   336			}
   337		}
   338	}
   339	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
