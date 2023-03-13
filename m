Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019131365;
	Mon, 13 Mar 2023 12:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678711218; x=1710247218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=puFa5dq3lcVgImAnhH85Jm3uMgga/l39T7Btcgbs7Zo=;
  b=g7jrHZ5qVvPQmgPwzCTz7FCSmc88+2WDyDpoZsFFeLUP8QUoCEHxcs+I
   pEjiUH9Uh0j42yZrGnSO59W2wZkV0JkEmoktGskkpwsc9CRgFOizbllk5
   TP5hpXDuNB1NhTXtHPH5mUdUYQLkGtyQ8B8fS2X300EQie4hkGNoF95NB
   4GJsg1IDnPzRL76n1s4zp5wIQgdoR1+iCrOs9kwBzEVrF1GdNowDGrMqx
   w2D2XBP6NANgmrw8CgoEa1CGa6ie6yqgME2zeqWpGg45098HgNYz8lMbE
   hVPOaa/YdFIgNZa2w8Y8jS6YXz+J3G1rg7djxfgRrHHIKWcVnPObMnINM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="338684270"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="338684270"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 05:40:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10647"; a="924487635"
X-IronPort-AV: E=Sophos;i="5.98,256,1673942400"; 
   d="scan'208";a="924487635"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 13 Mar 2023 05:40:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbhTL-0005fA-0x;
	Mon, 13 Mar 2023 12:40:15 +0000
Date: Mon, 13 Mar 2023 20:39:21 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-efi@vger.kernel.org
Subject: [efi:urgent 5/5] ld.lld: error: undefined hidden symbol:
 __efistub__start
Message-ID: <202303132020.S9CriCjt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git urgent
head:   21f136ebfb9ef430ed614c3f10325876a12695d2
commit: 21f136ebfb9ef430ed614c3f10325876a12695d2 [5/5] efi: libstub: Use relocated version of kernel's struct screen_info
config: riscv-randconfig-r042-20230313 (https://download.01.org/0day-ci/archive/20230313/202303132020.S9CriCjt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/commit/?id=21f136ebfb9ef430ed614c3f10325876a12695d2
        git remote add efi https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
        git fetch --no-tags efi urgent
        git checkout 21f136ebfb9ef430ed614c3f10325876a12695d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303132020.S9CriCjt-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined hidden symbol: __efistub__start
   >>> referenced by __efistub_riscv-stub.c
   >>>               riscv-stub.stub.o:(__efistub_stext_offset) in archive drivers/firmware/efi/libstub/lib.a
   >>> referenced by __efistub_riscv-stub.c
   >>>               riscv-stub.stub.o:(__efistub_handle_kernel_image) in archive drivers/firmware/efi/libstub/lib.a
--
>> ld.lld: error: undefined hidden symbol: __efistub__start_kernel
   >>> referenced by __efistub_riscv-stub.c
   >>>               riscv-stub.stub.o:(__efistub_stext_offset) in archive drivers/firmware/efi/libstub/lib.a
--
>> ld.lld: error: undefined hidden symbol: __efistub__end
   >>> referenced by __efistub_riscv-stub.c
   >>>               riscv-stub.stub.o:(__efistub_handle_kernel_image) in archive drivers/firmware/efi/libstub/lib.a
--
>> ld.lld: error: undefined hidden symbol: __efistub__edata
   >>> referenced by __efistub_riscv-stub.c
   >>>               riscv-stub.stub.o:(__efistub_handle_kernel_image) in archive drivers/firmware/efi/libstub/lib.a
--
>> ld.lld: error: undefined hidden symbol: __efistub_screen_info
   >>> referenced by __efistub_efi-stub-entry.c
   >>>               efi-stub-entry.stub.o:(__efistub_efi_pe_entry) in archive drivers/firmware/efi/libstub/lib.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
