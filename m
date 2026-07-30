Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B514A260565;
	Thu, 30 Jul 2026 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785408060; cv=none; b=fqsI3YP7oXSSaUCS13kJ1as8LM8uAiqRvSKkL7KBHpSC8crIESB/aVMD25bQqd9xanlYVGfFJkvj7vTmfjDhxHGW5AZ/er1KVQwcgsFZx9+mgdMR6j6AEoIIIUftUepbhbDZVwnju+YW1M8OS1hxclv2majMRoCiGW/MG9j2wQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785408060; c=relaxed/simple;
	bh=7kJ+7gvIxRFeSQzAQWV90J4cpMW+vLNffsnjPr17ORY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eiH2HdwA6+ZEhMZ2zvso2cbO4TiPFaB/BSrf2orhCmKHxGPDL0zc/+2NbQferFH6eO1BYBi/WiwH+LAk+F+SY23N0Q6cLvX0SMDEXlU674Hdf71m3ufkUoCT3N3DfxNt0u7cOan/+j+ZD6NJ4wp1G+z1AeL00AkNnL+54LXbzF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hssWSi22; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hssWSi22"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785408058; x=1816944058;
  h=date:from:to:cc:subject:message-id;
  bh=7kJ+7gvIxRFeSQzAQWV90J4cpMW+vLNffsnjPr17ORY=;
  b=hssWSi22tY8gJtEtBLjCXxQp0jDWQq4j7e8KEac5RgS4C/fznce1qvTA
   cFhU+8CLOmu1szDVPwJ3ASJ5g4MjL2S1vLzcrRXcFv5Qz4JvzRysdg9xx
   v9FvnHWjFUKeLJ0c78u+AMr0OTJRg+DGBixB98Drufy2ZlXem0wIk79TE
   rZy+EqZoxTocGUdz8t7D1V/Yt5mr9dApVNbsp3C13unB8FO5JExrHRj7Q
   n3N/4UqAqWCPDnz3avRbdhwdUmtLDAPwY41dbaXyh6O/unHy+96x7hgdG
   rc+EBTVluRjZXgardYItp47flXtBgZzHPzgtGgMwfTyva1vRRw9KFqJb0
   g==;
X-CSE-ConnectionGUID: 96Kfw4QZQeWSIpAg48Fx6w==
X-CSE-MsgGUID: XIKlpAlMR1acDq/mITvjbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="89836824"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="89836824"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 03:40:57 -0700
X-CSE-ConnectionGUID: 78QxvXNwRy2FTdEGbSXRWA==
X-CSE-MsgGUID: ecIwr/nHRq+0oWOMdh/mmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="256346292"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jul 2026 03:40:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpOC5-00000000gQs-0ldW;
	Thu, 30 Jul 2026 10:40:53 +0000
Date: Thu, 30 Jul 2026 18:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/host_kvmclock_mess 13/14]
 arch/x86/kvm/x86.c:1874:26: warning: variable 'master_ns' is uninitialized
 when used here
Message-ID: <202607301827.Yajxfgtd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/host_kvmclock_mess
head:   1874dce49fd558c97bf46e9d2a7e635c5158f74a
commit: 40490caf47030591b928111a4c6b452e1fd9b8b4 [13/14] KVM: x86: Upscalte TSC to "now", not master clock when updating PV clocks
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260730/202607301827.Yajxfgtd-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301827.Yajxfgtd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301827.Yajxfgtd-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:1874:26: warning: variable 'master_ns' is uninitialized when used here [-Wuninitialized]
    1874 |                 hv_clock.system_time = master_ns + v->kvm->arch.kvmclock_offset;
         |                                        ^~~~~~~~~
   arch/x86/kvm/x86.c:1782:64: note: initialize the variable 'master_ns' to silence this warning
    1782 |         u64 tgt_tsc_hz, tsc_timestamp, host_tsc, master_tsc, master_ns;
         |                                                                       ^
         |                                                                        = 0
   1 warning generated.


