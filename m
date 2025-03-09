Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC67117CA12;
	Sun,  9 Mar 2025 10:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741516479; cv=none; b=bvraQ4Aav9QqejjJCdVhhQkVGncbvWOie1m6CG9dGluLQQNtYGS11HjR029MilkloKwQYr0w3tTxpisuT5TipeIFpKw2Nx2E/fcLPmu8g7Nsp7b2/zEMrUdt1x3t/LgLWh7+Tz6WSsg0oDWgHiRcfh3yy+SV+qKrMzVL8MPsmc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741516479; c=relaxed/simple;
	bh=VVA+1SPK40Lwo6TMSvfP2Ladr8U82jm2GxrtF3EBH+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ikD7uGhcCQvyilF1GHqXGBvdMVuX6orlF/dNdYeX1NRJnHHEaKkVy2f5eTeFhpfv1ck90qIiiixfex2wpW70/32s1ZqEPzPXUKksR/Xafj5hBSCu6AOxSYZJ0YcgHd13oOVbnDJxXmh5BcKssvJdY+NN6P5k/FhgDuZsCloHCLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bxi0NRUo; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bxi0NRUo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741516478; x=1773052478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VVA+1SPK40Lwo6TMSvfP2Ladr8U82jm2GxrtF3EBH+M=;
  b=Bxi0NRUoPG6bXI72Ov5TlwnEutDlUMrOyJX1L++4u86yqHsGyrvCVpYa
   8FgdLm1bEr3sDbegPB6TQObJZZyiWt1siG67iEa3tITwyEWvLtUMYvS9U
   opc4Ez3WDsjR45YmE5ZnBpNwAOTei/nCEyEv9bB+9WUiw55Zd2jSWMbWi
   oyqnVJ0IfHjblMuhlGaDhABk811Nc2/59vzly0z0idHnBvpPRW14JVQBP
   RBNWGVWg1dhPvgdnyxxfrxDYcYUI6lqeCH5peRD7y8nEtkzYSNQ5Tp4bx
   qtT+LiHEKWw3pUM85V0zS2NLWcScXpMivNZofSDryIJMAleFzl18HcsU/
   Q==;
X-CSE-ConnectionGUID: JhYu88ziT4eDbMR5TQ3Sgg==
X-CSE-MsgGUID: 9r+bhqi7QOOCcHUe0WWZgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="46299964"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="46299964"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 03:34:35 -0700
X-CSE-ConnectionGUID: 01hoakgbQP+BOvDMJ7aBYw==
X-CSE-MsgGUID: CSYZftjBRsG5xe2oR72sbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="124741343"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 09 Mar 2025 03:34:34 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trDzM-0002zw-0H;
	Sun, 09 Mar 2025 10:34:32 +0000
Date: Sun, 9 Mar 2025 18:34:13 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:asm-call 27/42] arch/x86/include/asm/mshyperv.h:142:9:
 error: expected ')'
Message-ID: <202503091841.vKh4oa5M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git asm-call
head:   44613874d65bd54453e4f3c595459870cf4a8c9c
commit: aa81a7d76185c9d4373a1f1d5d0b101328e8b4ce [27/42] x86/hyperv: Use asm_call() in hypercall functions
config: x86_64-buildonly-randconfig-006-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091841.vKh4oa5M-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091841.vKh4oa5M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091841.vKh4oa5M-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hv/hv_balloon.c:33:
>> arch/x86/include/asm/mshyperv.h:142:9: error: expected ')'
     142 |                          ARG("cc", "r8", "r9", "r10", "r11"));
         |                              ^
   1 error generated.
--
   In file included from drivers/hv/vmbus_drv.c:40:
>> arch/x86/include/asm/mshyperv.h:142:9: error: expected ')'
     142 |                          ARG("cc", "r8", "r9", "r10", "r11"));
         |                              ^
   drivers/hv/vmbus_drv.c:1928:42: warning: shift count >= width of type [-Wshift-count-overflow]
    1928 |         dma_set_mask(&child_device_obj->device, DMA_BIT_MASK(64));
         |                                                 ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:73:54: note: expanded from macro 'DMA_BIT_MASK'
      73 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   1 warning and 1 error generated.


vim +142 arch/x86/include/asm/mshyperv.h

   123	
   124	/* Fast hypercall with 8 bytes of input and no output */
   125	static inline u64 _hv_do_fast_hypercall8(u64 control, u64 input1)
   126	{
   127		u64 hv_status;
   128	
   129	#ifdef CONFIG_X86_64
   130		if (hv_isolation_type_tdx() && !hyperv_paravisor_present)
   131			return hv_tdx_hypercall(control, input1, 0);
   132	
   133		if (hv_isolation_type_snp() && !hyperv_paravisor_present) {
   134			asm_call("vmmcall",
   135				 ARG("=a" (hv_status), "+c" (control), "+d" (input1)),
   136				 ARG(),
   137				 ARG("cc", "r8", "r9", "r10", "r11"));
   138		} else {
   139			asm_call(CALL_NOSPEC,
   140				 ARG("=a" (hv_status), "+c" (control), "+d" (input1)),
   141				 ARG(THUNK_TARGET(hv_hypercall_pg))
 > 142				 ARG("cc", "r8", "r9", "r10", "r11"));
   143		}
   144	#else
   145		{
   146			u32 input1_hi = upper_32_bits(input1);
   147			u32 input1_lo = lower_32_bits(input1);
   148	
   149			asm_call(CALL_NOSPEC,
   150				 ARG("=A" (hv_status), "+c" (input1_lo)),
   151				 ARG("A" (control), "b" (input1_hi),
   152				     THUNK_TARGET(hv_hypercall_pg)),
   153				 ARG("cc", "edi", "esi"));
   154		}
   155	#endif
   156			return hv_status;
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
