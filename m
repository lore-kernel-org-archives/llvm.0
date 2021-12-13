Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1D52C9E
	for <llvm@lists.linux.dev>; Mon, 13 Dec 2021 16:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639412042; x=1670948042;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qUrF6DCnAYbQ7VDaEHqREF/nZ89MsB0OivMR+pFxIn4=;
  b=MAwqkov4i6ZUdhcm86amFN5VfG7tOC/IWZ2vEEYgsq5VjHplp4X5KU5+
   FEzCWOIbjSxkluDBdzBZq+jJV3s3VDtPUli79t1b6K2M3nyXkbeCmZR6m
   MDjbSfVfbrHCwREyqfyJwvDiZQ1fiIEulYIFBFS470WEhihPsx4jiSwYR
   Dze4Lg19E5zYT9dragjx515DEvQue1dZ2LR4FeFPtvqNBEb18CG7iO3Qu
   DY6rPvL1mPN3l8fGT4SsFbADCLtMmk8LRkkcJz+9vgH2SQxR2or5uY7P1
   4NxCV4z0Z0XbxZC/oEZYP5hRFExQis5GJxjoYzRkEZ93P9yU7AFh7hxOT
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10196"; a="299548719"
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="299548719"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 08:12:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,202,1635231600"; 
   d="scan'208";a="660898513"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Dec 2021 08:12:50 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mwnwY-0006p2-22; Mon, 13 Dec 2021 16:12:50 +0000
Date: Tue, 14 Dec 2021 00:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, build@wireguard.com,
	linux-kernel@vger.kernel.org
Subject: [zx2c4-wireguard:stable 1/1]
 arch/x86/crypto/curve25519-x86_64.c:1135:15: error: passing 'const u64 *'
 (aka 'const unsigned long long *') to parameter of type 'u64 *' (aka
 'unsigned long long *') discards qualifiers
Message-ID: <202112132233.pOx31Nie-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.git stable
head:   4bd76aceb9f2887c6ddfeb1594a0ac0fe863dc7c
commit: 4bd76aceb9f2887c6ddfeb1594a0ac0fe863dc7c [1/1] crypto: x86/curve25519 - use in/out register constraints more precisely
config: x86_64-buildonly-randconfig-r004-20211213 (https://download.01.org/0day-ci/archive/20211213/202112132233.pOx31Nie-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.git/commit/?id=4bd76aceb9f2887c6ddfeb1594a0ac0fe863dc7c
        git remote add zx2c4-wireguard https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.git
        git fetch --no-tags zx2c4-wireguard stable
        git checkout 4bd76aceb9f2887c6ddfeb1594a0ac0fe863dc7c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/ drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/crypto/curve25519-x86_64.c:1135:15: error: passing 'const u64 *' (aka 'const unsigned long long *') to parameter of type 'u64 *' (aka 'unsigned long long *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           fmul(b, t00, i, tmp);
                        ^
   arch/x86/crypto/curve25519-x86_64.c:159:49: note: passing argument to parameter 'f2' here
   static inline void fmul(u64 *out, u64 *f1, u64 *f2, u64 *tmp)
                                                   ^
   arch/x86/crypto/curve25519-x86_64.c:1218:17: error: passing 'const u64 *' (aka 'const unsigned long long *') to parameter of type 'u64 *' (aka 'unsigned long long *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           fmul(tmp, tmp, x, tmp_w);
                          ^
   arch/x86/crypto/curve25519-x86_64.c:159:49: note: passing argument to parameter 'f2' here
   static inline void fmul(u64 *out, u64 *f1, u64 *f2, u64 *tmp)
                                                   ^
   arch/x86/crypto/curve25519-x86_64.c:1574:12: error: passing 'const u64 *' (aka 'const unsigned long long *') to parameter of type 'u64 *' (aka 'unsigned long long *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                           fmul(c, &table_ladder[4 * k], b, ef);
                                   ^~~~~~~~~~~~~~~~~~~~
   arch/x86/crypto/curve25519-x86_64.c:159:40: note: passing argument to parameter 'f1' here
   static inline void fmul(u64 *out, u64 *f1, u64 *f2, u64 *tmp)
                                          ^
   3 errors generated.


vim +1135 arch/x86/crypto/curve25519-x86_64.c

bb611bdfd6be34 Jason A. Donenfeld 2019-11-08  1122  
07b586fe06625b Jason A. Donenfeld 2020-01-20  1123  static void finv(u64 *o, const u64 *i, u64 *tmp)
bb611bdfd6be34 Jason A. Donenfeld 2019-11-08  1124  {
07b586fe06625b Jason A. Donenfeld 2020-01-20  1125  	u64 t1[16U] = { 0U };
07b586fe06625b Jason A. Donenfeld 2020-01-20  1126  	u64 *a0 = t1;
07b586fe06625b Jason A. Donenfeld 2020-01-20  1127  	u64 *b = t1 + (u32)4U;
07b586fe06625b Jason A. Donenfeld 2020-01-20  1128  	u64 *c = t1 + (u32)8U;
07b586fe06625b Jason A. Donenfeld 2020-01-20  1129  	u64 *t00 = t1 + (u32)12U;
07b586fe06625b Jason A. Donenfeld 2020-01-20  1130  	u64 *tmp1 = tmp;
07b586fe06625b Jason A. Donenfeld 2020-01-20  1131  	u64 *a;
07b586fe06625b Jason A. Donenfeld 2020-01-20  1132  	u64 *t0;
07b586fe06625b Jason A. Donenfeld 2020-01-20  1133  	fsquare_times(a0, i, tmp1, (u32)1U);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1134  	fsquare_times(t00, a0, tmp1, (u32)2U);
07b586fe06625b Jason A. Donenfeld 2020-01-20 @1135  	fmul(b, t00, i, tmp);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1136  	fmul(a0, b, a0, tmp);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1137  	fsquare_times(t00, a0, tmp1, (u32)1U);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1138  	fmul(b, t00, b, tmp);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1139  	fsquare_times(t00, b, tmp1, (u32)5U);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1140  	fmul(b, t00, b, tmp);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1141  	fsquare_times(t00, b, tmp1, (u32)10U);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1142  	fmul(c, t00, b, tmp);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1143  	fsquare_times(t00, c, tmp1, (u32)20U);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1144  	fmul(t00, t00, c, tmp);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1145  	fsquare_times(t00, t00, tmp1, (u32)10U);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1146  	fmul(b, t00, b, tmp);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1147  	fsquare_times(t00, b, tmp1, (u32)50U);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1148  	fmul(c, t00, b, tmp);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1149  	fsquare_times(t00, c, tmp1, (u32)100U);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1150  	fmul(t00, t00, c, tmp);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1151  	fsquare_times(t00, t00, tmp1, (u32)50U);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1152  	fmul(t00, t00, b, tmp);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1153  	fsquare_times(t00, t00, tmp1, (u32)5U);
07b586fe06625b Jason A. Donenfeld 2020-01-20  1154  	a = t1;
07b586fe06625b Jason A. Donenfeld 2020-01-20  1155  	t0 = t1 + (u32)12U;
07b586fe06625b Jason A. Donenfeld 2020-01-20  1156  	fmul(o, t0, a, tmp);
bb611bdfd6be34 Jason A. Donenfeld 2019-11-08  1157  }
bb611bdfd6be34 Jason A. Donenfeld 2019-11-08  1158  

:::::: The code at line 1135 was first introduced by commit
:::::: 07b586fe06625b0b610dc3d3a969c51913d143d4 crypto: x86/curve25519 - replace with formally verified implementation

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
