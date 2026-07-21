Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F543B4A2;
	Tue, 21 Jul 2026 23:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784676486; cv=none; b=FN22vHKEsLFGSYT+Vb88iz1GNrxLsT3IvTZc8SUI6iVS2db+VdXpGvvWxEVvqmjwZi7W+BjM9lyvl5RVXSxwbRDmKqjlObJ3t5Ml8D/qx1oxQmGy40Vbus4OG2+YNvMqbyUPEqc/TGXl+xUDp4A3V4HP5qjO0CnV5LBfeOl1Q+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784676486; c=relaxed/simple;
	bh=++Uwectms6xvOuiDhphhymD4j0G3u3/cXPj0Kxs6vts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WrWDcgtuGD4QtwqNK5MYvTL0gz9Wt69edY8XNwvHnWP+gZ0l/pBVyXypdILEyFmBmX3KUfMijF8Z+/w5pzDVFwwaJEvblWIPjms0px+ezfYjTXMbjYPl9+0UthZIN+VU8jMuxS7dpgcW+B1EY56q29DJKcm6UHKY7Xc5X4/GNC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T28xsPgH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T28xsPgH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784676482; x=1816212482;
  h=date:from:to:cc:subject:message-id;
  bh=++Uwectms6xvOuiDhphhymD4j0G3u3/cXPj0Kxs6vts=;
  b=T28xsPgHGBsKfW8wter/LrlTz4zY7YRDSE1QFXqDQIUnNG13qM0OQlEt
   PeFoEYbQrDV3dfSzBDj4LOtP5KsyAKfeb+mE4d0WRkT0cG8eod1Fn0dED
   v9sKNXc6rnUa7bqX0Qq40yPENshqa+rCRtdQNn6wY1/DfjlXBgxgOXgUG
   do6mY+mCcqm+N6n8dRjFnKlxupXncsEqXKoRIfpnebgAZCofMLbtFhAjl
   5g27ciIA2cj6YC7XcYVXeC/a6DYDZ/09KsWRrzht38cShXGzCHCm3POUl
   lWvpMCGCq180UBByf+pbSG/aZjdaLU1cqPa7EzTml7Qq3Yp4sKjQ4C6uR
   Q==;
X-CSE-ConnectionGUID: nUFHUpnNRaq+VKOLS83+MQ==
X-CSE-MsgGUID: F1MS9meCSDOUxLzWcbQ24Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="89188628"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="89188628"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 16:27:57 -0700
X-CSE-ConnectionGUID: EYFVQoPxRGadBm5QHgPowA==
X-CSE-MsgGUID: lheV3xm1ThGYT+PlDARSUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="256119131"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Jul 2026 16:27:56 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmJsQ-0000000009S-0sCI;
	Tue, 21 Jul 2026 23:27:54 +0000
Date: Wed, 22 Jul 2026 01:27:52 +0200
From: kernel test robot <lkp@intel.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: Warning: drivers/clk/clk.c:4152 function parameter 'owner'
 not described in 'clk_hw_create_clk'
Message-ID: <202607220135.MlKf1BFY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jerome-Brunet/clk-fix-self-consuming-provider-module-pinning/20260721-181051
head:   61dbb623b774fc6b9a62db3da18b76dfcee43d20
commit: 61dbb623b774fc6b9a62db3da18b76dfcee43d20 clk: fix self-consuming provider module pinning
date:   13 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260722/202607220135.MlKf1BFY-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260722/202607220135.MlKf1BFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607220135.MlKf1BFY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/clk/clk.c:4152 function parameter 'owner' not described in 'clk_hw_create_clk'
>> Warning: drivers/clk/clk.c:4152 function parameter 'owner' not described in 'clk_hw_create_clk'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
