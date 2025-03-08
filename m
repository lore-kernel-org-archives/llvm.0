Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5F41F16B;
	Sat,  8 Mar 2025 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741419828; cv=none; b=Dlh/bP7o//taEQ+IapWgCS3isYgeLTE/i23qNFR8Sgw9QwNH6RXs3VIpZfr1UUf9xEpCdsgvLskPnVNlc539V1o73qeFpOYRyk6idmmaLmc3on0Xmq6eZ3JMOtNHamnkStxxwtjB4asaKLTfRBG+Uaj+EYTnQ/NAQ8J0ZTPitdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741419828; c=relaxed/simple;
	bh=SbYO/7/qF9N5jBg0m3j/yLBbRwicQ5mWvJ8SxsY05ms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NjSlvoRjRXNDrZMBZ986tTTjjwjwmTD9cLcltLLyfUpyLmsOYRAy0Bk6TsLer9/my5MW/HCEB6Hh3IjNH2aO9C6y2YUAvpoMVPS3mB57RI+z3MPFkCy2YN/2r280w5JLgLOQTDt4mT18K3CBpq4Y2P9S4bNs4xo3HXM3oNdh0i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NFPsp28I; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NFPsp28I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741419826; x=1772955826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SbYO/7/qF9N5jBg0m3j/yLBbRwicQ5mWvJ8SxsY05ms=;
  b=NFPsp28I6mlpY3TYWGkK2vZqLtCLtLOzVGUFFPAJUsC5n/iF7QMR2Sor
   FNVVMeCoss1xX5+EBFIuCn9d70neuEHqiZ+siDUZEx8Zc0rqqA2vqLYdV
   ljIsKaVHWVjSR5vn+2FNYmrVw8eNeA5SxsXuD+dactPSzi5vxtZREsVcr
   rymCec5f5yKJig6TY70rPZcKbxaQVgLctKeKFknIUnK18PQBA5V8kSMyR
   WUwbN+8gMXXPalYSU+e/1gYS8xEmyflnDtKcLrOuwYWHZJFBgUFQdDP5h
   3Az2Qe8CnNvMmwnjRHUFAYaSuuSC6rc5NpCjJqdCU0jpKnHNFtUPxWRq6
   w==;
X-CSE-ConnectionGUID: Gsawb+hkTgyXAjn+jcjHXw==
X-CSE-MsgGUID: lAaqgn8pSECpB7J45VvNHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="30054549"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="30054549"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 23:43:45 -0800
X-CSE-ConnectionGUID: MrV9CT+IRHCCFVQhYnG3hA==
X-CSE-MsgGUID: AyTeKwp7ToqmGPy3DK664g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="119344357"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2025 23:43:43 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqoqT-0001gC-0U;
	Sat, 08 Mar 2025 07:43:41 +0000
Date: Sat, 8 Mar 2025 15:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Oliver Upton <oliver.upton@linux.dev>,
	Cornelia Huck <cohuck@redhat.com>,
	Sebastian Ott <sebott@redhat.com>
Subject: [linux-next:master 5819/9634]
 drivers/firmware/smccc/kvm_guest.c:89:32: error: invalid application of
 'sizeof' to an incomplete type 'struct target_impl_cpu'
Message-ID: <202503081522.IB63qRPZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a2f889128969dab41861b6e40111aa03dc57014
commit: 86edf6bdcf0571c07103b8751e9d792a4b808e97 [5819/9634] smccc/kvm_guest: Enable errata based on implementation CPUs
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250308/202503081522.IB63qRPZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e15545cad8297ec7555f26e5ae74a9f0511203e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250308/202503081522.IB63qRPZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081522.IB63qRPZ-lkp@intel.com/

Note: the linux-next/master HEAD 0a2f889128969dab41861b6e40111aa03dc57014 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/kvm_guest.c:89:32: error: invalid application of 'sizeof' to an incomplete type 'struct target_impl_cpu'
      89 |         target = memblock_alloc(sizeof(*target) * max_cpus,  __alignof__(*target));
         |                                       ^~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:64:9: note: forward declaration of 'struct target_impl_cpu'
      64 |         struct target_impl_cpu *target;
         |                ^
>> drivers/firmware/smccc/kvm_guest.c:89:66: error: invalid application of '__alignof' to an incomplete type 'struct target_impl_cpu'
      89 |         target = memblock_alloc(sizeof(*target) * max_cpus,  __alignof__(*target));
         |                                                                         ^~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:64:9: note: forward declaration of 'struct target_impl_cpu'
      64 |         struct target_impl_cpu *target;
         |                ^
