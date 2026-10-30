Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793359624;
	b=EK3G48vEuOxXZog2T0hdKQf31a0yVt190grqT4twDGUb5qK67FJmldSg9NujLCkbss9Z
	 LpYPOZ3quZFtAmENW3/L2E1aSlsClALAmqSm8QnYysLPfv95N2gG9GpJK/gZwMVSjE/qo
	 td8J1hgdBpO0idSGYMuky6Megtl7ii+lFujF+E2SgLqDQKz6BSiDsvPDpEO/Y+s6itFcY
	 86WvRsyfPw4KU67mb/npgLAqAkLCar302f/G1DiyhwDRGiyOfLr1ZjBeRSJCtV+e4W3pr
	 Ft8cPxwuArW2iBjWMTHeOsF23fXxpuz9aZOodwNf+BCmSdR3GPSsnhY+wHJuGQwLYlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793359624;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=aqTUG3MhRPMe3T+iwrEz6qtbFX2SNbhZovF7I8ufp5w=;
	b=WbBMkwGHoHm0g2LYaC6vF4AkVxAz04Lck/tOOBv2hINL1aKRmavnlqzmGRDjaviDPlbG
	 iyd4boTZkfKJKtCRWTpLe4o8EEot+mbRRcky81gcZRzl2VbhbwF/FyxpZrC+gPTMQVJLD
	 +jdQGAbgELOBFb4v1LMHTCxT7rDamkJwRViOXucEBSaayiNnQA5v09ruiNWaIyAWPckgh
	 sLR1XrDIzAdS/BtoghsIG82X1g+vwrh7Su2kJ3jVmy8C/a5OvYdAx0DihvsjiqRRWWjkR
	 7ZGIEKgeFiNfUAGfdM+47O79u6ey0E42ixFsXNmqkbzvoN89wJBHXmpfqLmrplk8Q/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=icHbeicO;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBFF606A323;
	Fri, 30 Oct 2026 11:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EBFF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=icHbeicO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793359623; x=1824895623;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ncUJX/DtM5+A/RZso1ZcCWeMShn2h681nclm+TFp2D4=;
  b=icHbeicO6worMvpJs8478JFSMcVXmiaoQWQHv7TYSfbP3NVfmSgT64ZN
   zQKyvuDR/KFBMLa5u6gcC7SrSQPkelHB8lBWj8o5zpWG4P+LgPjPppnG+
   BVcLwC6j8v/7VnGR7owikDIqxVzk4Aenf7Ry8vgU5QgPIJI8oxinfEIfq
   PCdyy7GCTtnmcyKmGCgY6LOomPJOovHTv6sEtFf46JpZq7cR3vKWMQfi+
   yr8/t9eiGe8QOUmP0WdxShO3aA0omk5xzfv14rHlVFtRHcQ+3dT5nFuyy
   i0M/2GPTSr4k/eMVxCgb3cmDaJSoifFevYXcr2T7SYHnjM5aLXrhL/dva
   g==;
X-CSE-ConnectionGUID: 8fIZK8enSFmhWFaczXUYEw==
X-CSE-MsgGUID: zKD7dwxyQUqbx0jUiXl8Pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2147039"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2147039"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 04:27:02 -0700
X-CSE-ConnectionGUID: pMjUirJuRP2pYbMl8LVzGA==
X-CSE-MsgGUID: bOa7RV4yQu22DE/uMwHFGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5539917"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 30 Oct 2026 04:26:58 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMkl6-00000000bea-25Xt;
	Fri, 30 Oct 2026 11:26:56 +0000
Date: Fri, 30 Oct 2026 19:26:29 +0800
From: kernel test robot <lkp@intel.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/3] PCI: qcom: Implement shutdown() callback
Message-ID: <202610302144.Iwq8RoDq-lkp@intel.com>
References: <20261029-shutdown-v7-3-3fd7a76a6991@oss.qualcomm.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-shutdown-v7-3-3fd7a76a6991@oss.qualcomm.com>

Hi Krishna,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 17bb0e2f6c8043f70a693a5f3797471cbed354c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Krishna-Chaitanya-Chundru/PCI-host-common-Fix-early-bus-walk-exit-in-d3cold_possible/20261029-094927
base:   17bb0e2f6c8043f70a693a5f3797471cbed354c8
patch link:    https://lore.kernel.org/r/20261029-shutdown-v7-3-3fd7a76a6991%40oss.qualcomm.com
patch subject: [PATCH v7 3/3] PCI: qcom: Implement shutdown() callback
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261030/202610302144.Iwq8RoDq-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610302144.Iwq8RoDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610302144.Iwq8RoDq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-qcom.c:2463:6: warning: variable 'pcie' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
    2463 |         if (pcie_cfg && pcie_cfg->firmware_managed) {
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pcie-qcom.c:2481:6: note: uninitialized use occurs here
    2481 |         if (pcie)
         |             ^~~~
   drivers/pci/controller/dwc/pcie-qcom.c:2463:2: note: remove the 'if' if its condition is always false
    2463 |         if (pcie_cfg && pcie_cfg->firmware_managed) {
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2464 |                 /*
         |                 ~~
    2465 |                  * Firmware owns the link teardown and clock/PHY shutdown in
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2466 |                  * this mode; Linux only owns the chained MSI IRQ(s), which
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2467 |                  * still need to be masked off before shutdown proceeds.
         |                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2468 |                  */
         |                  ~~
    2469 |                 pci = platform_get_drvdata(pdev);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    2470 |         } else {
         |         ~~~~~~
   drivers/pci/controller/dwc/pcie-qcom.c:2460:24: note: initialize the variable 'pcie' to silence this warning
    2460 |         struct qcom_pcie *pcie;
         |                               ^
         |                                = NULL
   1 warning generated.


vim +2463 drivers/pci/controller/dwc/pcie-qcom.c

  2456	
  2457	static void qcom_pcie_shutdown(struct platform_device *pdev)
  2458	{
  2459		const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
  2460		struct qcom_pcie *pcie;
  2461		struct dw_pcie *pci;
  2462	
> 2463		if (pcie_cfg && pcie_cfg->firmware_managed) {
  2464			/*
  2465			 * Firmware owns the link teardown and clock/PHY shutdown in
  2466			 * this mode; Linux only owns the chained MSI IRQ(s), which
  2467			 * still need to be masked off before shutdown proceeds.
  2468			 */
  2469			pci = platform_get_drvdata(pdev);
  2470		} else {
  2471			pcie = platform_get_drvdata(pdev);
  2472			pci = pcie->pci;
  2473	
  2474			if (pcie->global_irq)
  2475				disable_irq(pcie->global_irq);
  2476		}
  2477	
  2478		if (pci->pp.use_imsi_rx)
  2479			dw_pcie_free_msi(&pci->pp);
  2480	
  2481		if (pcie)
  2482			dw_pcie_suspend_noirq(pcie->pci, true);
  2483	
  2484		pm_runtime_put_sync(&pdev->dev);
  2485		pm_runtime_disable(&pdev->dev);
  2486	}
  2487	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
