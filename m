Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF882FD1D3;
	Mon, 10 Nov 2025 21:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762811265; cv=none; b=cdiENpBRq9fOvJCxOFJjmwkF32O/90BcZvq3C39yU6CLmEQfZ7vli7HY6uKwuW/+VEyL2JcxJpbNEEjSEHgxypTsJMRxaRQ81EEitv65zpMo29cJwMF13VMxmMzBwNtV49h1HRi2AcXll5jyt7z6KZEpyu7GvJLdSxmu+1b8DBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762811265; c=relaxed/simple;
	bh=lUjR9/XOSVKNQBKD7Fu1NcleoRfGe3SyX2ifKsbS1uk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G1dhW2qhDyFkVsAvFBGCroacO7VUitkIsb71NvqKLB8l9Sw866Hr7jOuxu5/l+GsZrb3N1a0YRp1iW5zkrIBmtzvRRrm13+YmgHP4vUfvJh2mHR4eajI51/QYvWh039Dp267We814lDz0SCRFe1KQpd5rN80H3Bv4073MSvG+Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xr8qcY0e; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xr8qcY0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762811263; x=1794347263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lUjR9/XOSVKNQBKD7Fu1NcleoRfGe3SyX2ifKsbS1uk=;
  b=Xr8qcY0euCzf95wN1p81BHrNTNEwGa5XW982uIrtJbosESD0WLUryXs6
   1fVmsjSmoFE3lnJ78D/qqc5cPhd2JlFjA4ix/v5MEnsKNYAteVPsJUUN5
   1z67o8qCD4cHE9AYPBJm4KY/2n0+3EAucH4y5s4T9h994ZeXPJ7ffbgMW
   x/D2YXjnbAIt6CB9NPpcAFZ8mE2PpS1xnvvWeRRQUq7G+yDddKnzwmAIR
   kk2ZINhpLeagZV6Ietkkyo/LSBA6dquVOik+PVzDp6Y3omKX4D07FrSbQ
   wDhvQrpbHcKOkzv7trIEpQ8H8FsFia6No0k+I8SjYJ97+gDgt8BxAfsZ2
   w==;
X-CSE-ConnectionGUID: jXdP+2rRS+O9pRvLxqXq+g==
X-CSE-MsgGUID: a8ll+wxITQmUP1WJhd6y7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64569210"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="64569210"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 13:47:43 -0800
X-CSE-ConnectionGUID: UA1qZuzXQKGuLW4GBb3BfA==
X-CSE-MsgGUID: 4s0mMlYuRJWEEV4MLgpqTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="219434206"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 13:47:43 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIZjg-00013m-2c;
	Mon, 10 Nov 2025 21:47:40 +0000
Date: Tue, 11 Nov 2025 05:46:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jonhunter:tegra/for-next 20/25] WARNING: modpost: vmlinux: section
 mismatch in reference: tegra_pmc_probe+0x5fc (section: .text) ->
 tegra_pmc_detect_tz_only (section: .init.text)
Message-ID: <202511110557.N1ybZ3Lz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jonhunter/linux tegra/for-next
head:   702de7db1549684fe6d990f1e43e0c808d6f4489
commit: 356e7d34047119a7c2a799ab8b7a2c06519ebfab [20/25] soc/tegra: pmc fixes
config: arm-randconfig-001-20251111 (https://download.01.org/0day-ci/archive/20251111/202511110557.N1ybZ3Lz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 996639d6ebb86ff15a8c99b67f1c2e2117636ae7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110557.N1ybZ3Lz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110557.N1ybZ3Lz-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: section mismatch in reference: tegra_pmc_probe+0x5fc (section: .text) -> tegra_pmc_detect_tz_only (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
