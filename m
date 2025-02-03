Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0915B20B807;
	Mon,  3 Feb 2025 18:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738606207; cv=none; b=ABm8M4FaC9FT9hw4EESWJfYmF8moowlqKgwrK34oVqx3+JtoHBWvaeC+VV7Q7MTSOrFiTrCedYvNapVvFLmXgIxE04rZktPTjkK1SN7L47Gcx4JdvbZ8A+3g4OFtT0adVoZUImse9uLGkFI9jMl34Qjzwp6RF3fYFGWe8EBKkn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738606207; c=relaxed/simple;
	bh=q1Kbi2EJdIymVySMSKbRjoMRaL6sIwEq9pikodfhdLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ua4aNxISJ6TJCLBCuSzDLNurw5Z9hyal1/zLEEQ2cWMvKtIq7wdskWYnhMezNaedDwHTNJlbO3ccGeDaaj/OjDGS86tKmPNSwCvBQAERsN1UCog6AcnOXtj9Dkhd4SCKh50LMkM10mvFMa5QP3bmnOuEaojM5wWHbKiK0RSecGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X42HS4Ww; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X42HS4Ww"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738606206; x=1770142206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q1Kbi2EJdIymVySMSKbRjoMRaL6sIwEq9pikodfhdLk=;
  b=X42HS4Ww9iGwtIZWAA7bJqUhiXz3X7tdsCJIz4RlWWCmi+tRGKEd2JdK
   523TWAgd7xzclZwqxLQpjmb0mUgEiFUhQ/eQ0YnyGbPk5Pyg7xZZQ4/CG
   C7grGUbCN0JHlVyqnCrPq6Fzapc+3LgrJAhX9ZsKNVpKxUApqGxmokMg+
   yl4jLXDDcvB/yZyQBQ/JuQZsLW20uByVKK5GXY2KgEGXDDIfg0MMCK4yu
   pvGbxU3bP4kPO32BYPkzauPUBMhWrfci2tY+NPZTacosQ32GKgngNqXVw
   92wwEvs3lOmnTcbUtGWmLJRvolBkbhKyqyyoEDRX9dKZNo86kfSAlr1l9
   A==;
X-CSE-ConnectionGUID: yErREJJGTe6/rNPLCM8EWg==
X-CSE-MsgGUID: 9V3FPFuaQ8+2Wib078UKQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="38988855"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="38988855"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 10:10:05 -0800
X-CSE-ConnectionGUID: BNo5rWpdQOao6yJ9RLG9Aw==
X-CSE-MsgGUID: 9TJGpjSUS2qiRTP+06bScw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111206876"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Feb 2025 10:10:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf0tU-000rIx-0N;
	Mon, 03 Feb 2025 18:10:00 +0000
Date: Tue, 4 Feb 2025 02:08:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Naveen N Rao (AMD)" <naveen@kernel.org>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH v2 2/2] KVM: SVM: Limit AVIC physical max index based on
 configured max_vcpu_ids
Message-ID: <202502040135.UzvbMEPC-lkp@intel.com>
References: <b79610c60de53048f3fda942fd45973c4ab1de97.1738563890.git.naveen@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b79610c60de53048f3fda942fd45973c4ab1de97.1738563890.git.naveen@kernel.org>

Hi Naveen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eb723766b1030a23c38adf2348b7c3d1409d11f0]

url:    https://github.com/intel-lab-lkp/linux/commits/Naveen-N-Rao-AMD/KVM-SVM-Increase-X2AVIC-limit-to-4096-vcpus/20250203-144127
base:   eb723766b1030a23c38adf2348b7c3d1409d11f0
patch link:    https://lore.kernel.org/r/b79610c60de53048f3fda942fd45973c4ab1de97.1738563890.git.naveen%40kernel.org
patch subject: [PATCH v2 2/2] KVM: SVM: Limit AVIC physical max index based on configured max_vcpu_ids
config: x86_64-randconfig-008-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040135.UzvbMEPC-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250204/202502040135.UzvbMEPC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040135.UzvbMEPC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/avic.c:20:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   arch/x86/kvm/svm/avic.c:88:66: error: expected ')'
      88 | static inline u32 avic_get_max_physical_id(struct kvm *kvm, bool x2apic_mode)
         |                                                                  ^
   arch/x86/include/asm/apic.h:258:23: note: expanded from macro 'x2apic_mode'
     258 | #define x2apic_mode             (0)
         |                                  ^
   arch/x86/kvm/svm/avic.c:88:66: note: to match this '('
   arch/x86/include/asm/apic.h:258:22: note: expanded from macro 'x2apic_mode'
     258 | #define x2apic_mode             (0)
         |                                 ^
>> arch/x86/kvm/svm/avic.c:88:66: warning: omitting the parameter name in a function definition is a C23 extension [-Wc23-extensions]
      88 | static inline u32 avic_get_max_physical_id(struct kvm *kvm, bool x2apic_mode)
         |                                                                  ^
   arch/x86/include/asm/apic.h:258:23: note: expanded from macro 'x2apic_mode'
     258 | #define x2apic_mode             (0)
         |                                  ^
   2 warnings and 1 error generated.


vim +88 arch/x86/kvm/svm/avic.c

    87	
  > 88	static inline u32 avic_get_max_physical_id(struct kvm *kvm, bool x2apic_mode)
    89	{
    90		u32 avic_max_physical_id = x2apic_mode ? x2avic_max_physical_id : AVIC_MAX_PHYSICAL_ID;
    91	
    92		/*
    93		 * Assume vcpu_id is the same as APIC ID. Per KVM_CAP_MAX_VCPU_ID, max_vcpu_ids
    94		 * represents the max APIC ID for this vm, rather than the max vcpus.
    95		 */
    96		return min(kvm->arch.max_vcpu_ids - 1, avic_max_physical_id);
    97	}
    98	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
