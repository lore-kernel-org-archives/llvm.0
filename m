Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164824C96;
	Sun, 16 Mar 2025 01:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742087820; cv=none; b=J+H9/a2XZ7oluj6RDChg92Gb4c+sIZ23hFo1ciSTrKXGlRlmpDoH6PYAVooTEYV0+xpx1K1YgoQbKWpEdjzGZbbnAFmGzbp5rp6qXFvHtWWbes6aIT0lFzr5p5J7uTTxQbaozZvZYwuuDLn1CqJbSziS+NBsiuHHkM71Obl4pOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742087820; c=relaxed/simple;
	bh=SSAZS0Aw8X7I+lmtlf1UTRPtQEiv9h3mzLxk5QChPPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvfrv/2c18jyN8nG6C1ZOJlyxOEaBWm7zsD42OXuXl/kwsIcQRv9dTSl7YScDGXQuqkzglxXe6JXKhwhipT5jm3Xn7IGdxPftEtTiy5MzM8fvA7ZM8/WQ5sXcmbbMoI5vwafuojeHZlMwl69Y2dV4gyDC85RXOcTPjz6EqBS1xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=huafWbJi; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="huafWbJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742087819; x=1773623819;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SSAZS0Aw8X7I+lmtlf1UTRPtQEiv9h3mzLxk5QChPPc=;
  b=huafWbJiIl0MHwUkZG6/VvkXDnDVpE6B2Y1Cew9YszNqIQPCS3H0NLwo
   3r4eFEikPzZ3rmORK/YXF2okpxBrc+MtO4NLhF/Hl6X6z7muRVRV2t6/i
   7d8CD6ZFEcNeAKfosfPB3ey/4Bx4dWNjo3xY35N4gDsQSEzKw/nnBLnv9
   zyOX/3RN1FwsgFWXQeV1hAB+KaacanPXkZ8SEMOJfBytD8prrKUJaBj/2
   zQK7GmgIoLY/JPuVrAQf8FNRvF3uf5Ue8tfADkZBCUnAnfv+gyqeGltiL
   82cKy905uRjfob/fwqZbzUUhN5pn8VF60PrFojbCNNZyncPeDMy5dGpo8
   w==;
X-CSE-ConnectionGUID: FWCV3jEXTCqn/cZFnXkNLg==
X-CSE-MsgGUID: 5VuGcp+LQG+OJjTa19SHhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="45977540"
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="45977540"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 18:16:58 -0700
X-CSE-ConnectionGUID: cWRnzUJ5QriF7b36Uq0b9A==
X-CSE-MsgGUID: ESDT0N2/SLCTX94sQwGBXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,251,1736841600"; 
   d="scan'208";a="144792764"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2025 18:16:56 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttccX-000Bkh-1F;
	Sun, 16 Mar 2025 01:16:53 +0000
Date: Sun, 16 Mar 2025 09:16:41 +0800
From: kernel test robot <lkp@intel.com>
To: Pu Lehui <pulehui@huaweicloud.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Pu Lehui <pulehui@huawei.com>
Subject: Re: [PATCH] riscv: fgraph: Fix stack layout to match
 __arch_ftrace_regs argument of ftrace_return_to_handler
Message-ID: <202503160820.dvqMpH0g-lkp@intel.com>
References: <20250311132243.2178271-1-pulehui@huaweicloud.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311132243.2178271-1-pulehui@huaweicloud.com>

Hi Pu,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.14-rc6 next-20250314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pu-Lehui/riscv-fgraph-Fix-stack-layout-to-match-__arch_ftrace_regs-argument-of-ftrace_return_to_handler/20250311-212440
base:   linus/master
patch link:    https://lore.kernel.org/r/20250311132243.2178271-1-pulehui%40huaweicloud.com
patch subject: [PATCH] riscv: fgraph: Fix stack layout to match __arch_ftrace_regs argument of ftrace_return_to_handler
config: riscv-randconfig-001-20250316 (https://download.01.org/0day-ci/archive/20250316/202503160820.dvqMpH0g-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 87916f8c32ebd8e284091db9b70339df57fd1e90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250316/202503160820.dvqMpH0g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503160820.dvqMpH0g-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:1:14: error: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
   addi sp, sp, -FREGS_SIZE_ON_STACK
                ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
>> <instantiation>:2:17: error: unexpected token
    sw ra, FREGS_RA(sp)
                   ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
   <instantiation>:3:17: error: unexpected token
    sw s0, FREGS_S0(sp)
                   ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
   <instantiation>:4:17: error: unexpected token
    sw a0, FREGS_A0(sp)
                   ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
   <instantiation>:5:17: error: unexpected token
    sw a1, FREGS_A1(sp)
                   ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
   <instantiation>:6:15: error: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
    addi s0, sp, FREGS_SIZE_ON_STACK
                 ^
   arch/riscv/kernel/mcount.S:73:2: note: while in macro instantiation
    SAVE_RET_ABI_STATE
    ^
   <instantiation>:1:16: error: unexpected token
   lw ra, FREGS_RA(sp)
                  ^
   arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
    RESTORE_RET_ABI_STATE
    ^
>> <instantiation>:2:17: error: unexpected token
    lw s0, FREGS_S0(sp)
                   ^
   arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
    RESTORE_RET_ABI_STATE
    ^
   <instantiation>:3:17: error: unexpected token
    lw a0, FREGS_A0(sp)
                   ^
   arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
    RESTORE_RET_ABI_STATE
    ^
   <instantiation>:4:17: error: unexpected token
    lw a1, FREGS_A1(sp)
                   ^
   arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
    RESTORE_RET_ABI_STATE
    ^
   <instantiation>:5:15: error: operand must be a symbol with %lo/%pcrel_lo/%tprel_lo modifier or an integer in the range [-2048, 2047]
    addi sp, sp, FREGS_SIZE_ON_STACK
                 ^
   arch/riscv/kernel/mcount.S:77:2: note: while in macro instantiation
    RESTORE_RET_ABI_STATE
    ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
