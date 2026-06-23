Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7B236F90C;
	Tue, 23 Jun 2026 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210354; cv=none; b=ifZwyvAkXYzSbaSAlCT3xl5ZoQr2e5cZzVF3gRKe1spBgDyoTarAQmDP2pxImnyI/MgYrlSu39UlbJvnEtWcs7920Tb4hnq2qluCMWw1ujs5Vs6EA7WLzANRgTN2FQSV9TnpazyofnLKg6hHDTfMvNzhQr++hh1RVrECvYEH8OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210354; c=relaxed/simple;
	bh=70k28qxkh8Vn3jnSh1Xomvc9W898LcVslRV5O24EtG0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gmRIprM1n79z2ilEMSFZxA7Gpb+SFwDzrbRJBqe7QRnv9ekr0rPaVZ/tLkalY2b/Rffl2wRS5dVc5bJ1pA10S17ZAj60pMjOAmUoKmQpi0AjP1sJ+Ch6ll2ETdGuYjb5zPyRx+5Y07GvQC2qYYZzRLOtgsxgcZJIfmpkwHMsq3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ol86A16B; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ol86A16B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782210353; x=1813746353;
  h=date:from:to:cc:subject:message-id;
  bh=70k28qxkh8Vn3jnSh1Xomvc9W898LcVslRV5O24EtG0=;
  b=Ol86A16B/qkaQOc9vow0jvaI78YTREo6RcFfQ53dkvkyVw63Wa3vmmNr
   Y7bUob8Ev67899qDaMSQsehBMObtCNpqyYKlFL4uM3cOwmsvw1m5YPPbx
   4yQDzKcwkvzYKcjfDMgzXPmOYxafu6Uw5P4ukGmlJLtkxTxd7TfhXQ/rS
   jMNobw11HYBGWb4aOWvJ0Kk3FftL1sdoruRtXrBue15HKMfrcsZR1fDIt
   EuykN7F8utkoPzY40//K7Swrq+gWu0zQelNXd9METx8XFcTNoZu7N/PJ/
   JFt/ueGMTvbiYg6d+6JS270cgLemz1qCN9shm/OJGPbustvAKyOZ0bmWe
   g==;
X-CSE-ConnectionGUID: I1Z/UeTiRz6c4M6GaVWxXw==
X-CSE-MsgGUID: BzzM6sh/T/iwV8P5mUrSYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82953963"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82953963"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:25:53 -0700
X-CSE-ConnectionGUID: rMV4GMKvRfyBRbk2XypXpw==
X-CSE-MsgGUID: QLgYbsGXQJeCfANCKgvULQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="247139406"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2026 03:25:51 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbyKC-000000002R3-1Ugm;
	Tue, 23 Jun 2026 10:25:48 +0000
Date: Tue, 23 Jun 2026 18:25:12 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:cleanups 36/36]
 arch/s390/kernel/trace_clock.c:11:9: error: call to undeclared function
 'get_tod_clock'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202606231815.JpSqjjvB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git cleanups
head:   759e4e4e18f43902ea6f66c481a45175490cad0c
commit: 759e4e4e18f43902ea6f66c481a45175490cad0c [36/36] treewide: Remove asm/timex.h includes from generic code
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606231815.JpSqjjvB-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231815.JpSqjjvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231815.JpSqjjvB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/trace_clock.c:11:9: error: call to undeclared function 'get_tod_clock'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      11 |         return get_tod_clock();
         |                ^
   1 error generated.


vim +/get_tod_clock +11 arch/s390/kernel/trace_clock.c

29eb8a7b6e3bfc Sven Schnelle 2026-05-21 @11  	return get_tod_clock();

:::::: The code at line 11 was first introduced by commit
:::::: 29eb8a7b6e3bfca74a9077304b08d42274cbb4d6 s390/tracing: Add s390-tod clock

:::::: TO: Sven Schnelle <svens@linux.ibm.com>
:::::: CC: Alexander Gordeev <agordeev@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
