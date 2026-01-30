Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1529330662;
	Fri, 30 Jan 2026 08:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769763289; cv=none; b=Zt6iW3agFwMzw1bvPD12N9xxeWEQETVG0DUdTYX/ih1dSelPF7OSCEcMzOzr2GUwqnzinaeur1AoBa2+PRfwau1irMAvKcU6+QiinSzgm2HhlioJqH+H+DAyMshJYg+2WJfXD+bWJtZjj7lNoWMdYwZn7/YloLjCiV3sLAxZdTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769763289; c=relaxed/simple;
	bh=/Gw/oYGgtDETEkMgg45W6sh3z1H9POY3B2TWb3ezvck=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dHdhsoZ/mZfeWeZZ24x6OfkO4wAJ92jAuc/MKQOiGU28XhkWJMJBHJJLNEAH/U/31oqsdyzfDDq62eW3nkThmE5K9KAfrSjT6QACRySpyVIhghb44EX70GhUMfpe63wToLN/JHyAzVg/GhYzUMJT76+Mw/9wqhTPdTb50BzZY6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faxcOoxu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faxcOoxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769763286; x=1801299286;
  h=date:from:to:cc:subject:message-id;
  bh=/Gw/oYGgtDETEkMgg45W6sh3z1H9POY3B2TWb3ezvck=;
  b=faxcOoxu42HqUo+0fATCNoNAmNnT23FtVT1BhQBes0OlGuEKXZLDiNo3
   DT4hwv3cIojenOy5c5NbQZrcVfUwQiCMrhHYR2/sNswTnH4sGfPtWl2YI
   aWfei1zDbQOEc4BmZCXEysKBpZDyWrtBEdB45fv4N4N434bF9keyLz22K
   ZgaGdjoLp+3EcvvIyZ3JDA2U2u1FaSW+kKPgI4XbQQoW51jOg+dVifEzp
   if/XuRySqC3/t63ZGlx2ZxmtnCp1sVVQ+CqR6mp0ciFFdSyHAvf/EEjCt
   rpKbkE4lYmXMV1ImHBsJm5Efkk568FIxe0p1h7kl0Lh3bg20ztuLZCjnX
   g==;
X-CSE-ConnectionGUID: vUbCI66HSkazx6Bsl2iP/g==
X-CSE-MsgGUID: NeeXnNn3RuWurNwoLA9QuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="93670143"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="93670143"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 00:54:45 -0800
X-CSE-ConnectionGUID: D9GYIX3xSzq87qMKq1/ztw==
X-CSE-MsgGUID: WFsZD3t8S+CX4a4LNLeSRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
   d="scan'208";a="212885890"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jan 2026 00:54:44 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlkH3-00000000cPE-1QuY;
	Fri, 30 Jan 2026 08:54:41 +0000
Date: Fri, 30 Jan 2026 16:54:40 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/cxl/region_rework_v3 8/9]
 drivers/cxl/core/sysram_region.c:31:7: error: use of undeclared identifier
 'MMOP_OFFLINE'; did you mean 'KOBJ_OFFLINE'?
Message-ID: <202601301640.RCXOteOZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/cxl/region_rework_v3
head:   ef956221cc52b1c29b05280fcec99686d744d6b4
commit: f01228503f96ed593825ba00ad03dfa5cd01041f [8/9] cxl/core: Add dax_kmem_region and sysram_region drivers
config: i386-buildonly-randconfig-003-20260130 (https://download.01.org/0day-ci/archive/20260130/202601301640.RCXOteOZ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260130/202601301640.RCXOteOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601301640.RCXOteOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cxl/core/sysram_region.c:31:7: error: use of undeclared identifier 'MMOP_OFFLINE'; did you mean 'KOBJ_OFFLINE'?
      31 |         case MMOP_OFFLINE:
         |              ^~~~~~~~~~~~
         |              KOBJ_OFFLINE
   include/linux/kobject.h:59:2: note: 'KOBJ_OFFLINE' declared here
      59 |         KOBJ_OFFLINE,
         |         ^
>> drivers/cxl/core/sysram_region.c:33:7: error: use of undeclared identifier 'MMOP_ONLINE'
      33 |         case MMOP_ONLINE:
         |              ^
>> drivers/cxl/core/sysram_region.c:35:7: error: use of undeclared identifier 'MMOP_ONLINE_MOVABLE'
      35 |         case MMOP_ONLINE_MOVABLE:
         |              ^
   drivers/cxl/core/sysram_region.c:49:30: error: use of undeclared identifier 'MMOP_OFFLINE'; did you mean 'KOBJ_OFFLINE'?
      49 |                 cxlr_sysram->online_type = MMOP_OFFLINE;
         |                                            ^~~~~~~~~~~~
         |                                            KOBJ_OFFLINE
   include/linux/kobject.h:59:2: note: 'KOBJ_OFFLINE' declared here
      59 |         KOBJ_OFFLINE,
         |         ^
   drivers/cxl/core/sysram_region.c:51:30: error: use of undeclared identifier 'MMOP_ONLINE'
      51 |                 cxlr_sysram->online_type = MMOP_ONLINE;
         |                                            ^
   drivers/cxl/core/sysram_region.c:53:30: error: use of undeclared identifier 'MMOP_ONLINE_MOVABLE'
      53 |                 cxlr_sysram->online_type = MMOP_ONLINE_MOVABLE;
         |                                            ^
   6 errors generated.


vim +31 drivers/cxl/core/sysram_region.c

    24	
    25	static ssize_t online_type_show(struct device *dev,
    26					struct device_attribute *attr, char *buf)
    27	{
    28		struct cxl_sysram_region *cxlr_sysram = to_cxl_sysram_region(dev);
    29	
    30		switch (cxlr_sysram->online_type) {
  > 31		case MMOP_OFFLINE:
    32			return sysfs_emit(buf, "offline\n");
  > 33		case MMOP_ONLINE:
    34			return sysfs_emit(buf, "online\n");
  > 35		case MMOP_ONLINE_MOVABLE:
    36			return sysfs_emit(buf, "online_movable\n");
    37		default:
    38			return sysfs_emit(buf, "invalid\n");
    39		}
    40	}
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
