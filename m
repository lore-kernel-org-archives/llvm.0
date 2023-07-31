Received: from mgamail.intel.com (unknown [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5A318AFE;
	Mon, 31 Jul 2023 15:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690816289; x=1722352289;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mUu6+yfnyxQJAA5NSnj31iuaf0Yk0pV/eZsjbLf6OW8=;
  b=EbJQga/GFykgQD8VjzDujrq4hgkiFeYEvhaeiBsZvpVABcD9Zl8Bj/KQ
   zr8Hg3BIC7YDGhG0z1nlC3o3mb2UsBwG2ox/EAYK8r9pimPWlQJwGNll+
   NPpEl/jqdR531jKsNXTZ5+MbKSdzwl+iBigSdSxItCxaPf1VCaKMrqf0H
   dDGNpwq90A7bkuCuDvxf7fB4Z5uGG9GtPBF0XLlkPhEdJ6wFTsyOIxGNL
   BK8SKugaqB0+xrZmQrelaRgJqe4hmSe1cLHGvxTyUbqO9B8WKAmO3DxV5
   TEblm01R7kVVrzeEUwii7XmsEto/ZbxiiW9o0BEYDM4rabkchE7Pr/xim
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="359078923"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="359078923"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 08:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="757971876"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="757971876"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 31 Jul 2023 08:11:27 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQUYH-0005Bj-1F;
	Mon, 31 Jul 2023 15:11:21 +0000
Date: Mon, 31 Jul 2023 23:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:x86/core 2/4] arch/x86/kernel/kprobes/core.c:326:7:
 error: call to undeclared function 'is_cfi_trap'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202307312330.LTRLoRgL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   81eb8da91648604113321d4f2f966236c91cb3f3
commit: 4ac2082c5d1ddfbbfe701e8038fd6778cfa50f41 [2/4] x86/kprobes: Prohibit probing on compiler generated CFI checking code
config: i386-randconfig-r014-20230731 (https://download.01.org/0day-ci/archive/20230731/202307312330.LTRLoRgL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307312330.LTRLoRgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307312330.LTRLoRgL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/kprobes/core.c:326:7: error: call to undeclared function 'is_cfi_trap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                   if (is_cfi_trap(addr + offset))
                       ^
   1 error generated.


vim +/is_cfi_trap +326 arch/x86/kernel/kprobes/core.c

   254	
   255	/* Check if paddr is at an instruction boundary */
   256	static int can_probe(unsigned long paddr)
   257	{
   258		unsigned long addr, __addr, offset = 0;
   259		struct insn insn;
   260		kprobe_opcode_t buf[MAX_INSN_SIZE];
   261	
   262		if (!kallsyms_lookup_size_offset(paddr, NULL, &offset))
   263			return 0;
   264	
   265		/* Decode instructions */
   266		addr = paddr - offset;
   267		while (addr < paddr) {
   268			int ret;
   269	
   270			/*
   271			 * Check if the instruction has been modified by another
   272			 * kprobe, in which case we replace the breakpoint by the
   273			 * original instruction in our buffer.
   274			 * Also, jump optimization will change the breakpoint to
   275			 * relative-jump. Since the relative-jump itself is
   276			 * normally used, we just go through if there is no kprobe.
   277			 */
   278			__addr = recover_probed_instruction(buf, addr);
   279			if (!__addr)
   280				return 0;
   281	
   282			ret = insn_decode_kernel(&insn, (void *)__addr);
   283			if (ret < 0)
   284				return 0;
   285	
   286	#ifdef CONFIG_KGDB
   287			/*
   288			 * If there is a dynamically installed kgdb sw breakpoint,
   289			 * this function should not be probed.
   290			 */
   291			if (insn.opcode.bytes[0] == INT3_INSN_OPCODE &&
   292			    kgdb_has_hit_break(addr))
   293				return 0;
   294	#endif
   295			addr += insn.length;
   296		}
   297		if (IS_ENABLED(CONFIG_CFI_CLANG)) {
   298			/*
   299			 * The compiler generates the following instruction sequence
   300			 * for indirect call checks and cfi.c decodes this;
   301			 *
   302			 *   movl    -<id>, %r10d       ; 6 bytes
   303			 *   addl    -4(%reg), %r10d    ; 4 bytes
   304			 *   je      .Ltmp1             ; 2 bytes
   305			 *   ud2                        ; <- regs->ip
   306			 *   .Ltmp1:
   307			 *
   308			 * Also, these movl and addl are used for showing expected
   309			 * type. So those must not be touched.
   310			 */
   311			__addr = recover_probed_instruction(buf, addr);
   312			if (!__addr)
   313				return 0;
   314	
   315			if (insn_decode_kernel(&insn, (void *)__addr) < 0)
   316				return 0;
   317	
   318			if (insn.opcode.value == 0xBA)
   319				offset = 12;
   320			else if (insn.opcode.value == 0x3)
   321				offset = 6;
   322			else
   323				goto out;
   324	
   325			/* This movl/addl is used for decoding CFI. */
 > 326			if (is_cfi_trap(addr + offset))
   327				return 0;
   328		}
   329	
   330	out:
   331		return (addr == paddr);
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
