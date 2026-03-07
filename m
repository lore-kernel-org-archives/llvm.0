Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523CA284663;
	Sat,  7 Mar 2026 05:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772861448; cv=none; b=hpmfpfgFUtU5iqtlIfYlaxp40tUsOZbMwLVWKw+QzuPAbW6gqbtU4UyIOUZ/HpKB9c0g3Pl5H9lwSlcV3vp09tmakF5MO54V3UeC5JPH2/6oZXY1/8k+uLWUfZ3cBVjFUn5A5gk+tLI+aTEHgnGafhaDdrNbhBirnBrul0lEnFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772861448; c=relaxed/simple;
	bh=dL06lH73R52S09fkWefTFvJotcKjs6p9DaYhQtRmR7Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kUzIIVCtHoEFfxIXFcDSSue5sBZa3fpyp8ObzCsb5+jLawGXY3ZdNnV4dhy788YrdTKaNXHQjdnQSTs1wgPpHO7ePPKF6dkFcrBl49Cx3+qbcaeec/IDeRBEdd6DrjqcbfkeKDcXxWmv2mzw1lTCpuL/nMtk47UWr93fkjSZDmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VosCWwQS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VosCWwQS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772861446; x=1804397446;
  h=date:from:to:cc:subject:message-id;
  bh=dL06lH73R52S09fkWefTFvJotcKjs6p9DaYhQtRmR7Q=;
  b=VosCWwQSOJSyLGBtg8q6NkDuBrawQ7+1epOgePtJ+86iYmE/jixRxUn6
   P9CRjlov5kpwRAStRhYO6YdFLHzWp43SG0ooyg6iOk3UINh5v9GKbguG7
   GiQT4djQGLOEMKHOWhK+qs4z7ivFVC5ZQd28SqGUKRAF8c5NWFprcZfmT
   o/k6Ugyt+TmVMYAJcD05Q/WC7+JeFW7HPfn43M3PxK3IuGnAkB7xMue3c
   jJ4HnKYEP0dwYveP/O5uq2tJ2SFHbihwftsC4acUAJeWVG2tBRxeb7Vq5
   29y4QcLgZdKhwXNILClw+/P/7qQpsp9SV6/116FOrlZuFWh63eJBmRjOs
   Q==;
X-CSE-ConnectionGUID: SoUNpkKRTHmyAsinoVym4w==
X-CSE-MsgGUID: /y93LAM0RL6P2+0lpOLYcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="72992879"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="72992879"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 21:30:46 -0800
X-CSE-ConnectionGUID: 8VCyQraURE+IYoleF+19ZA==
X-CSE-MsgGUID: r+AzPiQpRBy6IoHMkFmeRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="224164523"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2026 21:30:43 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vykFN-000000001iX-0sPq;
	Sat, 07 Mar 2026 05:30:41 +0000
Date: Sat, 07 Mar 2026 13:30:29 +0800
From: kernel test robot <lkp@intel.com>
To: Khai Wen Ng <khai.wen.ng@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 "sys_oak" <sys_oak@intel.com>,
 "Yew, Chang Ching" <chang.ching.yew@intel.com>
Subject: [acrn:6.17/linux 3121/3134]
 drivers/i2c/i2c-core-acpi.c:322:1: warning: label at end of compound
 statement is a C23 extension
Message-ID: <202603071302.7Km8GpfW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   d2ae39d099178698dc32d2165a32f4d6d13d107b
commit: f5ccdd6257bea670f612e8bdabe5052d698dd031 [3121/3134] i2c: i2c-core-acpi: clear dependency for MUX or ATR adapters
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260307/202603071302.7Km8GpfW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071302.7Km8GpfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071302.7Km8GpfW-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i2c/i2c-core-acpi.c:322:1: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     322 | }
         | ^
   1 warning generated.


vim +322 drivers/i2c/i2c-core-acpi.c

53f8f7c5cf145d Wolfram Sang  2017-05-23  276  
53f8f7c5cf145d Wolfram Sang  2017-05-23  277  static void i2c_acpi_register_device(struct i2c_adapter *adapter,
53f8f7c5cf145d Wolfram Sang  2017-05-23  278  				     struct acpi_device *adev,
53f8f7c5cf145d Wolfram Sang  2017-05-23  279  				     struct i2c_board_info *info)
53f8f7c5cf145d Wolfram Sang  2017-05-23  280  {
a6e1445c445678 Hans de Goede 2021-12-30  281  	/*
a6e1445c445678 Hans de Goede 2021-12-30  282  	 * Skip registration on boards where the ACPI tables are
a6e1445c445678 Hans de Goede 2021-12-30  283  	 * known to contain bogus I2C devices.
a6e1445c445678 Hans de Goede 2021-12-30  284  	 */
a6e1445c445678 Hans de Goede 2021-12-30  285  	if (acpi_quirk_skip_i2c_client_enumeration(adev))
a6e1445c445678 Hans de Goede 2021-12-30  286  		return;
a6e1445c445678 Hans de Goede 2021-12-30  287  
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  288  	/* Check if Device is on ATR or MUX adapter */
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  289  	if (adapter->is_atr || adapter->is_mux) {
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  290  		u32 channel;
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  291  
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  292  		if (fwnode_property_present(&adev->fwnode, "channel")) {
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  293  			if (fwnode_property_read_u32(&adev->fwnode, "channel", &channel)) {
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  294  				dev_err(&adev->dev, "failed to read channel property\n");
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  295  				return;
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  296  			}
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  297  
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  298  			if (adapter->chan_id != channel) {
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  299  				dev_err(&adev->dev, "device is not on current adapter %d\n",
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  300  					adapter->chan_id);
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  301  				goto err;
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  302  			} else {
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  303  				acpi_dev_clear_dependencies(ACPI_COMPANION(adapter->dev.parent));
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  304  			}
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  305  
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  306  			if (adev->dep_unmet) {
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  307  				dev_err(&adev->dev, "device has unmet dependencies\n");
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  308  				return;
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  309  			}
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  310  		} else {
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  311  			dev_err(&adev->dev, "channel property not present\n");
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  312  			return;
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  313  		}
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  314  	}
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  315  
53f8f7c5cf145d Wolfram Sang  2017-05-23  316  	adev->power.flags.ignore_parent = true;
53f8f7c5cf145d Wolfram Sang  2017-05-23  317  	acpi_device_set_enumerated(adev);
53f8f7c5cf145d Wolfram Sang  2017-05-23  318  
785e21cfaa68fd Hans de Goede 2020-12-21  319  	if (IS_ERR(i2c_new_client_device(adapter, info)))
53f8f7c5cf145d Wolfram Sang  2017-05-23  320  		adev->power.flags.ignore_parent = false;
f5ccdd6257bea6 Khai Wen Ng   2025-09-11  321  err:
53f8f7c5cf145d Wolfram Sang  2017-05-23 @322  }
53f8f7c5cf145d Wolfram Sang  2017-05-23  323  

:::::: The code at line 322 was first introduced by commit
:::::: 53f8f7c5cf145d639ebd6d13cfdf2e3e9764add3 i2c: break out ACPI support into separate file

:::::: TO: Wolfram Sang <wsa@the-dreams.de>
:::::: CC: Wolfram Sang <wsa@the-dreams.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
