Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954FB2563
	for <llvm@lists.linux.dev>; Thu,  7 Apr 2022 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649347119; x=1680883119;
  h=date:from:cc:subject:message-id:mime-version;
  bh=lBjUlFacV2tITWvhD1ZcXZJ/j4AwM5LnJdHFu3jsiIA=;
  b=DiOmh/CnE0Mk+pFipkM/CfhqGRqHOj9YIuv1hu1MhPnWCjUHM+4jgzfz
   EX6m58axnEwnlPdpkTEeNO1SvJKnxE1/JLF8ee3Jx8OrufVIo0NNzBahc
   qZLejoYx5yMdixYtCQ3OBAUziHMWGZKWuHpGGL41683A4F80EyaqaKtEZ
   IU3iEs888NxXLjMmpyKW8D/Li9cpQ+dvaA4IQ0hJC8FJQM8TSpI10I/Gt
   5l8nP9/q3lOtVMcNnEeerBKhfKGixMySTajc9glkS7R/pu9r6vbpKlF1X
   IOT1RfvhnDupz/qezogGYphiI8Y/pHGR8cI48tXLbxmpdu4FhqEoyvdBb
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="241958854"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="241958854"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2022 08:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; 
   d="scan'208";a="524979215"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 07 Apr 2022 08:57:55 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncUWA-0005Yp-MX;
	Thu, 07 Apr 2022 15:57:54 +0000
Date: Thu, 7 Apr 2022 23:57:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: kernel/built-in.a(kallsyms.o):(function
 kallsyms_expand_symbol: .text+0x118): relocation R_RISCV_PCREL_HI20 out of
 range: -524499 is not in [-524288, 524287]; references kallsyms_names
Message-ID: <202204072353.ggsEE8FQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Mel Gorman <mgorman@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3e732ebf7316ac83e8562db7e64cc68aec390a18
commit: 66d9282523b3228183b14d9f812872dd2620704d mm/page_alloc: Correct return value of populated elements if bulk array is populated
date:   9 months ago
config: riscv-randconfig-r005-20220406 (https://download.01.org/0day-ci/archive/20220407/202204072353.ggsEE8FQ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b306233f78876a1d197ed6e1f05785505de7c63)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=66d9282523b3228183b14d9f812872dd2620704d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 66d9282523b3228183b14d9f812872dd2620704d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_expand_symbol: .text+0x118): relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_expand_symbol: .text+0x134): relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_expand_symbol: .text+0x13c): relocation R_RISCV_PCREL_HI20 out of range: -524499 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LOCKDEP
   Depends on DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT && (FRAME_POINTER || MIPS || PPC || S390 || MICROBLAZE || ARM || ARC || X86)
   Selected by
   - PROVE_LOCKING && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT
   - DEBUG_LOCK_ALLOC && DEBUG_KERNEL && LOCK_DEBUGGING_SUPPORT

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
