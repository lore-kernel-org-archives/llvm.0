Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A463213665A;
	Sun,  9 Mar 2025 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741511052; cv=none; b=h4Y9/ZqQBFjPumRYCSOOpPK9M9PX3EF6AGwvQK7G53y8yL+Q/+5UBFpmrv72H1QgavCr7Q6FNLeC2nZp50INTeVmi6fyOg0hscet/8JAR2QxMablwYWgVuGNCRtZucSKu5oVL5Ac0CK6s6GOP5D5Nv+QY96tp0OQORNs3skLlqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741511052; c=relaxed/simple;
	bh=63WBFYs5qH1ZNqwlOPfqAFd+SnO0pCo7KYpOr5GvfIs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OoFt+kSZ8y9DnMv1sSUxtG68WOsBnEvwLiPcdgBCTvQuEIpDaO/FZTJt3ALTcBM64OKtmRAnJCSMzneCN19z3X5nHCl+nN7FtmLOKAhJx1V8R13k/inqn4PhsJ9ekYP1bLgdT/h0WK2rzYOyp9PQDcz3tgK36zoT9DpYrT2n88A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OH+JxCfF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OH+JxCfF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741511051; x=1773047051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63WBFYs5qH1ZNqwlOPfqAFd+SnO0pCo7KYpOr5GvfIs=;
  b=OH+JxCfFqST/k8tpnHf7PIh/yo63S9u0dhOQnaW6uY7C+9ZiU6aZIjf7
   fEAjjBZtyWTDmsMR8CS444bue8VnY47/s46DK2V1/6NlmpSoJy4ivzPt5
   qIJ2WS7OGFeC066/z6zq3y6Bds07lA+fch3kU80427GOsPQazvmuTdWV0
   F5LEE4zYd32swRd4d1k1jKHgsD2+wchwgkND+I9fFGpgNQghNBeROtIr8
   ZNPhNFiu1W3KH02AiV1LB42c9iXGbyG+uzgczIa3tmGCfhXHwpOtwjV/I
   CQCUvY4xJsqrOFUzsr2T4m+GZ8tFknUZsCHJe9Ah5Rwfx4PqzgCVK/B0a
   A==;
X-CSE-ConnectionGUID: 2oUbv1joThmBj71QcNxyDA==
X-CSE-MsgGUID: UXF6oEmoQaejG2ziOc3VNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="64959253"
X-IronPort-AV: E=Sophos;i="6.14,233,1736841600"; 
   d="scan'208";a="64959253"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 01:04:11 -0800
X-CSE-ConnectionGUID: fZ2bRN+fQV2BwLgzrbbsJA==
X-CSE-MsgGUID: 3+uruTk+T0qaCCD3B0GyPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="119662563"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 09 Mar 2025 01:04:08 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trCZq-0002s4-1p;
	Sun, 09 Mar 2025 09:04:06 +0000
Date: Sun, 9 Mar 2025 17:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_1 19/20] kernel/seccomp.c:769:2:
 error: expected identifier or '('
Message-ID: <202503091607.0YyJJrwm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_1
head:   c63f2f86076da544bc726c0e4dc9cb92f556b3d5
commit: 637a4f5485c20fbeb03d920745ae345b81406600 [19/20] seccomp: passthrough uprobe systemcall without filtering
config: riscv-randconfig-001-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091607.0YyJJrwm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091607.0YyJJrwm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091607.0YyJJrwm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/seccomp.c:747:7: warning: unused variable 'op_res' [-Wunused-variable]
           bool op_res;
                ^
   kernel/seccomp.c:746:15: warning: unused variable 'pc' [-Wunused-variable]
           unsigned int pc;
                        ^
   kernel/seccomp.c:745:15: warning: unused variable 'reg_value' [-Wunused-variable]
           unsigned int reg_value = 0;
                        ^
>> kernel/seccomp.c:767:2: warning: non-void function does not return a value in all control paths [-Wreturn-type]
           }
           ^
