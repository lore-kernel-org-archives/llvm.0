Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5EF5689;
	Fri, 21 Apr 2023 17:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682098822; x=1713634822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=04piXTxPmSclPs1kWuU7ErIbwh+BQvAnxCgVFJkKe54=;
  b=mBDRiIY5dJivCNzzEbVhqSAFP9nvxWtjoxevFDnbBYK9Il8jTUqKv03T
   8YZaNfXRmD4J2elS3ZkOmpoP7EsMU+8ZUUCORHoUYOXIWUGKFUqEdNOkp
   e+kSSvHT2Tw+ebUibOhTUtpHj4Sii1zc6kZXhJf+Wt0puA/DCIWt51yNx
   4Ge8qZtGreUw72hyQYPx+HNROwcPzlkyKnNqZkRVmWt+I3RKIz9ydEFn7
   r0x0LfJzLBXxsPLu9eToc/CVMXo8k/Hjeks660INvPbugrcEejC099CPn
   loIbHfyhtlEBUX+tD7+31agSwakzAaeFntronOR4Quq/ELI2/hpsDhSz4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="408982186"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="408982186"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 10:40:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="816502374"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="816502374"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Apr 2023 10:40:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppuk6-000ghy-28;
	Fri, 21 Apr 2023 17:40:18 +0000
Date: Sat, 22 Apr 2023 01:39:40 +0800
From: kernel test robot <lkp@intel.com>
To: Neeraj Sanjay Kale <neeraj.sanjaykale@nxp.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [linux-next:master 9460/12794]
 drivers/bluetooth/btnxpuart.c:1277:34: warning: unused variable
 'nxpuart_of_match_table'
Message-ID: <202304220119.94Pw6YsD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   44bf136283e567b2b62653be7630e7511da41da2
commit: 2e9632009158054bcb6c1766c6748476db0561a0 [9460/12794] Bluetooth: NXP: Add protocol support for NXP Bluetooth chipsets
config: hexagon-buildonly-randconfig-r003-20230421 (https://download.01.org/0day-ci/archive/20230422/202304220119.94Pw6YsD-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 437b7602e4a998220871de78afcb020b9c14a661)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=2e9632009158054bcb6c1766c6748476db0561a0
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 2e9632009158054bcb6c1766c6748476db0561a0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/bluetooth/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220119.94Pw6YsD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/bluetooth/btnxpuart.c:10:
   In file included from include/linux/serdev.h:10:
   In file included from include/linux/iopoll.h:14:
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
   In file included from drivers/bluetooth/btnxpuart.c:10:
   In file included from include/linux/serdev.h:10:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from drivers/bluetooth/btnxpuart.c:10:
   In file included from include/linux/serdev.h:10:
   In file included from include/linux/iopoll.h:14:
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
>> drivers/bluetooth/btnxpuart.c:1277:34: warning: unused variable 'nxpuart_of_match_table' [-Wunused-const-variable]
   static const struct of_device_id nxpuart_of_match_table[] = {
                                    ^
   7 warnings generated.


vim +/nxpuart_of_match_table +1277 drivers/bluetooth/btnxpuart.c

  1276	
> 1277	static const struct of_device_id nxpuart_of_match_table[] = {
  1278		{ .compatible = "nxp,88w8987-bt", .data = &w8987_data },
  1279		{ .compatible = "nxp,88w8997-bt", .data = &w8997_data },
  1280		{ }
  1281	};
  1282	MODULE_DEVICE_TABLE(of, nxpuart_of_match_table);
  1283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
