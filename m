Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C151523A0;
	Tue, 14 Mar 2023 05:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678773561; x=1710309561;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BWCqPFDT99JKpJJTOmJbpxf6DfETBmRaIS1kz7RdiGk=;
  b=aZbl2qfEsrKzG03v0WCIA0y0on2lQ4t2B7i4EewIEu57/no+K+VsB19v
   h1qIgvoscjeyTPKfC881Rl/zJY/q7P9906yLuC0CxHNyv1RKukmfOsV1r
   Fwtrpm0FLv2gOx6XTOwjIiLc+VTyP/wRblxIZPzdIIkHoizV3aihMAvsp
   BZ4LFqembOeZXdOD4BTl4GB+tc2sjk6IHTHWRX3HNNKk23pHA0GKeMbOa
   p1ZKzQxAFPt96FPpeJK2x9pasNtp/vf7PyNLNZeGF4pgclJvkxF+k4VqM
   UNG4AbamaEaJ6LnXLFcK1gOUOCFbO53Wo01oeYeNwZ2rzcOsOmz3qTTOC
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="365000859"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="365000859"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 22:59:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="1008269806"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; 
   d="scan'208";a="1008269806"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Mar 2023 22:59:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pbxgt-0006am-0i;
	Tue, 14 Mar 2023 05:59:19 +0000
Date: Tue, 14 Mar 2023 13:58:54 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v3 6/7] mmc: sdhci-msm: Switch to the new ICE API
Message-ID: <202303141335.bTunMPvn-lkp@intel.com>
References: <20230313115202.3960700-7-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230313115202.3960700-7-abel.vesa@linaro.org>

Hi Abel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on robh/for-next]
[also build test ERROR on mkp-scsi/for-next jejb-scsi/for-next linus/master v6.3-rc2 next-20230314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/dt-bindings-crypto-Add-Qualcomm-Inline-Crypto-Engine/20230313-195431
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230313115202.3960700-7-abel.vesa%40linaro.org
patch subject: [RFC PATCH v3 6/7] mmc: sdhci-msm: Switch to the new ICE API
config: s390-randconfig-r044-20230313 (https://download.01.org/0day-ci/archive/20230314/202303141335.bTunMPvn-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/39cf218db06fa3da80324ee72339a8dc4133eb86
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Abel-Vesa/dt-bindings-crypto-Add-Qualcomm-Inline-Crypto-Engine/20230313-195431
        git checkout 39cf218db06fa3da80324ee72339a8dc4133eb86
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/mmc/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303141335.bTunMPvn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/mmc/host/sdhci-msm.c:15:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/mmc/host/sdhci-msm.c:15:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/mmc/host/sdhci-msm.c:15:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/mmc/host/sdhci-msm.c:2685:9: error: call to undeclared function 'sdhci_msm_ice_suspend'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           return sdhci_msm_ice_suspend(msm_host);
                  ^
   drivers/mmc/host/sdhci-msm.c:2685:9: note: did you mean 'sdhci_msm_runtime_suspend'?
   drivers/mmc/host/sdhci-msm.c:2674:27: note: 'sdhci_msm_runtime_suspend' declared here
   static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
                             ^
   12 warnings and 1 error generated.


vim +/sdhci_msm_ice_suspend +2685 drivers/mmc/host/sdhci-msm.c

  2673	
  2674	static __maybe_unused int sdhci_msm_runtime_suspend(struct device *dev)
  2675	{
  2676		struct sdhci_host *host = dev_get_drvdata(dev);
  2677		struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
  2678		struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
  2679	
  2680		/* Drop the performance vote */
  2681		dev_pm_opp_set_rate(dev, 0);
  2682		clk_bulk_disable_unprepare(ARRAY_SIZE(msm_host->bulk_clks),
  2683					   msm_host->bulk_clks);
  2684	
> 2685		return sdhci_msm_ice_suspend(msm_host);
  2686	}
  2687	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
