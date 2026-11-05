Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793860151;
	b=AzTOxVnrl+atal6nI8q7ZNv6jyGqtE4Cg+ZlaPiME5UAF30Ltet6h82J4QcyEvJfeuMy
	 VOq0D+YKky3Ix+/wm9zOLFt0K4PqLD0w+cvpiJSqPrKFEz39BmCE252ZF3TUrHj7sCB9u
	 jtq5jCgP8b0Z2Rl1CwP4Kqy9IvoNYwWO1gL87zhonbhzcxXRQ8tMGSrhPDxlp72ZGb+Eg
	 TwWjnJ280O8qhho6arshY7/15AbgwcVKWSAiL2IXGwM/MZ2iOQjC0J5HhVBqPvwFyC5ju
	 DpcfbuB6knKyNzT8g6QqhGePKuxb3mZBY4ZMmp9vYvANHKdhJV0cqwkTBvKANCMFv+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793860151;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ymerU3qs+IE5SarRlTt1VKtK551vjj0c9kwV9TnzqGE=;
	b=sCAlSpBtYckZFY8e+zq6lcG5vqD4+3ploDm0qhVZUGqCFYManfWf743BV917vwr9UYTj
	 FeGqcLIAuouWkcp7jPwEZcEA49s9e7IvI4m/+KSQCzsnVOgMEW2epiJHR4AmBn4XMEFxz
	 6nQdTdNpHf6M1ZzEDHHsfGqd702DSMgtArQeaezYLqwOcaddSbZlfqnB3lNf8pDMfCANM
	 kmMXOuo+uC3k7uIORU5VYacdl1HCgvxl62KFapenwf599I/Pc8DmHT3jxT/W65dnKjVlX
	 TJ0+d+9E9anor+2Xh4cisWjZZCqn2CSJ6qgt9rbOTpRE0WHGZ5euAOOcBCO8V7edIWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DRwCC90U;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428DD606A328;
	Thu,  5 Nov 2026 06:29:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 428DD606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DRwCC90U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793860150; x=1825396150;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=t5hBDD13+lQVTKr4HGQoZraqtI76Sha+S89tCwE0n90=;
  b=DRwCC90UNTDO268sIHg6yoqQsP2EWvx2vR/ZJYPV1SfkafMBBwg+8cPo
   vYlpGOziR6SLA0j25MiSPPUJrXCIHpWNC0W04lhMZmVQcES4OS+gY1Drv
   gy4NQy53WbXqGsP6Rzt9zTRlexAHY2+YlNkVSc9aYHr6MsBiAZJhsHVyv
   Tqd/8jC9b+5idS0xfuFA6FTTA+BHxUiagrBecebR10P7u1lun96gBCLqN
   Cn0IFtAzxRVLi0K2Wi9nFBQwS9JA3iOw50F8s5xLE3TVAGZsnYZUjWYOk
   IgUYPHbNzEbl22boakqECvt4gUCQFNkfS116rgYjA/J2BNpxSogruPUDw
   w==;
X-CSE-ConnectionGUID: q0O+dUlfQ8WO9/ax0yLgrA==
X-CSE-MsgGUID: C9Ez0Hz2RWWT/tFIUq5lIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2630128"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2630128"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 22:29:09 -0800
X-CSE-ConnectionGUID: 51cbibPgTa+oa4yEGFhgvw==
X-CSE-MsgGUID: ZCdruSxMSvuEUaYY291XpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6763797"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2026 22:29:03 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOqy2-00000000lnN-303Z;
	Thu, 05 Nov 2026 06:28:58 +0000
Date: Thu, 5 Nov 2026 14:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Yureka Lilian <yureka@cyberchaos.dev>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
Subject: Re: [PATCH v2 1/3] PCI/pwrctrl: Export per-device APIs
Message-ID: <202611051425.vj4FPfnn-lkp@intel.com>
References: <20261104-apple-pcie-pwren-v2-1-216a4066965f@cyberchaos.dev>
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
In-Reply-To: <20261104-apple-pcie-pwren-v2-1-216a4066965f@cyberchaos.dev>

Hi Yureka,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4]

url:    https://github.com/intel-lab-lkp/linux/commits/Yureka-Lilian/PCI-pwrctrl-Export-per-device-APIs/20261104-124029
base:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
patch link:    https://lore.kernel.org/r/20261104-apple-pcie-pwren-v2-1-216a4066965f%40cyberchaos.dev
patch subject: [PATCH v2 1/3] PCI/pwrctrl: Export per-device APIs
config: arm-defconfig (https://download.01.org/0day-ci/archive/20261105/202611051425.vj4FPfnn-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 812626a41399a1d464a0d69627ab45c83b8ebfb9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611051425.vj4FPfnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611051425.vj4FPfnn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/pwrctrl/core.c:203 function parameter 'np' not described in 'pci_pwrctrl_power_off_device'
>> Warning: drivers/pci/pwrctrl/core.c:203 Excess function parameter 'device_node' description in 'pci_pwrctrl_power_off_device'
>> Warning: drivers/pci/pwrctrl/core.c:272 function parameter 'np' not described in 'pci_pwrctrl_power_on_device'
>> Warning: drivers/pci/pwrctrl/core.c:272 Excess function parameter 'device_node' description in 'pci_pwrctrl_power_on_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 function parameter 'np' not described in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 function parameter 'parent' not described in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 Excess function parameter 'device_node' description in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:439 function parameter 'np' not described in 'pci_pwrctrl_destroy_device'
>> Warning: drivers/pci/pwrctrl/core.c:439 Excess function parameter 'device_node' description in 'pci_pwrctrl_destroy_device'
>> Warning: drivers/pci/pwrctrl/core.c:203 function parameter 'np' not described in 'pci_pwrctrl_power_off_device'
>> Warning: drivers/pci/pwrctrl/core.c:203 Excess function parameter 'device_node' description in 'pci_pwrctrl_power_off_device'
>> Warning: drivers/pci/pwrctrl/core.c:272 function parameter 'np' not described in 'pci_pwrctrl_power_on_device'
>> Warning: drivers/pci/pwrctrl/core.c:272 Excess function parameter 'device_node' description in 'pci_pwrctrl_power_on_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 function parameter 'np' not described in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 function parameter 'parent' not described in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:370 Excess function parameter 'device_node' description in 'pci_pwrctrl_create_device'
>> Warning: drivers/pci/pwrctrl/core.c:439 function parameter 'np' not described in 'pci_pwrctrl_destroy_device'
>> Warning: drivers/pci/pwrctrl/core.c:439 Excess function parameter 'device_node' description in 'pci_pwrctrl_destroy_device'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
