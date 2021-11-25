Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8902C83
	for <llvm@lists.linux.dev>; Thu, 25 Nov 2021 20:19:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10179"; a="234295287"
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="234295287"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2021 12:19:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,263,1631602800"; 
   d="scan'208";a="675348148"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Nov 2021 12:19:50 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mqLDh-0006sh-GK; Thu, 25 Nov 2021 20:19:49 +0000
Date: Fri, 26 Nov 2021 04:19:07 +0800
From: kernel test robot <lkp@intel.com>
To: YC Hung <yc.hung@mediatek.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: [linux-next:master 2032/3632]
 sound/soc/sof/mediatek/mt8195/mt8195.c:51:3: warning: format specifies type
 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned
 int')
Message-ID: <202111260417.NULUlyWF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f81e94e91878bded599cc60f2881cfd50991aeb9
commit: 32d7e03d26fd93187c87ed0fbf59ec7023a61404 [2032/3632] ASoC: SOF: mediatek: Add mt8195 hardware support
config: arm-randconfig-r022-20211122 (https://download.01.org/0day-ci/archive/20211126/202111260417.NULUlyWF-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c133fb321f7ca6083ce15b6aa5bf89de6600e649)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=32d7e03d26fd93187c87ed0fbf59ec7023a61404
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 32d7e03d26fd93187c87ed0fbf59ec7023a61404
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> sound/soc/sof/mediatek/mt8195/mt8195.c:51:3: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
                   (phys_addr_t)res.start, resource_size(&res));
                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
>> sound/soc/sof/mediatek/mt8195/mt8195.c:51:27: warning: format specifies type 'unsigned long long' but the argument has type 'resource_size_t' (aka 'unsigned int') [-Wformat]
                   (phys_addr_t)res.start, resource_size(&res));
                                           ^~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   sound/soc/sof/mediatek/mt8195/mt8195.c:166:51: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
           dev_dbg(dev, "adsp->pa_dram %llx, offset %#x\n", adsp->pa_dram, offset);
                                       ~~~~                 ^~~~~~~~~~~~~
                                       %x
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   sound/soc/sof/mediatek/mt8195/mt8195.c:196:22: warning: format specifies type 'unsigned long long' but the argument has type 'phys_addr_t' (aka 'unsigned int') [-Wformat]
                   adsp->shared_dram, adsp->pa_shared_dram, shared_size);
                                      ^~~~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:163:47: note: expanded from macro 'dev_dbg'
                   dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
                                                       ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:129:34: note: expanded from macro 'dev_printk'
                   _dev_printk(level, dev, fmt, ##__VA_ARGS__);            \
                                           ~~~    ^~~~~~~~~~~
   4 warnings generated.


vim +51 sound/soc/sof/mediatek/mt8195/mt8195.c

    28	
    29	static int platform_parse_resource(struct platform_device *pdev, void *data)
    30	{
    31		struct resource *mmio;
    32		struct resource res;
    33		struct device_node *mem_region;
    34		struct device *dev = &pdev->dev;
    35		struct mtk_adsp_chip_info *adsp = data;
    36		int ret;
    37	
    38		mem_region = of_parse_phandle(dev->of_node, "memory-region", 0);
    39		if (!mem_region) {
    40			dev_err(dev, "no dma memory-region phandle\n");
    41			return -ENODEV;
    42		}
    43	
    44		ret = of_address_to_resource(mem_region, 0, &res);
    45		if (ret) {
    46			dev_err(dev, "of_address_to_resource dma failed\n");
    47			return ret;
    48		}
    49	
    50		dev_dbg(dev, "DMA pbase=0x%llx, size=0x%llx\n",
  > 51			(phys_addr_t)res.start, resource_size(&res));
    52	
    53		ret = of_reserved_mem_device_init(dev);
    54		if (ret) {
    55			dev_err(dev, "of_reserved_mem_device_init failed\n");
    56			return ret;
    57		}
    58	
    59		mem_region = of_parse_phandle(dev->of_node, "memory-region", 1);
    60		if (!mem_region) {
    61			dev_err(dev, "no memory-region sysmem phandle\n");
    62			return -ENODEV;
    63		}
    64	
    65		ret = of_address_to_resource(mem_region, 0, &res);
    66		if (ret) {
    67			dev_err(dev, "of_address_to_resource sysmem failed\n");
    68			return ret;
    69		}
    70	
    71		adsp->pa_dram = (phys_addr_t)res.start;
    72		adsp->dramsize = resource_size(&res);
    73		if (adsp->pa_dram & DRAM_REMAP_MASK) {
    74			dev_err(dev, "adsp memory(%#x) is not 4K-aligned\n",
    75				(u32)adsp->pa_dram);
    76			return -EINVAL;
    77		}
    78	
    79		if (adsp->dramsize < TOTAL_SIZE_SHARED_DRAM_FROM_TAIL) {
    80			dev_err(dev, "adsp memory(%#x) is not enough for share\n",
    81				adsp->dramsize);
    82			return -EINVAL;
    83		}
    84	
    85		dev_dbg(dev, "dram pbase=%pa, dramsize=%#x\n",
    86			&adsp->pa_dram, adsp->dramsize);
    87	
    88		/* Parse CFG base */
    89		mmio = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
    90		if (!mmio) {
    91			dev_err(dev, "no ADSP-CFG register resource\n");
    92			return -ENXIO;
    93		}
    94		/* remap for DSP register accessing */
    95		adsp->va_cfgreg = devm_ioremap_resource(dev, mmio);
    96		if (IS_ERR(adsp->va_cfgreg))
    97			return PTR_ERR(adsp->va_cfgreg);
    98	
    99		adsp->pa_cfgreg = (phys_addr_t)mmio->start;
   100		adsp->cfgregsize = resource_size(mmio);
   101	
   102		dev_dbg(dev, "cfgreg-vbase=%p, cfgregsize=%#x\n",
   103			adsp->va_cfgreg, adsp->cfgregsize);
   104	
   105		/* Parse SRAM */
   106		mmio = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
   107		if (!mmio) {
   108			dev_err(dev, "no SRAM resource\n");
   109			return -ENXIO;
   110		}
   111	
   112		adsp->pa_sram = (phys_addr_t)mmio->start;
   113		adsp->sramsize = resource_size(mmio);
   114		if (adsp->sramsize < TOTAL_SIZE_SHARED_SRAM_FROM_TAIL) {
   115			dev_err(dev, "adsp SRAM(%#x) is not enough for share\n",
   116				adsp->sramsize);
   117			return -EINVAL;
   118		}
   119	
   120		dev_dbg(dev, "sram pbase=%pa,%#x\n", &adsp->pa_sram, adsp->sramsize);
   121	
   122		return ret;
   123	}
   124	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
