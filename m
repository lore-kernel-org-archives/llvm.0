Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20293DE439;
	Wed, 20 May 2026 11:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276714; cv=none; b=RczZ2EEdqEr/YUXfEdTMUsVUu1U6S1LZ9buP6vcTQaomid/zn+S/lyn5UpXw8gkVSYUtUEwlnLCH9wenlGY3a+a0MeS+D5yHqTVr173CNrqKua3qHifcE7Rv75xuDXKVqzbVYlCHkkTrZB9fECIioPCHv414sG4eK9U8OowPxU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276714; c=relaxed/simple;
	bh=4uNLZ+rNICLYE+44oXzDvs0FCYgTFqX9gU7BLeUSsnk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YYjobWzwT6Z1XzogbZ++B2GW/HMW/20hFP1nYsXR63Ouwnzog+50Hyr9TJ5cfHt/+03teGyxABWLR3/+a6hN8qc+Ff9/4MvWEPq07lEEEenrcp77dbIbXqPrKYf6f/i1ztCPIoPzMS3OMOrOSk1lyYGKygDY86yLNqhvN2Ysc2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d9iwppiB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d9iwppiB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779276713; x=1810812713;
  h=date:from:to:cc:subject:message-id;
  bh=4uNLZ+rNICLYE+44oXzDvs0FCYgTFqX9gU7BLeUSsnk=;
  b=d9iwppiBhEKeaVS11cgWRnjFkeufD9V22HUbpqYp5nZpIsDwTOSMCdBe
   TBCkATGjmTldiUErBIHRxEg8kCHFeoI83e1gnmAg2LwwTwn2Xa5aZ2itJ
   XrKWkHl3etBGlbv+ImLJhUNs8fHZJf9eYcjzeTmg5iGUQo9lA9qfXL+bH
   iPtFCg1bwx+7vWNflPuiwv0gexvYtp0TpZHG0d7EQbqd3y/dme8PHfs6z
   En9Xv5g1TWJ+AC9m+8wkeLJILnNPP2l4zpCzVvkdkFgEalyAys1wcZhUK
   QjY8er26KC2bdG1xAILaMcj5YcZvAbI4XBqGveUnapW96lDaWBYs0LN57
   g==;
X-CSE-ConnectionGUID: PilOtXXJRHmMy3BHxKwRtg==
X-CSE-MsgGUID: wtW/D8rmTt6VHhVGCOQl+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="105630550"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="105630550"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 04:31:52 -0700
X-CSE-ConnectionGUID: 9NbmjxjdSoSqWqS3WgIf7Q==
X-CSE-MsgGUID: 9e22dssPTqens1P291Tbmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="263652749"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2026 04:31:35 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPf9B-00000000AXV-1lrm;
	Wed, 20 May 2026 11:31:33 +0000
Date: Wed, 20 May 2026 13:30:53 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/gpr_helpers_cleanup 40/40]
 arch/x86/kvm/ioapic.c:210:14: error: call to undeclared function
 'kvm_apicv_activated'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202605201338.YzMiIdXC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/gpr_helpers_cleanup
head:   ba354c376be921363bd75a65fb21710bd6dc284f
commit: ba354c376be921363bd75a65fb21710bd6dc284f [40/40] KVM: x86: Move a pile of stuff from kvm_host.h => x86.h
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260520/202605201338.YzMiIdXC-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201338.YzMiIdXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201338.YzMiIdXC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/ioapic.c:210:14: error: call to undeclared function 'kvm_apicv_activated'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     210 |         if (edge && kvm_apicv_activated(ioapic->kvm))
         |                     ^
   arch/x86/kvm/ioapic.c:210:14: note: did you mean 'kvm_gpc_activate'?
   include/linux/kvm_host.h:1457:5: note: 'kvm_gpc_activate' declared here
    1457 | int kvm_gpc_activate(struct gfn_to_pfn_cache *gpc, gpa_t gpa, unsigned long len);
         |     ^
>> arch/x86/kvm/ioapic.c:291:2: error: call to undeclared function 'kvm_make_scan_ioapic_request'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     291 |         kvm_make_scan_ioapic_request(kvm);
         |         ^
