Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C59B2F2C;
	Mon,  6 May 2024 15:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715010218; cv=none; b=mXfARlzLHyXReu1NilJSxOQRm4QG1iMSa0E+CUXpfeVD4UPGJdQBrLCR7AeM5tWS4/KKShauFR+qOtAsjcAaNhpOii80i9NjzEZtURNBOSgLb2OiHP+vNtPt9uyUqlINIPX9HAyE/vRdbtoSFDNL1bpYsUgrm96l5MZ8Hkm6GMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715010218; c=relaxed/simple;
	bh=ARwazpC8M/qH4sFuf4BAsn2h9wj/CWqyQI84Zqh95vg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ukDGteD3FBJsDbvwCRn/M3h2nx7CawEjyXJqMQDJOaE06JQ22PLlW+fW3s/OJSdPfZwk208GtT1+0kClEqpXtt7vXOlSbQVc3+Fj+Ef6Jgb1nfVVmWo7Cxja5FCxAlQ/Dadz4uL22iyEsAveN4EkaxrvyWsCSBUjbl3VuTqi6WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MICHDsFb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MICHDsFb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715010217; x=1746546217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ARwazpC8M/qH4sFuf4BAsn2h9wj/CWqyQI84Zqh95vg=;
  b=MICHDsFbA4s44hOKqhp8KRCX7PSwiUAAhYa4p2anYjMyGDzlpLz0HZBq
   W4Et/et/5yk1THi+nJeWr0uO1avvpcxhtYF7hpjNyOEga9wLavGtYFnji
   AhZj4x8Pvo832e47t2uuWotwaMgJ4S4o3sBc/nTYAIPvFtrUZU7MUbtgM
   QeeTDRCYeVNakLMTTJ3ebXZyc7qUhKFFgixjleDP+D2NEmZUaoDFqX1PN
   6R7+9lIGGwLAkHsFpELlSw7Am4nrYWgk/pI5hpOrM0qG/AkExbIEAbuWo
   IR5p2RSeGz15sFwxxM2ga68wHimY26s7JucnSCHW6Ge8svm3qgieOaGmr
   Q==;
X-CSE-ConnectionGUID: I9d2E2hESZm4ZmiSTCwyAQ==
X-CSE-MsgGUID: wzqTytVXR3u6LtE0upnr4w==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10638460"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="10638460"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 08:43:36 -0700
X-CSE-ConnectionGUID: TyokGbAQSlum2Rk9gGwKaw==
X-CSE-MsgGUID: dSBWuBX9Q1yVm4Rma0BQxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28193672"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 May 2024 08:43:35 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s40V2-0000lP-1M;
	Mon, 06 May 2024 15:43:32 +0000
Date: Mon, 6 May 2024 23:43:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/rfc-v2 21/25]
 arch/x86/kernel/alternative.c:417:17: error: call to undeclared function
 'module_writable_address'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202405062340.eU4eWKR3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/rfc-v2
head:   0caa8ac5e8f2f6de2e75cd2ddd552e8756779944
commit: 4527045f6e1892edac12176b8d82094c35427cdf [21/25] x86/module: perpare module loading for ROX allocations of text
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240506/202405062340.eU4eWKR3-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405062340.eU4eWKR3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405062340.eU4eWKR3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/alternative.c:417:17: error: call to undeclared function 'module_writable_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     417 |         u8 *wr_instr = module_writable_address(mod, instr);
         |                        ^
>> arch/x86/kernel/alternative.c:417:6: error: incompatible integer to pointer conversion initializing 'u8 *' (aka 'unsigned char *') with an expression of type 'int' [-Wint-conversion]
     417 |         u8 *wr_instr = module_writable_address(mod, instr);
         |             ^          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/alternative.c:500:14: error: call to undeclared function 'module_writable_address'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     500 |                 wr_instr = module_writable_address(mod, instr);
         |                            ^
>> arch/x86/kernel/alternative.c:500:12: error: incompatible integer to pointer conversion assigning to 'u8 *' (aka 'unsigned char *') from 'int' [-Wint-conversion]
     500 |                 wr_instr = module_writable_address(mod, instr);
         |                          ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/alternative.c:503:18: error: incompatible integer to pointer conversion assigning to 'u8 *' (aka 'unsigned char *') from 'int' [-Wint-conversion]
     503 |                 wr_replacement = module_writable_address(mod, replacement);
         |                                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   5 errors generated.


