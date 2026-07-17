Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7916A3F6612;
	Fri, 17 Jul 2026 11:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784288729; cv=none; b=d5qoldxvyHovy/qUXxdC6yEspodinhsYWdzsKIrDAOk6diN6ScjQLTtiNPZu/nrpMO9ZmI5JAh+UO9N5YsVFBCheBvtRjdMladOgKeqxZ+Eoaka2TSffl2PdN3k6UIoaOdWyKkIvATZZ9oFZpqKR+GSUQ/d9YA3MnYNe9DcxpZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784288729; c=relaxed/simple;
	bh=aa9u7Oq3GjNW3rNuKeaMW0nAEz8OJRfic1LiWiljdVo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o93MkWsrgbp6XjGaOdtEFMJKhXYYSjIB+xu24zKTJj91rCrbg6qZkhhGhr9p/jvzw10EKL9YYzJHayrZqrktn7Zb046aMBrDO0q4JENBE7uXuQMIukItgI2p469+Bf3K0UjIGP6bOAoJq4asPhJpyFpI90GYtqnLUh1PtBB+elA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKSHR7w8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKSHR7w8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784288727; x=1815824727;
  h=date:from:to:cc:subject:message-id;
  bh=aa9u7Oq3GjNW3rNuKeaMW0nAEz8OJRfic1LiWiljdVo=;
  b=KKSHR7w8vPaQfz1qZ5Ho4PBa/znn4tIlHkKxwS5ATPARfbenV4bz8h8C
   VHuKMV083CUkjTc52L84/RI8KByCn17s6gTXFsdBmxut50h4ExO0qrpQU
   XAjZrF4BO94bZUwBZNSBcCC8vWsfO4es6CeW7bEDasGUFq4rg1mkWGFeG
   jRsMJmr3Tkm+1HU8sK4zAqic2VdrlyjyCCUavhf/sLTEzpDidJ3ZCCEeX
   qL0CS+k/fkEqQaMAHeFmE3ImwjcUe2stOanVUVG7eTMUHMj6PMqTW//Mb
   jr/DVp6dev7gIYwizfIgXswu8d4gCd+z9bYqy6PYU5lOQLNPNNn7khAJy
   A==;
X-CSE-ConnectionGUID: CcB+/LuRStmq0Ba2J2PUUw==
X-CSE-MsgGUID: /b5Ed0EmS5ahl8OBfwf1KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="96471802"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="96471802"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 04:45:24 -0700
X-CSE-ConnectionGUID: 3xLc2rlJQ4qCsLUNjsyv+A==
X-CSE-MsgGUID: rXtSR5FVRAuPrqZcApnMCA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 17 Jul 2026 04:45:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkh0J-00000000ShW-0PU0;
	Fri, 17 Jul 2026 11:45:19 +0000
Date: Fri, 17 Jul 2026 19:44:49 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Lucero <alucerop@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dave Jiang <dave.jiang@intel.com>, Dan Williams <djbw@kernel.org>
Subject: [linux-next:master 1815/7063] ld.lld: error: undefined
 symbol: devm_cxl_probe_mem
Message-ID: <202607171907.Sx7DGEqG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1a1757b76427f6201bfe0bf1bea9f7574f332a93
commit: 0418860ef2ca8ab4e696ce3913fd76660c881c0e [1815/7063] sfc: obtain and map cxl range using devm_cxl_probe_mem
config: s390-randconfig-002-20260717 (https://download.01.org/0day-ci/archive/20260717/202607171907.Sx7DGEqG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171907.Sx7DGEqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171907.Sx7DGEqG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_cxl_probe_mem
   >>> referenced by efx_cxl.c
   >>>               drivers/net/ethernet/sfc/efx_cxl.o:(efx_cxl_init) in archive vmlinux.a

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
