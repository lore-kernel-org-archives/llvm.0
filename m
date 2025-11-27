Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6868729ACD7;
	Thu, 27 Nov 2025 21:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764278197; cv=none; b=hi7P636js+0M+Bk2tLzDgpvrZwl5WlRPoxX6Ul9YtZLRNwi+vpyDYSJC7N/XZS8Q67BuxJrNDooSmeoYZqijxtUzQ5rPbhbJoctHj5b+LO0mvHZEzqIynQybw9jWlgmnQV9Rw6lqHzn2EhZrTjR8uG5oBaY80P9hUGHJdedSYSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764278197; c=relaxed/simple;
	bh=neIg4/UrNIFPZj3GFDmJU4G/zUf2VCq3c7srWF3tzf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=De7xKGkEKjZhbC6ZrHFMR872BtpAJ533tbtmDtq8O2yYWggH/ahtgZey3rhAkXxELpMME80ie3O2PCPesYaGmjGeLmRpHYopvmeslPmaNJtgqSCj/cNhXnOta4hciYLK4U69Bf26J5C+7WZTYixTMBUnAaLUyiQJ2Nown7KFiRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKGD1kXA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKGD1kXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764278195; x=1795814195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=neIg4/UrNIFPZj3GFDmJU4G/zUf2VCq3c7srWF3tzf8=;
  b=OKGD1kXAS5pGfF95IRZXnlE0acagNNpnAIgAFOVHwa+xUH+dwKNuDEwz
   kT3gXGSUdiWxVpRJZlRBvkdEUX4nW9EArKAuqHOrtqaEEqYuy5tLqwCto
   akBDjRnfPOR6wfn7xHA1Hf1DaiN1oNr5RCICpblMygaQ7uhmeTKK2FQDS
   B3ZM1xxQYitAdmfHVYtsCFfhZl6vWJKqGnjM5gnsBTFRTAP7piHaonO35
   cJs1v6gc3KsrfXYlZTdxVAgxdPJngiWftKhhR8pCQdBKy79dQG+4sgoml
   EN7D/lunxPIUuHOAMnHxJ5DqQ2uHyUxrY5gpgjDnXE3OSS9cwAyhhevnm
   w==;
X-CSE-ConnectionGUID: I3YLT3E0TKSRcY3OvKp3aA==
X-CSE-MsgGUID: OYg9yVbBTUSNDCvPpyWl5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66354078"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="66354078"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 13:16:35 -0800
X-CSE-ConnectionGUID: 1Y51xhXIRSu8O3aM1pVNuw==
X-CSE-MsgGUID: GxJ9SFcwQr6sysxpw/hhMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193110608"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Nov 2025 13:16:34 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOjLr-000000005h1-1At8;
	Thu, 27 Nov 2025 21:16:31 +0000
Date: Fri, 28 Nov 2025 05:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Upton <oupton@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>
Subject: [linux-next:master 11230/12398] arch/arm64/kvm/ptdump.c:49:10:
 error: statement expression not allowed at file scope
