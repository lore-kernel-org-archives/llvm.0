Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D573E214227;
	Wed, 22 Jan 2025 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560280; cv=none; b=R+O6qxTweD1w9QTFBVH5zqtY2uMylOkk7/IYRUcpHFSYTth28UdKfxSyuIj/k8FJNjurSl2d80HYn9sP3C2quyRoecyF2ezkvJPojnWtO9j4RL5H4cynvyZCE3rOYhtd7BeNlmj4WymgPZMXupXR9IX/zlv7sKtC1pGa0fKRO+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560280; c=relaxed/simple;
	bh=Jh2yF+VROdNdpSETNaHYZ62mUsnzQVPN5YeYt6NFjCM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cjv826JBD2QrbOk7tNOLnn0uIYAD27+725R77NaYK9In/mDjmQdIzCU1Wyw2pQj5628inUqT3Fsr83Q3vBWroFxddctG8eKB979ZWFrtAqE/6ysF880rBlHbexTQdiT6Ryf2wwP7pWki5lJWMqFj1S9Q+zni8Avsa7G7KkOUCxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O44LHfiZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O44LHfiZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737560278; x=1769096278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jh2yF+VROdNdpSETNaHYZ62mUsnzQVPN5YeYt6NFjCM=;
  b=O44LHfiZHpf4yobpMmSRl/wBFbje5x7XvgDsrNHD7HWeNyyXDWocBck7
   8kz8sIj3CAEwxVdVbO/hQOtg5ZMK+Kdfb6QexedKlZk8L+D07oAFutux+
   RooTgcUWMM3fGP2bUlWOH0Cv7ErSX2WFHUlLjnXX1tYoZG3VIOoot9xjC
   Y8RhpBFahXlO5Od872umH4ouZkmfTo+oqu6UtF0F9BbdoFKXzCIxL9VdZ
   hdwAC1HnnAKKX/isBBAFAZytGnOxaX3KYUVUYau5pUfzreisvjYcmozfm
   n9tdQzzjLrkHDLJvVn0l+KGAg/5IOdCEwOjds6QDDL3nqpO8kwJuhBlMT
   w==;
X-CSE-ConnectionGUID: fjjtFr0lQmahhSlsAftACQ==
X-CSE-MsgGUID: PJlYJoXwRBWXPZQ17HiUtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49008052"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="49008052"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 07:37:57 -0800
X-CSE-ConnectionGUID: OnymWKE+Qe+yG8bXnEOoDw==
X-CSE-MsgGUID: CsaGT5NJSrW3Y5l5UEwpqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="138049629"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jan 2025 07:37:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tacnh-000a39-2e;
	Wed, 22 Jan 2025 15:37:53 +0000
Date: Wed, 22 Jan 2025 23:37:43 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/sm8750-display-dts-and-panel 65/74]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:711: warning: Function parameter
 or struct member 'mdss_ver' not described in 'dpu_hw_ctl_init'
Message-ID: <202501222312.BTowIoQu-lkp@intel.com>
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
commit: e98ff1cb35729b5c1261a302cc1fa27889addb93 [65/74] BACKPORT: drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4 (partial)
config: arm64-randconfig-002-20250122 (https://download.01.org/0day-ci/archive/20250122/202501222312.BTowIoQu-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501222312.BTowIoQu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501222312.BTowIoQu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c:711: warning: Function parameter or struct member 'mdss_ver' not described in 'dpu_hw_ctl_init'


vim +711 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c

b3652e87c03c70 Krishna Manikandan  2021-04-06  695  
86313a9cd15233 Dmitry Baryshkov    2024-11-02  696  /**
86313a9cd15233 Dmitry Baryshkov    2024-11-02  697   * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
86313a9cd15233 Dmitry Baryshkov    2024-11-02  698   * Should be called before accessing any ctl_path register.
86313a9cd15233 Dmitry Baryshkov    2024-11-02  699   * @dev:  Corresponding device for devres management
86313a9cd15233 Dmitry Baryshkov    2024-11-02  700   * @cfg:  ctl_path catalog entry for which driver object is required
86313a9cd15233 Dmitry Baryshkov    2024-11-02  701   * @addr: mapped register io address of MDP
86313a9cd15233 Dmitry Baryshkov    2024-11-02  702   * @mixer_count: Number of mixers in @mixer
86313a9cd15233 Dmitry Baryshkov    2024-11-02  703   * @mixer: Pointer to an array of Layer Mixers defined in the catalog
86313a9cd15233 Dmitry Baryshkov    2024-11-02  704   */
a106ed98af6848 Dmitry Baryshkov    2023-12-02  705  struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
a106ed98af6848 Dmitry Baryshkov    2023-12-02  706  				   const struct dpu_ctl_cfg *cfg,
25fdd5933e4c0f Jeykumar Sankaran   2018-06-27  707  				   void __iomem *addr,
e98ff1cb35729b Krzysztof Kozlowski 2025-01-13  708  				   const struct dpu_mdss_version *mdss_ver,
babdb815ef0457 Marijn Suijten      2023-04-26  709  				   u32 mixer_count,
babdb815ef0457 Marijn Suijten      2023-04-26  710  				   const struct dpu_lm_cfg *mixer)
25fdd5933e4c0f Jeykumar Sankaran   2018-06-27 @711  {

:::::: The code at line 711 was first introduced by commit
:::::: 25fdd5933e4c0f5fe2ea5cd59994f8ac5fbe90ef drm/msm: Add SDM845 DPU support

:::::: TO: Jeykumar Sankaran <jsanka@codeaurora.org>
:::::: CC: Sean Paul <seanpaul@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
