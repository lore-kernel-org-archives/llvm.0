Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9154217A2F6;
	Sat,  7 Mar 2026 02:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772849856; cv=none; b=fVOLrbri8SoB2sbuCLM0BD6zc816vTF3D9CY4mOVdI7AH9aMVeKvEvTYgTMXX8TRuxwpGErK07OSAzp5yDGraQK25tTUGN2+/Riiq+qGJLkx8jTnTULgoiPHoD8K+1FJu9q+N7VBtz0dhZXWShSiGYExbiDhY4zFlRDovgftMcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772849856; c=relaxed/simple;
	bh=pTe3tYQm0ri7WtFNhzb3ZLQvrXPsEazEUB+dK6dTd5c=;
	h=Date:From:Cc:Subject:Message-ID; b=VKeRiscqUmGkZKOIWD5Q/aJgpdIXG+f7/VBgG+0jkZAZa1iwK9866PXp/5IZFrDhq8JG0uwd9sh57PMsRlWQo7LqmUjs9nXLXRZAGU+JULsu5uK+ZOTznoU3EhBIQttsqg038uwav4N2t3bsIngjbfyrZlv6sOI3JIlMLDaRj60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9t9efg6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9t9efg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772849854; x=1804385854;
  h=date:from:cc:subject:message-id;
  bh=pTe3tYQm0ri7WtFNhzb3ZLQvrXPsEazEUB+dK6dTd5c=;
  b=L9t9efg6xIAaZFc3KDJmqOIZUBeFt/8roVELBgNcbbJuO5X2Z8ztNXKq
   4Znmuosx72N81CxjpFwYgeduGbydGeVVyu5m5ClIcoYrBnfUiHRTcpP7B
   NVbluYI/hnGg3/90V6Dk4eUIWethEoY/MJeIeFG5q/1f7Dzo9uZ+Py4uB
   sCaJXsLLlO1JRzRkS3GZdnEr7HrFP3gM5BBFAJk0z1H8gJ8ebZsq2sQwO
   iqvSQHUFZgwu8TL9KR00K+2KOjLxfFZIaMP+xuDBwy2XZkJyXd+TA0Tjf
   IlxshhYOdfPHSDSo9DHE7VpvNk/bPWxekqvSIo8xNNahuf3/6sjE+LtJC
   Q==;
X-CSE-ConnectionGUID: lvxRuaLDSp+R7H6DNstwCg==
X-CSE-MsgGUID: PDAx4o9VRpy0p6oWHnhU7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="61534620"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="61534620"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 18:17:30 -0800
X-CSE-ConnectionGUID: LalJG2izRN23vYIOMk2inQ==
X-CSE-MsgGUID: PuK2KWJVRVCTOl026D6PTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223663200"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 18:17:29 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyhEL-000000001af-3Np2;
	Sat, 07 Mar 2026 02:17:25 +0000
Date: Sat, 07 Mar 2026 10:16:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Lili Li <lili.li@intel.com>, "Xin Li (Intel)" <xin3.li@intel.com>
Subject: [acrn:6.17/linux 168/3134] arch/x86/kvm/x86.c:1923:3:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202603071049.rVBg8xav-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Xin,

FYI, the error/warning still remains.

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   d2ae39d099178698dc32d2165a32f4d6d13d107b
commit: 33368ca1eb233f5d0bbdbaf9b9ab171e79fbc3d8 [168/3134] KVM: VMX: Add support for FRED context save/restore
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260307/202603071049.rVBg8xav-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071049.rVBg8xav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071049.rVBg8xav-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:1923:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1923 |                 u64 reserved_bits = 0;
         |                 ^
   1 warning generated.


