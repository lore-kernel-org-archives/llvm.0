Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7342815EA0;
	Fri, 13 Oct 2023 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eR/U1cV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697204420; x=1728740420;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lDcN9vRS97FP+SQDBvE1YIX84oWDsMScQBhETDvFVUc=;
  b=eR/U1cV9LHy51q55K1ZaxTAkDAaz6KFYFlGzvRKbC2njQhlnT2x4xX5t
   Uz6fhtE1cXW1qGsVSnA3OQ2D5ya44EGXY2wcxxcgk4DUpE2vV5aIDNNyl
   8tN5ZWHm8Y5pc2MozaieeQLStKf5M8ytmOLe5nhi0V/pIKR9p2uTPJ4hp
   9tYq/1VreMOfuJkcEsYtelqOU64PAzxlVca/k6G2sLvURuwSXWlumY2FE
   oSmzlRq59EdO8ZTec+1ncG2g9CbjQs+NyEDVLizfsy2V7jNmN8GFEoOrg
   hhgFxMabcLcXB53vGjB75lHUvtHxFuaA8gXUflwRSMo502hruMaNc2wGO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="451654075"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="451654075"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 06:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="704655727"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="704655727"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 13 Oct 2023 06:40:17 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrIOl-0004pB-2S;
	Fri, 13 Oct 2023 13:40:15 +0000
Date: Fri, 13 Oct 2023 21:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [linux-next:master 11413/12130] drivers/fpga/altera-ps-spi.c:74:34:
 warning: unused variable 'of_ef_match'
Message-ID: <202310132128.grw00tS2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e3b18f7200f45d66f7141136c25554ac1e82009b
commit: 97b15ccc1517033df349c32723651f31c9c1f264 [11413/12130] fpga: altera-ps-spi: Use spi_get_device_match_data()
config: hexagon-randconfig-r011-20211004 (https://download.01.org/0day-ci/archive/20231013/202310132128.grw00tS2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310132128.grw00tS2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310132128.grw00tS2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/fpga/altera-ps-spi.c:22:
   In file included from include/linux/spi/spi.h:17:
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
   In file included from drivers/fpga/altera-ps-spi.c:22:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/fpga/altera-ps-spi.c:22:
   In file included from include/linux/spi/spi.h:17:
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
>> drivers/fpga/altera-ps-spi.c:74:34: warning: unused variable 'of_ef_match' [-Wunused-const-variable]
   static const struct of_device_id of_ef_match[] = {
                                    ^
   7 warnings generated.


vim +/of_ef_match +74 drivers/fpga/altera-ps-spi.c

5692fae0742df7 Joshua Clayton 2017-06-14  73  
5692fae0742df7 Joshua Clayton 2017-06-14 @74  static const struct of_device_id of_ef_match[] = {
5692fae0742df7 Joshua Clayton 2017-06-14  75  	{ .compatible = "altr,fpga-passive-serial", .data = &c5_data },
5692fae0742df7 Joshua Clayton 2017-06-14  76  	{ .compatible = "altr,fpga-arria10-passive-serial", .data = &a10_data },
5692fae0742df7 Joshua Clayton 2017-06-14  77  	{}
5692fae0742df7 Joshua Clayton 2017-06-14  78  };
5692fae0742df7 Joshua Clayton 2017-06-14  79  MODULE_DEVICE_TABLE(of, of_ef_match);
5692fae0742df7 Joshua Clayton 2017-06-14  80  

:::::: The code at line 74 was first introduced by commit
:::::: 5692fae0742df7587189174b1cba364d22846c85 fpga manager: Add altera-ps-spi driver for Altera FPGAs

:::::: TO: Joshua Clayton <stillcompiling@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
