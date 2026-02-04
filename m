Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917C2288A2;
	Wed,  4 Feb 2026 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770192245; cv=none; b=RIajruDwuGu4Uy9yPzuzZuYNYY4wOQcYvc/t2HfzSRBns2xdA8Klgu+3mOqIdtDRQzXguXQUHHf8thgvdTN8vN1aHG072tYxClviefAnETA3zWNu1L6ZuJdT4NBIpa5Kk4Cbp/qhmOEbjkhaccLKgEkCbmxFr13Y/eGFFHUoV2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770192245; c=relaxed/simple;
	bh=GMKkuUh7mspGK9TWvMbS7al11PlD8m4J8oxebbDh4Gk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K8h7/mCHttL/lT43pV4p5SR8i8/828ADHHALAikRWMwC9zH1iD/4UXG908NsiUVHG5hIRkdj6gyyzCyVOROxTPYrMygDCfDP1HR4Rx/+7jkcC2zwMIcXHWIp0p9hqOdcAx+A6ElyZhV0nlSgDZUv560xUhbhL2ckp8Il/bmvT34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z3ooUtv2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z3ooUtv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770192245; x=1801728245;
  h=date:from:to:cc:subject:message-id;
  bh=GMKkuUh7mspGK9TWvMbS7al11PlD8m4J8oxebbDh4Gk=;
  b=Z3ooUtv2MzoezvbzS8l24lSryNiI0zfmD8ADOGWiSWFAazIZ1cDXNtUk
   6ahmAFC5b5Cz5zEPNEaOtJzdY+aFCGSgC++n1HX8a9hx32W5qj7VinAJr
   mBAgLOci5SN+308fuT2+Q3JVohyrna1bCR4WC696oyRPXmIObBw2YnNvg
   iFqm/OYodjfHOxdNltKqlI45D2Td6rubJtIKrgfrO/rlxFh0uNlClNNEe
   zyXp+JyKZK54ftS16lwSmTyFS6FSbPpKnrrlTceq4L5LyKUh943/AYhfI
   aP+qKB+foDBZBUEz2zIu7mEYPAliMti5ZgDhuhB9m059Zd7FZ8z3Y2Bt/
   w==;
X-CSE-ConnectionGUID: 6M1CZVvRRvSubuY8eX4Gwg==
X-CSE-MsgGUID: AW7+Y9hmQIanUH10lIq8aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71433101"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71433101"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:04:04 -0800
X-CSE-ConnectionGUID: 5IUEDG/uTcW1ziCJ6F938Q==
X-CSE-MsgGUID: b5usz7mNRF6840ydpiRAKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214577203"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2026 00:04:02 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnXrj-000000003fF-3102;
	Wed, 04 Feb 2026 08:03:59 +0000
Date: Wed, 04 Feb 2026 09:03:34 +0100
From: kernel test robot <lkp@intel.com>
To: Carsten Stollmaier <stollmc@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Woodhouse <dwmw@amazon.co.uk>,
 Lilit Janpoladyan <lilitj@amazon.de>,
 Sebastian Biemueller <sbiemue@amazon.de>
Subject: [dwmw2:gpc-stealtime 1/1] arch/x86/kvm/x86.c:5242:2: error:
 call to undeclared function 'kvm_gpc_mark_dirty'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202602040904.0eXBWOvu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux gpc-stealtime
head:   34c3f2e56cbf5d6b03946d531e66a91566d90db6
commit: 34c3f2e56cbf5d6b03946d531e66a91566d90db6 [1/1] KVM: x86: Use gfn_to_pfn_cache for record_steal_time
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260204/202602040904.0eXBWOvu-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040904.0eXBWOvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040904.0eXBWOvu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:5242:2: error: call to undeclared function 'kvm_gpc_mark_dirty'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5242 |         kvm_gpc_mark_dirty(gpc);
         |         ^
   1 error generated.


vim +/kvm_gpc_mark_dirty +5242 arch/x86/kvm/x86.c

  5201	
  5202	static void kvm_steal_time_set_preempted(struct kvm_vcpu *vcpu)
  5203	{
  5204		struct gfn_to_pfn_cache *gpc = &vcpu->arch.st.cache;
  5205		struct kvm_steal_time *st;
  5206		static const u8 preempted = KVM_VCPU_PREEMPTED;
  5207		unsigned long flags;
  5208	
  5209		/*
  5210		 * The vCPU can be marked preempted if and only if the VM-Exit was on
  5211		 * an instruction boundary and will not trigger guest emulation of any
  5212		 * kind (see vcpu_run).  Vendor specific code controls (conservatively)
  5213		 * when this is true, for example allowing the vCPU to be marked
  5214		 * preempted if and only if the VM-Exit was due to a host interrupt.
  5215		 */
  5216		if (!vcpu->arch.at_instruction_boundary) {
  5217			vcpu->stat.preemption_other++;
  5218			return;
  5219		}
  5220	
  5221		vcpu->stat.preemption_reported++;
  5222		if (!(vcpu->arch.st.msr_val & KVM_MSR_ENABLED))
  5223			return;
  5224	
  5225		if (vcpu->arch.st.preempted)
  5226			return;
  5227	
  5228		/* This happens on process exit */
  5229		if (unlikely(current->mm != vcpu->kvm->mm))
  5230			return;
  5231	
  5232		read_lock_irqsave(&gpc->lock, flags);
  5233		if (!kvm_gpc_check(gpc, sizeof(*st)))
  5234			goto out_unlock_gpc;
  5235	
  5236		st = (struct kvm_steal_time *)gpc->khva;
  5237		BUILD_BUG_ON(sizeof(st->preempted) != sizeof(preempted));
  5238	
  5239		st->preempted = preempted;
  5240		vcpu->arch.st.preempted = KVM_VCPU_PREEMPTED;
  5241	
> 5242		kvm_gpc_mark_dirty(gpc);
  5243	
  5244	out_unlock_gpc:
  5245		read_unlock_irqrestore(&gpc->lock, flags);
  5246	}
  5247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
