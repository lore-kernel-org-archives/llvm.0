Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7034D657DC;
	Wed, 17 Apr 2024 06:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713336726; cv=none; b=dmJRHG0irAnTrrr64tpmFzjuFrQDoxCs427Na64ur+U0CndURd8jTObKNuv6P+cHKFtoGitg+iGcIYWA4YQplMWk0h9s0qb5f+HI5s8lfJUof/1NK69/0EuJ6rSFHhtHFLx5nhHEd2YESCHasVOlfd6NrhaNI6kX96CexosQFDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713336726; c=relaxed/simple;
	bh=CvIdPHaOI8Reyzbo0LmpE6o4IQi9OnZB+9Q8i8/Qhyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LC/lImp9i54D5g3DVaSZsxctynDvSXyEQhYgCHwYQwk/h39WV9NbUD4bGUxgQ8G7doveWtAeUWsc8qmJFVKT50AwyXePw+YV/Mxoablhx9lyfTr3zXuI7NO/mjtnxhnkgjaopiB419uJsYql5R0+Cu/i+CZCFAPJRHx3bvkiB1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PxSj1zR+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PxSj1zR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713336725; x=1744872725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CvIdPHaOI8Reyzbo0LmpE6o4IQi9OnZB+9Q8i8/Qhyw=;
  b=PxSj1zR+xt1czHEFHSum6vWPLp6bAKH0oCCi1FiKzNqvarHrNSSaF1kR
   ImY/3Oj/vZSpuscFVtS5A1mTEQDwFq/+wa5HzSVsiNpcSm0qG6Y+OE+1d
   VtyTSBN1v3YPpOJoZlhNoLq/JmJXCEGN8dMdhS+/wqZ1a6bm7TwzmX/Y6
   KH4QXqllq9NTQvVXjLWq1CCpe+yILox1l4yfbcjjEstjIpNvpjIYiy1ej
   3ccUxR6INwohXv2BplWmbny/smc4vlDbluLoPp/WKXf80BABO8DGiw0Bh
   h6dVWGVjB0DmODuYfd8KzTMnxWxOV0G6f7XOwAaHSuD9TCmYws5QekvOU
   A==;
X-CSE-ConnectionGUID: 92/knbiVS+q5+63qngD3Lg==
X-CSE-MsgGUID: 5DzFp21NRYixvOcbZj8fpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8692682"
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="8692682"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 23:52:04 -0700
X-CSE-ConnectionGUID: x08bGG1IRiicNkK6N9CgKQ==
X-CSE-MsgGUID: wKWaf+ypStuBbyzDrD+OMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,208,1708416000"; 
   d="scan'208";a="22519870"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 16 Apr 2024 23:52:02 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwz8S-0006EK-0M;
	Wed, 17 Apr 2024 06:51:24 +0000
Date: Wed, 17 Apr 2024 14:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Michael Shavit <mshavit@google.com>
Subject: [jgunthorpe:smmuv3_newapi 9/42]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:371:13: warning: stack
 frame size (2112) exceeds limit (2048) in
 'arm_smmu_v3_write_cd_test_s1_clear'
Message-ID: <202404171412.CA3RzI5S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_newapi
head:   e7d4a8ffc0a84de43bbe7e1c04b3445253eb5e65
commit: 8c3648084db09e85ab1e20e54099454dd0737a22 [9/42] iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240417/202404171412.CA3RzI5S-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7089c359a3845323f6f30c44a47dd901f2edfe63)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240417/202404171412.CA3RzI5S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404171412.CA3RzI5S-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:6:
   In file included from include/linux/io-pgtable.h:6:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:371:13: warning: stack frame size (2112) exceeds limit (2048) in 'arm_smmu_v3_write_cd_test_s1_clear' [-Wframe-larger-than]
     371 | static void arm_smmu_v3_write_cd_test_s1_clear(struct kunit *test)
         |             ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:383:13: warning: stack frame size (2176) exceeds limit (2048) in 'arm_smmu_v3_write_cd_test_s1_change_asid' [-Wframe-larger-than]
     383 | static void arm_smmu_v3_write_cd_test_s1_change_asid(struct kunit *test)
         |             ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:424:13: warning: stack frame size (3584) exceeds limit (2048) in 'arm_smmu_v3_write_cd_test_sva_clear' [-Wframe-larger-than]
     424 | static void arm_smmu_v3_write_cd_test_sva_clear(struct kunit *test)
         |             ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:436:13: warning: stack frame size (3584) exceeds limit (2048) in 'arm_smmu_v3_write_cd_test_sva_release' [-Wframe-larger-than]
     436 | static void arm_smmu_v3_write_cd_test_sva_release(struct kunit *test)
         |             ^
   9 warnings generated.