>> drivers/firmware/smccc/kvm_guest.c:102:9: error: subscript of pointer to incomplete type 'struct target_impl_cpu'
     102 |                 target[i].midr = res.a1;
         |                 ~~~~~~^
   drivers/firmware/smccc/kvm_guest.c:64:9: note: forward declaration of 'struct target_impl_cpu'
      64 |         struct target_impl_cpu *target;
         |                ^
   drivers/firmware/smccc/kvm_guest.c:103:9: error: subscript of pointer to incomplete type 'struct target_impl_cpu'
     103 |                 target[i].revidr = res.a2;
         |                 ~~~~~~^
   drivers/firmware/smccc/kvm_guest.c:64:9: note: forward declaration of 'struct target_impl_cpu'
      64 |         struct target_impl_cpu *target;
         |                ^
   drivers/firmware/smccc/kvm_guest.c:104:9: error: subscript of pointer to incomplete type 'struct target_impl_cpu'
     104 |                 target[i].aidr = res.a3;
         |                 ~~~~~~^
   drivers/firmware/smccc/kvm_guest.c:64:9: note: forward declaration of 'struct target_impl_cpu'
      64 |         struct target_impl_cpu *target;
         |                ^
>> drivers/firmware/smccc/kvm_guest.c:107:7: error: call to undeclared function 'cpu_errata_set_target_impl'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     107 |         if (!cpu_errata_set_target_impl(max_cpus, target)) {
         |              ^
   drivers/firmware/smccc/kvm_guest.c:116:30: error: invalid application of 'sizeof' to an incomplete type 'struct target_impl_cpu'
     116 |         memblock_free(target, sizeof(*target) * max_cpus);
         |                                     ^~~~~~~~~
   drivers/firmware/smccc/kvm_guest.c:64:9: note: forward declaration of 'struct target_impl_cpu'
      64 |         struct target_impl_cpu *target;
         |                ^
   drivers/firmware/smccc/kvm_guest.c:58:14: warning: no previous prototype for function 'kvm_arm_target_impl_cpu_init' [-Wmissing-prototypes]
      58 | void  __init kvm_arm_target_impl_cpu_init(void)
         |              ^
   drivers/firmware/smccc/kvm_guest.c:58:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      58 | void  __init kvm_arm_target_impl_cpu_init(void)
         | ^
         | static 
   1 warning and 7 errors generated.


vim +89 drivers/firmware/smccc/kvm_guest.c

    57	
    58	void  __init kvm_arm_target_impl_cpu_init(void)
    59	{
    60		int i;
    61		u32 ver;
    62		u64 max_cpus;
    63		struct arm_smccc_res res;
    64		struct target_impl_cpu *target;
    65	
    66		if (!kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_VER) ||
    67		    !kvm_arm_hyp_service_available(ARM_SMCCC_KVM_FUNC_DISCOVER_IMPL_CPUS))
    68			return;
    69	
    70		arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_VER_FUNC_ID,
    71				     0, &res);
    72		if (res.a0 != SMCCC_RET_SUCCESS)
    73			return;
    74	
    75		/* Version info is in lower 32 bits and is in SMMCCC_VERSION format */
    76		ver = lower_32_bits(res.a1);
    77		if (PSCI_VERSION_MAJOR(ver) != 1) {
    78			pr_warn("Unsupported target CPU implementation version v%d.%d\n",
    79				PSCI_VERSION_MAJOR(ver), PSCI_VERSION_MINOR(ver));
    80			return;
    81		}
    82	
    83		if (!res.a2) {
    84			pr_warn("No target implementation CPUs specified\n");
    85			return;
    86		}
    87	
    88		max_cpus = res.a2;
  > 89		target = memblock_alloc(sizeof(*target) * max_cpus,  __alignof__(*target));
    90		if (!target) {
    91			pr_warn("Not enough memory for struct target_impl_cpu\n");
    92			return;
    93		}
    94	
    95		for (i = 0; i < max_cpus; i++) {
    96			arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_KVM_DISCOVER_IMPL_CPUS_FUNC_ID,
    97					     i, &res);
    98			if (res.a0 != SMCCC_RET_SUCCESS) {
    99				pr_warn("Discovering target implementation CPUs failed\n");
   100				goto mem_free;
   101			}
 > 102			target[i].midr = res.a1;
   103			target[i].revidr = res.a2;
   104			target[i].aidr = res.a3;
   105		};
   106	
 > 107		if (!cpu_errata_set_target_impl(max_cpus, target)) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