vim +1923 arch/x86/kvm/x86.c

  1836	
  1837	/*
  1838	 * Write @data into the MSR specified by @index.  Select MSR specific fault
  1839	 * checks are bypassed if @host_initiated is %true.
  1840	 * Returns 0 on success, non-0 otherwise.
  1841	 * Assumes vcpu_load() was already called.
  1842	 */
  1843	static int __kvm_set_msr(struct kvm_vcpu *vcpu, u32 index, u64 data,
  1844				 bool host_initiated)
  1845	{
  1846		struct msr_data msr;
  1847	
  1848		switch (index) {
  1849		case MSR_FS_BASE:
  1850		case MSR_GS_BASE:
  1851		case MSR_KERNEL_GS_BASE:
  1852		case MSR_CSTAR:
  1853		case MSR_LSTAR:
  1854			if (is_noncanonical_msr_address(data, vcpu))
  1855				return 1;
  1856			break;
  1857		case MSR_IA32_SYSENTER_EIP:
  1858		case MSR_IA32_SYSENTER_ESP:
  1859			/*
  1860			 * IA32_SYSENTER_ESP and IA32_SYSENTER_EIP cause #GP if
  1861			 * non-canonical address is written on Intel but not on
  1862			 * AMD (which ignores the top 32-bits, because it does
  1863			 * not implement 64-bit SYSENTER).
  1864			 *
  1865			 * 64-bit code should hence be able to write a non-canonical
  1866			 * value on AMD.  Making the address canonical ensures that
  1867			 * vmentry does not fail on Intel after writing a non-canonical
  1868			 * value, and that something deterministic happens if the guest
  1869			 * invokes 64-bit SYSENTER.
  1870			 */
  1871			data = __canonical_address(data, max_host_virt_addr_bits());
  1872			break;
  1873		case MSR_TSC_AUX:
  1874			if (!kvm_is_supported_user_return_msr(MSR_TSC_AUX))
  1875				return 1;
  1876	
  1877			if (!host_initiated &&
  1878			    !guest_cpu_cap_has(vcpu, X86_FEATURE_RDTSCP) &&
  1879			    !guest_cpu_cap_has(vcpu, X86_FEATURE_RDPID))
  1880				return 1;
  1881	
  1882			/*
  1883			 * Per Intel's SDM, bits 63:32 are reserved, but AMD's APM has
  1884			 * incomplete and conflicting architectural behavior.  Current
  1885			 * AMD CPUs completely ignore bits 63:32, i.e. they aren't
  1886			 * reserved and always read as zeros.  Enforce Intel's reserved
  1887			 * bits check if the guest CPU is Intel compatible, otherwise
  1888			 * clear the bits.  This ensures cross-vendor migration will
  1889			 * provide consistent behavior for the guest.
  1890			 */
  1891			if (guest_cpuid_is_intel_compatible(vcpu) && (data >> 32) != 0)
  1892				return 1;
  1893	
  1894			data = (u32)data;
  1895			break;
  1896		case MSR_IA32_U_CET:
  1897		case MSR_IA32_S_CET:
  1898			if (!guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) &&
  1899			    !guest_cpu_cap_has(vcpu, X86_FEATURE_IBT))
  1900				return KVM_MSR_RET_UNSUPPORTED;
  1901			if (!is_cet_msr_valid(vcpu, data))
  1902				return 1;
  1903			break;
  1904		case MSR_KVM_INTERNAL_GUEST_SSP:
  1905			if (!host_initiated)
  1906				return 1;
  1907			fallthrough;
  1908		case MSR_IA32_PL1_SSP ... MSR_IA32_INT_SSP_TAB:
  1909			if (!guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK))
  1910				return KVM_MSR_RET_UNSUPPORTED;
  1911			if (is_noncanonical_msr_address(data, vcpu))
  1912				return 1;
  1913			/* All SSP MSRs except MSR_IA32_INT_SSP_TAB must be 4-byte aligned */
  1914			if (index != MSR_IA32_INT_SSP_TAB && !IS_ALIGNED(data, 4))
  1915				return 1;
  1916			break;
  1917		case MSR_IA32_FRED_STKLVLS:
  1918			if (!guest_cpu_cap_has(vcpu, X86_FEATURE_FRED))
  1919				return KVM_MSR_RET_UNSUPPORTED;
  1920			break;
  1921		case MSR_IA32_FRED_RSP0 ... MSR_IA32_FRED_RSP3:
  1922		case MSR_IA32_FRED_SSP1 ... MSR_IA32_FRED_CONFIG:
> 1923			u64 reserved_bits = 0;
  1924	
  1925			if (!guest_cpu_cap_has(vcpu, X86_FEATURE_FRED))
  1926				return KVM_MSR_RET_UNSUPPORTED;
  1927	
  1928			if (is_noncanonical_msr_address(data, vcpu))
  1929				return 1;
  1930	
  1931			switch (index) {
  1932			case MSR_IA32_FRED_CONFIG:
  1933				reserved_bits = BIT_ULL(11) | GENMASK_ULL(5, 4) | BIT_ULL(2);
  1934				break;
  1935			case MSR_IA32_FRED_RSP0 ... MSR_IA32_FRED_RSP3:
  1936				reserved_bits = GENMASK_ULL(5, 0);
  1937				break;
  1938			case MSR_IA32_FRED_SSP1 ... MSR_IA32_FRED_SSP3:
  1939				reserved_bits = GENMASK_ULL(2, 0);
  1940				break;
  1941			default:
  1942				WARN_ON_ONCE(1);
  1943				return 1;
  1944			}
  1945			if (data & reserved_bits)
  1946				return 1;
  1947			break;
  1948		case MSR_IA32_PL0_SSP: /* I.e., MSR_IA32_FRED_SSP0 */
  1949			if (!guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK) &&
  1950			    !guest_cpu_cap_has(vcpu, X86_FEATURE_FRED))
  1951				return KVM_MSR_RET_UNSUPPORTED;
  1952	
  1953			if (is_noncanonical_msr_address(data, vcpu))
  1954				return 1;
  1955	
  1956			if (!IS_ALIGNED(data, 4))
  1957				return 1;
  1958			break;
  1959		}
  1960	
  1961		msr.data = data;
  1962		msr.index = index;
  1963		msr.host_initiated = host_initiated;
  1964	
  1965		return kvm_x86_call(set_msr)(vcpu, &msr);
  1966	}
  1967	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
