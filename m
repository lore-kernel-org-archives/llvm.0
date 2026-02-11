Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B678B1487E9;
	Wed, 11 Feb 2026 00:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770769869; cv=none; b=Gxe2VC5cHrgBBcT1rCpxAs6nuDsvDp3+9m8ZI8ci0PnfXY5HvD9Rqm/PdIrnLYi3iq0Q/MiYU1pst5SFpqWnbwLQGHt/hazMsUN8+DoS7BatrVd9+cm3yi32/OrgsqGD4ud4tqJJ69ooBUW058FfcoFG7AbTgbWL/iwUC/u4bO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770769869; c=relaxed/simple;
	bh=TNrk4xzIM1FIYFOQX0swyDdRTM+nwT+RTSCnHMOhLN8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sKC/SvJtJbBXgc6lHT+n+F4AzQEhAf6mCU8AT0UOg8rcWYazUTGP9ceOhJMeDJmBj3CJAJn/ncy+vsN+lG6NGYEq37K5Ywh83XcCxxIhi+4MsHuY5TCzeDBowGXw56xWcbuJfNaKFzluj8yE9+sS8CDzzurPcklpuHPeQ/bBbdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXhLfYoZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXhLfYoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770769867; x=1802305867;
  h=date:from:to:cc:subject:message-id;
  bh=TNrk4xzIM1FIYFOQX0swyDdRTM+nwT+RTSCnHMOhLN8=;
  b=FXhLfYoZcDBAO7Fb0gqvzq9tKHBB1yF/IRXaSjVDOhHgWENRQzv8KBMZ
   1DwICo/uNbwPhIi5ENcmW1pN6NrR6q8VqduWGmgVjcQbPRSa4TQgNORRS
   GcxzcgH696ZEh3FXrZ/A61yJ2SyHCH313OLCaPbeUJI4R61MoYsKR75do
   4XQoOUnjbsvlNRZvZte/vjJeSg0haRvVLnVYVg2xxrGda40/D67RQyGFC
   pgB289BKjosOvHZZ2jKHuYJkMaiNYJvTk8a+KkjeprIBC1SWiyWzEmSAf
   b30sbalHsxZjXnkw/GIQTzSrlNKrsDzRnAupulpCwr/PrxE/KSZthWeP0
   Q==;
X-CSE-ConnectionGUID: 1EVWPuh6QKWoCVxeOmja7g==
X-CSE-MsgGUID: QB7AYPAiTo2Pw+x6tQMjUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83280666"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83280666"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 16:31:07 -0800
X-CSE-ConnectionGUID: MUg7IVBPRLqUGJU6uG3XJA==
X-CSE-MsgGUID: TZCIP2tvS7OO0F5dsFc0Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216244699"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 10 Feb 2026 16:31:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpy8F-00000000pXU-0uhT;
	Wed, 11 Feb 2026 00:31:03 +0000
Date: Wed, 11 Feb 2026 08:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/enter_mmio_stack_uaf_simple 12/12]
 arch/x86/kvm/x86.c:11831:12: warning: stack frame size (4232) exceeds limit
 (2048) in 'complete_emulated_mmio'
Message-ID: <202602110831.h1VfdQeb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/enter_mmio_stack_uaf_simple
head:   0192648eff680b148621853a27d2321130afb085
commit: 0192648eff680b148621853a27d2321130afb085 [12/12] KVM: x86: Fill the stack for testing purposes
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260211/202602110831.h1VfdQeb-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602110831.h1VfdQeb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110831.h1VfdQeb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:11831:12: warning: stack frame size (4232) exceeds limit (2048) in 'complete_emulated_mmio' [-Wframe-larger-than]
    11831 | static int complete_emulated_mmio(struct kvm_vcpu *vcpu)
          |            ^
   1 warning generated.


vim +/complete_emulated_mmio +11831 arch/x86/kvm/x86.c

