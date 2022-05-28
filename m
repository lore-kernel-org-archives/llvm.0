Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4967F
	for <llvm@lists.linux.dev>; Sat, 28 May 2022 00:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653699148; x=1685235148;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qTWr/b6eNOF7VJHbLvLJO24lgI2uRBW/rjIxKwo/dhQ=;
  b=KfkOsOZdXgFKDkiQJsM/1G3FALJ/9hndhVAt6L75/Wqkz1j9fpKwd/bn
   D5E5kDQ2PhDnTtYQLSXzmpQUytX63x1owfwPwF//wLUDKDmnu0679InTm
   SEHmcZNsaJow1gQwZHnu2EypfDfYJ8qOXraFRS2Jo6uqP/iLfwufXxu6L
   xyDOQ2+JAoMqohSXHPZZBbuGfEzpGegQXLlvETB6zTFC9FhuG12dsTCPL
   DefTtqMiANgG54xFKuqAvPPzbJ1uXklDNDdxH5dPH9h+Z5ZDEf9mA5YfJ
   gQEHWiX2vScXR141Kbh1IRDg5N5/TVQT/I8bWrDINyyJl36xvqeKIB2Lw
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10360"; a="254479208"
X-IronPort-AV: E=Sophos;i="5.91,257,1647327600"; 
   d="scan'208";a="254479208"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2022 17:52:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,257,1647327600"; 
   d="scan'208";a="705386062"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 May 2022 17:52:26 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nukgr-0005JT-Nj;
	Sat, 28 May 2022 00:52:25 +0000
Date: Sat, 28 May 2022 08:51:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: kernel/built-in.a(kallsyms.o):(function
 kallsyms_on_each_symbol: .text+0x1e0): relocation R_RISCV_PCREL_HI20 out of
 range: -524417 is not in [-524288, 524287]; references kallsyms_num_syms
Message-ID: <202205280837.PPVZBhXr-lkp@intel.com>
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
TO: Jiri Olsa <jolsa@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>

Hi Jiri,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bf272460d744112bacd4c4d562592decbf0edf64
commit: d721def7392a7348ffb9f3583b264239cbd3702c kallsyms: Make kallsyms_on_each_symbol generally available
date:   2 weeks ago
config: riscv-randconfig-r042-20220527 (https://download.01.org/0day-ci/archive/20220528/202205280837.PPVZBhXr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 134d7f9a4b97e9035150d970bd9e376043c4577e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d721def7392a7348ffb9f3583b264239cbd3702c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d721def7392a7348ffb9f3583b264239cbd3702c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_on_each_symbol: .text+0x1e0): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_on_each_symbol: .text+0x1f8): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_on_each_symbol: .text+0x204): relocation R_RISCV_PCREL_HI20 out of range: -524417 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
