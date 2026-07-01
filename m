Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243CD4B8DE8;
	Wed,  1 Jul 2026 18:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782930153; cv=none; b=ns+wQ9EeodZ0heVIhS2V1tEgdzmX9ah3uQtCtifVRmZW8UVNAFBYqL0djde0xnU0u7pYm3bCsbnq1TIEVwioWSpyZItejix3SRmFRqFup/2oN3qikoS07ZgwXOQb+QYR9Q6xBBjb7An6LY+5MM7Hmf8WoWgujyWjSy5ULLESpv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782930153; c=relaxed/simple;
	bh=1fEoa3ftufQUq+AZS9eSLDV0M3IUbfKECVHRYA4aXfs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NJ/v7HEjewcV19kohWtyE77kmc6N7pYv2igmIhV4F/hWEhlA9qMdWdqZ79yImau9M2Zen68yDX8G5ilvi1Tr6aQqqW90SEQsfu8zrEdqwLQFP/Eyh+yr15cAETEeAnU0voR8TDhlwPD9AqUlRb35ZTLnxtkpesR67sp+c3APVDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mNquHfve; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mNquHfve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782930152; x=1814466152;
  h=date:from:to:cc:subject:message-id;
  bh=1fEoa3ftufQUq+AZS9eSLDV0M3IUbfKECVHRYA4aXfs=;
  b=mNquHfvesz5DtmIGAvrOUWxww8GXhHSnQyPgHaF6fLpLIZQlpXbasdPM
   e/q336h6bA5mURGXHzpk4p6OBIrE5N6KF0+r3TES+S4wbAqT1Cxh2kY3+
   4vNbNmuebVTs+pPEM3hHH5iI+2mZDkFbM+zj9dY/TSxhRtmBjPexvsmWu
   6oZyLIgHC4eB7sjn2SSvccKTyaCaG24nSW5G9mV9EYV3Eyx69rhlxI4w8
   23fpzYtMlZowtWXItI4DdbXHG4QmZOA7nklZ1fweGVuo4WD0F+DQoY9Cz
   sHQcQHnIIM6g45SguwwDQmEjILorEPFl9nkvl784CvUKG/ryPrssnF1Ag
   g==;
X-CSE-ConnectionGUID: 3zC38OjHQPaOwq8ccrS1/w==
X-CSE-MsgGUID: W8Yz4DrhSh+8kmVMw2+UJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83450587"
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="83450587"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 11:22:17 -0700
X-CSE-ConnectionGUID: 11bbxiE6Sxq3Z+04b0bsgA==
X-CSE-MsgGUID: 5rSt3mNzQCus4X0DBwAwsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,142,1779174000"; 
   d="scan'208";a="249991802"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jul 2026 11:22:15 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wezZd-000000000rB-1s97;
	Wed, 01 Jul 2026 18:22:13 +0000
Date: Wed, 01 Jul 2026 20:21:55 +0200
From: kernel test robot <lkp@intel.com>
To: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: drivers/net/ethernet/intel/i40e/i40e_main.c:14261
 function parameter 'lock_acquired' not described in 'i40e_vsi_reinit_setup'
Message-ID: <202607012033.6QDAWbzs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Maciej-Fijalkowski/i40e-unregister-netdev-before-clearing-VSI-on-reinit-failure/20260701-204739
head:   cfa21b49060a99436d8fce660a5dd43e93493011
commit: fcdb1a0b20aeead066836ecdfcb14e228348173a i40e: avoid deadlock when calling unregister_netdev()
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260701/202607012033.6QDAWbzs-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607012033.6QDAWbzs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607012033.6QDAWbzs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/intel/i40e/i40e_main.c:14261 function parameter 'lock_acquired' not described in 'i40e_vsi_reinit_setup'
>> Warning: drivers/net/ethernet/intel/i40e/i40e_main.c:14261 function parameter 'lock_acquired' not described in 'i40e_vsi_reinit_setup'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
