Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA218212B34;
	Fri, 10 Jan 2025 15:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736523451; cv=none; b=cDbG+9J+I/8IwoFzVmimiTgyVq2jQbbx3vK4W6kN1PGNvu+9uUp957IrjlPl3F+Ivson4VKpogCtVu1wOZtPt7r00GFYZzFjcaR37bsK0yHfGUAg/LSdbwuKX5FUWb+Yz6wegOoBMQ7STSl/pADzAGm1KQ0EtEicERXrRvNDROs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736523451; c=relaxed/simple;
	bh=BXcECG+FGhdIqa1JzBY7GaDd4Uc/vc8a982TaEb8P5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aunsi6R1Z2ObjjcAfjPIl9YynH3dgVRMLx8TVMLOyOSFpANI/8UDiK9ovyKnTZPc7Nk9WgODrNGwVYpt2NekoewNvkg88QtL6E+Mo8TwHl+k80fFFWS2Lp5CoU3bpldihW3oXOxHv/8bQADQb22ky0wBoSv1dSYimyh6IUl5C9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQwiIF35; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQwiIF35"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736523449; x=1768059449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BXcECG+FGhdIqa1JzBY7GaDd4Uc/vc8a982TaEb8P5s=;
  b=OQwiIF35gxWkOYHM4TabXIjMQNAPB59ycBl8vMMykpl81jQi+SvXH2uS
   kbwXoheq0mh/fSl2pScnYBmxo+7POMyx3ryZmlP2gWFoq0hNy/pL3wZch
   U3NelDJbugUY7i9E2lLIES+xFXK5ufO2mHXS3RDv9mkUBGzvSYJM0suHz
   V4WVo8F73ossZZ0u3FTAPOLsXUwtOvFBsIwFgeJcqXOe0wStFiwRiFuTv
   BdmJrI1EPTiKmjpwAs/KqfK3m7KBSZ3OslLejCAWfLJwsQC4QfgQLoLVO
   nQBYzHAv1e6juNwnhLnKKPaoe5e5/k59WQ9kbTy9XfGmCoqbWBJxMEMMU
   A==;
X-CSE-ConnectionGUID: xSJvQivJSvWk0f7z1hBt4Q==
X-CSE-MsgGUID: Thd4Jbe5RQuDJRs9a2mEiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36707427"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; 
   d="scan'208";a="36707427"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 07:37:28 -0800
X-CSE-ConnectionGUID: sgmr6xUHT/Ov7jygabRvDw==
X-CSE-MsgGUID: nPc4IYk6QUq0r9wZYpnCrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103643423"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Jan 2025 07:37:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWH4d-000JPz-0M;
	Fri, 10 Jan 2025 15:37:23 +0000
Date: Fri, 10 Jan 2025 23:37:06 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Narani <manish.narani@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Piyush Mehta <piyush.mehta@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 333/504] ld.lld: error: undefined symbol:
 dwc3_host_wakeup_capable
Message-ID: <202501102350.cOg2PnQO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: 852fef317cff07d1feee37e7d6ae013b9da7394e [333/504] usb: dwc3: Add power management support in DWC3 Xilinx driver
config: arm-randconfig-003-20250110 (https://download.01.org/0day-ci/archive/20250110/202501102350.cOg2PnQO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501102350.cOg2PnQO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501102350.cOg2PnQO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: dwc3_host_wakeup_capable
   >>> referenced by xhci-plat.c:0 (drivers/usb/host/xhci-plat.c:0)
   >>>               drivers/usb/host/xhci-plat.o:(xhci_plat_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
