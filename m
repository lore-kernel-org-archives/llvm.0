Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FFD4C84
	for <llvm@lists.linux.dev>; Fri, 17 Jun 2022 21:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655502917; x=1687038917;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wHhy4zJsIVibuHCXhxcjODunU1p0an2NklOVPsyTEKw=;
  b=XiqyI9oeHiXVcOd3bB/WXwpWYT7+V7zjsnvqau2zFko40QJaGqz9dXu8
   /nEBxlvoD+piYPvMb/dKi4EfvW1cNNt/uSKMLm4mW0KQU2yjl9tOuOkl8
   vmE3W/O/kQNpRqfwbsrQdGFpWZ5FlmxDm5lwCvtmu+tAemPah8vXk6Sp8
   R/GPGVN+HRtBZ147ojXRMLhoBl1vjhRSEOBiSOzc/N35XTI4Xw3qTTX73
   LKwNIy19+px5n+/cmx6Hb+n58oR8jTJOz9uEpko6tuUFPiguf96aPqcWw
   zLuAZi6dsbmN00FwirZgO1pD10qMQc6LSK9M10e4gmwe6M1iKDJeWD/0d
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="262634622"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="262634622"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2022 14:55:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="653788565"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 17 Jun 2022 14:54:00 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o2Jue-000PnJ-Ey;
	Fri, 17 Jun 2022 21:53:56 +0000
Date: Sat, 18 Jun 2022 05:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Xu <peterx@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 2/4] kvm: Merge "atomic" and "write" in
 __gfn_to_pfn_memslot()
Message-ID: <202206180532.C71KuyHh-lkp@intel.com>
References: <20220617014147.7299-3-peterx@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220617014147.7299-3-peterx@redhat.com>

Hi Peter,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on powerpc/topic/ppc-kvm]
[also build test ERROR on mst-vhost/linux-next linus/master v5.19-rc2]
[cannot apply to kvm/queue next-20220617]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Peter-Xu/kvm-mm-Allow-GUP-to-respond-to-non-fatal-signals/20220617-094403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
config: arm64-randconfig-r001-20220617 (https://download.01.org/0day-ci/archive/20220618/202206180532.C71KuyHh-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/6230b0019f9d1e0090102d9bb15c0029edf13c58
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Peter-Xu/kvm-mm-Allow-GUP-to-respond-to-non-fatal-signals/20220617-094403
        git checkout 6230b0019f9d1e0090102d9bb15c0029edf13c58
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/mmu.c:1209:32: error: too many arguments to function call, expected 6, have 7
                                      false, NULL, &writable, NULL);
                                                              ^~~~
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
   #define NULL ((void *)0)
                ^~~~~~~~~~~
   include/linux/kvm_host.h:1156:11: note: '__gfn_to_pfn_memslot' declared here
   kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
             ^
   1 error generated.


