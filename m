Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BDF199249;
	Sat, 15 Feb 2025 06:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739601437; cv=none; b=G9BYDRr3UKSj16R4BolHDidQ0b+Z2KqTkRyeGbVhKLryqAxz0Aka0EEtBU2cqZLdUUBP/hP9jQg2FzhyzzXEY0ehnyfeeFltGgxIFUqMVHN3mITQCE2rf1JZYFjp4BKSni0HaBlfeXiLJPvq2s3PJd0TEGJGefPuUtFpy+aovB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739601437; c=relaxed/simple;
	bh=QBeIE5swiWYzIysYqxhRT9meAJBHaGJRHtFiEDHdxjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IovEEr2hqgdvYIiKOulBB9lW9OKVkB7lA6o/iOpsVCKyUg0J+rQSjA/LV/gvAstjQy5vePjE5nMzmHrbxgCBFSZZF3S6yaMfiEPQT/Pjty1YbtpW+LRPpSAEk/sGNJA3Qr/2G/2oB1tv5gRpG9PPyrmh9r5DG5toXItVN5qPT7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4Tf3V9M; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4Tf3V9M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739601435; x=1771137435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QBeIE5swiWYzIysYqxhRT9meAJBHaGJRHtFiEDHdxjE=;
  b=A4Tf3V9MRAKdCr3lBUrhVPVY0bkKqmme71FnyQH4+PuCj48+CJPtqmht
   DKuolC7xd16zhRb/6rXFtubla5RI27U4CILRakaJVitF80bSkgpNUGDcL
   TvOohRCzt/7Mb+h0m7MaF7IVA7Xj+WvGupgyEO68YERlLzSJQO+n4EWgE
   U99rM32Wl8pWJJvJbcU+v5SkX7ZlYHsloQ7OffgyeNlhjCimqhgOW3y1J
   2bBBMIeCi87ezVdaXtKntXdU5bkD8i5yWJzP8JtUx0xZuz9dyVbbC682X
   NMRZO/Gqaz/N5CbDfxp/UWfvnDvbaOys7NIScy8fzaNFDf7NRYYi7zNxB
   g==;
X-CSE-ConnectionGUID: n4quh6DCT7iz7rRxM1capA==
X-CSE-MsgGUID: 7wic24RCSEyfIHBcALtm6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="44286480"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="44286480"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 22:37:15 -0800
X-CSE-ConnectionGUID: hyiZc03lTzSsi1LeaQUbpw==
X-CSE-MsgGUID: YKdP8ZFZT1WqPCpXGHRSfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113514707"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2025 22:37:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjBnV-001AZ9-0a;
	Sat, 15 Feb 2025 06:37:05 +0000
Date: Sat, 15 Feb 2025 14:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
Message-ID: <202502151415.DVoOTNdR-lkp@intel.com>
References: <20250213-mem-cocci-v3-v1-11-93466d165349@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-mem-cocci-v3-v1-11-93466d165349@redhat.com>

Hi Anusha,

kernel test robot noticed the following build errors:

[auto build test ERROR on 68763b29e0a6441f57f9ee652bbf8e7bc59183e5]

url:    https://github.com/intel-lab-lkp/linux/commits/Anusha-Srivatsa/drm-aspeed-move-to-devm_platform_ioremap_resource-usage/20250214-082448
base:   68763b29e0a6441f57f9ee652bbf8e7bc59183e5
patch link:    https://lore.kernel.org/r/20250213-mem-cocci-v3-v1-11-93466d165349%40redhat.com
patch subject: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource() usage
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502151415.DVoOTNdR-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 910be4ff90d7d07bd4518ea03b85c0974672bf9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502151415.DVoOTNdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502151415.DVoOTNdR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/vc4/vc4_hdmi.c:38:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:549:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     549 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:567:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     567 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/vc4/vc4_hdmi.c:38:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:585:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from drivers/gpu/drm/vc4/vc4_hdmi.c:38:
   In file included from include/drm/drm_atomic_helper.h:31:
   In file included from include/drm/drm_crtc.h:32:
   In file included from include/drm/drm_modes.h:33:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:601:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     601 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:616:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     616 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:631:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     631 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:724:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     724 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:737:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     737 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:750:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     750 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:764:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     764 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:778:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     778 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:792:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     792 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> drivers/gpu/drm/vc4/vc4_hdmi.c:2966:2: error: use of undeclared identifier 'res'; did you mean 'ret'?
    2966 |         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
         |         ^~~
         |         ret
   drivers/gpu/drm/vc4/vc4_hdmi.c:2954:6: note: 'ret' declared here
    2954 |         int ret;
         |             ^
