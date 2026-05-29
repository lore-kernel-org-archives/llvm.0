Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C8D285072;
	Fri, 29 May 2026 19:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780083049; cv=none; b=tuaoc8ucFxYkAo7V4m53vnzgkldbxLuzPdaoBgqdNN/Hxz0PBL81Ps8OGkUqKQv3lV1m0nucQNcHCwqmDfw7Aj2t0G/p1ISJfs3yX0eiWHaFU3SzsTiBfz+1Q3sfS1sCUE9ooNvZSzf/+CkHMnVjZLWOUV18J2nxMgI4TzeVSjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780083049; c=relaxed/simple;
	bh=QZ/5ipK/QhhxD1HdAIKiPbLGE1KQ3R7JNjuwA3TLQXg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r6k3F4b8PUrsHyB8zPJ2U7pwRGo3EA7pmHZ1tsvyAblaXGDi2bZwqodtjOA7J/od3IH8CPLpWIHyWcBpRBd7+Q1hE5DcxhvNCwcmbYnurbf1cnsyACafEn/ul1zWkfZVQVehKZ6Kw+KtUWl2VDnFGp7g8qywXw+ar+K/en3O+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQLcxHLT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQLcxHLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780083048; x=1811619048;
  h=date:from:to:cc:subject:message-id;
  bh=QZ/5ipK/QhhxD1HdAIKiPbLGE1KQ3R7JNjuwA3TLQXg=;
  b=NQLcxHLT1JjeZRSFomOw0KxcN6CK4jh0xdrmU7Fcx2hQEKSSRZhrNPeq
   fO8Z+7d5zWatqYSpteFnTwNnrgKDi56Qy5fAImVw4Tsqw96tbyzzTw2Zd
   NlEhyUvVN7Rpc61nQPjGGpNwUS2AMwafoUv8Dn3z9+a261x8DNZ5rSvcW
   td+yLYZJbnYVXe84/seigXRbBgzzClur3N+2hO59XbQIlrqhmGkITeeWS
   GUdQ+DYYJWNcV7P2K9sJ5emwAHiTd/v/J4O+XJerFYDmgLBNNzx+xSOfu
   XolWrJE3ZKVpTEQMNsucwL1ICkDq/9ivf6fWf4jUUOwkX97yVm7RAS9lA
   g==;
X-CSE-ConnectionGUID: lG5OLDSZR/qBPah+eczZIA==
X-CSE-MsgGUID: 1S3jk37/T+y4kO51OkKckg==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="80794869"
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="80794869"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 12:30:47 -0700
X-CSE-ConnectionGUID: 1uz+UkfMTPOhXjDFeWNIUA==
X-CSE-MsgGUID: S8hhaTx6R8mKwH2T6miNtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,175,1774335600"; 
   d="scan'208";a="241889273"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 May 2026 12:30:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT2up-000000007cM-0ghC;
	Fri, 29 May 2026 19:30:43 +0000
Date: Sat, 30 May 2026 03:29:55 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/nv3 25/32]
 arch/arm64/kvm/hyp/vhe/switch.c:368:22: warning: value size does not match
 register size specified by the constraint and modifier
Message-ID: <202605300331.uAxQip7s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/nv3
head:   1779d2897784632a8fee0474e0dd5d124a8beeff
commit: f967f8c6811b3c791cb2fd70289b633d04785aa5 [25/32] KVM: arm64: Implement runtime handling of HCRX_EL2.NVTGE==1
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260530/202605300331.uAxQip7s-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300331.uAxQip7s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605300331.uAxQip7s-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/vhe/switch.c:368:22: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     368 |                      : [err] "+r" (err), [v] "=&r" (v)
         |                                    ^
   arch/arm64/kvm/hyp/vhe/switch.c:365:16: note: use constraint modifier "w"
     365 |                      "2:        mov     %[err], %[errcode]\n"
         |                                         ^~~~~~
         |                                         %w[err]
   1 warning generated.


vim +368 arch/arm64/kvm/hyp/vhe/switch.c

   350	
   351	static int __vcpu_l1_vncr_read(struct kvm_vcpu *vcpu, enum vcpu_sysreg reg, u64 *val)
   352	{
   353		u64 vncr_va = read_sysreg_s(SYS_VNCR_EL2);
   354		u64 *reg_va = &((u64 *)vncr_va)[reg - __VNCR_START__];
   355		u64 spsr, elr, esr, far, v;
   356		int err = 0;
   357	
   358		spsr = read_sysreg_el2(SYS_SPSR);
   359		elr = read_sysreg_el2(SYS_ELR);
   360		esr = read_sysreg_el2(SYS_ESR);
   361		far = read_sysreg_el2(SYS_FAR);
   362	
   363		asm volatile("1:	ldr	%[v], [%[va]]\n"
   364			     "		b	9f\n"
   365			     "2:	mov	%[err], %[errcode]\n"
   366			     "9:\n"
   367			     __KVM_EXTABLE(1b, 2b)
 > 368			     : [err] "+r" (err), [v] "=&r" (v)
   369			     : [va] "r" (reg_va), [errcode] "i" (-EFAULT));
   370	
   371		if (unlikely(err)) {
   372			unsigned int ec;
   373	
   374			/*
   375			 * We expect this to be ESR_ELx_EC_DABT_CUR, and to be dealt
   376			 * with by the VNCR fault handler on the slow path.
   377			 */
   378			vcpu->arch.fault.esr_el2 = read_sysreg_el2(SYS_ESR);
   379			ec = kvm_vcpu_trap_get_class(vcpu);
   380	
   381			if (!WARN_ONCE(ec != ESR_ELx_EC_DABT_CUR,
   382				       "Unexpected EC=%x reading L1 VNCR\n", ec)) {
   383				vcpu->arch.fault.esr_el2 &= ESR_ELx_EC_MASK | ESR_ELx_FSC;
   384				vcpu->arch.fault.esr_el2 |= ESR_ELx_VNCR | ESR_ELx_IL;
   385				vcpu->arch.fault.far_el2  = read_sysreg_el2(SYS_FAR);
   386			}
   387	
   388			/* Restore the original fault context, just in case */
   389			write_sysreg_el2(spsr, SYS_SPSR);
   390			write_sysreg_el2(elr,  SYS_ELR);
   391			write_sysreg_el2(esr,  SYS_ESR);
   392			write_sysreg_el2(far,  SYS_FAR);
   393	
   394			return err;
   395		}
   396	
   397		/* Apply our own sanitisation, just like HW would... */
   398		*val = kvm_vcpu_apply_reg_masks(vcpu, reg, v);
   399	
   400		return 0;
   401	}
   402	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
