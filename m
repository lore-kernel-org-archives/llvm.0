Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD02A746F;
	Wed, 12 Apr 2023 17:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681322183; x=1712858183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pAPZ3pDjDhNlH6yRAG+mFXvd29vCvZ6e5uUFg1nTgew=;
  b=Mm4m22/fH+UgiTlOlDdGzVrcPqx+0WG7ifGT8UBqnVd3B3N5kYqWcip5
   8i4FlfRl0OL5ydXnmdpuZg9MIB+YOYcoPg5WjCz6b39veNh5Dmuc7R9hd
   d6rdotOVyvllxcrQSdELVjzdunjcYRGN3nS9i+GQw3F8yBx+tTv0+/Dkp
   2QC8kbhwHYn8qOIG6OCLxyTEe5LiJErMToDGGuA5ZJfzRMIecnZXWGiJp
   +JHnr8dIdW7OQXrJhGtgqiVNaGSUMqM9D/XQ1MN/tQ6PEis7xD+hTL0ri
   WKm9gVBVljlDy9sEHe5twdVL2E/qnCmvjqZ74qRTfYrQnpgD4NHC09fAd
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="332676724"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="332676724"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 10:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="813080856"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="813080856"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 12 Apr 2023 10:56:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmehg-000Xxx-0j;
	Wed, 12 Apr 2023 17:56:20 +0000
Date: Thu, 13 Apr 2023 01:56:07 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 946/1117] drivers/spi/spi-zynqmp-gqspi.c:229:6:
 warning: no previous prototype for function 'zynqmp_gqspi_update_stripe'
Message-ID: <202304130122.DoBs1fgx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3a2a9dcee70777a85b3952269c47e6eb65779b78
commit: 754602bf2ee623dc6274c971e7e84058b70450aa [946/1117] spi: spi-zynqmp-gqspi: Add parallel memories support in GQSPI driver
config: x86_64-randconfig-a006-20230410 (https://download.01.org/0day-ci/archive/20230413/202304130122.DoBs1fgx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/754602bf2ee623dc6274c971e7e84058b70450aa
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout 754602bf2ee623dc6274c971e7e84058b70450aa
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/spi/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130122.DoBs1fgx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/spi/spi-zynqmp-gqspi.c:26:
   In file included from include/linux/mtd/spi-nor.h:10:
   include/linux/mtd/cfi.h:62:2: warning: No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-W#warnings]
   #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
    ^
>> drivers/spi/spi-zynqmp-gqspi.c:229:6: warning: no previous prototype for function 'zynqmp_gqspi_update_stripe' [-Wmissing-prototypes]
   bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
        ^
   drivers/spi/spi-zynqmp-gqspi.c:229:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
   ^
   static 
   In file included from drivers/spi/spi-zynqmp-gqspi.c:13:
   include/linux/firmware/xlnx-zynqmp.h:1249:12: warning: unused function 'zynqmp_pm_sec_read_reg' [-Wunused-function]
   static int zynqmp_pm_sec_read_reg(u32 node_id, u32 offset, u32 *ret_value)
              ^
   include/linux/firmware/xlnx-zynqmp.h:1254:12: warning: unused function 'zynqmp_pm_sec_mask_write_reg' [-Wunused-function]
   static int zynqmp_pm_sec_mask_write_reg(const u32 node_id, const u32 offset,
              ^
   include/linux/firmware/xlnx-zynqmp.h:1324:12: warning: unused function 'zynqmp_pm_fpga_get_version' [-Wunused-function]
   static int zynqmp_pm_fpga_get_version(u32 *value)
              ^
   include/linux/firmware/xlnx-zynqmp.h:1329:12: warning: unused function 'zynqmp_pm_fpga_get_feature_list' [-Wunused-function]
   static int zynqmp_pm_fpga_get_feature_list(u32 *value)
              ^
   include/linux/firmware/xlnx-zynqmp.h:1334:12: warning: unused function 'versal_pm_sha_hash' [-Wunused-function]
   static int versal_pm_sha_hash(const u64 src, const u64 dst, const u32 size)
              ^
   7 warnings generated.


vim +/zynqmp_gqspi_update_stripe +229 drivers/spi/spi-zynqmp-gqspi.c

   221	
   222	/**
   223	 * zynqmp_gqspi_update_stripe - For GQSPI controller data stripe capabilities
   224	 * @op:	Pointer to mem ops
   225	 * Return:      Status of the data stripe
   226	 *
   227	 * Returns true if data stripe need to be enabled, else returns false
   228	 */
 > 229	bool zynqmp_gqspi_update_stripe(const struct spi_mem_op *op)
   230	{
   231		if (op->cmd.opcode ==  SPINOR_OP_BE_4K ||
   232		    op->cmd.opcode ==  SPINOR_OP_BE_32K ||
   233		    op->cmd.opcode ==  SPINOR_OP_CHIP_ERASE ||
   234		    op->cmd.opcode ==  SPINOR_OP_SE ||
   235		    op->cmd.opcode ==  SPINOR_OP_BE_32K_4B ||
   236		    op->cmd.opcode ==  SPINOR_OP_SE_4B ||
   237		    op->cmd.opcode == SPINOR_OP_BE_4K_4B ||
   238		    op->cmd.opcode ==  SPINOR_OP_WRSR ||
   239		    op->cmd.opcode ==  SPINOR_OP_BRWR ||
   240		    (op->cmd.opcode ==  SPINOR_OP_WRSR2 && !op->addr.nbytes))
   241			return false;
   242	
   243		return true;
   244	}
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
