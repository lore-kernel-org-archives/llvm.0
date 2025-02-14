Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646AC2C80;
	Fri, 14 Feb 2025 03:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739505014; cv=none; b=VGrspn2djLl8BLHYipwNk0YKelYxit2XOdwIK//klP/tPtSBQr0+OTfWa+2oC+drI3cO6VRzQVyqWidUCfSqfKO4YsokutthadKaePv+hm2o8m1w6muY0sLWoEoa76r9y0QWou1JQbOdz5VkMuuF/7WuemiaqLB7pWreuTruElU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739505014; c=relaxed/simple;
	bh=EYasQJ7/s+cNL4uT7U/a5alqW7L3/5PGY2NYy7i6J3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bPGFsihguinscY0Xbw91XyEqTP/cTBL8VkerbA9ghaf9BFqambDic/StJOk7FQ5V36reD2aYHCwN6DwWjxUh6sC3ZVYYqALJxuicLihpmLXn7VuWXdPBzs2ohc6m7dShhqBQ35XhdK18OEOckQMw7f3oNfqSvk6C1jxnpC4VN8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cB7hym56; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cB7hym56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739505012; x=1771041012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EYasQJ7/s+cNL4uT7U/a5alqW7L3/5PGY2NYy7i6J3I=;
  b=cB7hym56/QJLO9C2FuLB7uEj/d6v4WaBiRtdzOAFO9TMlcBfuO/q8gig
   94afgpNrKgooc+Vl/OY+Jmpr5xGZzJMiiAq+SpjfYyUP+7iXbauorCISb
   XDYZ9ugXUVQoHSUtY38EGy9wUPWEgrfoeNad74t5TqczceW/QxAjkkCj/
   Oma/+XBM5/nZ0dwpM3W7LZFFN0WDcRYsOoV1YHaNrpqkSXyIk9tbAFeID
   eky2ocTByrAVJp3lNVZHlaglp1c/Cp1XnTm4QPPgV/08lgxp6gNP4wUwM
   fcIlKZKsWNkzhWQKicuP1hewzxxdpEAFcdu17u1WE8MT/0H9/35AR5aje
   w==;
X-CSE-ConnectionGUID: DgLLfE+WRjSvMq2MmVdsgw==
X-CSE-MsgGUID: hdkxCp3iT56HWodRfB5TfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40356763"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40356763"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2025 19:50:11 -0800
X-CSE-ConnectionGUID: IYe9OVrBSXOC0ZV0J0e81w==
X-CSE-MsgGUID: l4ZMjKChQECecCp0MVOxoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,284,1732608000"; 
   d="scan'208";a="113865561"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Feb 2025 19:50:09 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1timiN-001925-0v;
	Fri, 14 Feb 2025 03:50:07 +0000
Date: Fri, 14 Feb 2025 11:49:19 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/150-xhci-firmware 2/2] ld.lld: error: undefined
 symbol: asmedia_xhci_check_request_fw
Message-ID: <202502141131.JVoMrjZ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/150-xhci-firmware
head:   e637de85f671113085608cf458a5233a37448cbe
commit: e637de85f671113085608cf458a5233a37448cbe [2/2] xhci-pci: asmedia: Add a firmware loader for ASM2214a chips
config: x86_64-randconfig-003-20250214 (https://download.01.org/0day-ci/archive/20250214/202502141131.JVoMrjZ7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502141131.JVoMrjZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502141131.JVoMrjZ7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: asmedia_xhci_check_request_fw
   >>> referenced by xhci-pci-core.c:550 (drivers/usb/host/xhci-pci-core.c:550)
   >>>               vmlinux.o:(xhci_pci_setup)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
