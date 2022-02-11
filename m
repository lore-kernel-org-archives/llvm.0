Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E047A
	for <llvm@lists.linux.dev>; Fri, 11 Feb 2022 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644602282; x=1676138282;
  h=date:from:cc:subject:message-id:mime-version;
  bh=wwBcPjBFDl8Oou0ooQgxMxUn2Hp/3OiuP/7o9KLWQ0s=;
  b=El+8h4g5tgXjnpsrPXT+ZAAnTFtSC84Vk5BaglaoDgSttt94CLzNa46k
   AE/d4vAIXulBbPuKdvSdeSiWwzRGHm6rdQY2YOLpiMhxz6tpjrcsPW6Qk
   lY0ReD8Z6qIHUffoRBdl9ViYqEvRG/vRkcDQJNxhcNBU30dCsfiSbGzKO
   Dpm5soRqZ5yVMkGzgDEZapR0qSpjOiUlfldrWcPIsQvhIWKFCxplb3S+u
   /FaH7u7TvyTl3x+2FrEhstrEMnyLPUssbRnNhsQuXyiuVtpWYB2UhyZ/q
   WPU6+YfZl8uy4RmsaFotn/24Cz99TYSX+w/1Z24QWUDvLzogVwd0/4hkA
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10255"; a="310515236"
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="310515236"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2022 09:58:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,361,1635231600"; 
   d="scan'208";a="483541595"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Feb 2022 09:58:01 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nIaBE-0004t5-DL; Fri, 11 Feb 2022 17:58:00 +0000
Date: Sat, 12 Feb 2022 01:57:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [stable:linux-5.10.y 4104/9999] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_name: .text+0x5c):
 relocation R_RISCV_PCREL_HI20 out of range: 33553690 is not in [-524288,
 524287]; references kallsyms_num_syms
Message-ID: <202202111904.fvUbPjBw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Khem Raj <raj.khem@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Palmer Dabbelt <palmerdabbelt@google.com>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   d4f7d322a4ad1d1a280f1b1f36df8d0eb855966c
commit: bb73f2f789695028a4cc8baf9d6a8df03fb5ae14 [4104/9999] riscv: Use -mno-relax when using lld linker
config: riscv-randconfig-r026-20220211 (https://download.01.org/0day-ci/archive/20220211/202202111904.fvUbPjBw-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f6685f774697c85d6a352dcea013f46a99f9fe31)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=bb73f2f789695028a4cc8baf9d6a8df03fb5ae14
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-5.10.y
        git checkout bb73f2f789695028a4cc8baf9d6a8df03fb5ae14
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_name: .text+0x5c): relocation R_RISCV_PCREL_HI20 out of range: 33553690 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_pos: .text+0x720): relocation R_RISCV_PCREL_HI20 out of range: 33553689 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_pos: .text+0x72c): relocation R_RISCV_PCREL_HI20 out of range: 33553689 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_pos: .text+0x74c): relocation R_RISCV_PCREL_HI20 out of range: 33553689 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_name: .text+0x27c): relocation R_RISCV_PCREL_HI20 out of range: 33553690 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_name: .text+0x290): relocation R_RISCV_PCREL_HI20 out of range: 33553690 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
