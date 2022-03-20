Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AF420E5
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 00:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647735535; x=1679271535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dxJoTXkUg5hVs1jCAIuubJJRqhLnjIPT5wIOovyhArE=;
  b=EpgaNnCll+ua6h/jEOWGRwFQ7oOyLl6HqE3f4rAw8YoNT7ZwD0HzizOh
   /SzzF/fSbe8Tb4/JoCnApQpMsx20CUWqjhUp+6sy6WW+hotqeDQz8k5Z+
   f1hzWHb/mCj2gMlQ8ScE51FmXcbUUrE+GmCGidn2jvgYorVHL6KArscRU
   moch9sCoKpJSSY48DRaVTHsPCbR+ncsYfbY5/xLa30iFsoW8GUqPvDa9U
   gG5PhehVyLLpoDhf2nMByGBpTwDslmiCCCjj5mZ4YTAUWaNORqTX1ROmK
   IOWEOxiitCYqfaeoKcZ05CB+WPqZn1013YCWyMbmRIe5x9FOFJOnz0w5E
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="257529861"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="257529861"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2022 17:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="648129509"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Mar 2022 17:18:50 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVjHV-000GOk-Mz; Sun, 20 Mar 2022 00:18:49 +0000
Date: Sun, 20 Mar 2022 08:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@google.com>,
	Gary Guo <gary@garyguo.net>, Boqun Feng <boqun.feng@gmail.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: [linux-next:master 12714/13576] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x3bc):
 relocation R_RISCV_PCREL_HI20 out of range: -524450 is not in [-524288,
 524287]; references kallsyms_names
Message-ID: <202203200835.wEdmTF1a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6d72dda014a4753974eb08950089ddf71fec4f60
commit: 0f50a8170b7266abc8a6100cf19b6e50500204ab [12714/13576] kallsyms: support "big" kernel symbols
config: riscv-buildonly-randconfig-r002-20220320 (https://download.01.org/0day-ci/archive/20220320/202203200835.wEdmTF1a-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 217f267efe3082438e698e2f08566b9df8c530fa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=0f50a8170b7266abc8a6100cf19b6e50500204ab
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 0f50a8170b7266abc8a6100cf19b6e50500204ab
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x3bc): relocation R_RISCV_PCREL_HI20 out of range: -524450 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0x77c): relocation R_RISCV_PCREL_HI20 out of range: -524450 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0x786): relocation R_RISCV_PCREL_HI20 out of range: -524450 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0x798): relocation R_RISCV_PCREL_HI20 out of range: -524450 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_open: .text+0x7fa): relocation R_RISCV_PCREL_HI20 out of range: -524450 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function get_symbol_offset: .text+0x3ae): relocation R_RISCV_PCREL_HI20 out of range: -524450 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
