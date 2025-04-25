Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D864A29115D;
	Fri, 25 Apr 2025 22:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745620086; cv=none; b=mIoq339n2AGOEIsBETl+DP2lBVs07blBYA/1B7eOPrZdzwtmSXh9CIYSc6VB0aiD9qYsDdkNPyJe1+cSpHUY2cyA7FA006BOze6Hgzb3UCsJp2HYxuTt7hct7gf0YReO52newA2gnQMP02l1dU7ztFaJkgMoLZoL3TloyuKn2lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745620086; c=relaxed/simple;
	bh=OtqIh4td4f+RznyC4DffWM/uzoAp8ndcK6y8Nvml/KE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nDtVfrDreOTfO71OKxqcYwtMq/wgUeZbJOrwHNp/F+U8668RIJBQmuuaEgQfCzmfSZP/hZDs+0juJsqyNPHxKGqqwnT4X9SB198Ph10jP7KoUS6J4aoMpQI+78Oe7ibO8kvTRCtg36tD09aWzBxvM2OndpBogS23Tbve7iOcHjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kovRhxrz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kovRhxrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745620085; x=1777156085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OtqIh4td4f+RznyC4DffWM/uzoAp8ndcK6y8Nvml/KE=;
  b=kovRhxrzwjVasfwPgmzHxJA4Cg9cTbXJIR/VF9QSGxm5OrgR1Xh9C9wG
   24TjWwCNWhGaDjEpT/IK2i67dHbl46ZpNNQbZzbsdaWNehl8uEedeW1oH
   ETqRkX1s/KnqzH2HjlxLFd6oPB/em12PrTCdeHSivLy5rmB13UXuFHr4Z
   lOJ+NEOt2gnCLuR2poALQi01G9O+1WSfZjiiuWD71y6DRyLBA+iY/iayd
   QU9xFC87O6M7dsHjqe0EtRn7Ic5SmBgTKSwHZcO6zKGq6En5qCf7SM1jD
   G3qZRFUIMMkwjgxGMkFgdKI2VqxVq4J2AXyQzbCHlzH0u/eHND/L4201G
   A==;
X-CSE-ConnectionGUID: LtcJ81QOSj2YFzOwm9wT8A==
X-CSE-MsgGUID: 3dfi+5/VRre9xm9OMUEcng==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="47306312"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="47306312"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 15:28:04 -0700
X-CSE-ConnectionGUID: XHeGxvCiS3aa0nlgWd3Hpw==
X-CSE-MsgGUID: B8L+BJ8ORI6stfxrPpFPuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="138111996"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 25 Apr 2025 15:28:03 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8RWa-0005Yb-1Q;
	Fri, 25 Apr 2025 22:28:00 +0000
Date: Sat, 26 Apr 2025 06:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/unfudge_irq_bypass 76/108] arch/x86/kvm/irq.c:561:2:
 error: call to undeclared function 'trace_kvm_pi_irte_update'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202504260605.T6Rt9LPf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/unfudge_irq_bypass
