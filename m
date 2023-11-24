Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86B28F4F;
	Fri, 24 Nov 2023 07:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KALTu57K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700812648; x=1732348648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bcJ/wroXGvXqYu7OuUbpx0MQyV6Ih/sFkToKZX2RMZk=;
  b=KALTu57KCxiTXIgxYSt9z86JaGJ4lSWC7hAYZx/u25NvhfP9pH7ZYUjD
   /+z6+DcLPyuhHDtk62xVbelcm7FBBk7znRCN0tjYcV1OLBKlKw/WkSyfr
   3EtmicJRuChprH2qCoMa1tI0fM/IHPhKV/2QW4zjofXpVPW8sziXhY5y1
   bQZ+f/L5sq6FyvXAiGo4m42ks/Wd7bEfWn9dteknDQNhHZIxyDe0MMqFr
   qGA9M9g0tPv3kQGRN5bim210Fqp/L6Ewi8rMzfIVWm4zLJMiW0IJjTGvn
   YzcbcjS+bvplV8iB57IWV0KPSI5mc1kigII5YFKftr4op1xSObSrjjY3+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395199278"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="395199278"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 23:57:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="767393106"
X-IronPort-AV: E=Sophos;i="6.04,223,1695711600"; 
   d="scan'208";a="767393106"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 23 Nov 2023 23:57:27 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6R40-0002El-2c;
	Fri, 24 Nov 2023 07:57:24 +0000
Date: Fri, 24 Nov 2023 15:56:52 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Seiler <c.seiler@luxflux.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] gpio: adv-pcie-1761h: Add Advantech PCIe-1761H
 support
Message-ID: <202311241249.PCyP5woT-lkp@intel.com>
References: <b7e8e35fc4534a2c928853dfacd3d55d88f2033e.camel@luxflux.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7e8e35fc4534a2c928853dfacd3d55d88f2033e.camel@luxflux.de>

Hi Christian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Seiler/gpio-adv-pcie-1761h-Add-Advantech-PCIe-1761H-support/20231120-232211
base:   linus/master
patch link:    https://lore.kernel.org/r/b7e8e35fc4534a2c928853dfacd3d55d88f2033e.camel%40luxflux.de
patch subject: [PATCH] [RFC] gpio: adv-pcie-1761h: Add Advantech PCIe-1761H support
config: arm64-randconfig-004-20231124 (https://download.01.org/0day-ci/archive/20231124/202311241249.PCyP5woT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241249.PCyP5woT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241249.PCyP5woT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/gpio/gpio-adv-pcie-1761h.c:374:13: warning: no previous prototype for function 'adv_pcie_1761h_irq_handler' [-Wmissing-prototypes]
     374 | irqreturn_t adv_pcie_1761h_irq_handler(int irq, void *data)
         |             ^
   drivers/gpio/gpio-adv-pcie-1761h.c:374:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     374 | irqreturn_t adv_pcie_1761h_irq_handler(int irq, void *data)
         | ^
         | static 
>> drivers/gpio/gpio-adv-pcie-1761h.c:557:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
     557 | module_pci_driver(adv_pcie_1761h_driver);
         | ^
         | int
>> drivers/gpio/gpio-adv-pcie-1761h.c:557:19: error: a parameter list without types is only allowed in a function definition
     557 | module_pci_driver(adv_pcie_1761h_driver);
         |                   ^
   1 warning and 2 errors generated.


vim +/int +557 drivers/gpio/gpio-adv-pcie-1761h.c

   556	
 > 557	module_pci_driver(adv_pcie_1761h_driver);
   558	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
