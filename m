Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572B82EA173;
	Mon,  9 Feb 2026 21:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770672064; cv=none; b=YJNdohuwyAmB576n4UOMEofOPZYGftEAxvBJ4h8aspW7GMkfI6K1rlq85i2KxYZOpRJxpOdGyUS4mun5Bbv195g88FDnl8b6uLCfVwxAWUNddZRCZU0Y/5C6TvoVAyckGyN/Q385HJPgQGURXYt8n8OjWoQY2Nex8PzxwxLHcEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770672064; c=relaxed/simple;
	bh=Tl0X3h0YbIbrMYP/4PSqqKr9YSUO3iCbUFP9QAlD560=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lc9UIyW9DSUkzl7eVE9w8cgV/OPNlQCmu+n2B9pB59x1QmYv0KK1K6j7Vrv0SE2UpWT8w3FAZJR77yPsC24JiD0k6pJvFdzdPAtEtidRGufVlO0Jwx4ju/Sgcct6hTZHeOa6piKslkZtWs8mXFzFkJMKU1vLqnTtp/HYXG/utDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHIHbUpk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHIHbUpk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770672062; x=1802208062;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tl0X3h0YbIbrMYP/4PSqqKr9YSUO3iCbUFP9QAlD560=;
  b=EHIHbUpkELesNW0XQHtGAGBpgTXtoPVCW6ErcgmBUlFYol8S4GPPkyRm
   2CsTcD/PwBIJ/vyAPZvkI3AS90UKtfnDxClNWCxQ+unvd6Licrx1z6YrV
   0i2WpkBv6jbY6Z4sBcaYCZktDsV6XVCTiH8XWsZdBEN/Npy8qADnVPxPv
   LWbhwbI6npcF5VLU2Tn5ACMO/yU18YcjuSek4vIj1QMGruwgIHxXBWE02
   E5vWIneKG0Xt1PTaFP0t59s/2GlnlEq9pqVszyd3AlECO0zoRFPVTr8eM
   oUIeC3pCVdkRq09tOurp34fKpQJcaxSHPaJWwCSrwZ4DKzKckVwwMru8y
   A==;
X-CSE-ConnectionGUID: 4ju+n0DNQZOHoo5695S71A==
X-CSE-MsgGUID: Lj3jhNDORQK4Kih4eRtTuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71004179"
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="71004179"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 13:21:02 -0800
X-CSE-ConnectionGUID: qiJVag5sQhC/4fsrAuP8CQ==
X-CSE-MsgGUID: 2EiX+7RgRAOpeh1o1+No/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,282,1763452800"; 
   d="scan'208";a="211714482"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 13:21:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpYgj-00000000oKy-07Cx;
	Mon, 09 Feb 2026 21:20:57 +0000
Date: Tue, 10 Feb 2026 05:20:41 +0800
From: kernel test robot <lkp@intel.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
	matthew.auld@intel.com, christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alexander.deucher@amd.com,
	Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Subject: Re: [PATCH v3 2/2] drm/buddy: Add KUnit test for offset-aligned
 allocations
Message-ID: <202602100509.jUETbEEY-lkp@intel.com>
References: <20260209083051.13376-2-Arunpravin.PaneerSelvam@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209083051.13376-2-Arunpravin.PaneerSelvam@amd.com>

Hi Arunpravin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d757669b2b22cd224c334924f798393ffca537c]

url:    https://github.com/intel-lab-lkp/linux/commits/Arunpravin-Paneer-Selvam/drm-buddy-Add-KUnit-test-for-offset-aligned-allocations/20260209-163512
base:   9d757669b2b22cd224c334924f798393ffca537c
patch link:    https://lore.kernel.org/r/20260209083051.13376-2-Arunpravin.PaneerSelvam%40amd.com
patch subject: [PATCH v3 2/2] drm/buddy: Add KUnit test for offset-aligned allocations
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260210/202602100509.jUETbEEY-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100509.jUETbEEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100509.jUETbEEY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/tests/gpu_buddy_test.c:46:7: error: too many arguments provided to function-like macro invocation
                              "buddy_init failed\n");
                              ^
   include/kunit/test.h:1390:9: note: macro 'KUNIT_ASSERT_FALSE' defined here
   #define KUNIT_ASSERT_FALSE(test, condition) \
           ^
   drivers/gpu/tests/gpu_buddy_test.c:45:2: error: use of undeclared identifier 'KUNIT_ASSERT_FALSE'; did you mean 'KUNIT_ASSERTION'?
           KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, SZ_4K),
           ^~~~~~~~~~~~~~~~~~
           KUNIT_ASSERTION
   include/kunit/assert.h:27:2: note: 'KUNIT_ASSERTION' declared here
           KUNIT_ASSERTION,
           ^
