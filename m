Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD907E
	for <llvm@lists.linux.dev>; Wed, 27 Apr 2022 04:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651033645; x=1682569645;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+O7OU1tkX16KckSK8NHaAVY2pV900yOF3L+eIKpqjrg=;
  b=SSK1xyVAItO907UyAVAqRpchh1VJsMM8Mw79vVRIX2O6W4N6mTzC62z3
   +6JHW1ck5LPvIXmry4loLCNENExCICF4rsD8PJAHBHQrdVmv6lSz/HuNd
   YCrYJBMgyXKHdqmvoiYXAs3OcATqRabyLJ+c2be6k4ar/hPFxqxqOPYpq
   XcblKJ3jkCSmHE0TtOh78/ysd8NnoqtigMT3S0Iw7qYB6HI2eqkIln7AD
   xZdH+rudcBrr3qrQcbxIR+W3HHX656bl+fHEfhaVDC+e9Kz20k324bOVE
   3j4lk1EdnDXAk5k6dl303W0yoRMBz1XoJ4QUemHAWzMu7FshhDDjMNyAW
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265334134"
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="265334134"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2022 21:27:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,292,1643702400"; 
   d="scan'208";a="617334180"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 26 Apr 2022 21:27:23 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1njZGt-0004K3-93;
	Wed, 27 Apr 2022 04:27:23 +0000
Date: Wed, 27 Apr 2022 12:26:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Huckleberry <nhuck@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 4/8] crypto: x86/aesni-xctr: Add accelerated
 implementation of XCTR
Message-ID: <202204271241.gjp97ols-lkp@intel.com>
References: <20220427003759.1115361-5-nhuck@google.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220427003759.1115361-5-nhuck@google.com>

Hi Nathan,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on herbert-crypto-2.6/master linus/master v5.18-rc4 next-20220426]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Nathan-Huckleberry/crypto-HCTR2-support/20220427-084044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
config: i386-randconfig-a002-20220425 (https://download.01.org/0day-ci/archive/20220427/202204271241.gjp97ols-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 1cddcfdc3c683b393df1a5c9063252eb60e52818)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/00cd244c8a1bd9623a271407bf10b99c01884ef5
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Nathan-Huckleberry/crypto-HCTR2-support/20220427-084044
        git checkout 00cd244c8a1bd9623a271407bf10b99c01884ef5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/crypto/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/crypto/aesni-intel_glue.c:1287:1: warning: unused label 'unregister_aeads' [-Wunused-label]
   unregister_aeads:
   ^~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/unregister_aeads +1287 arch/x86/crypto/aesni-intel_glue.c

  1284	
  1285		return 0;
  1286	
> 1287	unregister_aeads:
  1288		simd_unregister_aeads(aesni_aeads, ARRAY_SIZE(aesni_aeads),
  1289					aesni_simd_aeads);
  1290	unregister_skciphers:
  1291		simd_unregister_skciphers(aesni_skciphers, ARRAY_SIZE(aesni_skciphers),
  1292					  aesni_simd_skciphers);
  1293	unregister_cipher:
  1294		crypto_unregister_alg(&aesni_cipher_alg);
  1295		return err;
  1296	}
  1297	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
