Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B35E073;
	Wed, 28 Feb 2024 20:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709150555; cv=none; b=e5D9H2YbB3/1rQ1V/+Wou1LDLKQie+P5O1NHXf+KJUPDIl/JceBPlkZvhAHHrpQhT9VYFXDW6pFgY4ubnZPbcLVjlrAxHvNz5d329B98UAF03Iww4dRduuF5AYqJAvptRyy6Isb48c3SQyO8IGHr1fiAzDjI33yJpPSmiQHIDT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709150555; c=relaxed/simple;
	bh=GltouD20eDXd99Ownkdbc7M3rmr4ujJYzN92zISzvMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W6yQl2qZNz6VvMvfhKqlyIDdkmjjPb4GOE3DxUeLk6fG6nHckqjHQ8Lmv0WY77ZjMR3GcPpatOi2HKruBk4zycLQ2tzGpbV6dz6phJmwWNIOdpDNjXamwBmh0w0Vua5SysIXO+VzQcLAnvm81EY/NuwaY0rV5BKDmiQKSH/bdiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7ijMXgB; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7ijMXgB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709150553; x=1740686553;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GltouD20eDXd99Ownkdbc7M3rmr4ujJYzN92zISzvMk=;
  b=b7ijMXgBJXoHFOk7oc+CYPDRmCZE7+rcdjerbJ4FFJ8fGirSwlzOALGS
   6ca6g4Xuav0ReY2Cyec9qUd2ysveuyM9iOSbMf6jZ39RKV0UPJcnWeAYf
   oOtGiZyD29/JX2wWPQWxQ897YNyzbxC3jh1ruGH3LENfeSxH8EBu6wVML
   cvLkb51V9xTFE4xPgSyaGC1rvkDXbyhau65T+YotJtCZhcxt67BkqTiyW
   GTGxxAgWmj+XuE704L4uACRynEa8tEW6a3U17kBPhCgP1TQnpjvGWEfXp
   cnZtdPJNckKoHoRx1TX6Qrwie+/eQTAUiilGF81YmUxfXGAbouiOErNQs
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3743185"
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="3743185"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 12:02:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,191,1705392000"; 
   d="scan'208";a="12115806"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 28 Feb 2024 12:02:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfQ7w-000CMJ-1n;
	Wed, 28 Feb 2024 20:02:04 +0000
Date: Thu, 29 Feb 2024 04:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Michael Shavit <mshavit@google.com>
Subject: [jgunthorpe:smmuv3_newapi 59/61]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:306:13: warning: stack
 frame size (2304) exceeds limit (2048) in
 'arm_smmu_v3_write_ste_test_s2_to_abort'
Message-ID: <202402290341.dtjXzc65-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_newapi
head:   60902329db637c9726cd8623c44e8873a7290750
commit: b7eff415b5e8abed0da4dbd3cc910b4857d8b06a [59/61] iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20240229/202402290341.dtjXzc65-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project edd4aee4dd9b5b98b2576a6f783e4086173d902a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240229/202402290341.dtjXzc65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402290341.dtjXzc65-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:306:13: warning: stack frame size (2304) exceeds limit (2048) in 'arm_smmu_v3_write_ste_test_s2_to_abort' [-Wframe-larger-than]
     306 | static void arm_smmu_v3_write_ste_test_s2_to_abort(struct kunit *test)
         |             ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:316:13: warning: stack frame size (2304) exceeds limit (2048) in 'arm_smmu_v3_write_ste_test_abort_to_s2' [-Wframe-larger-than]
     316 | static void arm_smmu_v3_write_ste_test_abort_to_s2(struct kunit *test)
         |             ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:326:13: warning: stack frame size (2304) exceeds limit (2048) in 'arm_smmu_v3_write_ste_test_s2_to_bypass' [-Wframe-larger-than]
     326 | static void arm_smmu_v3_write_ste_test_s2_to_bypass(struct kunit *test)
         |             ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:336:13: warning: stack frame size (2304) exceeds limit (2048) in 'arm_smmu_v3_write_ste_test_bypass_to_s2' [-Wframe-larger-than]
     336 | static void arm_smmu_v3_write_ste_test_bypass_to_s2(struct kunit *test)
         |             ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:346:13: warning: stack frame size (2368) exceeds limit (2048) in 'arm_smmu_v3_write_ste_test_s1_to_s2' [-Wframe-larger-than]
     346 | static void arm_smmu_v3_write_ste_test_s1_to_s2(struct kunit *test)
         |             ^
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:359:13: warning: stack frame size (2368) exceeds limit (2048) in 'arm_smmu_v3_write_ste_test_s2_to_s1' [-Wframe-larger-than]
     359 | static void arm_smmu_v3_write_ste_test_s2_to_s1(struct kunit *test)
         |             ^
   6 warnings generated.


