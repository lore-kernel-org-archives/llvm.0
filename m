Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC2C641;
	Tue, 26 Dec 2023 18:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nVtcsS84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703616978; x=1735152978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z6qNmIySF9Q3Lq9W1ZMlBKFfoeIIdByhuBQvQ1b10rs=;
  b=nVtcsS84K1q0Q9XIPnZ8zWg9w46/xgcBB3f2/bukkjqu9gzBFGINu5xu
   HgAOqOfIjYhH9QTrDZRcobybsJURlHtCq7l7aKZnrkZTsFgUSvNUEVWJR
   yGB3OwFPCmF1VzXAtlj1AjrpqN0jdwe4Twzhewrlor9pLd2y0/C25yuji
   cUO1RmcitkbAkoY8wPt0fsTqTuAM7YDdt7mUl0OlZtHfeLuL4gdW+PmE6
   Vtdz/pDPOyU6m3I4kFTxLlWFmk3amb3npRGczB7Yudgxev6AFSvBvqhUW
   X+ATit0SyFycUndX+XLkbPZBvAqclDdAAMLDPHZZ0/dCVmSqy9d67rzOd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="376514135"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="376514135"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 10:56:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="812319158"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="812319158"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 26 Dec 2023 10:56:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rICb6-000El5-2k;
	Tue, 26 Dec 2023 18:56:12 +0000
Date: Wed, 27 Dec 2023 02:56:12 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [ls-zhu:v6.7-rc6-tdx 232/282] arch/x86/kvm/vmx/tdx.c:1787:23: error:
 use of undeclared identifier 'TDX_GPA_RANGE_ALREADY_BLOCKED'
Message-ID: <202312270208.NKKZKmCe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ls-zhu/linux v6.7-rc6-tdx
head:   f93b906ffa74dd315ef637148ad93ab50e1a1892
commit: 879bb1651d31ee86592e5f9312092b4d6ff69392 [232/282] [REVERTME] KVM: TDX: return -EAGAIN on race to populate Secure  EPT entry
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231227/202312270208.NKKZKmCe-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312270208.NKKZKmCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312270208.NKKZKmCe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/vmx/tdx.c:1787:23: error: use of undeclared identifier 'TDX_GPA_RANGE_ALREADY_BLOCKED'
           if (unlikely(err == (TDX_GPA_RANGE_ALREADY_BLOCKED | TDX_OPERAND_ID_RCX)))
                                ^
>> arch/x86/kvm/vmx/tdx.c:1897:23: error: use of undeclared identifier 'TDX_GPA_RANGE_NOT_BLOCKED'
           if (unlikely(err == (TDX_GPA_RANGE_NOT_BLOCKED | TDX_OPERAND_ID_RCX)))
                                ^
   arch/x86/kvm/vmx/tdx.c:2475:31: warning: operator '?:' has lower precedence than '|'; '|' will be evaluated first [-Wbitwise-conditional-parentheses]
                    cpu_has_vmx_ept_5levels()) ? TDX_CAP_GPAW_52 : 0,
                    ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   arch/x86/kvm/vmx/tdx.c:2475:31: note: place parentheses around the '|' expression to silence this warning
                    cpu_has_vmx_ept_5levels()) ? TDX_CAP_GPAW_52 : 0,
                    ~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   arch/x86/kvm/vmx/tdx.c:2475:31: note: place parentheses around the '?:' expression to evaluate it first
                    cpu_has_vmx_ept_5levels()) ? TDX_CAP_GPAW_52 : 0,
                                               ^
                                                                    )
   1 warning and 2 errors generated.


