Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3646154445;
	Sat, 11 Jan 2025 08:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736582960; cv=none; b=SPdL4xD4t7jeOphOxTTwzwchSgTdRpU6CjV5lp3TKhgaeQnWHkEjEjGVACA7vkyeuZknCX3I94OnHPXkADApfpuL5rCHChRNeFVmFf9jl9nTbvXVkG3y7/dSHPPBphGHWmuxzBRWUMz/qoWmkNyOZ3wDeMWtXvbRHIAUE6RR868=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736582960; c=relaxed/simple;
	bh=G97LiPjYw8U+BdjIa8xh0AjxO0EccEf9lRugfafCp88=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uaw1sLW1giorZwN0oywS0exRMg2ZiuWhx+qid2fqlMusF42lUbb84Yb0xN7ssExb83NpKqOIFHqtmvIEtPZElvrokWjTrjHCTUU9uqhtgYKlIPc6Ucqig+2DgWSktSJf+0pvZhTf3+l8DbyvHgXP1UpaUQHPG71GOD/JMqXnzLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h1qkXRtl; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h1qkXRtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736582959; x=1768118959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G97LiPjYw8U+BdjIa8xh0AjxO0EccEf9lRugfafCp88=;
  b=h1qkXRtlAZO2yDivfpEI9zB9Tmb2+iLRYbdE8hk4D2ThmtL5r6AUO2qm
   m4hdzZDW060kFVysxBxDfAIYKG90tmtV7M3qsFOFVhgXpl+aak3nXk06H
   wJ9PZAEdC4zqpK/ry0il8Rknk6BGuApzm8s/kunThhX2AetofDF0OGIvf
   aaRHHsfv50+0e8Pb016Cxdh2pxKrmWP+ABd4s/7DBd7jZAWFbB89qxawd
   tZWzEzry1TieJn1Os/3vOPeijFjaRpDPHCgM9oiEtm7uGCn6F2VLrcFAH
   zfKNqdWwvTQj0utTd7qH8qPns2gLLiJA+uegkM06TMPP7HdV1scoLPN40
   Q==;
X-CSE-ConnectionGUID: 3qK0Mbk9SKmkQIBt0NkOjA==
X-CSE-MsgGUID: owvHSUllQlKXk4qE3AmQeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="54425668"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="54425668"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 00:09:16 -0800
X-CSE-ConnectionGUID: hkx1Y2JESWCknTdrq+cBWg==
X-CSE-MsgGUID: zzGOp9b9R3mrTRstChRjcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="104125525"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 Jan 2025 00:09:14 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWWYS-000KMn-0W;
	Sat, 11 Jan 2025 08:09:12 +0000
Date: Sat, 11 Jan 2025 16:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Kaushal Kumar <kaushal.kumar@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Venkat Praveen Kancharlapalli <venkat.praveen.kancharlapalli@amd.com>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:lkp_test 281/504]
 drivers/media/platform/xilinx/xilinx-isppipeline.c:2419:18: error: call to
 '__compiletime_assert_1055' declared with 'error' attribute: FIELD_GET: mask
 is not constant
Message-ID: <202501111644.tGji0R1i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 6726d1a1a60f8495a4efe8d028b58a00a248c190 [281/504] media: xilinx: Add for ISP pipeline driver
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20250111/202501111644.tGji0R1i-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501111644.tGji0R1i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111644.tGji0R1i-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-isppipeline.c:2419:18: error: call to '__compiletime_assert_1055' declared with 'error' attribute: FIELD_GET: mask is not constant
           bool en_index = XGET_BIT(index, xisp->module_en);
                           ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:202:36: note: expanded from macro 'XGET_BIT'
   #define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
                                      ^
   include/linux/bitfield.h:155:3: note: expanded from macro 'FIELD_GET'
                   __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
                   ^
   include/linux/bitfield.h:65:3: note: expanded from macro '__BF_FIELD_CHECK'
                   BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
                   ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:505:2: note: expanded from macro '_compiletime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:498:4: note: expanded from macro '__compiletime_assert'
                           prefix ## suffix();                             \
                           ^
   <scratch space>:19:1: note: expanded from here
   __compiletime_assert_1055
   ^
   1 error generated.


vim +2419 drivers/media/platform/xilinx/xilinx-isppipeline.c

  2398	
  2399	/**
  2400	 * xisp_create_controls - Creates V4L2 controls for the given xisp device
  2401	 * @xisp: Pointer to the xisp_dev structure representing the device
  2402	 * @index: Index of the module enable bit in xisp->module_en and xisp->module_bypass_en
  2403	 * @ctrl_arr: Array of v4l2_ctrl_config structures representing the control configurations
  2404	 * @size: Number of control configurations in the ctrl_arr array
  2405	 *
  2406	 * This function creates custom V4L2 controls for the specified xisp device.
  2407	 * It checks whether the module is enabled and whether the module bypass is
  2408	 * enabled before creating controls.
  2409	 *
  2410	 * The controls are created based on the configurations provided in the ctrl_arr array.
  2411	 * If the module enable bit is set and the module bypass enable bit is set,
  2412	 * it creates the first control from the array. If there are more controls
  2413	 * (size > 1), it iterates through the remaining controls and creates them.
  2414	 */
  2415	static void xisp_create_controls(struct xisp_dev *xisp, u32 index,
  2416					 struct v4l2_ctrl_config *ctrl_arr, u32 size)
  2417	{
  2418		int itr;
> 2419		bool en_index = XGET_BIT(index, xisp->module_en);
  2420		bool bypass_en_index = XGET_BIT(index, xisp->module_bypass_en);
  2421	
  2422		if (!en_index)
  2423			return;
  2424	
  2425		if (bypass_en_index)
  2426			v4l2_ctrl_new_custom(&xisp->ctrl_handler, &ctrl_arr[0], NULL);
  2427	
  2428		if (size < 2)
  2429			return;
  2430	
  2431		for (itr = 1; itr < size; itr++)
  2432			v4l2_ctrl_new_custom(&xisp->ctrl_handler, &ctrl_arr[itr], NULL);
  2433	}
  2434	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
