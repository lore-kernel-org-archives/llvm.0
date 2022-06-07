Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BAA320E
	for <llvm@lists.linux.dev>; Tue,  7 Jun 2022 22:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654640709; x=1686176709;
  h=date:from:cc:subject:message-id:mime-version;
  bh=S+PHSmBAlL/EYc6W9uTv1Vs7KVmBvzeB42ETy8W6PQs=;
  b=ejWoPuVrEiZMRejERQ31MGwdbnNm4vnhG8NJy2R07TSEq8E5fnKEoKW+
   McuOjLKrmw9FgMLj3D60EiltaAe8Xg/oOIfKbKG0iBydAMYkIU5QTtQFv
   uGCgjgHilunP8VO33U8WpRWJ5IvglmI3sS+kxm3mpi83fDPYvv1wfOBzG
   X9OEV4T15bMmx6BxGRekxEziDlnT0qstMh1KJbxvlrNcHxBaUBnPjBnRi
   TRcoPIw89jxFWqDvjFF1R7gkjvzTPhq5RAehdKTNdXYgDHx+Z1GNUfFG8
   fZunI1OPuF/PB1n7EYU5lpfesrupHm4m7OJzXBFXctWszGMLxxeQXtY8v
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="256589633"
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="256589633"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2022 15:25:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="584436473"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Jun 2022 15:25:08 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nyhdL-000E0P-LI;
	Tue, 07 Jun 2022 22:25:07 +0000
Date: Wed, 8 Jun 2022 06:24:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: kernel/built-in.a(kallsyms.o):(function
 kallsyms_lookup_name: .text+0x40): relocation R_RISCV_PCREL_HI20 out of
 range: -524486 is not in [-524288, 524287]; references kallsyms_num_syms
Message-ID: <202206080623.8V7BWhgu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e71e60cd74df9386c3f684c54888f2367050b831
commit: 606b102876e3741851dfb09d53f3ee57f650a52c drm: fb_helper: fix CONFIG_FB dependency
date:   8 months ago
config: riscv-buildonly-randconfig-r004-20220607 (https://download.01.org/0day-ci/archive/20220608/202206080623.8V7BWhgu-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b92436efcb7813fc481b30f2593a4907568d917a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=606b102876e3741851dfb09d53f3ee57f650a52c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 606b102876e3741851dfb09d53f3ee57f650a52c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_name: .text+0x40): relocation R_RISCV_PCREL_HI20 out of range: -524486 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_name: .text+0xe4): relocation R_RISCV_PCREL_HI20 out of range: -524486 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_buildid: .text+0x8b4): relocation R_RISCV_PCREL_HI20 out of range: -524486 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0xa50): relocation R_RISCV_PCREL_HI20 out of range: -524487 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_name: .text+0xf0): relocation R_RISCV_PCREL_HI20 out of range: -524486 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_pos: .text+0x470): relocation R_RISCV_PCREL_HI20 out of range: -524486 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_pos: .text+0x47c): relocation R_RISCV_PCREL_HI20 out of range: -524486 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_pos: .text+0x49c): relocation R_RISCV_PCREL_HI20 out of range: -524486 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_buildid: .text+0x8a4): relocation R_RISCV_PCREL_HI20 out of range: -524486 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
