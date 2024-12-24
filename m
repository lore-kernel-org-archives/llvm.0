Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC95E1BC3C;
	Tue, 24 Dec 2024 15:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735054780; cv=none; b=pMytrRODz4rw+Etoag4zmtc3orQ89I4GEY/EpxFL0vTz6JHzRH4zSEciqbWfTgOGQtl0Mt6Bw4V2ze3o2VPpzbnSaNrp8YeeEQcU+p4ukpnqnWbl5QrQvw7KpPN3Y2TSwPNsHs9Yafqkg+rL47kWiV0GokPn8WHVhb169awQm2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735054780; c=relaxed/simple;
	bh=edqyCYdMnbpF/ByzWkS3I30+yX4/lNEqmzrL4E4bj7M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZEmEaeeAqWI9yPU2Or5OSYm/7KPYiJPd4dcZmWgihtWFmIf37on193GWmghTkWy1ngvsA14hB87RgPPxBm6x16dau1I///602hTaf8Y9Q7tQPKnd/xRlg8ErL08c/LJswyyY2d4rVRjDCrbBdUOY0AXRicinYnSi7Z2ZDMUIwag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S8pFA1Oy; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S8pFA1Oy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735054778; x=1766590778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=edqyCYdMnbpF/ByzWkS3I30+yX4/lNEqmzrL4E4bj7M=;
  b=S8pFA1OyV86x/wFNSVZK8u5bJ8/lgrqlESOiXqW5gX37XCSDaQQUWaMv
   +hG42WK5iVTZH/cepdajBYHkAqaf3AAZZfFVWG2Y2LGI7maaZRMtbUfrj
   aNpQa8An8JZ3+LboubXKrxdnt36ptyiVb+A+2FGWevzh1VjTtGa6EtRJt
   7IFUv7qpPjL3JZl8VS8vU4abwgpG++8rsFR76Te/msVxbfi1qO4EtYRuU
   P/ZhTlwnRkrrS9N/gPvW/nKE7Bu6d0C4QOaHbO5jlh7DI6z2+rhG+ODdk
   +gl3RWbmuRk33eMaAbu5MBPxizeXls1Mpmhyk/1Hbm/FvM1ad2JEH/PZo
   Q==;
X-CSE-ConnectionGUID: pjwMgIjzRNyuL+PY3qC5VQ==
X-CSE-MsgGUID: 5BG+jo9zSM6fWjNnt7K2NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35403714"
X-IronPort-AV: E=Sophos;i="6.12,260,1728975600"; 
   d="scan'208";a="35403714"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 07:39:37 -0800
X-CSE-ConnectionGUID: DiOREz77RdyclURdCBdCbA==
X-CSE-MsgGUID: x4+cCtFuTN2oSL4va8joqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103607972"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Dec 2024 07:39:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ70P-0001GN-1q;
	Tue, 24 Dec 2024 15:39:33 +0000
Date: Tue, 24 Dec 2024 23:39:03 +0800
From: kernel test robot <lkp@intel.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [lumag-msm:msm-next-lumag-test 34/45]
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c:38:17: error: call to undeclared
 function 'FIELD_PREP'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202412242308.ZEb4kDPo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitlab.freedesktop.org/lumag/msm msm-next-lumag-test
head:   03d54ee319acae9219b02fd12eda0569855f8448
commit: 33690856e566b47cbcb5a36200790b1b49eb1cb6 [34/45] drm/msm/dpu: Add dpu_hw_cwb abstraction for CWB block
config: i386-buildonly-randconfig-003-20241224 (https://download.01.org/0day-ci/archive/20241224/202412242308.ZEb4kDPo-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412242308.ZEb4kDPo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412242308.ZEb4kDPo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c:7:
   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h:9:
   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h:12:
   In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h:13:
   In file included from drivers/gpu/drm/msm/msm_drv.h:22:
   In file included from include/linux/iommu.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c:38:17: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      38 |                 cwb_mux_cfg = FIELD_PREP(CWB_MUX_MASK, pp - PINGPONG_0);
         |                               ^
   1 warning and 1 error generated.


vim +/FIELD_PREP +38 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.c

    15	
    16	static void dpu_hw_cwb_config(struct dpu_hw_cwb *ctx,
    17				      struct dpu_hw_cwb_setup_cfg *cwb_cfg)
    18	{
    19		struct dpu_hw_blk_reg_map *c = &ctx->hw;
    20		int cwb_mux_cfg = 0xF;
    21		enum dpu_pingpong pp;
    22		enum cwb_mode_input input;
    23	
    24		if (!cwb_cfg)
    25			return;
    26	
    27		input = cwb_cfg->input;
    28		pp = cwb_cfg->pp_idx;
    29	
    30		if (input >= INPUT_MODE_MAX)
    31			return;
    32	
    33		/*
    34		 * The CWB_MUX register takes the pingpong index for the real-time
    35		 * display
    36		 */
    37		if ((pp != PINGPONG_NONE) && (pp < PINGPONG_MAX))
  > 38			cwb_mux_cfg = FIELD_PREP(CWB_MUX_MASK, pp - PINGPONG_0);
    39	
    40		input = FIELD_PREP(CWB_MODE_MASK, input);
    41	
    42		DPU_REG_WRITE(c, CWB_MUX, cwb_mux_cfg);
    43		DPU_REG_WRITE(c, CWB_MODE, input);
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
