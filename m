Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794357807;
	b=Pi90NJRGPEinK2MSnC06OuJjE974B7EztQzzjLKPnxissbQmvTB11BjBakhC+ZlC919Y
	 mzz3IzxNaDNVG1t9uVxvvdYf+dPulSbRSaMxM+xbem2InTTaFDuYv274F2SjZuUGjs/DK
	 DYRUp8fE4sA5yDsGHUJMN+CVd+rsJI2yVA3kVSicHn8jrWWFjrlzKAmq0U7CNP3/GEjcy
	 GPIYwyrxLC9TOP8/kKi5KgH1T/JGUXKUUpLbPhSgkcxls0rpI3WDEdzyzIfn12uKK6Z6m
	 0Q+LYNjmaFZyxocdfxX3Znkniw6BmFi3/wYWx/QXnr53nAcFQ+dmNEwQ2ost5FSTvaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794357807;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wUptKBCqp2XfOKvpnxZs9FnpAL3hi9oAu9MgY2acTaY=;
	b=Sac/tHQk26SHDV6hSZcxYeaMRJEZi2o5TwjmS0XS9NHJeS84mHdH37MAHUZvnmE1R/Q+
	 Ymhq456K8Fco8Z5pcBdu0mqk7McOYcMlt88dwHuxhlbH3d389GWJx+ZG4kPu7AMFq1/L4
	 PAoo+m4/40PcgWtYqYrR8EPCUi4fi1QcVVnEwOOe4p1pzziIOGZ2ctirekKMJDMFVupur
	 mrh1UxP+7SKhsXW9DZCuxuj9rGVfbfaXPNuI5SjguBY7dKEzdeUzUo611oVbLS1rPwFGr
	 Cf/pUvhPGeQ8EsNmfSxdvdeEoKG8WORboCc5ilHZqrCj03eakikia3rZBizSjVG32Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d7V7ROZw;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668B860A3804;
	Wed, 11 Nov 2026 00:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 668B860A3804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=d7V7ROZw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794357808; x=1825893808;
  h=date:from:to:cc:subject:message-id;
  bh=FBJ5xqbf3yp2gcxHHMf7tcn6sXPsMzZvrR0DhpZjFVY=;
  b=d7V7ROZwFR0UknCbBuRZileV+ntq162ps3UhF6FY4X+0XopecpHbZAaY
   3fVwyNYJbkvAHBmTjrmskZe04IF2SPj25r1SCjNHxO+Pa3eIJIc8v4Pb3
   FmbKS9AJSb6ROALuu5MQ8Ob2zvbXkEC41hBM7rQeYmIH2SgFyCj5l+V4z
   PiPq6ypfmwS8BqJxKcEO6jL+2Z83s54aCfneOoJb3rSqvMaxjntVTSZfz
   nOkG+SKPNLqjw2odhsZ3bdDPeUSi6w3pnSWiH/4MAj8cRxUBj9ospShat
   5IOjTQf+SvVKAEl7ZpOWA6nK0mkEc7aXbtKthhiw0I0lDE5ojmAQjuHYh
   w==;
X-CSE-ConnectionGUID: YGEt/YcvSDef1tJ1FyBGkg==
X-CSE-MsgGUID: jN4KGYUORH26oeMVKboW0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3119550"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3119550"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 16:43:27 -0800
X-CSE-ConnectionGUID: SYJkyTOWSSaXtps+U6JhMQ==
X-CSE-MsgGUID: gy6HOFPlR7aDHbUdHzH1uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8713683"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Nov 2026 16:43:25 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQwQs-00000000xmR-19BV;
	Wed, 11 Nov 2026 00:43:22 +0000
Date: Wed, 11 Nov 2026 08:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: Joerg Roedel <joerg.roedel@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: [dwmw2:vsm2/vsm-min 14/123]
 arch/riscv/kvm/vcpu_vector.c:102:19: error: incompatible pointer types
 initializing 'struct kvm_vcpu *' with an expression of type 'typeof_unqual
 (*(kvm_get_running_vcpus()))' (aka 'struct kvm_vcpu_common *')
Message-ID: <202611110850.A1qi4Azm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   git://git.infradead.org/users/dwmw2/linux vsm2/vsm-min
head:   73f14216b586db8fb3211410b88fbcdff5a96c0a
commit: 75bb49aa924fb9151f7e1fe441ff0eafbc996dae [14/123] kvm: Make kvm_running_vcpus point to struct kvm_vcpu_common
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20261111/202611110850.A1qi4Azm-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e73e336290028f26553b46c9fba844c13da38c9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110850.A1qi4Azm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611110850.A1qi4Azm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kvm/vcpu_vector.c:102:19: error: incompatible pointer types initializing 'struct kvm_vcpu *' with an expression of type 'typeof_unqual (*(kvm_get_running_vcpus()))' (aka 'struct kvm_vcpu_common *') [-Wincompatible-pointer-types]
     102 |         struct kvm_vcpu *vcpu = *this_cpu_ptr(kvm_get_running_vcpus());
         |                          ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +102 arch/riscv/kvm/vcpu_vector.c

b5060a4aa33d7d Andy Chiu 2026-08-03   99  
b5060a4aa33d7d Andy Chiu 2026-08-03  100  void kvm_riscv_vcpu_flush_vector(void)
b5060a4aa33d7d Andy Chiu 2026-08-03  101  {
b5060a4aa33d7d Andy Chiu 2026-08-03 @102  	struct kvm_vcpu *vcpu = *this_cpu_ptr(kvm_get_running_vcpus());
b5060a4aa33d7d Andy Chiu 2026-08-03  103  
b5060a4aa33d7d Andy Chiu 2026-08-03  104  	/*
b5060a4aa33d7d Andy Chiu 2026-08-03  105  	 * Only reached from __riscv_flush_vector_context() when RISCV_V_VCPU_CTX is set, which
b5060a4aa33d7d Andy Chiu 2026-08-03  106  	 * always have kvm_get_running_vcpus non-NULL.
b5060a4aa33d7d Andy Chiu 2026-08-03  107  	 */
b5060a4aa33d7d Andy Chiu 2026-08-03  108  	if (WARN_ON_ONCE(!vcpu))
b5060a4aa33d7d Andy Chiu 2026-08-03  109  		return;
b5060a4aa33d7d Andy Chiu 2026-08-03  110  
b5060a4aa33d7d Andy Chiu 2026-08-03  111  	kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context, vcpu->arch.isa);
b5060a4aa33d7d Andy Chiu 2026-08-03  112  
b5060a4aa33d7d Andy Chiu 2026-08-03  113  	if ((vcpu->arch.guest_context.sstatus & SR_VS) != SR_VS_OFF)
b5060a4aa33d7d Andy Chiu 2026-08-03  114  		riscv_v_flags_set(riscv_v_flags() | RISCV_V_VCPU_NEED_RESTORE);
b5060a4aa33d7d Andy Chiu 2026-08-03  115  }
b5060a4aa33d7d Andy Chiu 2026-08-03  116  

:::::: The code at line 102 was first introduced by commit
:::::: b5060a4aa33d7d78a8c1837ab08ef0c81ea96650 RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector

:::::: TO: Andy Chiu <tchiu@tenstorrent.com>
:::::: CC: Anup Patel <anup@brainfault.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