>> kernel/seccomp.c:769:2: error: expected identifier or '('
           for (pc = 0; pc < fprog->len; pc++) {
           ^
   kernel/seccomp.c:828:2: error: expected identifier or '('
           WARN_ON(1);
           ^
   include/asm-generic/bug.h:122:29: note: expanded from macro 'WARN_ON'
   #define WARN_ON(condition) ({                                           \
                               ^
>> kernel/seccomp.c:828:2: error: expected ')'
   include/asm-generic/bug.h:122:29: note: expanded from macro 'WARN_ON'
   #define WARN_ON(condition) ({                                           \
                               ^
   kernel/seccomp.c:828:2: note: to match this '('
   include/asm-generic/bug.h:122:28: note: expanded from macro 'WARN_ON'
   #define WARN_ON(condition) ({                                           \
                              ^
   kernel/seccomp.c:829:2: error: expected identifier or '('
           return false;
           ^
>> kernel/seccomp.c:830:1: error: extraneous closing brace ('}')
   }
   ^
   4 warnings and 5 errors generated.


vim +769 kernel/seccomp.c

c8bee430dc52cf Kees Cook   2014-06-27  734  
8e01b51a31a1e0 YiFei Zhu   2020-10-11  735  #ifdef SECCOMP_ARCH_NATIVE
8e01b51a31a1e0 YiFei Zhu   2020-10-11  736  /**
8e01b51a31a1e0 YiFei Zhu   2020-10-11  737   * seccomp_is_const_allow - check if filter is constant allow with given data
8e01b51a31a1e0 YiFei Zhu   2020-10-11  738   * @fprog: The BPF programs
8e01b51a31a1e0 YiFei Zhu   2020-10-11  739   * @sd: The seccomp data to check against, only syscall number and arch
8e01b51a31a1e0 YiFei Zhu   2020-10-11  740   *      number are considered constant.
8e01b51a31a1e0 YiFei Zhu   2020-10-11  741   */
8e01b51a31a1e0 YiFei Zhu   2020-10-11  742  static bool seccomp_is_const_allow(struct sock_fprog_kern *fprog,
8e01b51a31a1e0 YiFei Zhu   2020-10-11  743  				   struct seccomp_data *sd)
8e01b51a31a1e0 YiFei Zhu   2020-10-11  744  {
8e01b51a31a1e0 YiFei Zhu   2020-10-11  745  	unsigned int reg_value = 0;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  746  	unsigned int pc;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  747  	bool op_res;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  748  
8e01b51a31a1e0 YiFei Zhu   2020-10-11  749  	if (WARN_ON_ONCE(!fprog))
8e01b51a31a1e0 YiFei Zhu   2020-10-11  750  		return false;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  751  
cf6cb56ef24410 Eyal Birger 2025-02-02  752  	/* Our single exception to filtering. */
637a4f5485c20f Jiri Olsa   2025-03-08  753  #if defined __NR_uretprobe || defined __NR_uprobe
cf6cb56ef24410 Eyal Birger 2025-02-02  754  #ifdef SECCOMP_ARCH_COMPAT
cf6cb56ef24410 Eyal Birger 2025-02-02  755  	if (sd->arch == SECCOMP_ARCH_NATIVE)
cf6cb56ef24410 Eyal Birger 2025-02-02  756  #endif
637a4f5485c20f Jiri Olsa   2025-03-08  757  	{
637a4f5485c20f Jiri Olsa   2025-03-08  758  #ifdef __NR_uretprobe
cf6cb56ef24410 Eyal Birger 2025-02-02  759  		if (sd->nr == __NR_uretprobe)
cf6cb56ef24410 Eyal Birger 2025-02-02  760  			return true;
cf6cb56ef24410 Eyal Birger 2025-02-02  761  #endif
637a4f5485c20f Jiri Olsa   2025-03-08  762  #ifdef __NR_uprobe
637a4f5485c20f Jiri Olsa   2025-03-08  763  		if (sd->nr == __NR_uprobe)
637a4f5485c20f Jiri Olsa   2025-03-08  764  			return true;
637a4f5485c20f Jiri Olsa   2025-03-08  765  #endif
637a4f5485c20f Jiri Olsa   2025-03-08  766  #endif
637a4f5485c20f Jiri Olsa   2025-03-08 @767  	}
cf6cb56ef24410 Eyal Birger 2025-02-02  768  
8e01b51a31a1e0 YiFei Zhu   2020-10-11 @769  	for (pc = 0; pc < fprog->len; pc++) {
8e01b51a31a1e0 YiFei Zhu   2020-10-11  770  		struct sock_filter *insn = &fprog->filter[pc];
8e01b51a31a1e0 YiFei Zhu   2020-10-11  771  		u16 code = insn->code;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  772  		u32 k = insn->k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  773  
8e01b51a31a1e0 YiFei Zhu   2020-10-11  774  		switch (code) {
8e01b51a31a1e0 YiFei Zhu   2020-10-11  775  		case BPF_LD | BPF_W | BPF_ABS:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  776  			switch (k) {
8e01b51a31a1e0 YiFei Zhu   2020-10-11  777  			case offsetof(struct seccomp_data, nr):
8e01b51a31a1e0 YiFei Zhu   2020-10-11  778  				reg_value = sd->nr;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  779  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  780  			case offsetof(struct seccomp_data, arch):
8e01b51a31a1e0 YiFei Zhu   2020-10-11  781  				reg_value = sd->arch;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  782  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  783  			default:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  784  				/* can't optimize (non-constant value load) */
8e01b51a31a1e0 YiFei Zhu   2020-10-11  785  				return false;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  786  			}
8e01b51a31a1e0 YiFei Zhu   2020-10-11  787  			break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  788  		case BPF_RET | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  789  			/* reached return with constant values only, check allow */
8e01b51a31a1e0 YiFei Zhu   2020-10-11  790  			return k == SECCOMP_RET_ALLOW;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  791  		case BPF_JMP | BPF_JA:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  792  			pc += insn->k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  793  			break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  794  		case BPF_JMP | BPF_JEQ | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  795  		case BPF_JMP | BPF_JGE | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  796  		case BPF_JMP | BPF_JGT | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  797  		case BPF_JMP | BPF_JSET | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  798  			switch (BPF_OP(code)) {
8e01b51a31a1e0 YiFei Zhu   2020-10-11  799  			case BPF_JEQ:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  800  				op_res = reg_value == k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  801  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  802  			case BPF_JGE:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  803  				op_res = reg_value >= k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  804  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  805  			case BPF_JGT:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  806  				op_res = reg_value > k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  807  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  808  			case BPF_JSET:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  809  				op_res = !!(reg_value & k);
8e01b51a31a1e0 YiFei Zhu   2020-10-11  810  				break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  811  			default:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  812  				/* can't optimize (unknown jump) */
8e01b51a31a1e0 YiFei Zhu   2020-10-11  813  				return false;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  814  			}
8e01b51a31a1e0 YiFei Zhu   2020-10-11  815  
8e01b51a31a1e0 YiFei Zhu   2020-10-11  816  			pc += op_res ? insn->jt : insn->jf;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  817  			break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  818  		case BPF_ALU | BPF_AND | BPF_K:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  819  			reg_value &= k;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  820  			break;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  821  		default:
8e01b51a31a1e0 YiFei Zhu   2020-10-11  822  			/* can't optimize (unknown insn) */
8e01b51a31a1e0 YiFei Zhu   2020-10-11  823  			return false;
8e01b51a31a1e0 YiFei Zhu   2020-10-11  824  		}
8e01b51a31a1e0 YiFei Zhu   2020-10-11  825  	}
8e01b51a31a1e0 YiFei Zhu   2020-10-11  826  
8e01b51a31a1e0 YiFei Zhu   2020-10-11  827  	/* ran off the end of the filter?! */
8e01b51a31a1e0 YiFei Zhu   2020-10-11 @828  	WARN_ON(1);
8e01b51a31a1e0 YiFei Zhu   2020-10-11  829  	return false;
8e01b51a31a1e0 YiFei Zhu   2020-10-11 @830  }
8e01b51a31a1e0 YiFei Zhu   2020-10-11  831  

:::::: The code at line 769 was first introduced by commit
:::::: 8e01b51a31a1e08e2c3e8fcc0ef6790441be2f61 seccomp/cache: Add "emulator" to check if filter is constant allow

:::::: TO: YiFei Zhu <yifeifz2@illinois.edu>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
