Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D20F1107;
	Sat,  8 Apr 2023 10:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680950327; x=1712486327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eKHqVAL32smantM3k8Lt5d+MUOKLe+OaL0Irr/VIGVA=;
  b=ZYKUeOx++lCxMX0ixPV8tSm4qXLs09rkgFhJISaudFRvEDHZ4A1O+7b0
   gn1gX6lHFfgq7YVE4dXRK/Rqn3vPR+go/451s3uPbslAXFnU+n1/qjB4Q
   A3Fco+h95jMTzixICcRazCZAeyZbeHs7o+UUEGgJojNjmLZvXLTYnBhNr
   dt+AuprgBbsEhzhFbtUJIpzV4wqxm0xhjgmwuI76P4wH010pYUBsxxrVk
   JSLVmZrazOJB0HNghdhRqcTMLq33ZP4Er2Nf3Jto+bUXt+hF5RkAUWs2U
   f1NTWy+Z9FanQF8YvQaVl64RFxCT3vfA0QNirq4HTsfc9N3hLNdz7JrTs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="344911148"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="344911148"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 03:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="665149570"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="665149570"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Apr 2023 03:38:43 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl5y0-000Tdd-0X;
	Sat, 08 Apr 2023 10:38:44 +0000
Date: Sat, 8 Apr 2023 18:38:34 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Elliott <elliott@hpe.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: arch/arm/crypto/sha1_neon_glue.c:43:8: warning: cast from 'void
 (*)(void *, const char *, unsigned int)' to 'sha1_block_fn *' (aka 'void
 (*)(struct sha1_state *, const unsigned char *, int)') converts to
 incompatible function type
Message-ID: <202304081828.zjGcFUyE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Robert,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aa318c48808c0aa73216bd94c54c4553d3663add
commit: 4a329fecc9aaebb27a53fa7abfa53bbc2ee42f3f crypto: Kconfig - submenus for arm and arm64
date:   8 months ago
config: arm-milbeaut_m10v_defconfig (https://download.01.org/0day-ci/archive/20230408/202304081828.zjGcFUyE-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4a329fecc9aaebb27a53fa7abfa53bbc2ee42f3f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4a329fecc9aaebb27a53fa7abfa53bbc2ee42f3f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/boot/compressed/ arch/arm/crypto/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304081828.zjGcFUyE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/crypto/sha1_neon_glue.c:43:8: warning: cast from 'void (*)(void *, const char *, unsigned int)' to 'sha1_block_fn *' (aka 'void (*)(struct sha1_state *, const unsigned char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
                               (sha1_block_fn *)sha1_transform_neon);
                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/crypto/sha1_neon_glue.c:58:9: warning: cast from 'void (*)(void *, const char *, unsigned int)' to 'sha1_block_fn *' (aka 'void (*)(struct sha1_state *, const unsigned char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
                                       (sha1_block_fn *)sha1_transform_neon);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/crypto/sha1_neon_glue.c:59:30: warning: cast from 'void (*)(void *, const char *, unsigned int)' to 'sha1_block_fn *' (aka 'void (*)(struct sha1_state *, const unsigned char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
           sha1_base_do_finalize(desc, (sha1_block_fn *)sha1_transform_neon);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
>> arch/arm/crypto/sha256_neon_glue.c:38:4: warning: cast from 'void (*)(u32 *, const void *, unsigned int)' (aka 'void (*)(unsigned int *, const void *, unsigned int)') to 'sha256_block_fn *' (aka 'void (*)(struct sha256_state *, const unsigned char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
                           (sha256_block_fn *)sha256_block_data_order_neon);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/crypto/sha256_neon_glue.c:53:4: warning: cast from 'void (*)(u32 *, const void *, unsigned int)' (aka 'void (*)(unsigned int *, const void *, unsigned int)') to 'sha256_block_fn *' (aka 'void (*)(struct sha256_state *, const unsigned char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
                           (sha256_block_fn *)sha256_block_data_order_neon);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/crypto/sha256_neon_glue.c:55:4: warning: cast from 'void (*)(u32 *, const void *, unsigned int)' (aka 'void (*)(unsigned int *, const void *, unsigned int)') to 'sha256_block_fn *' (aka 'void (*)(struct sha256_state *, const unsigned char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
                           (sha256_block_fn *)sha256_block_data_order_neon);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.
--
>> arch/arm/crypto/sha512-neon-glue.c:37:3: warning: cast from 'void (*)(u64 *, const u8 *, int)' (aka 'void (*)(unsigned long long *, const unsigned char *, int)') to 'sha512_block_fn *' (aka 'void (*)(struct sha512_state *, const unsigned char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
                   (sha512_block_fn *)sha512_block_data_order_neon);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/crypto/sha512-neon-glue.c:52:4: warning: cast from 'void (*)(u64 *, const u8 *, int)' (aka 'void (*)(unsigned long long *, const unsigned char *, int)') to 'sha512_block_fn *' (aka 'void (*)(struct sha512_state *, const unsigned char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
                           (sha512_block_fn *)sha512_block_data_order_neon);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/crypto/sha512-neon-glue.c:54:3: warning: cast from 'void (*)(u64 *, const u8 *, int)' (aka 'void (*)(unsigned long long *, const unsigned char *, int)') to 'sha512_block_fn *' (aka 'void (*)(struct sha512_state *, const unsigned char *, int)') converts to incompatible function type [-Wcast-function-type-strict]
                   (sha512_block_fn *)sha512_block_data_order_neon);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   3 warnings generated.