vim +/master_ns +1874 arch/x86/kvm/x86.c

  1779	
  1780	int kvm_guest_time_update(struct kvm_vcpu *v)
  1781	{
  1782		u64 tgt_tsc_hz, tsc_timestamp, host_tsc, master_tsc, master_ns;
  1783		struct pvclock_vcpu_time_info hv_clock = {};
  1784		struct kvm_vcpu_arch *vcpu = &v->arch;
  1785		struct kvm_arch *ka = &v->kvm->arch;
  1786		bool use_master_clock;
  1787		s64 kernel_ns;
  1788		unsigned seq;
  1789	
  1790		kernel_ns = 0;
  1791		host_tsc = 0;
  1792	
  1793		/*
  1794		 * If the host uses TSC clock, then passthrough TSC as stable
  1795		 * to the guest.
  1796		 */
  1797		do {
  1798			seq = read_seqcount_begin(&ka->pvclock_sc);
  1799			use_master_clock = ka->use_master_clock;
  1800			if (!use_master_clock)
  1801				continue;
  1802	
  1803			if (!kvm_get_time_and_clockread(&kernel_ns, &host_tsc)) {
  1804				use_master_clock = false;
  1805				continue;
  1806			}
  1807	
  1808			master_tsc = ka->master_cycle_now;
  1809			kernel_ns = ka->master_kernel_ns;
  1810		} while (read_seqcount_retry(&ka->pvclock_sc, seq));
  1811	
  1812		/*
  1813		 * Ensure reading the TSC+frequency pair is done on the same CPU.  When
  1814		 * NOT using the master clock, the TSC frequency may vary between CPUs.
  1815		 */
  1816		preempt_disable();
  1817		tgt_tsc_hz = (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
  1818		if (unlikely(tgt_tsc_hz == 0)) {
  1819			preempt_enable();
  1820			kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
  1821			return 1;
  1822		}
  1823		if (!use_master_clock) {
  1824			host_tsc = rdtsc();
  1825			kernel_ns = get_kvmclock_base_ns();
  1826		}
  1827	
  1828		tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
  1829	
  1830		/*
  1831		 * We may have to catch up the TSC to match elapsed wall clock
  1832		 * time for two reasons, even if kvmclock is used.
  1833		 *   1) CPU could have been running below the maximum TSC rate
  1834		 *   2) Broken TSC compensation resets the base at each VCPU
  1835		 *      entry to avoid unknown leaps of TSC even when running
  1836		 *      again on the same CPU.  This may cause apparent elapsed
  1837		 *      time to disappear, and the guest to stand still or run
  1838		 *	very slowly.
  1839		 */
  1840		if (vcpu->tsc_catchup) {
  1841			u64 tsc = compute_guest_tsc(v, kernel_ns);
  1842			if (tsc > tsc_timestamp) {
  1843				adjust_tsc_offset_guest(v, tsc - tsc_timestamp);
  1844				tsc_timestamp = tsc;
  1845			}
  1846		}
  1847	
  1848		preempt_enable();
  1849	
  1850		/* With all the info we got, fill in the values */
  1851	
  1852		if (kvm_caps.has_tsc_control) {
  1853			tgt_tsc_hz = kvm_scale_tsc(tgt_tsc_hz,
  1854						    v->arch.l1_tsc_scaling_ratio);
  1855			tgt_tsc_hz = tgt_tsc_hz ? : 1;
  1856		}
  1857	
  1858		if (unlikely(vcpu->hw_tsc_hz != tgt_tsc_hz)) {
  1859			kvm_get_time_scale(NSEC_PER_SEC, tgt_tsc_hz,
  1860					   &vcpu->pvclock_tsc_shift,
  1861					   &vcpu->pvclock_tsc_mul);
  1862			vcpu->hw_tsc_hz = tgt_tsc_hz;
  1863		}
  1864	
  1865		hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
  1866		hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
  1867		/*
  1868		 * If the master clock is NOT in use, the reference time placed in the
  1869		 * hv_clock is "now".  If master clock is in use, the reference time is
  1870		 * the master clock's snapshot from some time in the past, not "now".
  1871		 */
  1872		if (use_master_clock) {
  1873			hv_clock.tsc_timestamp = kvm_read_l1_tsc(v, master_tsc);
> 1874			hv_clock.system_time = master_ns + v->kvm->arch.kvmclock_offset;
  1875		} else {
  1876			hv_clock.tsc_timestamp = tsc_timestamp;
  1877			hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
  1878		}
  1879		vcpu->last_guest_tsc = tsc_timestamp;
  1880	
  1881		/* If the host uses TSC clocksource, then it is stable */
  1882		hv_clock.flags = 0;
  1883		if (use_master_clock)
  1884			hv_clock.flags |= PVCLOCK_TSC_STABLE_BIT;
  1885	
  1886		if (vcpu->pv_time.active) {
  1887			/*
  1888			 * GUEST_STOPPED is only supported by kvmclock, and KVM's
  1889			 * historic behavior is to only process the request if kvmclock
  1890			 * is active/enabled.
  1891			 */
  1892			if (vcpu->pvclock_set_guest_stopped_request) {
  1893				hv_clock.flags |= PVCLOCK_GUEST_STOPPED;
  1894				vcpu->pvclock_set_guest_stopped_request = false;
  1895			}
  1896			kvm_setup_guest_pvclock(&hv_clock, v, &vcpu->pv_time, 0);
  1897	
  1898			hv_clock.flags &= ~PVCLOCK_GUEST_STOPPED;
  1899		}
  1900	
  1901		kvm_hv_setup_tsc_page(v->kvm, &hv_clock);
  1902	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
