Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711001096F;
	Sun, 25 Jan 2026 03:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769310231; cv=none; b=Fiiqe+gcV98Cgx4pobHDWxcBsM7eTshOrZarnAhNGEk+59kOAHkoPzajOE33UWsxKNDPQ1AzRlHPxxbhSpgrUr0EW3SPxEPjD85TKanZ/w0wXZm7YA2PbH+PHpLtmgoL1KcIgw7xfndLkMalzlyIEDPi04btCkhSWxHQ3MRM4+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769310231; c=relaxed/simple;
	bh=24Orw5wgg7SHrf63LUnpGGmdk6ohAoBqQ/Ohhvs4tKQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SYRegmag7o9Bsf+DvhtlTtqk+t/anHJnOxiLS2CQSURzIPKOdoLtxGuAZVMy1Ku9H6TUuONBsVDFAiA6h4zpxtQMZaIP03SswbuNXQQ9SxQR7KPNvkaVLn9M2yaqnR8zA70ce4M+k40UfKANnMqzYbtcDD+8tf5NIV+w56guB7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYsqc70H; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYsqc70H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769310229; x=1800846229;
  h=date:from:to:cc:subject:message-id;
  bh=24Orw5wgg7SHrf63LUnpGGmdk6ohAoBqQ/Ohhvs4tKQ=;
  b=iYsqc70Hi9HF0zW+uYB+AADSvJ/jnogLKDe7odbk8VfOCzvsZtr6BwbZ
   oFmNQiFPLxs7rTkyjxdb6DqHdJS4IAmJWRTnb0aOIIXKTAUPBX2pyOGQz
   6rCBIw7CGM5Up9kvmHF6lnG4kgnbgZykiZvbCFosSReJaVBOAmneTMlCh
   ukjt87r8LKij/MT2u4LXH2/KVnjhEM853E7vdlx+67189qjGxYrPxZl/8
   dH1tF5VcL8PttpFDYXv9cgTv9Tp9IL5weJdiSwe08vjPAxDhoANW4c8vc
   vOehhz61TwgycRXEAwh/H7/O3zbwwyohaWHu/ZZr6N5KA0NhWJ+QNyy9Z
   w==;
X-CSE-ConnectionGUID: zQ+NZb1JTPK/x2vR14CKGg==
X-CSE-MsgGUID: 8dD+7VtmRZmvlBej2McJag==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="81235663"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="81235663"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 19:03:48 -0800
X-CSE-ConnectionGUID: qW3g8wGeSpue8KYcMkjTbw==
X-CSE-MsgGUID: zDwYhegET6ihW9M8WCgd7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="211481432"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Jan 2026 19:03:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjqPe-00000000Vi2-2oXb;
	Sun, 25 Jan 2026 03:03:42 +0000
Date: Sun, 25 Jan 2026 11:03:37 +0800
From: kernel test robot <lkp@intel.com>
To: Roy Luo <royluo@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, Joy Chakraborty <joychakr@google.com>,
 Naveen Kumar <mnkumar@google.com>
Subject: [linux-next:master 5740/9539] ld.lld: error: undefined
 symbol: typec_switch_register
Message-ID: <202601251012.3DftRbri-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: cbce66669c82ee9ae0e26523c0fcd3c721fcfe85 [5740/9539] phy: Add Google Tensor SoC USB PHY driver
config: x86_64-randconfig-013-20260123 (https://download.01.org/0day-ci/archive/20260125/202601251012.3DftRbri-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251012.3DftRbri-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251012.3DftRbri-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: typec_switch_register
   >>> referenced by phy-google-usb.c:261 (drivers/phy/phy-google-usb.c:261)
   >>>               vmlinux.o:(google_usb_phy_probe)
--
>> ld.lld: error: undefined symbol: typec_switch_unregister
   >>> referenced by phy-google-usb.c:273 (drivers/phy/phy-google-usb.c:273)
   >>>               vmlinux.o:(google_usb_phy_remove)
--
>> ld.lld: error: undefined symbol: typec_switch_get_drvdata
   >>> referenced by phy-google-usb.c:82 (drivers/phy/phy-google-usb.c:82)
   >>>               vmlinux.o:(google_usb_set_orientation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