>> drivers/gpu/tests/gpu_buddy_test.c:45:2: warning: expression result unused [-Wunused-value]
           KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, SZ_4K),
           ^~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +45 drivers/gpu/tests/gpu_buddy_test.c

    23	
    24	static void gpu_test_buddy_subtree_offset_alignment_stress(struct kunit *test)
    25	{
    26		struct gpu_buddy_block *block;
    27		struct rb_node *node = NULL;
    28		const u64 mm_size = SZ_2M;
    29		const u64 alignments[] = {
    30			SZ_1M,
    31			SZ_512K,
    32			SZ_256K,
    33			SZ_128K,
    34			SZ_64K,
    35			SZ_32K,
    36			SZ_16K,
    37			SZ_8K,
    38		};
    39	
    40		struct list_head allocated[ARRAY_SIZE(alignments)];
    41		unsigned int i, order, max_subtree_align = 0;
    42		struct gpu_buddy mm;
    43		int ret, tree;
    44	
  > 45		KUNIT_ASSERT_FALSE(test, gpu_buddy_init(&mm, mm_size, SZ_4K),
    46				   "buddy_init failed\n");
    47	
    48		for (i = 0; i < ARRAY_SIZE(allocated); i++)
    49			INIT_LIST_HEAD(&allocated[i]);
    50	
    51		/*
    52		 * Exercise subtree_max_alignment tracking by allocating blocks with descending
    53		 * alignment constraints and freeing them in reverse order. This verifies that
    54		 * free-tree augmentation correctly propagates the maximum offset alignment
    55		 * present in each subtree at every stage.
    56		 */
    57	
    58		for (i = 0; i < ARRAY_SIZE(alignments); i++) {
    59			struct gpu_buddy_block *root = NULL;
    60			unsigned int expected;
    61			u64 align;
    62	
    63			align = alignments[i];
    64			expected = ilog2(align) - 1;
    65	
    66			for (;;) {
    67				ret = gpu_buddy_alloc_blocks(&mm,
    68							     0, mm_size,
    69							     SZ_4K, align,
    70							     &allocated[i],
    71							     0);
    72				if (ret)
    73					break;
    74	
    75				block = list_last_entry(&allocated[i],
    76							struct gpu_buddy_block,
    77							link);
    78				KUNIT_EXPECT_EQ(test, gpu_buddy_block_offset(block) & (align - 1), 0ULL);
    79			}
    80	
    81			for (order = mm.max_order + 1; order-- > 0 && !root; ) {
    82				for (tree = 0; tree < 2; tree++) {
    83					node = mm.free_trees[tree][order].rb_node;
    84					if (node) {
    85						root = container_of(node,
    86								    struct gpu_buddy_block,
    87								    rb);
    88						break;
    89					}
    90				}
    91			}
    92	
    93			KUNIT_ASSERT_NOT_NULL(test, root);
    94			KUNIT_EXPECT_EQ(test, root->subtree_max_alignment, expected);
    95		}
    96	
    97		for (i = ARRAY_SIZE(alignments); i-- > 0; ) {
    98			gpu_buddy_free_list(&mm, &allocated[i], 0);
    99	
   100			for (order = 0; order <= mm.max_order; order++) {
   101				for (tree = 0; tree < 2; tree++) {
   102					node = mm.free_trees[tree][order].rb_node;
   103					if (!node)
   104						continue;
   105	
   106					block = container_of(node, struct gpu_buddy_block, rb);
   107					max_subtree_align = max(max_subtree_align, block->subtree_max_alignment);
   108				}
   109			}
   110	
   111			KUNIT_EXPECT_GE(test, max_subtree_align, ilog2(alignments[i]));
   112		}
   113	
   114		gpu_buddy_fini(&mm);
   115	}
   116	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
