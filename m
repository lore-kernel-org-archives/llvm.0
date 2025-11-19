Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DE02848B2;
	Wed, 19 Nov 2025 11:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763550519; cv=none; b=NbywpyBmh8+CjyoEEZuyk5xpXsZdhBaQuO0LUmPJVQWGZqDu87OjubNV1h6ve67qkjhIH2PiBbEfm7LK5b5rXObYqXc48IbiJGuOO2Zg3FhdL41aH5S7qUvr5laYbQb7GRYSnqBwGppauHOwBjb1C24Glz4tkFDU+hnrBUJ7pvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763550519; c=relaxed/simple;
	bh=jJEmVum0dDiCNvr6c3MECCPWN3vcD0YuwGWwYkc+wlg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YLtddmOXsOuZs1c4x0rgHPLrD2zy3we7VuNY4IbLyFVmdu6S8c9YBzKTk/whPfJDPQq2kN+sw4Xv49U7+Kv4hUxL4BPsYtLaIkziUCE7hVCGbnn9ar2xeDRUgPflWogSObj6r6FynG4EQefZhO8KonEQ2Ae2Gf1G5LqeDZ45b4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEFCsIkC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEFCsIkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763550518; x=1795086518;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=jJEmVum0dDiCNvr6c3MECCPWN3vcD0YuwGWwYkc+wlg=;
  b=ZEFCsIkC/DCtF7xjscpGD+vs3C6qSFo6i6OA0bwFgM1Yrg3YulvFrtLp
   k6lWu81rWERe/EyXxe6tohd5a7tBmt2omM2YCWAys4yd8srev/u9plRx0
   hlEnNMmlF/TIx4ufD+PzOOrMoTBqkIHWVK4k0PD8RSkdfhusuvqc2ie0x
   aZKVwkPLzSKidbmHxM/XfGPd2jEseM+1mNSIvV3ATknoOlIqRIgZtakni
   P80ckNvvU3Wbn8SlZlMDM4LfJ9irJXCudKR1b2/4dDqCMt4eOOSIiyGxi
   wlW78cI8Ls1skr44LIulLw7D+h3yFx9A/6J4MLhgoGqhTq4HWotVn8W9P
   A==;
X-CSE-ConnectionGUID: DJh94awSTAaAbgXgVXFARg==
X-CSE-MsgGUID: 9NTlDNw9QySMxKEf1P82RQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65485170"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65485170"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 03:08:37 -0800
X-CSE-ConnectionGUID: 2OnT7ekkT72t5q6W193GCw==
X-CSE-MsgGUID: aws9RjHuSZemLDy91cbIFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="195976270"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Nov 2025 03:08:36 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLg38-0002nh-05;
	Wed, 19 Nov 2025 11:08:34 +0000
Date: Wed, 19 Nov 2025 19:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/irq_no_destmap 15/15] arch/x86/kvm/x86.c:6737:22:
 error: use of undeclared identifier 'MAX_NR_RESERVED_IOAPIC_PINS'
Message-ID: <202511191945.u0PgkMti-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/sean-jc/linux x86/irq_no_destmap
head:   3cfcdb969c5e028836857656081f6e1b537f12e6
commit: 3cfcdb969c5e028836857656081f6e1b537f12e6 [15/15] KVM: x86: Bury ioapic.h definitions behind CONFIG_KVM_IOAPIC
config: x86_64-randconfig-075-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191945.u0PgkMti-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191945.u0PgkMti-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191945.u0PgkMti-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:6737:22: error: use of undeclared identifier 'MAX_NR_RESERVED_IOAPIC_PINS'
    6737 |                 if (cap->args[0] > MAX_NR_RESERVED_IOAPIC_PINS)
         |                                    ^
   1 error generated.


vim +/MAX_NR_RESERVED_IOAPIC_PINS +6737 arch/x86/kvm/x86.c

