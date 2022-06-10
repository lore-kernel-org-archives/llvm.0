Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C3A7C
	for <llvm@lists.linux.dev>; Fri, 10 Jun 2022 08:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654849995; x=1686385995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0R43Vz3YgifWJAlqhudrQaI0uJxRsyIjybceh/8k9UM=;
  b=i8XWfnzx+ZC53ASZpWnvovBP/5gulycKaC5l+INiBCofOYqQB07KBlaD
   kWKym65EqbTfFI4PZw7WLKybQEYv7Rg46em5gXJMQ5vjDy1CErU5oFfrH
   7Bw30LuaZG9Wn/H6D2FZHkfbZdE3cVUMpgUklKgj01qaRPzVD7t+iV+JL
   Qk/s75uMBD4ayaNs4mMWwZ6NzBtGLujvdl8tQvXyHN76PkNLU2XR9nsgj
   I67hJsuep4j6VLy/9ZdFQeS5T2pGipVvYkw+m5LKL/YZ/uKF73gwPuSxw
   mnZ15lkav192a49+NsVoZNIzClDI7G4VgLuCw64lf5Z0sQfyV8FKLVU3p
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="363890381"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="363890381"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2022 01:33:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; 
   d="scan'208";a="684432311"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2022 01:33:12 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nza4u-000H0J-4h;
	Fri, 10 Jun 2022 08:33:12 +0000
Date: Fri, 10 Jun 2022 16:32:18 +0800
From: kernel test robot <lkp@intel.com>
To: Tom <support@vamrs.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive 22/54]
 drivers/soc/sifive/sifive_l2_cache.c:142:19: warning: result of comparison
 of constant 36507222016 with expression of type 'unsigned long' is always
 false
Message-ID: <202206101615.iqFYh0RG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux visionfive
head:   906be7ef2fb9e2f1fcb740d3d506768cddfc52ca
commit: 1c9c971346b0ca811114ae00fce28cbf3c34232b [22/54] sifive/sifive_l2_cache: Add sifive_l2_flush64_range function
config: riscv-buildonly-randconfig-r006-20220609 (https://download.01.org/0day-ci/archive/20220610/202206101615.iqFYh0RG-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 70d35fe1257e429266b83025997b400e9f79110e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/esmil/linux/commit/1c9c971346b0ca811114ae00fce28cbf3c34232b
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout 1c9c971346b0ca811114ae00fce28cbf3c34232b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/soc/sifive/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/soc/sifive/sifive_l2_cache.c:152:3: error: call to undeclared function 'writeq'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   writeq(line, l2_base + SIFIVE_L2_FLUSH64);
                   ^
>> drivers/soc/sifive/sifive_l2_cache.c:142:19: warning: result of comparison of constant 36507222016 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
              (start + len) > (CONFIG_SIFIVE_L2_FLUSH_START +
              ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +142 drivers/soc/sifive/sifive_l2_cache.c

   123	
   124	#ifdef CONFIG_SIFIVE_L2_FLUSH
   125	void sifive_l2_flush64_range(unsigned long start, unsigned long len)
   126	{
   127		unsigned long line;
   128	
   129		if(!l2_base) {
   130			pr_warn("L2CACHE: base addr invalid, skipping flush\n");
   131			return;
   132		}
   133	
   134		/* TODO: if (len == 0), skipping flush or going on? */
   135		if(!len) {
   136			pr_debug("L2CACHE: flush64 range @ 0x%lx(len:0)\n", start);
   137			return;
   138		}
   139	
   140		/* make sure the address is in the range */
   141		if(start < CONFIG_SIFIVE_L2_FLUSH_START ||
 > 142		   (start + len) > (CONFIG_SIFIVE_L2_FLUSH_START +
   143				     CONFIG_SIFIVE_L2_FLUSH_SIZE)) {
   144			pr_warn("L2CACHE: flush64 out of range: %lx(%lx), skip flush\n",
   145				start, len);
   146			return;
   147		}
   148	
   149		mb();	/* sync */
   150		for (line = start; line < start + len;
   151		     line += SIFIVE_L2_FLUSH64_LINE_LEN) {
 > 152			writeq(line, l2_base + SIFIVE_L2_FLUSH64);
   153			mb();
   154		}
   155	}
   156	EXPORT_SYMBOL_GPL(sifive_l2_flush64_range);
   157	#endif
   158	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
