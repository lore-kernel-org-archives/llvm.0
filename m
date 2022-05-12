Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A9B33C2
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 15:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652369915; x=1683905915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R8uArNEX57Mh2BeC2f+3ooWtlqvVhsNSiiiFGqsx6u8=;
  b=d36q84sbXVh8eo55z5hHR4Z/q2uBJx1sp3mvGw6+3xDGxI/RWYrvBZ/f
   28WZGdcMRvD7rmcdoxz+xap0ptES3X2jH54vOLNGQcwANuuz9HWQTCmzh
   cx/UbAtUQ8z8EEvil1lfQolL8u67x59bAN0Ha9b9/aal3ZXMXf82D8ZQL
   64O6KcpOnlsTq+21Pe37JWu21FZw1xJwXFvV4xc4fsjczZBGrJYTxdqIs
   ScG1h0niWCc8UOYAwA6tkUOh72shysgZH59FUQZgqfA/Vm+tadnkPvJg6
   NsgDkmhy40hyki07noFoQXgdFcptSIHwq7SIX8B8JbAbI5FJoqb/M1jTk
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="257581818"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="257581818"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 08:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="572566733"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 May 2022 08:38:33 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npAtc-000Kcy-RJ;
	Thu, 12 May 2022 15:38:32 +0000
Date: Thu, 12 May 2022 23:38:30 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15_LTS 470/1138]
 drivers/misc/jesd204b/jesd_phy.c:172:6: warning: no previous prototype for
 function 'jesd204_phy_set_speed'
Message-ID: <202205122315.yMpAvt24-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shubhrajyoti,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15_LTS
head:   9ef3be1de28ec61f4dad2b16b1097b7e2270a5a6
commit: 4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486 [470/1138] misc: jesd204b: Add driver for Xilinx jesd204b
config: s390-randconfig-r031-20220512 (https://download.01.org/0day-ci/archive/20220512/202205122315.yMpAvt24-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/Xilinx/linux-xlnx/commit/4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.15_LTS
        git checkout 4cf40e565c55a749ca7a7bbc7bc998fd3f3a2486
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash arch/s390/kernel/ drivers/misc/jesd204b/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/misc/jesd204b/jesd_phy.c:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/misc/jesd204b/jesd_phy.c:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/misc/jesd204b/jesd_phy.c:20:
   In file included from include/linux/io.h:13:
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
   drivers/misc/jesd204b/jesd_phy.c:97:6: warning: variable 'pll' set but not used [-Wunused-but-set-variable]
           int pll = st->pll;
               ^
>> drivers/misc/jesd204b/jesd_phy.c:172:6: warning: no previous prototype for function 'jesd204_phy_set_speed' [-Wmissing-prototypes]
   void jesd204_phy_set_speed(struct jesd204b_phy_state *st, u32 band)
        ^
   drivers/misc/jesd204b/jesd_phy.c:172:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void jesd204_phy_set_speed(struct jesd204b_phy_state *st, u32 band)
   ^
   static 
   14 warnings generated.


vim +/jesd204_phy_set_speed +172 drivers/misc/jesd204b/jesd_phy.c

   171	
 > 172	void jesd204_phy_set_speed(struct jesd204b_phy_state *st, u32 band)
   173	{
   174		/* make sure we have the correct PLL's selected. */
   175		configure_channel_drp(st, band);
   176	}
   177	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
