Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D072881723;
	Wed,  4 Sep 2024 18:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725476270; cv=none; b=aALrE1+hKUuvBDfsrIGktg5c37Y3NP2fnxVKlRpZTX7WjfmYrbNy+sNd+a5Hhi8zOFJjAjykYjBbfRnL/ov3HffBiLNUbKaORXG7CWJinOb76+9y3+NzLqOdLHjrv2HCnTilk3Grv+VrQGROjGHLwYcZ2IKTxOGCvfDwa2Oyfx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725476270; c=relaxed/simple;
	bh=OoEqLW799AEVLgmvj58oXxxpV/OHUTWALs1mrsKcDeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TPxOj4iyf7iOTgX8VkD9Tet8eCw6PtIwBEPGZpkxfxWV2BbFXGDDK3YYPgrlekcky4B/CpZjxDjV6Q7Prxxn1mjJ7Xhlpr2MnVslCbLyh37VKhXjiL7L4sVqkNv/HiJwzr/aVO3T8TIsrFb4GSC1XxSOMwxyNt0Z+svXhsqaIos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ds4ycRNv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ds4ycRNv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725476268; x=1757012268;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OoEqLW799AEVLgmvj58oXxxpV/OHUTWALs1mrsKcDeo=;
  b=Ds4ycRNvdpCGbZP+tk5W5JzTSOmklau0MGBTYW5biyygIiB9gitKZJ6s
   o0dpIyPzIAC6sVI8NO0myw1lUN5RarKwCurwo4GFr0qCrpOwVNGnZ+XAs
   YGU5kUJx4xdGEXSHselulBqYWOzLlacQvYrlURnZgr7e68nRtvdmA0YnP
   PMP5gejwV4fg0cXTRHdbyKH/cK5Ng+ViclJiQ2Zy4s8bD0hntnx8JLeSF
   0EYW/86fjPl6LAXWyqnbdpkJv5LAn10W1rYsZydUT9odZf+eCVDamYTG5
   98cgYmZNu429C9Qj/z93Wi0UsrQOEzZ4bhirWUZyt64srvEFJGc7qUeRE
   g==;
X-CSE-ConnectionGUID: y6Cc7hkFQzmmqZHCxoVxwA==
X-CSE-MsgGUID: xONIl2WOSsKW0H0bA/oekg==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="27079379"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="27079379"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 11:57:39 -0700
X-CSE-ConnectionGUID: 7IakalsGTeWsi1GdLumIFg==
X-CSE-MsgGUID: NNdjZf1bTeidrXqv+wBtkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; 
   d="scan'208";a="70254594"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Sep 2024 11:57:37 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slvCA-0008Sq-3C;
	Wed, 04 Sep 2024 18:57:34 +0000
Date: Thu, 5 Sep 2024 02:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:const_work 33/42]
 drivers/bus/fsl-mc/fsl-mc-bus.c:409:5: error: initializing 'struct
 device_type *' with an expression of type 'typeof (fsl_mc_bus_dprc_type) *'
 (aka 'const struct device_type *') discards qualifiers
