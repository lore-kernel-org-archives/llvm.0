Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95FCB2DF126;
	Thu, 30 Jul 2026 05:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785388277; cv=none; b=U4yRFx/J7CSaZ7dYViEGTKH60wx9e+EvpyYDTZfWU0R5bkYS5ly8WAKZDP/cVVvPL7CMDZ4kfKWNuN4G5z9a/WuEpyLR4v4tEzDzy6UAhtPodL65D0WsT/bbTtyL1+NWbH0DYnxjCRL3/k9pIwegOA+HjJnOjWc4hkYBkDg/EeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785388277; c=relaxed/simple;
	bh=/XlINIl685U8j94WaYVBnohJWHYJcpBDF6JLzYnyXnk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KQzYKLxvyiKSDOM8vMtIPNrtYvsyjufY5+9MZP3TZKssHDlA+ZoWGM/+bP1eGk2FVU/a5Qz4UU2mLvXRy8Dn4bf0Z7rHuU/7RHtV9WmIXlOY1Xc0N2JCFMeiFUwCsWHNVJIyGEj83Vjm1QpDsOwfSob5N34XuYO5aMRTItPDyPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kz6mYFzF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kz6mYFzF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785388276; x=1816924276;
  h=date:from:to:cc:subject:message-id;
  bh=/XlINIl685U8j94WaYVBnohJWHYJcpBDF6JLzYnyXnk=;
  b=Kz6mYFzFxA99cgXHLLUn9h54csU6rDazVX6W/9gBlG9KB2OEtnZoLmNg
   QT9jVVA7gfdZVb5JqO4olOAnYoREx5yVozF1/vPpzjvfoPhnIq96iDX+M
   PMevI8DIdSjn9vLd5hDJaIAGQ5WabIlwJ0Uy7HsCpHFSbn6bLIJ7RpYjC
   V+tdadYh1EmK03aWHcIqD2joX2tYzWCqu8hYlHvvO/yJUYXDnMTNr35fm
   LfmUjtOGkZ09zcvuI4PA3VmuV57Zuo2J0giMvWX9kD3zT9KJvuRWp8R8b
   gGqyDdK1AB9tdEma66cG3kSTXbpFDD470NMGc6rDX2vVSP2zihw1LKFPp
   Q==;
X-CSE-ConnectionGUID: wif2BvVOS42pWzFMKpTqew==
X-CSE-MsgGUID: IDF3wXI+R32Rc3CUv2zA9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="73535390"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="73535390"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 22:11:15 -0700
X-CSE-ConnectionGUID: vTzlOnb/R4GqslwPyW2RHQ==
X-CSE-MsgGUID: msiZ5EjgSr2uSbI+Icv/eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="284768414"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2026 22:11:13 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpJ31-000000002Jm-1gZm;
	Thu, 30 Jul 2026 05:11:11 +0000
Date: Thu, 30 Jul 2026 07:10:35 +0200
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/host_kvmclock_mess 14/15]
 arch/x86/kvm/x86.c:1875:26: warning: variable 'master_ns' is uninitialized
 when used here
Message-ID: <202607300751.31hStxN9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/host_kvmclock_mess
head:   1874dce49fd558c97bf46e9d2a7e635c5158f74a
commit: a7428fb09dd20b70ce3619c430eb42e6f298a503 [14/15] KVM: x86: Upscalte TSC to "now", not master clock when updating PV clocks
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260730/202607300751.31hStxN9-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300751.31hStxN9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300751.31hStxN9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:1875:26: warning: variable 'master_ns' is uninitialized when used here [-Wuninitialized]
    1875 |                 hv_clock.system_time = master_ns + v->kvm->arch.kvmclock_offset;
         |                                        ^~~~~~~~~
   arch/x86/kvm/x86.c:1782:64: note: initialize the variable 'master_ns' to silence this warning
    1782 |         u64 tgt_tsc_hz, tsc_timestamp, host_tsc, master_tsc, master_ns;
         |                                                                       ^
         |                                                                        = 0
   1 warning generated.


