Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2C320FF;
	Sun,  2 Apr 2023 06:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680418256; x=1711954256;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qkP33K0gnMiH8irRRAMBsrUSdRroTeCSfb98809epQ0=;
  b=MUOrM9Vp7WDaL5+Ui2l3ilssZziFyVbPHcAG47OvfuK5TEHshaKtnRd1
   Vj2f1KgS1leQuuYpk6C+XiBB1n1ZGw/YYRGvD+1fdZnsgHwC2Bb2M+R4j
   +CMzo0FB+PGfxig4UPomwGnVHMKe711chbi5TCmL2Wo/DQCQt6trq7eGB
   rKOQ22fNGmlFG2Q/1dVNDFINNzA2o12l1AD9kSWn/zwrPBxDdyKS3Wd0o
   CU7ELIK+/L5EOcLSXGLDPybbG7vzcceBBWc0o2d3EgyGRwzAjZm0rpY0u
   AHdo7VokNJX5b4B0Vu6uIUSLARcRIFzskv8jm60uCYDWd9frxuv7BoQJV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="339205101"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="339205101"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 23:50:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="1015314275"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="1015314275"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 01 Apr 2023 23:50:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pirYB-000NHh-1e;
	Sun, 02 Apr 2023 06:50:51 +0000
Date: Sun, 2 Apr 2023 14:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: forrestniu@foxmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] riscv: Add static call implementation
Message-ID: <202304021403.JZse0YvV-lkp@intel.com>
References: <tencent_A8A256967B654625AEE1DB222514B0613B07@qq.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_A8A256967B654625AEE1DB222514B0613B07@qq.com>

Hi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc4 next-20230331]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/forrestniu-foxmail-com/riscv-Add-static-call-implementation/20230402-135315
patch link:    https://lore.kernel.org/r/tencent_A8A256967B654625AEE1DB222514B0613B07%40qq.com
patch subject: [RFC PATCH] riscv: Add static call implementation
config: riscv-randconfig-r042-20230402 (https://download.01.org/0day-ci/archive/20230402/202304021403.JZse0YvV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/a649e35c4828ea084ace9cf54042815269d6fe52
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review forrestniu-foxmail-com/riscv-Add-static-call-implementation/20230402-135315
        git checkout a649e35c4828ea084ace9cf54042815269d6fe52
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304021403.JZse0YvV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/static_call.c:43:4: error: call to undeclared function 'make_call_t0'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           make_call_t0(insn, func, call);
                           ^
   arch/riscv/kernel/static_call.c:72:4: error: call to undeclared function 'make_call_t0'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           make_call_t0(insn, func, call);
                           ^
   arch/riscv/kernel/static_call.c:85:4: error: call to undeclared function 'make_call_t0'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                           make_call_t0(insn+sizeof(call[0]), func, call);
                           ^
   3 errors generated.


vim +/make_call_t0 +43 arch/riscv/kernel/static_call.c

    20	
    21	static void __ref __static_call_transform(void *insn, enum insn_type type, void *func,bool modinit)
    22	{
    23		u32 call[2]={0};
    24		u32 jump_code = (*(u32*)(insn+sizeof(call[0])) & GENMASK(6,0));
    25	
    26		switch (type) {
    27		case CALL:
    28			break;
    29		case NOP:
    30			break;
    31		case JMP:
    32			if(jump_code == RISCV_INSN_ADDI )
    33			{
    34				/*
    35				 * When the trampoland is initialized, three instructions are as follows:
    36				 * "auipc t0,imm20"
    37				 * "addi t0,imm12"
    38				 * "jalr t1,0(t0)"
    39				 * First, use the "jalr t1,imm12(t0)" replace the "addi t0,imm12"
    40				 * To ensure that two instructions are caused in the case of multiple nuclear
    41				 * conditions to lead to unknown errors.
    42				*/
  > 43				make_call_t0(insn, func, call);
    44				patch_text_nosync(insn+sizeof(call[0]), &call[1], sizeof(call[1]));
    45	
    46				/*
    47				 * After the last dynamic adjustment, the instructions are as follows:
    48				 * "auipc t0,imm20"
    49				 * "jalr t1,imm12(t0)"
    50				 * "jalr t1,0(t0)"
    51				 * The first two instructions have guaranteed that the third instruction will
    52				 * not be ordered, so the third instruction can be updated.After the update is completed,
    53				 * the second instruction can update to make the third jump instruction take effect.
    54				 * Use the "auipc t0,imm20" replace "jalr t0,imm12",the third jump instruction will take effect
    55				*/
    56				make_call_t0(insn+sizeof(call[0]), func, call);
    57	
    58				patch_text_nosync(insn+sizeof(call), &call[1], sizeof(call[1]));
    59				patch_text_nosync(insn+sizeof(call[0]), &call[0], sizeof(call[0]));
    60			}
    61			else if( jump_code == RISCV_INSN_AUIPC )
    62			{
    63				/*
    64				 * After the last dynamic adjustment, the instructions are as follows:
    65				 * "auipc t0,imm20"
    66				 * "auipc t0,imm20"
    67				 * "jalr t1,imm12(t0)"
    68				 * The first auipc instruction will not take effect and can be updated easily.
    69				 * After updating the first auipc instruction, update the second auipc instruction
    70				 * to the jalr instruction.
    71				 */
    72				make_call_t0(insn, func, call);
    73				patch_text_nosync(insn, &call[0], sizeof(call[0]));
    74				patch_text_nosync(insn+sizeof(call[0]), &call[1], sizeof(call[1]));
    75			}
    76			else if( jump_code == RISCV_INSN_JALR )
    77			{
    78				/*
    79				 * After the last dynamic adjustment, the instructions are as follows:
    80				 * "auipc t0,imm20"
    81				 * "jalr t1,imm12(t0)"
    82				 * "jalr t1,imm12(t0)"
    83				 * This looks like "jump_code == RISCV_INSN_ADDI".
    84				 */
    85				make_call_t0(insn+sizeof(call[0]), func, call);
    86	
    87				patch_text_nosync(insn+sizeof(call), &call[1], sizeof(call[1]));
    88				patch_text_nosync(insn+sizeof(call[0]), &call[0], sizeof(call[0]));
    89			}
    90			break;
    91		case RET://If func is NULL, the upgrade is not performed
    92			break;
    93		}
    94	}
    95	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
