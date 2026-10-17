Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC041F12F8;
	Sat, 17 Oct 2026 20:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792268079; cv=none; b=mP1nxdE6R/eECQBlYiLDR6WDNVTi1GW3EGHwOifVLs7qXBa+U8MwH1hfrOa3GCcclHnxjXaV63jpaPfTytI/8R2GornSDH5AwVAVVKFD0R1t3MuNbKYEsk7QnPNNciFelQgIxBJ/OrcCjKlJKGVki8Xq0l6thy4KoBUmlO1QKKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792268079; c=relaxed/simple;
	bh=y7Ap1XfeOHvboQ7PbN6Rl8QpwflaIaVCmsA0+A8a58E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p2XAcUbm0HuHAJuB+eS3ObuU3W+3dp+tLn6sGjtOVmLthE88+b3EfjMO2iG+BsGlDsBloCDtupMsxOtJv3BLtXnyKOU5CJw31QLpImTfORTQP1OPEC9767gyKtkL/tb1+kbVl6IQuHbynlMRCrJ3tZtwRCYups+/KaWUIrRgl3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SH9/b1bK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SH9/b1bK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792268077; x=1823804077;
  h=date:from:to:cc:subject:message-id;
  bh=y7Ap1XfeOHvboQ7PbN6Rl8QpwflaIaVCmsA0+A8a58E=;
  b=SH9/b1bKN1NsEajrlYA/u6QRrQD7TVj2QmETT7wx3ssSmAblGHrKThq+
   WIAqxTjgdhHVPha3vgzhnbiZhDCLmHx53HRaME/2TxFcGSNFE1QfQUeZB
   DAp9cLed+G1oPuemY9LPo836z/WTYWeMirljpE+BIIF42TmTCpRVtCExG
   lZmsrWW4WgerGA7nWhw9U3gU7gJJW65XUjDeEvCxaWhc2gwGp880eZGiX
   HT+JRhKM4koBqbLgDOJpC9YRnF8mUPuL9G2ES6tFJv7sonbFlqZsFxsPd
   YwS/SejJnZqgMfEQyUpafdgIXOH18QehcAIYeJcutbAyvOoXzckyGAAJu
   Q==;
X-CSE-ConnectionGUID: AJpbKVzkS0Gpt38DWf+JSw==
X-CSE-MsgGUID: kCrXUHv/QoO+0RJ8lwZbAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="1028096"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1028096"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 13:14:37 -0700
X-CSE-ConnectionGUID: nMNvyGm/QTme3ZEGE66etg==
X-CSE-MsgGUID: DtR2l3PJQ5iJsh+QaIlM9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2206709"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Oct 2026 13:14:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIAnY-00000000JjS-1LkG;
	Sat, 17 Oct 2026 20:14:32 +0000
Date: Sun, 18 Oct 2026 04:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_1 49/62]
 drivers/ctlv/tests/registration_kunit.c:1706:48: warning: variable
 'init_info' is uninitialized when passed as a const pointer argument here
Message-ID: <202610180358.W6RbvGU3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_1
head:   e63637d55bc3ae7cbef988e3525c79b9381dba1b
commit: 611edc69440d968bf06f3c4018b4a3b4a4660884 [49/62] selftests/ctlv: Add library tests
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261018/202610180358.W6RbvGU3-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 6719b9e31d6a93099612c474eec76d9f41d0275a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180358.W6RbvGU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180358.W6RbvGU3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ctlv/tests/registration_kunit.c:1706:48: warning: variable 'init_info' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
    1706 |                 created = ctlv_create(parent, &ctlv_family, &init_info);
         |                                                              ^~~~~~~~~
>> drivers/ctlv/tests/registration_kunit.c:668:13: warning: stack frame size (2096) exceeds limit (2048) in 'ctlv_reg_test_check' [-Wframe-larger-than]
     668 | static void ctlv_reg_test_check(struct kunit *test)
         |             ^
>> drivers/ctlv/tests/registration_kunit.c:720:13: warning: stack frame size (2192) exceeds limit (2048) in 'ctlv_reg_test_resolved' [-Wframe-larger-than]
     720 | static void ctlv_reg_test_resolved(struct kunit *test)
         |             ^
>> drivers/ctlv/tests/registration_kunit.c:793:13: warning: stack frame size (2176) exceeds limit (2048) in 'ctlv_reg_test_published' [-Wframe-larger-than]
     793 | static void ctlv_reg_test_published(struct kunit *test)
         |             ^
