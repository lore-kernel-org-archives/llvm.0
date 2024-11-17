Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2574F4ED;
	Sun, 17 Nov 2024 05:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731820620; cv=none; b=U4MweYrkBHw+yE0fpRDKXtvOwTm6CRQZwcGs1dJ+bMz1c1BLe2HFcDb/Q66NeuXbsvn2JSpWZhepcszSlescBSoF5NOTl9SqTpxUZ5FO+MsX/yKCK7DA5ulrmdNDs9uUVOT+MTRN3XHZNcnhNdL/iKPjL4qjkua8nGaHmcvcHdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731820620; c=relaxed/simple;
	bh=9pXqJaB3ouG3j35hZbHpi5Gqxkq02ialnsbdWCe7his=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mak2ZFFZKoP3aOrQC4wgxDJd2b6kE+qcMFuU9o5g+zx7JVB36/+AFG+RqytFRg8+Xrp1llg62tmanOdZUj/WEFy00cnUluDXJxHSohSTeA1iuHSj731IcOftqiteMhq9qJCdqCUp3+cAhygpi7JXZHMjN3NDywW0ljqQ9ePW1vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cu8dW1Ry; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cu8dW1Ry"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731820619; x=1763356619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9pXqJaB3ouG3j35hZbHpi5Gqxkq02ialnsbdWCe7his=;
  b=Cu8dW1RygRDOIH3z5YhyaxBMVUBH4dDgrhX9Jq0Z3GX1axyF+nqbgUPX
   4cVl4tx5CR3XQOMWKd/CinufQrJ7bc2i3wY7/TJ6CMZ0SYRWRFnalKN2+
   o3qxfjLnDxGMmqckeHZyPP59V/VdxQO0SNCZVcc0J6i75qjKnUe/EkE3Y
   zVGa3dt6pShh07W6ikbKxUcmfOjqideySkMbsWA9lTilDdjiDpLLInCsQ
   vorF5ScOrl5DcMCwXRNUPL6mFtom1kUXpN7tv5YxXqqrDNWjWr4B8APnZ
   vzOjVnwlGqlE9lcgX5cDEoEmHINJalUWtGEOA+Sv+bOjjX+eMw8VIQUIm
   Q==;
X-CSE-ConnectionGUID: KYut6LR5TgCZ9sTmfdorPA==
X-CSE-MsgGUID: apMmVKNXTpKWKudkz8USyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="43182547"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="43182547"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 21:16:58 -0800
X-CSE-ConnectionGUID: vfx+C3iSRq+Sh4ruGa+3ww==
X-CSE-MsgGUID: LoczF6rBTTmKBpeoWKhXgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88677866"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2024 21:16:57 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCXeY-0001Yw-2O;
	Sun, 17 Nov 2024 05:16:54 +0000
Date: Sun, 17 Nov 2024 13:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/ibt 5/8] arch/x86/kernel/traps.c:136:14: error:
 call to undeclared function 'X86_MODRB_RM'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202411171303.coBhwMQi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/ibt
head:   72c0a686dca37ac0f2ed213b2be9487ae091bb99
commit: 3b8ca79166ffec0c374f9efa2f30946f335c3442 [5/8] x86/traps: Cleanup and robustify decode_bug()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241117/202411171303.coBhwMQi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171303.coBhwMQi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171303.coBhwMQi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/traps.c:17:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kernel/traps.c:136:14: error: call to undeclared function 'X86_MODRB_RM'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     136 |         case 0: if (X86_MODRB_RM(v) == 5)
         |                     ^
   4 warnings and 1 error generated.


vim +/X86_MODRB_RM +136 arch/x86/kernel/traps.c

    94	
    95	/*
    96	 * Check for UD1 or UD2, accounting for Address Size Override Prefixes.
    97	 * If it's a UD1, further decode to determine its use:
    98	 *
    99	 * UBSan{0}:     67 0f b9 00             ud1    (%eax),%eax
   100	 * UBSan{10}:    67 0f b9 40 10          ud1    0x10(%eax),%eax
   101	 * static_call:  0f b9 cc                ud1    %esp,%ecx
   102	 *
   103	 * Notably UBSAN uses EAX, static_call uses ECX.
   104	 */
   105	__always_inline int decode_bug(unsigned long addr, s32 *imm, int *len)
   106	{
   107		unsigned long start = addr;
   108		u8 v;
   109	
   110		if (addr < TASK_SIZE_MAX)
   111			return BUG_NONE;
   112	
   113		v = *(u8 *)(addr++);
   114		if (v == INSN_ASOP)
   115			v = *(u8 *)(addr++);
   116		if (v != OPCODE_ESCAPE)
   117			return BUG_NONE;
   118	
   119		v = *(u8 *)(addr++);
   120		if (v == SECOND_BYTE_OPCODE_UD2) {
   121			*len = addr - start;
   122			return BUG_UD2;
   123		}
   124	
   125		if (v != SECOND_BYTE_OPCODE_UD1)
   126			return BUG_NONE;
   127	
   128		*imm = 0;
   129		v = *(u8 *)(addr++);		/* ModRM */
   130	
   131		if (X86_MODRM_MOD(v) != 3 && X86_MODRM_RM(v) == 4)
   132			addr++;			/* SIB */
   133	
   134		/* Decode immediate, if present */
   135		switch (X86_MODRM_MOD(v)) {
 > 136		case 0: if (X86_MODRB_RM(v) == 5)
   137				addr += 4; /* RIP + disp32 */
   138			break;
   139	
   140		case 1: *imm = *(s8 *)addr;
   141			addr += 1;
   142			break;
   143	
   144		case 2: *imm = *(s32 *)addr;
   145			addr += 4;
   146			break;
   147	
   148		case 3: break;
   149		}
   150	
   151		/* record instruction length */
   152		*len = addr - start;
   153	
   154		if (X86_MODRM_REG(v) == 0)	/* EAX */
   155			return BUG_UD1_UBSAN;
   156	
   157		return BUG_UD1;
   158	}
   159	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
