Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154DA320A10;
	Mon, 10 Nov 2025 18:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800693; cv=none; b=ntLBlAiKtBNRElHJY5I/AicEhgxEjg7b0q8XT5ACIerycf8MoVXh+YqCRnFlmuSuC6GdKn/nd5/T2bbBd3dvx1TigLaYPiNBnIGBYTk0EbyK1gh+H7wNKhfp6Cz6MhBFUHQ+paGdpdA2g/yBXpTm1Y9mE/ulDWg3vXM/F8nhNXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800693; c=relaxed/simple;
	bh=8SCZ/pQk6TR+/SVdD97DEDcivTL5QFfnPmC3z0UBR4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bHkKLE44XnF+Em3VZft/8n7K1pRVFrEdUVKGjIN8nqk1g0zqx7+YWvxRg1Uy7xMG2kkwXSiUTpJKZ+U8MV5xaVf/KId2kXLmo5TyJaRiZ7wwhSAFe9UgOgtZEGO9cZjJ/VwKt5ZoAkfunsbRCLJ4SbiJcfwfPfYi2lX8QvGW/XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dLMef5iU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dLMef5iU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762800693; x=1794336693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8SCZ/pQk6TR+/SVdD97DEDcivTL5QFfnPmC3z0UBR4Y=;
  b=dLMef5iU02YobhWZwVZHuOiaUT9PcUMvFh810eyzFZu+DVaTFOaT5SYd
   mn6oYEMnFf+mGl9/RRMFOnPLryoRRHrgf76ghZ8UQ+i1kUFLLstMTZK5V
   M7vrCBZA2r8ReWz6FCo880JOGQrrIVerGlvXSJNh0xP1SGEW9B27CSRYH
   bGRpVJOZazeIFtJHd1FGAZNd0v/sf4P70PqUxBswBBD1a9vxVT40HnRbk
   rGfjWHkqx2W+P0ox0WrTs1/NDJc+Pv/0d0oQOCFLzWyL0kpjK6ZarU+Vn
   AFjc5C1unIlx0llQy0WJagxkObQtNGKhpAECXLoWoYjpsqy0RIsGMp9+a
   Q==;
X-CSE-ConnectionGUID: xRjKQcmZTi6Jvz5l7mGZeg==
X-CSE-MsgGUID: corZFcclSOmEAslO6c3Jlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="76308415"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="76308415"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 10:51:27 -0800
X-CSE-ConnectionGUID: uS9vd7eiTiSFd07znPjO+w==
X-CSE-MsgGUID: wA1TKYyMTKKH48CVjwI4EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; 
   d="scan'208";a="188585037"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Nov 2025 10:51:24 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIWz4-0000sp-2s;
	Mon, 10 Nov 2025 18:51:22 +0000
Date: Tue, 11 Nov 2025 02:50:30 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk 15/29]
 drivers/media/platform/dreamchip/rppx1/rpp_params.c:14:6: error: call to
 undeclared function 'WARN_ON'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202511110247.EjE0Mx21-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc5-2025-11-10-sparrow-hawk
head:   14a3f460905b5d9be43ad2bab030625085a52423
commit: deb53902b8777a75d24152d85dbfdec4f0e5cbab [15/29] media: rppx1: Add framework to support Dreamchip RPPX1 ISP
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20251111/202511110247.EjE0Mx21-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110247.EjE0Mx21-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110247.EjE0Mx21-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/dreamchip/rppx1/rpp_params.c:14:6: error: call to undeclared function 'WARN_ON'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      14 |         if (WARN_ON(!cfg))
         |             ^
>> drivers/media/platform/dreamchip/rppx1/rpp_params.c:15:11: error: use of undeclared identifier 'EINVAL'
      15 |                 return -EINVAL;
         |                         ^
