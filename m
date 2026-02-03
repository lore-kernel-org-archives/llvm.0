Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A63636AB59;
	Tue,  3 Feb 2026 20:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770149868; cv=none; b=IjjhLUotRCxou1vZoGMq+BZpmlRK2QteqLXWsNyQRgMp+zUjfm/xZK761C2pIiCllL6tf0rBzJ0Lo1vGTP3ftJN6yGspp1bKhMthytadWeStmBhdKO/5VXevncXWlQ8g4/zAqu9U5uI0J6qWxMSFfgsusgdZetTBdN3G0d0OTlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770149868; c=relaxed/simple;
	bh=b90BARI6YzMEIQjf7x7oPzPUF+lU/j+4y2+e84dAKRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkrptI61uopKaJ8gy+Utns6nOJlh9L0iRumZmtei192IS7AfYaxdARgaSEHUhgNe3+jJlvKEPmqVhgG8eDLsWQd121BJIgUaLUGijUd11WkIhqbPFqs0PXmNecVih/OaBmWKtZsRzvL8UWRe/YqJ1IMffOg3WmxgEVD2RuHn8Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNTXFAJF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNTXFAJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770149864; x=1801685864;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b90BARI6YzMEIQjf7x7oPzPUF+lU/j+4y2+e84dAKRY=;
  b=TNTXFAJFnujbthB/GL+8s2a4hMCvRloZgWI673zXzUON3o4AbL24BgGF
   1YyMsrCWeRzimvscllr6L97zNfZJAmmnmMgYLXrS9ZYVeVOLAt4tsqKiy
   FrzeU6AHr1X9hRMrc9LikZXZXcnllZsTDOXjB6DuSbndbEWEPxHsSDN2h
   zBKBMdY4iVyD+d6tCP0/KvcZNUe4uiX/tO7Oul12mpFm0E6+8uJPCiEaC
   fSH+T8E1vnQm8aYOtpDUu8qqMpdLrTiARUrt90mHG9P8Easa3KD6GF1ox
   IArXqYaeMOLidQThFSnSgLRSC5LAz1mRRKA1LBvHoKI7ySZ5/wELYMtzk
   Q==;
X-CSE-ConnectionGUID: GpWEPJliTSuf8j4D24WSQg==
X-CSE-MsgGUID: jZgd7MaHQ6OB5YQUMDquOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="96787473"
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="96787473"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 12:17:44 -0800
X-CSE-ConnectionGUID: bdGSfGD4QP6qT9nlTmTRsg==
X-CSE-MsgGUID: 6a0n0YStRrqvYM1wG++siA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,271,1763452800"; 
   d="scan'208";a="214107807"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 Feb 2026 12:17:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnMqB-00000000h34-2TXl;
	Tue, 03 Feb 2026 20:17:39 +0000
Date: Wed, 4 Feb 2026 04:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: Philipp Stanner <phasta@kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Vinod Koul <vkoul@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>
Subject: Re: [PATCH] dmaengine: amd: Replace deprecated PCI functions
Message-ID: <202602040433.65nFJ1K1-lkp@intel.com>
References: <20260203123238.88598-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203123238.88598-2-phasta@kernel.org>

Hi Philipp,

kernel test robot noticed the following build errors:

[auto build test ERROR on vkoul-dmaengine/next]
[also build test ERROR on linus/master v6.19-rc8 next-20260202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Philipp-Stanner/dmaengine-amd-Replace-deprecated-PCI-functions/20260203-204040
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20260203123238.88598-2-phasta%40kernel.org
patch subject: [PATCH] dmaengine: amd: Replace deprecated PCI functions
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260204/202602040433.65nFJ1K1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602040433.65nFJ1K1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602040433.65nFJ1K1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/amd/ptdma/ptdma-pci.c:156:40: error: use of undeclared identifier 'ptdma'
     156 |                 ret = pcim_request_region(pdev, bar, DRIVER_NAME);
         |                                                      ^
   drivers/dma/amd/ptdma/ptdma-pci.c:26:21: note: expanded from macro 'DRIVER_NAME'
      26 | #define DRIVER_NAME ptdma
         |                     ^
   drivers/dma/amd/ptdma/ptdma-pci.c:230:10: error: use of undeclared identifier 'ptdma'
     230 |         .name = DRIVER_NAME,
         |                 ^
   drivers/dma/amd/ptdma/ptdma-pci.c:26:21: note: expanded from macro 'DRIVER_NAME'
      26 | #define DRIVER_NAME ptdma
         |                     ^
   2 errors generated.


vim +/ptdma +156 drivers/dma/amd/ptdma/ptdma-pci.c

   122	
   123	static int pt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
   124	{
   125		struct pt_device *pt;
   126		struct pt_msix *pt_msix;
   127		struct device *dev = &pdev->dev;
   128		unsigned long bar_mask;
   129		int ret = -ENOMEM;
   130		int bar;
   131	
   132		pt = pt_alloc_struct(dev);
   133		if (!pt)
   134			goto e_err;
   135	
   136		pt_msix = devm_kzalloc(dev, sizeof(*pt_msix), GFP_KERNEL);
   137		if (!pt_msix)
   138			goto e_err;
   139	
   140		pt->pt_msix = pt_msix;
   141		pt->dev_vdata = (struct pt_dev_vdata *)id->driver_data;
   142		if (!pt->dev_vdata) {
   143			ret = -ENODEV;
   144			dev_err(dev, "missing driver data\n");
   145			goto e_err;
   146		}
   147	
   148		ret = pcim_enable_device(pdev);
   149		if (ret) {
   150			dev_err(dev, "pcim_enable_device failed (%d)\n", ret);
   151			goto e_err;
   152		}
   153	
   154		bar_mask = pci_select_bars(pdev, IORESOURCE_MEM);
   155		for_each_set_bit(bar, &bar_mask, sizeof(bar_mask)) {
 > 156			ret = pcim_request_region(pdev, bar, DRIVER_NAME);
   157			if (ret) {
   158				dev_err(dev, "pcim_iomap_regions failed (%d)\n", ret);
   159				goto e_err;
   160			}
   161		}
   162	
   163		pt->io_regs = pcim_iomap(pdev, pt->dev_vdata->bar, 0);
   164		if (!pt->io_regs) {
   165			dev_err(dev, "ioremap failed\n");
   166			ret = -ENOMEM;
   167			goto e_err;
   168		}
   169	
   170		ret = pt_get_irqs(pt);
   171		if (ret)
   172			goto e_err;
   173	
   174		pci_set_master(pdev);
   175	
   176		ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
   177		if (ret) {
   178			ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
   179			if (ret) {
   180				dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n",
   181					ret);
   182				goto e_err;
   183			}
   184		}
   185	
   186		dev_set_drvdata(dev, pt);
   187	
   188		if (pt->dev_vdata)
   189			ret = pt_core_init(pt);
   190	
   191		if (ret)
   192			goto e_err;
   193	
   194		return 0;
   195	
   196	e_err:
   197		dev_err(dev, "initialization failed ret = %d\n", ret);
   198	
   199		return ret;
   200	}
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