vim +/module_writable_address +417 arch/x86/kernel/alternative.c

   409	
   410	/*
   411	 * Rewrite the "call BUG_func" replacement to point to the target of the
   412	 * indirect pv_ops call "call *disp(%ip)".
   413	 */
   414	static int alt_replace_call(u8 *instr, u8 *insn_buff, struct alt_instr *a,
   415				    struct module *mod)
   416	{
 > 417		u8 *wr_instr = module_writable_address(mod, instr);
   418		void *target, *bug = &BUG_func;
   419		s32 disp;
   420	
   421		if (a->replacementlen != 5 || insn_buff[0] != CALL_INSN_OPCODE) {
   422			pr_err("ALT_FLAG_DIRECT_CALL set for a non-call replacement instruction\n");
   423			BUG();
   424		}
   425	
   426		if (a->instrlen != 6 ||
   427		    wr_instr[0] != CALL_RIP_REL_OPCODE ||
   428		    wr_instr[1] != CALL_RIP_REL_MODRM) {
   429			pr_err("ALT_FLAG_DIRECT_CALL set for unrecognized indirect call\n");
   430			BUG();
   431		}
   432	
   433		/* Skip CALL_RIP_REL_OPCODE and CALL_RIP_REL_MODRM */
   434		disp = *(s32 *)(wr_instr + 2);
   435	#ifdef CONFIG_X86_64
   436		/* ff 15 00 00 00 00   call   *0x0(%rip) */
   437		/* target address is stored at "next instruction + disp". */
   438		target = *(void **)(instr + a->instrlen + disp);
   439	#else
   440		/* ff 15 00 00 00 00   call   *0x0 */
   441		/* target address is stored at disp. */
   442		target = *(void **)disp;
   443	#endif
   444		if (!target)
   445			target = bug;
   446	
   447		/* (BUG_func - .) + (target - BUG_func) := target - . */
   448		*(s32 *)(insn_buff + 1) += target - bug;
   449	
   450		if (target == &nop_func)
   451			return 0;
   452	
   453		return 5;
   454	}
   455	
   456	/*
   457	 * Replace instructions with better alternatives for this CPU type. This runs
   458	 * before SMP is initialized to avoid SMP problems with self modifying code.
   459	 * This implies that asymmetric systems where APs have less capabilities than
   460	 * the boot processor are not handled. Tough. Make sure you disable such
   461	 * features by hand.
   462	 *
   463	 * Marked "noinline" to cause control flow change and thus insn cache
   464	 * to refetch changed I$ lines.
   465	 */
   466	void __init_or_module noinline apply_alternatives(struct alt_instr *start,
   467							  struct alt_instr *end,
   468							  struct module *mod)
   469	{
   470		struct alt_instr *a;
   471		u8 *instr, *replacement;
   472		u8 insn_buff[MAX_PATCH_LEN];
   473	
   474		DPRINTK(ALT, "alt table %px, -> %px", start, end);
   475	
   476		/*
   477		 * In the case CONFIG_X86_5LEVEL=y, KASAN_SHADOW_START is defined using
   478		 * cpu_feature_enabled(X86_FEATURE_LA57) and is therefore patched here.
   479		 * During the process, KASAN becomes confused seeing partial LA57
   480		 * conversion and triggers a false-positive out-of-bound report.
   481		 *
   482		 * Disable KASAN until the patching is complete.
   483		 */
   484		kasan_disable_current();
   485	
   486		/*
   487		 * The scan order should be from start to end. A later scanned
   488		 * alternative code can overwrite previously scanned alternative code.
   489		 * Some kernel functions (e.g. memcpy, memset, etc) use this order to
   490		 * patch code.
   491		 *
   492		 * So be careful if you want to change the scan order to any other
   493		 * order.
   494		 */
   495		for (a = start; a < end; a++) {
   496			int insn_buff_sz = 0;
   497			u8 *wr_instr, *wr_replacement;
   498	
   499			instr = (u8 *)&a->instr_offset + a->instr_offset;
 > 500			wr_instr = module_writable_address(mod, instr);
   501	
   502			replacement = (u8 *)&a->repl_offset + a->repl_offset;
   503			wr_replacement = module_writable_address(mod, replacement);
   504	
   505			BUG_ON(a->instrlen > sizeof(insn_buff));
   506			BUG_ON(a->cpuid >= (NCAPINTS + NBUGINTS) * 32);
   507	
   508			/*
   509			 * Patch if either:
   510			 * - feature is present
   511			 * - feature not present but ALT_FLAG_NOT is set to mean,
   512			 *   patch if feature is *NOT* present.
   513			 */
   514			if (!boot_cpu_has(a->cpuid) == !(a->flags & ALT_FLAG_NOT)) {
   515				optimize_nops_inplace(wr_instr, a->instrlen);
   516				continue;
   517			}
   518	
   519			DPRINTK(ALT, "feat: %d*32+%d, old: (%pS (%px) len: %d), repl: (%px, len: %d) flags: 0x%x",
   520				a->cpuid >> 5,
   521				a->cpuid & 0x1f,
   522				instr, instr, a->instrlen,
   523				replacement, a->replacementlen, a->flags);
   524	
   525			memcpy(insn_buff, wr_replacement, a->replacementlen);
   526			insn_buff_sz = a->replacementlen;
   527	
   528			if (a->flags & ALT_FLAG_DIRECT_CALL) {
   529				insn_buff_sz = alt_replace_call(instr, insn_buff, a,
   530								mod);
   531				if (insn_buff_sz < 0)
   532					continue;
   533			}
   534	
   535			for (; insn_buff_sz < a->instrlen; insn_buff_sz++)
   536				insn_buff[insn_buff_sz] = 0x90;
   537	
   538			apply_relocation(insn_buff, a->instrlen, instr, replacement, a->replacementlen);
   539	
   540			DUMP_BYTES(ALT, wr_instr, a->instrlen, "%px:   old_insn: ", instr);
   541			DUMP_BYTES(ALT, replacement, a->replacementlen, "%px:   rpl_insn: ", replacement);
   542			DUMP_BYTES(ALT, insn_buff, insn_buff_sz, "%px: final_insn: ", instr);
   543	
   544			text_poke_early(wr_instr, insn_buff, insn_buff_sz);
   545		}
   546	
   547		kasan_enable_current();
   548	}
   549	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
