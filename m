Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39EA10F4;
	Mon, 30 Oct 2023 05:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H2R8CsB0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698642942; x=1730178942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mo2C41xCPgfbH3NPdYKapCpoK7Xcq+wMQtztJ4Z2I6Y=;
  b=H2R8CsB0wF7MzaMduUQuBBlBvbNZt5Xovs/sWUODxtorNveebUjteaLp
   N1YJanSEPwDKFYb7pb6K3tF88BmmssqMweUUKCxYNQHs2mhPGs/MB+/SW
   pJennu/EB2CLixRaKEdLUot3ejmLl1WTF1LhPsEUMDLADqynP3ENofKBv
   Dpq5lLs7A+vsavswLaeYnJJHpvvUse24IyOmlLzqYO43eWv37qKENNmXl
   xtwjG3tlqHE57a1ZKmk7p1RwWA5YcYZNXTbXuu8csADKP55g0qi29ALtd
   9/SPqXMlr26iXG5NxGpS9nWQJ+UZOgxRFDrZ3y6ua2L3OXoR8eVMXZEqp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="9547689"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="9547689"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 22:15:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="1407430"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Oct 2023 22:15:39 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qxKci-000D3P-1U;
	Mon, 30 Oct 2023 05:15:36 +0000
Date: Mon, 30 Oct 2023 13:14:58 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	CK Hu <ck.hu@mediatek.com>
Subject: [linux-next:master 9156/15478]
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c:78:6: warning: variable 'cfg_val'
 set but not used
Message-ID: <202310301338.pB7KCZxs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi AngeloGioacchino,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66f1e1ea3548378ff6387b1ce0b40955d54e86aa
commit: a6b39cd248f3321dbf066f95f95a9841f891229e [9156/15478] drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231030/202310301338.pB7KCZxs-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231030/202310301338.pB7KCZxs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310301338.pB7KCZxs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/mediatek/mtk_disp_gamma.c:78:6: warning: variable 'cfg_val' set but not used [-Wunused-but-set-variable]
      78 |         u32 cfg_val, word;
         |             ^
   1 warning generated.


vim +/cfg_val +78 drivers/gpu/drm/mediatek/mtk_disp_gamma.c

d243907bb42f66 AngeloGioacchino Del Regno 2023-10-12   71  
a6b39cd248f332 AngeloGioacchino Del Regno 2023-10-12   72  void mtk_gamma_set(struct device *dev, struct drm_crtc_state *state)
69a4237ab1d13a Yongqiang Niu              2021-01-29   73  {
a6b39cd248f332 AngeloGioacchino Del Regno 2023-10-12   74  	struct mtk_disp_gamma *gamma = dev_get_drvdata(dev);
0d4caaaf61ce05 AngeloGioacchino Del Regno 2023-10-12   75  	unsigned int i;
69a4237ab1d13a Yongqiang Niu              2021-01-29   76  	struct drm_color_lut *lut;
69a4237ab1d13a Yongqiang Niu              2021-01-29   77  	void __iomem *lut_base;
0d4caaaf61ce05 AngeloGioacchino Del Regno 2023-10-12  @78  	u32 cfg_val, word;
69a4237ab1d13a Yongqiang Niu              2021-01-29   79  
aa5fb24f971dd4 AngeloGioacchino Del Regno 2023-10-12   80  	/* If there's no gamma lut there's nothing to do here. */
aa5fb24f971dd4 AngeloGioacchino Del Regno 2023-10-12   81  	if (!state->gamma_lut)
aa5fb24f971dd4 AngeloGioacchino Del Regno 2023-10-12   82  		return;
aa5fb24f971dd4 AngeloGioacchino Del Regno 2023-10-12   83  
a6b39cd248f332 AngeloGioacchino Del Regno 2023-10-12   84  	lut_base = gamma->regs + DISP_GAMMA_LUT;
69a4237ab1d13a Yongqiang Niu              2021-01-29   85  	lut = (struct drm_color_lut *)state->gamma_lut->data;
a6b39cd248f332 AngeloGioacchino Del Regno 2023-10-12   86  	for (i = 0; i < gamma->data->lut_size; i++) {
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12   87  		struct drm_color_lut diff, hwlut;
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12   88  
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12   89  		hwlut.red = drm_color_lut_extract(lut[i].red, 10);
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12   90  		hwlut.green = drm_color_lut_extract(lut[i].green, 10);
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12   91  		hwlut.blue = drm_color_lut_extract(lut[i].blue, 10);
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12   92  
a6b39cd248f332 AngeloGioacchino Del Regno 2023-10-12   93  		if (!gamma->data->lut_diff || (i % 2 == 0)) {
6e46998c13f123 AngeloGioacchino Del Regno 2023-10-12   94  			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, hwlut.red);
6e46998c13f123 AngeloGioacchino Del Regno 2023-10-12   95  			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, hwlut.green);
6e46998c13f123 AngeloGioacchino Del Regno 2023-10-12   96  			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, hwlut.blue);
ba99d08da6adec Yongqiang Niu              2022-04-28   97  		} else {
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12   98  			diff.red = lut[i].red - lut[i - 1].red;
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12   99  			diff.red = drm_color_lut_extract(diff.red, 10);
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12  100  
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12  101  			diff.green = lut[i].green - lut[i - 1].green;
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12  102  			diff.green = drm_color_lut_extract(diff.green, 10);
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12  103  
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12  104  			diff.blue = lut[i].blue - lut[i - 1].blue;
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12  105  			diff.blue = drm_color_lut_extract(diff.blue, 10);
ba99d08da6adec Yongqiang Niu              2022-04-28  106  
6e46998c13f123 AngeloGioacchino Del Regno 2023-10-12  107  			word = FIELD_PREP(DISP_GAMMA_LUT_10BIT_R, diff.red);
6e46998c13f123 AngeloGioacchino Del Regno 2023-10-12  108  			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_G, diff.green);
6e46998c13f123 AngeloGioacchino Del Regno 2023-10-12  109  			word |= FIELD_PREP(DISP_GAMMA_LUT_10BIT_B, diff.blue);
ba99d08da6adec Yongqiang Niu              2022-04-28  110  		}
c18119dee1919c AngeloGioacchino Del Regno 2023-10-12  111  		writel(word, lut_base + i * 4);
69a4237ab1d13a Yongqiang Niu              2021-01-29  112  	}
0d4caaaf61ce05 AngeloGioacchino Del Regno 2023-10-12  113  
a6b39cd248f332 AngeloGioacchino Del Regno 2023-10-12  114  	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
0d4caaaf61ce05 AngeloGioacchino Del Regno 2023-10-12  115  
0d4caaaf61ce05 AngeloGioacchino Del Regno 2023-10-12  116  	/* Enable the gamma table */
6e46998c13f123 AngeloGioacchino Del Regno 2023-10-12  117  	cfg_val |= FIELD_PREP(GAMMA_LUT_EN, 1);
0d4caaaf61ce05 AngeloGioacchino Del Regno 2023-10-12  118  
a6b39cd248f332 AngeloGioacchino Del Regno 2023-10-12  119  	cfg_val = readl(gamma->regs + DISP_GAMMA_CFG);
69a4237ab1d13a Yongqiang Niu              2021-01-29  120  }
69a4237ab1d13a Yongqiang Niu              2021-01-29  121  

:::::: The code at line 78 was first introduced by commit
:::::: 0d4caaaf61ce0556843e2fa9d41ec65962b51c14 drm/mediatek: gamma: Enable the Gamma LUT table only after programming

:::::: TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
:::::: CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