>> drivers/gpu/drm/vc4/vc4_hdmi.c:2966:6: error: incompatible pointer to integer conversion assigning to 'int' from 'struct resource *' [-Wint-conversion]
    2966 |         res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
         |             ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/vc4/vc4_hdmi.c:2967:7: error: use of undeclared identifier 'res'; did you mean 'ret'?
    2967 |         if (!res)
         |              ^~~
         |              ret
   drivers/gpu/drm/vc4/vc4_hdmi.c:2954:6: note: 'ret' declared here
    2954 |         int ret;
         |             ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:2970:40: error: use of undeclared identifier 'res'
    2970 |         vc4_hdmi->hd_regs = devm_ioremap(dev, res->start, resource_size(res));
         |                                               ^
   drivers/gpu/drm/vc4/vc4_hdmi.c:2970:66: error: use of undeclared identifier 'res'
    2970 |         vc4_hdmi->hd_regs = devm_ioremap(dev, res->start, resource_size(res));
         |                                                                         ^
   12 warnings and 5 errors generated.


vim +2966 drivers/gpu/drm/vc4/vc4_hdmi.c

33c773eb62eaa1b Maxime Ripard   2020-09-03  2948  
a3dbb1c01657683 Maxime Ripard   2022-07-11  2949  static int vc5_hdmi_init_resources(struct drm_device *drm,
a3dbb1c01657683 Maxime Ripard   2022-07-11  2950  				   struct vc4_hdmi *vc4_hdmi)
8323989140f3e58 Maxime Ripard   2020-09-03  2951  {
8323989140f3e58 Maxime Ripard   2020-09-03  2952  	struct platform_device *pdev = vc4_hdmi->pdev;
8323989140f3e58 Maxime Ripard   2020-09-03  2953  	struct device *dev = &pdev->dev;
25eb441d55d4795 Dave Stevenson  2022-06-13  2954  	int ret;
8323989140f3e58 Maxime Ripard   2020-09-03  2955  
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2956  	vc4_hdmi->hdmicore_regs = devm_platform_ioremap_resource_byname(pdev,
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2957  									"hdmi");
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2958  	if (!vc4_hdmi->hdmicore_regs)
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2959  		return -ENOMEM;
8323989140f3e58 Maxime Ripard   2020-09-03  2960  
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2961  	/* This is shared between both HDMI controllers. Cannot
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2962  	 * claim for both instances. Lets not convert to using
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2963  	 * devm_platform_ioremap_resource_byname() like
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2964  	 * the rest
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2965  	 */
8323989140f3e58 Maxime Ripard   2020-09-03 @2966  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd");
8323989140f3e58 Maxime Ripard   2020-09-03  2967  	if (!res)
8323989140f3e58 Maxime Ripard   2020-09-03  2968  		return -ENODEV;
8323989140f3e58 Maxime Ripard   2020-09-03  2969  
8323989140f3e58 Maxime Ripard   2020-09-03  2970  	vc4_hdmi->hd_regs = devm_ioremap(dev, res->start, resource_size(res));
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2971  	if (!vc4_hdmi->hd_regs)
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2972  		return -ENOMEM;
8323989140f3e58 Maxime Ripard   2020-09-03  2973  
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2974  	vc4_hdmi->cec_regs = devm_platform_ioremap_resource_byname(pdev,
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2975  								   "cec");
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2976  	if (!vc4_hdmi->cec_regs)
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2977  		return -ENOMEM;
8323989140f3e58 Maxime Ripard   2020-09-03  2978  
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2979  	vc4_hdmi->csc_regs = devm_platform_ioremap_resource_byname(pdev,
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2980  								   "csc");
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2981  	if (!vc4_hdmi->csc_regs)
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2982  		return -ENOMEM;
8323989140f3e58 Maxime Ripard   2020-09-03  2983  
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2984  	vc4_hdmi->dvp_regs = devm_platform_ioremap_resource_byname(pdev,
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2985  								   "dvp");
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2986  	if (!vc4_hdmi->dvp_regs)
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2987  		return -ENOMEM;
8323989140f3e58 Maxime Ripard   2020-09-03  2988  
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2989  	vc4_hdmi->phy_regs = devm_platform_ioremap_resource_byname(pdev,
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2990  								   "phy");
8323989140f3e58 Maxime Ripard   2020-09-03  2991  
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2992  	if (!vc4_hdmi->phy_regs)
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2993  		return -ENOMEM;
8323989140f3e58 Maxime Ripard   2020-09-03  2994  
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2995  	vc4_hdmi->ram_regs = devm_platform_ioremap_resource_byname(pdev,
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  2996  								   "packet");
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2997  	if (!vc4_hdmi->ram_regs)
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  2998  		return -ENOMEM;
8323989140f3e58 Maxime Ripard   2020-09-03  2999  
678cf9dc28dc14a Anusha Srivatsa 2025-02-13  3000  	vc4_hdmi->rm_regs = devm_platform_ioremap_resource_byname(pdev, "rm");
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  3001  	if (!vc4_hdmi->rm_regs)
14929c5ae8b6dc4 Dan Carpenter   2020-09-10  3002  		return -ENOMEM;
8323989140f3e58 Maxime Ripard   2020-09-03  3003  
8323989140f3e58 Maxime Ripard   2020-09-03  3004  	vc4_hdmi->hsm_clock = devm_clk_get(dev, "hdmi");
8323989140f3e58 Maxime Ripard   2020-09-03  3005  	if (IS_ERR(vc4_hdmi->hsm_clock)) {
59ac702a932028f Stefan Wahren   2024-08-21  3006  		drm_err(drm, "Failed to get HDMI state machine clock\n");
8323989140f3e58 Maxime Ripard   2020-09-03  3007  		return PTR_ERR(vc4_hdmi->hsm_clock);
8323989140f3e58 Maxime Ripard   2020-09-03  3008  	}
8323989140f3e58 Maxime Ripard   2020-09-03  3009  
8323989140f3e58 Maxime Ripard   2020-09-03  3010  	vc4_hdmi->pixel_bvb_clock = devm_clk_get(dev, "bvb");
8323989140f3e58 Maxime Ripard   2020-09-03  3011  	if (IS_ERR(vc4_hdmi->pixel_bvb_clock)) {
59ac702a932028f Stefan Wahren   2024-08-21  3012  		drm_err(drm, "Failed to get pixel bvb clock\n");
8323989140f3e58 Maxime Ripard   2020-09-03  3013  		return PTR_ERR(vc4_hdmi->pixel_bvb_clock);
8323989140f3e58 Maxime Ripard   2020-09-03  3014  	}
8323989140f3e58 Maxime Ripard   2020-09-03  3015  
8323989140f3e58 Maxime Ripard   2020-09-03  3016  	vc4_hdmi->audio_clock = devm_clk_get(dev, "audio");
8323989140f3e58 Maxime Ripard   2020-09-03  3017  	if (IS_ERR(vc4_hdmi->audio_clock)) {
59ac702a932028f Stefan Wahren   2024-08-21  3018  		drm_err(drm, "Failed to get audio clock\n");
8323989140f3e58 Maxime Ripard   2020-09-03  3019  		return PTR_ERR(vc4_hdmi->audio_clock);
8323989140f3e58 Maxime Ripard   2020-09-03  3020  	}
8323989140f3e58 Maxime Ripard   2020-09-03  3021  
23b7eb5c12b3591 Maxime Ripard   2021-01-11  3022  	vc4_hdmi->cec_clock = devm_clk_get(dev, "cec");
23b7eb5c12b3591 Maxime Ripard   2021-01-11  3023  	if (IS_ERR(vc4_hdmi->cec_clock)) {
59ac702a932028f Stefan Wahren   2024-08-21  3024  		drm_err(drm, "Failed to get CEC clock\n");
23b7eb5c12b3591 Maxime Ripard   2021-01-11  3025  		return PTR_ERR(vc4_hdmi->cec_clock);
23b7eb5c12b3591 Maxime Ripard   2021-01-11  3026  	}
23b7eb5c12b3591 Maxime Ripard   2021-01-11  3027  
8323989140f3e58 Maxime Ripard   2020-09-03  3028  	vc4_hdmi->reset = devm_reset_control_get(dev, NULL);
8323989140f3e58 Maxime Ripard   2020-09-03  3029  	if (IS_ERR(vc4_hdmi->reset)) {
59ac702a932028f Stefan Wahren   2024-08-21  3030  		drm_err(drm, "Failed to get HDMI reset line\n");
8323989140f3e58 Maxime Ripard   2020-09-03  3031  		return PTR_ERR(vc4_hdmi->reset);
8323989140f3e58 Maxime Ripard   2020-09-03  3032  	}
8323989140f3e58 Maxime Ripard   2020-09-03  3033  
a3dbb1c01657683 Maxime Ripard   2022-07-11  3034  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->hdmi_regset, VC4_HDMI);
25eb441d55d4795 Dave Stevenson  2022-06-13  3035  	if (ret)
25eb441d55d4795 Dave Stevenson  2022-06-13  3036  		return ret;
25eb441d55d4795 Dave Stevenson  2022-06-13  3037  
a3dbb1c01657683 Maxime Ripard   2022-07-11  3038  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->hd_regset, VC4_HD);
25eb441d55d4795 Dave Stevenson  2022-06-13  3039  	if (ret)
25eb441d55d4795 Dave Stevenson  2022-06-13  3040  		return ret;
25eb441d55d4795 Dave Stevenson  2022-06-13  3041  
a3dbb1c01657683 Maxime Ripard   2022-07-11  3042  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->cec_regset, VC5_CEC);
25eb441d55d4795 Dave Stevenson  2022-06-13  3043  	if (ret)
25eb441d55d4795 Dave Stevenson  2022-06-13  3044  		return ret;
25eb441d55d4795 Dave Stevenson  2022-06-13  3045  
a3dbb1c01657683 Maxime Ripard   2022-07-11  3046  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->csc_regset, VC5_CSC);
25eb441d55d4795 Dave Stevenson  2022-06-13  3047  	if (ret)
25eb441d55d4795 Dave Stevenson  2022-06-13  3048  		return ret;
25eb441d55d4795 Dave Stevenson  2022-06-13  3049  
a3dbb1c01657683 Maxime Ripard   2022-07-11  3050  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->dvp_regset, VC5_DVP);
25eb441d55d4795 Dave Stevenson  2022-06-13  3051  	if (ret)
25eb441d55d4795 Dave Stevenson  2022-06-13  3052  		return ret;
25eb441d55d4795 Dave Stevenson  2022-06-13  3053  
a3dbb1c01657683 Maxime Ripard   2022-07-11  3054  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->phy_regset, VC5_PHY);
25eb441d55d4795 Dave Stevenson  2022-06-13  3055  	if (ret)
25eb441d55d4795 Dave Stevenson  2022-06-13  3056  		return ret;
25eb441d55d4795 Dave Stevenson  2022-06-13  3057  
a3dbb1c01657683 Maxime Ripard   2022-07-11  3058  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->ram_regset, VC5_RAM);
25eb441d55d4795 Dave Stevenson  2022-06-13  3059  	if (ret)
25eb441d55d4795 Dave Stevenson  2022-06-13  3060  		return ret;
25eb441d55d4795 Dave Stevenson  2022-06-13  3061  
a3dbb1c01657683 Maxime Ripard   2022-07-11  3062  	ret = vc4_hdmi_build_regset(drm, vc4_hdmi, &vc4_hdmi->rm_regset, VC5_RM);
25eb441d55d4795 Dave Stevenson  2022-06-13  3063  	if (ret)
25eb441d55d4795 Dave Stevenson  2022-06-13  3064  		return ret;
25eb441d55d4795 Dave Stevenson  2022-06-13  3065  
8323989140f3e58 Maxime Ripard   2020-09-03  3066  	return 0;
c8b75bca92cbf06 Eric Anholt     2015-03-02  3067  }
c8b75bca92cbf06 Eric Anholt     2015-03-02  3068  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
