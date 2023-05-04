Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C62FBF9;
	Thu,  4 May 2023 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683211484; x=1714747484;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d8IqIVBqgWk3fUZ+Aq0SD1RsyaAPX0AwyS7IS2iXhJc=;
  b=TyEzYG5qrfbGydoj1DS4y+HNY0tkbi5jP5YMMgRMOHFEsK0L3I80MDcl
   blebXba3LlJ2izLr1TQdwKU8NzZrFdww0uPTEtdLagvaQl69jGFj8tiqk
   AQd7RBC9dNtSfMa2oVxvNP420otxq/Ec7GuGi3wn63/jH+3s/K571B2Kv
   Hv+y42GDA2d3q0rA7khEvpgfH6OXNPHxMjcS8bxwZGo5nGhG4nrDbKVZO
   jCyNI1QiKaa6+6TG8H8/wC8uMAWAaOP9bF8bSBOIQpN2MZG48kz/eBG3G
   HUqcBKSJGqvPCFDk5sLOs0DToOO43SnEz51GLZEPTX+5lR/GKNmYnEqd9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="333350389"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="333350389"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2023 07:44:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10700"; a="761959774"
X-IronPort-AV: E=Sophos;i="5.99,249,1677571200"; 
   d="scan'208";a="761959774"
Received: from lkp-server01.sh.intel.com (HELO d0e14d8700eb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 May 2023 07:44:42 -0700
Received: from kbuild by d0e14d8700eb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puaCH-00002Q-2n;
	Thu, 04 May 2023 14:44:41 +0000
Date: Thu, 4 May 2023 22:44:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efistub-cleanup 15/15]
 drivers/firmware/efi/libstub/x86-stub.c:825:28: warning: implicit
 declaration of function 'kaslr_get_random_long' is invalid in C99
Message-ID: <202305042258.YkldbqXw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efistub-cleanup
head:   1201fa1f2a7026937d0a906b96b4e4ec12e65079
commit: b760d03b0aa4c29486d4e04e2a55a3b5803d3600 [15/15] x86: efistub: Avoid legacy decompressor when doing EFI boot
config: i386-randconfig-a016-20230501 (https://download.01.org/0day-ci/archive/20230504/202305042258.YkldbqXw-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=b760d03b0aa4c29486d4e04e2a55a3b5803d3600
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-efistub-cleanup
        git checkout b760d03b0aa4c29486d4e04e2a55a3b5803d3600
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/firmware/efi/libstub/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305042258.YkldbqXw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/efi/libstub/x86-stub.c:825:28: warning: implicit declaration of function 'kaslr_get_random_long' is invalid in C99 [-Wimplicit-function-declaration]
           *(unsigned long *)seed ^= kaslr_get_random_long("EFI");
                                     ^
   1 warning generated.


vim +/kaslr_get_random_long +825 drivers/firmware/efi/libstub/x86-stub.c

   816	
   817	static void efi_get_seed(void *seed, int size)
   818	{
   819		efi_get_random_bytes(size, seed);
   820	
   821		/*
   822		 * This only updates seed[0] when running on 32-bit, but in that case,
   823		 * we don't use seed[1] anyway, as there is no virtual KASLR on 32-bit.
   824		 */
 > 825		*(unsigned long *)seed ^= kaslr_get_random_long("EFI");
   826	}
   827	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
