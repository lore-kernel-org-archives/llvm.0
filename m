Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42124323D;
	Sun, 29 Jan 2023 20:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675023210; x=1706559210;
  h=date:from:cc:subject:message-id:mime-version;
  bh=jf02FnoACxcRBld5MBvEKJIax2g2za47+nCi7fA/u9E=;
  b=NhVArxaP1lOV6gvcNA8fIGP+h9C/jsuv5tqja4CDOZtz17hcp5tQQtNB
   JgXNNRKA2EN3x+BWnO3+9cSvkzCfJn+vlBgHYv6ASjbEtEIzdxA1ovaYi
   Xrwx8TH6st2v2axb+gOPW3/P8OZ0d8lCFQ9zxsEZJ/fZVzX/K2HymrNwj
   JVgP6G7IBN2fTjMNHeaIGJiUBYIaoWuauuGSB/coqgDHX5b6k/v36UCu8
   KnPrnbX1tcQOPlH5T4G3yek9xdix011ApqobrBpEcsRH9MEFSodO8xGRs
   VU1zQ+MWsWBg11igPMZ9bqUV0dyqYO7o1KeXtxSH9CjeUgr9H7cgLcFWU
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="307776220"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="307776220"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2023 12:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10605"; a="663885283"
X-IronPort-AV: E=Sophos;i="5.97,256,1669104000"; 
   d="scan'208";a="663885283"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Jan 2023 12:13:28 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pME3L-00035G-1L;
	Sun, 29 Jan 2023 20:13:27 +0000
Date: Mon, 30 Jan 2023 04:12:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [stable:linux-5.15.y 1982/9999] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_name: .text+0x58):
 relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288,
 524287]; references kallsyms_names
Message-ID: <202301300453.UCJOXHO2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Kees Cook <keescook@chromium.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Kees,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.15.y
head:   aabd5ba7e9b03e9a211a4842ab4a93d46f684d2c
commit: 33db9912ff7c491f839c89a08e98f755aa09598f [1982/9999] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: riscv-randconfig-r026-20230129 (https://download.01.org/0day-ci/archive/20230130/202301300453.UCJOXHO2-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=33db9912ff7c491f839c89a08e98f755aa09598f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.15.y
        git checkout 33db9912ff7c491f839c89a08e98f755aa09598f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_name: .text+0x58): relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_buildid: .text+0x44c): relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_buildid: .text+0x454): relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x5c8): relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_name: .text+0x5d0): relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function lookup_symbol_attrs: .text+0x734): relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_name: .text+0x60): relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_name: .text+0x68): relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
