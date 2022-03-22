Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E261CA52
	for <llvm@lists.linux.dev>; Tue, 22 Mar 2022 18:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647974311; x=1679510311;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9piiOb39Mfsnkfd30y8KCGK2Ts89xnMpnuyTFirQ5bc=;
  b=CulJM9Y6Am8nLH/7aLxcpLsp7CUFbd5AzyvrYAj1mkTLVNWMUvP4AQNJ
   yd6LCLlYw5O5OJDLFpNcVQ3krxHcDYTl1c+ecLxE91nYfT/qFs9x8xUQI
   2J1qOgAUepuhVJfEq3by8+/Eljj2U14b9SVeaYHM5oxxqNqgOxkx9hIUc
   SrigGp0UN5HN8X3m97EByxB2K68ABjwWsaOweX2qb5EhRqeT/BWLQgfUp
   Us4ajKVSBOaWzHwzDpaQTDm+/AEQ8Cavq7xW0RJTDPKpBN24Ex5LqgNhy
   v55xgrGl1c7MrQamR+PhrulAdRm9LvYSoy4yeXqJdlzYx0NNjiDtIQzAn
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="237858704"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="237858704"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2022 11:38:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; 
   d="scan'208";a="519019156"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 22 Mar 2022 11:38:29 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWjOm-000JAq-Jd; Tue, 22 Mar 2022 18:38:28 +0000
Date: Wed, 23 Mar 2022 02:38:25 +0800
From: kernel test robot <lkp@intel.com>
To: Tom <support@vamrs.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [esmil:visionfive 29/61] drivers/soc/sifive/sifive_l2_cache.c:152:3:
 error: implicit declaration of function 'writeq'
Message-ID: <202203230258.Jcxld0wh-lkp@intel.com>
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
head:   243ce759ed5821edf38bf93ce7325e232b805547
commit: 5a2aff3930cd923322a7bcd0b50f9077166ec562 [29/61] sifive/sifive_l2_cache: Add sifive_l2_flush64_range function
config: riscv-buildonly-randconfig-r006-20220320 (https://download.01.org/0day-ci/archive/20220323/202203230258.Jcxld0wh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/esmil/linux/commit/5a2aff3930cd923322a7bcd0b50f9077166ec562
        git remote add esmil https://github.com/esmil/linux
        git fetch --no-tags esmil visionfive
        git checkout 5a2aff3930cd923322a7bcd0b50f9077166ec562
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kvm/ drivers/soc/sifive/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/soc/sifive/sifive_l2_cache.c:152:3: error: implicit declaration of function 'writeq' [-Werror,-Wimplicit-function-declaration]
                   writeq(line, l2_base + SIFIVE_L2_FLUSH64);
                   ^
>> drivers/soc/sifive/sifive_l2_cache.c:142:19: warning: result of comparison of constant 36507222016 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
              (start + len) > (CONFIG_SIFIVE_L2_FLUSH_START +
              ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +/writeq +152 drivers/soc/sifive/sifive_l2_cache.c

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