vim +/arm_smmu_v3_write_ste_test_s2_to_abort +306 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c

   305	
 > 306	static void arm_smmu_v3_write_ste_test_s2_to_abort(struct kunit *test)
   307	{
   308		struct arm_smmu_ste ste;
   309	
   310		arm_smmu_test_make_s2_ste(&ste, true);
   311		arm_smmu_v3_test_ste_expect_hitless_transition(
   312			test, &ste, &abort_ste,
   313			/*num_syncs_expected=*/2);
   314	}
   315	
 > 316	static void arm_smmu_v3_write_ste_test_abort_to_s2(struct kunit *test)
   317	{
   318		struct arm_smmu_ste ste;
   319	
   320		arm_smmu_test_make_s2_ste(&ste, true);
   321		arm_smmu_v3_test_ste_expect_hitless_transition(
   322			test, &abort_ste, &ste,
   323			/*num_syncs_expected=*/2);
   324	}
   325	
 > 326	static void arm_smmu_v3_write_ste_test_s2_to_bypass(struct kunit *test)
   327	{
   328		struct arm_smmu_ste ste;
   329	
   330		arm_smmu_test_make_s2_ste(&ste, true);
   331		arm_smmu_v3_test_ste_expect_hitless_transition(
   332			test, &ste, &bypass_ste,
   333			/*num_syncs_expected=*/2);
   334	}
   335	
 > 336	static void arm_smmu_v3_write_ste_test_bypass_to_s2(struct kunit *test)
   337	{
   338		struct arm_smmu_ste ste;
   339	
   340		arm_smmu_test_make_s2_ste(&ste, true);
   341		arm_smmu_v3_test_ste_expect_hitless_transition(
   342			test, &bypass_ste, &ste,
   343			/*num_syncs_expected=*/2);
   344	}
   345	
 > 346	static void arm_smmu_v3_write_ste_test_s1_to_s2(struct kunit *test)
   347	{
   348		struct arm_smmu_ste s1_ste;
   349		struct arm_smmu_ste s2_ste;
   350	
   351		arm_smmu_test_make_cdtable_ste(&s1_ste, STRTAB_STE_1_S1DSS_SSID0,
   352					       fake_cdtab_dma_addr);
   353		arm_smmu_test_make_s2_ste(&s2_ste, true);
   354		arm_smmu_v3_test_ste_expect_hitless_transition(
   355			test, &s1_ste, &s2_ste,
   356			/*num_syncs_expected=*/3);
   357	}
   358	
 > 359	static void arm_smmu_v3_write_ste_test_s2_to_s1(struct kunit *test)
   360	{
   361		struct arm_smmu_ste s1_ste;
   362		struct arm_smmu_ste s2_ste;
   363	
   364		arm_smmu_test_make_cdtable_ste(&s1_ste, STRTAB_STE_1_S1DSS_SSID0,
   365					       fake_cdtab_dma_addr);
   366		arm_smmu_test_make_s2_ste(&s2_ste, true);
   367		arm_smmu_v3_test_ste_expect_hitless_transition(
   368			test, &s2_ste, &s1_ste,
   369			/*num_syncs_expected=*/3);
   370	}
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