vim +/master_ns +1875 arch/x86/kvm/x86.c

  1779	
  1780	int kvm_guest_time_update(struct kvm_vcpu *v)
  1781	{
  1782		u64 tgt_tsc_hz, tsc_timestamp, host_tsc, master_tsc, master_ns;
  1783		struct pvclock_vcpu_time_info hv_clock = {};
  1784		struct kvm_vcpu_arch *vcpu = &v->arch;
  1785		s64 kernel_ns;
  1786	
  1787		/*
  1788		 * If the host uses TSC clock, then passthrough TSC as stable
  1789		 * to the guest.
  1790		 */
  1791	#ifdef CONFIG_X86_64
  1792		struct kvm_arch *ka = &v->kvm->arch;
  1793		bool use_master_clock;
  1794		unsigned seq;
  1795	
  1796		do {
  1797			seq = read_seqcount_begin(&ka->pvclock_sc);
  1798			use_master_clock = ka->use_master_clock;
  1799			if (!use_master_clock)
  1800				continue;
  1801	
  1802			if (!kvm_get_time_and_clockread(&kernel_ns, &host_tsc)) {
  1803				use_master_clock = false;
  1804				continue;
  1805			}
  1806	
  1807			master_tsc = ka->master_cycle_now;
  1808			kernel_ns = ka->master_kernel_ns;
  1809		} while (read_seqcount_retry(&ka->pvclock_sc, seq));
  1810	#else
  1811		const bool use_master_clock = false;
  1812	#endif
  1813		/*
  1814		 * Ensure reading the TSC+frequency pair is done on the same CPU.  When
  1815		 * NOT using the master clock, the TSC frequency may vary between CPUs.
  1816		 */
  1817		preempt_disable();
  1818		tgt_tsc_hz = (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
  1819		if (unlikely(tgt_tsc_hz == 0)) {
  1820			preempt_enable();
  1821			kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
  1822			return 1;
  1823		}
  1824		if (!use_master_clock) {
  1825			host_tsc = rdtsc();
  1826			kernel_ns = get_kvmclock_base_ns();
  1827		}
  1828	
  1829		tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
  1830	
  1831		/*
  1832		 * We may have to catch up the TSC to match elapsed wall clock
  1833		 * time for two reasons, even if kvmclock is used.
  1834		 *   1) CPU could have been running below the maximum TSC rate
  1835		 *   2) Broken TSC compensation resets the base at each VCPU
  1836		 *      entry to avoid unknown leaps of TSC even when running
  1837		 *      again on the same CPU.  This may cause apparent elapsed
  1838		 *      time to disappear, and the guest to stand still or run
  1839		 *	very slowly.
  1840		 */
  1841		if (vcpu->tsc_catchup) {
  1842			u64 tsc = compute_guest_tsc(v, kernel_ns);
  1843			if (tsc > tsc_timestamp) {
  1844				adjust_tsc_offset_guest(v, tsc - tsc_timestamp);
  1845				tsc_timestamp = tsc;
  1846			}
  1847		}
  1848	
  1849		preempt_enable();
  1850	
  1851		/* With all the info we got, fill in the values */
  1852	
  1853		if (kvm_caps.has_tsc_control) {
  1854			tgt_tsc_hz = kvm_scale_tsc(tgt_tsc_hz,
  1855						    v->arch.l1_tsc_scaling_ratio);
  1856			tgt_tsc_hz = tgt_tsc_hz ? : 1;
  1857		}
  1858	
  1859		if (unlikely(vcpu->hw_tsc_hz != tgt_tsc_hz)) {
  1860			kvm_get_time_scale(NSEC_PER_SEC, tgt_tsc_hz,
  1861					   &vcpu->pvclock_tsc_shift,
  1862					   &vcpu->pvclock_tsc_mul);
  1863			vcpu->hw_tsc_hz = tgt_tsc_hz;
  1864		}
  1865	
  1866		hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
  1867		hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
  1868		/*
  1869		 * If the master clock is NOT in use, the reference time placed in the
  1870		 * hv_clock is "now".  If master clock is in use, the reference time is
  1871		 * the master clock's snapshot from some time in the past, not "now".
  1872		 */
  1873		if (use_master_clock) {
  1874			hv_clock.tsc_timestamp = kvm_read_l1_tsc(v, master_tsc);
> 1875			hv_clock.system_time = master_ns + v->kvm->arch.kvmclock_offset;
  1876		} else {
  1877			hv_clock.tsc_timestamp = tsc_timestamp;
  1878			hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
  1879		}
  1880		vcpu->last_guest_tsc = tsc_timestamp;
  1881	
  1882		/* If the host uses TSC clocksource, then it is stable */
  1883		hv_clock.flags = 0;
  1884		if (use_master_clock)
  1885			hv_clock.flags |= PVCLOCK_TSC_STABLE_BIT;
  1886	
  1887		if (vcpu->pv_time.active) {
  1888			/*
  1889			 * GUEST_STOPPED is only supported by kvmclock, and KVM's
  1890			 * historic behavior is to only process the request if kvmclock
  1891			 * is active/enabled.
  1892			 */
  1893			if (vcpu->pvclock_set_guest_stopped_request) {
  1894				hv_clock.flags |= PVCLOCK_GUEST_STOPPED;
  1895				vcpu->pvclock_set_guest_stopped_request = false;
  1896			}
  1897			kvm_setup_guest_pvclock(&hv_clock, v, &vcpu->pv_time, 0);
  1898	
  1899			hv_clock.flags &= ~PVCLOCK_GUEST_STOPPED;
  1900		}
  1901	
  1902		kvm_hv_setup_tsc_page(v->kvm, &hv_clock);
  1903	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
