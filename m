Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDC42CA5
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 22:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657231869; x=1688767869;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZyfBP5VbWE199fXScQnBmk8WDKbSp3PmyUauJNuNyU=;
  b=YqcQGRIjR0u0DYbxny95q2pZpRkR5kdb19uxGtjF/BcudO4D725o1PM7
   WUQjb9KV+Qzn6yEhw/uiYlI5YMhOcynmIe9o8JQi1/Jv3lHHvgdIRbm1u
   ygJma1DWOu3ImMDZsIZyOAWGjYisPQGRU9FAPgert5nEMiqljNITmWZoA
   RYL2DkuZLM+xLt+Sqr2iV4nIFlXFoLntBidBRQv7NM/ihMOtDi+xAbPPi
   /7uMzwDRfu9ccl+EbPN8SwYii5RoPiJVj+gVZVYqspwGeKy2txQQnfvwu
   cMuZPeHEfLlXKd2pCiTu4J4COvt8babh2QEdtXWGPeolZosBj/GzJd8Ac
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="282884929"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="282884929"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 15:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="736125644"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2022 15:11:06 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9ZiE-000MWY-2S;
	Thu, 07 Jul 2022 22:11:06 +0000
Date: Fri, 8 Jul 2022 06:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [arnd-asm-generic:asm-generic-fixes 1/1] drivers/char/mem.c:66:9:
 error: call to undeclared function 'devmem_is_allowed'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202207080606.J3uB2s10-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git asm-generic-fixes
head:   cdfde8f61a004fa5797d40581077603c142adca1
commit: cdfde8f61a004fa5797d40581077603c142adca1 [1/1] asm-generic: correct reference to GENERIC_LIB_DEVMEM_IS_ALLOWED
config: riscv-randconfig-r035-20220707 (https://download.01.org/0day-ci/archive/20220708/202207080606.J3uB2s10-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 66ae1d60bb278793fd651cece264699d522bab84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git/commit/?id=cdfde8f61a004fa5797d40581077603c142adca1
        git remote add arnd-asm-generic https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
        git fetch --no-tags arnd-asm-generic asm-generic-fixes
        git checkout cdfde8f61a004fa5797d40581077603c142adca1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/char/ drivers/hwmon/pmbus/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/char/mem.c:66:9: error: call to undeclared function 'devmem_is_allowed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return devmem_is_allowed(pfn);
                  ^
   drivers/char/mem.c:66:9: note: did you mean 'page_is_allowed'?
   drivers/char/mem.c:64:19: note: 'page_is_allowed' declared here
   static inline int page_is_allowed(unsigned long pfn)
                     ^
   drivers/char/mem.c:75:8: error: call to undeclared function 'devmem_is_allowed'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   if (!devmem_is_allowed(pfn))
                        ^
   2 errors generated.


vim +/devmem_is_allowed +66 drivers/char/mem.c

^1da177e4c3f415 Linus Torvalds   2005-04-16  62  
d092633bff3b19f Ingo Molnar      2008-07-18  63  #ifdef CONFIG_STRICT_DEVMEM
a4866aa812518ed Kees Cook        2017-04-05  64  static inline int page_is_allowed(unsigned long pfn)
a4866aa812518ed Kees Cook        2017-04-05  65  {
a4866aa812518ed Kees Cook        2017-04-05 @66  	return devmem_is_allowed(pfn);
a4866aa812518ed Kees Cook        2017-04-05  67  }
e2beb3eae627211 Venki Pallipadi  2008-03-06  68  static inline int range_is_allowed(unsigned long pfn, unsigned long size)
ae531c26c5c2a28 Arjan van de Ven 2008-04-24  69  {
e2beb3eae627211 Venki Pallipadi  2008-03-06  70  	u64 from = ((u64)pfn) << PAGE_SHIFT;
e2beb3eae627211 Venki Pallipadi  2008-03-06  71  	u64 to = from + size;
e2beb3eae627211 Venki Pallipadi  2008-03-06  72  	u64 cursor = from;
e2beb3eae627211 Venki Pallipadi  2008-03-06  73  
e2beb3eae627211 Venki Pallipadi  2008-03-06  74  	while (cursor < to) {
39380b80d727232 Jiri Kosina      2016-07-08  75  		if (!devmem_is_allowed(pfn))
ae531c26c5c2a28 Arjan van de Ven 2008-04-24  76  			return 0;
e2beb3eae627211 Venki Pallipadi  2008-03-06  77  		cursor += PAGE_SIZE;
e2beb3eae627211 Venki Pallipadi  2008-03-06  78  		pfn++;
ae531c26c5c2a28 Arjan van de Ven 2008-04-24  79  	}
ae531c26c5c2a28 Arjan van de Ven 2008-04-24  80  	return 1;
ae531c26c5c2a28 Arjan van de Ven 2008-04-24  81  }
ae531c26c5c2a28 Arjan van de Ven 2008-04-24  82  #else
a4866aa812518ed Kees Cook        2017-04-05  83  static inline int page_is_allowed(unsigned long pfn)
a4866aa812518ed Kees Cook        2017-04-05  84  {
a4866aa812518ed Kees Cook        2017-04-05  85  	return 1;
a4866aa812518ed Kees Cook        2017-04-05  86  }
e2beb3eae627211 Venki Pallipadi  2008-03-06  87  static inline int range_is_allowed(unsigned long pfn, unsigned long size)
ae531c26c5c2a28 Arjan van de Ven 2008-04-24  88  {
ae531c26c5c2a28 Arjan van de Ven 2008-04-24  89  	return 1;
ae531c26c5c2a28 Arjan van de Ven 2008-04-24  90  }
ae531c26c5c2a28 Arjan van de Ven 2008-04-24  91  #endif
ae531c26c5c2a28 Arjan van de Ven 2008-04-24  92  

:::::: The code at line 66 was first introduced by commit
:::::: a4866aa812518ed1a37d8ea0c881dc946409de94 mm: Tighten x86 /dev/mem with zeroing reads

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
