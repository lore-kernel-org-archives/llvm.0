Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA1D628
	for <llvm@lists.linux.dev>; Thu,  2 Jun 2022 00:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654130402; x=1685666402;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rgg9lrRoTbyGUqBXjkt3vAJoPX0NgN9jHGqc3UmmXnw=;
  b=eS5ESG7H6UaxsaYLkhZ9S9AVgsHQUKb/CLxyPTOjQjNuX0BQYBUgdeLF
   cJkB51QTTgR0hoqR6ByggMlCpONSkrwoTVt4Yk+SXglsgGFNMt9XImAaT
   bECGbdnkuL+WmE728x/fWhbM9QxKGHIQo7EvME3YXs99rT5PKAsqBFq90
   ACyj4vJCEMzDm2UBdY9KsQ8dsqxa5QvpFkT19gSkThpgPNEoEcts1RFAE
   I3c8Q5yDJkxeXFRayAfBHAh+MMv+aqBJGpF3dM0zkxYbwLWXi58kdD+oV
   o0ORuXdtqym09HQVAAvjW4dLb0/VLPaZ/5xuAQNyntxI67qz5gt1yekQF
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10365"; a="362150555"
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="362150555"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2022 17:40:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,270,1647327600"; 
   d="scan'208";a="606557433"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 01 Jun 2022 17:39:56 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nwYsW-0004aH-2c;
	Thu, 02 Jun 2022 00:39:56 +0000
Date: Thu, 2 Jun 2022 08:39:05 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v1 5/5] drm/msm/dpu: make dpu hardware catalog static
 const
Message-ID: <202206020857.GD3c79od-lkp@intel.com>
References: <20220601151613.1513554-6-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601151613.1513554-6-dmitry.baryshkov@linaro.org>

Hi Dmitry,

