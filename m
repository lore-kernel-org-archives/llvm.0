Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02FC21CC49;
	Fri, 25 Apr 2025 21:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745617502; cv=none; b=MrgCNxpZKxodjv5U4KQe/V/K0jrPPGcKCo3oHRlqNAVnqGo5E4xso0Lpm5KzJ+o1+43EgqGHmB/7HuibfbJOnxDy9NvFEkmMGOH0CsgryTPk/hkVXuF0srti+99gxLs8cYbWpgm4odehIUHmo1kJjmQrphx7H/4trjHoOZcZTY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745617502; c=relaxed/simple;
	bh=3ku9dXm2gxBvE1BRJofQh+OJMENMkfOWPxE+DmlM3sE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hqdz4EGOQ7etMPcGqpaziAyvtsSiUi8KYoZWrvop1RgJ9zwH9UNWkJPR6bYDW+2vb3HWjb2lUKX3dRghUJLORY528lwhAa1nS24OaHRxQ7tWsD0ns3d6UxA3ivwngcZtmfcXCqAIsqmkKyY+ITV1tu55iUni8CElvkctsmeddFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LDA8nNef; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LDA8nNef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745617501; x=1777153501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ku9dXm2gxBvE1BRJofQh+OJMENMkfOWPxE+DmlM3sE=;
  b=LDA8nNef3k1IVKWFeI4TLf23uP4FdJh9iDWj3/sgpU72CPwB7hZ/SeJh
   rmoT1H2Ec3ytofys+n4mkesBmDErkruAii3JZrL8Kemst1skNUZejH4w/
   7q2YBBK4+fG11QWfminoGghlJs4g6o8O9jX3RZEAwLByCMbsSCw0m/13e
   pX5tbPFoPrWadfOu1BITK9QdMmffoBUpOjWBF32BGBT/H1p360+/GNJKW
   ObR7rN3YFivT/FVbGE80lgqqdMl5q8SLSu2Gm/kQJHHuqujPl99r+qiqt
   XDqeynPm7S81OwcwNKErnGqM3R8DVq5/xtPjlNJZN4ScVV4S+0wH9hq5h
   A==;
X-CSE-ConnectionGUID: 0LyOLxJBSJKmqaRjC9uHYA==
X-CSE-MsgGUID: N2RimkyGTiizbyXrOjEf8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11414"; a="58652183"
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="58652183"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 14:45:00 -0700
X-CSE-ConnectionGUID: o3m+VXFrTWGPaTQiuQhZkg==
X-CSE-MsgGUID: pBhYUaIHTSOYVjnReXav/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,240,1739865600"; 
   d="scan'208";a="137056970"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 25 Apr 2025 14:44:58 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8Qqu-0005XL-1V;
	Fri, 25 Apr 2025 21:44:56 +0000
Date: Sat, 26 Apr 2025 05:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/unfudge_irq_bypass 73/108] arch/x86/kvm/irq.c:526:3:
 error: incomplete definition of type 'struct kvm_kernel_irqfd'
Message-ID: <202504260551.mOvE8l2q-lkp@intel.com>
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
commit: 8eb00a4ec19d726d86b96a9201f0413157ce880d [73/108] KVM: x86: Move IRQ routing/delivery APIs from x86.c => irq.c
config: i386-buildonly-randconfig-004-20250426 (https://download.01.org/0day-ci/archive/20250426/202504260551.mOvE8l2q-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504260551.mOvE8l2q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504260551.mOvE8l2q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/irq.c:526:3: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     526 |                 container_of(cons, struct kvm_kernel_irqfd, consumer);
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
>> arch/x86/kvm/irq.c:526:3: error: offsetof of incomplete type 'struct kvm_kernel_irqfd'
     526 |                 container_of(cons, struct kvm_kernel_irqfd, consumer);
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
   arch/x86/kvm/irq.c:527:25: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     527 |         struct kvm *kvm = irqfd->kvm;
         |                           ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:530:33: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     530 |         kvm_arch_start_assignment(irqfd->kvm);
         |                                   ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:533:7: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     533 |         irqfd->producer = prod;
         |         ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:535:11: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     535 |         if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
         |             ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:536:50: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     536 |                 ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
         |                                                           ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:537:15: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     537 |                                                    irqfd->gsi, &irqfd->irq_entry);
         |                                                    ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:537:28: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     537 |                                                    irqfd->gsi, &irqfd->irq_entry);
         |                                                                 ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:539:33: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     539 |                         kvm_arch_end_assignment(irqfd->kvm);
         |                                                 ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:550:3: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     550 |                 container_of(cons, struct kvm_kernel_irqfd, consumer);
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
   arch/x86/kvm/irq.c:550:3: error: offsetof of incomplete type 'struct kvm_kernel_irqfd'
     550 |                 container_of(cons, struct kvm_kernel_irqfd, consumer);
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
   arch/x86/kvm/irq.c:551:25: error: incomplete definition of type 'struct kvm_kernel_irqfd'
     551 |         struct kvm *kvm = irqfd->kvm;
         |                           ~~~~~^
   arch/x86/include/asm/kvm_host.h:299:8: note: forward declaration of 'struct kvm_kernel_irqfd'
     299 | struct kvm_kernel_irqfd;
         |        ^
   arch/x86/kvm/irq.c:554:15: error: incomplete definition of type 'struct kvm_kernel_irqfd'


vim +526 arch/x86/kvm/irq.c

   521	
   522	int kvm_arch_irq_bypass_add_producer(struct irq_bypass_consumer *cons,
   523					      struct irq_bypass_producer *prod)
   524	{
   525		struct kvm_kernel_irqfd *irqfd =
 > 526			container_of(cons, struct kvm_kernel_irqfd, consumer);
   527		struct kvm *kvm = irqfd->kvm;
   528		int ret = 0;
   529	
   530		kvm_arch_start_assignment(irqfd->kvm);
   531	
   532		spin_lock_irq(&kvm->irqfds.lock);
   533		irqfd->producer = prod;
   534	
   535		if (irqfd->irq_entry.type == KVM_IRQ_ROUTING_MSI) {
   536			ret = kvm_x86_call(pi_update_irte)(irqfd, irqfd->kvm, prod->irq,
   537							   irqfd->gsi, &irqfd->irq_entry);
   538			if (ret)
   539				kvm_arch_end_assignment(irqfd->kvm);
   540		}
   541		spin_unlock_irq(&kvm->irqfds.lock);
   542	
   543		return ret;
   544	}
   545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
