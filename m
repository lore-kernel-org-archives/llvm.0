Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B33BF1D4337;
	Sun,  1 Dec 2024 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733061875; cv=none; b=GVOzXINXnnZW2zcDLwT2evuTs9fMhlVBLSsFviEmxOtHZIUbEwPHeRaRalRIBDRiZVeyjcvzjT4GKNYK4EX5o+azfiWzI83yY+padkSno98CHJsoASgcB1Xrc/DoGgoow6gIKg1uCyOZGuQ9QR/nh7P8jSVIDCT8EqmMzYoUU2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733061875; c=relaxed/simple;
	bh=VpIBwsR24ML9IUv+PVCxbZyA/aRA1Ka5B3mTy5p1oGM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kGY0ZLT35a35JfI/bzFRGe1yyickCyPXfA/qm9fIQ6g53r6LaKXsjelIwxF/tvawu9EhotFl1lWS0fSlU37D2j0nr7h1sNds0l86EMOOKO3K1abfu4S7eeipc1Fb26/dw++gfaXL7BK0NZYZ7NxWO4uaG5Cm2jL0+m+8kgeriDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvc4UrNE; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvc4UrNE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733061874; x=1764597874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VpIBwsR24ML9IUv+PVCxbZyA/aRA1Ka5B3mTy5p1oGM=;
  b=bvc4UrNEjWc5ZOODHls6cvB/l2X/0t8vfnHwOHMmmXatcEOqK/+9aGPh
   niY23Nl8PK1DegYZKBV98YQsu5sj6/aGJBMU2NQsceNuSQ0tFgOJXlGJt
   QBpfbDw91Ie2w+qTVKTDNl87f10FwM3OxdDrcxSJhZaNCxo8y5o5tS72S
   I3dsMrXtIcGQClKU3GqnVzn1/FuOpqb778Om8CKac7BcWYdXGL4W2q2T2
   zAiFQSM3w7/lB+ecpqF4E/KhSTLVEi12TkwFHnZWRFATHTNIY+9NFXHu+
   yn8dlW1gkg1GmBActb/fpZCuPdRjFQbaj8EmMGYjO3KY+0yk5aiTxTM/P
   w==;
X-CSE-ConnectionGUID: jekuafFUScif20xOPGSo9g==
X-CSE-MsgGUID: /zq4caiCTdasXMqVpfie8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33105962"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="33105962"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 06:04:34 -0800
X-CSE-ConnectionGUID: i9DkVg3HR++dqowuGeD2VA==
X-CSE-MsgGUID: EcblWCdUQ56eTXvcw5aqQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="97835501"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 01 Dec 2024 06:04:32 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHkYn-0001Zw-2Z;
	Sun, 01 Dec 2024 14:04:29 +0000
Date: Sun, 1 Dec 2024 22:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>
Subject: ld.lld: error: unknown argument '-dp'
Message-ID: <202412012119.tcZO7su9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: dd3a7ee91e0ce0b03d22e974a79e8247cc99959b hardening: Adjust dependencies in selection of MODVERSIONS
date:   9 weeks ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20241201/202412012119.tcZO7su9-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412012119.tcZO7su9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412012119.tcZO7su9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: unknown argument '-dp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
