Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16C079CF;
	Mon, 21 Oct 2024 18:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729534546; cv=none; b=H1EZE/N6/ZylZRyxiXIxGtpG0iozVlY0JXJVc4Vm9N0M5qZF/42Y/3tSzaabwrcqMAx4b86YDUDRbAUp1ZBLxl4Et1vySovazdiyO7nBI3O7ofAgXUSqLSiw/irtwnen/M9OPyxx3DYh3vL9G1aJNm3SPcpPlllLv4ahyeKBXd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729534546; c=relaxed/simple;
	bh=FlpkijglSgVuC2Z+6337urZOgx8AgafrheNkzB+MCZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QWfSD7rH4DMQcGf0UuaQVVNnXzXc+17ZSEJgb1nHlZch500uxavieCUS663z/ZHZcxY4j7LM+iAlATKN84P5m136egHiE/A3JvI1BmANzpmwlSKozlKYklhahzh9MYufsJRDsLkb1E6mvaD/GGW2TaOxcvHDs1toT/n+H4iYxSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YFSiv+zd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YFSiv+zd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729534544; x=1761070544;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FlpkijglSgVuC2Z+6337urZOgx8AgafrheNkzB+MCZI=;
  b=YFSiv+zdBe502ApdbbAuYrFKq0wdQalDDsEUPxBL/66ikdHZm3ZrvCgN
   Hhta2F5/AwIWxez6fe6drjTqK/LqsOJquYeAvbuxa/gCub+9iGsc9jNbV
   iuTWA3+0t3nQojRbCu0v1ySuasImE9k7eFTVlx2Zs/ZS0Obgy5M7WEI7r
   6N7NuPMvacX8z6damhPnzjf3benx73Tu5U5CxEu0biqRe1yQ0/xoWbF3a
   5YfKYRn0rtQwf2wwyTAtbF020kUeiUHOF51hplKBsY1ekc/CL9CcltgTM
   uJOqBSJYunXNQkOWgwCi27/Bf1eEr4vLfR3IRsD6HI0+2FupTI6RAkEyM
   Q==;
X-CSE-ConnectionGUID: T67F6ot9S36S2xBN/isVvg==
X-CSE-MsgGUID: BHPkjEvXRTaQe+YcI1ECFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="54442098"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="54442098"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 11:15:43 -0700
X-CSE-ConnectionGUID: nC4EtSatRIWbp2zXE4xYTQ==
X-CSE-MsgGUID: YPICkMjTR0er2/oZZTcpfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="84206630"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Oct 2024 11:15:41 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2wwN-000SVO-1G;
	Mon, 21 Oct 2024 18:15:39 +0000
Date: Tue, 22 Oct 2024 02:15:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:const_work 31/40]
 drivers/bus/fsl-mc/fsl-mc-bus.c:409:5: error: initializing 'struct
 device_type *' with an expression of type 'typeof (fsl_mc_bus_dprc_type) *'
 (aka 'const struct device_type *') discards qualifiers
