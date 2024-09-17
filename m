Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20930A29;
	Tue, 17 Sep 2024 23:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726616451; cv=none; b=DlY8cQSpPmVliIPGjczNj45Uj9wfEtF6a+oBm2oa/QOl0auXiPRBx0dhqmOAa/XwKaDLTR5bJQLhaypm6Wx5UnL4K38RDna9atJV+098dM6A60x+RV9VVpdtanVwWEC1Ba5YlRFeeL9ENIwDuX6f9rk7GBw6iTNc243G6Ev2ByE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726616451; c=relaxed/simple;
	bh=fiGOHXl2nzwT0mxv79wAgSj5B24XwW6x2xZcJMbNfEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kSw5woTGkA91FfmK3sCcV/PYVJ/ZonUg/RtMbvsyqFRcDxy1YTsrQwHDA+X6qF1sE5Wwc1BYRCjE8T72CWAL294Lm1iHBzJ0PyOAr20t+aDwLdfKqAiTdgmRjLHZ+DXd0h8iD/H+Vc+Uithj/lpS315G20noNjLOR9JkP4eHuT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HwzuBMbx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HwzuBMbx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726616450; x=1758152450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fiGOHXl2nzwT0mxv79wAgSj5B24XwW6x2xZcJMbNfEk=;
  b=HwzuBMbxdo8UOkzuPp2r/g5SnG2t9pY3Zyod21E13HaT2jwKFSQgi9aF
   qLsNMev0/aAYpX5xOnWQo+jINcQ2qRlAe+aVlpKII8ixCkKQmM6Wc0CQv
   hKpeohpGOdiXm43ztDqLrYGRCJqpo9rO9kezF+x276mW6UCxK4+gqPMPu
   0aCWWSvfuftRB4JeMxzezxS3TPeLo1FDHESCfgpAapZ/8e3uOreyEPKU4
   csWlELqMXmXQ9vDG+j09RwrX6lEfdAuHvkVDkxNVAZHXp8NNzk2u7RIU8
   uX2NZN5Y/DOsm9Hc20K+vdADPtGmcUJKGiNuqUeHhjF16aGB93cadNDF+
   A==;
X-CSE-ConnectionGUID: 2PnkgGpYT36fMakYVflckw==
X-CSE-MsgGUID: uC4fM3UiQDaoZhf4v9TUhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36640632"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="36640632"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 16:40:50 -0700
X-CSE-ConnectionGUID: QrFMUZMWSn+G59CTDkMojA==
X-CSE-MsgGUID: neIUYby9T7KEhStpZ5enCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="70156067"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Sep 2024 16:40:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqhoL-000Bi2-1c;
	Tue, 17 Sep 2024 23:40:45 +0000
Date: Wed, 18 Sep 2024 07:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Vrac <avrac@freebox.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [linux-next:master 7253/12283]
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c:156:19: error: unused function
 'pll_cmp_to_fdata'
Message-ID: <202409180728.PLGhrkab-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f3e012d4cfd1d9bf837870c961f462ca9f23ebe
commit: caedbf17c48dcd9f076aa7157c1bb8ab8082c418 [7253/12283] drm/msm: add msm8998 hdmi phy/pll support
config: arm64-randconfig-004-20240918 (https://download.01.org/0day-ci/archive/20240918/202409180728.PLGhrkab-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240918/202409180728.PLGhrkab-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409180728.PLGhrkab-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c:156:19: error: unused function 'pll_cmp_to_fdata' [-Werror,-Wunused-function]
   static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
                     ^
   1 error generated.


vim +/pll_cmp_to_fdata +156 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c

   155	
 > 156	static inline u64 pll_cmp_to_fdata(u32 pll_cmp, unsigned long ref_clk)
   157	{
   158		u64 fdata = ((u64)pll_cmp) * ref_clk * 10;
   159	
   160		do_div(fdata, HDMI_PLL_CMP_CNT);
   161	
   162		return fdata;
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
