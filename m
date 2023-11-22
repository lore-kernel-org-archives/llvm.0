Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B29E4C3B5;
	Wed, 22 Nov 2023 14:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mQpH1rxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700664595; x=1732200595;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RJQSX1USk0jBKNT3bSTmVGeZ28ptI6qc3Rb36sSm4jU=;
  b=mQpH1rxi8USdbTs6UlMNmyvl02DVEYu7xnWRZ4wVw3scetyatLU7aHag
   H6qadZ25n1H35H62udCRSc05N+Dsrb3lNZbT6Cu067PHXx4dySI6uuuZr
   STGZQ/zSthlU5Rwo2/97jsMziRc2cyqdRL2n0p90s8qGmbNv5qs1B1vGI
   ruq80+h3WR3DIwMSZN+DwF0kbZd94NqJwS1C1dMF1g0qiBvJhUVoYvXCR
   Vmbu3ho/OQGQGctTHt+ipjPGFQR+OGzXXFNjW2ciZybyAwePLctHwHWPg
   0MbIDsYYUoSv89vqyxAm+HugjLsu/6LoF4zM+eJcTss3/6mmkJBbBPLHP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="395989829"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="395989829"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 06:49:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884635675"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; 
   d="scan'208";a="884635675"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 06:49:04 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5oXG-0000ZQ-0P;
	Wed, 22 Nov 2023 14:49:02 +0000
Date: Wed, 22 Nov 2023 22:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Seiler <c.seiler@luxflux.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] [RFC] gpio: adv-pcie-1761h: Add Advantech PCIe-1761H
 support
Message-ID: <202311221945.c0KQRyT3-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.7-rc2 next-20231122]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christian-Seiler/gpio-adv-pcie-1761h-Add-Advantech-PCIe-1761H-support/20231120-232211
base:   linus/master
patch link:    https://lore.kernel.org/r/b7e8e35fc4534a2c928853dfacd3d55d88f2033e.camel%40luxflux.de
patch subject: [PATCH] [RFC] gpio: adv-pcie-1761h: Add Advantech PCIe-1761H support
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231122/202311221945.c0KQRyT3-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221945.c0KQRyT3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221945.c0KQRyT3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpio/gpio-adv-pcie-1761h.c:374:13: warning: no previous prototype for function 'adv_pcie_1761h_irq_handler' [-Wmissing-prototypes]
   irqreturn_t adv_pcie_1761h_irq_handler(int irq, void *data)
               ^
   drivers/gpio/gpio-adv-pcie-1761h.c:374:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   irqreturn_t adv_pcie_1761h_irq_handler(int irq, void *data)
   ^
   static 
   1 warning generated.


vim +/adv_pcie_1761h_irq_handler +374 drivers/gpio/gpio-adv-pcie-1761h.c

   373	
 > 374	irqreturn_t adv_pcie_1761h_irq_handler(int irq, void *data)
   375	{
   376		struct adv_pcie_1761h_gpiochip *card = data;
   377		unsigned long pending;
   378	
   379		if (card == NULL)
   380			return IRQ_HANDLED;
   381	
   382		/* Read out which lines were set */
   383		raw_spin_lock(&card->lock);
   384		pending = ioread32(card->control_regs + PCIE1761H_OFFSET_IRQFLAG);
   385		raw_spin_unlock(&card->lock);
   386	
   387		if (!pending)
   388			return IRQ_NONE;
   389	
   390		for_each_set_bit(irq, &pending, card->chip.ngpio - 8)
   391			generic_handle_domain_irq(card->chip.irq.domain, irq + 8);
   392	
   393		/* Reset the IRQ flags for those lines */
   394		raw_spin_lock(&card->lock);
   395		iowrite32(pending, card->control_regs + PCIE1761H_OFFSET_IRQFLAG);
   396		raw_spin_unlock(&card->lock);
   397	
   398		return IRQ_HANDLED;
   399	}
   400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