vim +/arm_smmu_v3_write_cd_test_s1_clear +371 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c

   370	
 > 371	static void arm_smmu_v3_write_cd_test_s1_clear(struct kunit *test)
   372	{
   373		struct arm_smmu_cd cd = {};
   374		struct arm_smmu_cd cd_2;
   375	
   376		arm_smmu_test_make_s1_cd(&cd_2, 1997);
   377		arm_smmu_v3_test_cd_expect_non_hitless_transition(
   378			test, &cd, &cd_2, NUM_EXPECTED_SYNCS(2));
   379		arm_smmu_v3_test_cd_expect_non_hitless_transition(
   380			test, &cd_2, &cd, NUM_EXPECTED_SYNCS(2));
   381	}
   382	
 > 383	static void arm_smmu_v3_write_cd_test_s1_change_asid(struct kunit *test)
   384	{
   385		struct arm_smmu_cd cd = {};
   386		struct arm_smmu_cd cd_2;
   387	
   388		arm_smmu_test_make_s1_cd(&cd, 778);
   389		arm_smmu_test_make_s1_cd(&cd_2, 1997);
   390		arm_smmu_v3_test_cd_expect_hitless_transition(test, &cd, &cd_2,
   391							      NUM_EXPECTED_SYNCS(1));
   392		arm_smmu_v3_test_cd_expect_hitless_transition(test, &cd_2, &cd,
   393							      NUM_EXPECTED_SYNCS(1));
   394	}
   395	
   396	static void arm_smmu_test_make_sva_cd(struct arm_smmu_cd *cd, unsigned int asid)
   397	{
   398		struct arm_smmu_device smmu = {
   399			.features = ARM_SMMU_FEAT_STALLS | ARM_SMMU_FEAT_ATTR_TYPES_OVR
   400		};
   401		struct arm_smmu_master master = {
   402			.smmu = &smmu,
   403		};
   404		struct mm_struct mm = {
   405			.pgd = (void *)0xdaedbeefdeadbeefULL,
   406		};
   407	
   408		arm_smmu_make_sva_cd(cd, &master, &mm, asid);
   409	}
   410	
   411	static void arm_smmu_test_make_sva_release_cd(struct arm_smmu_cd *cd,
   412						      unsigned int asid)
   413	{
   414		struct arm_smmu_device smmu = {
   415			.features = ARM_SMMU_FEAT_STALLS | ARM_SMMU_FEAT_ATTR_TYPES_OVR
   416		};
   417		struct arm_smmu_master master = {
   418			.smmu = &smmu,
   419		};
   420	
   421		arm_smmu_make_sva_cd(cd, &master, NULL, asid);
   422	}
   423	
 > 424	static void arm_smmu_v3_write_cd_test_sva_clear(struct kunit *test)
   425	{
   426		struct arm_smmu_cd cd = {};
   427		struct arm_smmu_cd cd_2;
   428	
   429		arm_smmu_test_make_sva_cd(&cd_2, 1997);
   430		arm_smmu_v3_test_cd_expect_non_hitless_transition(
   431			test, &cd, &cd_2, NUM_EXPECTED_SYNCS(2));
   432		arm_smmu_v3_test_cd_expect_non_hitless_transition(
   433			test, &cd_2, &cd, NUM_EXPECTED_SYNCS(2));
   434	}
   435	
 > 436	static void arm_smmu_v3_write_cd_test_sva_release(struct kunit *test)
   437	{
   438		struct arm_smmu_cd cd;
   439		struct arm_smmu_cd cd_2;
   440	
   441		arm_smmu_test_make_sva_cd(&cd, 1997);
   442		arm_smmu_test_make_sva_release_cd(&cd_2, 1997);
   443		arm_smmu_v3_test_cd_expect_hitless_transition(test, &cd, &cd_2,
   444							      NUM_EXPECTED_SYNCS(2));
   445		arm_smmu_v3_test_cd_expect_hitless_transition(test, &cd_2, &cd,
   446							      NUM_EXPECTED_SYNCS(2));
   447	}
   448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
