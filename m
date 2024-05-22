Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1B9146D4D;
	Wed, 22 May 2024 23:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716422055; cv=none; b=pMfRKKdp0jw/kaykTw823QI4/BixVhcDS5NoWdooCExPKm6FDPQoBcv516LSOhmcm3R4b6rNB3EEF4wRY4eRR8A1NgJjH9XM8+9SXn/zmFRUtL0HO+GMfrEwwuJtCViiAjNCeer1ovIDheq1TJ1XO4QOrbHhnLPmssrHN8wQvgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716422055; c=relaxed/simple;
	bh=zfFjpPAadQiJDf/TeNREBUHKQa6hrMS2H08VQGFIwwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IFVoBMHHBjg1EPhbYbWcBaeZnmX65VPADVUksscffTitZY3yWFcG/gZ5ZZLqnxdIExXzazPCnvWecvS3Fq5lMkf7OMhJD8jTh0zexbbT4x3W+f0ABWwEWILqx7nidpuQ8mmpTmxxYtJbrZPAVEDFQNdlaRp7P+sAs/wGFj2lArc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZeZ8VhY4; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZeZ8VhY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716422053; x=1747958053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zfFjpPAadQiJDf/TeNREBUHKQa6hrMS2H08VQGFIwwE=;
  b=ZeZ8VhY4cZOEEKYvW3z38LB+uz+5pki/rdfF58UqXnB2kDrdp9b6iWuy
   ONThAHzn25fOfQyz+xvVkeB3OJmvoORixRSu5u/5PyGE/3WQc1Ut7OtpF
   rT37i03AjzVZR1ISCCmYGmehZbdVUA484IDQna/p4RbYBwoAr0Y/zvd/c
   difHtPdlnLXr7A97Q/fIfJu45zM1BX2PzRyGrMoEq76yuAzbNfPFslges
   Bkb2sK5V7zpxxrSiyg2bfNFxjxCMCBYvi8yHmjY0pdlC6tSsdJX8cbBy7
   09LSvYVLVgBC8G8lThD0mdqk4BVkTQsAn0n8uUNYawtb3coSZbhEdNtQ8
   g==;
X-CSE-ConnectionGUID: URlC9FLEQQCC3iveQDhPuA==
X-CSE-MsgGUID: vrDgjZuxSqKlMgHKllqwEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="38089925"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="38089925"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 16:54:13 -0700
X-CSE-ConnectionGUID: CXeuInAmReKhLlFBPgJtsA==
X-CSE-MsgGUID: 1pDku+9rQMOVuyKBk+irjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="70866539"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 22 May 2024 16:54:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9vmb-0002G5-10;
	Wed, 22 May 2024 23:54:09 +0000
Date: Thu, 23 May 2024 07:53:17 +0800
From: kernel test robot <lkp@intel.com>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 8/8] wifi: ath12k: move ath12k_hw from per soc to group
Message-ID: <202405230757.dDsk7F8w-lkp@intel.com>
References: <20240522095439.2596989-9-quic_hprem@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522095439.2596989-9-quic_hprem@quicinc.com>

Hi Harshitha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 429eeef2ed089af1b3aa1983ec00a7591166be27]

url:    https://github.com/intel-lab-lkp/linux/commits/Harshitha-Prem/wifi-ath12k-Refactor-core-start-api/20240522-175804
base:   429eeef2ed089af1b3aa1983ec00a7591166be27
patch link:    https://lore.kernel.org/r/20240522095439.2596989-9-quic_hprem%40quicinc.com
patch subject: [PATCH v5 8/8] wifi: ath12k: move ath12k_hw from per soc to group
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240523/202405230757.dDsk7F8w-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240523/202405230757.dDsk7F8w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405230757.dDsk7F8w-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/ath/ath12k/mac.c:9217:11: warning: variable 'ab' is uninitialized when used here [-Wuninitialized]
    9217 |         ah->ab = ab;
         |                  ^~
   drivers/net/wireless/ath/ath12k/mac.c:9204:24: note: initialize the variable 'ab' to silence this warning
    9204 |         struct ath12k_base *ab;
         |                               ^
         |                                = NULL
   1 warning generated.


vim +/ab +9217 drivers/net/wireless/ath/ath12k/mac.c

8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9197  
31c9fd320b69d4 Karthikeyan Periyasamy 2024-05-22  9198  static struct ath12k_hw *ath12k_mac_hw_allocate(struct ath12k_hw_group *ag,
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9199  						struct ath12k_pdev_map *pdev_map,
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9200  						u8 num_pdev_map)
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9201  {
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9202  	struct ieee80211_hw *hw;
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9203  	struct ath12k *ar;
31c9fd320b69d4 Karthikeyan Periyasamy 2024-05-22  9204  	struct ath12k_base *ab;
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9205  	struct ath12k_pdev *pdev;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9206  	struct ath12k_hw *ah;
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9207  	int i;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9208  	u8 pdev_idx;
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9209  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9210  	hw = ieee80211_alloc_hw(struct_size(ah, radio, num_pdev_map),
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9211  				&ath12k_ops);
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9212  	if (!hw)
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9213  		return NULL;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9214  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9215  	ah = ath12k_hw_to_ah(hw);
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9216  	ah->hw = hw;
9b4e5caaf5905e Karthikeyan Periyasamy 2024-05-03 @9217  	ah->ab = ab;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9218  	ah->num_radio = num_pdev_map;
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9219  
acaa84009fade2 Karthikeyan Periyasamy 2024-05-03  9220  	mutex_init(&ah->hw_mutex);
acaa84009fade2 Karthikeyan Periyasamy 2024-05-03  9221  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9222  	for (i = 0; i < num_pdev_map; i++) {
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9223  		ab = pdev_map[i].ab;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9224  		pdev_idx = pdev_map[i].pdev_idx;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9225  		pdev = &ab->pdevs[pdev_idx];
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9226  
ba12f08f316746 Karthikeyan Periyasamy 2024-04-09  9227  		ar = ath12k_ah_to_ar(ah, i);
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9228  		ar->ah = ah;
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9229  		ar->ab = ab;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9230  		ar->hw_link_id = i;
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9231  		ar->pdev = pdev;
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9232  		ar->pdev_idx = pdev_idx;
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9233  		pdev->ar = ar;
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9234  
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9235  		ath12k_mac_setup(ar);
31c9fd320b69d4 Karthikeyan Periyasamy 2024-05-22  9236  		ath12k_dp_pdev_pre_alloc(ar);
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9237  	}
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9238  
6db6e70a17f6fb Karthikeyan Periyasamy 2024-01-18  9239  	return ah;
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9240  }
8a742a79f90e3d Karthikeyan Periyasamy 2024-01-14  9241  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
