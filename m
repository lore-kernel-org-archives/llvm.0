Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5C18F69;
	Tue, 14 Mar 2023 15:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678806283; x=1710342283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mlw612T9hGGqntGhUHC6TGjt4gApqBmaueoej0JH1jE=;
  b=G298DMG46Q/u6g6j4p7hz98NTAqGeJTmQEpvgdKjy4h0QBkVM4p4TOn7
   artAdQZeC7C4aQf1i/5uV9BC2910ZqDODCaNnOObQoy6zrzRzifDhi6Bg
   gCwW0mAatmH6zVZ/dhEa7dPGB+p6qYJkJxNXJAEHOZG50TdUh451fgCOQ
   hkhzUs8SD3h2omzetjOfppnROP3FU5i5ncBrQEeY5s6pk9V99ngHTiAJQ
   2mHCcaETj/z69oIoPg3N7n3B+wdB2qqRV9eX0IC2bqWkuMuKOauwsB1fy
   W4/IThXw6JXNSmkRb29K3O8yRYoAGwh9D+2RZ7hYKMRjMdSpLaJO6VxqI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="336140592"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="336140592"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 08:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="629065261"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="629065261"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 14 Mar 2023 08:04:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc6Ce-0006zM-0F;
	Tue, 14 Mar 2023 15:04:40 +0000
Date: Tue, 14 Mar 2023 23:03:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-efi@vger.kernel.org
Subject: [efi:urgent 5/5] ld.lld: error: undefined hidden symbol:
 __efistub__start
Message-ID: <202303142336.P1ZcCB9r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git urgent
head:   ef3efc2af044f6da5bb8c55e99f2398081d99c09
commit: 7949368e93e48a15ac5976405def16f8c84c837b [5/5] efi: libstub: Use relocated version of kernel's struct screen_info
config: riscv-randconfig-r026-20230313 (https://download.01.org/0day-ci/archive/20230314/202303142336.P1ZcCB9r-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git/commit/?id=7949368e93e48a15ac5976405def16f8c84c837b
        git remote add efi https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git
        git fetch --no-tags efi urgent
        git checkout 7949368e93e48a15ac5976405def16f8c84c837b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303142336.P1ZcCB9r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined hidden symbol: __efistub__start
   >>> referenced by riscv-stub.c:23 (drivers/firmware/efi/libstub/riscv-stub.c:23)
   >>>               riscv-stub.stub.o:(__efistub_stext_offset) in archive drivers/firmware/efi/libstub/lib.a
   >>> referenced by riscv-stub.c:23 (drivers/firmware/efi/libstub/riscv-stub.c:23)
   >>>               riscv-stub.stub.o:(__efistub_handle_kernel_image) in archive drivers/firmware/efi/libstub/lib.a
--
>> ld.lld: error: undefined hidden symbol: __efistub__start_kernel
   >>> referenced by riscv-stub.c:23 (drivers/firmware/efi/libstub/riscv-stub.c:23)
   >>>               riscv-stub.stub.o:(__efistub_stext_offset) in archive drivers/firmware/efi/libstub/lib.a
--
>> ld.lld: error: undefined hidden symbol: __efistub__end
   >>> referenced by riscv-stub.c:23 (drivers/firmware/efi/libstub/riscv-stub.c:23)
   >>>               riscv-stub.stub.o:(__efistub_handle_kernel_image) in archive drivers/firmware/efi/libstub/lib.a
--
>> ld.lld: error: undefined hidden symbol: __efistub__edata
   >>> referenced by riscv-stub.c:23 (drivers/firmware/efi/libstub/riscv-stub.c:23)
   >>>               riscv-stub.stub.o:(__efistub_handle_kernel_image) in archive drivers/firmware/efi/libstub/lib.a
--
>> ld.lld: error: undefined hidden symbol: __efistub_screen_info
   >>> referenced by efi-stub-entry.c:27 (drivers/firmware/efi/libstub/efi-stub-entry.c:27)
   >>>               efi-stub-entry.stub.o:(__efistub_efi_pe_entry) in archive drivers/firmware/efi/libstub/lib.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
