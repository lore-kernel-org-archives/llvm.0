Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2BE223E78;
	Fri, 20 Dec 2024 22:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734733225; cv=none; b=jR60Ep2FNHJrxxgys9Wpj/KdI+3N1V9f1fAYDzYU2to/70wubq8HmRIlW/mD0yuxPZTcZuPly0zqG5F2LyvGdtA7lvF8MoizwULlly7RkPLpM5vLyhDm3pjverlEjjQQ5i7t/cHKjYQKz3z/z85mWBRtObHSpISrEuIP91ChIOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734733225; c=relaxed/simple;
	bh=RKJtUvqx+20g/B4pM/qb2d3twiPwIuqxNbOFvInV9oU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uP0OzwieqafzU8A2cF7rxZMLm+alWMmEMDzaU0COHEVOcWqFVea++CIQOx8bnNH61m68qGH6NPUD+T9VmvZzSaCUg6NNe+Aoyqtw2Z9zTGpPaI7u3Q8TOfIWZMhe8h13rzcLhLoFKUtmEndWfgOmzWjdm8fZb+Te1HUfmIj+hmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maCWvAB8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maCWvAB8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734733224; x=1766269224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RKJtUvqx+20g/B4pM/qb2d3twiPwIuqxNbOFvInV9oU=;
  b=maCWvAB88vynQ0mD8OiWUTS+8+r9RE+LJ1U+Sl3FuBIDbOi5np1eqAjr
   8KIYr1s++zZDpHXxxQ42eYvaIHOT7SaTaxMCuld15qjObHThALxE2TAgR
   hPFMgQQf4JBICmcrLc42SEv3wCDIju6MqK62yg/nzzDbC8nUvEBwR0vVN
   pwKqCDhNXCiplkvmWvhShaFMooX11nNYYB6DGJ6Bg/YVD4K9PI345UBXm
   4eP96ma2VF21xDXsgE1SdI+O2Ux5HH7bybFx0Rw38alUI0Kt3nLBqfCli
   FqGv1auMD5KZuAuXG91MoKqT1KZk5tMRdYTz9OYpMnVY+yMN1W11VnaMq
   w==;
X-CSE-ConnectionGUID: Zbkr/Sr6SQWBj+YYWzFyvw==
X-CSE-MsgGUID: pHIn3rKKQ1O35D8wW+d/eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="35437741"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="35437741"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 14:20:23 -0800
X-CSE-ConnectionGUID: Ggo2dqd6QT6GotfRclNzFA==
X-CSE-MsgGUID: Ug35xQvDT32RDSIF23t+Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121908580"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 20 Dec 2024 14:20:23 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOlM4-0001i3-0Y;
	Fri, 20 Dec 2024 22:20:20 +0000
Date: Sat, 21 Dec 2024 06:20:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 8/9] ld.lld: error: undefined hidden symbol:
 kaslr_get_random_long
Message-ID: <202412210648.1oUJrf50-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   3b9b64db6d8de0eb1d3af75bba5d1b3c8e9f750f
commit: 1fb505b57c8826d302ab87f25887d561891c2518 [8/9] efistub/x86: Refactor decompression flow to prepare for zboot support
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241221/202412210648.1oUJrf50-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210648.1oUJrf50-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210648.1oUJrf50-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined hidden symbol: kaslr_get_random_long
   >>> referenced by x86-decompress.c
   >>>               x86-decompress.stub.o:(efi_get_seed) in archive drivers/firmware/efi/libstub/lib.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
