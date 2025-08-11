Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1719F1EEA5F;
	Mon, 11 Aug 2025 10:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754906455; cv=none; b=GZXQUWOCBRJU5z1WneCyfxyTHj4nR/i6I1DW3EloJwQD9ogqn2M2DdAII+EgykEcyTcOz8pCpqV+YyWXW23ib168wY3jWm5sNMDahaa5JwcnZLOBG8iuz3FGbhTzztFNlg7tNtGMzQ8ftcrJ5gUcIPwT3lT+pdZ+vvRnyoXSg4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754906455; c=relaxed/simple;
	bh=eoNcguzZOO501KYzMaJMznD4BKlQaqbxO4WlISjvEN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fXAsrELUSUxsisteJ6ELWZd+5HyxH2oSFZSPDR3tYWOKyOZ/aTd3+c07vJjyTF5N9ZNedyV5DyPdA9jPyMWLbA5l5WLIgnYFbwsPM1y8W6iBO2CUobL4TT+z3a8uqVX2mKHDoQnfSJ715QU3rhbZjlrvvi/tD/vm37XwHcDO/Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NwIKimmN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwIKimmN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754906454; x=1786442454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eoNcguzZOO501KYzMaJMznD4BKlQaqbxO4WlISjvEN4=;
  b=NwIKimmNYv7LI2uiNvndrQnmMdsp5TrVRi9Zj1UCq0ceKCJbdMqyZzZd
   pE8QR9n9mPef2TQPQmcA3DCQZcn3n1fyYjNOcJG09h1YyTt3qtNR/laYK
   WhAtd4iuoOQ/6jJ/81RasJJLKjFzqWs7+GVqa9niN9SCWOmHLFoyjx3wA
   IcKxd4rIsQ7BoaaYESDBjn0BZUH8Nd+bzkeSVhiKV44PT3G2e81gJJdgR
   t9Vul3/5DDfvgKAIe7FGKPxld/MzANRRdM4v+cQSfgrzihzTiU2mJx/ke
   1XopxyxGLFMdBLjqk04ZS57AWrcNu2HRVjUFgpjahVFLPedZXm66oqDAn
   Q==;
X-CSE-ConnectionGUID: p5uQV1zUSzWY+wx1zXAAHQ==
X-CSE-MsgGUID: eRyN9pCQTYCCxydl4i5/bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="68234648"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="68234648"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 03:00:52 -0700
X-CSE-ConnectionGUID: vGrtUSJtQGe+T/DNfV0L2w==
X-CSE-MsgGUID: EIHRSXICRNWr6OHyym69aQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="166668578"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Aug 2025 03:00:50 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulPKP-0005kk-29;
	Mon, 11 Aug 2025 10:00:36 +0000
Date: Mon, 11 Aug 2025 17:59:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_apei_v1 32/55] arch/riscv/kernel/kgdb.c:38:31:
 error: incompatible integer to pointer conversion passing 'unsigned int' to
 parameter of type 'ulong *' (aka 'unsigned long *')
Message-ID: <202508111709.XQryIX6L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_apei_v1
head:   eaca137f211dcb260f7eb52d983ddad7f27277f3
commit: 87868b1826434a428632177d565fce3d8ebe43dd [32/55] riscv: Add insn.c, consolidate instruction decoding
config: riscv-randconfig-002-20250811 (https://download.01.org/0day-ci/archive/20250811/202508111709.XQryIX6L-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250811/202508111709.XQryIX6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508111709.XQryIX6L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/kgdb.c:38:31: error: incompatible integer to pointer conversion passing 'unsigned int' to parameter of type 'ulong *' (aka 'unsigned long *') [-Wint-conversion]
      38 |         error = get_insn(regs, addr, stepped_opcode);
         |                                      ^~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:555:54: note: passing argument to parameter 'r_insn' here
     555 | int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn);
         |                                                      ^
   1 error generated.


vim +38 arch/riscv/kernel/kgdb.c

    25	
    26	static int do_single_step(struct pt_regs *regs)
    27	{
    28		/* Determine where the target instruction will send us to */
    29		unsigned long addr, insn;
    30		int error = get_insn(regs, regs->epc, &insn);
    31	
    32		if (error)
    33			return error;
    34	
    35		addr = get_step_address(regs, insn);
    36	
    37		/* Store the op code in the stepped address */
  > 38		error = get_insn(regs, addr, stepped_opcode);
    39		if (error)
    40			return error;
    41	
    42		stepped_address = addr;
    43	
    44		/* Replace the op code with the break instruction */
    45		error = copy_to_kernel_nofault((void *)stepped_address,
    46					   arch_kgdb_ops.gdb_bpt_instr,
    47					   BREAK_INSTR_SIZE);
    48		/* Flush and return */
    49		if (!error) {
    50			flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
    51			kgdb_single_step = 1;
    52			atomic_set(&kgdb_cpu_doing_single_step,
    53				   raw_smp_processor_id());
    54		} else {
    55			stepped_address = 0;
    56			stepped_opcode = 0;
    57		}
    58		return error;
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
