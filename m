Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42573C30;
	Mon, 21 Jul 2025 05:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753075677; cv=none; b=N8l//ZRBocaLT0VJsrCvn1R4r9Wwx7gmJ4sf+f1ctexIzJpLJ/yM1zUVZaPfffXoFvSBS+1QX5zxEHbqHjk6VEXpXUEAYvvag6eiQWAYJ0UzWadNaGd//6E3+o10rMb5f80P8hlw04AmXHhmKixkXnQ+RvUBI8sq4VBCouOcX7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753075677; c=relaxed/simple;
	bh=Kdiau6FOhJSlqj70ajOXhFUPdz/g2SXHUhkFQkLI/gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FJSGwMH3hDhigBbcz8CM4RmME2Kw1gy1sdO5hfhd+pFOv3w0GB21U8Uswo44zl3QdcGVrS8dXSOQAIg800y7hDMl7ENBsRjh/7wHDXg/myiF1Z+Jlw0HhWIZiwDrr+VQCrW6XfnoONqaTn42epRIMp7p54ExvlSr6FzmLGmzXdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LYb/EZSR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYb/EZSR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753075675; x=1784611675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kdiau6FOhJSlqj70ajOXhFUPdz/g2SXHUhkFQkLI/gc=;
  b=LYb/EZSR0TdcnaiAYwhJ0sT0kXU8niPYCA6746kcVfVNGBoCAXRLx1Bo
   uug586/JBpWd30rm9iEZwvrwKFIVfoy/GSnVWXMw1KojOHMpwSkQgNYx3
   p8WVjvEACz7LOgnkNfnTeFAf5lRWZ227IkCJSgSwE14HOP5FzayiaU/ws
   VPlj/O9ghoIvkvht76XrFoQ4Ay2gReeCu8UcJaNWrVuSgkr/n6883rZth
   lHZ8OES3UbZvHsbVATvHGTe/E+ZCCYTnty8wxgplKorMKyrx4d4aAzKjZ
   x64JrRD37Ijycy6dhYtm5hAhe0ZrPiW0kvZVdQLbJUwARCeHKEWhZ68vJ
   Q==;
X-CSE-ConnectionGUID: S9GiNaxfTBuKDKeXeXek3Q==
X-CSE-MsgGUID: eJgvYuihR9SvMUSX+WStwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="77817774"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="77817774"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 22:27:52 -0700
X-CSE-ConnectionGUID: TLvgiIi7Th+NCi5VIKVbVw==
X-CSE-MsgGUID: gBwd0GXzSWGWlnHyYjaRNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="182440572"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 20 Jul 2025 22:27:50 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udj3z-0001LN-1t;
	Mon, 21 Jul 2025 05:27:47 +0000
Date: Mon, 21 Jul 2025 07:26:49 +0200
From: kernel test robot <lkp@intel.com>
To: Samuel Zhang <guoqing.zhang@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mario Limonciello <mario.limonciello@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>
Subject: [linux-next:master 7967/11307] ld.lld: error: undefined symbol:
 pm_hibernate_is_recovering
Message-ID: <202507210727.vGfGoii4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d086c886ceb9f59dea6c3a9dae7eb89e780a20c9
commit: 530694f54dd5e097866999bbaebc5c133e5507b6 [7967/11307] drm/amdgpu: do not resume device in thaw for normal hibernation
config: powerpc64-randconfig-2006-20250721 (https://download.01.org/0day-ci/archive/20250721/202507210727.vGfGoii4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507210727.vGfGoii4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507210727.vGfGoii4-lkp@intel.com/

Note: the linux-next/master HEAD d086c886ceb9f59dea6c3a9dae7eb89e780a20c9 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pm_hibernate_is_recovering
   >>> referenced by amdgpu_drv.c
   >>>               drivers/gpu/drm/amd/amdgpu/amdgpu_drv.o:(amdgpu_pmops_thaw) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
