Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4495F1C13;
	Tue, 15 Aug 2023 03:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692070726; x=1723606726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/utw1FEj4PyEdTuPqIOw6bNqlFYO1XKiHcWNFNa6GCA=;
  b=AVQepHMA6Myj832rdyEPUovBx4de7ghUyRZY0U9LW1Dw9MJ+oy5Kqz+0
   f5U1CrdTlvRUUDTYY7pcJeOk/k6kYo8pgI2m7hNJGRFooVS1SZjzlETbI
   z4NCTVWbalnaWWSKRdXhfT4uuakl8AeqyTGGw+lff3jqifHht1amK4Qye
   Dw6UP41ltHOcAald1cf9x8sbc79A6j3S45tlEP0EgtFc2yck8k0VpVKKm
   hbpKxfpHTBJZfxz2qp6YSMnUu/vf2RB6WzIamfSQ5X17kGv53xaRZJJut
   X4Ro8l4jz2zZJA3HjapWZBSTw/XPKmVGia9qFekh7GpXK5G8jCo6o7uxo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436090925"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="436090925"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 20:38:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="980252166"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="980252166"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2023 20:38:42 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qVktF-0000cp-2C;
	Tue, 15 Aug 2023 03:38:41 +0000
Date: Tue, 15 Aug 2023 11:37:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [dcui-tdx:decui/upstream-hyperv/hyperv-next/TDX/0812 10/25]
 arch/x86/include/asm/mshyperv.h:79:6: error: call to undeclared function
 'cc_mkdec'; ISO C99 and later do not support implicit function declarations
Message-ID: <202308151133.DHoBw5oO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/upstream-hyperv/hyperv-next/TDX/0812
head:   1aaa07c3a3cd52343288bc41e22305dc027e867c
commit: ad652f18b2f4fdc12a693efe901e0f81d6ecc2f3 [10/25] x86/hyperv: Support hypercalls for fully enlightened TDX guests
config: x86_64-buildonly-randconfig-r003-20230815 (https://download.01.org/0day-ci/archive/20230815/202308151133.DHoBw5oO-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308151133.DHoBw5oO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308151133.DHoBw5oO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/hyperv/nested.c:15:
>> arch/x86/include/asm/mshyperv.h:79:6: error: call to undeclared function 'cc_mkdec'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                           cc_mkdec(input_address),
                                           ^
   In file included from arch/x86/hyperv/nested.c:16:
   In file included from arch/x86/include/asm/tlbflush.h:15:
   In file included from arch/x86/include/asm/pgtable.h:23:
>> arch/x86/include/asm/coco.h:25:19: error: static declaration of 'cc_mkdec' follows non-static declaration
   static inline u64 cc_mkdec(u64 val)
                     ^
   arch/x86/include/asm/mshyperv.h:79:6: note: previous implicit declaration is here
                                           cc_mkdec(input_address),
                                           ^
   2 errors generated.


vim +/cc_mkdec +79 arch/x86/include/asm/mshyperv.h

    65	
    66	/*
    67	 * If the hypercall involves no input or output parameters, the hypervisor
    68	 * ignores the corresponding GPA pointer.
    69	 */
    70	static inline u64 hv_do_hypercall(u64 control, void *input, void *output)
    71	{
    72		u64 input_address = input ? virt_to_phys(input) : 0;
    73		u64 output_address = output ? virt_to_phys(output) : 0;
    74		u64 hv_status;
    75	
    76	#ifdef CONFIG_X86_64
    77		if (hv_isolation_type_tdx())
    78			return hv_tdx_hypercall(control,
  > 79						cc_mkdec(input_address),
    80						cc_mkdec(output_address));
    81		if (!hv_hypercall_pg)
    82			return U64_MAX;
    83	
    84		__asm__ __volatile__("mov %[output], %%r8\n"
    85				     ALTERNATIVE(CALL_NOSPEC, "vmmcall", X86_FEATURE_SEV_ES)
    86				     : "=a" (hv_status), ASM_CALL_CONSTRAINT,
    87				     "+c" (control), "+d" (input_address)
    88				     : [output] "r" (output_address),
    89				       THUNK_TARGET(hv_hypercall_pg)
    90				     : "cc", "memory", "r8", "r9", "r10", "r11");
    91	#else
    92		u32 input_address_hi = upper_32_bits(input_address);
    93		u32 input_address_lo = lower_32_bits(input_address);
    94		u32 output_address_hi = upper_32_bits(output_address);
    95		u32 output_address_lo = lower_32_bits(output_address);
    96	
    97		if (!hv_hypercall_pg)
    98			return U64_MAX;
    99	
   100		__asm__ __volatile__(CALL_NOSPEC
   101				     : "=A" (hv_status),
   102				       "+c" (input_address_lo), ASM_CALL_CONSTRAINT
   103				     : "A" (control),
   104				       "b" (input_address_hi),
   105				       "D"(output_address_hi), "S"(output_address_lo),
   106				       THUNK_TARGET(hv_hypercall_pg)
   107				     : "cc", "memory");
   108	#endif /* !x86_64 */
   109		return hv_status;
   110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
