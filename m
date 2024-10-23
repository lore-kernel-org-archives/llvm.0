Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4871AA79A;
	Wed, 23 Oct 2024 11:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729682931; cv=none; b=ANs5zqSsVvU+YA/U7RAJhejCkvSMAuaVSbsyszxbkYksByk31REYbIArbN3oddyMFL1+KLScNnWrXjwLikTsNn6Q3d2EkrtYKotfVm0yIQV0Xb/zvvbcykpqOPA6EH/fKW5KiHgoS6zTqvxUO74BuDETKbMZIgAsqdD8JB8ll1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729682931; c=relaxed/simple;
	bh=1QRLW+A2H2h6//svRLsPCuuR+Cn3q5Q38St7KZIK58E=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=USme9MrGmhhTIA8V3e+bNIIyX/tM8MpCHChSCA5pAR7agJ1KPqgsPOBbwND+GyJ3UVM6iyN8+rBQiXwYYfLwGWOgtSc09aG2agizhjzX5IIn4286aR19mbf4x/vOGjgY7HfFVGSvskaHMAefdTrdnGMS3ed3uTC+hoFokkkX6+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VgbsCeqW; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VgbsCeqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729682929; x=1761218929;
  h=date:from:cc:subject:message-id:mime-version;
  bh=1QRLW+A2H2h6//svRLsPCuuR+Cn3q5Q38St7KZIK58E=;
  b=VgbsCeqWrc3NNEqqsx1RBfxaDU3ODofQnAHnAKuGD5iB3nu+FI8nCDq2
   w+ouhV4Cl7PFJSAJ578YugEUT+TOokHhEMW9eLkTTux2s7z0a7e8vwqVl
   9Spvdgo7tQrW/68UWg1MRX4QPlm4+OowR2Cbq3uritoNoYLDI1oQAZui2
   BeBqvyg1hYnrkq1rS6JevhFCeLCug+7MvARP3HYgYlsy1FLaVvatrwZy1
   oZMS4CvuWS4Stq8piEqOzpnatwBKNs1JY4KtuR28ePzWuqJT4eipi4i3D
   p7mJ8uhMQ2j3L6Eyve9GESNuves9JODbp0HifChIrA6hxCdpFXgd9lWPQ
   w==;
X-CSE-ConnectionGUID: OXKime9hQQ2zzM+vBHUY2Q==
X-CSE-MsgGUID: XfDVuCd8Rv6HHVeIRJS/XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32961881"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32961881"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 04:28:49 -0700
X-CSE-ConnectionGUID: IPlAOh+0QIGW9EYNdFx9SQ==
X-CSE-MsgGUID: lgL6+R7QTmiH+Keb99MnZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="80585902"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Oct 2024 04:28:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3ZXh-000UqQ-27;
	Wed, 23 Oct 2024 11:28:45 +0000
Date: Wed, 23 Oct 2024 19:28:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: vmlinux.o: warning: objtool: .text.cdns_mrvl_xspi_setup_clock:
 unexpected end of section
Message-ID: <202410231922.dqnvZiMb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Witold Sadowski <wsadowski@marvell.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c2ee9f594da826bea183ed14f2cc029c719bf4da
commit: 26d34fdc49712ddbd42b11102f5d9d78a0f42097 spi: cadence: Add clock configuration for Marvell xSPI overlay
date:   3 months ago
config: x86_64-randconfig-076-20241023 (https://download.01.org/0day-ci/archive/20241023/202410231922.dqnvZiMb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231922.dqnvZiMb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231922.dqnvZiMb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: .text.cdns_mrvl_xspi_setup_clock: unexpected end of section
   vmlinux.o: warning: objtool: .text.amd_set_spi_freq: unexpected end of section

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
