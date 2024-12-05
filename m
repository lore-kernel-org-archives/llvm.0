Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FAD2770C;
	Thu,  5 Dec 2024 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733384266; cv=none; b=mBC6SSN/LbD2Q7IyOieFDusCq/CRn3ZqXXpuLJPq45YE8vhbYW47QFc3SbI8oCKjSmQIgqR3TZ7qIZnjgdwggNxABGvp5kvtjqfLYmyjkQYo9FN+CVLN6VbG8TWtit9LxJvCfjR8HwSdjOHL6CbAVnChn3mvtqZDAKT4hRuX5mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733384266; c=relaxed/simple;
	bh=MT+NHrX/TbK+hyQ7o+W/SEq8OvWPRJUV/Uj0ZAPbQpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zs0jl4KYIvIbdkwiW4CipcHVzgTz+1bvwmaSku7jBWGhjldl8e9yudm+6iwKEDorloQkS0Rx2fKN/I9PfvWRX2osIDKYuXVMe18GXKYxWmCyLTKQNo0FEGYmweDJAEy+bMHNE6QlK5+SKDhh7lBSo2e7nWADRmg3QJ6o1QE2dbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HORzOyFV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HORzOyFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733384264; x=1764920264;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MT+NHrX/TbK+hyQ7o+W/SEq8OvWPRJUV/Uj0ZAPbQpE=;
  b=HORzOyFVdVBTC3JkDnXU3osi5fxWgCNz2xyo4oBTJ09NKPUckzllYdG1
   f7v1pZWKqt4CZvhfO7qa8JIbmJX3BZUUaYB4SI7rjyau79HbC0xZ4q5vN
   CA8nnyvNT4GBjswr9/4cr/GQwKtAQ27Afbd1KPd8P27Oy3NpPcXRNPwwW
   6Ey84aeW/5GD34boHezWCk1UkccDJOzNZUxnyt8dbe9O0gwSkgYNyM1Ja
   h+CyLLtOo8KIvhH3zwge/ldV5mjc2eWyWtKCx8DOugdJm+rNJjCo9A8tH
   IH+rBmfnxwzEwFRHVNHveK0ougdrMxHGqR757XG7LxyzH4FnNuF8pPiJK
   w==;
X-CSE-ConnectionGUID: QKW9SO5gRxmUXiwj9WE/Ig==
X-CSE-MsgGUID: jJ2Q5MzcQ6K3tHzole8ntQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33826776"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33826776"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 23:37:44 -0800
X-CSE-ConnectionGUID: 9weeCOedQQ+xVdwtGb3VNQ==
X-CSE-MsgGUID: XNYB2a1TT8qrBpJm9heifg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="117262061"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Dec 2024 23:37:42 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ6Qd-0003wa-1S;
	Thu, 05 Dec 2024 07:37:39 +0000
Date: Thu, 5 Dec 2024 15:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [driver-core:const_work 25/34]
 drivers/bus/fsl-mc/fsl-mc-bus.c:409:5: error: initializing 'struct
 device_type *' with an expression of type 'typeof (fsl_mc_bus_dprc_type) *'
 (aka 'const struct device_type *') discards qualifiers
Message-ID: <202412051548.5hY2mm8V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_work
head:   9608e6a5fe45f4882ecb095938d616ee9a2c70df
commit: b8cc878da25e18cb9e75d90800f84b1dee59def0 [25/34] bus: fsl-mc: constify the struct device_type usage
config: arm-randconfig-004-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051548.5hY2mm8V-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051548.5hY2mm8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051548.5hY2mm8V-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/bus/fsl-mc/fsl-mc-bus.c:409:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dprc_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dprc_type, "dprc" },
                     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:410:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpni_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpni_type, "dpni" },
                     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:411:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpio_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpio_type, "dpio" },
                     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:412:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpsw_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpsw_type, "dpsw" },
                     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:413:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpbp_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpbp_type, "dpbp" },
                     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:414:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpcon_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpcon_type, "dpcon" },
                     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:415:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpmcp_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpmcp_type, "dpmcp" },
                     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:416:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpmac_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpmac_type, "dpmac" },
                     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:417:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dprtc_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dprtc_type, "dprtc" },
                     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:418:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpseci_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpseci_type, "dpseci" },
                     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:419:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdmux_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpdmux_type, "dpdmux" },
                     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:420:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdcei_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpdcei_type, "dpdcei" },
                     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:421:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpaiop_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpaiop_type, "dpaiop" },
                     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:422:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpci_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpci_type, "dpci" },
                     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:423:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdmai_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpdmai_type, "dpdmai" },
                     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/bus/fsl-mc/fsl-mc-bus.c:424:5: error: initializing 'struct device_type *' with an expression of type 'typeof (fsl_mc_bus_dpdbg_type) *' (aka 'const struct device_type *') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   { &fsl_mc_bus_dpdbg_type, "dpdbg" },
                     ^~~~~~~~~~~~~~~~~~~~~~
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
