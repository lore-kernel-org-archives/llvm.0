Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844017E6;
	Fri, 20 Jan 2023 10:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674209458; x=1705745458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mqqYIvdXkkuuuZFwhIfs8QDC1aNRFlSFgTmCZ3h9Gng=;
  b=XHZjJcLodJldsrJXjmqkDROFPmz4+hnBp+3DOskxS4QSfARnKZ4uRFwA
   M0td8T0bI4gaJXyFytYwByU5Ec6wziYZhy1l1aE9BwKgqeCJhcVytYXbt
   cx5mD6eWyLsaR2OAUOz05PfIh+39HvR8+81biZMI+j9Z0OAyaDtokJmTE
   rbalhktpkKsLCuLxWMcLc9jREfsBCSy+UxArEK3WsjBbD2v/qnCNwlINP
   cQFvzsP7vDNdTPKKkOdBar2TdO3rRH+WFq6T4Oucp9JmwQqQan5RTKivK
   E1FaQJFdb9Rs/1FNphU2B3PZ3gQpFvOtEFDZe5XWygIEtm3R6IdrMVpTi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="327641517"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="327641517"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 02:10:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="989358655"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="989358655"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 20 Jan 2023 02:10:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIoMJ-0002Sz-04;
	Fri, 20 Jan 2023 10:10:55 +0000
Date: Fri, 20 Jan 2023 18:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: Nava kishore Manne <nava.manne@xilinx.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 44/773]
 include/linux/firmware/xlnx-zynqmp.h:1200:12: warning: unused function
 'zynqmp_pm_fpga_get_version'
Message-ID: <202301201814.jTM59R23-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   155ae9648df275d38841cfe45231ba0471baa1cb
commit: e9e49172adb71403be142bd6019caedb31059e62 [44/773] firmware: xilinx: Implemented pm API functions to get the xilfpga component info
config: hexagon-buildonly-randconfig-r004-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201814.jTM59R23-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/e9e49172adb71403be142bd6019caedb31059e62
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout e9e49172adb71403be142bd6019caedb31059e62
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/crypto/xilinx/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/xilinx/zynqmp-aes-gcm.c:11:
   In file included from include/crypto/scatterwalk.h:16:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from drivers/crypto/xilinx/zynqmp-aes-gcm.c:11:
   In file included from include/crypto/scatterwalk.h:16:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/crypto/xilinx/zynqmp-aes-gcm.c:11:
   In file included from include/crypto/scatterwalk.h:16:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   In file included from drivers/crypto/xilinx/zynqmp-aes-gcm.c:18:
   include/linux/firmware/xlnx-zynqmp.h:1151:12: warning: unused function 'zynqmp_pm_sec_read_reg' [-Wunused-function]
   static int zynqmp_pm_sec_read_reg(u32 node_id, u32 offset, u32 *ret_value)
              ^
   include/linux/firmware/xlnx-zynqmp.h:1156:12: warning: unused function 'zynqmp_pm_sec_mask_write_reg' [-Wunused-function]
   static int zynqmp_pm_sec_mask_write_reg(const u32 node_id, const u32 offset,
              ^
>> include/linux/firmware/xlnx-zynqmp.h:1200:12: warning: unused function 'zynqmp_pm_fpga_get_version' [-Wunused-function]
   static int zynqmp_pm_fpga_get_version(u32 *value)
              ^
>> include/linux/firmware/xlnx-zynqmp.h:1205:12: warning: unused function 'zynqmp_pm_fpga_get_feature_list' [-Wunused-function]
   static int zynqmp_pm_fpga_get_feature_list(u32 *value)
              ^
   10 warnings generated.


vim +/zynqmp_pm_fpga_get_version +1200 include/linux/firmware/xlnx-zynqmp.h

  1199	
> 1200	static int zynqmp_pm_fpga_get_version(u32 *value)
  1201	{
  1202		return -ENODEV;
  1203	}
  1204	
> 1205	static int zynqmp_pm_fpga_get_feature_list(u32 *value)
  1206	{
  1207		return -ENODEV;
  1208	}
  1209	#endif
  1210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
