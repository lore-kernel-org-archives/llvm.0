Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798495EBA
	for <llvm@lists.linux.dev>; Fri, 11 Mar 2022 23:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647043020; x=1678579020;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MabYLtoRr/27XJXS/axTXZVdr+xFb6V5oA8gJZ5La1M=;
  b=id+V1ZmsXRJAjjTOz5TqVt3i9Uau8WhuaIA1IKE3dHKFS0VkCVbw2h1W
   P4Op0/gqJKwcz9kWu6pByPzaroBrRsEc7yzAlMtdm6JgrXHB46Q2nfB8B
   idD+Ucm2nOnX7DwYhTFH3SyaS4PboPHDVwlkUhOjWRo8TfytLzjJJ6lwJ
   gIGTS4h1tC6vxI63eiN/ShfmCF4Ygd71FdcgsvrJKIWe9WwjsONkH57hd
   l9RytXClDBBvyLJjf0rNbaN2INbauRSYmht/ifUk/yNLRcAzRJbgmBIO0
   9qYONOy2qAbbVFsIRnUnU0VppuFhVygsLhmHCUvSwwlNbl0c//9sDEPwA
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10283"; a="255624275"
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; 
   d="scan'208";a="255624275"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2022 15:57:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,175,1643702400"; 
   d="scan'208";a="579455185"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Mar 2022 15:56:57 -0800
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nSp7w-0007Hk-9k; Fri, 11 Mar 2022 23:56:56 +0000
Date: Sat, 12 Mar 2022 07:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: Tinghan Shen <tinghan.shen@mediatek.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] remoteproc: mediatek: fix side effect of mt8195 sram
 power on
Message-ID: <202203120744.6e2bnwRT-lkp@intel.com>
References: <20220311123056.32689-1-tinghan.shen@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220311123056.32689-1-tinghan.shen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Tinghan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on remoteproc/rproc-next]
[also build test ERROR on v5.17-rc7 next-20220310]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Tinghan-Shen/remoteproc-mediatek-fix-side-effect-of-mt8195-sram-power-on/20220311-203255
base:   git://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git rproc-next
config: s390-buildonly-randconfig-r004-20220310 (https://download.01.org/0day-ci/archive/20220312/202203120744.6e2bnwRT-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 276ca87382b8f16a65bddac700202924228982f6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/0day-ci/linux/commit/6d56ab3bae4e0d5e07d295169602883ba7d7de08
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Tinghan-Shen/remoteproc-mediatek-fix-side-effect-of-mt8195-sram-power-on/20220311-203255
        git checkout 6d56ab3bae4e0d5e07d295169602883ba7d7de08
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/remoteproc/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/remoteproc/mtk_scp.c:7:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/remoteproc/mtk_scp.c:7:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/remoteproc/mtk_scp.c:7:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/remoteproc/mtk_scp.c:418:6: error: use of undeclared identifier 'MT8195_L1TCM_SRAM_PDN_RESERVED_BITS'
                             MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
                             ^
   drivers/remoteproc/mtk_scp.c:592:7: error: use of undeclared identifier 'MT8195_L1TCM_SRAM_PDN_RESERVED_BITS'
                              MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
                              ^
   12 warnings and 2 errors generated.


vim +/MT8195_L1TCM_SRAM_PDN_RESERVED_BITS +418 drivers/remoteproc/mtk_scp.c

   405	
   406	static int mt8195_scp_before_load(struct mtk_scp *scp)
   407	{
   408		/* clear SPM interrupt, SCP2SPM_IPC_CLR */
   409		writel(0xff, scp->reg_base + MT8192_SCP2SPM_IPC_CLR);
   410	
   411		writel(1, scp->reg_base + MT8192_CORE0_SW_RSTN_SET);
   412	
   413		/* enable SRAM clock */
   414		scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_0, 0);
   415		scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_1, 0);
   416		scp_sram_power_on(scp->reg_base + MT8192_L2TCM_SRAM_PD_2, 0);
   417		scp_sram_power_on(scp->reg_base + MT8192_L1TCM_SRAM_PDN,
 > 418				  MT8195_L1TCM_SRAM_PDN_RESERVED_BITS);
   419		scp_sram_power_on(scp->reg_base + MT8192_CPU0_SRAM_PD, 0);
   420	
   421		/* enable MPU for all memory regions */
   422		writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
   423	
   424		return 0;
   425	}
   426	

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
