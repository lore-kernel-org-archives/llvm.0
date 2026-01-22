Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA63A63F2;
	Thu, 22 Jan 2026 11:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080806; cv=none; b=ZP+azv6UIjYcA+KMXgdYcGU2Ve1pUHwnipdonfmUbDK04nU/PEi2hcLCyz/yll83DzrtuPe+a5fj3ZrRNuORz9ugmzHbqtat4w8JSOOJ3Eug4+vnv2sjPUDZbIo7nuan4t7dImpmgbV/KDlOU/O6Y4+XBFhnozvHPZHpLqGZqBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080806; c=relaxed/simple;
	bh=lRLiAHj9jzb4KlyoZbkcVkHMStIy25YxEgiARjDkh6c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dH1hkwiTgwZ4NHYKQu7TVjCr3BvfwEpjI5PgbonEvk32u0LDoc/qN+DB9tSlvhIrNEUoui1VcofwrofXhsvDzvxnzzYnKlVIupZ2UhSfcVye/m/70Ov0jd+/t3yWR8bDgZMuWLuMqxU4Vb+NgZ9nisxjQO4zwrLypnyuVOa6Dsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hjm+WNOS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hjm+WNOS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769080804; x=1800616804;
  h=date:from:to:cc:subject:message-id;
  bh=lRLiAHj9jzb4KlyoZbkcVkHMStIy25YxEgiARjDkh6c=;
  b=Hjm+WNOSjFXnSrfNQ8Z80kQNva/vLoWfz4j26cVf9KdKMtveJ6kRXGZn
   GtjPSjIWXq46am8uRscWe6qBcRucQoWepg4rSG7Ra+Dw0K31rqJ9vwOms
   KIZz4C2t3a9a1ncltxZj8vIYLBeNatjBG/OvOz4yG/Hta880FlRxp4nrw
   omHn2KMuiwI/TVRNLjyaY7ZRI9WeU0h3KpFq84YVk32YMA7EhZbHvVw0N
   WndXJZxLoDVoG8xAd1d648GOO2VTkX6ca07Sy7j08UIim2MltNLqrwDQc
   wg00E9K29BbDwJfJT8KdO0vq71RiUAHiWwX1o0vfqgk5DzPFcKWgEEEDQ
   A==;
X-CSE-ConnectionGUID: LalM7pezRaKbrVTOIbd1BA==
X-CSE-MsgGUID: u/geUbNsQ5udMQZLDdjmvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="80945460"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="80945460"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 03:20:00 -0800
X-CSE-ConnectionGUID: J7QxpRjyS/G6fmdcts9GfQ==
X-CSE-MsgGUID: 7SW8XF3JTtKKQEj0AdApqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="206316025"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jan 2026 03:19:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1visjD-00000000Slt-24im;
	Thu, 22 Jan 2026 11:19:55 +0000
Date: Thu, 22 Jan 2026 19:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [sean-jc:x86/tdx_huge_sept 74/79]
 arch/x86/kvm/vmx/tdx.c:1681:18: error: call to undeclared function
 'pg_level_to_tdx_sept_level'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202601221946.nbvhBU8j-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/tdx_huge_sept
head:   491d01f5d2ac33f4da9d302ff18cdcb57c0d967b
commit: 84226a5d74fe3dbae9acd5a4a615439afcd3d8d4 [74/79] KVM: TDX: Enable huge page splitting under write mmu_lock
config: x86_64-randconfig-015-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221946.nbvhBU8j-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221946.nbvhBU8j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601221946.nbvhBU8j-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/tdx.c:1681:18: error: call to undeclared function 'pg_level_to_tdx_sept_level'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1681 |         int tdx_level = pg_level_to_tdx_sept_level(level);
         |                         ^
>> arch/x86/kvm/vmx/tdx.c:1697:2: error: call to undeclared function 'tdx_track'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1697 |         tdx_track(kvm);
         |         ^