head:   720265d246a28570666f9b0e027983c4bb758136
commit: 1303b53ffcb5b4605471fab89174e0077d9e33d8 [76/108] KVM: x86: Move posted interrupt tracepoint to common code
config: i386-buildonly-randconfig-004-20250426 (https://download.01.org/0day-ci/archive/20250426/202504260605.T6Rt9LPf-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504260605.T6Rt9LPf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504260605.T6Rt9LPf-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/irq.c:525:31: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     525 |         unsigned int host_irq = irqfd->producer->irq;
         |                                 ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:526:25: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     526 |         struct kvm *kvm = irqfd->kvm;
         |                           ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:556:47: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     556 |         r = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, host_irq, irqfd->gsi,
         |                                                 ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:556:69: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     556 |         r = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, host_irq, irqfd->gsi,
         |                                                                       ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
>> arch/x86/kvm/irq.c:561:2: error: call to undeclared function 'trace_kvm_pi_irte_update'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     561 |         trace_kvm_pi_irte_update(host_irq, vcpu, irqfd->gsi, irq.vector, !!vcpu);
         |         ^
   arch/x86/kvm/irq.c:561:48: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     561 |         trace_kvm_pi_irte_update(host_irq, vcpu, irqfd->gsi, irq.vector, !!vcpu);
         |                                                  ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:569:3: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     569 |                 container_of(cons, struct kvm_kernel_irqfd, consumer);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:47: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:74: note: expanded from macro '__same_type'
     498 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:569:3: error: offsetof of incomplete type 'struct kvm_kernel_irqfd'
     569 |                 container_of(cons, struct kvm_kernel_irqfd, consumer);
         |                 ^                  ~~~~~~
   include/linux/container_of.h:23:21: note: expanded from macro 'container_of'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^        ~~~~
   include/linux/stddef.h:16:32: note: expanded from macro 'offsetof'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^                  ~~~~
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:570:25: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     570 |         struct kvm *kvm = irqfd->kvm;
         |                           ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:573:33: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     573 |         kvm_arch_start_assignment(irqfd->kvm);
         |                                   ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:576:7: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     576 |         irqfd->producer = prod;
         |         ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:578:11: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     578 |         if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
         |             ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:579:41: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     579 |                 ret = kvm_pi_update_irte(irqfd, &irqfd->irq_entry);
         |                                                  ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:581:33: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     581 |                         kvm_arch_end_assignment(irqfd->kvm);
         |                                                 ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:592:3: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     592 |                 container_of(cons, struct kvm_kernel_irqfd, consumer);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:20:47: note: expanded from macro 'container_of'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~
      21 |                       __same_type(*(ptr), void),                        \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      22 |                       "pointer type mismatch in container_of()");       \
         |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:498:74: note: expanded from macro '__same_type'
     498 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                                                                          ^
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
      77 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^


vim +/trace_kvm_pi_irte_update +561 arch/x86/kvm/irq.c

   521	
   522	static int kvm_pi_update_irte(struct kvm_kernel_irqfd *irqfd,
   523				      struct kvm_kernel_irq_routing_entry *entry)
   524	{
   525		unsigned int host_irq = irqfd->producer->irq;
   526		struct kvm *kvm = irqfd->kvm;
   527		struct kvm_vcpu *vcpu = NULL;
   528		struct kvm_lapic_irq irq;
   529		int r;
   530	
   531		if (!irqchip_in_kernel(kvm) ||
   532		    !kvm_arch_has_irq_bypass() ||
   533		    !kvm_arch_has_assigned_device(kvm))
   534			return 0;
   535	
   536		if (entry && entry->type == KVM_IRQ_ROUTING_MSI) {
   537			kvm_set_msi_irq(kvm, entry, &irq);
   538	
   539			/*
   540			 * Force remapped mode if hardware doesn't support posting the
   541			 * virtual interrupt to a vCPU.  Only IRQs are postable (NMIs,
   542			 * SMIs, etc. are not), and neither AMD nor Intel IOMMUs support
   543			 * posting multicast/broadcast IRQs.  If the interrupt can't be
   544			 * posted, the device MSI needs to be routed to the host so that
   545			 * the guest's desired interrupt can be synthesized by KVM.
   546			 *
   547			 * This means that KVM can only post lowest-priority interrupts
   548			 * if they have a single CPU as the destination, e.g. only if
   549			 * the guest has affined the interrupt to a single vCPU.
   550			 */
   551			if (!kvm_intr_is_single_vcpu(kvm, &irq, &vcpu) ||
   552			    !kvm_irq_is_postable(&irq))
   553				vcpu = NULL;
   554		}
   555	
 > 556		r = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, host_irq, irqfd->gsi,
   557						 vcpu, irq.vector);
   558		if (r)
   559			return r;
   560	
 > 561		trace_kvm_pi_irte_update(host_irq, vcpu, irqfd->gsi, irq.vector, !!vcpu);
   562		return 0;
   563	}
   564	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
