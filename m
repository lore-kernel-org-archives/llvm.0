Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460D41754B;
	Sat, 14 Sep 2024 23:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726357407; cv=none; b=MwtA3kXFhJ2niJc2xiipceGwoRwX6gFEVNUSiEWG8CLJveWXqAxEqST37sfyFeYMa9VzihPKd2ZrMaCK4CcpMREA5EDdbr9R5NWDuDoZEADFOV7T4T19YicSJ+NQLzJ635/hGnoO+TsptYCLwKtXe+VcginmIkL+nNMkk5PYs34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726357407; c=relaxed/simple;
	bh=gkRKUed5Sk6FzMovXBna4TuBCWRBB0QXphdp8Faf3NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJTsjo5WGbzlhlfDPPoVvs6bbIu1V3LTbst6NWIZQ88UMoCtsb4KsnFoIRRIFMN+bHokBOfkab9pmxNc0uB8OErLK1twRNvwzmqG5saIuJ9ENdo5WpaKb/N/ApEyXtNpR4NKnT0ygJWPr6h3jlzzLjtT2jUGRk83iCDyi9BtrY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=md80tTiB; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="md80tTiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726357405; x=1757893405;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gkRKUed5Sk6FzMovXBna4TuBCWRBB0QXphdp8Faf3NM=;
  b=md80tTiBfPjdavCIqDN6JAKQqU20PpgOhbl1L8Snaak+oEt1kzl26fGB
   AOrKI+I6BKjTFztGgCrQl/SphTJR9Oc9Bj7B2tcaUcBDTIWl2KrRXvvSh
   2bOD87BQBtwN9796WYqr68JNjrVxewEd8IYA7qUV6XjpTxfpIRcwhbsTf
   p7JH5a6uZjCNNKLo3P0dngMMdh8u+ziluEj/U52IZsdIH84KZsJkoVtpz
   tAeqRV+3jgK1DMnjmpSbMYJxNnuHGL3HZOgHgFHkHoY5hNmbR6YaFCcEo
   8WlfSvSDUwINZPv7eQRrVVLvTsk8Jow/EehU80I6V9IdSEb/A9fYiLNQe
   Q==;
X-CSE-ConnectionGUID: 3+srJPjlR6uCaDuBfQILvw==
X-CSE-MsgGUID: TdUymdVWQRCF3aIyJVeJFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="25355069"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="25355069"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2024 16:43:25 -0700
X-CSE-ConnectionGUID: h4I2jXSuT/2XjKiksS2kvQ==
X-CSE-MsgGUID: oVsjSTgOQCyO/z72IYo0PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="105947002"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 14 Sep 2024 16:43:23 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spcQD-0008F8-0V;
	Sat, 14 Sep 2024 23:43:21 +0000
Date: Sun, 15 Sep 2024 07:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Fares Mehanna <faresx@amazon.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/7] arm64: KVM: Allocate vCPU gp-regs dynamically on
 VHE and KERNEL_SECRETMEM enabled systems
Message-ID: <202409150756.yWzvbCgJ-lkp@intel.com>
References: <20240911143421.85612-6-faresx@amazon.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911143421.85612-6-faresx@amazon.de>

Hi Fares,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on linus/master v6.11-rc7]
[cannot apply to kvmarm/next akpm-mm/mm-everything next-20240913]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fares-Mehanna/mseal-expose-interface-to-seal-unseal-user-memory-ranges/20240911-223945
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/20240911143421.85612-6-faresx%40amazon.de
patch subject: [RFC PATCH 5/7] arm64: KVM: Allocate vCPU gp-regs dynamically on VHE and KERNEL_SECRETMEM enabled systems
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240915/202409150756.yWzvbCgJ-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409150756.yWzvbCgJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409150756.yWzvbCgJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/va_layout.c:7:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/va_layout.c:188:13: warning: no previous prototype for function 'kvm_update_ctxt_gp_regs' [-Wmissing-prototypes]
     188 | void __init kvm_update_ctxt_gp_regs(struct alt_instr *alt,
         |             ^
   arch/arm64/kvm/va_layout.c:188:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     188 | void __init kvm_update_ctxt_gp_regs(struct alt_instr *alt,
         | ^
         | static 
   6 warnings generated.


vim +/kvm_update_ctxt_gp_regs +188 arch/arm64/kvm/va_layout.c

   187	
 > 188	void __init kvm_update_ctxt_gp_regs(struct alt_instr *alt,
   189					    __le32 *origptr, __le32 *updptr, int nr_inst)
   190	{
   191		u32 rd, rn, imm, insn, oinsn;
   192	
   193		BUG_ON(nr_inst != 1);
   194	
   195		if (!kvm_use_dynamic_regs())
   196			return;
   197	
   198		oinsn = le32_to_cpu(origptr[0]);
   199		rd = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RD, oinsn);
   200		rn = aarch64_insn_decode_register(AARCH64_INSN_REGTYPE_RN, oinsn);
   201		imm = offsetof(struct kvm_cpu_context, regs);
   202	
   203		insn = aarch64_insn_gen_load_store_imm(rd, rn, imm,
   204						       AARCH64_INSN_SIZE_64,
   205						       AARCH64_INSN_LDST_LOAD_IMM_OFFSET);
   206		BUG_ON(insn == AARCH64_BREAK_FAULT);
   207	
   208		updptr[0] = cpu_to_le32(insn);
   209	}
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
