Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC27819F11E;
	Tue, 15 Apr 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744724710; cv=none; b=YaPrdRFkHZlg/NXbAoFJSFJQH9QD1UHyRdC1W+GrHAfBMCjfwN2SnFbVPiJ+XTHuf+IDnJXOWk+xi8CgNXzm4fetKgZQvPiGj2oTVUUO+OQHH1yDU9jfowGfLZrJD5hI71qZo4/XQBIIqFGjiLmeXzmwzSr/3jDvD+NRSOn+Hw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744724710; c=relaxed/simple;
	bh=CLr30k7rL5r+IsjYC34IBGddQe/Zwox3Dk9rhXGMJOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SZ95ZjbDKxuHFXdlVRPzvzOF7uFf2Qxk3r7JUFDnHog4WbCT0+ILqKr2o92L6EygXwwqxUKYERYV7iFyoeIJf9atC1/XhcBXDL4cFK13hAR8hYj3u/LgG+AgyYO3D00dap9ne+aT1OBTilb782PpHDlvVp6DcC7MFzWU0+jadxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tq+aR/HN; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tq+aR/HN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744724709; x=1776260709;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CLr30k7rL5r+IsjYC34IBGddQe/Zwox3Dk9rhXGMJOA=;
  b=Tq+aR/HNpxwZ9UxJSMfN2UKZEnzWG7OqKWjNGTe77CQvKUDbpG1zVLsw
   ibT//zHA2nF9HSLEtL3p6EufPmvoMhYeV91ojbN5ofpjJXPkZh4hRJwf2
   qR5KBhUVOoJXW9ALb5Na16z/b1a225osc9Xn4SJFyVNseITfMWQ2DMGiZ
   rZ7ZmWOzVUmtXydiEyWWjQ6/SKn3cooYBzMpUKR872OY7udOZyRdCUoWx
   9LWhXOHyz0d3I6+fzszaJUQ8Ssb0Z2krmpBs6vsGLURaGrCZ95709oMo8
   qNHIP+MgzGCfkFZ2MSXAiu/G3oFxR4VQVsgl7Da9MJWv28cNFS8bYE+hv
   A==;
X-CSE-ConnectionGUID: U3jyB27JRKODek9lgv/onA==
X-CSE-MsgGUID: t7J09/aRS0KvPQuCSWRqHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46322446"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46322446"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 06:45:08 -0700
X-CSE-ConnectionGUID: kZ9a4aKXSkqM07Wjx41/VA==
X-CSE-MsgGUID: wQv02wtWQWSqSDtxRO5FTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130659370"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Apr 2025 06:45:06 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4gb1-000GEC-29;
	Tue, 15 Apr 2025 13:45:03 +0000
Date: Tue, 15 Apr 2025 21:44:04 +0800
From: kernel test robot <lkp@intel.com>
To: Haylen Chu <heylenay@4d2.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>
Subject: [spacemit:for-next 4/6] drivers/clk/spacemit/ccu-k1.c:241:1: error:
 initializer element is not a compile-time constant
Message-ID: <202504152107.7ekGPIrF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/spacemit-com/linux for-next
head:   9ead3efbc88a21e9a1f38948cc0902518022a2e5
commit: e2d238ba301f25a5c8a7d490a36f9cd014d7aecc [4/6] clk: spacemit: Add clock support for SpacemiT K1 SoC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504152107.7ekGPIrF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504152107.7ekGPIrF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/spacemit/ccu-k1.c:241:1: error: initializer element is not a compile-time constant
     241 | CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
      33 |         .num_shift      = __ffs(_num_mask),                                     \
         |                           ^~~~~~~~~~~~~~~~
   drivers/clk/spacemit/ccu-k1.c:242:1: error: initializer element is not a compile-time constant
     242 | CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/clk/spacemit/ccu_ddn.h:33:15: note: expanded from macro 'CCU_DDN_DEFINE'
      33 |         .num_shift      = __ffs(_num_mask),                                     \
         |                           ^~~~~~~~~~~~~~~~
   2 errors generated.


vim +241 drivers/clk/spacemit/ccu-k1.c

   239	
   240	CCU_GATE_DEFINE(slow_uart, CCU_PARENT_NAME(osc), MPMU_ACGR, BIT(1), CLK_IGNORE_UNUSED);
 > 241	CCU_DDN_DEFINE(slow_uart1_14p74, pll1_d16_153p6, MPMU_SUCCR, GENMASK(28, 16), GENMASK(12, 0), 0);
   242	CCU_DDN_DEFINE(slow_uart2_48, pll1_d4_614p4, MPMU_SUCCR_1, GENMASK(28, 16), GENMASK(12, 0), 0);
   243	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
