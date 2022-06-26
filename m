Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680F97A
	for <llvm@lists.linux.dev>; Sun, 26 Jun 2022 02:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656209146; x=1687745146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mCarAyWC+otJD1oXPZsVsSW56BCUzmm6bXZLmfj9BZw=;
  b=kwPLRPk6RHD0JWZyr+PC9OSpl1wqnCDgaD0iG192Jr+wzk8DBuHWT0N9
   csUNcPKEnWN2gsOJa6Zr40ouboRG03jB0jLZNN728Y87DzFGkfZNWNFAK
   NZS9fcJd+o+SV811/j1TOZsZJo2I75M3cnlwwNaUgZziCExB2jQ/oTHFN
   24JmOQVlZydqqTu9pPW2yp1fAdiLngw51eKVaXH2/pz7lyKa/KIu87WAj
   +lR/HixRqWbLHUWDIFgc3C8R8w7u53oec1RjONU0q33YC/5AatZdeD6SV
   6l0T0xE5LvqkSRR2oDjM1OztPCuNXE4eGEbAoq4UBerq2zCHD8hQfo6Zr
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10389"; a="282326127"
X-IronPort-AV: E=Sophos;i="5.92,223,1650956400"; 
   d="scan'208";a="282326127"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2022 19:05:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,223,1650956400"; 
   d="scan'208";a="835665819"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jun 2022 19:05:44 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o5Heh-0006bf-MN;
	Sun, 26 Jun 2022 02:05:43 +0000
Date: Sun, 26 Jun 2022 10:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [norov:fns 24/24] lib/test_bitmap.c:226:30: error: use of undeclared
 identifier 'EXP1_IN_BITS'
Message-ID: <202206260952.cf6IJRdW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux fns
head:   c6f11d769095eb58ae2f05e3df1d8e71b7ccc5d7
commit: c6f11d769095eb58ae2f05e3df1d8e71b7ccc5d7 [24/24] fixes
config: arm64-randconfig-r015-20220626
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b0d6dd3905db145853c7c744ac92d49b00b1fa20)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/norov/linux/commit/c6f11d769095eb58ae2f05e3df1d8e71b7ccc5d7
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov fns
        git checkout c6f11d769095eb58ae2f05e3df1d8e71b7ccc5d7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> lib/test_bitmap.c:226:30: error: use of undeclared identifier 'EXP1_IN_BITS'
           for_each_set_bit(bit, exp1, EXP1_IN_BITS) {
                                       ^
>> lib/test_bitmap.c:226:30: error: use of undeclared identifier 'EXP1_IN_BITS'
>> lib/test_bitmap.c:226:30: error: use of undeclared identifier 'EXP1_IN_BITS'
   lib/test_bitmap.c:227:26: error: use of undeclared identifier 'EXP1_IN_BITS'
                   b = find_nth_bit(exp1, EXP1_IN_BITS, ++cnt);
                                          ^
   lib/test_bitmap.c:234:46: error: use of undeclared identifier 'EXP1_IN_BITS'
           const unsigned long w = bitmap_weight(exp1, EXP1_IN_BITS);
                                                       ^
   lib/test_bitmap.c:237:26: error: use of undeclared identifier 'EXP1_IN_BITS'
           for (start = 0; start < EXP1_IN_BITS; start++) {
                                   ^
   lib/test_bitmap.c:240:36: error: use of undeclared identifier 'EXP1_IN_BITS'
                   for_each_set_bit_wrap(bit, exp1, EXP1_IN_BITS, start)
                                                    ^
   lib/test_bitmap.c:240:36: error: use of undeclared identifier 'EXP1_IN_BITS'
   lib/test_bitmap.c:240:36: error: use of undeclared identifier 'EXP1_IN_BITS'
   9 errors generated.


vim +/EXP1_IN_BITS +226 lib/test_bitmap.c

   221	
   222	static void __init test_find_nth_bit(void)
   223	{
   224		unsigned long b, bit, cnt = 0;
   225	
 > 226		for_each_set_bit(bit, exp1, EXP1_IN_BITS) {
   227			b = find_nth_bit(exp1, EXP1_IN_BITS, ++cnt);
   228			expect_eq_uint(b, bit);
   229		}
   230	}
   231	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
