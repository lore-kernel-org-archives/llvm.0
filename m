Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773541BDDB;
	Tue, 16 Jan 2024 14:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jG/G/7cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705413973; x=1736949973;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Os6LLRYPZxaq5xHFv1ek5Z8ld02N3JNSyPIzIpUg8S8=;
  b=jG/G/7clBWyAvn0hAitjugq22rhaR6OXH1+P42cUB0aaJEyrbU5ncJfP
   q9SWQOEH/wxqK+DufNMmBQvhOhFA5hLrvr0LIK9IcRTFYGaevz+cJA9eY
   x95yLiwiZl/4K9E5u9/np1lOPaG5iFkPhSAH9y8Gaf7U8BFWEh8vnz6v8
   H4yKq3dxFxHmEJ5WM/xLo2Ieo8E5jiiEEf0gl+zQJAmxuzzJ23cPC4Ah9
   nROfoFblNFM/8rBnTwQrVeMgVFrvR68ldObfSmE43/ChVpBUmi3YqvNWZ
   bicBW8J1P3uR9qggxCLSSNr5GxqqcD2GxHdOmuWyjzOCcOCUwzhXWWrV2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="7241674"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="7241674"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 06:06:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="1030999316"
X-IronPort-AV: E=Sophos;i="6.05,199,1701158400"; 
   d="scan'208";a="1030999316"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Jan 2024 06:06:10 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPk4u-0000ls-0f;
	Tue, 16 Jan 2024 14:06:08 +0000
Date: Tue, 16 Jan 2024 22:05:52 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/3] riscv: add support for SBI Supervisor
 Software Events extension
Message-ID: <202401162118.JLZDiKlk-lkp@intel.com>
References: <20240112111720.2975069-3-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240112111720.2975069-3-cleger@rivosinc.com>

Hi Clément,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7]
[cannot apply to next-20240112]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-L-ger/riscv-add-SBI-SSE-extension-definitions/20240112-191943
base:   linus/master
patch link:    https://lore.kernel.org/r/20240112111720.2975069-3-cleger%40rivosinc.com
patch subject: [RFC PATCH v2 2/3] riscv: add support for SBI Supervisor Software Events extension
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240116/202401162118.JLZDiKlk-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240116/202401162118.JLZDiKlk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401162118.JLZDiKlk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/sse.c:68:16: warning: no previous prototype for function 'sse_stack_alloc' [-Wmissing-prototypes]
      68 | unsigned long *sse_stack_alloc(unsigned int cpu, unsigned int size)
         |                ^
   arch/riscv/kernel/sse.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | unsigned long *sse_stack_alloc(unsigned int cpu, unsigned int size)
         | ^
         | static 
>> arch/riscv/kernel/sse.c:73:6: warning: no previous prototype for function 'sse_stack_free' [-Wmissing-prototypes]
      73 | void sse_stack_free(unsigned long *stack)
         |      ^
   arch/riscv/kernel/sse.c:73:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      73 | void sse_stack_free(unsigned long *stack)
         | ^
         | static 
>> arch/riscv/kernel/sse.c:126:6: warning: no previous prototype for function 'sse_entry_init' [-Wmissing-prototypes]
     126 | void sse_entry_init(struct sse_registered_event *reg_evt)
         |      ^
   arch/riscv/kernel/sse.c:126:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     126 | void sse_entry_init(struct sse_registered_event *reg_evt)
         | ^
         | static 
   3 warnings generated.


vim +/sse_stack_alloc +68 arch/riscv/kernel/sse.c

    67	
  > 68	unsigned long *sse_stack_alloc(unsigned int cpu, unsigned int size)
    69	{
    70		return kmalloc(size, GFP_KERNEL);
    71	}
    72	
  > 73	void sse_stack_free(unsigned long *stack)
    74	{
    75		kfree(stack);
    76	}
    77	
    78	#endif /* CONFIG_VMAP_STACK */
    79	
    80	static int sse_init_scs(int cpu, struct sse_registered_event *reg_evt)
    81	{
    82		void *stack;
    83	
    84		if (!scs_is_enabled())
    85			return 0;
    86	
    87		stack = scs_alloc(cpu_to_node(cpu));
    88		if (!stack)
    89			return 1;
    90	
    91		reg_evt->shadow_stack = stack;
    92	
    93		return 0;
    94	}
    95	
    96	int sse_init_event(int cpu, struct sse_registered_event *reg_evt)
    97	{
    98		void *stack;
    99	
   100		stack = sse_stack_alloc(cpu, SSE_STACK_SIZE);
   101		if (!stack)
   102			return -ENOMEM;
   103	
   104		reg_evt->stack = stack;
   105	
   106		if (sse_init_scs(cpu, reg_evt))
   107			goto free_stack;
   108	
   109		reg_evt->state.pc = (unsigned long)handle_sse;
   110		reg_evt->state.a0 = (unsigned long)reg_evt;
   111	
   112		return 0;
   113	
   114	free_stack:
   115		sse_stack_free(reg_evt->stack);
   116	
   117		return -ENOMEM;
   118	}
   119	
   120	void sse_free_event(struct sse_registered_event *reg_evt)
   121	{
   122		scs_free(reg_evt->shadow_stack);
   123		sse_stack_free(reg_evt->stack);
   124	}
   125	
 > 126	void sse_entry_init(struct sse_registered_event *reg_evt)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
