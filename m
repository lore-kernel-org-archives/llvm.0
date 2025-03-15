Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CA71F418B;
	Sat, 15 Mar 2025 09:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742030594; cv=none; b=E1BNaMNtqxu//Aj6xTPpFzbgPTq6qznCHXX/vzOKE1MJQ5XPTLh+Tsn3Q4W2EEQonmoRmk4UNjgArBc4sUeMgW3xBhVEaLFqcTp5JQ21aY1wSzlaogt1WGgYgW4Eq7pyGNVRaOLinTzEBDve4BlnsOPe8gqGMKwSUUp/SrfCalM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742030594; c=relaxed/simple;
	bh=op9MKHAUemxm682WeZxnObuVCXS0UX3I+OA0De0609A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZSjRHODWMfk3+xo11D3xgZoiz3meVRK1Jwda3WVVKsoHpIqXyrot3OZ2DMoXmf/jFEUYuUAkK2+XozYGlKw28JadtlD/YHTwmYJoCltGpwcggG4sflcXUaCQ4fOIYNbcPnSgmNcRF7g1XSIy7/jozy4GHJ6svBqfVTieBQuDYzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gn9ZNXyR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gn9ZNXyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742030593; x=1773566593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=op9MKHAUemxm682WeZxnObuVCXS0UX3I+OA0De0609A=;
  b=Gn9ZNXyRjJUhs7EorLyKuGVm4SpTKAS3s7jhQqsIyW9XPvKN2q1nEFRv
   eDLYcygpTsWgiwAZgoZgu/PRLuQrBfMbG05Mb7KcSPDtJ46srQGi29Ioa
   Y0b4xOSwnYsrOiAk62ZkyfpiWSiodZ6WjLKFGRHe4k8bkdGG+a46aG4sc
   tw/MFHglUVl2IyMdLtL/SGag4a6CVrCWiEk4XZjyfezpj1XQ/7LC0CdCo
   Ur1SVnPqMNhhmnam/tiEnwzx/mKXTdSp0iIbi8a1pkEhN6nRXwADXAUhl
   2QbZhjReG2pRNGfOhXXZnEVGSav+u7otPnchZ4WE7jN7O0sifrhrViiuO
   Q==;
X-CSE-ConnectionGUID: DNIZijBoRnWsFqCkNvlsFg==
X-CSE-MsgGUID: glq1IVU+SbC4/RmFu4cDRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="30770923"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="30770923"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 02:23:12 -0700
X-CSE-ConnectionGUID: 5rim8Ze2QAe/uXiKafxYwA==
X-CSE-MsgGUID: JN6NX8w5QYmnJ1IwE1zjaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="144685333"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2025 02:23:10 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttNjY-000BDB-1Z;
	Sat, 15 Mar 2025 09:23:08 +0000
Date: Sat, 15 Mar 2025 17:22:46 +0800
From: kernel test robot <lkp@intel.com>
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-sound:for-next 85/105] ld.lld: error: duplicate symbol:
 acp70_rsrc
Message-ID: <202503151737.fjJE8DYN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
head:   d9a06936ee9e64952e161849059f6cf096b33e4a
commit: f8b4f3f525e82d78079a6ebbde68e4a0d79fd1c0 [85/105] ASoC: amd: acp: Refactor acp70 platform resource structure
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250315/202503151737.fjJE8DYN-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503151737.fjJE8DYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503151737.fjJE8DYN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: acp70_rsrc
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(acp70_rsrc) in archive vmlinux.a
   >>> defined at acp-i2s.c
   >>>            sound/soc/amd/acp/acp-i2s.o:(.data+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: acp70_rsrc
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(acp70_rsrc) in archive vmlinux.a
   >>> defined at acp-legacy-common.c
   >>>            sound/soc/amd/acp/acp-legacy-common.o:(.data+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: acp70_rsrc
   >>> defined at acp-platform.c
   >>>            sound/soc/amd/acp/acp-platform.o:(acp70_rsrc) in archive vmlinux.a
   >>> defined at acp-pdm.c
   >>>            sound/soc/amd/acp/acp-pdm.o:(.data+0x0) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