>> drivers/media/platform/dreamchip/rppx1/rpp_params.c:36:3: error: use of undeclared identifier 'ENODEV'
      36 |                 rpp_module_call(module, param_rkisp1, block, write, priv);
         |                 ^
   drivers/media/platform/dreamchip/rppx1/rpp_module.h:149:16: note: expanded from macro 'rpp_module_call'
     149 |                         __result = -ENODEV;                             \
         |                                     ^
   3 errors generated.
--
>> drivers/media/platform/dreamchip/rppx1/rppx1_acq.c:61:11: error: use of undeclared identifier 'EINVAL'
      61 |                 return -EINVAL;
         |                         ^
   drivers/media/platform/dreamchip/rppx1/rppx1_acq.c:109:11: error: use of undeclared identifier 'EINVAL'
     109 |                 return -EINVAL;
         |                         ^
   drivers/media/platform/dreamchip/rppx1/rppx1_acq.c:132:11: error: use of undeclared identifier 'EINVAL'
     132 |                 return -EINVAL;
         |                         ^
   3 errors generated.
--
>> drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c:23:11: error: use of undeclared identifier 'EINVAL'
      23 |                 return -EINVAL;
         |                         ^
   1 error generated.
--
>> drivers/media/platform/dreamchip/rppx1/rppx1_bd.c:45:11: error: use of undeclared identifier 'EINVAL'
      45 |                 return -EINVAL;
         |                         ^
   1 error generated.
--
>> drivers/media/platform/dreamchip/rppx1/rppx1_bdrgb.c:72:11: error: use of undeclared identifier 'EINVAL'
      72 |                 return -EINVAL;
         |                         ^
   1 error generated.
--
>> drivers/media/platform/dreamchip/rppx1/rppx1_bls.c:51:11: error: use of undeclared identifier 'EINVAL'
      51 |                 return -EINVAL;
         |                         ^
   1 error generated.
--
>> drivers/media/platform/dreamchip/rppx1/rppx1_cac.c:22:11: error: use of undeclared identifier 'EINVAL'
      22 |                 return -EINVAL;
         |                         ^
   1 error generated.
--
>> drivers/media/platform/dreamchip/rppx1/rppx1_ccor.c:40:11: error: use of undeclared identifier 'EINVAL'
      40 |                 return -EINVAL;
         |                         ^
   1 error generated.
--
>> drivers/media/platform/dreamchip/rppx1/rppx1_db.c:37:11: error: use of undeclared identifier 'EINVAL'
      37 |                 return -EINVAL;
         |                         ^
   1 error generated.
--
>> drivers/media/platform/dreamchip/rppx1/rppx1_dpcc.c:58:11: error: use of undeclared identifier 'EINVAL'
      58 |                 return -EINVAL;
         |                         ^
   1 error generated.
--
>> drivers/media/platform/dreamchip/rppx1/rppx1_exm.c:43:11: error: use of undeclared identifier 'EINVAL'
      43 |                 return -EINVAL;
         |                         ^
   1 error generated.
..


vim +/WARN_ON +14 drivers/media/platform/dreamchip/rppx1/rpp_params.c

     8	
     9	int rppx1_params_rkisp1(struct rppx1 *rpp, struct rkisp1_ext_params_cfg *cfg,
    10				rppx1_reg_write write, void *priv)
    11	{
    12		size_t block_offset = 0;
    13	
  > 14		if (WARN_ON(!cfg))
  > 15			return -EINVAL;
    16	
    17		/* Walk the list of parameter blocks and process them. */
    18		while (block_offset < cfg->data_size) {
    19			const union rppx1_params_rkisp1_config *block =
    20				(const union rppx1_params_rkisp1_config *)&cfg->data[block_offset];
    21			struct rpp_module *module;
    22	
    23			block_offset += block->header.size;
    24	
    25			switch (block->header.type) {
    26			default:
    27				module = NULL;
    28				break;
    29			}
    30	
    31			if (!module) {
    32				pr_warn("Not handled RPPX1 block type: 0x%04x\n", block->header.type);
    33				continue;
    34			}
    35	
  > 36			rpp_module_call(module, param_rkisp1, block, write, priv);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
