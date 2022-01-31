Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9BC92C80
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 23:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643671929; x=1675207929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7igFGXei51V2cTLR/2NKTQd5URRQwT+lybcaF5ntgXU=;
  b=A0wgi+TBIQpP1x6UNliHWWLFRT5j7TSDPwYEEQjtX0p4mLN7DgFGWaeK
   kDGIGj80Yy4qed4JFJrJCw/ha8I49scPlXDy2Rqsu0QiNpuo/3NAVLDFg
   bsO2JtCnuJ+MavezJqi9LkIS9ZAuH/GiTR6wdIw4934i4ByeF+TotGs7s
   W1WXmmQSQ2zojPfaoA94AE9LpqvJ76E1OuixMxC6Ky7XTZu0Wc8Bs8wov
   5XOwRDlnWeDBhGdkcngF97hxpvogUzQX3hotOhXqcizNYoR+j99GBPypb
   927v4arTqIojyJRTKx3NiYtpS2OzXXkb5TyhW7LdEDHWqNLvriT4LkAF1
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="308307260"
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="308307260"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 15:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,332,1635231600"; 
   d="scan'208";a="582838971"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 31 Jan 2022 15:31:54 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEg9K-000SSP-5C; Mon, 31 Jan 2022 23:31:54 +0000
Date: Tue, 1 Feb 2022 07:31:35 +0800
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
Subject: Re: [PATCH v2 7/7] riscv: Use asm/insn.h for jump labels
Message-ID: <202202010424.HTgYVdlR-lkp@intel.com>
References: <20220131182720.236065-8-kernel@esmil.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220131182720.236065-8-kernel@esmil.dk>
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
config: riscv-randconfig-r042-20220131 (https://download.01.org/0day-ci/archive/20220201/202202010424.HTgYVdlR-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2cdbaca3943a4d6259119f185656328bd3805b68)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/5508617c47312c3ddd0318c8e084c63f1f77ed5a
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Emil-Renner-Berthing/Module-relocation-fixes-and-asm-insn-h-header/20220201-023028
        git checkout 5508617c47312c3ddd0318c8e084c63f1f77ed5a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/kernel/jump_label.c:12:
>> arch/riscv/include/asm/insn.h:64:22: warning: overflow in expression; result is 2147481600 with type 'long' [-Winteger-overflow]
           return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
                               ^
   arch/riscv/include/asm/insn.h:64:64: warning: overflow in expression; result is 2147481600 with type 'long' [-Winteger-overflow]
           return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
                                                                         ^
   2 warnings generated.


vim +/long +64 arch/riscv/include/asm/insn.h

4fc4a021bce139 Emil Renner Berthing 2022-01-31  54  
4fc4a021bce139 Emil Renner Berthing 2022-01-31  55  static inline bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
4fc4a021bce139 Emil Renner Berthing 2022-01-31  56  {
4fc4a021bce139 Emil Renner Berthing 2022-01-31  57  	if (IS_ENABLED(CONFIG_32BIT))
4fc4a021bce139 Emil Renner Berthing 2022-01-31  58  		return true;
4fc4a021bce139 Emil Renner Berthing 2022-01-31  59  
4fc4a021bce139 Emil Renner Berthing 2022-01-31  60  	/*
4fc4a021bce139 Emil Renner Berthing 2022-01-31  61  	 * auipc+jalr can reach any PC-relative offset in the range
4fc4a021bce139 Emil Renner Berthing 2022-01-31  62  	 * [-2^31 - 2^11, 2^31 - 2^11)
4fc4a021bce139 Emil Renner Berthing 2022-01-31  63  	 */
4fc4a021bce139 Emil Renner Berthing 2022-01-31 @64  	return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
4fc4a021bce139 Emil Renner Berthing 2022-01-31  65  }
4fc4a021bce139 Emil Renner Berthing 2022-01-31  66  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
