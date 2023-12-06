Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DC56AA7;
	Wed,  6 Dec 2023 02:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KhpkpRfv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701830846; x=1733366846;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K5Qlg8G5Ow9V+3c/F/kXThV5Jo0MD3BqLmcxng9H7ck=;
  b=KhpkpRfvjl8OaRt7B2swK12vnmOfdMID71g7SGxfqaj69i2DEKjsTyIW
   +zzArwe2FdOWQr04ly/+ckovRTn44JotFs0chTKnOpSfmO4kWuMrj/H8d
   0DV3xV3R0xH+WRISNpk8Hta7P9PNIViG7pX7oPNxI4lqBiqt26egC1oHu
   oyDUmk3aa6k8x3ARdwZssbOWP3CCnieXGaDLI+kCwxwvgZgtlK29xmHll
   si+r7sCIivabvfZ0GpEe4Dv+1Z5TT1n58pbw+q0R9zbhm/1+UTlP8P9tA
   bXQGkWFKhrsTsNIcmut/ri4hdjS1J/PVyx2rexqEnz5Cdp339mnil6IuH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1060123"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1060123"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 18:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102665128"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1102665128"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 18:47:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAhwS-000A78-18;
	Wed, 06 Dec 2023 02:47:16 +0000
Date: Wed, 6 Dec 2023 10:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 14/42] drivers/mtd/spi-nor/core.c:632:5:
 warning: no previous prototype for function 'spi_nor_write_ear'
Message-ID: <202312061040.MaLcPvKI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   414b0dc753ec961cf8e532b86412522e78a00169
commit: c29562880a8dec6ead1ec39e25e91840bad9da62 [14/42] mtd: spi-nor: Add EAR support
config: x86_64-randconfig-006-20231201 (https://download.01.org/0day-ci/archive/20231206/202312061040.MaLcPvKI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061040.MaLcPvKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061040.MaLcPvKI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/core.c:632:5: warning: no previous prototype for function 'spi_nor_write_ear' [-Wmissing-prototypes]
   int spi_nor_write_ear(struct spi_nor *nor, u32 addr)
       ^
   drivers/mtd/spi-nor/core.c:632:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int spi_nor_write_ear(struct spi_nor *nor, u32 addr)
   ^
   static 
   drivers/mtd/spi-nor/core.c:2102:14: warning: variable 'offset' is uninitialized when used here [-Wuninitialized]
                           u64 aux = offset;
                                     ^~~~~~
   drivers/mtd/spi-nor/core.c:1951:23: note: initialize the variable 'offset' to silence this warning
           u32 addr, len, offset, cur_cs_num = 0;
                                ^
                                 = 0
   drivers/mtd/spi-nor/core.c:4022:8: warning: variable 'ret' is uninitialized when used here [-Wuninitialized]
                           if (ret)
                               ^~~
   drivers/mtd/spi-nor/core.c:4006:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   3 warnings generated.


vim +/spi_nor_write_ear +632 drivers/mtd/spi-nor/core.c

   624	
   625	/**
   626	 * spi_nor_write_ear() - Write Extended Address Register.
   627	 * @nor:	pointer to 'struct spi_nor'.
   628	 * @addr:	value to write to the Extended Address Register.
   629	 *
   630	 * Return: 0 on success, -errno otherwise.
   631	 */
 > 632	int spi_nor_write_ear(struct spi_nor *nor, u32 addr)
   633	{
   634		u8 code = SPINOR_OP_WREAR;
   635		u32 ear;
   636		int ret;
   637		struct mtd_info *mtd = &nor->mtd;
   638	
   639		/* Wait until finished previous write command. */
   640		if (spi_nor_wait_till_ready(nor))
   641			return 1;
   642	
   643		ret = spi_nor_write_enable(nor);
   644		if (ret)
   645			return ret;
   646	
   647		if (!(nor->flags & SNOR_F_HAS_PARALLEL) && mtd->size <= 0x1000000)
   648			return 0;
   649		else if (mtd->size <= 0x2000000)
   650			return 0;
   651	
   652		if (!(nor->flags & SNOR_F_HAS_PARALLEL) || !(nor->flags & SNOR_F_HAS_STACKED))
   653			addr = addr % (u32)mtd->size;
   654		else
   655			addr = addr % (u32)(mtd->size >> 0x1);
   656	
   657		ear = addr >> 24;
   658	
   659		if (!(nor->flags & SNOR_F_HAS_STACKED) && ear == nor->curbank)
   660			return 0;
   661	
   662		if ((nor->flags & SNOR_F_HAS_STACKED) && mtd->size <= 0x2000000)
   663			return 0;
   664	
   665		if (nor->jedec_id == CFI_MFR_AMD)
   666			code = SPINOR_OP_BRWR;
   667		if (nor->jedec_id == CFI_MFR_ST ||
   668		    nor->jedec_id == CFI_MFR_MACRONIX ||
   669		    nor->jedec_id == CFI_MFR_PMC) {
   670			spi_nor_write_enable(nor);
   671			code = SPINOR_OP_WREAR;
   672		}
   673		nor->bouncebuf[0] = ear;
   674	
   675		if (nor->spimem) {
   676			struct spi_mem_op op =
   677				SPI_MEM_OP(SPI_MEM_OP_CMD(code, 0),
   678					   SPI_MEM_OP_NO_ADDR,
   679					   SPI_MEM_OP_NO_DUMMY,
   680					   SPI_MEM_OP_DATA_OUT(1, nor->bouncebuf, 0));
   681	
   682			spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
   683	
   684			ret = spi_mem_exec_op(nor->spimem, &op);
   685		} else {
   686			ret = spi_nor_controller_ops_write_reg(nor, code, nor->bouncebuf, 1);
   687			if (ret < 0)
   688				return ret;
   689		}
   690	
   691		nor->curbank = ear;
   692	
   693		return ret;
   694	}
   695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