vim +43 arch/arm/crypto/sha1_neon_glue.c

604682551aa511e Jussi Kivilinna 2014-07-29  28  
604682551aa511e Jussi Kivilinna 2014-07-29  29  asmlinkage void sha1_transform_neon(void *state_h, const char *data,
604682551aa511e Jussi Kivilinna 2014-07-29  30  				    unsigned int rounds);
604682551aa511e Jussi Kivilinna 2014-07-29  31  
604682551aa511e Jussi Kivilinna 2014-07-29  32  static int sha1_neon_update(struct shash_desc *desc, const u8 *data,
604682551aa511e Jussi Kivilinna 2014-07-29  33  			  unsigned int len)
604682551aa511e Jussi Kivilinna 2014-07-29  34  {
604682551aa511e Jussi Kivilinna 2014-07-29  35  	struct sha1_state *sctx = shash_desc_ctx(desc);
604682551aa511e Jussi Kivilinna 2014-07-29  36  
99680c5e9182945 Eric Biggers    2019-03-12  37  	if (!crypto_simd_usable() ||
51e515faa887e40 Ard Biesheuvel  2015-04-09  38  	    (sctx->count % SHA1_BLOCK_SIZE) + len < SHA1_BLOCK_SIZE)
51e515faa887e40 Ard Biesheuvel  2015-04-09  39  		return sha1_update_arm(desc, data, len);
604682551aa511e Jussi Kivilinna 2014-07-29  40  
604682551aa511e Jussi Kivilinna 2014-07-29  41  	kernel_neon_begin();
51e515faa887e40 Ard Biesheuvel  2015-04-09  42  	sha1_base_do_update(desc, data, len,
51e515faa887e40 Ard Biesheuvel  2015-04-09 @43  			    (sha1_block_fn *)sha1_transform_neon);
604682551aa511e Jussi Kivilinna 2014-07-29  44  	kernel_neon_end();
604682551aa511e Jussi Kivilinna 2014-07-29  45  
604682551aa511e Jussi Kivilinna 2014-07-29  46  	return 0;
604682551aa511e Jussi Kivilinna 2014-07-29  47  }
604682551aa511e Jussi Kivilinna 2014-07-29  48  

:::::: The code at line 43 was first introduced by commit
:::::: 51e515faa887e40e7e30a3e13607ea6be418e4c4 crypto: arm/sha1_neon - move SHA-1 NEON implementation to base layer

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
