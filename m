Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A853450E2;
	Sun, 10 Nov 2024 04:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731213320; cv=none; b=p9ZHUPxM9N4FRDb2sLgPkBhHi9CuvhYzfHVlZ4srm9gvDtouncxFz43KMhmfkPH96KEZp9zCC14xxFLyvBxT8eXqrxlaPu0MaSNJ8gGrm9YUW0l41bLXSqo3ItEXmvM4G8MXxxctRPwRk71roTB90WKwMZkYiPrU0b/SSo1WbC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731213320; c=relaxed/simple;
	bh=4PAqcra8uO1HKG18yQaxFjsng6+vLu82VTE/qpGQxg8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jRLeVViMCiLS3R5uqSUxdXR9elon3kVdXi6DGvos8p/l6K0E9abYUn431r0vOJO96vn8UBP4GagSsOODkGAkVkzCIAGvz7KlES0eurY7Pekt3cWc3uyxPcpg3ahg2jrZdHfzXL5EUNbSPnoQ+B93cykgzBlwyhF6+JcZCWNqycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfQ1uGXb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfQ1uGXb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731213317; x=1762749317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4PAqcra8uO1HKG18yQaxFjsng6+vLu82VTE/qpGQxg8=;
  b=PfQ1uGXbFANSciyo6mZTBmGISomPhAhnftN+pcq/5AhKDkmMtagRdR4I
   iY9p65MElLWbG1gP8Gp/ResQFx5K4n4ZXFAqO67NSNVg/yzPnAZ8RnYHN
   Wp/Asi6e715jlmpTS4LOSqCrF8Z9npCn+37iN2LyJHBtcTUFksy204Z7p
   ikhOHV6zjR7dkHIYGOSo/qLwam8qyB5fuy2Qhpb67dS7SVmeTNDervc7y
   xLYfv71qwpOjZWH1/o9mHhy3+2ZiuenzD4XYqdn9OjBTBmPlWkSBr6DO8
   wwFNf9ySxU3htrFtLitmQYCimwYkT58clsMwBZ6z2R/MGWDpVMygQjhb0
   Q==;
X-CSE-ConnectionGUID: a5yDqlA3SV2ZOAOE8LdHWw==
X-CSE-MsgGUID: f/7mzpHjTFaq9rTXm+Sh4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="30454263"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="30454263"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 20:35:16 -0800
X-CSE-ConnectionGUID: ChxVFcHOTTakTzA0Ox5lhg==
X-CSE-MsgGUID: D4jAg2heROWv6qnD8uUzZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="91183881"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2024 20:35:16 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9zfO-000sza-0x;
	Sun, 10 Nov 2024 04:35:14 +0000
Date: Sun, 10 Nov 2024 12:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2024-11-08 57/70] ld.lld: error: undefined
 symbol: dpcm_process_paths
Message-ID: <202411101237.ftJVl05t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux sound-cleanup-2024-11-08
head:   e9ab69de24b2818ae26f88e606ccea272bfa1705
commit: c1383d0943f0a4626e60faa314a46a23c3948995 [57/70] ASoC: soc-pcm: remove dpcm_process_paths()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241110/202411101237.ftJVl05t-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411101237.ftJVl05t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411101237.ftJVl05t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dpcm_process_paths
   >>> referenced by usercopy_64.c
   >>>               vmlinux.o:(soc_compr_open_fe)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
