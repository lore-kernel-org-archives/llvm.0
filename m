Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BEB36C
	for <llvm@lists.linux.dev>; Sat, 14 May 2022 03:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652498419; x=1684034419;
  h=date:from:cc:subject:message-id:mime-version;
  bh=SqK2pGD7kgDlOx5Ht/sPBxqt01luzn29sPamatVtUxE=;
  b=YM17cMNWvrKDeNUlmh+w8Hz99OOpQOzYEdQxaGhlbdHc/Ve0EuDmsAOs
   W4oT5ByVuB2y4u98BNerBQ8jWdUneRWJguatqZ6GwLk+8bDjz9vNAQnyq
   qOwZLI35q0+aLKLzVpb3FcaPvBcGGzO16OzV7p+yipLYNlIz2NxJ77aez
   y0z+/Am7bId/RA2fWheQ0DPvZpqSOcqdfw4pTYKLZa1OpW5Iysen1m/iv
   3bKGfcyo4+GxKxpuTKUoqm1Y9YUhvpCS2bi0j6Hy1RJW2A80tuRXQHKfR
   7BceawonGFMqoEsODa1EwVlyqzkFA4kiHVoFhuO0sA5DZChbInkCxkvax
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10346"; a="333497666"
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="333497666"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2022 20:20:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,225,1647327600"; 
   d="scan'208";a="567463077"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 May 2022 20:20:15 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npiKE-00009h-C4;
	Sat, 14 May 2022 03:20:14 +0000
Date: Sat, 14 May 2022 11:19:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 10425/11651] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function kallsyms_on_each_symbol:
 .text+0x214): relocation R_RISCV_PCREL_HI20 out of range: -524378 is not in
 [-524288, 524287]; references kallsyms_token_index
Message-ID: <202205141122.qihFGUem-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jiri Olsa <jolsa@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1e1b28b936aed946122b4e0991e7144fdbbfd77e
commit: d721def7392a7348ffb9f3583b264239cbd3702c [10425/11651] kallsyms: Make kallsyms_on_each_symbol generally available
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20220514/202205141122.qihFGUem-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 38189438b69ca27b4c6ce707c52dbd217583d046)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=d721def7392a7348ffb9f3583b264239cbd3702c
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d721def7392a7348ffb9f3583b264239cbd3702c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_on_each_symbol: .text+0x214): relocation R_RISCV_PCREL_HI20 out of range: -524378 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_on_each_symbol: .text+0x21c): relocation R_RISCV_PCREL_HI20 out of range: -524378 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_on_each_symbol: .text+0x1e0): relocation R_RISCV_PCREL_HI20 out of range: -524378 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_on_each_symbol: .text+0x1f8): relocation R_RISCV_PCREL_HI20 out of range: -524378 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_on_each_symbol: .text+0x204): relocation R_RISCV_PCREL_HI20 out of range: -524378 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_on_each_symbol: .text+0x20c): relocation R_RISCV_PCREL_HI20 out of range: -524378 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
