Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F8219E;
	Tue, 14 Mar 2023 10:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678790133; x=1710326133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JUQDA6TG6hIGar/jOmGUqSnBrRrJxJwAaYIdkBRf45o=;
  b=Iz63XU6TLBT+D5wcJRxzUn5MipiOa9MpIbMwGyrza/jfBqQTJ3HqF0E6
   ZReXq6VSIARyyPEA+/GKdcCvVIob+OyjDHAtf4Ng6h/EvsFqI7OVXB4mR
   jqHHVVoZetuMmbbrBxPPqH8z57BG9Tzv6VXVfadjf5uTjanvWOu2AVUDJ
   rn+uROLBo119KQ698C2KlWFoq2oIy+oDQbVHgTUyUDdWWZbwVB2T4jlBP
   i9qn7PKPTCN3wFuiWoACR3odWuBuQl/CAG9um9g+h/Yix5XHGPyPq2nIs
   BUmhiGK3gRda+w+MRUFlpe6byMpcMCy0iymHdYcBfqjQBonNxsIEFKNvo
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="325751334"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="325751334"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 03:35:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="672283326"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="672283326"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Mar 2023 03:35:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc20A-0006pU-0o;
	Tue, 14 Mar 2023 10:35:30 +0000
Date: Tue, 14 Mar 2023 18:35:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-efi@vger.kernel.org
Subject: [efi:urgent 5/5] ld.lld: error: undefined hidden symbol:
 __efistub__text
Message-ID: <202303141842.XIdIOihn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git urgent
head:   7949368e93e48a15ac5976405def16f8c84c837b
commit: 7949368e93e48a15ac5976405def16f8c84c837b [5/5] efi: libstub: Use relocated version of kernel's struct screen_info
config: arm64-randconfig-r001-20230312 (https://download.01.org/0day-ci/archive/20230314/202303141842.XIdIOihn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/commit/?id=7949368e93e48a15ac5976405def16f8c84c837b
        git remote add efi https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
        git fetch --no-tags efi urgent
        git checkout 7949368e93e48a15ac5976405def16f8c84c837b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141842.XIdIOihn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined hidden symbol: __efistub__text
   >>> referenced by arm64-stub.c:88 (drivers/firmware/efi/libstub/arm64-stub.c:88)
   >>>               arm64-stub.stub.o:(__efistub_handle_kernel_image) in archive drivers/firmware/efi/libstub/lib.a
   >>> referenced by arm64-stub.c:88 (drivers/firmware/efi/libstub/arm64-stub.c:88)
   >>>               arm64-stub.stub.o:(__efistub_handle_kernel_image) in archive drivers/firmware/efi/libstub/lib.a
   >>> referenced by arm64-stub.c:158 (drivers/firmware/efi/libstub/arm64-stub.c:158)
   >>>               arm64-stub.stub.o:(__efistub_primary_entry_offset) in archive drivers/firmware/efi/libstub/lib.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined hidden symbol: __efistub___inittext_end
   >>> referenced by arm64-stub.c:141 (drivers/firmware/efi/libstub/arm64-stub.c:141)
   >>>               arm64-stub.stub.o:(__efistub_handle_kernel_image) in archive drivers/firmware/efi/libstub/lib.a
   >>> referenced by arm64-stub.c:141 (drivers/firmware/efi/libstub/arm64-stub.c:141)
   >>>               arm64-stub.stub.o:(__efistub_handle_kernel_image) in archive drivers/firmware/efi/libstub/lib.a
--
>> ld.lld: error: undefined hidden symbol: __efistub_caches_clean_inval_pou
   >>> referenced by arm64-stub.c:141 (drivers/firmware/efi/libstub/arm64-stub.c:141)
   >>>               arm64-stub.stub.o:(__efistub_handle_kernel_image) in archive drivers/firmware/efi/libstub/lib.a
--
>> ld.lld: error: undefined hidden symbol: __efistub_primary_entry
   >>> referenced by arm64-stub.c:158 (drivers/firmware/efi/libstub/arm64-stub.c:158)
   >>>               arm64-stub.stub.o:(__efistub_primary_entry_offset) in archive drivers/firmware/efi/libstub/lib.a
   >>> referenced by arm64-stub.c:158 (drivers/firmware/efi/libstub/arm64-stub.c:158)
   >>>               arm64-stub.stub.o:(__efistub_primary_entry_offset) in archive drivers/firmware/efi/libstub/lib.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