I love your patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on next-20220601]
[cannot apply to v5.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/drm-msm-clean-up-the-hw-catalog-init/20220601-231925
base:   git://anongit.freedesktop.org/drm/drm drm-next
config: arm64-randconfig-r003-20220531 (https://download.01.org/0day-ci/archive/20220602/202206020857.GD3c79od-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c825abd6b0198fb088d9752f556a70705bc99dfd)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/ae9332859e2098bf10e3c915aa912fc851b7541c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Dmitry-Baryshkov/drm-msm-clean-up-the-hw-catalog-init/20220601-231925
        git checkout ae9332859e2098bf10e3c915aa912fc851b7541c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/gpu/drm/msm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1747:10: error: initializer element is not a compile-time constant
           .perf = msm8998_perf_data,
                   ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1770:13: error: initializer element is not a compile-time constant
           .dma_cfg = sdm845_regdma,
                      ^~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1794:13: error: initializer element is not a compile-time constant
           .dma_cfg = sdm845_regdma,
                      ^~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1820:13: error: initializer element is not a compile-time constant
           .dma_cfg = sm8150_regdma,
                      ^~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1844:13: error: initializer element is not a compile-time constant
           .dma_cfg = sm8150_regdma,
                      ^~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1872:13: error: initializer element is not a compile-time constant
           .dma_cfg = sm8250_regdma,
                      ^~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1893:10: error: initializer element is not a compile-time constant
           .perf = sc7280_perf_data,
                   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c:1916:13: error: initializer element is not a compile-time constant
           .dma_cfg = sdm845_regdma,
                      ^~~~~~~~~~~~~
   8 errors generated.


vim +1747 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c

591e34a091d17df Krishna Manikandan         2021-04-06  1702  
5334087ee7438fa Loic Poulain               2022-02-14  1703  static const struct dpu_perf_cfg qcm2290_perf_data = {
5334087ee7438fa Loic Poulain               2022-02-14  1704  	.max_bw_low = 2700000,
5334087ee7438fa Loic Poulain               2022-02-14  1705  	.max_bw_high = 2700000,
5334087ee7438fa Loic Poulain               2022-02-14  1706  	.min_core_ib = 1300000,
5334087ee7438fa Loic Poulain               2022-02-14  1707  	.min_llcc_ib = 0,
5334087ee7438fa Loic Poulain               2022-02-14  1708  	.min_dram_ib = 1600000,
5334087ee7438fa Loic Poulain               2022-02-14  1709  	.min_prefill_lines = 24,
5334087ee7438fa Loic Poulain               2022-02-14  1710  	.danger_lut_tbl = {0xff, 0x0, 0x0},
5334087ee7438fa Loic Poulain               2022-02-14  1711  	.safe_lut_tbl = {0xfff0, 0x0, 0x0},
5334087ee7438fa Loic Poulain               2022-02-14  1712  	.qos_lut_tbl = {
5334087ee7438fa Loic Poulain               2022-02-14  1713  		{.nentry = ARRAY_SIZE(qcm2290_qos_linear),
5334087ee7438fa Loic Poulain               2022-02-14  1714  		.entries = qcm2290_qos_linear
5334087ee7438fa Loic Poulain               2022-02-14  1715  		},
5334087ee7438fa Loic Poulain               2022-02-14  1716  	},
5334087ee7438fa Loic Poulain               2022-02-14  1717  	.cdp_cfg = {
5334087ee7438fa Loic Poulain               2022-02-14  1718  		{.rd_enable = 1, .wr_enable = 1},
5334087ee7438fa Loic Poulain               2022-02-14  1719  		{.rd_enable = 1, .wr_enable = 0}
5334087ee7438fa Loic Poulain               2022-02-14  1720  	},
5334087ee7438fa Loic Poulain               2022-02-14  1721  	.clk_inefficiency_factor = 105,
5334087ee7438fa Loic Poulain               2022-02-14  1722  	.bw_inefficiency_factor = 120,
5334087ee7438fa Loic Poulain               2022-02-14  1723  };
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  1724  /*************************************************************
ae9332859e2098b Dmitry Baryshkov           2022-06-01  1725   * Hardware catalog
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  1726   *************************************************************/
25fdd5933e4c0f5 Jeykumar Sankaran          2018-06-27  1727  
ae9332859e2098b Dmitry Baryshkov           2022-06-01  1728  static const struct dpu_mdss_cfg msm8998_dpu_cfg = {
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1729  	.caps = &msm8998_dpu_caps,
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1730  	.mdp_count = ARRAY_SIZE(msm8998_mdp),
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1731  	.mdp = msm8998_mdp,
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1732  	.ctl_count = ARRAY_SIZE(msm8998_ctl),
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1733  	.ctl = msm8998_ctl,
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1734  	.sspp_count = ARRAY_SIZE(msm8998_sspp),
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1735  	.sspp = msm8998_sspp,
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1736  	.mixer_count = ARRAY_SIZE(msm8998_lm),
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1737  	.mixer = msm8998_lm,
6452cbd6f04cd57 Dmitry Baryshkov           2022-02-22  1738  	.dspp_count = ARRAY_SIZE(msm8998_dspp),
6452cbd6f04cd57 Dmitry Baryshkov           2022-02-22  1739  	.dspp = msm8998_dspp,
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1740  	.pingpong_count = ARRAY_SIZE(sdm845_pp),
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1741  	.pingpong = sdm845_pp,
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1742  	.intf_count = ARRAY_SIZE(msm8998_intf),
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1743  	.intf = msm8998_intf,
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1744  	.vbif_count = ARRAY_SIZE(msm8998_vbif),
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1745  	.vbif = msm8998_vbif,
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1746  	.reg_dma_count = 0,
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13 @1747  	.perf = msm8998_perf_data,
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1748  	.mdss_irqs = IRQ_SM8250_MASK,
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1749  };
94391a14fc27383 AngeloGioacchino Del Regno 2022-01-13  1750  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
