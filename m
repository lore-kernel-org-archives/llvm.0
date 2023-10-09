Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B84B3714F;
	Mon,  9 Oct 2023 18:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8rRKyjn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696875611; x=1728411611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e5iN/2ttRBZtDAKCXaXbpaBsZWwX9XofORZVJVhyEgU=;
  b=T8rRKyjnwkNQg6Mivhl6PDH6izVf9s3NfMabZcXGVL9+lS2pVwtuGydr
   T1nDPAsDa24TQxctKWwByIjzIlRkIwbcG4eq+hQDodOUU4sNaPjIOdqZN
   ExOUyijAEupMN73mK2qjMT/HrNG4SV7Q0EGV+RNsQHgBSXLZ5TxkNEUWq
   xoMXsKq1f7YSHYHcUTm8kaJ+uLoA6zUDB9Su6mSPfQk6pD4HJobSyc5SX
   oACMd0HuVBXIt9V1O3v1JeNnoVita6mEB733TcT/wcF83/OHi6qLKrNtY
   x9OHD/kiknbtoNHWvjzIeNrWwziuQXM4I903bcNv6AOBoDaEgTMveg4EB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="448405833"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="448405833"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 11:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="818939027"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; 
   d="scan'208";a="818939027"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 09 Oct 2023 11:20:09 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpurO-0000VQ-2X;
	Mon, 09 Oct 2023 18:20:06 +0000
Date: Tue, 10 Oct 2023 02:19:44 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Xu Yilun <yilun.xu@linux.intel.com>
Subject: [linux-next:master 10253/10591]
 drivers/fpga/xilinx-pr-decoupler.c:94:34: warning: unused variable
 'xlnx_pr_decoupler_of_match'
Message-ID: <202310100247.Y7BFcalX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2a860505b617cf8fda4ebff6cf05d3f774145440
commit: 8c966aadcc023c8db7a9d24a3a504a9b39b1202c [10253/10591] fpga: Use device_get_match_data()
config: hexagon-randconfig-r021-20221128 (https://download.01.org/0day-ci/archive/20231010/202310100247.Y7BFcalX-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100247.Y7BFcalX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100247.Y7BFcalX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/fpga/xilinx-pr-decoupler.c:11:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/fpga/xilinx-pr-decoupler.c:11:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/fpga/xilinx-pr-decoupler.c:11:
   In file included from include/linux/io.h:13:
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
>> drivers/fpga/xilinx-pr-decoupler.c:94:34: warning: unused variable 'xlnx_pr_decoupler_of_match' [-Wunused-const-variable]
   static const struct of_device_id xlnx_pr_decoupler_of_match[] = {
                                    ^
   7 warnings generated.


vim +/xlnx_pr_decoupler_of_match +94 drivers/fpga/xilinx-pr-decoupler.c

30a2ac9a8bb5fce1 Nava kishore Manne 2021-02-11   93  
7e961c12be424c6c Moritz Fischer     2017-03-24  @94  static const struct of_device_id xlnx_pr_decoupler_of_match[] = {
30a2ac9a8bb5fce1 Nava kishore Manne 2021-02-11   95  	{ .compatible = "xlnx,pr-decoupler-1.00", .data = &decoupler_config },
30a2ac9a8bb5fce1 Nava kishore Manne 2021-02-11   96  	{ .compatible = "xlnx,pr-decoupler", .data = &decoupler_config },
30a2ac9a8bb5fce1 Nava kishore Manne 2021-02-11   97  	{ .compatible = "xlnx,dfx-axi-shutdown-manager-1.00",
30a2ac9a8bb5fce1 Nava kishore Manne 2021-02-11   98  					.data = &shutdown_config },
30a2ac9a8bb5fce1 Nava kishore Manne 2021-02-11   99  	{ .compatible = "xlnx,dfx-axi-shutdown-manager",
30a2ac9a8bb5fce1 Nava kishore Manne 2021-02-11  100  					.data = &shutdown_config },
7e961c12be424c6c Moritz Fischer     2017-03-24  101  	{},
7e961c12be424c6c Moritz Fischer     2017-03-24  102  };
7e961c12be424c6c Moritz Fischer     2017-03-24  103  MODULE_DEVICE_TABLE(of, xlnx_pr_decoupler_of_match);
7e961c12be424c6c Moritz Fischer     2017-03-24  104  

:::::: The code at line 94 was first introduced by commit
:::::: 7e961c12be424c6c1e355d469cc1b82dbf3af718 fpga: Add support for Xilinx LogiCORE PR Decoupler

:::::: TO: Moritz Fischer <mdf@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
