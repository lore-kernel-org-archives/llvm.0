Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C66168
	for <llvm@lists.linux.dev>; Mon, 24 Jan 2022 19:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643052310; x=1674588310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kw/Pqxn4zzEA3FRO8NnV1FqsGwZ/uPeuzfjR4yCnkRg=;
  b=l6eFG9EffzwRfoqzc5Z99OmB83oNfsV0FBPwA9fc0YrPRWWfMhbcCi8E
   xoMyYzrKvTi4bhqtcexp+qxSaxagjNGzrLCR5ChgC6rAOH0oLomINsAqd
   /bOwuj59FUIvccsm6opYh4hZDW4I8IZid6fjHGol0ji/SrFwA2lA4IuuJ
   DxJOys/w3h7q44TMzdtB4FVkYjw/fsQ6TZZEMmu8k7+ASZuWR4q4f4lPv
   krrNx0qbHbd0/mYoMhSnRPfcGDO/DnNF2vuRMUryPclTVNOdmorOB9MlS
   0afUXmzxa5NYJdUV7z8AFJ2AKfwYl6f/MKyBNc5V1LrImvOAt8eQpd5hK
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="306843200"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="306843200"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2022 11:25:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; 
   d="scan'208";a="624197286"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Jan 2022 11:25:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nC4xa-000IoX-Ry; Mon, 24 Jan 2022 19:25:02 +0000
Date: Tue, 25 Jan 2022 03:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [esmil:visionfive 59/63]
 drivers/soc/sifive/sifive_l2_cache.c:148:19: warning: result of comparison
 of constant 36507222016 with expression of type 'unsigned long' is always
 false
Message-ID: <202201250206.q2ugUJBE-lkp@intel.com>
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
head:   fdbe623707a8f3f9b9d2cb3c4c240299a12b8302
commit: c17f07c367229d46348e9005d004d8b3416637bc [59/63] RISC-V: Enable SIFIVE_L2_FLUSH for StarFive SoCs
config: riscv-randconfig-r015-20220124 (https://download.01.org/0day-ci/archive/20220125/202201250206.q2ugUJBE-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7b3d30728816403d1fd73cc5082e9fb761262bce)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/c17f07c367229d46348e9005d004d8b3416637bc
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout c17f07c367229d46348e9005d004d8b3416637bc
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/sifive/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/soc/sifive/sifive_l2_cache.c:158:3: error: implicit declaration of function 'writeq' [-Werror,-Wimplicit-function-declaration]
                   writeq(line, l2_base + SIFIVE_L2_FLUSH64);
                   ^
>> drivers/soc/sifive/sifive_l2_cache.c:148:19: warning: result of comparison of constant 36507222016 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
              (start + len) > (CONFIG_SIFIVE_L2_FLUSH_START +
              ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +148 drivers/soc/sifive/sifive_l2_cache.c

a967a289f16969 arch/riscv/mm/sifive_l2_cache.c      Yash Shah          2019-05-06  126  
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  127  #ifdef CONFIG_SIFIVE_L2_FLUSH
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  128  void sifive_l2_flush64_range(unsigned long start, unsigned long len)
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  129  {
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  130  	unsigned long line;
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  131  
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  132  	if(!l2_base) {
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  133  		pr_warn("L2CACHE: base addr invalid, skipping flush\n");
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  134  		return;
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  135  	}
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  136  
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  137  	/* TODO: if (len == 0), skipping flush or going on? */
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  138  	if(!len) {
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  139  		pr_debug("L2CACHE: flush64 range @ 0x%lx(len:0)\n", start);
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  140  		return;
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  141  	}
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  142  
0684fe29f5de5f drivers/soc/sifive/sifive_l2_cache.c Atish Patra        2021-06-12  143  	len = len + (start % SIFIVE_L2_FLUSH64_LINE_LEN);
0684fe29f5de5f drivers/soc/sifive/sifive_l2_cache.c Atish Patra        2021-06-12  144  	start = ALIGN_DOWN(start, SIFIVE_L2_FLUSH64_LINE_LEN);
0684fe29f5de5f drivers/soc/sifive/sifive_l2_cache.c Atish Patra        2021-06-12  145  
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  146  	/* make sure the address is in the range */
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  147  	if(start < CONFIG_SIFIVE_L2_FLUSH_START ||
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08 @148  	   (start + len) > (CONFIG_SIFIVE_L2_FLUSH_START +
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  149  			     CONFIG_SIFIVE_L2_FLUSH_SIZE)) {
b5cf3456431952 drivers/soc/sifive/sifive_l2_cache.c Geert Uytterhoeven 2021-05-21  150  		WARN(1, "L2CACHE: flush64 out of range: %lx(%lx), skip flush\n",
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  151  		     start, len);
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  152  		return;
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  153  	}
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  154  
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  155  	mb();	/* sync */
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  156  	for (line = start; line < start + len;
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  157  	     line += SIFIVE_L2_FLUSH64_LINE_LEN) {
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  158  		writeq(line, l2_base + SIFIVE_L2_FLUSH64);
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  159  		mb();
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  160  	}
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  161  }
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  162  EXPORT_SYMBOL_GPL(sifive_l2_flush64_range);
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  163  #endif
c6649e71d37210 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  164  

:::::: The code at line 148 was first introduced by commit
:::::: c6649e71d37210bc4c33eada849aeda98c823de9 sifive/sifive_l2_cache: Add sifive_l2_flush64_range function

:::::: TO: Tom <support@vamrs.com>
:::::: CC: Emil Renner Berthing <kernel@esmil.dk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
