Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC281773C;
	Wed, 16 Aug 2023 19:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692214972; x=1723750972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5z4P4U9+rxDnalp8TmUP8a/3YytDJ6FRRl+IufBJ8sw=;
  b=f71Mn36HlUqXlgQE1kBNt6J9sdpi7SsTXrJVJ4Xx+4dwXBCd9zkBxK3a
   mFfbEUWLnc/ZunA21+HfQXwrYWz6Kd3FVFvJu8samXnKYo12MBIYg0umz
   jxhhmvc3OUwYYuWJJG4T6FqTEEvHtsa74FOjk7ogWkvqLVUtjKM5rxTKr
   klcQ5jP266cjhyCsT03r9gzuZcLS8A7TLEM1h6Jichaj1sD3ip4BsPQmM
   yo9wlSzaoHQuazU8rM0d5BE7aF6an4NVYe/wBSdz6wdQB3k6Q7HnzgXF5
   8jSS5AXhFYSVKZkJ7+eVMud4Nq/6S6RS62HtLiqQQy/+7rPC8V9255fdG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="370092743"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="370092743"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 12:42:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="857937448"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="857937448"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Aug 2023 12:42:50 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWMPp-0000Vv-2H;
	Wed, 16 Aug 2023 19:42:49 +0000
Date: Thu, 17 Aug 2023 03:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: Tianyu Lan <tiala@microsoft.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [lantianyu:test 18/21] arch/x86/include/asm/mshyperv.h:62:6: error:
 call to undeclared function 'hv_isolation_type_en_snp'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202308170331.IdBMI6ij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/lantianyu/linux test
head:   f5c4c5f104612a69401a5343609c6f939716896a
commit: 21ff4de070a797f04aafc8cf608d3b4dbc67aa81 [18/21] x86/hyperv: Use vmmcall to implement Hyper-V hypercall in sev-snp enlightened guest
config: x86_64-buildonly-randconfig-r001-20230817 (https://download.01.org/0day-ci/archive/20230817/202308170331.IdBMI6ij-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230817/202308170331.IdBMI6ij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308170331.IdBMI6ij-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hv/channel_mgmt.c:23:
>> arch/x86/include/asm/mshyperv.h:62:6: error: call to undeclared function 'hv_isolation_type_en_snp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (hv_isolation_type_en_snp()) {
               ^
   arch/x86/include/asm/mshyperv.h:114:6: error: call to undeclared function 'hv_isolation_type_en_snp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (hv_isolation_type_en_snp()) {
               ^
   arch/x86/include/asm/mshyperv.h:165:6: error: call to undeclared function 'hv_isolation_type_en_snp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (hv_isolation_type_en_snp()) {
               ^
>> arch/x86/include/asm/mshyperv.h:265:13: error: conflicting types for 'hv_isolation_type_en_snp'
   extern bool hv_isolation_type_en_snp(void);
               ^
   arch/x86/include/asm/mshyperv.h:62:6: note: previous implicit declaration is here
           if (hv_isolation_type_en_snp()) {
               ^
   4 errors generated.
--
   In file included from drivers/hv/vmbus_drv.c:40:
>> arch/x86/include/asm/mshyperv.h:62:6: error: call to undeclared function 'hv_isolation_type_en_snp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (hv_isolation_type_en_snp()) {
               ^
   arch/x86/include/asm/mshyperv.h:114:6: error: call to undeclared function 'hv_isolation_type_en_snp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (hv_isolation_type_en_snp()) {
               ^
   arch/x86/include/asm/mshyperv.h:165:6: error: call to undeclared function 'hv_isolation_type_en_snp'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (hv_isolation_type_en_snp()) {
               ^
>> arch/x86/include/asm/mshyperv.h:265:13: error: conflicting types for 'hv_isolation_type_en_snp'
   extern bool hv_isolation_type_en_snp(void);
               ^
   arch/x86/include/asm/mshyperv.h:62:6: note: previous implicit declaration is here
           if (hv_isolation_type_en_snp()) {
               ^
   drivers/hv/vmbus_drv.c:1910:42: warning: shift count >= width of type [-Wshift-count-overflow]
           dma_set_mask(&child_device_obj->device, DMA_BIT_MASK(64));
                                                   ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:77:54: note: expanded from macro 'DMA_BIT_MASK'
   #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
                                                        ^ ~~~
   1 warning and 4 errors generated.


vim +/hv_isolation_type_en_snp +62 arch/x86/include/asm/mshyperv.h

    54	
    55	static inline u64 hv_do_hypercall(u64 control, void *input, void *output)
    56	{
    57		u64 input_address = input ? virt_to_phys(input) : 0;
    58		u64 output_address = output ? virt_to_phys(output) : 0;
    59		u64 hv_status;
    60	
    61	#ifdef CONFIG_X86_64
  > 62		if (hv_isolation_type_en_snp()) {
    63			__asm__ __volatile__("mov %4, %%r8\n"
    64					     "vmmcall"
    65					     : "=a" (hv_status), ASM_CALL_CONSTRAINT,
    66					       "+c" (control), "+d" (input_address)
    67					     :  "r" (output_address)
    68					     : "cc", "memory", "r8", "r9", "r10", "r11");
    69		} else {
    70			if (!hv_hypercall_pg)
    71				return U64_MAX;
    72	
    73			__asm__ __volatile__("mov %4, %%r8\n"
    74					     CALL_NOSPEC
    75					     : "=a" (hv_status), ASM_CALL_CONSTRAINT,
    76					       "+c" (control), "+d" (input_address)
    77					     :  "r" (output_address),
    78						THUNK_TARGET(hv_hypercall_pg)
    79					     : "cc", "memory", "r8", "r9", "r10", "r11");
    80		}
    81	#else
    82		u32 input_address_hi = upper_32_bits(input_address);
    83		u32 input_address_lo = lower_32_bits(input_address);
    84		u32 output_address_hi = upper_32_bits(output_address);
    85		u32 output_address_lo = lower_32_bits(output_address);
    86	
    87		if (!hv_hypercall_pg)
    88			return U64_MAX;
    89	
    90		__asm__ __volatile__(CALL_NOSPEC
    91				     : "=A" (hv_status),
    92				       "+c" (input_address_lo), ASM_CALL_CONSTRAINT
    93				     : "A" (control),
    94				       "b" (input_address_hi),
    95				       "D"(output_address_hi), "S"(output_address_lo),
    96				       THUNK_TARGET(hv_hypercall_pg)
    97				     : "cc", "memory");
    98	#endif /* !x86_64 */
    99		return hv_status;
   100	}
   101	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
