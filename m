Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B4D569E;
	Fri, 20 Jan 2023 19:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674242382; x=1705778382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cGvnJEEvysmzs0M3+XFg1mcICSzf8zbUtLYy2mR7n7o=;
  b=bfbF5lCnk/qa2kZ5f0mUlidptOjro4V9r11Pa/3dirnKnm8Q0//Bw3nx
   GuJaEZHAwvhfDOoufuvtuj1kJUMQ4djZNzoZEFDWQZWDlQTLkqJwnn8zq
   Enu6Pxx3TUPvotp3RAVhR5YW68AelRfJk0WS9XghqS2MnRLLdu0fLgUMU
   QSnKcTKDAn0xrbTXEwoVnd9czYy4cEA/H69RfiM3M2mu9oAsz5nM/fWr5
   uSTHIXqd4tkGetvsQ/yrK20xnkdiudiakgSaCOKiPsAN52CL4g8z1oPee
   bwtM//b+60kiFgOsjv4gf1Nh/5KfLw9MuH5qa4BixrpUmiJN5fSZb+NMo
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="327756321"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="327756321"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 11:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="692958773"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="692958773"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 20 Jan 2023 11:19:19 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIwv0-0002qY-0t;
	Fri, 20 Jan 2023 19:19:18 +0000
Date: Sat, 21 Jan 2023 03:18:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 2/3] arch/x86/kernel/alternative.c:2083:6:
 error: implicit declaration of function 'is_jcc32' is invalid in C99
Message-ID: <202301210331.s3pHXRMX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   2eb791245b6ab0aa1bbc37537adb2b2c87f50651
commit: 13c5d94759ccacddeba3041d8c2c0c967becb5d3 [2/3] x86/alternative: Teach text_poke_bp() to patch Jcc.d32 instructions
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230121/202301210331.s3pHXRMX-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=13c5d94759ccacddeba3041d8c2c0c967becb5d3
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/core
        git checkout 13c5d94759ccacddeba3041d8c2c0c967becb5d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/x86/kernel/alternative.c:2083:6: error: implicit declaration of function 'is_jcc32' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           if (is_jcc32(&insn)) {
               ^
   1 error generated.


vim +/is_jcc32 +2083 arch/x86/kernel/alternative.c

  2063	
  2064	static void text_poke_loc_init(struct text_poke_loc *tp, void *addr,
  2065				       const void *opcode, size_t len, const void *emulate)
  2066	{
  2067		struct insn insn;
  2068		int ret, i = 0;
  2069	
  2070		if (len == 6)
  2071			i = 1;
  2072		memcpy((void *)tp->text, opcode+i, len-i);
  2073		if (!emulate)
  2074			emulate = opcode;
  2075	
  2076		ret = insn_decode_kernel(&insn, emulate);
  2077		BUG_ON(ret < 0);
  2078	
  2079		tp->rel_addr = addr - (void *)_stext;
  2080		tp->len = len;
  2081		tp->opcode = insn.opcode.bytes[0];
  2082	
> 2083		if (is_jcc32(&insn)) {
  2084			/*
  2085			 * Map Jcc.d32 onto Jcc.d8 and use len to distinguish.
  2086			 */
  2087			tp->opcode = insn.opcode.bytes[1] - 0x10;
  2088		}
  2089	
  2090		switch (tp->opcode) {
  2091		case RET_INSN_OPCODE:
  2092		case JMP32_INSN_OPCODE:
  2093		case JMP8_INSN_OPCODE:
  2094			/*
  2095			 * Control flow instructions without implied execution of the
  2096			 * next instruction can be padded with INT3.
  2097			 */
  2098			for (i = insn.length; i < len; i++)
  2099				BUG_ON(tp->text[i] != INT3_INSN_OPCODE);
  2100			break;
  2101	
  2102		default:
  2103			BUG_ON(len != insn.length);
  2104		}
  2105	
  2106		switch (tp->opcode) {
  2107		case INT3_INSN_OPCODE:
  2108		case RET_INSN_OPCODE:
  2109			break;
  2110	
  2111		case CALL_INSN_OPCODE:
  2112		case JMP32_INSN_OPCODE:
  2113		case JMP8_INSN_OPCODE:
  2114		case 0x70 ... 0x7f: /* Jcc */
  2115			tp->disp = insn.immediate.value;
  2116			break;
  2117	
  2118		default: /* assume NOP */
  2119			switch (len) {
  2120			case 2: /* NOP2 -- emulate as JMP8+0 */
  2121				BUG_ON(memcmp(emulate, x86_nops[len], len));
  2122				tp->opcode = JMP8_INSN_OPCODE;
  2123				tp->disp = 0;
  2124				break;
  2125	
  2126			case 5: /* NOP5 -- emulate as JMP32+0 */
  2127				BUG_ON(memcmp(emulate, x86_nops[len], len));
  2128				tp->opcode = JMP32_INSN_OPCODE;
  2129				tp->disp = 0;
  2130				break;
  2131	
  2132			default: /* unknown instruction */
  2133				BUG();
  2134			}
  2135			break;
  2136		}
  2137	}
  2138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
