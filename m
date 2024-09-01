Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F299422625;
	Sun,  1 Sep 2024 04:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725163297; cv=none; b=QW3p12EaEIZDruLkrHYT5EGFV3RhPpv74fd5QiazHVq2nQGtEejcsLfw3s4UUX2jqERuqpxnRX0ETSRqdt1FcmeeYmF7Tvbj34aq50ubb1/emqPfNcQIOY4/5aYw/2t70vdiga7XLVYYFcs1QbAN3h2MBSZcE8rqoQ83y2/W3Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725163297; c=relaxed/simple;
	bh=Zw3WK/6c1FjO/dIEFocDdm6PlD3PL5cVUvYMkMKY+pU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eBNmv68CKulPb4/MYUDhPSBkWgx6L78xlbzn0CNqWMymSZTS4B3EBxY4jwY2tGOUNSX9qmasthgmQn8YXe5a9ttcqBVF4uJeYtO7U2De4oLk3f2aHhjRT3mKaAB8oF0VNK9i10x0LTGetiPFBmQbq11zwA7ij09v+8ddI0hAuoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=biS+YE9l; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="biS+YE9l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725163295; x=1756699295;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zw3WK/6c1FjO/dIEFocDdm6PlD3PL5cVUvYMkMKY+pU=;
  b=biS+YE9lZJvB+1VfRs/+HTC+enhT/8fhtfWLvFNq9cnttTHRjjesZV4Y
   C6ex+hf+COwo2QpCEIuxzL/SOdIlfGmOdJQEy/1CYUuEaJu/syS1lgIPp
   R3TMn3hsDEixABdwa9/ljVoi+Rgn4j6+rIWomoyby03xpYvl3h4M2Le+j
   6NUpYAFT8vojbmouHYbfT+8SCbe3msF7P/20OeKQxfjEbMi4v1Ufqe0S4
   y/MF12rR2eR/Zbou/RA8gG5E/LT2psipZCT9EM6zGKcSu5MPHLjnnIdZt
   KygB239XP3EmC0e7rVlEHlxcA8s6LMPgdZPj9kMjpIggi/6t+Ux9RmU2k
   g==;
X-CSE-ConnectionGUID: ojN5Uen9R9qk+0h0/XE9vg==
X-CSE-MsgGUID: WgLQUICFSh22+O+VvIzo4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="35135560"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="35135560"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 21:01:31 -0700
X-CSE-ConnectionGUID: Etuq8h3NS7+XSiZfB3T+Ow==
X-CSE-MsgGUID: DqyWKzt5S3K4Xnr90beFVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="68398802"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Aug 2024 21:01:29 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skbmJ-0003O2-1h;
	Sun, 01 Sep 2024 04:01:27 +0000
Date: Sun, 1 Sep 2024 12:01:11 +0800
From: kernel test robot <lkp@intel.com>
To: ningyu <ningyu@eswincomputing.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Subject: [esmil:eic7700 21/24] drivers/pci/controller/dwc/pcie-eswin.c:189:5:
 warning: no previous prototype for function 'eswin_evb_socket_power_on'
Message-ID: <202409011151.uOjxg9JM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/esmil/linux eic7700
head:   eb44174b12f99d320be704b45db6b994f6a014bd
commit: 357191b1d41675670255887ef252d171eef65bc4 [21/24] driver: PCIe: Add PCIe driver for EIC7700
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240901/202409011151.uOjxg9JM-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 46fe36a4295f05d5d3731762e31fc4e6e99863e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011151.uOjxg9JM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409011151.uOjxg9JM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/controller/dwc/pcie-eswin.c:30:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:22:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pcie-eswin.c:189:5: warning: no previous prototype for function 'eswin_evb_socket_power_on' [-Wmissing-prototypes]
     189 | int eswin_evb_socket_power_on(struct device *dev)
         |     ^
   drivers/pci/controller/dwc/pcie-eswin.c:189:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     189 | int eswin_evb_socket_power_on(struct device *dev)
         | ^
         | static 
   5 warnings generated.


vim +/eswin_evb_socket_power_on +189 drivers/pci/controller/dwc/pcie-eswin.c

   185	
   186	/* TODO: Check socket gpio number in actual board and
   187	 *       change if necessary
   188	 */
 > 189	int eswin_evb_socket_power_on(struct device *dev)
   190	{
   191		int err_desc=0;
   192		struct gpio_desc *gpio;
   193		gpio = devm_gpiod_get(dev, "pci-socket", GPIOD_OUT_LOW);
   194		err_desc = IS_ERR(gpio);
   195	
   196		if (err_desc) {
   197			pr_err("No power control gpio found, maybe not needed\n");
   198			return 0;
   199		}
   200	
   201		gpiod_set_value(gpio,1);
   202	
   203		return err_desc;
   204	}
   205	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
