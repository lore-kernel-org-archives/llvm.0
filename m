Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0BF14B950;
	Sat, 13 Dec 2025 01:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765589992; cv=none; b=boiq/XNAt1ZJql1B0fvkaARa70T1Mk/1LVHFPVJL021m/aDRu7TYRiegRm/NDhOV53FJVknn1AeSEzFJLQAtkDaVx0BzsqraYkeBK8MITAuKfcD9g/KTqNvOlVrrjFpH+HkUElSwRu7UwXQKsWOnwTNx3FdJetm4ulJ/wv0hBms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765589992; c=relaxed/simple;
	bh=nWStk/iImD1snrjk7kIUEv29s9EmkkHk9IJxnr2ZSvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GMpk09V76crdKBXaQN+WWrE0OIe8DOEPs8fQd9OvUYycyMsusTPjdDGmDLdpDF0TqMtzw+RJ5rwtZHsTYmR40i0PeaTvbOT5fgSk6R9McnISj2xDfGcpq0Hnd22sbUPtng451MjHm9aMHEXstLZr8MBgBPDCrdIs+s3gFSy/Rus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mLnBX0j1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mLnBX0j1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765589990; x=1797125990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nWStk/iImD1snrjk7kIUEv29s9EmkkHk9IJxnr2ZSvg=;
  b=mLnBX0j1xFdVe2Nn14D1JlsnOYEQ9CWNgo6ew/ZhJZpr+SMv6IONYq6K
   qkAdez5RIV1DnNkNG5to/Hjqe7sFZ0ViKh2vqmk+jtOnS4VP6K+vckKfm
   0LUP4/CNWeyUFhQxTouNQiGIohFiLW/CW/Tg+D/fXHjhU1JmlxMrVkUQD
   BHzg0TBFJv8Y858U0r/eqXwZxU/XmR70S+I6cGDCjeRavVt0yXHq0q/pn
   zEuURxBMsk8N4ItlXDXNSYGcWEfNHEExPX0OuPR+TLWYbgYdXO9gXJP8f
   03YMDf3p8WUEX0XBhRrZU+H1YjIOFmTQ/MilwxJJrdeRZFiRyRcVIIlkq
   Q==;
X-CSE-ConnectionGUID: HaUGqXqSQrqX9npJj7f7dA==
X-CSE-MsgGUID: +W2vc8NaSTW6sUg4U9pzUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85187713"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85187713"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 17:39:50 -0800
X-CSE-ConnectionGUID: Ov68TNPZSY+c2vY3lTafwg==
X-CSE-MsgGUID: TL28awDAT8GChFRsYUMNlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="227888686"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Dec 2025 17:39:47 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUEbo-000000006tR-1QlY;
	Sat, 13 Dec 2025 01:39:44 +0000
Date: Sat, 13 Dec 2025 09:38:59 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Rick Edgecombe <rick.p.edgecombe@intel.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, xiaoyao.li@intel.com,
	farrah.chen@intel.com
Subject: Re: [PATCH v2] KVM: x86: Don't read guest CR3 when doing async pf
 while the MMU is direct
Message-ID: <202512130905.LJZI3LOt-lkp@intel.com>
References: <20251212135051.2155280-1-xiaoyao.li@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212135051.2155280-1-xiaoyao.li@intel.com>

Hi Xiaoyao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7d0a66e4bb9081d75c82ec4957c50034cb0ea449]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaoyao-Li/KVM-x86-Don-t-read-guest-CR3-when-doing-async-pf-while-the-MMU-is-direct/20251212-220612
base:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
patch link:    https://lore.kernel.org/r/20251212135051.2155280-1-xiaoyao.li%40intel.com
patch subject: [PATCH v2] KVM: x86: Don't read guest CR3 when doing async pf while the MMU is direct
config: i386-buildonly-randconfig-004-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130905.LJZI3LOt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130905.LJZI3LOt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130905.LJZI3LOt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:4525:14: warning: implicit conversion from 'gpa_t' (aka 'unsigned long long') to 'unsigned long' changes value from 18446744073709551615 to 4294967295 [-Wconstant-conversion]
    4525 |                 arch.cr3 = INVALID_GPA;
         |                          ~ ^~~~~~~~~~~
   include/linux/kvm_types.h:54:22: note: expanded from macro 'INVALID_GPA'
      54 | #define INVALID_GPA     (~(gpa_t)0)
         |                          ^~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=m]


vim +4525 arch/x86/kvm/mmu/mmu.c

  4514	
  4515	static bool kvm_arch_setup_async_pf(struct kvm_vcpu *vcpu,
  4516					    struct kvm_page_fault *fault)
  4517	{
  4518		struct kvm_arch_async_pf arch;
  4519	
  4520		arch.token = alloc_apf_token(vcpu);
  4521		arch.gfn = fault->gfn;
  4522		arch.error_code = fault->error_code;
  4523		arch.direct_map = vcpu->arch.mmu->root_role.direct;
  4524		if (arch.direct_map)
> 4525			arch.cr3 = INVALID_GPA;
  4526		else
  4527			arch.cr3 = kvm_mmu_get_guest_pgd(vcpu, vcpu->arch.mmu);
  4528	
  4529		return kvm_setup_async_pf(vcpu, fault->addr,
  4530					  kvm_vcpu_gfn_to_hva(vcpu, fault->gfn), &arch);
  4531	}
  4532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
