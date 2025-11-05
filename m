Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3566726F28D;
	Wed,  5 Nov 2025 10:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762337168; cv=none; b=Wxvga9EOEXG9wC1qrTHDYnG462NDR9kiDOfQyUBWGwps+zSacNbB2y9c5qUEuua546By7cfJEW/KcecEphYYsEXOJOjkYfLVPPE/zJSoFpKYtEE7c0oFxaKjrAFSB0H7g6NBUyphAE7U88m8EF2486FMAlz11Dn9EOMBmMeiAek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762337168; c=relaxed/simple;
	bh=mRqnub7hQVzpjQV4pc2+aLJS2FJBWktyhkeKzC5SOhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ru+ZCK6a77S+wuGgbvAQ/FNy5LLnoCqNODRqVDLe4VZ+uAcdTwqClTiVN5+/rlzvgBljRM3CpXNbNSDrUB0L4Rvt8Pfx9mAS4bXRa8f+AdjRrrP4JMgQ4dnwAOv0hOePXQpSoJZh0llnT4z8FIVkwqtm658PGRFbYUZfbIWwNtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I0R//2qX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I0R//2qX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762337162; x=1793873162;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mRqnub7hQVzpjQV4pc2+aLJS2FJBWktyhkeKzC5SOhU=;
  b=I0R//2qXGCw993litim9HuAbw0USKOjMN0hQaKTf3oChlgKethJCUP8T
   hrBrW+38NR+yfb1JReYXRQjHNTdcnC5bM/03ZJRgwPutsNbMRjDflZFWi
   FgQhImMoYGPyUS0oAj5uDk3WzSWYdA4svA533JWFvJejD6jlqM9x2Em6d
   EtbD4roEdVpM+lX9/XfphxDIQtPMeVFJxj5mjkB/0lwhcuPN2mJoaUShp
   ZG21eZRD3+9FjWx0lsVLKJXr450QxqjqvkhH19WjCZd3tWamxLtBVZG/S
   siqI4aRCppKcCvOZ+wIok80hHAFPADfVf9oeXa4NJ1bdNppGK2c8Mp1af
   Q==;
X-CSE-ConnectionGUID: aHx70SyUQ9yy8Nwe5/jniQ==
X-CSE-MsgGUID: ymAKBqajRuqHulpax9q/NQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="63652157"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="63652157"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 02:06:01 -0800
X-CSE-ConnectionGUID: HrMqxLimQxOBm/o+afrB1w==
X-CSE-MsgGUID: 5WtF2iUNRkSCb/b4uraM4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; 
   d="scan'208";a="188139919"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 05 Nov 2025 02:06:01 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGaOt-000SP2-1B;
	Wed, 05 Nov 2025 10:05:59 +0000
Date: Wed, 5 Nov 2025 18:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 3/6 v7] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
Message-ID: <202511051740.HlE2bTd2-lkp@intel.com>
References: <20251104182446.863422-4-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251104182446.863422-4-fabio.m.de.francesco@linux.intel.com>

Hi Fabio,

kernel test robot noticed the following build errors:

[auto build test ERROR on c9cfc122f03711a5124b4aafab3211cf4d35a2ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabio-M-De-Francesco/ACPI-extlog-Trace-CPER-Non-standard-Section-Body/20251105-022733
base:   c9cfc122f03711a5124b4aafab3211cf4d35a2ac
patch link:    https://lore.kernel.org/r/20251104182446.863422-4-fabio.m.de.francesco%40linux.intel.com
patch subject: [PATCH 3/6 v7] acpi/ghes: Make GHES select ACPI_APEI_PCIEAER
config: x86_64-randconfig-074-20251105 (https://download.01.org/0day-ci/archive/20251105/202511051740.HlE2bTd2-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511051740.HlE2bTd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511051740.HlE2bTd2-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/pci/pci-driver.c:1591:6: warning: no previous prototype for function 'pci_uevent_ers' [-Wmissing-prototypes]
    1591 | void pci_uevent_ers(struct pci_dev *pdev, enum pci_ers_result err_type)
         |      ^
   drivers/pci/pci-driver.c:1591:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1591 | void pci_uevent_ers(struct pci_dev *pdev, enum pci_ers_result err_type)
         | ^
         | static 
   1 warning generated.
--
>> drivers/pci/pcie/err.c:83:2: error: call to undeclared function 'pci_uevent_ers'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |         pci_uevent_ers(dev, vote);
         |         ^
   drivers/pci/pcie/err.c:124:2: error: call to undeclared function 'pci_uevent_ers'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     124 |         pci_uevent_ers(dev, PCI_ERS_RESULT_DISCONNECT);
         |         ^
   drivers/pci/pcie/err.c:182:2: error: call to undeclared function 'pci_uevent_ers'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     182 |         pci_uevent_ers(dev, PCI_ERS_RESULT_RECOVERED);
         |         ^
   3 errors generated.
--
>> drivers/pci/pcie/aer.c:1754:15: error: no member named 'rcec' in 'struct pci_dev'
    1754 |                 root = dev->rcec;
         |                        ~~~  ^
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCIEAER
   Depends on [n]: PCI [=y] && PCIEPORTBUS [=n]
   Selected by [y]:
   - ACPI_APEI_GHES [=y] && ACPI [=y] && ACPI_APEI [=y]


vim +/pci_uevent_ers +83 drivers/pci/pcie/err.c

2e28bc84cf6eecd Oza Pawandeep      2018-05-17  48  
542aeb9c8f930e4 Keith Busch        2018-09-20  49  static int report_error_detected(struct pci_dev *dev,
16d79cd4e23b196 Luc Van Oostenryck 2020-07-02  50  				 pci_channel_state_t state,
542aeb9c8f930e4 Keith Busch        2018-09-20  51  				 enum pci_ers_result *result)
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  52  {
171d149ce8d11f7 Bjorn Helgaas      2021-10-12  53  	struct pci_driver *pdrv;
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  54  	pci_ers_result_t vote;
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  55  	const struct pci_error_handlers *err_handler;
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  56  
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  57  	device_lock(&dev->dev);
e0217c5ba10d7bf Bjorn Helgaas      2021-11-10  58  	pdrv = dev->driver;
5e69a33c5cec019 Christoph Hellwig  2022-06-01  59  	if (pci_dev_is_disconnected(dev)) {
5e69a33c5cec019 Christoph Hellwig  2022-06-01  60  		vote = PCI_ERS_RESULT_DISCONNECT;
5e69a33c5cec019 Christoph Hellwig  2022-06-01  61  	} else if (!pci_dev_set_io_state(dev, state)) {
5e69a33c5cec019 Christoph Hellwig  2022-06-01  62  		pci_info(dev, "can't recover (state transition %u -> %u invalid)\n",
5e69a33c5cec019 Christoph Hellwig  2022-06-01  63  			dev->error_state, state);
5e69a33c5cec019 Christoph Hellwig  2022-06-01  64  		vote = PCI_ERS_RESULT_NONE;
5e69a33c5cec019 Christoph Hellwig  2022-06-01  65  	} else if (!pdrv || !pdrv->err_handler ||
171d149ce8d11f7 Bjorn Helgaas      2021-10-12  66  		   !pdrv->err_handler->error_detected) {
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  67  		/*
bfcb79fca19d267 Keith Busch        2018-09-20  68  		 * If any device in the subtree does not have an error_detected
bfcb79fca19d267 Keith Busch        2018-09-20  69  		 * callback, PCI_ERS_RESULT_NO_AER_DRIVER prevents subsequent
bfcb79fca19d267 Keith Busch        2018-09-20  70  		 * error callbacks of "any" device in the subtree, and will
bfcb79fca19d267 Keith Busch        2018-09-20  71  		 * exit in the disconnected error state.
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  72  		 */
01daacfb9035e5b Yicong Yang        2019-12-13  73  		if (dev->hdr_type != PCI_HEADER_TYPE_BRIDGE) {
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  74  			vote = PCI_ERS_RESULT_NO_AER_DRIVER;
8d077c3ce0109c4 Bjorn Helgaas      2019-12-13  75  			pci_info(dev, "can't recover (no error_detected callback)\n");
01daacfb9035e5b Yicong Yang        2019-12-13  76  		} else {
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  77  			vote = PCI_ERS_RESULT_NONE;
01daacfb9035e5b Yicong Yang        2019-12-13  78  		}
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  79  	} else {
171d149ce8d11f7 Bjorn Helgaas      2021-10-12  80  		err_handler = pdrv->err_handler;
542aeb9c8f930e4 Keith Busch        2018-09-20  81  		vote = err_handler->error_detected(dev, state);
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  82  	}
7b42d97e99d3a2b Keith Busch        2018-09-20 @83  	pci_uevent_ers(dev, vote);
542aeb9c8f930e4 Keith Busch        2018-09-20  84  	*result = merge_result(*result, vote);
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  85  	device_unlock(&dev->dev);
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  86  	return 0;
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  87  }
2e28bc84cf6eecd Oza Pawandeep      2018-05-17  88  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
