Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A1D46A4
	for <llvm@lists.linux.dev>; Wed, 18 May 2022 06:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652856385; x=1684392385;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFg/OiSzC+FbPf82f+mKznpjNGbY+1W6OsvZJl8tgKA=;
  b=ca3wrDPOdGFLEybpkmcfDgtTQKGW9FfWRaRSmdFN/DAcFXZ3m4SQzmGe
   14ty5mC2xiLxUNhqLCBBsNeirJ1SGUW+fyX1QoS0j6ev0Z6AlFfdtnh/1
   FAT4YDqUPjcjgWj5bCRkIVGn5LC6RHtagi0uTeeCrExO02NF0wpfP2hIY
   WqrII7L3GlBGBQbSYxNBdib9B0Bt+7ASpTn6kRxDoBsz7AmnDI/60Sqoc
   C80wV7t/0pSSGWEhP4vgcGQXAi+X/nxO189usEHRgEYvOJMsZmgOdyl8u
   NUP3EKftTPVxmiLZGIcVTBU2YA3oxUecfW7COF/rIJuqSktQNZ48RCBzp
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="271639893"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="271639893"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2022 23:46:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; 
   d="scan'208";a="660994892"
Received: from lkp-server02.sh.intel.com (HELO 242b25809ac7) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 17 May 2022 23:46:21 -0700
Received: from kbuild by 242b25809ac7 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nrDRs-0001t1-D4;
	Wed, 18 May 2022 06:46:20 +0000
Date: Wed, 18 May 2022 14:45:33 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: drivers/net/can/spi/mcp251xfd/mcp251xfd.h:481:34: warning: field
 hw_tx_obj within 'struct mcp251xfd_tx_obj_load_buf::(unnamed at
 drivers/net/can/spi/mcp251xfd/mcp251xfd.h:479:2)' is less aligned than
 'struct mcp251xfd_hw_tx_obj_raw' and is usually due to ...
Message-ID: <202205181414.n8QRDe8k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   210e04ff768142b96452030c4c2627512b30ad95
commit: eb79a267c9b3e608e7762a1b221428f37ace3aa3 can: mcp251xfd: rename all remaining occurrence to mcp251xfd
date:   1 year, 8 months ago
config: arm-randconfig-c002-20220518 (https://download.01.org/0day-ci/archive/20220518/202205181414.n8QRDe8k-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=eb79a267c9b3e608e7762a1b221428f37ace3aa3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout eb79a267c9b3e608e7762a1b221428f37ace3aa3
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/net/can/spi/mcp251xfd/mcp251xfd.h:481:34: warning: field hw_tx_obj within 'struct mcp251xfd_tx_obj_load_buf::(unnamed at drivers/net/can/spi/mcp251xfd/mcp251xfd.h:479:2)' is less aligned than 'struct mcp251xfd_hw_tx_obj_raw' and is usually due to 'struct mcp251xfd_tx_obj_load_buf::(unnamed at drivers/net/can/spi/mcp251xfd/mcp251xfd.h:479:2)' being packed, which can lead to unaligned accesses [-Wunaligned-access]
                   struct mcp251xfd_hw_tx_obj_raw hw_tx_obj;
                                                  ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd.h:485:34: warning: field hw_tx_obj within 'struct mcp251xfd_tx_obj_load_buf::(unnamed at drivers/net/can/spi/mcp251xfd/mcp251xfd.h:483:2)' is less aligned than 'struct mcp251xfd_hw_tx_obj_raw' and is usually due to 'struct mcp251xfd_tx_obj_load_buf::(unnamed at drivers/net/can/spi/mcp251xfd/mcp251xfd.h:483:2)' being packed, which can lead to unaligned accesses [-Wunaligned-access]
                   struct mcp251xfd_hw_tx_obj_raw hw_tx_obj;
                                                  ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd-core.c:511:1: warning: unused function 'mcp251xfd_chip_set_mode_nowait' [-Wunused-function]
   mcp251xfd_chip_set_mode_nowait(const struct mcp251xfd_priv *priv,
   ^
   3 warnings generated.
--
>> drivers/net/can/spi/mcp251xfd/mcp251xfd.h:481:34: warning: field hw_tx_obj within 'struct mcp251xfd_tx_obj_load_buf::(unnamed at drivers/net/can/spi/mcp251xfd/mcp251xfd.h:479:2)' is less aligned than 'struct mcp251xfd_hw_tx_obj_raw' and is usually due to 'struct mcp251xfd_tx_obj_load_buf::(unnamed at drivers/net/can/spi/mcp251xfd/mcp251xfd.h:479:2)' being packed, which can lead to unaligned accesses [-Wunaligned-access]
                   struct mcp251xfd_hw_tx_obj_raw hw_tx_obj;
                                                  ^
   drivers/net/can/spi/mcp251xfd/mcp251xfd.h:485:34: warning: field hw_tx_obj within 'struct mcp251xfd_tx_obj_load_buf::(unnamed at drivers/net/can/spi/mcp251xfd/mcp251xfd.h:483:2)' is less aligned than 'struct mcp251xfd_hw_tx_obj_raw' and is usually due to 'struct mcp251xfd_tx_obj_load_buf::(unnamed at drivers/net/can/spi/mcp251xfd/mcp251xfd.h:483:2)' being packed, which can lead to unaligned accesses [-Wunaligned-access]
                   struct mcp251xfd_hw_tx_obj_raw hw_tx_obj;
                                                  ^
   2 warnings generated.


vim +481 drivers/net/can/spi/mcp251xfd/mcp251xfd.h

   477	
   478	union mcp251xfd_tx_obj_load_buf {
   479		struct __packed {
   480			struct mcp251xfd_buf_cmd cmd;
 > 481			struct mcp251xfd_hw_tx_obj_raw hw_tx_obj;
   482		} nocrc;
   483		struct __packed {
   484			struct mcp251xfd_buf_cmd_crc cmd;
   485			struct mcp251xfd_hw_tx_obj_raw hw_tx_obj;
   486			__be16 crc;
   487		} crc;
   488	} ____cacheline_aligned;
   489	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
