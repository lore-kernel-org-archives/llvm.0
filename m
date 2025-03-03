Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5871F1300;
	Mon,  3 Mar 2025 09:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740995400; cv=none; b=R2z/BtK8baGfbSeUCw+sJnEU+3cDL1T53A1gAdMkd5hBNNkBPNT/BsaVqTd3EWbOZfcaJuSwyh2y2v4SgMKiDfXUkU5DdwzOJXBV3oUr7+xPUFYzO2WRhm5KEXIYjXkaIj6lLb9x5x6L7/JWwSBryrvnIwgyrGkjDupOaN208A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740995400; c=relaxed/simple;
	bh=5LFWuroQqtxCd4wrohBegr6trgaMBQODdAVh52K/+Fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGMCtSvEEUwNA1NtuKTf6pP8DX8BEwLpi22SN1k7zetHUOHUeOBuPc+/sOJtAONG0h8TDUX6/gXwH5e818zHxbbhX5wzhVWjBLsPebhi4D7vJ1bYdToDSuBR0pPGTXolETQkI37cdSlboIESWKIAHQXiX1mHncU49HX/kcxgY5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MARAhn+o; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MARAhn+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740995399; x=1772531399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5LFWuroQqtxCd4wrohBegr6trgaMBQODdAVh52K/+Fk=;
  b=MARAhn+oxLnij7GfIbdO4dYTPE4ZmftZCghYpNjtJZQlgm2uLsmsqg06
   An7y6PO2Pc9JaqeQm/28FOev3Eb2d+re5xxGc5n6Svyg3BotRXvDzZLaV
   keNjD0h/q7LdvZTZf0TTVQqYrQkVNoY1GTv9HLn9t1qRv6r2G28gG+kLH
   kqGKIZK+cb62Nz1bosrl4/e+km2QusCH0hOCEZ0DEia+PFf3m1ZQeDulH
   neod4T8ij0cVNOUSHwV0yVi4lho2SJ4VkD2rJB8Dr+QmtcfXVGcF4CgPe
   sZAQRaRJJyi0mDBRHTFdDai/k2aQ84xq3EYE0PsGqPNvk1YkzXILFaIjf
   g==;
X-CSE-ConnectionGUID: j/+GtpDuTtSs7pu4QTICOg==
X-CSE-MsgGUID: PlTVNfoPQVGQBUAUrG42jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="44674356"
X-IronPort-AV: E=Sophos;i="6.13,329,1732608000"; 
   d="scan'208";a="44674356"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 01:49:59 -0800
X-CSE-ConnectionGUID: WDFRoaqQRtmUxcASYm6NFg==
X-CSE-MsgGUID: YSt+ic8eQ7iN5NflqqY67Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118503786"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Mar 2025 01:49:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tp2Qn-000IIf-0J;
	Mon, 03 Mar 2025 09:49:49 +0000
Date: Mon, 3 Mar 2025 17:49:47 +0800
From: kernel test robot <lkp@intel.com>
To: Menglong Dong <menglong8.dong@gmail.com>, peterz@infradead.org,
	rostedt@goodmis.org, mark.rutland@arm.com,
	alexei.starovoitov@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org,
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
	ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
	martin.lau@linux.dev, eddyz87@gmail.com, yonghong.song@linux.dev,
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
	jolsa@kernel.org, davem@davemloft.net, dsahern@kernel.org,
	mathieu.desnoyers@efficios.com, nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com, morbo@google.com,
	samitolvanen@google.com
Subject: Re: [PATCH bpf-next v3 3/4] x86: implement per-function metadata
 storage for x86
Message-ID: <202503031725.l0g9wxdD-lkp@intel.com>
References: <20250303065345.229298-4-dongml2@chinatelecom.cn>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303065345.229298-4-dongml2@chinatelecom.cn>

Hi Menglong,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/x86-ibt-factor-out-cfi-and-fineibt-offset/20250303-145934
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250303065345.229298-4-dongml2%40chinatelecom.cn
patch subject: [PATCH bpf-next v3 3/4] x86: implement per-function metadata storage for x86
config: x86_64-buildonly-randconfig-001-20250303 (https://download.01.org/0day-ci/archive/20250303/202503031725.l0g9wxdD-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503031725.l0g9wxdD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503031725.l0g9wxdD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/net/bpf_jit_comp.c:420:18: error: use of undeclared identifier 'CFI_INSN_OFFSET'
     420 |         for (i = 0; i < CFI_INSN_OFFSET - 16; i++)
         |                         ^
   arch/x86/net/bpf_jit_comp.c:443:18: error: use of undeclared identifier 'CFI_INSN_OFFSET'
     443 |         for (i = 0; i < CFI_INSN_OFFSET - 5; i++)
         |                         ^
   2 errors generated.


vim +/CFI_INSN_OFFSET +420 arch/x86/net/bpf_jit_comp.c

00bc8988807985 Leon Hwang     2024-01-04  408  
4f9087f16651ac Peter Zijlstra 2023-12-15  409  /*
4f9087f16651ac Peter Zijlstra 2023-12-15  410   * Emit the various CFI preambles, see asm/cfi.h and the comments about FineIBT
4f9087f16651ac Peter Zijlstra 2023-12-15  411   * in arch/x86/kernel/alternative.c
4f9087f16651ac Peter Zijlstra 2023-12-15  412   */
4f9087f16651ac Peter Zijlstra 2023-12-15  413  
2cd3e3772e4137 Peter Zijlstra 2023-12-15  414  static void emit_fineibt(u8 **pprog, u32 hash)
4f9087f16651ac Peter Zijlstra 2023-12-15  415  {
4f9087f16651ac Peter Zijlstra 2023-12-15  416  	u8 *prog = *pprog;
9dcf71673a9c8e Menglong Dong  2025-03-03  417  #ifdef CONFIG_CALL_PADDING
9dcf71673a9c8e Menglong Dong  2025-03-03  418  	int i;
9dcf71673a9c8e Menglong Dong  2025-03-03  419  
9dcf71673a9c8e Menglong Dong  2025-03-03 @420  	for (i = 0; i < CFI_INSN_OFFSET - 16; i++)
9dcf71673a9c8e Menglong Dong  2025-03-03  421  		EMIT1(0x90);
9dcf71673a9c8e Menglong Dong  2025-03-03  422  #endif
4f9087f16651ac Peter Zijlstra 2023-12-15  423  
4f9087f16651ac Peter Zijlstra 2023-12-15  424  	EMIT_ENDBR();
e72d88d18df4e0 Peter Zijlstra 2023-12-15  425  	EMIT3_off32(0x41, 0x81, 0xea, hash);		/* subl $hash, %r10d	*/
4f9087f16651ac Peter Zijlstra 2023-12-15  426  	EMIT2(0x74, 0x07);				/* jz.d8 +7		*/
4f9087f16651ac Peter Zijlstra 2023-12-15  427  	EMIT2(0x0f, 0x0b);				/* ud2			*/
4f9087f16651ac Peter Zijlstra 2023-12-15  428  	EMIT1(0x90);					/* nop			*/
4f9087f16651ac Peter Zijlstra 2023-12-15  429  	EMIT_ENDBR_POISON();
4f9087f16651ac Peter Zijlstra 2023-12-15  430  
4f9087f16651ac Peter Zijlstra 2023-12-15  431  	*pprog = prog;
4f9087f16651ac Peter Zijlstra 2023-12-15  432  }
4f9087f16651ac Peter Zijlstra 2023-12-15  433  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