>> arch/x86/kvm/ioapic.c:448:4: error: call to undeclared function 'kvm_make_scan_ioapic_request_mask'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     448 |                         kvm_make_scan_ioapic_request_mask(ioapic->kvm,
         |                         ^
   arch/x86/kvm/ioapic.c:448:4: note: did you mean 'kvm_make_vcpus_request_mask'?
   include/linux/kvm_host.h:188:6: note: 'kvm_make_vcpus_request_mask' declared here
     188 | bool kvm_make_vcpus_request_mask(struct kvm *kvm, unsigned int req,
         |      ^
   arch/x86/kvm/ioapic.c:451:4: error: call to undeclared function 'kvm_make_scan_ioapic_request'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     451 |                         kvm_make_scan_ioapic_request(ioapic->kvm);
         |                         ^
   arch/x86/kvm/ioapic.c:776:2: error: call to undeclared function 'kvm_make_scan_ioapic_request'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     776 |         kvm_make_scan_ioapic_request(kvm);
         |         ^
   5 errors generated.


vim +/kvm_apicv_activated +210 arch/x86/kvm/ioapic.c

f458d039db7e85 arch/x86/kvm/ioapic.c Suravee Suthikulpanit 2019-11-14  186  
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  187  static int ioapic_set_irq(struct kvm_ioapic *ioapic, unsigned int irq,
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  188  		int irq_level, bool line_status)
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  189  {
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  190  	union kvm_ioapic_redirect_entry entry;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  191  	u32 mask = 1 << irq;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  192  	u32 old_irr;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  193  	int edge, ret;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  194  
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  195  	entry = ioapic->redirtbl[irq];
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  196  	edge = (entry.fields.trig_mode == IOAPIC_EDGE_TRIG);
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  197  
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  198  	if (!irq_level) {
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  199  		ioapic->irr &= ~mask;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  200  		ret = 1;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  201  		goto out;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  202  	}
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  203  
f458d039db7e85 arch/x86/kvm/ioapic.c Suravee Suthikulpanit 2019-11-14  204  	/*
8be8f932e3db5f arch/x86/kvm/ioapic.c Paolo Bonzini         2020-05-04  205  	 * AMD SVM AVIC accelerate EOI write iff the interrupt is edge
8be8f932e3db5f arch/x86/kvm/ioapic.c Paolo Bonzini         2020-05-04  206  	 * triggered, in which case the in-kernel IOAPIC will not be able
8be8f932e3db5f arch/x86/kvm/ioapic.c Paolo Bonzini         2020-05-04  207  	 * to receive the EOI.  In this case, we do a lazy update of the
8be8f932e3db5f arch/x86/kvm/ioapic.c Paolo Bonzini         2020-05-04  208  	 * pending EOI when trying to set IOAPIC irq.
f458d039db7e85 arch/x86/kvm/ioapic.c Suravee Suthikulpanit 2019-11-14  209  	 */
8be8f932e3db5f arch/x86/kvm/ioapic.c Paolo Bonzini         2020-05-04 @210  	if (edge && kvm_apicv_activated(ioapic->kvm))
f458d039db7e85 arch/x86/kvm/ioapic.c Suravee Suthikulpanit 2019-11-14  211  		ioapic_lazy_update_eoi(ioapic, irq);
f458d039db7e85 arch/x86/kvm/ioapic.c Suravee Suthikulpanit 2019-11-14  212  
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  213  	/*
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  214  	 * Return 0 for coalesced interrupts; for edge-triggered interrupts,
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  215  	 * this only happens if a previous edge has not been delivered due
00116795aa87ca arch/x86/kvm/ioapic.c Miaohe Lin            2019-12-11  216  	 * to masking.  For level interrupts, the remote_irr field tells
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  217  	 * us if the interrupt is waiting for an EOI.
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  218  	 *
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  219  	 * RTC is special: it is edge-triggered, but userspace likes to know
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  220  	 * if it has been already ack-ed via EOI because coalesced RTC
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  221  	 * interrupts lead to time drift in Windows guests.  So we track
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  222  	 * EOI manually for the RTC interrupt.
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  223  	 */
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  224  	if (irq == RTC_GSI && line_status &&
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  225  		rtc_irq_check_coalesced(ioapic)) {
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  226  		ret = 0;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  227  		goto out;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  228  	}
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  229  
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  230  	old_irr = ioapic->irr;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  231  	ioapic->irr |= mask;
7d2253684dd10e arch/x86/kvm/ioapic.c Nikita Leshenko       2017-11-05  232  	if (edge) {
5bda6eed2e3626 arch/x86/kvm/ioapic.c Wincy Van             2014-12-24  233  		ioapic->irr_delivered &= ~mask;
7d2253684dd10e arch/x86/kvm/ioapic.c Nikita Leshenko       2017-11-05  234  		if (old_irr == ioapic->irr) {
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  235  			ret = 0;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  236  			goto out;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  237  		}
7d2253684dd10e arch/x86/kvm/ioapic.c Nikita Leshenko       2017-11-05  238  	}
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  239  
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  240  	ret = ioapic_service(ioapic, irq, line_status);
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  241  
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  242  out:
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  243  	trace_kvm_ioapic_set_irq(entry.bits, irq, ret == 0);
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  244  	return ret;
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  245  }
44847dea79751e virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  246  
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  247  static void kvm_ioapic_inject_all(struct kvm_ioapic *ioapic, unsigned long irr)
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  248  {
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  249  	u32 idx;
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  250  
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  251  	rtc_irq_eoi_tracking_reset(ioapic);
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  252  	for_each_set_bit(idx, &irr, IOAPIC_NUM_PINS)
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  253  		ioapic_set_irq(ioapic, idx, 1, true);
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  254  
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  255  	kvm_rtc_eoi_tracking_restore_all(ioapic);
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  256  }
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  257  
673f7b4257a1fe virt/kvm/ioapic.c     Paolo Bonzini         2014-03-18  258  
6308630bd3dbb6 arch/x86/kvm/ioapic.c Andrey Smetanin       2015-11-10  259  void kvm_ioapic_scan_entry(struct kvm_vcpu *vcpu, ulong *ioapic_handled_vectors)
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  260  {
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  261  	struct kvm_ioapic *ioapic = vcpu->kvm->arch.vioapic;
5cd6b1a6eebd56 arch/x86/kvm/ioapic.c Sean Christopherson   2025-12-05  262  	struct rtc_status *status = &ioapic->rtc_status;
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  263  	union kvm_ioapic_redirect_entry *e;
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  264  	int index;
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  265  
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  266  	spin_lock(&ioapic->lock);
4d99ba898dd0c5 arch/x86/kvm/ioapic.c Joerg Roedel          2016-02-29  267  
4d99ba898dd0c5 arch/x86/kvm/ioapic.c Joerg Roedel          2016-02-29  268  	/* Make sure we see any missing RTC EOI */
5cd6b1a6eebd56 arch/x86/kvm/ioapic.c Sean Christopherson   2025-12-05  269  	if (test_bit(vcpu->vcpu_id, status->map))
5cd6b1a6eebd56 arch/x86/kvm/ioapic.c Sean Christopherson   2025-12-05  270  		__set_bit(status->vectors[vcpu->vcpu_id],
4d99ba898dd0c5 arch/x86/kvm/ioapic.c Joerg Roedel          2016-02-29  271  			  ioapic_handled_vectors);
4d99ba898dd0c5 arch/x86/kvm/ioapic.c Joerg Roedel          2016-02-29  272  
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  273  	for (index = 0; index < IOAPIC_NUM_PINS; index++) {
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  274  		e = &ioapic->redirtbl[index];
0f6c0a740b7d3e virt/kvm/ioapic.c     Paolo Bonzini         2014-07-30  275  		if (e->fields.trig_mode == IOAPIC_LEVEL_TRIG ||
0f6c0a740b7d3e virt/kvm/ioapic.c     Paolo Bonzini         2014-07-30  276  		    kvm_irq_has_notifier(ioapic->kvm, KVM_IRQCHIP_IOAPIC, index) ||
0f6c0a740b7d3e virt/kvm/ioapic.c     Paolo Bonzini         2014-07-30  277  		    index == RTC_GSI) {
5c69d5c113f15a arch/x86/kvm/ioapic.c Peter Xu              2019-12-04  278  			u16 dm = kvm_lapic_irq_dest_mode(!!e->fields.dest_mode);
5c69d5c113f15a arch/x86/kvm/ioapic.c Peter Xu              2019-12-04  279  
c2207bbc0c0f4b arch/x86/kvm/ioapic.c Sean Christopherson   2025-03-03  280  			kvm_scan_ioapic_irq(vcpu, e->fields.dest_id, dm,
c2207bbc0c0f4b arch/x86/kvm/ioapic.c Sean Christopherson   2025-03-03  281  					    e->fields.vector, ioapic_handled_vectors);
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  282  		}
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  283  	}
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  284  	spin_unlock(&ioapic->lock);
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  285  }
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  286  
993225adf4af20 arch/x86/kvm/ioapic.c David Hildenbrand     2017-04-07  287  void kvm_arch_post_irq_ack_notifier_list_update(struct kvm *kvm)
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  288  {
0bceb15ad15e93 arch/x86/kvm/ioapic.c David Hildenbrand     2017-04-07  289  	if (!ioapic_in_kernel(kvm))
3d81bc7e96d6bc virt/kvm/ioapic.c     Yang Zhang            2013-04-11  290  		return;
3d81bc7e96d6bc virt/kvm/ioapic.c     Yang Zhang            2013-04-11 @291  	kvm_make_scan_ioapic_request(kvm);
3d81bc7e96d6bc virt/kvm/ioapic.c     Yang Zhang            2013-04-11  292  }
c7c9c56ca26f7b virt/kvm/ioapic.c     Yang Zhang            2013-01-25  293  

:::::: The code at line 210 was first introduced by commit
:::::: 8be8f932e3db5fe4ed178b8892eeffeab530273a kvm: ioapic: Restrict lazy EOI update to edge-triggered interrupts

:::::: TO: Paolo Bonzini <pbonzini@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
