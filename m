Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712838;
	b=VADbEjY/EyNCfhd0FFSz/Rzwek2GvII6S1RsUCyegk4gL2Dv04YmtKsL1ISA2di1xnKw
	 Q5XpnBrIbiN3PFvl9hTkwSAnPl/BO01CvoaTgq9bWa1FMLJIntk3wfjTiweX2mRn3IBGT
	 oqjeT7gjKvj/s8DPCs/1ExQuFhZrV9tejcQlisOaObU8kM932tzS1PbBAgWJrbTm+2gGF
	 S58WmAyKXfCNs2RN5ZOaCFwEIblwfePlxya//iBZ2dDbutZA+cK0lmm02TZWxbi/RtIqM
	 8CY1ys3yWf68fD0qrc0amo13xWatCPbQccyf7zOkEusu60xZLzTokw6y84kcj8QVpEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712838;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2Ss6lG0u3KhmrW/sNtdDOTe+bYGe0twUZML83rrflOc=;
	b=h4v9iChfIjk9rBo0uz++L5Rnc5PGc07ljsGJCa6JZfWByp2i95rr1GXOk1JEAVtPdvYc
	 ce0lgyYtMlcpQnRvxq1OS3aben+FXBmgArdtugNuaXrUTRzLqvvZmtXPfkLDvsmPPGXcx
	 rU/80sy83tr1QMJ+8oWYwCbp4D81wTPhMnlH44ziR4yUTxsHDAJF1iNINHmPe6nvbJsdt
	 eqBLYUfcfUWaNYaAxSqBFQ58YzEgdnn1oEeRZJJz6uV32rsc6jshYjD9e6MlRCkPPV5Yn
	 7IsmiZnDMamIXHQY/IyLuhL+9ejapz2XG/oop6XD4X0+gGYAJwTUpkQwshDp7fxp/nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TuCD0mnM;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F66606A323;
	Thu, 26 Nov 2026 17:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F66606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TuCD0mnM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795712839; x=1827248839;
  h=date:from:to:cc:subject:message-id;
  bh=m6c/jqZysm3WN5nRCKT/Qz3Nbfpefgtye12NqAt7rUA=;
  b=TuCD0mnMjNBPGSgzjsRfW4XcpGfYfYLzROGrzA81P6W3odsekKjnX+p7
   axTbU/kY68Qti0vpoPFJXDUJekGmQH8m3voyDipUJA91UYMCFF45zXut9
   l12LFvomP/jade7fMJMY68qYnFOGSHDd3Y6W9miADH2R6D4jfk1hrj0RX
   gLtmDkUOqTnk1e+wJTw2nmgWu1gLeXbIUuSQPPF2mC3aZGZvIb5oQV2QN
   MHx4C30ve/18YJ0Bek2fxXHGDgGVeFXa0gSrKH4Anv4xwgdoMRLlkf8GY
   MAUosuzZBNLNTFsaooyF6WGkJwBB8XXTLjAfR5wHi1llD50ylv/WlZ6ls
   A==;
X-CSE-ConnectionGUID: mMXPNmKgTaCD1O6mVh77XQ==
X-CSE-MsgGUID: hHwsED5RTGCpkJPZkaGhJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4536054"
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="4536054"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 09:07:18 -0800
X-CSE-ConnectionGUID: ENOWcLY8Q9e4TXi0U2PbTA==
X-CSE-MsgGUID: is+Cy8kqQCitpWybMddeiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,235,1787036400"; 
   d="scan'208";a="13897901"
Received: from igk-lkp-server01.igk.intel.com (HELO 800201f3098f) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 26 Nov 2026 09:07:14 -0800
Received: from kbuild by 800201f3098f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWcwA-0000000008U-2nbK;
	Thu, 26 Nov 2026 17:07:10 +0000
Date: Thu, 26 Nov 2026 18:06:18 +0100
From: kernel test robot <lkp@intel.com>
To: daichengrong <daichengrong@iscas.ac.cn>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Cong Wang <cwang@multikernel.io>, Andy Chiu <tchiu@tenstorrent.com>
Subject: [congwang:riscv-vector-discard 3/5]
 arch/riscv/kernel/signal.c:130:2: error: call to undeclared function
 '__riscv_v_vstate_clean'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <20261126180329.cKNnHjkb-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/congwang/linux.git riscv-vector-discard
head:   82089161ab902778cdd13a9cd126871c69aa4e87
commit: 19973bf52f3795693ec7baaa5812d33009dbcd6e [3/5] riscv: clarify vector state semantics on syscall and context switch
config: riscv-randconfig-2005-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126180329.cKNnHjkb-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 3a9f981aab0cc32f74ffac36a87891cda8889c37)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126180329.cKNnHjkb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126180329.cKNnHjkb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/signal.c:12:
   In file included from include/linux/syscalls.h:96:
   In file included from include/trace/syscall.h:7:
   In file included from include/linux/trace_events.h:9:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/riscv/include/asm/io.h:148:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> arch/riscv/kernel/signal.c:130:2: error: call to undeclared function '__riscv_v_vstate_clean'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |         __riscv_v_vstate_clean(regs);
         |         ^
   arch/riscv/kernel/signal.c:130:2: note: did you mean 'riscv_v_vstate_query'?
   arch/riscv/include/asm/vector.h:429:20: note: 'riscv_v_vstate_query' declared here
     429 | static inline bool riscv_v_vstate_query(struct pt_regs *regs) { return false; }
         |                    ^
   1 warning and 1 error generated.


vim +/__riscv_v_vstate_clean +130 arch/riscv/kernel/signal.c

   107	
   108	/*
   109	 * Restore Vector extension context from the user's signal frame. This function
   110	 * assumes a valid extension header. So magic and size checking must be done by
   111	 * the caller.
   112	 */
   113	static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
   114	{
   115		long err;
   116		struct __sc_riscv_v_state __user *state = sc_vec;
   117		void __user *datap;
   118	
   119		/*
   120		 * Mark the vstate as clean prior performing the actual copy,
   121		 * to avoid getting the vstate incorrectly clobbered by the
   122		 * discarded vector state.
   123		 *
   124		 * This also allows user to modify vregs through the signal
   125		 * interface at a syscall stop. e.g. to support user space
   126		 * context switching.
   127		 */
   128		preempt_disable();
   129		riscv_v_vstate_set_restore(current, regs);
 > 130		__riscv_v_vstate_clean(regs);
   131		preempt_enable();
   132	
   133		/* Copy everything of __sc_riscv_v_state except datap. */
   134		err = __copy_from_user(&current->thread.vstate, &state->v_state,
   135				       offsetof(struct __riscv_v_ext_state, datap));
   136		if (unlikely(err))
   137			return err;
   138	
   139		/* Copy the pointer datap itself. */
   140		err = __get_user(datap, &state->v_state.datap);
   141		if (unlikely(err))
   142			return err;
   143		/*
   144		 * Copy the whole vector content from user space datap. Use
   145		 * copy_from_user to prevent information leak.
   146		 */
   147		return copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
   148	}
   149	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
