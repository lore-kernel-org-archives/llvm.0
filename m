Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26261AA78D;
	Fri, 17 Jan 2025 21:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737150230; cv=none; b=NpRRmDI4Y4+0Wx1fGneEBlxddV1Z+S5/qrAEMq4HPJdwHgb8yhcBCjFx8Ni74K6g4P65K9OibHk9zNszYVoBfaSgQPs+q5uEISYpxofrBv/Q5BbXv6Ld9Qz68+j/Tz6fD8XQfo1or3Lo7Q8nj82HD8jTfPVwLwf4mnXwZl8CGXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737150230; c=relaxed/simple;
	bh=bt+iaM8D67xqSUTcgjIRhfM/w9pGt4T6tLNCCe2z/oA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U5Vo+9AzDFjGwvLXNAQGnYjOKJj3/HI/Flth4f7P2K1MGiZnefOctgt4+EdZD9tz1QrOeHGtaiXh8cEgaBkk+qllVyQvWrJgofHoyyEhtH4Q8JtLtuLEvL9MHddT41LDV3aBG2XcJR1XdLsqq+y2eYFur8n2XWgnNeBLBaLzANY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KScER/2p; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KScER/2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737150229; x=1768686229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bt+iaM8D67xqSUTcgjIRhfM/w9pGt4T6tLNCCe2z/oA=;
  b=KScER/2pplLEQPa755rSumPvGk+HnjHxBffMtLRf73bP1vGVfNLsFGgg
   9wV8MNjI3mcx1HCHp+xTWdwv5NwEz2iqPND/3fvHeODz7J3gaq3HqY8P7
   KknNijDlBJiy9/lowUbWKCqiZH8d5e9Ih9ZYPVsmMuw9GZgNQSAKmA5KY
   TyLSvSOc0bUtJ9syDzOuwVb2H3fEi5AHXSC8lPuiNDtmsbRjmqn2aIe4Z
   xODdHLXu23dy+LKgGCLXuZMxHf685OMYBDq8p1qNnBlZKtY/Ms8EN+XHV
   G5ilLxoY1rWzSsqUMS3D0RFaRtgKrRchWNkXRrlcx747JQ1dfQkWcSKCO
   w==;
X-CSE-ConnectionGUID: sQxmV6ZPTve/Q7cxMp3NYA==
X-CSE-MsgGUID: RSEdzYimT1+0O2onByac6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="48261912"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="48261912"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 13:43:40 -0800
X-CSE-ConnectionGUID: SGO3N2LzQKOXaF0jmZ2i4g==
X-CSE-MsgGUID: lu98KPr1RaaFwzyAA6eVwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109977899"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jan 2025 13:43:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYu7r-000Tk5-2i;
	Fri, 17 Jan 2025 21:43:35 +0000
Date: Sat, 18 Jan 2025 05:43:26 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:vmx/nested_hlt_pause_intercept 7/7]
 arch/x86/kvm/vmx/vmx.c:8084:40: error: too few arguments to function call,
 expected 3, have 2
Message-ID: <202501180547.K24Poiak-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux vmx/nested_hlt_pause_intercept
head:   3eba42004fd15e5353a24b6527ea809e83e2985a
commit: 3eba42004fd15e5353a24b6527ea809e83e2985a [7/7] KVM: nVMX: Synthesize nested VM-Exit for supported emulation intercepts
config: i386-randconfig-005-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180547.K24Poiak-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180547.K24Poiak-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180547.K24Poiak-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/vmx.c:17:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/x86/kvm/vmx/vmx.c:8084:40: error: too few arguments to function call, expected 3, have 2
    8084 |                 if (!vmx_is_io_intercepted(vcpu, info))
         |                      ~~~~~~~~~~~~~~~~~~~~~           ^
   arch/x86/kvm/vmx/vmx.c:8010:13: note: 'vmx_is_io_intercepted' declared here
    8010 | static bool vmx_is_io_intercepted(struct kvm_vcpu *vcpu,
         |             ^                     ~~~~~~~~~~~~~~~~~~~~~~
    8011 |                                   struct x86_instruction_info *info,
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    8012 |                                   unsigned long *exit_qualification)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +8084 arch/x86/kvm/vmx/vmx.c

