Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562422EEE92;
	Thu,  4 Jun 2026 21:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780609627; cv=none; b=ixy2K6uD4R7vE1abeO6KjZw1bzWgJqQ+VMxIJWFT9MX1YeNVUhtZ/KMJ2AbUzPA3eXl4RZ37r2JNIr2LDm8gJon1KZlE6vpLcMVXRFVy7iMto7QpCJP6zvFD9DshoJOqA4KZBGIQogJJ2TdsnBfAAVLKmuFd72ChnRMg+6CskDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780609627; c=relaxed/simple;
	bh=YbaEXYukQgl0J4eLc4dkXihGQg/spIPsxRJ1aBDKrso=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iTOkzAmhk04pYuj9Pa0jcGehDdzYP0cvCOUStl5bdnktVMDMJ3MTXTCbqR1rPnwQSIdQX/3ni+4POs1plYjS88PArj9dZ0x4T+qoly8D9I3lHcrcEZ47VfAGTUWPPXPFpL9g5sE5hHkvCwasG7NlIz+YtBZWbHDmTNaUz5d3JGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWAg/heV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWAg/heV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780609627; x=1812145627;
  h=date:from:to:cc:subject:message-id;
  bh=YbaEXYukQgl0J4eLc4dkXihGQg/spIPsxRJ1aBDKrso=;
  b=RWAg/heV8QWAruXFD/ODFKPnk0+a6HrecfM14x74fyAuiEBq7upG1Qnq
   haZtzIWDbNkmZWgALcvugIwtsd4zdz/i3hHZ8MC5FALDEV9kZYLoRF0Vl
   /DLMYJVcgK6UbG0t28OVurXVSdndLD7DOZb+87kylpiwQU15Hq3rebhIk
   K2nn/WdJzGPF8DHO/czkeF/M9UUKKd/JdNexmmlw5cSBAugOYwLY1rj6k
   tcY9HO0h9UTJUEbC/nxLZ2JfVkr4F8hWs2lhdgQB6h83QAbGOweQ47X4B
   sXqF8ViIU1T23+00xN92ZjRD1FHAAbWmp20wieuyNePnCa830Tmr3a4I/
   Q==;
X-CSE-ConnectionGUID: sj0NehpKQ82HsQt7GWlVXA==
X-CSE-MsgGUID: FZtoBkJQTYekawLW+XhzFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81353901"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="81353901"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 14:47:06 -0700
X-CSE-ConnectionGUID: zEOSAifTTLCnvAi32RLZcw==
X-CSE-MsgGUID: XO6QoCIvSXSpMBCn1CmhwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="244721978"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 04 Jun 2026 14:47:04 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVFu1-000000002Ob-3438;
	Thu, 04 Jun 2026 21:47:01 +0000
Date: Thu, 04 Jun 2026 23:46:31 +0200
From: kernel test robot <lkp@intel.com>
To: Umang Jain <uajain@igalia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/usb/early/xhci-dbc.c:657:22: warning: unused
 variable 'offset'
Message-ID: <202606042320.kigKLoga-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Umang-Jain/usb-early-xhci-dbc-Track-early_ioremap-size-separately/20260604-225542
head:   2ecba7a3b238002d00204460340708e61b6bee82
commit: 2ecba7a3b238002d00204460340708e61b6bee82 WIP: early: xhci-xdbc: Map lower and with 0 offset to partially work
date:   7 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260604/202606042320.kigKLoga-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606042320.kigKLoga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606042320.kigKLoga-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/usb/early/xhci-dbc.c:657:22: warning: unused variable 'offset' [-Wunused-variable]
     657 |         u32 bus, dev, func, offset;
         |                             ^~~~~~
   1 warning generated.


vim +/offset +657 drivers/usb/early/xhci-dbc.c

