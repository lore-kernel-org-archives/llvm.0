Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AC17E
	for <llvm@lists.linux.dev>; Thu,  3 Mar 2022 14:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646318878; x=1677854878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ShgWprh5L2brtL7NF4/o06kd2uqcNmpipRC0Sz+Br8=;
  b=D26lZ6Pi7KRpJPiCw883VMUGrJ+ntV98JvDqVgJDU6uF7huUYbQ2sGHh
   912O3g3lPedlUQotcakF33hfVXpV3VBGmrJUDPSpi5fCTKENPcUN4flxP
   MqTq9vT1b9VtioyHfnqQ7j0oHFl/Z/6vooo7wbfxA9jD9EM1ZFNKaZONm
   vM/6TxLFFkKra7ZTRnkALqm7Yoyc7QafpACD6AfnLz0/C38s2lYus3CGf
   62wd7K/vSLseuKTdSxT49InOq4ICTPuy8NmPCDAsEjO06gNMUwexiU8Jl
   LuPHg25P3ZA3FGTPqvfNWAP2Zsjts8vXVMIDFe5HMSIJAYscGsbwRuprS
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="253423301"
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="253423301"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2022 06:47:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,151,1643702400"; 
   d="scan'208";a="576510618"
Received: from lkp-server01.sh.intel.com (HELO ccb16ba0ecc3) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Mar 2022 06:47:56 -0800
Received: from kbuild by ccb16ba0ecc3 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nPmkF-0000d7-Hp; Thu, 03 Mar 2022 14:47:55 +0000
Date: Thu, 3 Mar 2022 22:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: yipechai <YiPeng.Chai@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Tao Zhou <tao.zhou1@amd.com>
Subject: [linux-next:master 9935/10468]
 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c:27:6: warning: no previous prototype
 for function 'amdgpu_hdp_ras_fini'
Message-ID: <202203032244.sR8SFPY2-lkp@intel.com>
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
head:   91265a6da44d13296bdb5b3fbafa19d06be462f2
commit: aa8e65dfc75f684cd46d49f71453ea3512a1e770 [9935/10468] drm/amdgpu: Remove redundant calls of amdgpu_ras_block_late_fini in hdp ras block
config: s390-randconfig-r002-20220302 (https://download.01.org/0day-ci/archive/20220303/202203032244.sR8SFPY2-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=aa8e65dfc75f684cd46d49f71453ea3512a1e770
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout aa8e65dfc75f684cd46d49f71453ea3512a1e770
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash drivers/gpu/drm/amd/amdgpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c:24:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:52:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c:24:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:52:
   In file included from include/linux/pci.h:39:
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
   In file included from drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c:24:
   In file included from drivers/gpu/drm/amd/amdgpu/../amdgpu/amdgpu.h:52:
   In file included from include/linux/pci.h:39:
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
>> drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c:27:6: warning: no previous prototype for function 'amdgpu_hdp_ras_fini' [-Wmissing-prototypes]
   void amdgpu_hdp_ras_fini(struct amdgpu_device *adev, struct ras_common_if *ras_block)
        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c:27:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void amdgpu_hdp_ras_fini(struct amdgpu_device *adev, struct ras_common_if *ras_block)
   ^
   static 
   13 warnings generated.


vim +/amdgpu_hdp_ras_fini +27 drivers/gpu/drm/amd/amdgpu/amdgpu_hdp.c

b11625f56f09f12 Hawking Zhang 2021-04-28  26  
01d468d9a420152 yipechai      2022-02-17 @27  void amdgpu_hdp_ras_fini(struct amdgpu_device *adev, struct ras_common_if *ras_block)
b11625f56f09f12 Hawking Zhang 2021-04-28  28  {
aa8e65dfc75f684 yipechai      2022-02-17  29  

:::::: The code at line 27 was first introduced by commit
:::::: 01d468d9a420152e4a1270992e69a37ea0c98e04 drm/amdgpu: Modify .ras_fini function pointer parameter

:::::: TO: yipechai <YiPeng.Chai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
