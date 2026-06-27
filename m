Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE9C4315F;
	Sat, 27 Jun 2026 14:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782571533; cv=none; b=gdOQpfJ9H42rLD2wjWZnb7jXIKHHIeoq9AEI+Oi/0Mic3gA5HblVeZriF8Kl+VJCWo37PzDIe4am690Q/GsUC0I4rgwp5TrkuIwq7UkfY9Qmm/BgFtFCsbOV4U89D+S4CPp4S5Lwk4Zx6Ax+dLloAIiJvZcEztmLHyc5j28KAPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782571533; c=relaxed/simple;
	bh=HPgBgNY8gIAfwu3ShnUKlpKR8gkkPO8JW2dt7M9/4ps=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LTaW9S5ueEOq6tlcu4/KJHAW3vdPL0IJZkHaqjRVVv36WTqdHqoS2I2p24XNSQsxx99icqdADt/RKyAfD5fDSo594CnW6nvdK3s9OACxuU9hHH0Zw4jtY5SxxeYEEaQ+M95j7/3kWyGa7NHXT7XSMelLcEhAYUMdYt6QydbcmS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxUNX7wg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxUNX7wg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782571529; x=1814107529;
  h=date:from:to:cc:subject:message-id;
  bh=HPgBgNY8gIAfwu3ShnUKlpKR8gkkPO8JW2dt7M9/4ps=;
  b=dxUNX7wgi2g+D3J2nqfaBBlm6d3KeKDRQPANNz2ntlXkIqeutqgiMpFK
   RmRHKTrdYSF2dvkGArqO77ggUWkJrPd973bLPPzmvb/6xVKOuSOiHa1ev
   Q8WYK96FB1UVFDhT8UhiLt65AWZpQISGZCs6Krk65kwYtwe70fJr4ajYX
   bswGFz+LkiRHbpSu7Hz5wyFbAwAkETXw9ZKUqTiJZlykPOLnZ9DcqWUhX
   EVaxZGo82JOmfY9A2DNCIrXXxVhfmKWmpV4nu96RemrOfRyDv+9EkDZjL
   ZqeSdJsBOAsJmGfY6pCpBRhTSgzro0dawwFBrQ8qIEsSkaXIJsJyI2H9y
   A==;
X-CSE-ConnectionGUID: QoJ1pPx/RdqIyWC5X8Yxlg==
X-CSE-MsgGUID: 1FF3cN1RQgezYXxR7Kk73A==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="82327089"
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="82327089"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2026 07:45:27 -0700
X-CSE-ConnectionGUID: Zhch4zdGSe6LgSKO4iLNzg==
X-CSE-MsgGUID: oEdf8GG3S6KLGPSM+ssu7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,228,1774335600"; 
   d="scan'208";a="251698596"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 27 Jun 2026 07:45:26 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdUHb-000000005tZ-2tU8;
	Sat, 27 Jun 2026 14:45:23 +0000
Date: Sat, 27 Jun 2026 22:45:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kvmclock6 12/36] arch/x86/kvm/x86.c:3249:1: warning:
 unused label 'fallback'
Message-ID: <202606272251.KzVi7xnp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock6
head:   ce9ca5bc94e17f480f6c7ab4f3dc589bb8b586d5
commit: b66060a9ccda11d1542f238cf8a40e047fa1696b [12/36] KVM: x86: Restructure get_kvmclock()
config: i386-randconfig-002-20260627 (https://download.01.org/0day-ci/archive/20260627/202606272251.KzVi7xnp-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260627/202606272251.KzVi7xnp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606272251.KzVi7xnp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c:3206:32: warning: unused variable 'hv_clock' [-Wunused-variable]
    3206 |         struct pvclock_vcpu_time_info hv_clock;
         |                                       ^~~~~~~~
>> arch/x86/kvm/x86.c:3249:1: warning: unused label 'fallback' [-Wunused-label]
    3249 | fallback:
         | ^~~~~~~~~
   2 warnings generated.


vim +/fallback +3249 arch/x86/kvm/x86.c

  3202	
  3203	static void get_kvmclock(struct kvm *kvm, struct kvm_clock_data *data)
  3204	{
  3205		struct kvm_arch *ka = &kvm->arch;
  3206		struct pvclock_vcpu_time_info hv_clock;
  3207		unsigned int seq;
  3208	
  3209		do {
  3210			seq = read_seqcount_begin(&ka->pvclock_sc);
  3211	
  3212			data->flags = 0;
  3213	#ifdef CONFIG_X86_64
  3214			if (ka->use_master_clock) {
  3215				struct timespec64 ts;
  3216	
  3217				/*
  3218				 * The RDTSC and get_cpu_tsc_khz() must happen on
  3219				 * the same CPU.
  3220				 */
  3221				get_cpu();
  3222	
  3223				if (kvm_get_walltime_and_clockread(&ts, &data->host_tsc)) {
  3224					data->realtime = ts.tv_nsec + NSEC_PER_SEC * ts.tv_sec;
  3225					data->flags |= KVM_CLOCK_REALTIME | KVM_CLOCK_HOST_TSC;
  3226				} else {
  3227					/*
  3228					 * Clock read failed (e.g. clocksource is
  3229					 * transitioning away from TSC). Fall back to
  3230					 * the non-master-clock path rather than
  3231					 * spinning.
  3232					 */
  3233					put_cpu();
  3234					goto fallback;
  3235				}
  3236	
  3237				data->flags |= KVM_CLOCK_TSC_STABLE;
  3238				hv_clock.tsc_timestamp = ka->master_cycle_now;
  3239				hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
  3240				kvm_get_time_scale(NSEC_PER_SEC, get_cpu_tsc_khz() * 1000LL,
  3241						   &hv_clock.tsc_shift,
  3242						   &hv_clock.tsc_to_system_mul);
  3243				data->clock = __pvclock_read_cycles(&hv_clock, data->host_tsc);
  3244	
  3245				put_cpu();
  3246			} else
  3247	#endif
  3248			{
> 3249	fallback:
  3250				data->clock = get_kvmclock_base_ns() + ka->kvmclock_offset;
  3251			}
  3252		} while (read_seqcount_retry(&ka->pvclock_sc, seq));
  3253	}
  3254	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
