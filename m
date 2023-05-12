Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E31261F4;
	Fri, 12 May 2023 22:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683930120; x=1715466120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wJcKusvohoPJQeEr14Ic0H47GbeuqbovBZy6tT6HE1Q=;
  b=XZwI6WRgwccGhkq7uTZPtdjhdHvlykodNChY20wIUP+4blR80gHYdiah
   AeGrwfs1cbNw+qgPUYqSn1aon0Eknkx8FRaa2eB9voY9OB0MjwHxnAET5
   Aab08H5Z8wkjV6DyuOUbjXEjaWQCSr2AdwhbXOG0RuHW1zEzJpMArB54I
   A7AXt3LwtdYGG8L8nI+1tAj3HtvuxeFKTXQIdhnjyqTbXMYRVO47oo4pq
   aHxKKNhlZ1G3beRyYJMN6PaaiMzDf6TT1aTA+86sXRarKQgwa/zKTlqOQ
   EQgQX389NAx7c0AOmc/0Xai3OeT3yubsG4IDfpZrF2D6UERf+/ulnX9c+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="331260202"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="331260202"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 15:21:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="844579495"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="844579495"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 12 May 2023 15:21:58 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxb9B-00058k-13;
	Fri, 12 May 2023 22:21:57 +0000
Date: Sat, 13 May 2023 06:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sasha Levin <sashal@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [linux-stable-rc:queue/6.2 122/127] drivers/dma/at_xdmac.c:2035:5:
 error: call to undeclared function 'at_xdmac_device_pause_set'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202305130643.yufVRYYL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/6.2
head:   50566c8d58486e50c02919613a995a7f6896e535
commit: 9bcdd2a6cb45163ad4c321dc134ca3b3c8af6f5b [122/127] dmaengine: at_xdmac: restore the content of grws register
config: arm-randconfig-r046-20230511 (https://download.01.org/0day-ci/archive/20230513/202305130643.yufVRYYL-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=9bcdd2a6cb45163ad4c321dc134ca3b3c8af6f5b
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/6.2
        git checkout 9bcdd2a6cb45163ad4c321dc134ca3b3c8af6f5b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305130643.yufVRYYL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dma/at_xdmac.c:2035:5: error: call to undeclared function 'at_xdmac_device_pause_set'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
                                   at_xdmac_device_pause_set(atxdmac, atchan);
                                   ^
   drivers/dma/at_xdmac.c:2035:5: note: did you mean 'at_xdmac_device_pause'?
   drivers/dma/at_xdmac.c:1810:12: note: 'at_xdmac_device_pause' declared here
   static int at_xdmac_device_pause(struct dma_chan *chan)
              ^
   1 error generated.


vim +/at_xdmac_device_pause_set +2035 drivers/dma/at_xdmac.c

  1998	
  1999	static int __maybe_unused atmel_xdmac_resume(struct device *dev)
  2000	{
  2001		struct at_xdmac		*atxdmac = dev_get_drvdata(dev);
  2002		struct at_xdmac_chan	*atchan;
  2003		struct dma_chan		*chan, *_chan;
  2004		struct platform_device	*pdev = container_of(dev, struct platform_device, dev);
  2005		int			i;
  2006		int ret;
  2007	
  2008		ret = clk_prepare_enable(atxdmac->clk);
  2009		if (ret)
  2010			return ret;
  2011	
  2012		at_xdmac_axi_config(pdev);
  2013	
  2014		/* Clear pending interrupts. */
  2015		for (i = 0; i < atxdmac->dma.chancnt; i++) {
  2016			atchan = &atxdmac->chan[i];
  2017			while (at_xdmac_chan_read(atchan, AT_XDMAC_CIS))
  2018				cpu_relax();
  2019		}
  2020	
  2021		at_xdmac_write(atxdmac, AT_XDMAC_GIE, atxdmac->save_gim);
  2022		list_for_each_entry_safe(chan, _chan, &atxdmac->dma.channels, device_node) {
  2023			atchan = to_at_xdmac_chan(chan);
  2024			at_xdmac_chan_write(atchan, AT_XDMAC_CC, atchan->save_cc);
  2025			if (at_xdmac_chan_is_cyclic(atchan)) {
  2026				if (at_xdmac_chan_is_paused(atchan))
  2027					at_xdmac_device_resume(chan);
  2028	
  2029				/*
  2030				 * We may resume from a deep sleep state where power
  2031				 * to DMA controller is cut-off. Thus, restore the
  2032				 * suspend state of channels set though dmaengine API.
  2033				 */
  2034				else if (at_xdmac_chan_is_paused(atchan))
> 2035					at_xdmac_device_pause_set(atxdmac, atchan);
  2036	
  2037				at_xdmac_chan_write(atchan, AT_XDMAC_CNDA, atchan->save_cnda);
  2038				at_xdmac_chan_write(atchan, AT_XDMAC_CNDC, atchan->save_cndc);
  2039				at_xdmac_chan_write(atchan, AT_XDMAC_CIE, atchan->save_cim);
  2040				wmb();
  2041				if (atxdmac->save_gs & atchan->mask)
  2042					at_xdmac_write(atxdmac, AT_XDMAC_GE, atchan->mask);
  2043			}
  2044		}
  2045		return 0;
  2046	}
  2047	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