Message-ID: <202511280532.8GWko1r4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: 81e9fe5c6f25dda9090697deee6f7aa8ac7ea84a [11230/12398] KVM: arm64: Teach ptdump about FEAT_XNX permissions
config: arm64-randconfig-002-20251128 (https://download.01.org/0day-ci/archive/20251128/202511280532.8GWko1r4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511280532.8GWko1r4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511280532.8GWko1r4-lkp@intel.com/

Note: the linux-next/master HEAD ef68bf704646690aba5e81c2f7be8d6ef13d7ad8 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/ptdump.c:49:10: error: statement expression not allowed at file scope
      49 |                 .val    = FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b00),
         |                           ^
   include/linux/bitfield.h:114:2: note: expanded from macro 'FIELD_PREP'
     114 |         ({                                                              \
         |         ^
   arch/arm64/kvm/ptdump.c:54:10: error: statement expression not allowed at file scope
      54 |                 .val    = FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b01),
         |                           ^
   include/linux/bitfield.h:114:2: note: expanded from macro 'FIELD_PREP'
     114 |         ({                                                              \
         |         ^
   arch/arm64/kvm/ptdump.c:59:10: error: statement expression not allowed at file scope
      59 |                 .val    = FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b10),
         |                           ^
   include/linux/bitfield.h:114:2: note: expanded from macro 'FIELD_PREP'
     114 |         ({                                                              \
         |         ^
   arch/arm64/kvm/ptdump.c:64:10: error: statement expression not allowed at file scope
      64 |                 .val    = FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b11),
         |                           ^
   include/linux/bitfield.h:114:2: note: expanded from macro 'FIELD_PREP'
     114 |         ({                                                              \
         |         ^
>> arch/arm64/kvm/ptdump.c:101:18: error: invalid application of 'sizeof' to an incomplete type 'const struct ptdump_prot_bits[]'
     101 |         for (i = 0; i < ARRAY_SIZE(stage2_pte_bits); i++)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   arch/arm64/kvm/ptdump.c:107:18: error: invalid application of 'sizeof' to an incomplete type 'const struct ptdump_prot_bits[]'
     107 |                 level[i].num    = ARRAY_SIZE(stage2_pte_bits);
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   6 errors generated.


vim +49 arch/arm64/kvm/ptdump.c

    27	
    28	static const struct ptdump_prot_bits stage2_pte_bits[] = {
    29		{
    30			.mask	= PTE_VALID,
    31			.val	= PTE_VALID,
    32			.set	= " ",
    33			.clear	= "F",
    34		},
    35		{
    36			.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R,
    37			.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R,
    38			.set	= "R",
    39			.clear	= " ",
    40		},
    41		{
    42			.mask	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
    43			.val	= KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W,
    44			.set	= "W",
    45			.clear	= " ",
    46		},
    47		{
    48			.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
  > 49			.val	= FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b00),
    50			.set	= "px ux ",
    51		},
    52		{
    53			.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
    54			.val	= FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b01),
    55			.set	= "PXNux ",
    56		},
    57		{
    58			.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
    59			.val	= FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b10),
    60			.set	= "PXNUXN",
    61		},
    62		{
    63			.mask	= KVM_PTE_LEAF_ATTR_HI_S2_XN,
    64			.val	= FIELD_PREP(KVM_PTE_LEAF_ATTR_HI_S2_XN, 0b11),
    65			.set	= "px UXN",
    66		},
    67		{
    68			.mask	= KVM_PTE_LEAF_ATTR_LO_S2_AF,
    69			.val	= KVM_PTE_LEAF_ATTR_LO_S2_AF,
    70			.set	= "AF",
    71			.clear	= "  ",
    72		},
    73		{
    74			.mask	= PMD_TYPE_MASK,
    75			.val	= PMD_TYPE_SECT,
    76			.set	= "BLK",
    77			.clear	= "   ",
    78		},
    79	};
    80	
    81	static int kvm_ptdump_visitor(const struct kvm_pgtable_visit_ctx *ctx,
    82				      enum kvm_pgtable_walk_flags visit)
    83	{
    84		struct ptdump_pg_state *st = ctx->arg;
    85		struct ptdump_state *pt_st = &st->ptdump;
    86	
    87		note_page(pt_st, ctx->addr, ctx->level, ctx->old);
    88	
    89		return 0;
    90	}
    91	
    92	static int kvm_ptdump_build_levels(struct ptdump_pg_level *level, u32 start_lvl)
    93	{
    94		u32 i;
    95		u64 mask;
    96	
    97		if (WARN_ON_ONCE(start_lvl >= KVM_PGTABLE_LAST_LEVEL))
    98			return -EINVAL;
    99	
   100		mask = 0;
 > 101		for (i = 0; i < ARRAY_SIZE(stage2_pte_bits); i++)
   102			mask |= stage2_pte_bits[i].mask;
   103	
   104		for (i = start_lvl; i < KVM_PGTABLE_MAX_LEVELS; i++) {
   105			snprintf(level[i].name, sizeof(level[i].name), "%u", i);
   106	
   107			level[i].num	= ARRAY_SIZE(stage2_pte_bits);
   108			level[i].bits	= stage2_pte_bits;
   109			level[i].mask	= mask;
   110		}
   111	
   112		return 0;
   113	}
   114	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
