Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4414139E176;
	Fri, 15 May 2026 20:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778876578; cv=none; b=e7wCvcFXUn4vF1ZvMMU/4w6UAFyLId/w+MxsZPsH6JTbm1VLQYJmHlVrpCuu3KSVSlXtFkE5TAhXJsf5Hr03ivpvA+Ax471sZ89Cvsf9PmUwpRKFWywKUJ/y8ASh2kYz6kzKRC2qkUky4vxKS2dvso5OssnmF6YE6BZhzDj5gYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778876578; c=relaxed/simple;
	bh=NR8lEENnflYmx0r+MGEBYk5JaH3ORr+toVyxc/Erksk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gdgaqDbiR9us8MsATx0+WVolfg22KgL7R6NLh7swjKEN55OPlE5i8C7j2OWkw6evAlNSdzDqu7kJiU//DWhZnBelzJ4IFdkf3eQZEJt9S0jQQume5FHpTeU2YQgAP8BykvYhKhPSqf4e1ba8DPQdTr65Cf3EvyBeWjDaTEAzJ5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnizZOHk; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnizZOHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778876577; x=1810412577;
  h=date:from:to:cc:subject:message-id;
  bh=NR8lEENnflYmx0r+MGEBYk5JaH3ORr+toVyxc/Erksk=;
  b=cnizZOHkhA7zN7acqN5pwooyQEb16ZF44ENsTZL6UKLGeTpjPnvgvMeY
   MUNDQ7sKf4SgwLqcBZRLPVulCMVGbb0JOXFqRvxdLbr2SJhB7/pWoQX3H
   dBE/2J6QHm6IOArIP9PCSRWv9QOY6LxrWpIyMehYonfcYi1jHfy9jFCMq
   6ZvbJWhj187FJBXV05Ydua5zhC1PTXyCmWpigpTXIrgPMlJxF3dXZdCnG
   2QBFMAdoh2v5YOFTJIfp/e7CwirRcWfbu+x9QvyG9eScxto9B/UECRw16
   4pPZoxQL0N4MMReivIYQGoqxeoeLjFtgmOcpgEaMAYZg1DhxwUKBLcc2i
   w==;
X-CSE-ConnectionGUID: Jc4ULhIwRiuPo234k9X7Ew==
X-CSE-MsgGUID: 3laoVSoEREOdQTHnfDYQNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="79815387"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="79815387"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 13:22:57 -0700
X-CSE-ConnectionGUID: IuKOkHLPQjSV3BS0rqg+ZQ==
X-CSE-MsgGUID: q5dPJyRSTbyuK0yimhoukw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="237799938"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 May 2026 13:22:55 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNz3c-000000002hF-3YOD;
	Fri, 15 May 2026 20:22:52 +0000
Date: Sat, 16 May 2026 04:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Hsu <Jeff.Hsu@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sean Wang <sean.wang@kernel.org>
Subject: [nbd168-wireless:pr/17 37/37]
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:36: error: use of
 undeclared identifier 'device'
Message-ID: <202605160430.xVOhHhWF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbd168/wireless pr/17
head:   b0f5b3976cca04fffdf61e07483536cef5baa39f
commit: b0f5b3976cca04fffdf61e07483536cef5baa39f [37/37] wifi: mt76: mt7925: Add coredump callback in pci_driver
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260516/202605160430.xVOhHhWF-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605160430.xVOhHhWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160430.xVOhHhWF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:36: error: use of undeclared identifier 'device'
           struct pci_dev *pdev = to_pci_dev(device);
                                             ^
>> drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:36: error: use of undeclared identifier 'device'
>> drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:36: error: use of undeclared identifier 'device'
   3 errors generated.


vim +/device +682 drivers/net/wireless/mediatek/mt76/mt7925/pci.c

   679	
   680	static void mt7925_coredump(struct device *dev)
   681	{
 > 682		struct pci_dev *pdev = to_pci_dev(device);
   683		struct mt76_dev *mdev = pci_get_drvdata(pdev);
   684		struct mt792x_dev *dev_792x = container_of(mdev, struct mt792x_dev, mt76);
   685	
   686		mt792x_mutex_acquire(dev_792x);
   687		mt7925_mcu_chip_config(dev_792x, "assert");
   688		mt792x_mutex_release(dev_792x);
   689	}
   690	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
