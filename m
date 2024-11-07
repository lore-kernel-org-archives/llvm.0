Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897FF1E25ED;
	Thu,  7 Nov 2024 10:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730974028; cv=none; b=h2YySQ/3Kqs6SnRVdT4v07kaPpftw2k3nGihXEDIBZQ5DlGnmiUTfAwEdWmdgjBzGmfKRXkcQtnpnteJQeyDcDSlf3g67b4hNfW+BsXLN2uoJwSO4YhK/OfKR3Q28sDy/cd8WaSE4tavA//9Yjyofn4LbYTa0nVcn4tlgI+gLho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730974028; c=relaxed/simple;
	bh=CQAOe/ttx27jK7zYoVYzShFELpy7A3dInyGcnJfqnHQ=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcuLCyZhKjrRXfM99KgAkX3d8HDtdwx4hcLhEr6ZWjrcjKdpH8dJJv1gP8+fGV/jDFACH7hzHcNukBUm2TI6VUBoA+Ieq4JRzmehj9Fafxp4YRkFRrwfBi0/b9UKmUEwTunI5t2Tzd2HM1//xM2URksk7sBo1IEhF3t2Yb1f8sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJtBQeOw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJtBQeOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730974027; x=1762510027;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CQAOe/ttx27jK7zYoVYzShFELpy7A3dInyGcnJfqnHQ=;
  b=aJtBQeOwUHuATHHg3eYbRrBJi7I3izJ0TdL6hZXj4NwwyaQfeLRWazUM
   6nhphuHKoW6TqnRSPFgk6sdsNlhkJtOxxCDj4qRPkSkZ5gT1qxmUvLy9v
   J0ocCJmwjeepGqIdEyFNBkHHdPNHQr2UikcL6QW4xXnwRzfj59ARWIujW
   jaL9BbL9T6l/mD4Cih6lywY+cGAK2SZjAFknsKf2FUrS//w88jXHSJdy5
   qPVj50euhxUy22Xu0bo9YsA7FoJR1Zk+Hh8rLGsfOnisGHFnFDz7SvyEh
   NeZMAi86h8YRXVxvDWPxs6EUcXzm1MNH6T8aUapuEih+j7/j0//BwMpa7
   g==;
X-CSE-ConnectionGUID: 7Gsps8AORQ6PgQlvS0LUGw==
X-CSE-MsgGUID: i8l4FcSTRcy8cYea6t5Jmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30574775"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30574775"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 02:07:07 -0800
X-CSE-ConnectionGUID: lqUfLGbmTziOyZBbn4T2bg==
X-CSE-MsgGUID: Gb0OktWLQIWuvd4tBzP4Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="84570110"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 Nov 2024 02:07:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8zPr-000q5K-1K;
	Thu, 07 Nov 2024 10:07:03 +0000
Date: Thu, 7 Nov 2024 18:06:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [peterz-queue:x86/kvm 7/11] arch/x86/kvm/kvm-amd.o: warning:
 objtool: .altinstr_replacement+0x79: unannotated intra-function call
Message-ID: <202411071743.HZsCuurm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   dc414cd768dce496fe3a5dd19255b78fe54d3eb7
commit: 20aed0ae53569706c86e14b9fbcca252ec169e73 [7/11] objtool: Convert ANNOTATE_INTRA_FUNCTION_CALLS to ANNOTATE
config: x86_64-randconfig-075-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071743.HZsCuurm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071743.HZsCuurm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411071743.HZsCuurm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/kvm-amd.o: warning: objtool: .altinstr_replacement+0x79: unannotated intra-function call
--
>> arch/x86/kvm/kvm-intel.o: warning: objtool: .altinstr_replacement+0x62: unannotated intra-function call

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FB_IOMEM_HELPERS
   Depends on [n]: HAS_IOMEM [=y] && FB_CORE [=n]
   Selected by [m]:
   - DRM_XE_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_XE [=m] && DRM_XE [=m]=m [=m]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