>> drivers/ctlv/tests/registration_kunit.c:846:13: warning: stack frame size (2104) exceeds limit (2048) in 'ctlv_reg_test_state_after_publish' [-Wframe-larger-than]
     846 | static void ctlv_reg_test_state_after_publish(struct kunit *test)
         |             ^
>> drivers/ctlv/tests/registration_kunit.c:1682:13: warning: stack frame size (2096) exceeds limit (2048) in 'ctlv_reg_test_root_family' [-Wframe-larger-than]
    1682 | static void ctlv_reg_test_root_family(struct kunit *test)
         |             ^
   6 warnings generated.


vim +/init_info +1706 drivers/ctlv/tests/registration_kunit.c

2c4421adfbc30c Jiri Pirko 2026-08-26  1681  
2c4421adfbc30c Jiri Pirko 2026-08-26 @1682  static void ctlv_reg_test_root_family(struct kunit *test)
2c4421adfbc30c Jiri Pirko 2026-08-26  1683  {
2c4421adfbc30c Jiri Pirko 2026-08-26  1684  	struct ctlv_device ctlvdev = {};
2c4421adfbc30c Jiri Pirko 2026-08-26  1685  
2c4421adfbc30c Jiri Pirko 2026-08-26  1686  	KUNIT_ASSERT_EQ(test,
2c4421adfbc30c Jiri Pirko 2026-08-26  1687  			ctlv_op_resolution_init(&ctlvdev, &ctlv_family), 0);
2c4421adfbc30c Jiri Pirko 2026-08-26  1688  	kunit_add_action(test, ctlv_reg_test_free_ops, ctlvdev.ops);
2c4421adfbc30c Jiri Pirko 2026-08-26  1689  	kunit_add_action(test, ctlv_reg_test_free_privs, ctlvdev.privs);
2c4421adfbc30c Jiri Pirko 2026-08-26  1690  	kunit_add_action(test, ctlv_reg_test_free_priv_block,
2c4421adfbc30c Jiri Pirko 2026-08-26  1691  			 ctlvdev.priv_block);
2c4421adfbc30c Jiri Pirko 2026-08-26  1692  	KUNIT_EXPECT_EQ(test, ctlvdev.ops_count,
2c4421adfbc30c Jiri Pirko 2026-08-26  1693  			ctlv_family.schema->ops_count);
2c4421adfbc30c Jiri Pirko 2026-08-26  1694  	KUNIT_EXPECT_EQ(test, ctlvdev.privs_count, 1);
2c4421adfbc30c Jiri Pirko 2026-08-26  1695  }
2c4421adfbc30c Jiri Pirko 2026-08-26  1696  
2c4421adfbc30c Jiri Pirko 2026-08-26  1697  static void ctlv_reg_test_root_init_info(struct kunit *test)
2c4421adfbc30c Jiri Pirko 2026-08-26  1698  {
2c4421adfbc30c Jiri Pirko 2026-08-26  1699  	struct device *parent;
2c4421adfbc30c Jiri Pirko 2026-08-26  1700  	struct ctlv_device *created;
2c4421adfbc30c Jiri Pirko 2026-08-26  1701  	u8 init_info;
2c4421adfbc30c Jiri Pirko 2026-08-26  1702  
2c4421adfbc30c Jiri Pirko 2026-08-26  1703  	parent = kunit_device_register(test, "ctlv-root-info");
2c4421adfbc30c Jiri Pirko 2026-08-26  1704  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
2c4421adfbc30c Jiri Pirko 2026-08-26  1705  	kunit_warning_suppress(test) {
2c4421adfbc30c Jiri Pirko 2026-08-26 @1706  		created = ctlv_create(parent, &ctlv_family, &init_info);
2c4421adfbc30c Jiri Pirko 2026-08-26  1707  		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
2c4421adfbc30c Jiri Pirko 2026-08-26  1708  	}
2c4421adfbc30c Jiri Pirko 2026-08-26  1709  	KUNIT_ASSERT_TRUE(test, IS_ERR(created));
2c4421adfbc30c Jiri Pirko 2026-08-26  1710  	KUNIT_EXPECT_EQ(test, PTR_ERR(created), -EINVAL);
2c4421adfbc30c Jiri Pirko 2026-08-26  1711  }
2c4421adfbc30c Jiri Pirko 2026-08-26  1712  

:::::: The code at line 1706 was first introduced by commit
:::::: 2c4421adfbc30c9ee180047f914b19954af67851 ctlv: Add KUnit tests

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