Message-ID: <202409050210.nvCQrlSB-lkp@intel.com>
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
head:   5cbf546e827388f992254ad1b5cd8ec56816dbd0
commit: f4bff7444475c796c7dfb671cde4ef3c6def296f [33/42] bus: fsl-mc: constify the struct device_type usage
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240905/202409050210.nvCQrlSB-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409050210.nvCQrlSB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409050210.nvCQrlSB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bus/fsl-mc/fsl-mc-bus.c:409:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dprc_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     409 |                 { &fsl_mc_bus_dprc_type, "dprc" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:410:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpni_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     410 |                 { &fsl_mc_bus_dpni_type, "dpni" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:411:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpio_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     411 |                 { &fsl_mc_bus_dpio_type, "dpio" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:412:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpsw_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     412 |                 { &fsl_mc_bus_dpsw_type, "dpsw" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:413:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpbp_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     413 |                 { &fsl_mc_bus_dpbp_type, "dpbp" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:414:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpcon_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     414 |                 { &fsl_mc_bus_dpcon_type, "dpcon" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:415:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpmcp_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     415 |                 { &fsl_mc_bus_dpmcp_type, "dpmcp" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:416:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpmac_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     416 |                 { &fsl_mc_bus_dpmac_type, "dpmac" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:417:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dprtc_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     417 |                 { &fsl_mc_bus_dprtc_type, "dprtc" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:418:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpseci_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     418 |                 { &fsl_mc_bus_dpseci_type, "dpseci" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:419:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdmux_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     419 |                 { &fsl_mc_bus_dpdmux_type, "dpdmux" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:420:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdcei_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     420 |                 { &fsl_mc_bus_dpdcei_type, "dpdcei" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:421:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpaiop_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     421 |                 { &fsl_mc_bus_dpaiop_type, "dpaiop" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:422:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpci_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     422 |                 { &fsl_mc_bus_dpci_type, "dpci" },
         |                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/bus/fsl-mc/fsl-mc-bus.c:423:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdmai_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     423 |                 { &fsl_mc_bus_dpdmai_type, "dpdmai" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:424:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdbg_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
     424 |                 { &fsl_mc_bus_dpdbg_type, "dpdbg" },
         |                   ^~~~~~~~~~~~~~~~~~~~~~
   16 errors generated.


vim +409 drivers/bus/fsl-mc/fsl-mc-bus.c

e70ba1b06c26cd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2021-02-08  402  
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  403  static struct device_type *fsl_mc_get_device_type(const char *type)
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  404  {
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  405  	static const struct {
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  406  		struct device_type *dev_type;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  407  		const char *type;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  408  	} dev_types[] = {
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @409  		{ &fsl_mc_bus_dprc_type, "dprc" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  410  		{ &fsl_mc_bus_dpni_type, "dpni" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @411  		{ &fsl_mc_bus_dpio_type, "dpio" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  412  		{ &fsl_mc_bus_dpsw_type, "dpsw" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @413  		{ &fsl_mc_bus_dpbp_type, "dpbp" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @414  		{ &fsl_mc_bus_dpcon_type, "dpcon" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  415  		{ &fsl_mc_bus_dpmcp_type, "dpmcp" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @416  		{ &fsl_mc_bus_dpmac_type, "dpmac" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17 @417  		{ &fsl_mc_bus_dprtc_type, "dprtc" },
e9158b35ef9afb drivers/bus/fsl-mc/fsl-mc-bus.c         Horia Geantă    2018-09-12 @418  		{ &fsl_mc_bus_dpseci_type, "dpseci" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  419  		{ &fsl_mc_bus_dpdmux_type, "dpdmux" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17 @420  		{ &fsl_mc_bus_dpdcei_type, "dpdcei" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17 @421  		{ &fsl_mc_bus_dpaiop_type, "dpaiop" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  422  		{ &fsl_mc_bus_dpci_type, "dpci" },
a3b7a581823857 drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2020-07-17  423  		{ &fsl_mc_bus_dpdmai_type, "dpdmai" },
e70ba1b06c26cd drivers/bus/fsl-mc/fsl-mc-bus.c         Ioana Ciornei   2021-02-08 @424  		{ &fsl_mc_bus_dpdbg_type, "dpdbg" },
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  425  		{ NULL, NULL }
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  426  	};
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  427  	int i;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  428  
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  429  	for (i = 0; dev_types[i].dev_type; i++)
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  430  		if (!strcmp(dev_types[i].type, type))
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  431  			return dev_types[i].dev_type;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  432  
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  433  	return NULL;
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  434  }
47433b630b7b30 drivers/staging/fsl-mc/bus/fsl-mc-bus.c Laurentiu Tudor 2017-11-17  435  

:::::: The code at line 409 was first introduced by commit
:::::: 47433b630b7b30d0daa360c64308c0f4c9632986 staging: fsl-mc: add support for device type

:::::: TO: Laurentiu Tudor <laurentiu.tudor@nxp.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
