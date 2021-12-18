Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FE72C9C
	for <llvm@lists.linux.dev>; Sat, 18 Dec 2021 00:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639787909; x=1671323909;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=H8n+/E+H4VH5ihdawCgcdjdKjo6HQryrg3Baf2TqBNY=;
  b=QhleBd1MG0HYZ2/z5dU6J4Q5ny9hEgK0djhR3xp9o4u7Fc0MYrsTh6S8
   ZCKvHFfxfoGIWCItHQ59sNXcS+qJ5XQFfbFqKQ7Oee0aZ7FRNQvOb883F
   bybwg1dgaTCsVdJSYpwtC/7cviVhnlyHLZCrECX+meeK0f3oGmqDSFN4s
   Sx41Au5Ost7bb3cIZpxgbwgW0JJdrgeeKBRVkxfhapjzuE/kS25tdaSBQ
   6j8tRbK8pAq0i3JNcKlOiqPp6CiiBoQT98hYupqN/+aBZGXaVjrS5a/fW
   oC97h3+d4E+uihkD7S25vjm4RtGftgebKxW40MJmqWv0x2ZJMgWcKV73A
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="239815426"
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="239815426"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2021 16:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,215,1635231600"; 
   d="scan'208";a="546573259"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Dec 2021 16:38:26 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myNk1-0005O8-O3; Sat, 18 Dec 2021 00:38:25 +0000
Date: Sat, 18 Dec 2021 08:37:47 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
	Harini Katakam <harinik@xilinx.com>,
	Punnaiah Choudary Kalluri <punnaia@xilinx.com>,
	Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.4 842/1768] drivers/spi/spi-mem.c:18:6:
 warning: no previous prototype for function 'update_stripe'
Message-ID: <202112180856.mN80AB8F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   abafefebd1f1e040eef74e4ab571ea08bf745641
commit: 3780469dd372e934445de2fbb5e8cf6e712b9b99 [842/1768] spi: Add Zynq QSPI controller driver
config: x86_64-randconfig-r013-20211214 (https://download.01.org/0day-ci/archive/20211218/202112180856.mN80AB8F-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project b6a2ddb6c8ac29412b1361810972e15221fa021c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/3780469dd372e934445de2fbb5e8cf6e712b9b99
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx xlnx_rebase_v5.4
        git checkout 3780469dd372e934445de2fbb5e8cf6e712b9b99
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/mtd/spi-nor/ drivers/spi/ drivers/usb/host/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-mem.c:18:6: warning: no previous prototype for function 'update_stripe' [-Wmissing-prototypes]
   bool update_stripe(const u8 opcode)
        ^
   drivers/spi/spi-mem.c:18:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool update_stripe(const u8 opcode)
   ^
   static 
   1 warning generated.


vim +/update_stripe +18 drivers/spi/spi-mem.c

    17	
  > 18	bool update_stripe(const u8 opcode)
    19	{
    20		if (opcode ==  SPINOR_OP_BE_4K ||
    21		    opcode ==  SPINOR_OP_BE_32K ||
    22		    opcode ==  SPINOR_OP_CHIP_ERASE ||
    23		    opcode ==  SPINOR_OP_SE ||
    24		    opcode ==  SPINOR_OP_BE_32K_4B ||
    25		    opcode ==  SPINOR_OP_SE_4B ||
    26		    opcode == SPINOR_OP_BE_4K_4B ||
    27		    opcode ==  SPINOR_OP_WRSR ||
    28		    opcode ==  SPINOR_OP_WREAR ||
    29		    opcode ==  SPINOR_OP_BRWR ||
    30		    opcode ==  SPINOR_OP_WRSR2)
    31			return false;
    32	
    33		return true;
    34	}
    35	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
