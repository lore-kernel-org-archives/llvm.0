Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78717E5;
	Thu,  2 Feb 2023 02:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675303624; x=1706839624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKehjncn8yXkXD55skykzjXPCcfnt/Ux2/8e2Tj/HdM=;
  b=f9g2S6y6Bu+I0ByBCjJ4OwwnWgJGfkcXWSrg5hz086E0TpVRvcFRrt0w
   syCCRbYjbJSavfGe0Whn7k8n40xDe3/TRtEa8uSynMayJWrw0tpCa4279
   Z3z6vDps/CatkWBgvA/i7Sfo0BTE/FMbM3PYST6O9tWVu9vi8u6W+u5tV
   ArtWOMx+l0U9sqkAoTKjapYRLSmCfK01KihL+qaD41H5eVI5PAVXeMm17
   +m+VKAxWr7F6nmV14GczZ3BrIx/d6eg/jiKBrGwSlpi8VNJXeTMSv6c7v
   2ecaQlGLx1nq/bNt8Thj+ICjAJlCdXjmNNnSX6ppUVsvrQnpfrn7OTJsX
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="326028773"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="326028773"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 18:07:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="993900137"
X-IronPort-AV: E=Sophos;i="5.97,266,1669104000"; 
   d="scan'208";a="993900137"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Feb 2023 18:07:03 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNP0A-00061V-1d;
	Thu, 02 Feb 2023 02:07:02 +0000
Date: Thu, 2 Feb 2023 10:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3 18/25]
 arch/riscv/mm/physaddr.c:28:15: error: use of undeclared identifier
 '__phys_addr_symbol'
Message-ID: <202302021035.rerDlVUa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3
head:   ac3cfb78163256f2febd47ebd017d9f5b75820dd
commit: d047dc9f56633d427434d6593fce94cf1190abe8 [18/25] riscv: Make virt_to_pfn() a real function
config: riscv-randconfig-r042-20230130 (https://download.01.org/0day-ci/archive/20230202/202302021035.rerDlVUa-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=d047dc9f56633d427434d6593fce94cf1190abe8
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3
        git checkout d047dc9f56633d427434d6593fce94cf1190abe8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/riscv/mm/physaddr.c:15:13: error: expected identifier or '('
   phys_addr_t __phys_addr_symbol(unsigned long x)
               ^
   arch/riscv/include/asm/page.h:154:31: note: expanded from macro '__phys_addr_symbol'
   #define __phys_addr_symbol(x)   __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:142:32: note: expanded from macro '__va_to_pa_nodebug'
   #define __va_to_pa_nodebug(x)   ({                                              \
                                    ^
   arch/riscv/mm/physaddr.c:15:13: error: expected ')'
   arch/riscv/include/asm/page.h:154:31: note: expanded from macro '__phys_addr_symbol'
   #define __phys_addr_symbol(x)   __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:142:32: note: expanded from macro '__va_to_pa_nodebug'
   #define __va_to_pa_nodebug(x)   ({                                              \
                                    ^
   arch/riscv/mm/physaddr.c:15:13: note: to match this '('
   arch/riscv/include/asm/page.h:154:31: note: expanded from macro '__phys_addr_symbol'
   #define __phys_addr_symbol(x)   __va_to_pa_nodebug(x)
                                   ^
   arch/riscv/include/asm/page.h:142:31: note: expanded from macro '__va_to_pa_nodebug'
   #define __va_to_pa_nodebug(x)   ({                                              \
                                   ^
>> arch/riscv/mm/physaddr.c:28:15: error: use of undeclared identifier '__phys_addr_symbol'
   EXPORT_SYMBOL(__phys_addr_symbol);
                 ^
   3 errors generated.


vim +/__phys_addr_symbol +28 arch/riscv/mm/physaddr.c

6435f773d81f021 Zong Li         2020-01-02  14  
6435f773d81f021 Zong Li         2020-01-02  15  phys_addr_t __phys_addr_symbol(unsigned long x)
6435f773d81f021 Zong Li         2020-01-02  16  {
658e2c5125bbbc9 Alexandre Ghiti 2021-06-17  17  	unsigned long kernel_start = kernel_map.virt_addr;
0c49688174f5347 Samuel Holland  2022-11-26  18  	unsigned long kernel_end = kernel_start + kernel_map.size;
6435f773d81f021 Zong Li         2020-01-02  19  
6435f773d81f021 Zong Li         2020-01-02  20  	/*
6435f773d81f021 Zong Li         2020-01-02  21  	 * Boundary checking aginst the kernel image mapping.
6435f773d81f021 Zong Li         2020-01-02  22  	 * __pa_symbol should only be used on kernel symbol addresses.
6435f773d81f021 Zong Li         2020-01-02  23  	 */
6435f773d81f021 Zong Li         2020-01-02  24  	VIRTUAL_BUG_ON(x < kernel_start || x > kernel_end);
6435f773d81f021 Zong Li         2020-01-02  25  
6435f773d81f021 Zong Li         2020-01-02  26  	return __va_to_pa_nodebug(x);
6435f773d81f021 Zong Li         2020-01-02  27  }
6435f773d81f021 Zong Li         2020-01-02 @28  EXPORT_SYMBOL(__phys_addr_symbol);

:::::: The code at line 28 was first introduced by commit
:::::: 6435f773d81f02193228685a7e3fe65c983c5de0 riscv: mm: add support for CONFIG_DEBUG_VIRTUAL

:::::: TO: Zong Li <zong.li@sifive.com>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
