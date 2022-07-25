Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31DD372
	for <llvm@lists.linux.dev>; Mon, 25 Jul 2022 05:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658725511; x=1690261511;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RId4tYUzT4uCGM3S8yyfnve2MhIgzCeQ3nPL7rhNPrI=;
  b=SyIVNyLLYV15YKegrMqQSfxRQ3y1I36/87KlnCclXF3kcQ9dI+3rCGnu
   4TD14gNRCMYG9/LAlD1t1qg5MGD4yXdqfx878DletX5Kwv6MDGjfJL5ew
   aMM8rI1mogUlweqL5qxbweFzIrDTUdDoi/k299joxAlQtorAEudlVsQEH
   mISBx70eAvmGH+4MyRhTJoW8xLLZy1qYU/uhqCVWz+GqJWpDVkPSn3UDf
   uM3KiyrT3RzdbVSiH+bG1bNSr/GaqHV6QXAIrQ/xnvMage0n1fpiaTEbr
   raClBwszNDpNXsvhrqWeo+29dk93bILf1bUfvYL07NmpFgsQoccadlayX
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="313357999"
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="313357999"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2022 22:05:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,191,1654585200"; 
   d="scan'208";a="632221859"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jul 2022 22:05:00 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oFqH6-0004kd-0Y;
	Mon, 25 Jul 2022 05:05:00 +0000
Date: Mon, 25 Jul 2022 13:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: [linux-next:master 1663/12552] lib/crypto/blake2s-selftest.c:548:13:
 warning: stack frame size (1120) exceeds limit (1024) in 'blake2s_selftest'
Message-ID: <202207251313.gKhpElEq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   18c107a1f120d095404d141dfad8f594bdc44020
commit: 2d16803c562ecc644803d42ba98a8e0aef9c014e [1663/12552] crypto: blake2s - remove shash module
config: mips-randconfig-c004-20220724 (https://download.01.org/0day-ci/archive/20220725/202207251313.gKhpElEq-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 12fbd2d377e396ad61bce56d71c98a1eb1bebfa9)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2d16803c562ecc644803d42ba98a8e0aef9c014e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2d16803c562ecc644803d42ba98a8e0aef9c014e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash lib/crypto/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/crypto/blake2s-selftest.c:548:13: warning: stack frame size (1120) exceeds limit (1024) in 'blake2s_selftest' [-Wframe-larger-than]
   bool __init blake2s_selftest(void)
               ^
   1 warning generated.


vim +/blake2s_selftest +548 lib/crypto/blake2s-selftest.c

66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  547  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08 @548  bool __init blake2s_selftest(void)
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  549  {
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  550  	u8 key[BLAKE2S_KEY_SIZE];
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  551  	u8 buf[ARRAY_SIZE(blake2s_testvecs)];
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  552  	u8 hash[BLAKE2S_HASH_SIZE];
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  553  	struct blake2s_state state;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  554  	bool success = true;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  555  	int i, l;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  556  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  557  	key[0] = key[1] = 1;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  558  	for (i = 2; i < sizeof(key); ++i)
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  559  		key[i] = key[i - 2] + key[i - 1];
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  560  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  561  	for (i = 0; i < sizeof(buf); ++i)
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  562  		buf[i] = (u8)i;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  563  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  564  	for (i = l = 0; i < ARRAY_SIZE(blake2s_testvecs); l = (l + 37) % ++i) {
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  565  		int outlen = 1 + i % BLAKE2S_HASH_SIZE;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  566  		int keylen = (13 * i) % (BLAKE2S_KEY_SIZE + 1);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  567  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  568  		blake2s(hash, buf, key + BLAKE2S_KEY_SIZE - keylen, outlen, i,
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  569  			keylen);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  570  		if (memcmp(hash, blake2s_testvecs[i], outlen)) {
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  571  			pr_err("blake2s self-test %d: FAIL\n", i + 1);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  572  			success = false;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  573  		}
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  574  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  575  		if (!keylen)
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  576  			blake2s_init(&state, outlen);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  577  		else
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  578  			blake2s_init_key(&state, outlen,
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  579  					 key + BLAKE2S_KEY_SIZE - keylen,
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  580  					 keylen);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  581  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  582  		blake2s_update(&state, buf, l);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  583  		blake2s_update(&state, buf + l, i - l);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  584  		blake2s_final(&state, hash);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  585  		if (memcmp(hash, blake2s_testvecs[i], outlen)) {
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  586  			pr_err("blake2s init/update/final self-test %d: FAIL\n",
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  587  			       i + 1);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  588  			success = false;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  589  		}
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  590  	}
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  591  
2d16803c562ecc Jason A. Donenfeld 2022-05-28  592  	for (i = 0; i < 32; ++i) {
2d16803c562ecc Jason A. Donenfeld 2022-05-28  593  		enum { TEST_ALIGNMENT = 16 };
2d16803c562ecc Jason A. Donenfeld 2022-05-28  594  		u8 unaligned_block[BLAKE2S_BLOCK_SIZE + TEST_ALIGNMENT - 1]
2d16803c562ecc Jason A. Donenfeld 2022-05-28  595  					__aligned(TEST_ALIGNMENT);
2d16803c562ecc Jason A. Donenfeld 2022-05-28  596  		u8 blocks[BLAKE2S_BLOCK_SIZE * 3];
2d16803c562ecc Jason A. Donenfeld 2022-05-28  597  		struct blake2s_state state1, state2;
2d16803c562ecc Jason A. Donenfeld 2022-05-28  598  
2d16803c562ecc Jason A. Donenfeld 2022-05-28  599  		get_random_bytes(blocks, sizeof(blocks));
2d16803c562ecc Jason A. Donenfeld 2022-05-28  600  		get_random_bytes(&state, sizeof(state));
2d16803c562ecc Jason A. Donenfeld 2022-05-28  601  

:::::: The code at line 548 was first introduced by commit
:::::: 66d7fb94e4ffe5acc589e0b2b4710aecc1f07a28 crypto: blake2s - generic C library implementation and selftest

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
