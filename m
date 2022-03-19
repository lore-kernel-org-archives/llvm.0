Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F04517E
	for <llvm@lists.linux.dev>; Sat, 19 Mar 2022 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647694103; x=1679230103;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uCKjKzwxdhu4jh4y4Vo1xx861LpZsZZsl1HVDq6RBuo=;
  b=ORjicxEF+2eEoiUeVlwBTuZIwiazGXsvzJdkU6PJAAULu5dngqfdQm3j
   pjgE/gv0NwcdAcSgKhcE6GwOJI35UzToPrv70XcOLsTUTgGjh6rVJbpuI
   N/Fr+aMRfKZz71ttuyG6xp+QzOheJK/gGkLMm/JCnlkrMNsaDtveX2+4s
   U44S/QZRxXH8YtKR3dDk7UWiX4GVVUTNYgtUKtn+C0bzMwjrRuNmyiOJc
   IYveXUVTzdkbHWeWNr/+GQb7AzgqzGCRT8hvkVwOi3vHp6K21GaJzDwJ4
   iXsDNoc8V6dKqXunW/J4NJ/v/YtWUxaQEGgZNRWdiOhdvWzwSWGB5GQWi
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10290"; a="257021407"
X-IronPort-AV: E=Sophos;i="5.90,194,1643702400"; 
   d="scan'208";a="257021407"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2022 05:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,194,1643702400"; 
   d="scan'208";a="647910088"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 19 Mar 2022 05:48:21 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVYVI-000Fzx-NJ; Sat, 19 Mar 2022 12:48:20 +0000
Date: Sat, 19 Mar 2022 20:47:51 +0800
From: kernel test robot <lkp@intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-media@vger.kernel.org
Subject: [linux-next:master 12076/13576]
 drivers/media/platform/marvell/mmp-driver.c:364:34: warning: unused variable
 'mmpcam_of_match'
Message-ID: <202203192050.5iAePWkE-lkp@intel.com>
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
head:   6d72dda014a4753974eb08950089ddf71fec4f60
commit: 92238532acb07be282c0276c33e01eb836e0953a [12076/13576] media: platform: rename marvell-ccic/ to marvell/
config: s390-randconfig-r002-20220319 (https://download.01.org/0day-ci/archive/20220319/202203192050.5iAePWkE-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 217f267efe3082438e698e2f08566b9df8c530fa)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=92238532acb07be282c0276c33e01eb836e0953a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 92238532acb07be282c0276c33e01eb836e0953a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/media/platform/marvell/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/media/platform/marvell/mmp-driver.c:17:
   In file included from include/media/v4l2-device.h:13:
   In file included from include/media/v4l2-subdev.h:15:
   In file included from include/media/v4l2-common.h:270:
   In file included from include/linux/spi/spi.h:15:
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
   In file included from drivers/media/platform/marvell/mmp-driver.c:17:
   In file included from include/media/v4l2-device.h:13:
   In file included from include/media/v4l2-subdev.h:15:
   In file included from include/media/v4l2-common.h:270:
   In file included from include/linux/spi/spi.h:15:
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
   In file included from drivers/media/platform/marvell/mmp-driver.c:17:
   In file included from include/media/v4l2-device.h:13:
   In file included from include/media/v4l2-subdev.h:15:
   In file included from include/media/v4l2-common.h:270:
   In file included from include/linux/spi/spi.h:15:
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
>> drivers/media/platform/marvell/mmp-driver.c:364:34: warning: unused variable 'mmpcam_of_match' [-Wunused-const-variable]
   static const struct of_device_id mmpcam_of_match[] = {
                                    ^
   13 warnings generated.


vim +/mmpcam_of_match +364 drivers/media/platform/marvell/mmp-driver.c

bb0a896e3d5083 drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Corbet 2011-12-30  363  
83c40e6611ec1e drivers/media/platform/marvell-ccic/mmp-driver.c Lubomir Rintel  2019-05-28 @364  static const struct of_device_id mmpcam_of_match[] = {
83c40e6611ec1e drivers/media/platform/marvell-ccic/mmp-driver.c Lubomir Rintel  2019-05-28  365  	{ .compatible = "marvell,mmp2-ccic", },
83c40e6611ec1e drivers/media/platform/marvell-ccic/mmp-driver.c Lubomir Rintel  2019-05-28  366  	{},
83c40e6611ec1e drivers/media/platform/marvell-ccic/mmp-driver.c Lubomir Rintel  2019-05-28  367  };
08aac0e32fe44b drivers/media/platform/marvell-ccic/mmp-driver.c Lubomir Rintel  2019-07-22  368  MODULE_DEVICE_TABLE(of, mmpcam_of_match);
67a8dbbc4e04cd drivers/media/video/marvell-ccic/mmp-driver.c    Jonathan Corbet 2011-06-11  369  

:::::: The code at line 364 was first introduced by commit
:::::: 83c40e6611ec1e548ece34f6940f516333abc16a media: marvell-ccic/mmp: add devicetree support

:::::: TO: Lubomir Rintel <lkundrak@v3.sk>
:::::: CC: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