5bb064dcdeb7ab drivers/kvm/x86.c  Zhang Xiantao       2007-11-18  6715  
e5d83c74a5800c arch/x86/kvm/x86.c Paolo Bonzini       2017-02-16  6716  int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
90de4a1875180f arch/x86/kvm/x86.c Nadav Amit          2015-04-13  6717  			    struct kvm_enable_cap *cap)
90de4a1875180f arch/x86/kvm/x86.c Nadav Amit          2015-04-13  6718  {
90de4a1875180f arch/x86/kvm/x86.c Nadav Amit          2015-04-13  6719  	int r;
90de4a1875180f arch/x86/kvm/x86.c Nadav Amit          2015-04-13  6720  
90de4a1875180f arch/x86/kvm/x86.c Nadav Amit          2015-04-13  6721  	if (cap->flags)
90de4a1875180f arch/x86/kvm/x86.c Nadav Amit          2015-04-13  6722  		return -EINVAL;
90de4a1875180f arch/x86/kvm/x86.c Nadav Amit          2015-04-13  6723  
90de4a1875180f arch/x86/kvm/x86.c Nadav Amit          2015-04-13  6724  	switch (cap->cap) {
6d8491910fcd33 arch/x86/kvm/x86.c Oliver Upton        2022-03-01  6725  	case KVM_CAP_DISABLE_QUIRKS2:
6d8491910fcd33 arch/x86/kvm/x86.c Oliver Upton        2022-03-01  6726  		r = -EINVAL;
bd7d5362b4c4ac arch/x86/kvm/x86.c Yan Zhao            2025-02-24  6727  		if (cap->args[0] & ~kvm_caps.supported_quirks)
6d8491910fcd33 arch/x86/kvm/x86.c Oliver Upton        2022-03-01  6728  			break;
6d8491910fcd33 arch/x86/kvm/x86.c Oliver Upton        2022-03-01  6729  		fallthrough;
90de4a1875180f arch/x86/kvm/x86.c Nadav Amit          2015-04-13  6730  	case KVM_CAP_DISABLE_QUIRKS:
bd7d5362b4c4ac arch/x86/kvm/x86.c Yan Zhao            2025-02-24  6731  		kvm->arch.disabled_quirks |= cap->args[0] & kvm_caps.supported_quirks;
90de4a1875180f arch/x86/kvm/x86.c Nadav Amit          2015-04-13  6732  		r = 0;
90de4a1875180f arch/x86/kvm/x86.c Nadav Amit          2015-04-13  6733  		break;
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6734  	case KVM_CAP_SPLIT_IRQCHIP: {
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6735  		mutex_lock(&kvm->lock);
b053b2aef25d00 arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6736  		r = -EINVAL;
b053b2aef25d00 arch/x86/kvm/x86.c Steve Rutherford    2015-07-29 @6737  		if (cap->args[0] > MAX_NR_RESERVED_IOAPIC_PINS)
b053b2aef25d00 arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6738  			goto split_irqchip_unlock;
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6739  		r = -EEXIST;
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6740  		if (irqchip_in_kernel(kvm))
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6741  			goto split_irqchip_unlock;
557abc40d12135 arch/x86/kvm/x86.c Paolo Bonzini       2016-06-13  6742  		if (kvm->created_vcpus)
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6743  			goto split_irqchip_unlock;
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6744  		/* Pairs with irqchip_in_kernel. */
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6745  		smp_wmb();
49776faf93f807 arch/x86/kvm/x86.c Radim Krčmář        2016-12-16  6746  		kvm->arch.irqchip_mode = KVM_IRQCHIP_SPLIT;
b053b2aef25d00 arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6747  		kvm->arch.nr_reserved_ioapic_pins = cap->args[0];
320af55a930f30 arch/x86/kvm/x86.c Sean Christopherson 2022-03-11  6748  		kvm_clear_apicv_inhibit(kvm, APICV_INHIBIT_REASON_ABSENT);
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6749  		r = 0;
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6750  split_irqchip_unlock:
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6751  		mutex_unlock(&kvm->lock);
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6752  		break;
49df6397edfc5a arch/x86/kvm/x86.c Steve Rutherford    2015-07-29  6753  	}
3713131345fbea arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6754  	case KVM_CAP_X2APIC_API:
3713131345fbea arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6755  		r = -EINVAL;
3713131345fbea arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6756  		if (cap->args[0] & ~KVM_X2APIC_API_VALID_FLAGS)
3713131345fbea arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6757  			break;
3713131345fbea arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6758  
3713131345fbea arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6759  		if (cap->args[0] & KVM_X2APIC_API_USE_32BIT_IDS)
3713131345fbea arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6760  			kvm->arch.x2apic_format = true;
c519265f2aa348 arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6761  		if (cap->args[0] & KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK)
c519265f2aa348 arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6762  			kvm->arch.x2apic_broadcast_quirk_disabled = true;
3713131345fbea arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6763  
3713131345fbea arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6764  		r = 0;
3713131345fbea arch/x86/kvm/x86.c Radim Krčmář        2016-07-12  6765  		break;
4d5422cea3b61f arch/x86/kvm/x86.c Wanpeng Li          2018-03-12  6766  	case KVM_CAP_X86_DISABLE_EXITS:
4d5422cea3b61f arch/x86/kvm/x86.c Wanpeng Li          2018-03-12  6767  		r = -EINVAL;
c829ccd4d9dc4a arch/x86/kvm/x86.c Sean Christopherson 2024-11-27  6768  		if (cap->args[0] & ~kvm_get_allowed_disable_exits())
4d5422cea3b61f arch/x86/kvm/x86.c Wanpeng Li          2018-03-12  6769  			break;
4d5422cea3b61f arch/x86/kvm/x86.c Wanpeng Li          2018-03-12  6770  
04cd8f8628d88d arch/x86/kvm/x86.c Sean Christopherson 2024-11-27  6771  		mutex_lock(&kvm->lock);
04cd8f8628d88d arch/x86/kvm/x86.c Sean Christopherson 2024-11-27  6772  		if (kvm->created_vcpus)
04cd8f8628d88d arch/x86/kvm/x86.c Sean Christopherson 2024-11-27  6773  			goto disable_exits_unlock;
6f0f2d5ef895d6 arch/x86/kvm/x86.c Tom Lendacky        2023-02-09  6774  

:::::: The code at line 6737 was first introduced by commit
:::::: b053b2aef25d00773fa6762dcd4b7f5c9c42d171 KVM: x86: Add EOI exit bitmap inference

:::::: TO: Steve Rutherford <srutherford@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
