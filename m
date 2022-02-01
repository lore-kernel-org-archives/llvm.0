Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8413FDD
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 01:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643678049; x=1675214049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JenhozFl+KykgeWde+wvmn+b4rrjRzYh3N2g2SxIUoM=;
  b=UmkDEOKoeFHLkJeQTYobF+JFeph4AIt957wI51t9VVCGkAYohv1b51Z+
   oCjbIsYjq2YnURwfLV+jHpW8uJXDpdCdgtA/8QLG+Fvt8VDCJQHCTtD1H
   a4ELpOMqSjEbobGKrnroZo5U4senhm2SyTDfPUXNWCAZr9SnlxmROodgD
   +vJiGYqY1jlGGrX+6cybSqQsBqRc591o0MHIIm8TaOGjIsFRxJm6ebsT5
   gLgT9y8SNJHkX7AYSNlEEcwBKTvV8qj47rTplMjSKevyxSO5EigUbu3EM
   hwEDdXjuLYgt+UFhxB45hCZ6Rpcpq7mErqvsNfcTdOt4ayUV3fjXZzAZx
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="247550895"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="247550895"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 17:14:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="497163335"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 31 Jan 2022 17:14:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEhkC-000SYJ-FV; Tue, 01 Feb 2022 01:14:04 +0000
Date: Tue, 1 Feb 2022 09:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>, linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 5/7] riscv: Use asm/insn.h for module relocations
Message-ID: <202202010909.dh2CgMcN-lkp@intel.com>
References: <20220131182720.236065-6-kernel@esmil.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131182720.236065-6-kernel@esmil.dk>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Emil,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc2 next-20220131]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Emil-Renner-Berthing/Module-relocation-fixes-and-asm-insn-h-header/20220201-023028
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 26291c54e111ff6ba87a164d85d4a4e134b7315c
config: riscv-randconfig-r022-20220131 (https://download.01.org/0day-ci/archive/20220201/202202010909.dh2CgMcN-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/febc860a4c14d8d94af7c169315520796e0e4460
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Emil-Renner-Berthing/Module-relocation-fixes-and-asm-insn-h-header/20220201-023028
        git checkout febc860a4c14d8d94af7c169315520796e0e4460
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/module.c:15:
>> arch/riscv/include/asm/insn.h:64:22: warning: overflow in expression; result is 2147481600 with type 'long' [-Winteger-overflow]
           return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
                               ^
   arch/riscv/include/asm/insn.h:64:64: warning: overflow in expression; result is 2147481600 with type 'long' [-Winteger-overflow]
           return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
                                                                         ^
   2 warnings generated.


vim +/long +64 arch/riscv/include/asm/insn.h

4fc4a021bce1398 Emil Renner Berthing 2022-01-31  54  
4fc4a021bce1398 Emil Renner Berthing 2022-01-31  55  static inline bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
4fc4a021bce1398 Emil Renner Berthing 2022-01-31  56  {
4fc4a021bce1398 Emil Renner Berthing 2022-01-31  57  	if (IS_ENABLED(CONFIG_32BIT))
4fc4a021bce1398 Emil Renner Berthing 2022-01-31  58  		return true;
4fc4a021bce1398 Emil Renner Berthing 2022-01-31  59  
4fc4a021bce1398 Emil Renner Berthing 2022-01-31  60  	/*
4fc4a021bce1398 Emil Renner Berthing 2022-01-31  61  	 * auipc+jalr can reach any PC-relative offset in the range
4fc4a021bce1398 Emil Renner Berthing 2022-01-31  62  	 * [-2^31 - 2^11, 2^31 - 2^11)
4fc4a021bce1398 Emil Renner Berthing 2022-01-31  63  	 */
4fc4a021bce1398 Emil Renner Berthing 2022-01-31 @64  	return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
4fc4a021bce1398 Emil Renner Berthing 2022-01-31  65  }
4fc4a021bce1398 Emil Renner Berthing 2022-01-31  66  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