aeb9dd1de98c1a Lu Baolu       2017-03-21  653  
b0ae33a2d2fb6c Peter Zijlstra 2022-03-04  654  int __init early_xdbc_parse_parameter(char *s, int keep_early)
aeb9dd1de98c1a Lu Baolu       2017-03-21  655  {
aeb9dd1de98c1a Lu Baolu       2017-03-21  656  	unsigned long dbgp_num = 0;
aeb9dd1de98c1a Lu Baolu       2017-03-21 @657  	u32 bus, dev, func, offset;
298ac860af9a0b Peter Zijlstra 2022-03-04  658  	char *e;
aeb9dd1de98c1a Lu Baolu       2017-03-21  659  	int ret;
aeb9dd1de98c1a Lu Baolu       2017-03-21  660  
aeb9dd1de98c1a Lu Baolu       2017-03-21  661  	if (!early_pci_allowed())
aeb9dd1de98c1a Lu Baolu       2017-03-21  662  		return -EPERM;
aeb9dd1de98c1a Lu Baolu       2017-03-21  663  
b0ae33a2d2fb6c Peter Zijlstra 2022-03-04  664  	early_console_keep = keep_early;
aeb9dd1de98c1a Lu Baolu       2017-03-21  665  
aeb9dd1de98c1a Lu Baolu       2017-03-21  666  	if (xdbc.xdbc_reg)
aeb9dd1de98c1a Lu Baolu       2017-03-21  667  		return 0;
aeb9dd1de98c1a Lu Baolu       2017-03-21  668  
298ac860af9a0b Peter Zijlstra 2022-03-04  669  	if (*s) {
298ac860af9a0b Peter Zijlstra 2022-03-04  670  	       dbgp_num = simple_strtoul(s, &e, 10);
298ac860af9a0b Peter Zijlstra 2022-03-04  671  	       if (s == e)
aeb9dd1de98c1a Lu Baolu       2017-03-21  672  		       dbgp_num = 0;
298ac860af9a0b Peter Zijlstra 2022-03-04  673  	}
aeb9dd1de98c1a Lu Baolu       2017-03-21  674  
aeb9dd1de98c1a Lu Baolu       2017-03-21  675  	pr_notice("dbgp_num: %lu\n", dbgp_num);
aeb9dd1de98c1a Lu Baolu       2017-03-21  676  
aeb9dd1de98c1a Lu Baolu       2017-03-21  677  	/* Locate the host controller: */
aeb9dd1de98c1a Lu Baolu       2017-03-21  678  	ret = xdbc_find_dbgp(dbgp_num, &bus, &dev, &func);
aeb9dd1de98c1a Lu Baolu       2017-03-21  679  	if (ret) {
aeb9dd1de98c1a Lu Baolu       2017-03-21  680  		pr_notice("failed to locate xhci host\n");
aeb9dd1de98c1a Lu Baolu       2017-03-21  681  		return -ENODEV;
aeb9dd1de98c1a Lu Baolu       2017-03-21  682  	}
aeb9dd1de98c1a Lu Baolu       2017-03-21  683  
aeb9dd1de98c1a Lu Baolu       2017-03-21  684  	xdbc.vendor	= read_pci_config_16(bus, dev, func, PCI_VENDOR_ID);
aeb9dd1de98c1a Lu Baolu       2017-03-21  685  	xdbc.device	= read_pci_config_16(bus, dev, func, PCI_DEVICE_ID);
aeb9dd1de98c1a Lu Baolu       2017-03-21  686  	xdbc.bus	= bus;
aeb9dd1de98c1a Lu Baolu       2017-03-21  687  	xdbc.dev	= dev;
aeb9dd1de98c1a Lu Baolu       2017-03-21  688  	xdbc.func	= func;
aeb9dd1de98c1a Lu Baolu       2017-03-21  689  
aeb9dd1de98c1a Lu Baolu       2017-03-21  690  	/* Map the IO memory: */
aeb9dd1de98c1a Lu Baolu       2017-03-21  691  	xdbc.xhci_base = xdbc_map_pci_mmio(bus, dev, func);
aeb9dd1de98c1a Lu Baolu       2017-03-21  692  	if (!xdbc.xhci_base)
aeb9dd1de98c1a Lu Baolu       2017-03-21  693  		return -EINVAL;
aeb9dd1de98c1a Lu Baolu       2017-03-21  694  
2ecba7a3b23800 Umang Jain     2026-06-04  695  	xdbc.xdbc_reg = (struct xdbc_regs __iomem *)(xdbc.xhci_base);
aeb9dd1de98c1a Lu Baolu       2017-03-21  696  
aeb9dd1de98c1a Lu Baolu       2017-03-21  697  	return 0;
aeb9dd1de98c1a Lu Baolu       2017-03-21  698  }
aeb9dd1de98c1a Lu Baolu       2017-03-21  699  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