>> arch/x86/kvm/vmx/tdx.c:1700:21: error: incompatible pointer to integer conversion passing 'struct page *' to parameter of type 'u64' (aka 'unsigned long long') [-Wint-conversion]
    1700 |                               tdx_level, new_sept_page, &entry, &level_state);
         |                                          ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c:308:19: note: expanded from macro 'tdh_do_no_vcpus'
     308 |         __err = tdh_func(args);                                                 \
         |                          ^~~~
   arch/x86/include/asm/tdx.h:232:68: note: passing argument to parameter 'new_pfn' here
     232 | u64 tdh_mem_page_demote(struct tdx_td *td, u64 gpa, int level, u64 new_pfn, u64 *ext_err1, u64 *ext_err2);
         |                                                                    ^
>> arch/x86/kvm/vmx/tdx.c:1700:21: error: incompatible pointer to integer conversion passing 'struct page *' to parameter of type 'u64' (aka 'unsigned long long') [-Wint-conversion]
    1700 |                               tdx_level, new_sept_page, &entry, &level_state);
         |                                          ^~~~~~~~~~~~~
   arch/x86/kvm/vmx/tdx.c:313:20: note: expanded from macro 'tdh_do_no_vcpus'
     313 |                 __err = tdh_func(args);                                         \
         |                                  ^~~~
   arch/x86/include/asm/tdx.h:232:68: note: passing argument to parameter 'new_pfn' here
     232 | u64 tdh_mem_page_demote(struct tdx_td *td, u64 gpa, int level, u64 new_pfn, u64 *ext_err1, u64 *ext_err2);
         |                                                                    ^
>> arch/x86/kvm/vmx/tdx.c:1710:45: error: use of undeclared identifier 'mirror_spte'
    1710 |         struct kvm_mmu_page *sp = spte_to_child_sp(mirror_spte);
         |                                                    ^
>> arch/x86/kvm/vmx/tdx.c:1720:38: error: too few arguments to function call, expected 5, have 0
    1720 |                 return tdx_sept_split_private_spte()
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   arch/x86/kvm/vmx/tdx.c:1677:12: note: 'tdx_sept_split_private_spte' declared here
    1677 | static int tdx_sept_split_private_spte(struct kvm *kvm, gfn_t gfn, enum pg_level level,
         |            ^                           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1678 |                                        u64 old_mirror_spte, void *new_private_spt)
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/vmx/tdx.c:1720:39: error: expected ';' after return statement
    1720 |                 return tdx_sept_split_private_spte()
         |                                                     ^
         |                                                     ;
   arch/x86/kvm/vmx/tdx.c:1738:30: error: use of undeclared identifier 'mirror_spte'
    1738 |         kvm_pfn_t pfn = spte_to_pfn(mirror_spte);
         |                                     ^
   arch/x86/kvm/vmx/tdx.c:1749:61: error: too few arguments to function call, expected 5, have 4
    1749 |                 return tdx_sept_link_private_spt(kvm, gfn, level, new_spte);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~                          ^
   arch/x86/kvm/vmx/tdx.c:1707:12: note: 'tdx_sept_link_private_spt' declared here
    1707 | static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn, u64 old_spte,
         |            ^                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1708 |                                      u64 new_spte, enum pg_level level)
         |                                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/vmx/tdx.c:1814:13: error: conflicting types for 'tdx_track'
    1814 | static void tdx_track(struct kvm *kvm)
         |             ^
   arch/x86/kvm/vmx/tdx.c:1697:2: note: previous implicit declaration is here
    1697 |         tdx_track(kvm);
         |         ^
   10 errors generated.


