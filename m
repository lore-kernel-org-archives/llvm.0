Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5D6101FD;
	Fri, 13 Oct 2023 08:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnhiK9dy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697187480; x=1728723480;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zZjODe78uXPD2wdWqP1Zdxn3dzIaIyjNnZkUBkxvP8s=;
  b=bnhiK9dyt4F63GlPZJ8YBfDBr8Mu9OtmmPns9cUvFB2+Gn6abAHpg/pL
   2URthJ+dscV5EmH0BNdkFvvdF9EwXlEb4Hex+x0ud3dt2NQDnsaKk8TFJ
   QDkg+os9Vq8JP6HnI/yyu43h+ZFfRtxhJJGo4Rsm2PE0gdJTmaMd3+8tv
   R6nh2DwsMD2opPSF/HEwGlLpZGFXEFERYztrOiv62ZlxzbjtD0UFa+Wso
   2EPHB1K67nOPoTjmXL0SKa5DFCZght370wGbFUUBmf1uxfFkayG+Pnmkz
   QlF5wFJTFgR+LtntDlZm+ZCl27i23851hs1p927sV3/NjvGgwRgcML4iy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="365397286"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="365397286"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 01:58:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1086060795"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="1086060795"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 13 Oct 2023 01:57:58 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrDzY-0004Y9-1S;
	Fri, 13 Oct 2023 08:57:56 +0000
Date: Fri, 13 Oct 2023 16:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-next 70/83] drivers/usb/chipidea/ci_hdrc_usb2.c:41:34:
 warning: unused variable 'ci_hdrc_usb2_of_match'
Message-ID: <202310131627.M43j234A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next
head:   1034cc423f1b4a7a9a56d310ca980fcd2753e11d
commit: 14485de431b0a860d3a117fe518ce9ede8c76732 [70/83] usb: Use device_get_match_data()
config: hexagon-buildonly-randconfig-r004-20220331 (https://download.01.org/0day-ci/archive/20231013/202310131627.M43j234A-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131627.M43j234A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131627.M43j234A-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/usb/chipidea/ci_hdrc_usb2.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/usb/chipidea/ci_hdrc_usb2.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/usb/chipidea/ci_hdrc_usb2.c:9:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> drivers/usb/chipidea/ci_hdrc_usb2.c:41:34: warning: unused variable 'ci_hdrc_usb2_of_match' [-Wunused-const-variable]
   static const struct of_device_id ci_hdrc_usb2_of_match[] = {
                                    ^
   7 warnings generated.


vim +/ci_hdrc_usb2_of_match +41 drivers/usb/chipidea/ci_hdrc_usb2.c

1c16f63d1e6c94 Michał Mirosław 2020-04-04  40  
84bc70f94d81f1 Nathan Sullivan 2015-08-31 @41  static const struct of_device_id ci_hdrc_usb2_of_match[] = {
84bc70f94d81f1 Nathan Sullivan 2015-08-31  42  	{ .compatible = "chipidea,usb2" },
84bc70f94d81f1 Nathan Sullivan 2015-08-31  43  	{ .compatible = "xlnx,zynq-usb-2.20a", .data = &ci_zynq_pdata },
1c16f63d1e6c94 Michał Mirosław 2020-04-04  44  	{ .compatible = "lsi,zevio-usb", .data = &ci_zevio_pdata },
84bc70f94d81f1 Nathan Sullivan 2015-08-31  45  	{ }
84bc70f94d81f1 Nathan Sullivan 2015-08-31  46  };
84bc70f94d81f1 Nathan Sullivan 2015-08-31  47  MODULE_DEVICE_TABLE(of, ci_hdrc_usb2_of_match);
84bc70f94d81f1 Nathan Sullivan 2015-08-31  48  

:::::: The code at line 41 was first introduced by commit
:::::: 84bc70f94d81f1d3107dbcdafc1b193169e82131 usb: chipidea: add xilinx zynq platform data

:::::: TO: Nathan Sullivan <nathan.sullivan@ni.com>
:::::: CC: Peter Chen <peter.chen@freescale.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