716d51abff06f48 Gleb Natapov        2012-09-03  11812  
f78146b0f923076 Avi Kivity          2012-04-18  11813  /*
f78146b0f923076 Avi Kivity          2012-04-18  11814   * Implements the following, as a state machine:
f78146b0f923076 Avi Kivity          2012-04-18  11815   *
f78146b0f923076 Avi Kivity          2012-04-18  11816   * read:
f78146b0f923076 Avi Kivity          2012-04-18  11817   *   for each fragment
87da7e66a40532b Xiao Guangrong      2012-10-24  11818   *     for each mmio piece in the fragment
f78146b0f923076 Avi Kivity          2012-04-18  11819   *       write gpa, len
f78146b0f923076 Avi Kivity          2012-04-18  11820   *       exit
f78146b0f923076 Avi Kivity          2012-04-18  11821   *       copy data
f78146b0f923076 Avi Kivity          2012-04-18  11822   *   execute insn
f78146b0f923076 Avi Kivity          2012-04-18  11823   *
f78146b0f923076 Avi Kivity          2012-04-18  11824   * write:
f78146b0f923076 Avi Kivity          2012-04-18  11825   *   for each fragment
87da7e66a40532b Xiao Guangrong      2012-10-24  11826   *     for each mmio piece in the fragment
f78146b0f923076 Avi Kivity          2012-04-18  11827   *       write gpa, len
f78146b0f923076 Avi Kivity          2012-04-18  11828   *       copy data
f78146b0f923076 Avi Kivity          2012-04-18  11829   *       exit
f78146b0f923076 Avi Kivity          2012-04-18  11830   */
716d51abff06f48 Gleb Natapov        2012-09-03 @11831  static int complete_emulated_mmio(struct kvm_vcpu *vcpu)
5287f194bf0d706 Avi Kivity          2010-01-19  11832  {
5287f194bf0d706 Avi Kivity          2010-01-19  11833  	struct kvm_run *run = vcpu->run;
f78146b0f923076 Avi Kivity          2012-04-18  11834  	struct kvm_mmio_fragment *frag;
0192648eff680b1 Sean Christopherson 2026-02-10  11835  	u8 clobber[4096];
87da7e66a40532b Xiao Guangrong      2012-10-24  11836  	unsigned len;
5287f194bf0d706 Avi Kivity          2010-01-19  11837  
0192648eff680b1 Sean Christopherson 2026-02-10  11838  	memset(clobber, 0xaa, sizeof(clobber));
0192648eff680b1 Sean Christopherson 2026-02-10  11839  
716d51abff06f48 Gleb Natapov        2012-09-03  11840  	BUG_ON(!vcpu->mmio_needed);
5287f194bf0d706 Avi Kivity          2010-01-19  11841  
f78146b0f923076 Avi Kivity          2012-04-18  11842  	/* Complete previous fragment */
87da7e66a40532b Xiao Guangrong      2012-10-24  11843  	frag = &vcpu->mmio_fragments[vcpu->mmio_cur_fragment];
87da7e66a40532b Xiao Guangrong      2012-10-24  11844  	len = min(8u, frag->len);
cef4dea07f6720b Avi Kivity          2010-01-20  11845  	if (!vcpu->mmio_is_write)
87da7e66a40532b Xiao Guangrong      2012-10-24  11846  		memcpy(frag->data, run->mmio.data, len);
87da7e66a40532b Xiao Guangrong      2012-10-24  11847  
87da7e66a40532b Xiao Guangrong      2012-10-24  11848  	if (frag->len <= 8) {
87da7e66a40532b Xiao Guangrong      2012-10-24  11849  		/* Switch to the next fragment. */
87da7e66a40532b Xiao Guangrong      2012-10-24  11850  		frag++;
87da7e66a40532b Xiao Guangrong      2012-10-24  11851  		vcpu->mmio_cur_fragment++;
87da7e66a40532b Xiao Guangrong      2012-10-24  11852  	} else {
87da7e66a40532b Xiao Guangrong      2012-10-24  11853  		/* Go forward to the next mmio piece. */
87da7e66a40532b Xiao Guangrong      2012-10-24  11854  		frag->data += len;
87da7e66a40532b Xiao Guangrong      2012-10-24  11855  		frag->gpa += len;
87da7e66a40532b Xiao Guangrong      2012-10-24  11856  		frag->len -= len;
87da7e66a40532b Xiao Guangrong      2012-10-24  11857  	}
87da7e66a40532b Xiao Guangrong      2012-10-24  11858  
a08d3b3b99efd50 Andrew Honig        2014-02-27  11859  	if (vcpu->mmio_cur_fragment >= vcpu->mmio_nr_fragments) {
f78146b0f923076 Avi Kivity          2012-04-18  11860  		vcpu->mmio_needed = 0;
0912c9771e9902f Paolo Bonzini       2013-08-27  11861  
0912c9771e9902f Paolo Bonzini       2013-08-27  11862  		/* FIXME: return into emulator if single-stepping.  */
cef4dea07f6720b Avi Kivity          2010-01-20  11863  		if (vcpu->mmio_is_write)
cef4dea07f6720b Avi Kivity          2010-01-20  11864  			return 1;
5287f194bf0d706 Avi Kivity          2010-01-19  11865  		vcpu->mmio_read_completed = 1;
716d51abff06f48 Gleb Natapov        2012-09-03  11866  		return complete_emulated_io(vcpu);
f78146b0f923076 Avi Kivity          2012-04-18  11867  	}
87da7e66a40532b Xiao Guangrong      2012-10-24  11868  
f78146b0f923076 Avi Kivity          2012-04-18  11869  	run->exit_reason = KVM_EXIT_MMIO;
f78146b0f923076 Avi Kivity          2012-04-18  11870  	run->mmio.phys_addr = frag->gpa;
f78146b0f923076 Avi Kivity          2012-04-18  11871  	if (vcpu->mmio_is_write)
87da7e66a40532b Xiao Guangrong      2012-10-24  11872  		memcpy(run->mmio.data, frag->data, min(8u, frag->len));
87da7e66a40532b Xiao Guangrong      2012-10-24  11873  	run->mmio.len = min(8u, frag->len);
f78146b0f923076 Avi Kivity          2012-04-18  11874  	run->mmio.is_write = vcpu->mmio_is_write;
716d51abff06f48 Gleb Natapov        2012-09-03  11875  	vcpu->arch.complete_userspace_io = complete_emulated_mmio;
f78146b0f923076 Avi Kivity          2012-04-18  11876  	return 0;
5287f194bf0d706 Avi Kivity          2010-01-19  11877  }
5287f194bf0d706 Avi Kivity          2010-01-19  11878  

:::::: The code at line 11831 was first introduced by commit
:::::: 716d51abff06f48425cef15d78ca6f36093f6dbf KVM: Provide userspace IO exit completion callback

:::::: TO: Gleb Natapov <gleb@redhat.com>
:::::: CC: Avi Kivity <avi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