vim +/pg_level_to_tdx_sept_level +1681 arch/x86/kvm/vmx/tdx.c

  1664	
  1665	/*
  1666	 * Split a huge mapping into the target level.  Currently only supports 2MiB
  1667	 * mappings (KVM doesn't yet support 1GiB mappings for TDX guests).
  1668	 *
  1669	 * Invoke "BLOCK + TRACK + kick off vCPUs (inside tdx_track())" since DEMOTE
  1670	 * now does not support yet the NON-BLOCKING-RESIZE feature. No UNBLOCK is
  1671	 * needed after a successful DEMOTE.
  1672	 *
  1673	 * Under write mmu_lock, kick off all vCPUs (inside tdh_do_no_vcpus()) to ensure
  1674	 * DEMOTE will succeed on the second invocation if the first invocation returns
  1675	 * BUSY.
  1676	 */
  1677	static int tdx_sept_split_private_spte(struct kvm *kvm, gfn_t gfn, enum pg_level level,
  1678					       u64 old_mirror_spte, void *new_private_spt)
  1679	{
  1680		struct page *new_sept_page = virt_to_page(new_private_spt);
> 1681		int tdx_level = pg_level_to_tdx_sept_level(level);
  1682		struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
  1683		gpa_t gpa = gfn_to_gpa(gfn);
  1684		u64 err, entry, level_state;
  1685	
  1686		lockdep_assert_held_write(&kvm->mmu_lock);
  1687	
  1688		if (KVM_BUG_ON(kvm_tdx->state != TD_STATE_RUNNABLE, kvm) ||
  1689		    KVM_BUG_ON(level != PG_LEVEL_2M, kvm))
  1690			return -EIO;
  1691	
  1692		err = tdh_do_no_vcpus(tdh_mem_range_block, kvm, &kvm_tdx->td, gpa,
  1693				      tdx_level, &entry, &level_state);
  1694		if (TDX_BUG_ON_2(err, TDH_MEM_RANGE_BLOCK, entry, level_state, kvm))
  1695			return -EIO;
  1696	
> 1697		tdx_track(kvm);
  1698	
  1699		err = tdh_do_no_vcpus(tdh_mem_page_demote, kvm, &kvm_tdx->td, gpa,
> 1700				      tdx_level, new_sept_page, &entry, &level_state);
  1701		if (TDX_BUG_ON_2(err, TDH_MEM_PAGE_DEMOTE, entry, level_state, kvm))
  1702			return -EIO;
  1703	
  1704		return 0;
  1705	}
  1706	
  1707	static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn, u64 old_spte,
  1708					     u64 new_spte, enum pg_level level)
  1709	{
> 1710		struct kvm_mmu_page *sp = spte_to_child_sp(mirror_spte);
  1711		gpa_t gpa = gfn_to_gpa(gfn);
  1712		u64 err, entry, level_state;
  1713	
  1714		if (KVM_BUG_ON(!sp->external_spt, kvm) ||
  1715		    KVM_BUG_ON(sp->role.level + 1 != level, kvm) ||
  1716		    KVM_BUG_ON(sp->gfn != gfn, kvm))
  1717			return -EIO;
  1718	
  1719		if (is_shadow_present_pte(old_spte))
> 1720			return tdx_sept_split_private_spte()
  1721	
  1722		err = tdh_mem_sept_add(&to_kvm_tdx(kvm)->td, gpa, level,
  1723				       virt_to_page(sp->external_spt), &entry, &level_state);
  1724		if (unlikely(IS_TDX_OPERAND_BUSY(err)))
  1725			return -EBUSY;
  1726	
  1727		if (TDX_BUG_ON_2(err, TDH_MEM_SEPT_ADD, entry, level_state, kvm))
  1728			return -EIO;
  1729	
  1730		return 0;
  1731	}
  1732	
  1733	static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
  1734					     u64 new_spte, enum pg_level level)
  1735	{
  1736		struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
  1737		struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
  1738		kvm_pfn_t pfn = spte_to_pfn(mirror_spte);
  1739		struct vcpu_tdx *tdx = to_tdx(vcpu);
  1740		int ret;
  1741	
  1742		if (KVM_BUG_ON(!vcpu, kvm))
  1743			return -EINVAL;
  1744	
  1745		if (KVM_BUG_ON(!is_shadow_present_pte(new_spte), kvm))
  1746			return -EIO;
  1747	
  1748		if (!is_last_spte(new_spte, level))
  1749			return tdx_sept_link_private_spt(kvm, gfn, level, new_spte);
  1750	
  1751		/* TODO: handle large pages. */
  1752		if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
  1753			return -EIO;
  1754	
  1755		WARN_ON_ONCE(!is_shadow_present_pte(new_spte) ||
  1756			     (new_spte & VMX_EPT_RWX_MASK) != VMX_EPT_RWX_MASK);
  1757	
  1758		ret = tdx_pamt_get(pfn, &tdx->pamt_cache);
  1759		if (ret)
  1760			return ret;
  1761	
  1762		/*
  1763		 * Ensure pre_fault_allowed is read by kvm_arch_vcpu_pre_fault_memory()
  1764		 * before kvm_tdx->state.  Userspace must not be allowed to pre-fault
  1765		 * arbitrary memory until the initial memory image is finalized.  Pairs
  1766		 * with the smp_wmb() in tdx_td_finalize().
  1767		 */
  1768		smp_rmb();
  1769	
  1770		/*
  1771		 * If the TD isn't finalized/runnable, then userspace is initializing
  1772		 * the VM image via KVM_TDX_INIT_MEM_REGION; ADD the page to the TD.
  1773		 */
  1774		if (likely(kvm_tdx->state == TD_STATE_RUNNABLE))
  1775			ret = tdx_mem_page_aug(kvm, gfn, level, pfn);
  1776		else
  1777			ret = tdx_mem_page_add(kvm, gfn, level, pfn);
  1778	
  1779		if (ret)
  1780			tdx_pamt_put(pfn);
  1781	
  1782		return ret;
  1783	}
  1784	
  1785	static int tdx_topup_external_pamt_cache(struct kvm_vcpu *vcpu, int min)
  1786	{
  1787		return tdx_topup_pamt_cache(&to_tdx(vcpu)->pamt_cache, min);
  1788	}
  1789	
  1790	/*
  1791	 * Ensure shared and private EPTs to be flushed on all vCPUs.
  1792	 * tdh_mem_track() is the only caller that increases TD epoch. An increase in
  1793	 * the TD epoch (e.g., to value "N + 1") is successful only if no vCPUs are
  1794	 * running in guest mode with the value "N - 1".
  1795	 *
  1796	 * A successful execution of tdh_mem_track() ensures that vCPUs can only run in
  1797	 * guest mode with TD epoch value "N" if no TD exit occurs after the TD epoch
  1798	 * being increased to "N + 1".
  1799	 *
  1800	 * Kicking off all vCPUs after that further results in no vCPUs can run in guest
  1801	 * mode with TD epoch value "N", which unblocks the next tdh_mem_track() (e.g.
  1802	 * to increase TD epoch to "N + 2").
  1803	 *
  1804	 * TDX module will flush EPT on the next TD enter and make vCPUs to run in
  1805	 * guest mode with TD epoch value "N + 1".
  1806	 *
  1807	 * kvm_make_all_cpus_request() guarantees all vCPUs are out of guest mode by
  1808	 * waiting empty IPI handler ack_kick().
  1809	 *
  1810	 * No action is required to the vCPUs being kicked off since the kicking off
  1811	 * occurs certainly after TD epoch increment and before the next
  1812	 * tdh_mem_track().
  1813	 */
> 1814	static void tdx_track(struct kvm *kvm)
  1815	{
  1816		struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
  1817		u64 err;
  1818	
  1819		/* If TD isn't finalized, it's before any vcpu running. */
  1820		if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
  1821			return;
  1822	
  1823		/*
  1824		 * The full sequence of TDH.MEM.TRACK and forcing vCPUs out of guest
  1825		 * mode must be serialized, as TDH.MEM.TRACK will fail if the previous
  1826		 * tracking epoch hasn't completed.
  1827		 */
  1828		lockdep_assert_held_write(&kvm->mmu_lock);
  1829	
  1830		err = tdh_do_no_vcpus(tdh_mem_track, kvm, &kvm_tdx->td);
  1831		TDX_BUG_ON(err, TDH_MEM_TRACK, kvm);
  1832	
  1833		kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
  1834	}
  1835	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