Message-ID: <202410220209.WYSCnfNH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_work
head:   b7bbe168fc896538357a88d4b7de1a4d41958bfe
commit: cfd1974cbf0023d6d6de9e410aa1860d5a34c132 [31/40] bus: fsl-mc: constify the struct device_type usage
config: i386-buildonly-randconfig-003-20241021 (https://download.01.org/0day-ci/archive/20241022/202410220209.WYSCnfNH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241022/202410220209.WYSCnfNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410220209.WYSCnfNH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bus/fsl-mc/fsl-mc-bus.c:409:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dprc_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     409 |                 { &fsl_mc_bus_dprc_type, "dprc" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:410:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpni_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     410 |                 { &fsl_mc_bus_dpni_type, "dpni" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:411:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpio_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     411 |                 { &fsl_mc_bus_dpio_type, "dpio" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:412:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpsw_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     412 |                 { &fsl_mc_bus_dpsw_type, "dpsw" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:413:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpbp_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     413 |                 { &fsl_mc_bus_dpbp_type, "dpbp" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:414:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpcon_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     414 |                 { &fsl_mc_bus_dpcon_type, "dpcon" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:415:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpmcp_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     415 |                 { &fsl_mc_bus_dpmcp_type, "dpmcp" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:416:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpmac_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     416 |                 { &fsl_mc_bus_dpmac_type, "dpmac" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:417:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dprtc_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     417 |                 { &fsl_mc_bus_dprtc_type, "dprtc" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:418:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpseci_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     418 |                 { &fsl_mc_bus_dpseci_type, "dpseci" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:419:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdmux_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     419 |                 { &fsl_mc_bus_dpdmux_type, "dpdmux" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:420:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdcei_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     420 |                 { &fsl_mc_bus_dpdcei_type, "dpdcei" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:421:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpaiop_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     421 |                 { &fsl_mc_bus_dpaiop_type, "dpaiop" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:422:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpci_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     422 |                 { &fsl_mc_bus_dpci_type, "dpci" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:423:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdmai_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     423 |                 { &fsl_mc_bus_dpdmai_type, "dpdmai" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:424:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdbg_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     424 |                 { &fsl_mc_bus_dpdbg_type, "dpdbg" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   16 errors generated.


vim +409 drivers/bus/fsl-mc/fsl-mc-bus.c

e70ba1b06c26cdd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2021-02-08  402  
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  403  static struct device_type *fsl_mc_get_device_type(const char *type)
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  404  {
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  405  	static const struct {
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  406  		struct device_type *dev_type;
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  407  		const char *type;
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  408  	} dev_types[] = {
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @409  		{ &fsl_mc_bus_dprc_type, "dprc" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @410  		{ &fsl_mc_bus_dpni_type, "dpni" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @411  		{ &fsl_mc_bus_dpio_type, "dpio" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @412  		{ &fsl_mc_bus_dpsw_type, "dpsw" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @413  		{ &fsl_mc_bus_dpbp_type, "dpbp" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @414  		{ &fsl_mc_bus_dpcon_type, "dpcon" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @415  		{ &fsl_mc_bus_dpmcp_type, "dpmcp" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @416  		{ &fsl_mc_bus_dpmac_type, "dpmac" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @417  		{ &fsl_mc_bus_dprtc_type, "dprtc" },
e9158b35ef9afb3 drivers/bus/fsl-mc/fsl-mc-bus.c         Horia Geantă    2018-09-12 @418  		{ &fsl_mc_bus_dpseci_type, "dpseci" },
a3b7a581823857f drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17 @419  		{ &fsl_mc_bus_dpdmux_type, "dpdmux" },
a3b7a581823857f drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17 @420  		{ &fsl_mc_bus_dpdcei_type, "dpdcei" },
a3b7a581823857f drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17 @421  		{ &fsl_mc_bus_dpaiop_type, "dpaiop" },
a3b7a581823857f drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17 @422  		{ &fsl_mc_bus_dpci_type, "dpci" },
a3b7a581823857f drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17 @423  		{ &fsl_mc_bus_dpdmai_type, "dpdmai" },
e70ba1b06c26cdd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2021-02-08 @424  		{ &fsl_mc_bus_dpdbg_type, "dpdbg" },
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  425  		{ NULL, NULL }
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  426  	};
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  427  	int i;
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  428  
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  429  	for (i = 0; dev_types[i].dev_type; i++)
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  430  		if (!strcmp(dev_types[i].type, type))
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  431  			return dev_types[i].dev_type;
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  432  
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  433  	return NULL;
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  434  }
47433b630b7b30d drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  435  

:::::: The code at line 409 was first introduced by commit
:::::: 47433b630b7b30d0daa360c64308c0f4c9632986 staging: fsl-mc: add support for device type

:::::: TO: Laurentiu Tudor <laurentiu.tudor@nxp.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
