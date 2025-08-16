Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E7C284B41;
	Sat, 16 Aug 2025 13:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755351841; cv=none; b=VIKm610eG+uxAlaa2Zj5LYddKAGszSFvJsYXE/CEsBwtxWNHja/1LCrcOrXMbe9D5e8xEEeS7EBpfJTW1eOoNkM3Pd55Jycr7SElDt4pbOQ9KmvY8RNwQc83sCyX0ToMIBekhwGZCRO1l86fQx7oP801iP88XvCrPI5B/GWXkl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755351841; c=relaxed/simple;
	bh=VV2QJjio7uE0vENLycOvxOfOF6YRpQTwyeQtD8MJnlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YPLJvdutITZVOCHEzE4u2U3k4gVc5l1+QxqhpcwDP6bEC249Eq0iSSXqGkHZAqCUWsv4yNwdJ/ROkRNoI8jykG1muvfSLoF2KYjZQR9himdwzoRbvBf0HGwtBL7s4BGmjlvcMQHaWD7z9z4mIEesBxVAK6564SHK3CICcs7NF5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zm1VE5dr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zm1VE5dr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755351838; x=1786887838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VV2QJjio7uE0vENLycOvxOfOF6YRpQTwyeQtD8MJnlw=;
  b=Zm1VE5drnc9eewM4Rhsv0XI2FksBpBLMnsz/JG4qoHW9MeZhVmn1pdaR
   sa8Xnsc0Pw7OJHPEIxSTO3SUYdttI1IH4YknMnsGog9Nv4a/gaHmAil5B
   vv6bBla0O+qqPNgzvl+EMYHwK7/XM7BgMtHFNTNC9/QqQKps3Vuyp1D/q
   JtPCB1FR48xNAMPBxRPoAYgTqyXNrOimdeO/CRiGEoxgxD7VGv62MSESW
   nmaAe3p/vTp2p4jT1gvxt0YQrhFq9lnhQZj/PKkSRcF/kd/Cxxs3jFzZc
   oC4F7I4igF7dRIjGqbfW1T867kJclvaSwKN2t/ym8IRtK8gJmPzgTWAM3
   Q==;
X-CSE-ConnectionGUID: /txEHp8jRqmFzM3SsMoLow==
X-CSE-MsgGUID: 7bsljiY5Sf+PyY4NeOjHjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57751262"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57751262"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2025 06:43:57 -0700
X-CSE-ConnectionGUID: X32Qgd1WQXqluwaJYySPhg==
X-CSE-MsgGUID: i7nUz5nLR3iJBt071bZcOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="167596285"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Aug 2025 06:43:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unHCM-000CtO-05;
	Sat, 16 Aug 2025 13:43:54 +0000
Date: Sat, 16 Aug 2025 21:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:arm/kvm_page_fault 4/8] arch/arm64/kvm/mmu.c:1491:43:
 error: use of undeclared identifier 'memslot'; did you mean 'memset'?
