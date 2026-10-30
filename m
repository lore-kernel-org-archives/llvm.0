Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399083;
	b=CucD1v2n6NXgj0A8v9rL+JzLHmwdbZtJgOWK2pAqd44Yq6vzmuPwit9MyJMxeoS+hzkw
	 mcsaHNJLCa1KFaTlyIQSDJDhekb+Rq9AYCZaY8G89mPMOD1utEA8dnjKAkOtXUertG+Lg
	 ZrMyjnBdmkRqTVGZPQVZWpJjV4tspHGpXa2adUaE8GCIngYq7mYfpEz3CJ+ERXZk3M/uD
	 AgrGaWlVN95T2ytCmaJBtqcXaemi0naI+5PZtjieDGAAcHhR4a3Ajr1OEJYud7imXDwMb
	 vY77UJGodpdVSKrroaj+wfrZBuQ84RaQji+tbPWk8ojf5/C1SzLzPDlMbscUth8lmwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399083;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dSZdAKRabd6XVJjbDaWWnVcGzpWIKlPSDnWrxhwKu1c=;
	b=BlJRPkMTH5my8wP7xzlJ5aHQTmwaTd6b56j+B7vKwuW14dBIGnejQI1rA85SZb3grC62
	 erLKj6y26Zo9TvfpUPqy6/Y41a2kYx67aqSjPDQ5kh2qu1HXh8EbtEdra6dCusIophbUU
	 kbhecCLgipxVOGYvoYAEaS2pEuXOVOa7fpiAUbN0giEQ5Od7hWte1llfTGxl1NgVr/BAE
	 8ONlf6/3LuQ+OGH8vozghUHn0hwP5rYKbAS9VwhwvdhEF/sB3GyTjM2hHe9Kke6T0I6o3
	 GSI/VFc79WkNhknXKhJuy6FqSvJo1E8//+Q2+zIUbWPHsVMuNf2OyZlI7sXfmBTGd1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MTwM8Bu1;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1934606A31C;
	Fri, 30 Oct 2026 22:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1934606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MTwM8Bu1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793399081; x=1824935081;
  h=date:from:to:cc:subject:message-id;
  bh=TpIj0q7QxKBqyM5c8wYXeROoucyqaq4Kq3b4ZDn4l8A=;
  b=MTwM8Bu1eAQbbbq4ixZgcpa5nyw1+ZQbpL6PaXHcv345H1YJgqIYjkiw
   OFPVwZXtL92d37U9x2NqjLBP5nBYFBfUBT6yJYT0X4ht2dHU2gLs7Kgba
   m3DUeqzz+YA7HrnT1bc3oJFfPPYBik51Z1A7S+LYeGesxgJlOGBFverE7
   PAt5DlWuK8yt3l+9DwZX3qksSA5HFV5K07vbP0Klk1FdlpraFY9/aBk6S
   ALPkkpRi+ApWSxbpJRY+C4qvlLsW7FDT9ywym0dW05FMF3rc6pDTmY0Md
   ZYhlCIlloBFELx3oLOeARfhCgxOVcFnDY/+UYp3RJT8TBdjjzkjZs45Uc
   A==;
X-CSE-ConnectionGUID: pSNoahToRtGJ8JdLAhnr9A==
X-CSE-MsgGUID: vfvqRxjpR3iCjtrDdj4L8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2204384"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2204384"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 15:24:41 -0700
X-CSE-ConnectionGUID: tuWsMn3qR/uJsHCI5mgsRg==
X-CSE-MsgGUID: lORM5tshTPWd6hy3GHItrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5519533"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2026 15:24:39 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMv1Y-000000005jP-2AT4;
	Fri, 30 Oct 2026 22:24:36 +0000
Date: Fri, 30 Oct 2026 23:24:15 +0100
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wens@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:sunxi-wip 36/36]
 drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1930:1: warning: unused label 'pm_put'
Message-ID: <202610302318.7gGiv7zc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git sunxi-wip
head:   e8e10ee67982c55fd3900953641c680a2fbef1c6
commit: e8e10ee67982c55fd3900953641c680a2fbef1c6 [36/36] HACK: drm/etnaviv: check if GPU is actually there
config: hexagon-randconfig-2001-20261030 (https://download.01.org/0day-ci/archive/20261030/202610302318.7gGiv7zc-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8f6b51ca8bab1d49006ddaa042bc7e4e7306975d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610302318.7gGiv7zc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610302318.7gGiv7zc-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/etnaviv/etnaviv_gpu.c:1930:1: warning: unused label 'pm_put' [-Wunused-label]
    1930 | pm_put:
         | ^~~~~~~
   1 warning generated.


vim +/pm_put +1930 drivers/gpu/drm/etnaviv/etnaviv_gpu.c

  1904	
  1905	static int etnaviv_gpu_detect(struct etnaviv_gpu *gpu)
  1906	{
  1907		int ret;
  1908	
  1909		ret = pm_runtime_resume_and_get(gpu->dev);
  1910		if (ret < 0)
  1911			return dev_err_probe(gpu->dev, ret,
  1912					     "Failed to enable GPU power domain\n");
  1913	
  1914		ret = etnaviv_gpu_reset_deassert(gpu);
  1915		if (ret) {
  1916			dev_err_probe(gpu->dev, ret,
  1917				      "GPU reset deassert failed\n");
  1918			goto fail;
  1919		}
  1920	
  1921		etnaviv_hw_identify(gpu);
  1922	
  1923		if (gpu->identity.model == 0) {
  1924			ret = -ENODEV;
  1925			dev_err_probe(gpu->dev, ret, "Unknown GPU model\n");
  1926		}
  1927	
  1928	fail:
  1929		pm_runtime_mark_last_busy(gpu->dev);
> 1930	pm_put:
  1931		pm_runtime_put_autosuspend(gpu->dev);
  1932	
  1933		return ret;
  1934	}
  1935	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
