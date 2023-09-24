Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66893DF61;
	Sun, 24 Sep 2023 21:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695589486; x=1727125486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FptmBJzF6honTQ52WxJt0+zg8Qjk0+fbVR0S3Xxohcw=;
  b=QlSIAV9ZegB2JRtRQEL5owGa8jK5CWAw2DxHD3yu8l3KRfRxD9xyfnRj
   /kAsWVY+LZY30syMLiNziyBo+tJia2sbTTCeJgvaXN7NswIcB/mB+6MCw
   v4gOaPoTuFZIMX4Cd7IHjdhSflTkSRbgBJRK8jB01uLrYzYRo2jjaWFzZ
   Eb6RuTsI2fPxomfpHRtCdoCrstA6+/H7wSbjpyD82xfxwaDGvFIOovUqI
   X5WsfOKvmHXt7TldEy/G8EPowTlxETlQr7yETwd4LMiRribqIGGxodmWW
   k95goHD9zp10jW0f7V7oEnHB8D52+xRqVP1YD/jpRSp1Tzw+NwM57DnwG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361377314"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="361377314"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 14:04:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="813710374"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; 
   d="scan'208";a="813710374"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 24 Sep 2023 14:04:43 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkWHR-0000Si-0t;
	Sun, 24 Sep 2023 21:04:41 +0000
Date: Mon, 25 Sep 2023 05:04:09 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:master 966/1123] drivers/spi/spi-zynq-qspi.c:167:6:
 warning: no previous prototype for function 'zynq_qspi_update_stripe'
Message-ID: <202309250408.n5Vd94Ii-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx master
head:   cb1f2dbc7e487361688257fccf78bf3f3ce0e9ed
commit: 7fe5d3fbd9be0cef89fbe9db59796698379345ea [966/1123] spi: spi-zynq-qspi: Add multi-cs support in Zynq QSPI driver
config: x86_64-buildonly-randconfig-003-20230905 (https://download.01.org/0day-ci/archive/20230925/202309250408.n5Vd94Ii-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309250408.n5Vd94Ii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309250408.n5Vd94Ii-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-zynq-qspi.c:167:6: warning: no previous prototype for function 'zynq_qspi_update_stripe' [-Wmissing-prototypes]
   bool zynq_qspi_update_stripe(const struct spi_mem_op *op)
        ^
   drivers/spi/spi-zynq-qspi.c:167:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool zynq_qspi_update_stripe(const struct spi_mem_op *op)
   ^
   static 
   1 warning generated.


vim +/zynq_qspi_update_stripe +167 drivers/spi/spi-zynq-qspi.c

   159	
   160	/**
   161	 * zynq_qspi_update_stripe - For Zynq QSPI controller data stripe capabilities
   162	 * @op: Pointer to mem ops
   163	 * Return:      Status of the data stripe
   164	 *
   165	 * Returns true if data stripe need to be enabled, else returns false
   166	 */
 > 167	bool zynq_qspi_update_stripe(const struct spi_mem_op *op)
   168	{
   169		if (op->cmd.opcode ==  SPINOR_OP_BE_4K ||
   170		    op->cmd.opcode ==  SPINOR_OP_BE_32K ||
   171		    op->cmd.opcode ==  SPINOR_OP_CHIP_ERASE ||
   172		    op->cmd.opcode ==  SPINOR_OP_SE ||
   173		    op->cmd.opcode ==  SPINOR_OP_BE_32K_4B ||
   174		    op->cmd.opcode ==  SPINOR_OP_SE_4B ||
   175		    op->cmd.opcode == SPINOR_OP_BE_4K_4B ||
   176		    op->cmd.opcode ==  SPINOR_OP_WRSR ||
   177		    op->cmd.opcode ==  SPINOR_OP_WREAR ||
   178		    op->cmd.opcode ==  SPINOR_OP_BRWR ||
   179		    (op->cmd.opcode ==  SPINOR_OP_WRSR2 && !op->addr.nbytes))
   180			return false;
   181	
   182		return true;
   183	}
   184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
