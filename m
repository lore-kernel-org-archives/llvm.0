Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6EA07A13A;
	Thu,  6 Jun 2024 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717659659; cv=none; b=NjbJXKVXd6uYTY4AZP2SsesOGelTY8cw/6mvl3R/G6xCG4/+ToQpOApDN5mxyMgrJBKAQeR6uQR3g8LKieEy3px6X/mvuK3t/7ee9itb8xP7jdUaQn+KBn5GVIHp8va+VobQF+ou67jdehKYdm1VtpqfYO1aKFWtxs/vEnCD62s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717659659; c=relaxed/simple;
	bh=p9KmcvXVI4oH4RTfnFSTTBBT/10NvWqaCeL1FtaavM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8J0KaqadV7dqh/jW3ef/4dwKj9MtG91oOmAPfRaZz5LwcKPdEu5P26oTZzvKXONij7Lar8fblWQXI4E741uav2mv9T7hAFzGDwKeIx3ifGkqfxebhvewkE2WNjoO9sU8EpgWxPYHS8DUxfBIYYkCJLDJ6oy8sPqplAqnIUn5ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GN6QNwcd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GN6QNwcd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717659658; x=1749195658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p9KmcvXVI4oH4RTfnFSTTBBT/10NvWqaCeL1FtaavM8=;
  b=GN6QNwcd/wdIzFGGmvzoPiVBdePsiKEq1tHpz1hvsdlS8dViadZNPF7p
   PT1Itc37axICkQzHCYY6pKEnKOtknb8y9w38Ens4Cj1bER0bhuaDwv4Y3
   04ECUAFdEYDbiQdIeltF34uO4cGEKjNRDKk+y6rAvCA7X5uoWgd5SfwBr
   ZphHegBJaEbiGP1dx6CiSgCZQdJdCPlRXsEu/Tm7gLBt1vEmeSqg09eT2
   obJg93DLmwyVLJ0wvbgaIfVc/RnsjxiQuMo56deBF5ro9b5laTqI4es4B
   SHd9fuxHHTFM6jlRdjKcFt7uTIYlnPeLqkGOR80cIuPTqKJPFCH22+i54
   g==;
X-CSE-ConnectionGUID: DT5uwPriTfiXHiAl3ITSbw==
X-CSE-MsgGUID: W1k2gKRyRxeEyaoVDT3zNg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14445019"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="14445019"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 00:40:56 -0700
X-CSE-ConnectionGUID: ZHrZiG5aTsuteGJbf1Vh0Q==
X-CSE-MsgGUID: cXKws+dIRxumEXgEIt40mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="42973482"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Jun 2024 00:40:54 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF7jw-0002oW-0w;
	Thu, 06 Jun 2024 07:40:52 +0000
Date: Thu, 6 Jun 2024 15:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@denx.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [atorgue-stm32:stm32-next 15/15] make[4]: *** No rule to make target
 'arch/arm/boot/dts/st/stm32mp135f-dhsom-dhsbc.dtb', needed by
 'arch/arm/boot/dts/st/'.
Message-ID: <202406061507.G27lPzhn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git stm32-next
head:   4732b1ffb466c1819ee6bc39da908ff2cd314294
commit: 12ff8e1676419d357c19afc93d6327a136616673 [15/15] ARM: dts: stm32: Add support for STM32MP13xx DHCOR SoM and DHSBC board
config: arm-randconfig-003-20240606 (https://download.01.org/0day-ci/archive/20240606/202406061507.G27lPzhn-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061507.G27lPzhn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061507.G27lPzhn-lkp@intel.com/

Note: the atorgue-stm32/stm32-next HEAD 4732b1ffb466c1819ee6bc39da908ff2cd314294 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> make[4]: *** No rule to make target 'arch/arm/boot/dts/st/stm32mp135f-dhsom-dhsbc.dtb', needed by 'arch/arm/boot/dts/st/'.
   make[4]: Target 'arch/arm/boot/dts/st/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
