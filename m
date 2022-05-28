Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8672564
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 13:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653745301; x=1685281301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=msNSCCMmakOCPThvjj3sP07AO+iN2SqL77cXRWsmt00=;
  b=KaOtyB9EKKvfRTo0kX9CJf/fWnQ9zw1/H0tKN9zppq8No7GYZjjq1zn3
   2cqZBDLRxnJiwDt/BbQ8Lq3Gz0xbExuNHy+wB2OFqauUnfnz63/j/O4oT
   d80ioGBPpThd6z23/JEhuhuvktuSvad2dtI34f9pihvl+jO1RywDLOPx5
   C4Bg40xtrILOp8NkqWFQpyzbvFEPndQqXrbTtO2D/nmq8c/z38QAx7eW6
   U5ReCAJGv7t+M/XqAQXN7otdOOi4JsqD/sAaVDSpMTOpVcCjqBalJHnVU
   +rvO/wH8tDVzB33/kc4OBVRbH55ILwVAUcwY40JVuAVie0M/o3OHoxVlh
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="274681911"
X-IronPort-AV: E=Sophos;i="5.91,258,1647327600"; 
   d="scan'208";a="274681911"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2022 06:41:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,258,1647327600"; 
   d="scan'208";a="705554276"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 May 2022 06:41:38 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nuwhG-0000Ee-4P;
	Sat, 28 May 2022 13:41:38 +0000
Date: Sat, 28 May 2022 21:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, 0day robot <lkp@intel.com>
Subject: lib/crypto/blake2s-selftest.c:548:13: warning: stack frame size
 (1128) exceeds limit (1024) in 'blake2s_selftest'
Message-ID: <202205282100.bU9SnP9m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20220528-180939/Jason-A-Donenfeld/crypto-blake2s-remove-shash-module/20220526-172214
head:   54e31fb223170c2e7f3a6c3b1f3b438e32788f43
commit: 54e31fb223170c2e7f3a6c3b1f3b438e32788f43 crypto: blake2s - remove shash module
date:   3 hours ago
config: hexagon-randconfig-r041-20220527 (https://download.01.org/0day-ci/archive/20220528/202205282100.bU9SnP9m-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/54e31fb223170c2e7f3a6c3b1f3b438e32788f43
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review UPDATE-20220528-180939/Jason-A-Donenfeld/crypto-blake2s-remove-shash-module/20220526-172214
        git checkout 54e31fb223170c2e7f3a6c3b1f3b438e32788f43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash lib/crypto/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> lib/crypto/blake2s-selftest.c:548:13: warning: stack frame size (1128) exceeds limit (1024) in 'blake2s_selftest' [-Wframe-larger-than]
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
54e31fb223170c Jason A. Donenfeld 2022-05-28  592  	for (i = 0; i < 100; ++i) {
54e31fb223170c Jason A. Donenfeld 2022-05-28  593  		u8 unaligned_block[BLAKE2S_BLOCK_SIZE + sizeof(long) - 1]
54e31fb223170c Jason A. Donenfeld 2022-05-28  594  					__aligned(sizeof(long));
54e31fb223170c Jason A. Donenfeld 2022-05-28  595  		u8 blocks[BLAKE2S_BLOCK_SIZE * 4];
54e31fb223170c Jason A. Donenfeld 2022-05-28  596  		struct blake2s_state state1, state2;
54e31fb223170c Jason A. Donenfeld 2022-05-28  597  
54e31fb223170c Jason A. Donenfeld 2022-05-28  598  		get_random_bytes(blocks, sizeof(blocks));
54e31fb223170c Jason A. Donenfeld 2022-05-28  599  		get_random_bytes(&state, sizeof(state));
54e31fb223170c Jason A. Donenfeld 2022-05-28  600  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