vim +1209 arch/arm64/kvm/mmu.c

  1086	
  1087	static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
  1088				  struct kvm_memory_slot *memslot, unsigned long hva,
  1089				  unsigned long fault_status)
  1090	{
  1091		int ret = 0;
  1092		bool write_fault, writable, force_pte = false;
  1093		bool exec_fault;
  1094		bool device = false;
  1095		bool shared;
  1096		unsigned long mmu_seq;
  1097		struct kvm *kvm = vcpu->kvm;
  1098		struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
  1099		struct vm_area_struct *vma;
  1100		short vma_shift;
  1101		gfn_t gfn;
  1102		kvm_pfn_t pfn;
  1103		bool logging_active = memslot_is_logging(memslot);
  1104		bool use_read_lock = false;
  1105		unsigned long fault_level = kvm_vcpu_trap_get_fault_level(vcpu);
  1106		unsigned long vma_pagesize, fault_granule;
  1107		enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
  1108		struct kvm_pgtable *pgt;
  1109	
  1110		fault_granule = 1UL << ARM64_HW_PGTABLE_LEVEL_SHIFT(fault_level);
  1111		write_fault = kvm_is_write_fault(vcpu);
  1112		exec_fault = kvm_vcpu_trap_is_exec_fault(vcpu);
  1113		VM_BUG_ON(write_fault && exec_fault);
  1114	
  1115		if (fault_status == FSC_PERM && !write_fault && !exec_fault) {
  1116			kvm_err("Unexpected L2 read permission error\n");
  1117			return -EFAULT;
  1118		}
  1119	
  1120		/*
  1121		 * Let's check if we will get back a huge page backed by hugetlbfs, or
  1122		 * get block mapping for device MMIO region.
  1123		 */
  1124		mmap_read_lock(current->mm);
  1125		vma = vma_lookup(current->mm, hva);
  1126		if (unlikely(!vma)) {
  1127			kvm_err("Failed to find VMA for hva 0x%lx\n", hva);
  1128			mmap_read_unlock(current->mm);
  1129			return -EFAULT;
  1130		}
  1131	
  1132		/*
  1133		 * logging_active is guaranteed to never be true for VM_PFNMAP
  1134		 * memslots.
  1135		 */
  1136		if (logging_active) {
  1137			force_pte = true;
  1138			vma_shift = PAGE_SHIFT;
  1139			use_read_lock = (fault_status == FSC_PERM && write_fault &&
  1140					 fault_granule == PAGE_SIZE);
  1141		} else {
  1142			vma_shift = get_vma_page_shift(vma, hva);
  1143		}
  1144	
  1145		shared = (vma->vm_flags & VM_SHARED);
  1146	
  1147		switch (vma_shift) {
  1148	#ifndef __PAGETABLE_PMD_FOLDED
  1149		case PUD_SHIFT:
  1150			if (fault_supports_stage2_huge_mapping(memslot, hva, PUD_SIZE))
  1151				break;
  1152			fallthrough;
  1153	#endif
  1154		case CONT_PMD_SHIFT:
  1155			vma_shift = PMD_SHIFT;
  1156			fallthrough;
  1157		case PMD_SHIFT:
  1158			if (fault_supports_stage2_huge_mapping(memslot, hva, PMD_SIZE))
  1159				break;
  1160			fallthrough;
  1161		case CONT_PTE_SHIFT:
  1162			vma_shift = PAGE_SHIFT;
  1163			force_pte = true;
  1164			fallthrough;
  1165		case PAGE_SHIFT:
  1166			break;
  1167		default:
  1168			WARN_ONCE(1, "Unknown vma_shift %d", vma_shift);
  1169		}
  1170	
  1171		vma_pagesize = 1UL << vma_shift;
  1172		if (vma_pagesize == PMD_SIZE || vma_pagesize == PUD_SIZE)
  1173			fault_ipa &= ~(vma_pagesize - 1);
  1174	
  1175		gfn = fault_ipa >> PAGE_SHIFT;
  1176		mmap_read_unlock(current->mm);
  1177	
  1178		/*
  1179		 * Permission faults just need to update the existing leaf entry,
  1180		 * and so normally don't require allocations from the memcache. The
  1181		 * only exception to this is when dirty logging is enabled at runtime
  1182		 * and a write fault needs to collapse a block entry into a table.
  1183		 */
  1184		if (fault_status != FSC_PERM || (logging_active && write_fault)) {
  1185			ret = kvm_mmu_topup_memory_cache(memcache,
  1186							 kvm_mmu_cache_min_pages(kvm));
  1187			if (ret)
  1188				return ret;
  1189		}
  1190	
  1191		mmu_seq = vcpu->kvm->mmu_notifier_seq;
  1192		/*
  1193		 * Ensure the read of mmu_notifier_seq happens before we call
  1194		 * gfn_to_pfn_prot (which calls get_user_pages), so that we don't risk
  1195		 * the page we just got a reference to gets unmapped before we have a
  1196		 * chance to grab the mmu_lock, which ensure that if the page gets
  1197		 * unmapped afterwards, the call to kvm_unmap_gfn will take it away
  1198		 * from us again properly. This smp_rmb() interacts with the smp_wmb()
  1199		 * in kvm_mmu_notifier_invalidate_<page|range_end>.
  1200		 *
  1201		 * Besides, __gfn_to_pfn_memslot() instead of gfn_to_pfn_prot() is
  1202		 * used to avoid unnecessary overhead introduced to locate the memory
  1203		 * slot because it's always fixed even @gfn is adjusted for huge pages.
  1204		 */
  1205		smp_rmb();
  1206	
  1207		pfn = __gfn_to_pfn_memslot(memslot, gfn,
  1208					   write_fault ? KVM_GTP_WRITE : 0,
> 1209					   false, NULL, &writable, NULL);
  1210		if (pfn == KVM_PFN_ERR_HWPOISON) {
  1211			kvm_send_hwpoison_signal(hva, vma_shift);
  1212			return 0;
  1213		}
  1214		if (is_error_noslot_pfn(pfn))
  1215			return -EFAULT;
  1216	
  1217		if (kvm_is_device_pfn(pfn)) {
  1218			/*
  1219			 * If the page was identified as device early by looking at
  1220			 * the VMA flags, vma_pagesize is already representing the
  1221			 * largest quantity we can map.  If instead it was mapped
  1222			 * via gfn_to_pfn_prot(), vma_pagesize is set to PAGE_SIZE
  1223			 * and must not be upgraded.
  1224			 *
  1225			 * In both cases, we don't let transparent_hugepage_adjust()
  1226			 * change things at the last minute.
  1227			 */
  1228			device = true;
  1229		} else if (logging_active && !write_fault) {
  1230			/*
  1231			 * Only actually map the page as writable if this was a write
  1232			 * fault.
  1233			 */
  1234			writable = false;
  1235		}
  1236	
  1237		if (exec_fault && device)
  1238			return -ENOEXEC;
  1239	
  1240		/*
  1241		 * To reduce MMU contentions and enhance concurrency during dirty
  1242		 * logging dirty logging, only acquire read lock for permission
  1243		 * relaxation.
  1244		 */
  1245		if (use_read_lock)
  1246			read_lock(&kvm->mmu_lock);
  1247		else
  1248			write_lock(&kvm->mmu_lock);
  1249		pgt = vcpu->arch.hw_mmu->pgt;
  1250		if (mmu_notifier_retry(kvm, mmu_seq))
  1251			goto out_unlock;
  1252	
  1253		/*
  1254		 * If we are not forced to use page mapping, check if we are
  1255		 * backed by a THP and thus use block mapping if possible.
  1256		 */
  1257		if (vma_pagesize == PAGE_SIZE && !(force_pte || device)) {
  1258			if (fault_status == FSC_PERM && fault_granule > PAGE_SIZE)
  1259				vma_pagesize = fault_granule;
  1260			else
  1261				vma_pagesize = transparent_hugepage_adjust(kvm, memslot,
  1262									   hva, &pfn,
  1263									   &fault_ipa);
  1264		}
  1265	
  1266		if (fault_status != FSC_PERM && !device && kvm_has_mte(kvm)) {
  1267			/* Check the VMM hasn't introduced a new VM_SHARED VMA */
  1268			if (!shared)
  1269				ret = sanitise_mte_tags(kvm, pfn, vma_pagesize);
  1270			else
  1271				ret = -EFAULT;
  1272			if (ret)
  1273				goto out_unlock;
  1274		}
  1275	
  1276		if (writable)
  1277			prot |= KVM_PGTABLE_PROT_W;
  1278	
  1279		if (exec_fault)
  1280			prot |= KVM_PGTABLE_PROT_X;
  1281	
  1282		if (device)
  1283			prot |= KVM_PGTABLE_PROT_DEVICE;
  1284		else if (cpus_have_const_cap(ARM64_HAS_CACHE_DIC))
  1285			prot |= KVM_PGTABLE_PROT_X;
  1286	
  1287		/*
  1288		 * Under the premise of getting a FSC_PERM fault, we just need to relax
  1289		 * permissions only if vma_pagesize equals fault_granule. Otherwise,
  1290		 * kvm_pgtable_stage2_map() should be called to change block size.
  1291		 */
  1292		if (fault_status == FSC_PERM && vma_pagesize == fault_granule) {
  1293			ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot);
  1294		} else {
  1295			WARN_ONCE(use_read_lock, "Attempted stage-2 map outside of write lock\n");
  1296	
  1297			ret = kvm_pgtable_stage2_map(pgt, fault_ipa, vma_pagesize,
  1298						     __pfn_to_phys(pfn), prot,
  1299						     memcache);
  1300		}
  1301	
  1302		/* Mark the page dirty only if the fault is handled successfully */
  1303		if (writable && !ret) {
  1304			kvm_set_pfn_dirty(pfn);
  1305			mark_page_dirty_in_slot(kvm, memslot, gfn);
  1306		}
  1307	
  1308	out_unlock:
  1309		if (use_read_lock)
  1310			read_unlock(&kvm->mmu_lock);
  1311		else
  1312			write_unlock(&kvm->mmu_lock);
  1313		kvm_set_pfn_accessed(pfn);
  1314		kvm_release_pfn_clean(pfn);
  1315		return ret != -EAGAIN ? ret : 0;
  1316	}
  1317	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
