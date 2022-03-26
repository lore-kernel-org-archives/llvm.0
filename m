Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77F27E
	for <llvm@lists.linux.dev>; Sat, 26 Mar 2022 11:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648292714; x=1679828714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O8rx2yhA71i8Ia/09O+956PixOXb7crTX+d1bHTkAqk=;
  b=Chc13fM0Stk3rnEfKXZBt4p0wPXtmOms1/BBnxgrwB7cM+TzV1LzA7Cn
   5BvVDUFWu+vC2SwHIrYRsS9RKV2X5CdyF7rRCkBkhsiHGr40pOsORyhVy
   4fGmoT2jJgGA5ctoYzJUa0ytF0x+psjPoN1Xg44eC4W/Yhl4tnEW681e4
   J3kl49wVVEyxwk1lOdmzNViDdkiX0rb0SidSPG6G1rE+6hT6VmuQfs6t/
   OOirzRvMy+y2YGrTCaly3+2Zm9dMic+B8h7+aUaPpJK6G5RQRDXcfyf+o
   gmgebVgW4TGeNzbo9B0UkhNZaAhA+z5nUaDWtshm1zCa15p7YJfhtQPPP
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="319478685"
X-IronPort-AV: E=Sophos;i="5.90,213,1643702400"; 
   d="scan'208";a="319478685"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2022 04:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,213,1643702400"; 
   d="scan'208";a="718486351"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Mar 2022 04:05:12 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nY4EK-000NIu-Az; Sat, 26 Mar 2022 11:05:12 +0000
Date: Sat, 26 Mar 2022 19:04:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [bvanassche:ufs-for-next-2022-03-25 32/32]
 drivers/scsi/ufs-drivers/ufs-exynos.c:1596:34: warning: unused variable
 'exynos_ufs_of_match'
Message-ID: <202203261830.M6xPZjki-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Bart,

First bad commit (maybe != root cause):

tree:   https://github.com/bvanassche/linux ufs-for-next-2022-03-25
head:   976ba17fe820846e56fb154b1ae35f5d90be192b
commit: 976ba17fe820846e56fb154b1ae35f5d90be192b [32/32] scsi: ufs: Split the drivers/scsi/ufs directory
config: s390-randconfig-r013-20220324 (https://download.01.org/0day-ci/archive/20220326/202203261830.M6xPZjki-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://github.com/bvanassche/linux/commit/976ba17fe820846e56fb154b1ae35f5d90be192b
        git remote add bvanassche https://github.com/bvanassche/linux
        git fetch --no-tags bvanassche ufs-for-next-2022-03-25
        git checkout 976ba17fe820846e56fb154b1ae35f5d90be192b
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/scsi/ufs-drivers/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/ufs-drivers/ufs-exynos.c:16:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/scsi/ufs-drivers/ufs-exynos.c:16:
   In file included from include/linux/of_address.h:7:
   In file included from include/linux/io.h:13:
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
   In file included from drivers/scsi/ufs-drivers/ufs-exynos.c:16:
   In file included from include/linux/of_address.h:7:
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
>> drivers/scsi/ufs-drivers/ufs-exynos.c:1596:34: warning: unused variable 'exynos_ufs_of_match' [-Wunused-const-variable]
   static const struct of_device_id exynos_ufs_of_match[] = {
                                    ^
   13 warnings generated.


vim +/exynos_ufs_of_match +1596 drivers/scsi/ufs-drivers/ufs-exynos.c

55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1595  
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28 @1596  static const struct of_device_id exynos_ufs_of_match[] = {
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1597  	{ .compatible = "samsung,exynos7-ufs",
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1598  	  .data	      = &exynos_ufs_drvs },
cc52e15397cc5d drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1599  	{ .compatible = "samsung,exynosautov9-ufs",
cc52e15397cc5d drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1600  	  .data	      = &exynosauto_ufs_drvs },
be39f4fd8dd430 drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1601  	{ .compatible = "samsung,exynosautov9-ufs-vh",
be39f4fd8dd430 drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1602  	  .data	      = &exynosauto_ufs_vh_drvs },
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1603  	{},
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1604  };
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1605  

:::::: The code at line 1596 was first introduced by commit
:::::: 55f4b1f73631a0817717fe6e98517de51b4c3527 scsi: ufs: ufs-exynos: Add UFS host support for Exynos SoCs

:::::: TO: Alim Akhtar <alim.akhtar@samsung.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