Message-ID: <202508162106.qmE93AoZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux arm/kvm_page_fault
head:   2985b2d78ea170d1acbd1d34f265422fe65b6d54
commit: 7396e81dba236f710532b18c5e262217c3cbd2d8 [4/8] KVM: arm64: Introduce "struct kvm_page_fault"
config: arm64-randconfig-002-20250816 (https://download.01.org/0day-ci/archive/20250816/202508162106.qmE93AoZ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250816/202508162106.qmE93AoZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508162106.qmE93AoZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:1491:43: error: use of undeclared identifier 'memslot'; did you mean 'memset'?
    1491 |         bool logging_active = memslot_is_logging(memslot);
         |                                                  ^~~~~~~
         |                                                  memset
   arch/arm64/include/asm/string.h:43:14: note: 'memset' declared here
      43 | extern void *memset(void *, int, __kernel_size_t);
         |              ^
>> arch/arm64/kvm/mmu.c:1491:43: error: incompatible pointer types passing 'void *(void *, int, __size_t)' (aka 'void *(void *, int, unsigned long)') to parameter of type 'struct kvm_memory_slot *' [-Werror,-Wincompatible-pointer-types]
    1491 |         bool logging_active = memslot_is_logging(memslot);
         |                                                  ^~~~~~~
   arch/arm64/kvm/mmu.c:163:56: note: passing argument to parameter 'memslot' here
     163 | static bool memslot_is_logging(struct kvm_memory_slot *memslot)
         |                                                        ^
>> arch/arm64/kvm/mmu.c:1535:39: error: no member named 'hva' in 'struct kvm_page_fault'
    1535 |         vma = vma_lookup(current->mm, fault->hva);
         |                                       ~~~~~  ^
   arch/arm64/kvm/mmu.c:1537:56: error: no member named 'hva' in 'struct kvm_page_fault'
    1537 |                 kvm_err("Failed to find VMA for hva 0x%lx\n", fault->hva);
         |                                                               ~~~~~  ^
   arch/arm64/kvm/mmu.c:1550:46: error: no member named 'hva' in 'struct kvm_page_fault'
    1550 |                 vma_shift = get_vma_page_shift(vma, fault->hva);
         |                                                     ~~~~~  ^
   arch/arm64/kvm/mmu.c:1564:62: error: no member named 'hva' in 'struct kvm_page_fault'
    1564 |                 if (fault_supports_stage2_huge_mapping(fault->slot, fault->hva, PMD_SIZE))
         |                                                                     ~~~~~  ^
>> arch/arm64/kvm/mmu.c:1579:13: error: no member named 'nested' in 'struct kvm_page_fault'
    1579 |         if (fault->nested) {
         |             ~~~~~  ^
>> arch/arm64/kvm/mmu.c:1584:3: error: use of undeclared identifier 'ipa'
    1584 |                 ipa = kvm_s2_trans_output(nested);
         |                 ^~~
>> arch/arm64/kvm/mmu.c:1584:29: error: use of undeclared identifier 'nested'
    1584 |                 ipa = kvm_s2_trans_output(nested);
         |                                           ^~~~~~
   arch/arm64/kvm/mmu.c:1591:40: error: use of undeclared identifier 'nested'
    1591 |                 max_map_size = min(kvm_s2_trans_size(nested), max_map_size);
         |                                                      ^~~~~~
   arch/arm64/kvm/mmu.c:1643:35: error: no member named 'hva' in 'struct kvm_page_fault'
    1643 |                 kvm_send_hwpoison_signal(fault->hva, vma_shift);
         |                                          ~~~~~  ^
   arch/arm64/kvm/mmu.c:1704:13: error: no member named 'nested' in 'struct kvm_page_fault'
    1704 |         if (fault->nested) {
         |             ~~~~~  ^
   arch/arm64/kvm/mmu.c:1705:44: error: no member named 'nested' in 'struct kvm_page_fault'
    1705 |                 writable &= kvm_s2_trans_writable(fault->nested);
         |                                                   ~~~~~  ^
   arch/arm64/kvm/mmu.c:1706:37: error: no member named 'nested' in 'struct kvm_page_fault'
    1706 |                 if (!kvm_s2_trans_readable(fault->nested))
         |                                            ~~~~~  ^
   arch/arm64/kvm/mmu.c:1709:42: error: no member named 'nested' in 'struct kvm_page_fault'
    1709 |                 prot |= kvm_encode_nested_level(fault->nested);
         |                                                 ~~~~~  ^
   arch/arm64/kvm/mmu.c:1728:19: error: no member named 'hva' in 'struct kvm_page_fault'
    1728 |                                                                    fault->hva, &fault->pfn,
         |                                                                    ~~~~~  ^
>> arch/arm64/kvm/mmu.c:1740:27: error: use of undeclared identifier 'pfn'
    1740 |                         sanitise_mte_tags(kvm, pfn, vma_pagesize);
         |                                                ^~~
   arch/arm64/kvm/mmu.c:1759:15: error: no member named 'nested' in 'struct kvm_page_fault'
    1759 |                    (!fault->nested || kvm_s2_trans_executable(fault->nested))) {
         |                      ~~~~~  ^
   arch/arm64/kvm/mmu.c:1759:56: error: no member named 'nested' in 'struct kvm_page_fault'
    1759 |                    (!fault->nested || kvm_s2_trans_executable(fault->nested))) {
         |                                                               ~~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +1491 arch/arm64/kvm/mmu.c

2a8dfab26677ae arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1479  
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1480  static int user_mem_abort(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1481  {
ffd1b63a586096 arch/arm64/kvm/mmu.c Will Deacon         2020-09-30  1482  	int ret = 0;
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1483  	bool writable, force_pte = false;
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1484  	bool mte_allowed, is_vma_cacheable;
8cc9dc1ae4fb07 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1485  	bool s2_force_noncacheable = false, vfio_allow_any_uc = false;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1486  	unsigned long mmu_seq;
ad361f093c1e31 arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1487  	struct kvm *kvm = vcpu->kvm;
ad361f093c1e31 arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1488  	struct vm_area_struct *vma;
1559b7583ff6ed virt/kvm/arm/mmu.c   James Morse         2019-12-17  1489  	short vma_shift;
fce886a6020734 arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1490  	void *memcache;
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15 @1491  	bool logging_active = memslot_is_logging(memslot);
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1492  	long vma_pagesize, fault_granule;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1493  	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1494  	struct kvm_pgtable *pgt;
216887f79d9878 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1495  	vm_flags_t vm_flags;
e279c25d78d672 arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1496  	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1497  
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1498  	if (fault->is_perm)
11e5ea5242e38d arch/arm64/kvm/mmu.c Ard Biesheuvel      2023-11-28  1499  		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1500  	VM_BUG_ON(fault->write && fault->exec);
d0e22b4ac3ba23 virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1501  
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1502  	if (fault->is_perm && !fault->write && !fault->exec) {
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1503  		kvm_err("Unexpected L2 read permission error\n");
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1504  		return -EFAULT;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1505  	}
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1506  
157dbc4a321f5b arch/arm64/kvm/mmu.c Sebastian Ott       2025-05-05  1507  	if (!is_protected_kvm_enabled())
157dbc4a321f5b arch/arm64/kvm/mmu.c Sebastian Ott       2025-05-05  1508  		memcache = &vcpu->arch.mmu_page_cache;
157dbc4a321f5b arch/arm64/kvm/mmu.c Sebastian Ott       2025-05-05  1509  	else
157dbc4a321f5b arch/arm64/kvm/mmu.c Sebastian Ott       2025-05-05  1510  		memcache = &vcpu->arch.pkvm_memcache;
157dbc4a321f5b arch/arm64/kvm/mmu.c Sebastian Ott       2025-05-05  1511  
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1512  	/*
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1513  	 * Permission faults just need to update the existing leaf entry,
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1514  	 * and so normally don't require allocations from the memcache. The
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1515  	 * only exception to this is when dirty logging is enabled at runtime
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1516  	 * and a write fault needs to collapse a block entry into a table.
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1517  	 */
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1518  	if (!fault->is_perm || (logging_active && fault->write)) {
fce886a6020734 arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1519  		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
fce886a6020734 arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1520  
157dbc4a321f5b arch/arm64/kvm/mmu.c Sebastian Ott       2025-05-05  1521  		if (!is_protected_kvm_enabled())
fce886a6020734 arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1522  			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
157dbc4a321f5b arch/arm64/kvm/mmu.c Sebastian Ott       2025-05-05  1523  		else
fce886a6020734 arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1524  			ret = topup_hyp_memcache(memcache, min_pages);
157dbc4a321f5b arch/arm64/kvm/mmu.c Sebastian Ott       2025-05-05  1525  
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1526  		if (ret)
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1527  			return ret;
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1528  	}
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1529  
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1530  	/*
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1531  	 * Let's check if we will get back a huge page backed by hugetlbfs, or
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1532  	 * get block mapping for device MMIO region.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1533  	 */
89154dd5313f77 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  1534  	mmap_read_lock(current->mm);
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15 @1535  	vma = vma_lookup(current->mm, fault->hva);
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1536  	if (unlikely(!vma)) {
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1537  		kvm_err("Failed to find VMA for hva 0x%lx\n", fault->hva);
89154dd5313f77 arch/arm64/kvm/mmu.c Michel Lespinasse   2020-06-08  1538  		mmap_read_unlock(current->mm);
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1539  		return -EFAULT;
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1540  	}
37b544087ef3f6 arch/arm/kvm/mmu.c   Ard Biesheuvel      2014-09-17  1541  
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1542  	/*
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1543  	 * logging_active is guaranteed to never be true for VM_PFNMAP
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1544  	 * memslots.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1545  	 */
db14091d8f7585 arch/arm64/kvm/mmu.c Vincent Donnefort   2025-05-21  1546  	if (logging_active) {
a80868f3985548 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1547  		force_pte = true;
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1548  		vma_shift = PAGE_SHIFT;
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1549  	} else {
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1550  		vma_shift = get_vma_page_shift(vma, fault->hva);
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1551  	}
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1552  
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1553  	switch (vma_shift) {
faf000397e7f10 arch/arm64/kvm/mmu.c Gavin Shan          2020-11-03  1554  #ifndef __PAGETABLE_PMD_FOLDED
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1555  	case PUD_SHIFT:
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1556  		if (fault_supports_stage2_huge_mapping(fault->slot, fault->hva, PUD_SIZE))
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1557  			break;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1558  		fallthrough;
faf000397e7f10 arch/arm64/kvm/mmu.c Gavin Shan          2020-11-03  1559  #endif
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1560  	case CONT_PMD_SHIFT:
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1561  		vma_shift = PMD_SHIFT;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1562  		fallthrough;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1563  	case PMD_SHIFT:
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1564  		if (fault_supports_stage2_huge_mapping(fault->slot, fault->hva, PMD_SIZE))
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1565  			break;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1566  		fallthrough;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1567  	case CONT_PTE_SHIFT:
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1568  		vma_shift = PAGE_SHIFT;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1569  		force_pte = true;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1570  		fallthrough;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1571  	case PAGE_SHIFT:
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1572  		break;
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1573  	default:
2f40c46021bbb3 arch/arm64/kvm/mmu.c Gavin Shan          2020-10-26  1574  		WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
a80868f3985548 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1575  	}
a80868f3985548 virt/kvm/arm/mmu.c   Suzuki K Poulose    2019-03-12  1576  
523b3999e5f620 arch/arm64/kvm/mmu.c Alexandru Elisei    2020-09-10  1577  	vma_pagesize = 1UL << vma_shift;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1578  
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15 @1579  	if (fault->nested) {
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1580  		unsigned long max_map_size;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1581  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1582  		max_map_size = force_pte ? PAGE_SIZE : PUD_SIZE;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1583  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14 @1584  		ipa = kvm_s2_trans_output(nested);
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1585  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1586  		/*
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1587  		 * If we're about to create a shadow stage 2 entry, then we
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1588  		 * can only create a block mapping if the guest stage 2 page
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1589  		 * table uses at least as big a mapping.
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1590  		 */
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1591  		max_map_size = min(kvm_s2_trans_size(nested), max_map_size);
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1592  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1593  		/*
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1594  		 * Be careful that if the mapping size falls between
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1595  		 * two host sizes, take the smallest of the two.
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1596  		 */
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1597  		if (max_map_size >= PMD_SIZE && max_map_size < PUD_SIZE)
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1598  			max_map_size = PMD_SIZE;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1599  		else if (max_map_size >= PAGE_SIZE && max_map_size < PMD_SIZE)
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1600  			max_map_size = PAGE_SIZE;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1601  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1602  		force_pte = (max_map_size == PAGE_SIZE);
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1603  		vma_pagesize = min(vma_pagesize, (long)max_map_size);
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1604  	}
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1605  
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1606  	/*
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1607  	 * Both the canonical IPA and fault IPA must be hugepage-aligned to
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1608  	 * ensure we find the right PFN and lay down the mapping in the right
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1609  	 * place.
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1610  	 */
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1611  	if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE) {
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1612  		fault->fault_ipa &= ~(vma_pagesize - 1);
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1613  		fault->ipa &= ~(vma_pagesize - 1);
1d8c3c23a6bc15 arch/arm64/kvm/mmu.c Oliver Upton        2024-08-22  1614  	}
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1615  
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1616  	fault->gfn = fault->ipa >> PAGE_SHIFT;
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1617  	mte_allowed = kvm_vma_mte_allowed(vma);
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1618  
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1619  	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1620  
216887f79d9878 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1621  	vm_flags = vma->vm_flags;
216887f79d9878 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1622  
2a8dfab26677ae arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1623  	is_vma_cacheable = kvm_vma_is_cacheable(vma);
2a8dfab26677ae arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1624  
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1625  	/* Don't use the VMA after the unlock -- it may have vanished */
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1626  	vma = NULL;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1627  
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1628  	/*
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1629  	 * Read mmu_invalidate_seq so that KVM can detect if the results of
85c7869e30b770 arch/arm64/kvm/mmu.c Sean Christopherson 2024-10-10  1630  	 * vma_lookup() or __kvm_faultin_pfn() become stale prior to
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1631  	 * acquiring kvm->mmu_lock.
10ba2d17d29729 arch/arm64/kvm/mmu.c Gavin Shan          2021-03-16  1632  	 *
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1633  	 * Rely on mmap_read_unlock() for an implicit smp_rmb(), which pairs
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1634  	 * with the smp_wmb() in kvm_mmu_invalidate_end().
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1635  	 */
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1636  	mmu_seq = vcpu->kvm->mmu_invalidate_seq;
13ec9308a85702 arch/arm64/kvm/mmu.c David Matlack       2023-03-13  1637  	mmap_read_unlock(current->mm);
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1638  
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1639  	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn,
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1640  				       fault->write ? FOLL_WRITE : 0,
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1641  				       &writable, &fault->page);
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1642  	if (fault->pfn == KVM_PFN_ERR_HWPOISON) {
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1643  		kvm_send_hwpoison_signal(fault->hva, vma_shift);
196f878a7ac2e7 virt/kvm/arm/mmu.c   James Morse         2017-06-20  1644  		return 0;
196f878a7ac2e7 virt/kvm/arm/mmu.c   James Morse         2017-06-20  1645  	}
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1646  	if (is_error_noslot_pfn(fault->pfn))
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1647  		return -EFAULT;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1648  
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1649  	/*
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1650  	 * Check if this is non-struct page memory PFN, and cannot support
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1651  	 * CMOs. It could potentially be unsafe to access as cachable.
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1652  	 */
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1653  	if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(fault->pfn)) {
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1654  		if (is_vma_cacheable) {
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1655  			/*
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1656  			 * Whilst the VMA owner expects cacheable mapping to this
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1657  			 * PFN, hardware also has to support the FWB and CACHE DIC
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1658  			 * features.
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1659  			 *
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1660  			 * ARM64 KVM relies on kernel VA mapping to the PFN to
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1661  			 * perform cache maintenance as the CMO instructions work on
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1662  			 * virtual addresses. VM_PFNMAP region are not necessarily
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1663  			 * mapped to a KVA and hence the presence of hardware features
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1664  			 * S2FWB and CACHE DIC are mandatory to avoid the need for
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1665  			 * cache maintenance.
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1666  			 */
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1667  			if (!kvm_supports_cacheable_pfnmap())
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1668  				return -EFAULT;
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1669  		} else {
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1670  			/*
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1671  			 * If the page was identified as device early by looking at
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1672  			 * the VMA flags, vma_pagesize is already representing the
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1673  			 * largest quantity we can map.  If instead it was mapped
85c7869e30b770 arch/arm64/kvm/mmu.c Sean Christopherson 2024-10-10  1674  			 * via __kvm_faultin_pfn(), vma_pagesize is set to PAGE_SIZE
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1675  			 * and must not be upgraded.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1676  			 *
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1677  			 * In both cases, we don't let transparent_hugepage_adjust()
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1678  			 * change things at the last minute.
2aa53d68cee660 arch/arm64/kvm/mmu.c Keqian Zhu          2021-05-07  1679  			 */
8cc9dc1ae4fb07 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1680  			s2_force_noncacheable = true;
0c67288e0c8bc1 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1681  		}
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1682  	} else if (logging_active && !fault->write) {
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1683  		/*
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1684  		 * Only actually map the page as writable if this was a write
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1685  		 * fault.
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1686  		 */
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1687  		writable = false;
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1688  	}
b88657674d39fc arch/arm/kvm/mmu.c   Kim Phillips        2014-06-26  1689  
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1690  	if (fault->exec && s2_force_noncacheable)
6d674e28f642e3 virt/kvm/arm/mmu.c   Marc Zyngier        2019-12-11  1691  		return -ENOEXEC;
6d674e28f642e3 virt/kvm/arm/mmu.c   Marc Zyngier        2019-12-11  1692  
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1693  	/*
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1694  	 * Potentially reduce shadow S2 permissions to match the guest's own
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1695  	 * S2. For exec faults, we'd only reach this point if the guest
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1696  	 * actually allowed it (see kvm_s2_handle_perm_fault).
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1697  	 *
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1698  	 * Also encode the level of the original translation in the SW bits
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1699  	 * of the leaf entry as a proxy for the span of that translation.
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1700  	 * This will be retrieved on TLB invalidation from the guest and
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1701  	 * used to limit the invalidation scope if a TTL hint or a range
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1702  	 * isn't provided.
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1703  	 */
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1704  	if (fault->nested) {
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1705  		writable &= kvm_s2_trans_writable(fault->nested);
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1706  		if (!kvm_s2_trans_readable(fault->nested))
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1707  			prot &= ~KVM_PGTABLE_PROT_R;
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1708  
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1709  		prot |= kvm_encode_nested_level(fault->nested);
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1710  	}
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1711  
fce886a6020734 arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1712  	kvm_fault_lock(kvm);
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1713  	pgt = vcpu->arch.hw_mmu->pgt;
9c30fc615daa3e arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1714  	if (mmu_invalidate_retry(kvm, mmu_seq)) {
9c30fc615daa3e arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1715  		ret = -EAGAIN;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1716  		goto out_unlock;
9c30fc615daa3e arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1717  	}
15a49a44fc3620 arch/arm/kvm/mmu.c   Mario Smarduch      2015-01-15  1718  
3f58bf63455588 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1719  	/*
0529c9021252a5 arch/arm64/kvm/mmu.c Suzuki K Poulose    2020-05-07  1720  	 * If we are not forced to use page mapping, check if we are
0529c9021252a5 arch/arm64/kvm/mmu.c Suzuki K Poulose    2020-05-07  1721  	 * backed by a THP and thus use block mapping if possible.
3f58bf63455588 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1722  	 */
8cc9dc1ae4fb07 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1723  	if (vma_pagesize == PAGE_SIZE && !(force_pte || s2_force_noncacheable)) {
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1724  		if (fault->is_perm && fault_granule > PAGE_SIZE)
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1725  			vma_pagesize = fault_granule;
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1726  		else
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1727  			vma_pagesize = transparent_hugepage_adjust(kvm, fault->slot,
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1728  								   fault->hva, &fault->pfn,
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1729  								   &fault->fault_ipa);
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1730  
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1731  		if (vma_pagesize < 0) {
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1732  			ret = vma_pagesize;
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1733  			goto out_unlock;
e86fc1a3a3e9b4 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1734  		}
f2cc327303b13a arch/arm64/kvm/mmu.c Marc Zyngier        2021-07-26  1735  	}
a9c0e12ebee56e virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1736  
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1737  	if (!fault->is_perm && !s2_force_noncacheable && kvm_has_mte(kvm)) {
d89585fbb30869 arch/arm64/kvm/mmu.c Peter Collingbourne 2022-11-03  1738  		/* Check the VMM hasn't introduced a new disallowed VMA */
8c2e8ac8ad4be6 arch/arm64/kvm/mmu.c Marc Zyngier        2023-03-16  1739  		if (mte_allowed) {
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1740  			sanitise_mte_tags(kvm, pfn, vma_pagesize);
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1741  		} else {
9f03db6673598f arch/arm64/kvm/mmu.c Marc Zyngier        2021-06-22  1742  			ret = -EFAULT;
ea7fc1bb1cd1b9 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1743  			goto out_unlock;
ea7fc1bb1cd1b9 arch/arm64/kvm/mmu.c Steven Price        2021-06-21  1744  		}
2dbf12ae132cc7 arch/arm64/kvm/mmu.c Catalin Marinas     2022-11-03  1745  	}
3f58bf63455588 virt/kvm/arm/mmu.c   Punit Agrawal       2018-12-11  1746  
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1747  	if (writable)
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1748  		prot |= KVM_PGTABLE_PROT_W;
a9c0e12ebee56e virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1749  
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1750  	if (fault->exec)
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1751  		prot |= KVM_PGTABLE_PROT_X;
a9c0e12ebee56e virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1752  
8cc9dc1ae4fb07 arch/arm64/kvm/mmu.c Ankit Agrawal       2025-07-05  1753  	if (s2_force_noncacheable) {
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1754  		if (vfio_allow_any_uc)
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1755  			prot |= KVM_PGTABLE_PROT_NORMAL_NC;
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1756  		else
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1757  			prot |= KVM_PGTABLE_PROT_DEVICE;
fd276e71d1e7b7 arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1758  	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC) &&
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1759  		   (!fault->nested || kvm_s2_trans_executable(fault->nested))) {
6f745f1bb5bf29 arch/arm64/kvm/mmu.c Will Deacon         2020-09-11  1760  		prot |= KVM_PGTABLE_PROT_X;
8c47ce3e1d2c28 arch/arm64/kvm/mmu.c Ankit Agrawal       2024-02-24  1761  	}
a15f693935a9f1 virt/kvm/arm/mmu.c   Marc Zyngier        2017-10-23  1762  
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1763  	/*
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1764  	 * Under the premise of getting a FSC_PERM fault, we just need to relax
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1765  	 * permissions only if vma_pagesize equals fault_granule. Otherwise,
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1766  	 * kvm_pgtable_stage2_map() should be called to change block size.
7d894834a30556 arch/arm64/kvm/mmu.c Yanan Wang          2020-12-02  1767  	 */
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1768  	if (fault->is_perm && vma_pagesize == fault_granule) {
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1769  		/*
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1770  		 * Drop the SW bits in favour of those stored in the
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1771  		 * PTE, which will be preserved.
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1772  		 */
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1773  		prot &= ~KVM_NV_GUEST_MAP_SZ;
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1774  		ret = KVM_PGT_FN(kvm_pgtable_stage2_relax_perms)(pgt, fault->fault_ipa, prot, flags);
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1775  	} else {
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1776  		ret = KVM_PGT_FN(kvm_pgtable_stage2_map)(pgt, fault->fault_ipa, vma_pagesize,
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1777  					     __pfn_to_phys(fault->pfn), prot,
e279c25d78d672 arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1778  					     memcache, flags);
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1779  	}
b1a3a94812b95f arch/arm64/kvm/mmu.c Marc Zyngier        2024-06-14  1780  
9c30fc615daa3e arch/arm64/kvm/mmu.c Fuad Tabba          2024-04-23  1781  out_unlock:
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1782  	kvm_release_faultin_page(kvm, fault->page, !!ret, writable);
fce886a6020734 arch/arm64/kvm/mmu.c Quentin Perret      2024-12-18  1783  	kvm_fault_unlock(kvm);
ad361f093c1e31 arch/arm/kvm/mmu.c   Christoffer Dall    2012-11-01  1784  
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1785  	/* Mark the page dirty only if the fault is handled successfully */
28991c91d577c3 arch/arm64/kvm/mmu.c Sean Christopherson 2024-10-10  1786  	if (writable && !ret)
7396e81dba236f arch/arm64/kvm/mmu.c Sean Christopherson 2025-08-15  1787  		mark_page_dirty_in_slot(kvm, fault->slot, fault->gfn);
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1788  
509552e65ae828 arch/arm64/kvm/mmu.c Yanan Wang          2021-01-14  1789  	return ret != -EAGAIN ? ret : 0;
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1790  }
94f8e6418d3915 arch/arm/kvm/mmu.c   Christoffer Dall    2013-01-20  1791  

:::::: The code at line 1491 was first introduced by commit
:::::: 15a49a44fc36209e1112e9b8451d653cd07f17a8 KVM: arm: page logging 2nd stage fault handling

:::::: TO: Mario Smarduch <m.smarduch@samsung.com>
:::::: CC: Christoffer Dall <christoffer.dall@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