vim +/TDX_GPA_RANGE_ALREADY_BLOCKED +1787 arch/x86/kvm/vmx/tdx.c

  1770	
  1771	static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
  1772					      enum pg_level level)
  1773	{
  1774		int tdx_level = pg_level_to_tdx_sept_level(level);
  1775		struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
  1776		gpa_t gpa = gfn_to_gpa(gfn) & KVM_HPAGE_MASK(level);
  1777		struct tdx_module_args out;
  1778		u64 err;
  1779	
  1780		/* This can be called when destructing guest TD after freeing HKID. */
  1781		if (unlikely(!is_hkid_assigned(kvm_tdx)))
  1782			return 0;
  1783	
  1784		err = tdh_mem_range_block(kvm_tdx->tdr_pa, gpa, tdx_level, &out);
  1785		if (unlikely(err == TDX_ERROR_SEPT_BUSY))
  1786			return -EAGAIN;
> 1787		if (unlikely(err == (TDX_GPA_RANGE_ALREADY_BLOCKED | TDX_OPERAND_ID_RCX)))
  1788			err = 0;
  1789	
  1790		if (KVM_BUG_ON(err, kvm)) {
  1791			pr_tdx_error(TDH_MEM_RANGE_BLOCK, err, &out);
  1792			return -EIO;
  1793		}
  1794	
  1795		smp_store_release(&kvm_tdx->has_range_blocked, true);
  1796		return 0;
  1797	}
  1798	
  1799	/*
  1800	 * TLB shoot down procedure:
  1801	 * There is a global epoch counter and each vcpu has local epoch counter.
  1802	 * - TDH.MEM.RANGE.BLOCK(TDR. level, range) on one vcpu
  1803	 *   This blocks the subsequenct creation of TLB translation on that range.
  1804	 *   This corresponds to clear the present bit(all RXW) in EPT entry
  1805	 * - TDH.MEM.TRACK(TDR): advances the epoch counter which is global.
  1806	 * - IPI to remote vcpus
  1807	 * - TDExit and re-entry with TDH.VP.ENTER on remote vcpus
  1808	 * - On re-entry, TDX module compares the local epoch counter with the global
  1809	 *   epoch counter.  If the local epoch counter is older than the global epoch
  1810	 *   counter, update the local epoch counter and flushes TLB.
  1811	 */
  1812	static void tdx_track(struct kvm *kvm)
  1813	{
  1814		struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
  1815		struct kvm_vcpu *vcpu;
  1816		unsigned long i;
  1817		u64 err;
  1818	
  1819		KVM_BUG_ON(!is_hkid_assigned(kvm_tdx), kvm);
  1820		/* If TD isn't finalized, it's before any vcpu running. */
  1821		if (unlikely(!is_td_finalized(kvm_tdx)))
  1822			return;
  1823	
  1824		/*
  1825		 * tdx_flush_tlb() waits for this function to issue TDH.MEM.TRACK() by
  1826		 * the counter.  The counter is used instead of bool because multiple
  1827		 * TDH_MEM_TRACK() can be issued concurrently by multiple vcpus.
  1828		 */
  1829		atomic_inc(&kvm_tdx->doing_track);
  1830		atomic_inc(&kvm_tdx->tdh_mem_track);
  1831		smp_store_release(&kvm_tdx->has_range_blocked, false);
  1832	
  1833		/*
  1834		 * Don't wait for other vcpus with the empty IPI handler.  Instead,
  1835		 * Synchronize after tdh_mem_track() to reduce synchronization time.
  1836		 */
  1837		kvm_make_all_cpus_request(kvm, KVM_REQ_TLB_FLUSH & ~KVM_REQUEST_WAIT);
  1838	
  1839		do {
  1840			/*
  1841			 * kvm_flush_remote_tlbs() doesn't allow to return error and
  1842			 * retry.
  1843			 */
  1844			err = tdh_mem_track(kvm_tdx->tdr_pa);
  1845		} while (unlikely(err == TDX_PREVIOUS_TLB_EPOCH_BUSY ||
  1846				  (err & TDX_SEAMCALL_STATUS_MASK) == TDX_OPERAND_BUSY));
  1847	
  1848		/* Release remote vcpu waiting for TDH.MEM.TRACK in tdx_flush_tlb(). */
  1849		atomic_dec(&kvm_tdx->tdh_mem_track);
  1850	
  1851		/*
  1852		 * Avoid TDX_TLB_TRACKING_NOT_DONE on the following Secure-EPT operation
  1853		 * by waiting here for all other vcpus to go through TDExit once or not
  1854		 * running TD guest.  The alternative is loop on
  1855		 * TDX_TLB_TRACKING_NOT_DONE with Secure-EPT operation.  But if we hit
  1856		 * problem with tlb shoot down, debug will be very difficult.  So we
  1857		 * don't choose the loop option.
  1858		 */
  1859		kvm_for_each_vcpu(i, vcpu, kvm) {
  1860			int mode;
  1861	
  1862			/* If vcpu == current vcpu, vcpu->mode == OUTSIDE_GUEST_MODE */
  1863			mode = smp_load_acquire(&vcpu->mode);
  1864			while ((mode == IN_GUEST_MODE || mode == EXITING_GUEST_MODE) &&
  1865			       kvm_test_request(KVM_REQ_TLB_FLUSH, vcpu)) {
  1866				cpu_relax();
  1867				mode = smp_load_acquire(&vcpu->mode);
  1868			}
  1869		}
  1870		atomic_dec(&kvm_tdx->doing_track);
  1871	
  1872		if (KVM_BUG_ON(err, kvm))
  1873			pr_tdx_error(TDH_MEM_TRACK, err, NULL);
  1874	
  1875	}
  1876	
  1877	static int tdx_sept_unzap_private_spte(struct kvm *kvm, gfn_t gfn,
  1878					       enum pg_level level)
  1879	{
  1880		int tdx_level = pg_level_to_tdx_sept_level(level);
  1881		struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
  1882		gpa_t gpa = gfn_to_gpa(gfn) & KVM_HPAGE_MASK(level);
  1883		struct tdx_module_args out;
  1884		u64 err;
  1885	
  1886		do {
  1887			err = tdh_mem_range_unblock(kvm_tdx->tdr_pa, gpa, tdx_level, &out);
  1888	
  1889			/*
  1890			 * tdh_mem_range_block() is accompanied with tdx_track() via kvm
  1891			 * remote tlb flush.  Wait for the caller of
  1892			 * tdh_mem_range_block() to complete TDX track.
  1893			 */
  1894		} while (err == (TDX_TLB_TRACKING_NOT_DONE | TDX_OPERAND_ID_SEPT));
  1895		if (unlikely(err == TDX_ERROR_SEPT_BUSY))
  1896			return -EAGAIN;
> 1897		if (unlikely(err == (TDX_GPA_RANGE_NOT_BLOCKED | TDX_OPERAND_ID_RCX)))
  1898			return -EAGAIN;
  1899		if (unlikely(err == (TDX_EPT_ENTRY_STATE_INCORRECT | TDX_OPERAND_ID_RCX))) {
  1900			union tdx_sept_level_state level_state = {
  1901				.raw = out.rdx,
  1902			};
  1903	
  1904			if (level_state.level == tdx_level &&
  1905			    (level_state.state == TDX_SEPT_PRESENT ||
  1906			     level_state.state == TDX_SEPT_PENDING)) {
  1907				return -EAGAIN;
  1908			}
  1909		}
  1910		if (KVM_BUG_ON(err, kvm)) {
  1911			pr_tdx_error(TDH_MEM_RANGE_UNBLOCK, err, &out);
  1912			return -EIO;
  1913		}
  1914		return 0;
  1915	}
  1916	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
