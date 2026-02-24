Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4208224A07C;
	Tue, 24 Feb 2026 03:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771903442; cv=none; b=R+/ZKjWVTzuu9polDORiiK11q8ajosOhQCts9+/P9M2qirRGNvSHwmqDPy/4eackOTZujWo5tIr/bWoM/mu3cWbjYsbpjDUtn8o/6VJBf+qjEz7w3HRn8mX9LtvxB64laahFDYRdwTmZIISw10p4z0NbfJRQH/DtKi8BCmRjuFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771903442; c=relaxed/simple;
	bh=9W8Gjf19i5UUU3XZAkuM503spJg+yYyxwQu4duae1DA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WuTuQgkOGN19ygYzsqFPtAa/Ujd6PwTqshSpkuzz+mmSOpI/Q+hx33ZViruULfFRPRWTkQBBr2RHbpoj3LgD2UKHAj1XXHrzKmF71ATs8xklLaUnVeWoDglKMqoTA8eqSJOVOsAClxdppbY0yVa5MNk6l92kdTUIV8Wk2ZAf5HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6MnMYIu; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6MnMYIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771903440; x=1803439440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9W8Gjf19i5UUU3XZAkuM503spJg+yYyxwQu4duae1DA=;
  b=d6MnMYIueaGmaPfwsxgCX66Rn3FIqDCqibYjLIUr/i8Pp0UE8eNZKTEd
   m7elDOtbWLtpKPEQ2ZaONYeOK9UZPvtW6c9zlFxEui2LVNoZbvFr139m0
   TmwLS92pG79mdikMOtveVfFk5UFG9GHgLCYQ6IrpgnGnNsaDO1msTgT78
   N0DWhfm6UQ9n+KnA44QfvvFRftymMqYK/N5ZydgMTe1K1ARIgEvkzjZ+w
   SL3lHz45Q5EoFyo6CLHpJ0ooZubJXDC7i5Ncc1zD6E5dtqS2V02ZfZItP
   a4/ob57HUCPIv7cAG8Fyo/ie+5aoV+BOxOrbD3GfLi9Tb4ysdiUXX2Oqs
   w==;
X-CSE-ConnectionGUID: rzK2YJGESJefV+uhrIlnHQ==
X-CSE-MsgGUID: kq68ASMXSeuov3RxreqKAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72788265"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72788265"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 19:23:59 -0800
X-CSE-ConnectionGUID: lCY5RDvhQDadu7M9QImbLA==
X-CSE-MsgGUID: EpTaCPbpSw+Yxr4F0vjZGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="214141245"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2026 19:23:57 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuj1f-000000001ML-2V8b;
	Tue, 24 Feb 2026 03:23:55 +0000
Date: Tue, 24 Feb 2026 11:23:17 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "Piotr =?utf-8?Q?Pi=C3=B3rkowski"?= <piotr.piorkowski@intel.com>
Subject: [linux-next:master 678/1146]
 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:71:22: warning:
 implicit conversion from 'unsigned long long' to 'resource_size_t' (aka
 'unsigned int') changes value from 14940110848 to 2055208960
Message-ID: <202602241144.LxOYPgFa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   779cae956c8316aebc1946ef86ca001f99658270
commit: cbe29da6f7c0d0541ec135e7292b35b97f8ca402 [678/1146] drm/xe/tests: Add KUnit tests for new VRAM fair provisioning
config: i386-buildonly-randconfig-001-20260224 (https://download.01.org/0day-ci/archive/20260224/202602241144.LxOYPgFa-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241144.LxOYPgFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241144.LxOYPgFa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c:3271:
>> drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:71:22: warning: implicit conversion from 'unsigned long long' to 'resource_size_t' (aka 'unsigned int') changes value from 14940110848 to 2055208960 [-Wconstant-conversion]
      71 |         vram->usable_size = TEST_VRAM;
         |                           ~ ^~~~~~~~~
   drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c:14:19: note: expanded from macro 'TEST_VRAM'
      14 | #define TEST_VRAM       0x37a800000ull
         |                         ^~~~~~~~~~~~~~
   1 warning generated.


vim +71 drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c

    44	
    45	static int pf_gt_config_test_init(struct kunit *test)
    46	{
    47		struct xe_pci_fake_data fake = {
    48			.sriov_mode = XE_SRIOV_MODE_PF,
    49			.platform = XE_BATTLEMAGE, /* any random DGFX platform with SR-IOV */
    50			.subplatform = XE_SUBPLATFORM_NONE,
    51			.graphics_verx100 = 2001,
    52		};
    53		struct xe_vram_region *vram;
    54		struct xe_device *xe;
    55		struct xe_gt *gt;
    56	
    57		test->priv = &fake;
    58		xe_kunit_helper_xe_device_test_init(test);
    59	
    60		xe = test->priv;
    61		KUNIT_ASSERT_TRUE(test, IS_SRIOV_PF(xe));
    62	
    63		gt = xe_root_mmio_gt(xe);
    64		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gt);
    65		test->priv = gt;
    66	
    67		/* pretend it has some VRAM */
    68		KUNIT_ASSERT_TRUE(test, IS_DGFX(xe));
    69		vram = kunit_kzalloc(test, sizeof(*vram), GFP_KERNEL);
    70		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vram);
  > 71		vram->usable_size = TEST_VRAM;
    72		xe->mem.vram = vram;
    73		xe->tiles[0].mem.vram = vram;
    74	
    75		/* pretend we have a valid LMTT */
    76		KUNIT_ASSERT_TRUE(test, xe_device_has_lmtt(xe));
    77		KUNIT_ASSERT_GE(test, GRAPHICS_VERx100(xe), 1260);
    78		xe->tiles[0].sriov.pf.lmtt.ops = &lmtt_ml_ops;
    79	
    80		/* pretend it can support up to 63 VFs */
    81		xe->sriov.pf.device_total_vfs = TEST_MAX_VFS;
    82		xe->sriov.pf.driver_max_vfs = TEST_MAX_VFS;
    83		KUNIT_ASSERT_EQ(test, xe_sriov_pf_get_totalvfs(xe), 63);
    84	
    85		pf_set_admin_mode(xe, false);
    86		KUNIT_ASSERT_EQ(test, xe_sriov_init(xe), 0);
    87	
    88		/* more sanity checks */
    89		KUNIT_EXPECT_EQ(test, GUC_ID_MAX + 1, SZ_64K);
    90		KUNIT_EXPECT_EQ(test, GUC_NUM_DOORBELLS, SZ_256);
    91	
    92		return 0;
    93	}
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
