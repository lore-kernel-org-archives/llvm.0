Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B9521FF48;
	Tue, 23 Dec 2025 08:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766479768; cv=none; b=XUdFolKZz1m8o5MQD3D6wwVR/hDw/kvZJRFmoeN/YbpENOYWCI4JzO6zn6LQF3Fm4lJ0Po63jkkZn8l0njDgizoZcF9D+iRbqMqzlXWsePrQWEGZDJ6HU4jJMUwax8ehsrb2DOvZD7zrbt84BdiAW5TfBymkJ2HYMo0JypKBX/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766479768; c=relaxed/simple;
	bh=iRfbkSeLOOrtsVHqHSEjjPDMtS7k6kf6vVM+h5sTHrc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Iw0N6DYur2mDFjOieE++N9Okv7ECvxEQxFkfHwrk+QjhmtkAGMqVLeieGraghV7r971q1NLs4CWkHk/m+S8vl0AOyG8wv4qWJrQKsIJjFw18t2/BPyd+xIToJfd2iT/rzDJdj2DgDeVck7vkz1sOcNweNdm4QZ9UuvA1hXAnjPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaxLgTHO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaxLgTHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766479767; x=1798015767;
  h=date:from:to:cc:subject:message-id;
  bh=iRfbkSeLOOrtsVHqHSEjjPDMtS7k6kf6vVM+h5sTHrc=;
  b=ZaxLgTHOfgvbCPWHcwsiak4tWPA9NQCZugjtBlXc8lAEkYLkhmBbTYGl
   5zR17SbL/6JWoNCKNVq7AZjUrRCJIWZimzkg26t8dur2isxDN4gVvgtsN
   Zi9k0Ss86sRu7Hu5jbWXwY2qXd4SyVypbcmyvS09zHnDWnxOZIjAB+4r7
   5h0FwV9c24P+YOxDIQMROCf2lU8rcyzv36+1Tm4WDrinfQSVN9qPv0ta7
   Ml4TiCxPYYpEz4H8v69Cz/sFCeE2bWypl3rutFyemQlPhvS8ffXX/Xmu4
   Fqtjxb9lLOPOqmccmMtvStkiJO3V9s8VLYCqo6VQTf1jgE2uRvPtyI97V
   Q==;
X-CSE-ConnectionGUID: EhGbv5z6T1GKgZEhZaWmQA==
X-CSE-MsgGUID: KEx3gWl1Sp+qAvav1WHxTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68083656"
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="68083656"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 00:49:26 -0800
X-CSE-ConnectionGUID: kTp39EBcQbKJL2bvY1f5Ig==
X-CSE-MsgGUID: xIslNmEDSh+WtkZlY92cGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,170,1763452800"; 
   d="scan'208";a="200036542"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Dec 2025 00:49:24 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXy54-000000001en-1YWQ;
	Tue, 23 Dec 2025 08:49:22 +0000
Date: Tue, 23 Dec 2025 16:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/gicv5-full 59/82]
 arch/arm64/kvm/vgic/vgic-irs-v5.c:784:24: warning: variable 'ist_l2sz' is
 uninitialized when used here
Message-ID: <202512231615.mYXXEOUa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/gicv5-full
head:   1426b88096b597395df4c82f089b87c62bab45da
commit: e19948af6683f38c4f8634a3ee7e30347e481aa9 [59/82] KVM: arm64: gic-v5: Add GICv5 IRS IODEV
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251223/202512231615.mYXXEOUa-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231615.mYXXEOUa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231615.mYXXEOUa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/vgic/vgic-irs-v5.c:675:5: warning: no previous prototype for function 'vgic_v5_register_irs_iodev' [-Wmissing-prototypes]
     675 | int vgic_v5_register_irs_iodev(struct kvm *kvm, gpa_t irs_base_address)
         |     ^
   arch/arm64/kvm/vgic/vgic-irs-v5.c:675:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     675 | int vgic_v5_register_irs_iodev(struct kvm *kvm, gpa_t irs_base_address)
         | ^
         | static 
>> arch/arm64/kvm/vgic/vgic-irs-v5.c:784:24: warning: variable 'ist_l2sz' is uninitialized when used here [-Wuninitialized]
     784 |                                              nr_spi_bits, ist_l2sz, istsz,
         |                                                           ^~~~~~~~
   arch/arm64/kvm/vgic/vgic-irs-v5.c:712:47: note: initialize the variable 'ist_l2sz' to silence this warning
     712 |         size_t istsz, nr_spi_bits, istmd_sz, ist_l2sz;
         |                                                      ^
         |                                                       = 0
   2 warnings generated.


