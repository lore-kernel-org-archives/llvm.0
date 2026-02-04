Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF3B1917FB;
	Wed,  4 Feb 2026 08:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770193999; cv=none; b=Szdkj4hYzjHzdL893QycCoOHtMY+xFtEE+P8QthAesHQ5dU0lCJzoCld7fIy6GkZGpLWz8n1cIKpX0ZaHyOaSrguMS/bMv+SIWukNLWly4gjAhaGyN3/Nen672JSyHn62nEs6S6a2wGLYwNZ/zcZFQFLUpy46Nq0V9elkFIiLMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770193999; c=relaxed/simple;
	bh=Gxd2fBzLbq4QXlSVy9GOOfGWBtBYh3kbyMYsYpFkNFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hqSJQ5cKetK9Ci6i4ZTy7yTRyWh3X3GdruYCyvkVUkRnS/hNyy5KNRdyIzV6x6sMnD8Ugl8F2W5L0KHmSotEot9iYlsr0ktM5aengGWqwbYyBmUp55Q4jnQr4Yw4C8l1fNJHlm2Le4+u0VH1m+OUfp+KaTT/dICp+PlFfP8TQdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKj/MO3u; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKj/MO3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770193998; x=1801729998;
  h=date:from:to:cc:subject:message-id;
  bh=Gxd2fBzLbq4QXlSVy9GOOfGWBtBYh3kbyMYsYpFkNFQ=;
  b=VKj/MO3uQ+xA/Rj94H/z5a4b7Tcjhg4YOzeDOeP+nhWDcB1YMo2I9lU2
   vFG2/jVo1W7CzRN6Ole+xkLVmiUY4KBy2iMq8iDYMA0bPKjbyA7dDaLHB
   z7/uh+KuG5aTBJWQkApwy9jG8VYM1Y+7EaqDfh9wJH+OIKJSTXBcixr7i
   AORKkzpslSfD2sYX/8YL30dzSGn/pxTDIWWR3w5e3sU5ipOmXAHEL8bso
   VIZ0C1Vk20E0+6StMEO2hIl6YyW5xNSd6AFCqCHtqbgC8lNtmG63rsayQ
   QisK4YyfeFtDj1zvKSTC/BiPQ6oDQ1TQ94+zF5aIIanChYtXYLOZjU6UX
   g==;
X-CSE-ConnectionGUID: 5ZN/vAFrRJitAmBQbJDLKQ==
X-CSE-MsgGUID: swfAEi8uRBmsaxRJLSLMSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="82485902"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="82485902"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 00:33:16 -0800
X-CSE-ConnectionGUID: mejFTzsaSPeB9G76xYmQSg==
X-CSE-MsgGUID: szejaWTtR/O6n4HF6g90jQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="247694268"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Feb 2026 00:33:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnYJy-00000000hbY-2MWv;
	Wed, 04 Feb 2026 08:33:10 +0000
Date: Wed, 04 Feb 2026 16:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: Carsten Stollmaier <stollmc@amazon.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Woodhouse <dwmw@amazon.co.uk>,
 Lilit Janpoladyan <lilitj@amazon.de>,
 Sebastian Biemueller <sbiemue@amazon.de>
Subject: [dwmw2:gpc-stealtime 1/1] arch/x86/kvm/x86.c:5242:2: error:
 call to undeclared function 'kvm_gpc_mark_dirty'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202602041639.9pLjTipx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux gpc-stealtime
head:   34c3f2e56cbf5d6b03946d531e66a91566d90db6
commit: 34c3f2e56cbf5d6b03946d531e66a91566d90db6 [1/1] KVM: x86: Use gfn_to_pfn_cache for record_steal_time
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260204/202602041639.9pLjTipx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041639.9pLjTipx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041639.9pLjTipx-lkp@intel.com/

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