35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8055  
5f18c642ff7e21 arch/x86/kvm/vmx/vmx.c Paolo Bonzini       2024-03-18  8056  int vmx_check_intercept(struct kvm_vcpu *vcpu,
8a76d7f25f8f24 arch/x86/kvm/vmx.c     Joerg Roedel        2011-04-04  8057  			struct x86_instruction_info *info,
21f1b8f29ea5b2 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-02-18  8058  			enum x86_intercept_stage stage,
21f1b8f29ea5b2 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-02-18  8059  			struct x86_exception *exception)
8a76d7f25f8f24 arch/x86/kvm/vmx.c     Joerg Roedel        2011-04-04  8060  {
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8061  	struct vmcs12 *vmcs12 = get_vmcs12(vcpu);
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8062  	unsigned long exit_qualification = 0;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8063  	u32 vm_exit_reason;
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8064  
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8065  	switch (info->intercept) {
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8066  	case x86_intercept_rdpid:
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8067  		/*
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8068  		 * RDPID causes #UD if not enabled through secondary execution
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8069  		 * controls (ENABLE_RDTSCP).  Note, the implicit MSR access to
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8070  		 * TSC_AUX is NOT subject to interception, i.e. checking only
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8071  		 * the dedicated execution control is architecturally correct.
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8072  		 */
7f3603b6313623 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-09-23  8073  		if (!nested_cpu_has2(vmcs12, SECONDARY_EXEC_ENABLE_RDTSCP)) {
21f1b8f29ea5b2 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-02-18  8074  			exception->vector = UD_VECTOR;
21f1b8f29ea5b2 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2020-02-18  8075  			exception->error_code_valid = false;
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8076  			return X86EMUL_PROPAGATE_FAULT;
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8077  		}
4948ba1f4b2af0 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8078  		return X86EMUL_CONTINUE;
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8079  
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8080  	case x86_intercept_in:
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8081  	case x86_intercept_ins:
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8082  	case x86_intercept_out:
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8083  	case x86_intercept_outs:
b057118e8af266 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16 @8084  		if (!vmx_is_io_intercepted(vcpu, info))
b057118e8af266 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8085  			return X86EMUL_CONTINUE;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8086  
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8087  		vm_exit_reason = EXIT_REASON_IO_INSTRUCTION;
b057118e8af266 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8088  		break;
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8089  
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8090  	case x86_intercept_lgdt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8091  	case x86_intercept_lidt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8092  	case x86_intercept_lldt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8093  	case x86_intercept_ltr:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8094  	case x86_intercept_sgdt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8095  	case x86_intercept_sidt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8096  	case x86_intercept_sldt:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8097  	case x86_intercept_str:
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8098  		if (!nested_cpu_has2(vmcs12, SECONDARY_EXEC_DESC))
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8099  			return X86EMUL_CONTINUE;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8100  
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8101  		if (info->intercept == x86_intercept_lldt ||
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8102  		    info->intercept == x86_intercept_ltr ||
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8103  		    info->intercept == x86_intercept_sldt ||
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8104  		    info->intercept == x86_intercept_str)
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8105  			vm_exit_reason = EXIT_REASON_LDTR_TR;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8106  		else
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8107  			vm_exit_reason = EXIT_REASON_GDTR_IDTR;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8108  		/*
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8109  		 * FIXME: Decode the ModR/M to generate the correct exit
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8110  		 *        qualification for memory operands.
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8111  		 */
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8112  		break;
86f7e90ce840aa arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-29  8113  
9bbc38752725d4 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8114  	case x86_intercept_hlt:
9bbc38752725d4 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8115  		if (!nested_cpu_has(vmcs12, CPU_BASED_HLT_EXITING))
9bbc38752725d4 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8116  			return X86EMUL_CONTINUE;
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8117  
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8118  		vm_exit_reason = EXIT_REASON_HLT;
9bbc38752725d4 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8119  		break;
9bbc38752725d4 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8120  
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8121  	case x86_intercept_pause:
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8122  		/*
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8123  		 * PAUSE is a single-byte NOP with a REPE prefix, i.e. collides
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8124  		 * with vanilla NOPs in the emulator.  Apply the interception
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8125  		 * check only to actual PAUSE instructions.  Don't check
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8126  		 * PAUSE-loop-exiting, software can't expect a given PAUSE to
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8127  		 * exit, i.e. KVM is within its rights to allow L2 to execute
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8128  		 * the PAUSE.
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8129  		 */
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8130  		if ((info->rep_prefix != REPE_PREFIX) ||
7a223b397dc217 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8131  		    !nested_cpu_has(vmcs12, CPU_BASED_PAUSE_EXITING))
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8132  			return X86EMUL_CONTINUE;
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8133  
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8134  		vm_exit_reason = EXIT_REASON_PAUSE_INSTRUCTION;
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8135  		break;
4984563823f003 arch/x86/kvm/vmx/vmx.c Sean Christopherson 2023-04-04  8136  
fb6d4d340e0532 arch/x86/kvm/vmx.c     Paolo Bonzini       2016-07-12  8137  	/* TODO: check more intercepts... */
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8138  	default:
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8139  		return X86EMUL_UNHANDLEABLE;
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8140  	}
35a571346a94fb arch/x86/kvm/vmx/vmx.c Oliver Upton        2020-02-04  8141  
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8142  	nested_vmx_vmexit(vcpu, vm_exit_reason, 0, exit_qualification);
3eba42004fd15e arch/x86/kvm/vmx/vmx.c Sean Christopherson 2025-01-16  8143  	return X86EMUL_INTERCEPTED;
8a76d7f25f8f24 arch/x86/kvm/vmx.c     Joerg Roedel        2011-04-04  8144  }
8a76d7f25f8f24 arch/x86/kvm/vmx.c     Joerg Roedel        2011-04-04  8145  

:::::: The code at line 8084 was first introduced by commit
:::::: b057118e8af2668869986a817ef0196510be9818 KVM: nVMX: Consolidate missing X86EMUL_INTERCEPTED logic in L2 emulation

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
