Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0DF5CDF1;
	Wed, 13 May 2026 04:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778647242; cv=none; b=eCjz4e0I4i8kDvucQX6ke/2u/14N91B8Lij0KqaTwQ+2i0SdweVGvhpxD8ZLRe7eKpETxstH3ZfxWN7/e0LeasO0IIPzpnRh6/RmWSjKnWxmDhPpxjM7Xmx0DLvSnuWO5q9cMvxMgHlwA31Ul9/1vjzG2bDWDF1qDJ/7jPjFirc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778647242; c=relaxed/simple;
	bh=6TtdkUC8Rt9x/pNkNl2zgMCGAw2lz+a0/B1me1BjRcY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fpSCkqDnTLxYYiTVJLcUByTgbGOJCx1saHoX19lJwiray3iBeWcRvyOzEDWE4mwWn0eAei/aPtZsYrhBhKDRW04aqqSD5DoqCSNXHvIpPzKIr914eohrllvlc8tegR5rizue3ZwKC3oSQVHvwLDmMm1uqQRgFmBM5WqcAIghOjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QH8/ij56; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QH8/ij56"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778647240; x=1810183240;
  h=date:from:to:cc:subject:message-id;
  bh=6TtdkUC8Rt9x/pNkNl2zgMCGAw2lz+a0/B1me1BjRcY=;
  b=QH8/ij56lK899ymIMehMA6RKjrHlspRqDj3ULQQpA9V83PG8YQa9KCz3
   0lB98lKKyVcu+uONzxRdhj/bRmAL1NtBYqI8uvGU+7zG+FnUyQo2sUoOs
   Dq3+yaHrE4ATgLfkHEOE3NEQYs+YoJjNoRbEMONucpNGIHgKbTIf1UhLM
   ZZhw+SqoyxTibF+UZxlCYz84E/DekPGoANvY6JiGPJIrd/9vHfLDh7lOA
   2gQaxq3va0xzLO9QHWWjyLV1kDNEH1b46oHnl3spS0Z7lwzBEjWRFLaOO
   76XmwaafUGw+zVPHhJEeIBXTluWqxpQD4gVF4UjIbLklb7/m/xJWBzXTy
   Q==;
X-CSE-ConnectionGUID: 7kwATbl9SZeXF8gYQ3WB+A==
X-CSE-MsgGUID: hIlfRjubRNykgk2f0LdTIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79462074"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="79462074"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 21:40:40 -0700
X-CSE-ConnectionGUID: OBRR51MMQie4tGKNUZgMJw==
X-CSE-MsgGUID: qbRajTbGS9+Et/vGLnvEPQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 12 May 2026 21:40:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN1Od-000000008Sx-1ddC;
	Wed, 13 May 2026 04:40:35 +0000
Date: Wed, 13 May 2026 06:39:54 +0200
From: kernel test robot <lkp@intel.com>
To: Jeff Hsu <Jeff.Hsu@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Sean Wang <sean.wang@kernel.org>
Subject: [nbd168-wireless:pr/17 37/37]
 drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:36: error: use of
 undeclared identifier 'device'
Message-ID: <202605130608.70lPftBK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/nbd168/wireless pr/17
head:   b0f5b3976cca04fffdf61e07483536cef5baa39f
commit: b0f5b3976cca04fffdf61e07483536cef5baa39f [37/37] wifi: mt76: mt7925: Add coredump callback in pci_driver
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260513/202605130608.70lPftBK-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130608.70lPftBK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605130608.70lPftBK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7925/pci.c:682:36: error: use of undeclared identifier 'device'
     682 |         struct pci_dev *pdev = to_pci_dev(device);
         |                                           ^
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