vim +/ist_l2sz +784 arch/arm64/kvm/vgic/vgic-irs-v5.c

   699	
   700	/**
   701	 * kvm_vgic_v5_irs_init: initialize the IRS data structures
   702	 * @kvm: kvm struct pointer
   703	 * @nr_spis: number of spis, frozen by caller
   704	 */
   705	int kvm_vgic_v5_irs_init(struct kvm *kvm, unsigned int nr_spis)
   706	{
   707		struct vgic_dist *dist = &kvm->arch.vgic;
   708		struct vgic_v5_irs *irs = dist->vgic_v5_irs_data;
   709		struct kvm_vcpu *vcpu0 = kvm_get_vcpu(kvm, 0);
   710		int i;
   711		phys_addr_t spi_ist_phys_base;
   712		size_t istsz, nr_spi_bits, istmd_sz, ist_l2sz;
   713		u64 mmfr0;
   714		int ret = 0;
   715	
   716		INIT_LIST_HEAD(&dist->vgic_v5_spi_ap_list_head);
   717		raw_spin_lock_init(&dist->vgic_v5_spi_ap_list_lock);
   718	
   719		/*
   720		 * We (KVM) allocate an Interrupt State Table (IST) for SPIs. The
   721		 * hardware mandates that lower 6 bits of the address are 0. Each ISTE
   722		 * is 4 bytes in size (or larger if metadata storage is required). In
   723		 * order to simplify the allocation logic, we round up the minimum
   724		 * number of SPIs to 16 (2^6 = 64, 64/4 = 16).
   725		 */
   726		if (nr_spis && nr_spis < 16)
   727			nr_spis = 16;
   728	
   729		if (nr_spis) {
   730			dist->spis = kcalloc(nr_spis, sizeof(struct vgic_irq),
   731					     GFP_KERNEL_ACCOUNT);
   732			if (!dist->spis)
   733				return -ENOMEM;
   734	
   735			/*
   736			 * In the following code we do not take the irq struct lock since
   737			 * no other action on irq structs can happen while the VGIC is
   738			 * not initialized yet:
   739			 * If someone wants to inject an interrupt or does a MMIO access,
   740			 * we require prior initialization in case of a virtual GICv3.
   741			 */
   742			for (i = 0; i < nr_spis; i++) {
   743				struct vgic_irq *irq = &dist->spis[i];
   744	
   745				/*
   746				 * We use the full GICv5-style IntID here, rather than
   747				 * just the index of the SPI. This helps to correctly
   748				 * identify the interrupt when injecting it.
   749				 */
   750				irq->intid = i | FIELD_PREP(GICV5_HWIRQ_TYPE,
   751							    GICV5_HWIRQ_TYPE_SPI);
   752				INIT_LIST_HEAD(&irq->ap_list);
   753				raw_spin_lock_init(&irq->irq_lock);
   754				irq->vcpu = NULL;
   755				irq->target_vcpu = vcpu0;
   756				refcount_set(&irq->refcount, 0);
   757				/*
   758				 * The guest controls the enable state, and again it is
   759				 * directly handled by the hardware. From our point of
   760				 * view it is always enabled.
   761				 */
   762				irq->enabled = 1;
   763				vgic_v5_set_spi_ops(irq);
   764			}
   765	
   766			nr_spi_bits = fls(roundup_pow_of_two(nr_spis)) - 1;
   767	
   768			istsz = GICV5_IRS_IST_CFGR_ISTSZ_4;
   769			if (vgic_v5_host_caps()->istmd) {
   770				istmd_sz = vgic_v5_host_caps()->istmd_sz;
   771	
   772				if (nr_spi_bits < istmd_sz)
   773					istsz = GICV5_IRS_IST_CFGR_ISTSZ_8;
   774				else
   775					istsz = GICV5_IRS_IST_CFGR_ISTSZ_16;
   776			}
   777	
   778			ret = vgic_v5_spi_ist_allocate(kvm, &spi_ist_phys_base,
   779						      nr_spi_bits, istsz);
   780			if (ret)
   781				return ret;
   782	
   783			ret = vgic_v5_vmte_assign_ist(kvm, spi_ist_phys_base, false,
 > 784						     nr_spi_bits, ist_l2sz, istsz,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
