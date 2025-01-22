Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716B621505B;
	Wed, 22 Jan 2025 16:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737562805; cv=none; b=muEKX3tCnts5ANSvZHtyyuTsJmRwSLCGtd1nXPKLkmPVKGkAepZJtr6zy66qHoK5vls0ub5kC9xZQzeR9/2d1FbAmbdcWvrduY+2GeemsaM65O23RNfNx7NWS70hfqw+0UADc/lXU7JaO0FC9GMIqJHF8WYlRU1rktJJ45vfaag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737562805; c=relaxed/simple;
	bh=YCx6T97ezyDoVDsRwmmaQ98AqxuHSycNU8QBqF/etDw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LhThBPF0V9YrbyxWlM75UUAFkgITW7fpgChZgnyG+GOZSJZlyVyPYnpMxA7S4HolfJNhEZNiU8TxIC8Crr1JqsIPj7I7ava6laFmLqTjxQKOh5OL41aTpmyvb2Jh5R7hH8gbnv3u/aFP8LMKMnHSQmXF2TD8a073wwJ8SVh52f8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Csrk7IkU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Csrk7IkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737562803; x=1769098803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YCx6T97ezyDoVDsRwmmaQ98AqxuHSycNU8QBqF/etDw=;
  b=Csrk7IkUw+rkNWQ7/gKjSpUCJuAX9lKmUFK3kIB8y9LnutjJBOkz7Qwn
   a89K9gwN56NcSi9WjMK93UNQQSTaZ6uO9l3LeigyOL3it8jvUl5o+P6rc
   WY2dABe8FDoqLRm7kwJ021yoUgi2Q5DDJ3uf9b/1p8CwBFL+agfe4Fnn2
   bTAHTkyW1A3r8nNOYjToq6c86VkF1EWiZinISgupxjYwrLlWxRK4GSYc3
   GSsqXms1nPibpcEshb2Pgl7TiXF29eM74uYqGhE++pdnsTWZvhFIcr1se
   qkjo7Rl8JouHlJQHEBvFejIhnRHb9HBDWdLZBG+7tedeTwuZcXScHbBQC
   Q==;
X-CSE-ConnectionGUID: jFf1lykxQ4y6elWvzQxXtw==
X-CSE-MsgGUID: RODQNxlURUWFdYyInftUzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="48693860"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="48693860"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 08:20:03 -0800
X-CSE-ConnectionGUID: ZNah69FSTXmvVThOaRJ97w==
X-CSE-MsgGUID: BNQ2hdZwSzeqLkaaoQeCnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144433313"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 Jan 2025 08:20:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tadSR-000a5v-03;
	Wed, 22 Jan 2025 16:19:59 +0000
Date: Thu, 23 Jan 2025 00:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 66/74]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c:158: warning: Function parameter
 or struct member 'mdss_ver' not described in 'dpu_hw_lm_init'
Message-ID: <202501230012.SPO4zoud-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/sm8750-display-dts-and-panel
head:   3d4ec7553fa4310579528818ee68ffff4b614b66
commit: 75857f186facb0a7190877ce945dcc645fb96986 [66/74] BACKPORT: drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA (partial)
config: arm64-randconfig-002-20250122 (https://download.01.org/0day-ci/archive/20250123/202501230012.SPO4zoud-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501230012.SPO4zoud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501230012.SPO4zoud-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c:158: warning: Function parameter or struct member 'mdss_ver' not described in 'dpu_hw_lm_init'


vim +158 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c

25fdd5933e4c0f Jeykumar Sankaran   2018-06-27  146  
86313a9cd15233 Dmitry Baryshkov    2024-11-02  147  /**
86313a9cd15233 Dmitry Baryshkov    2024-11-02  148   * dpu_hw_lm_init() - Initializes the mixer hw driver object.
86313a9cd15233 Dmitry Baryshkov    2024-11-02  149   * should be called once before accessing every mixer.
86313a9cd15233 Dmitry Baryshkov    2024-11-02  150   * @dev:  Corresponding device for devres management
86313a9cd15233 Dmitry Baryshkov    2024-11-02  151   * @cfg:  mixer catalog entry for which driver object is required
86313a9cd15233 Dmitry Baryshkov    2024-11-02  152   * @addr: mapped register io address of MDP
86313a9cd15233 Dmitry Baryshkov    2024-11-02  153   */
a106ed98af6848 Dmitry Baryshkov    2023-12-02  154  struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
a106ed98af6848 Dmitry Baryshkov    2023-12-02  155  				    const struct dpu_lm_cfg *cfg,
75857f186facb0 Krzysztof Kozlowski 2025-01-16  156  				    void __iomem *addr,
75857f186facb0 Krzysztof Kozlowski 2025-01-16  157  				    const struct dpu_mdss_version *mdss_ver)
25fdd5933e4c0f Jeykumar Sankaran   2018-06-27 @158  {

:::::: The code at line 158 was first introduced by commit
:::::: 25fdd5933e4c0f5fe2ea5cd59994f8ac5fbe90ef drm/msm: Add SDM845 DPU support

:::::: TO: Jeykumar Sankaran <jsanka@codeaurora.org>
:::::: CC: Sean Paul <seanpaul@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
