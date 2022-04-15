Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CA97B
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 09:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650014728; x=1681550728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f10CJHYn2bemMnWK8B/1YUsnsoS7c0zQ4Liyr9UQtDg=;
  b=Xb1sYrqZ4gd7WpYEnXatRE2vlmTTk8pklLk64Ohv/N2kp6+Vu9jaszkg
   aIJNlabY7XSOaAYsuIDC1gBjTr5Wmgd9CZPtE4Lr1xSGmAC3/v7t+e6vK
   TrGHO0rVZQzHMGWy8JRAgM6jcH8eZHRt87De7uQPeezzDJtoDMmA23v/d
   6FT6iT6JjESF8mzLvGUPfaRfL9r81FoP7PrARbmZDAjYDhKddakN0xN8p
   rEX4OQ/s9+s0aS4lGyRIWkmONn5mI8YGluB34UO2QbA0GPKfbB7J5/DQL
   1YgfuRDjLVPPuHxFz+dezBjykXsPGrFxow8tzq1s3MHqYDnimRwCgVtKC
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="326030912"
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; 
   d="scan'208";a="326030912"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 02:25:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,262,1643702400"; 
   d="scan'208";a="725711892"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Apr 2022 02:25:26 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfICj-0001nZ-Oe;
	Fri, 15 Apr 2022 09:25:25 +0000
Date: Fri, 15 Apr 2022 17:24:56 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [esmil:visionfive 50/54]
 drivers/soc/sifive/sifive_l2_cache.c:148:19: warning: result of comparison
 of constant 36507222016 with expression of type 'unsigned long' is always
 false
Message-ID: <202204151722.kW2xaxTy-lkp@intel.com>
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
head:   4d0bf74de3a2e2bb05b6c110d3b258d005430d7f
commit: 44b4542801a3eef74aee528fcb2799afc57e5c82 [50/54] RISC-V: Enable SIFIVE_L2_FLUSH for StarFive SoCs
config: riscv-randconfig-c006-20220414 (https://download.01.org/0day-ci/archive/20220415/202204151722.kW2xaxTy-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/44b4542801a3eef74aee528fcb2799afc57e5c82
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout 44b4542801a3eef74aee528fcb2799afc57e5c82
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/sifive/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/soc/sifive/sifive_l2_cache.c:158:3: error: implicit declaration of function 'writeq' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   writeq(line, l2_base + SIFIVE_L2_FLUSH64);
                   ^
>> drivers/soc/sifive/sifive_l2_cache.c:148:19: warning: result of comparison of constant 36507222016 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
              (start + len) > (CONFIG_SIFIVE_L2_FLUSH_START +
              ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +148 drivers/soc/sifive/sifive_l2_cache.c

a967a289f16969 arch/riscv/mm/sifive_l2_cache.c      Yash Shah          2019-05-06  126  
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  127  #ifdef CONFIG_SIFIVE_L2_FLUSH
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  128  void sifive_l2_flush64_range(unsigned long start, unsigned long len)
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  129  {
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  130  	unsigned long line;
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  131  
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  132  	if(!l2_base) {
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  133  		pr_warn("L2CACHE: base addr invalid, skipping flush\n");
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  134  		return;
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  135  	}
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  136  
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  137  	/* TODO: if (len == 0), skipping flush or going on? */
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  138  	if(!len) {
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  139  		pr_debug("L2CACHE: flush64 range @ 0x%lx(len:0)\n", start);
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  140  		return;
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  141  	}
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  142  
170da5f236a1d7 drivers/soc/sifive/sifive_l2_cache.c Atish Patra        2021-06-12  143  	len = len + (start % SIFIVE_L2_FLUSH64_LINE_LEN);
170da5f236a1d7 drivers/soc/sifive/sifive_l2_cache.c Atish Patra        2021-06-12  144  	start = ALIGN_DOWN(start, SIFIVE_L2_FLUSH64_LINE_LEN);
170da5f236a1d7 drivers/soc/sifive/sifive_l2_cache.c Atish Patra        2021-06-12  145  
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  146  	/* make sure the address is in the range */
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  147  	if(start < CONFIG_SIFIVE_L2_FLUSH_START ||
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08 @148  	   (start + len) > (CONFIG_SIFIVE_L2_FLUSH_START +
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  149  			     CONFIG_SIFIVE_L2_FLUSH_SIZE)) {
56e0bd5b6b12ff drivers/soc/sifive/sifive_l2_cache.c Geert Uytterhoeven 2021-05-21  150  		WARN(1, "L2CACHE: flush64 out of range: %lx(%lx), skip flush\n",
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  151  		     start, len);
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  152  		return;
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  153  	}
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  154  
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  155  	mb();	/* sync */
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  156  	for (line = start; line < start + len;
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  157  	     line += SIFIVE_L2_FLUSH64_LINE_LEN) {
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08 @158  		writeq(line, l2_base + SIFIVE_L2_FLUSH64);
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  159  		mb();
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  160  	}
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  161  }
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  162  EXPORT_SYMBOL_GPL(sifive_l2_flush64_range);
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  163  #endif
704151e7f415c4 drivers/soc/sifive/sifive_l2_cache.c Tom                2021-01-08  164  

:::::: The code at line 148 was first introduced by commit
:::::: 704151e7f415c483a9c1854a8a0952f4f365c45d sifive/sifive_l2_cache: Add sifive_l2_flush64_range function

:::::: TO: Tom <support@vamrs.com>
:::::: CC: Emil Renner Berthing <kernel@esmil.dk>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
