Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7690E2459EC;
	Sun, 27 Apr 2025 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745743174; cv=none; b=JpxfibnQkpXneLezPDbYbGUkgyzuQ3/HubU2kE/isZXcXIKtfFj1KOJyp+nbROGXlnBlXS7rNP3RB1j5kSwrCt56q1MS/e0etCrE+TxgGkcgzPV31uo/wYgc+wUp3+IaDf+MitmhkUWe2lSaP4mRRPCjPbF+6ECNXCVnWOBgzCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745743174; c=relaxed/simple;
	bh=5isVS8GkuL0a55DBwyh9ZXrtSqb336aZOmGprl0xtxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AfMj8U8POAlsEY+L9cUDrHOt6SD/dQWWPQT9njWlqUof02V6lXSk57HQ9E0opocv5TivlCvyPhoHCFJLySYabnY4Co0FurIPxe4TpOoJDgcFN46FyINjA/U66A/rynkbIR7hbUV9qUYGQ90FfEom2wvTzpO/a0Du8JwCitoSoB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AZgCtSke; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AZgCtSke"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745743170; x=1777279170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5isVS8GkuL0a55DBwyh9ZXrtSqb336aZOmGprl0xtxQ=;
  b=AZgCtSkeyh2xowPFj0nGT6jGWS4Kt90IcvyN+oQvZ427IQEE1gR7PUu4
   0iMuE99ITIch3eouWnrRzSlakK6/wp6wGEM3xST3ioPfdetidAbWgqpwj
   ZvE5hZDjrfnZLhC18BbZCuCiE8wmgosRGIczGP7ijfjPEfD5gass8XIwF
   3J5H40RJdNVsaJ5rJeqbSZmik+vnVghG1fbC74KGaRAgwQrS2DBeCyiuC
   cLKEixN262ybMmmpFlz7QNMMRyHBvwzsLOaA7ky9OULB9XyMsG/QdCHpK
   1VF0s0zjg5lzr8dH5Zgn6ZftSyEkxm6HTzQOLKHOmcTGUg4sp7CiQBTkZ
   A==;
X-CSE-ConnectionGUID: bZDwpV/zRCGLklB8ZUiYrg==
X-CSE-MsgGUID: P3WrAhk0QSa02VBFYQClAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="58331929"
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="58331929"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 01:39:29 -0700
X-CSE-ConnectionGUID: xuRv65tAQaqvZvP8J7t7jg==
X-CSE-MsgGUID: Fes50s8iR2eAyk9cHTtoaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,243,1739865600"; 
   d="scan'208";a="170470569"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Apr 2025 01:39:27 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8xXo-0006CR-0n;
	Sun, 27 Apr 2025 08:39:24 +0000
Date: Sun, 27 Apr 2025 16:38:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jianhua Lin <jianhua.lin@mediatek.com>
Subject: Re: [PATCH 1/1] media: mediatek: jpeg: add compatible for MT8188 SoC
Message-ID: <202504271611.pB3EgBfr-lkp@intel.com>
References: <20250426081928.27351-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426081928.27351-1-jianhua.lin@mediatek.com>

Hi Jianhua,

kernel test robot noticed the following build errors:

[auto build test ERROR on linuxtv-media-pending/master]
[also build test ERROR on linus/master v6.15-rc3 next-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jianhua-Lin/media-mediatek-jpeg-add-compatible-for-MT8188-SoC/20250426-162259
base:   https://git.linuxtv.org/media-ci/media-pending.git master
patch link:    https://lore.kernel.org/r/20250426081928.27351-1-jianhua.lin%40mediatek.com
patch subject: [PATCH 1/1] media: mediatek: jpeg: add compatible for MT8188 SoC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20250427/202504271611.pB3EgBfr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250427/202504271611.pB3EgBfr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504271611.pB3EgBfr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1948:3: error: field designator 'support_34bit' does not refer to any field in type 'const struct mtk_jpeg_variant'
    1948 |         .support_34bit = true,
         |         ~^~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1964:3: error: field designator 'support_34bit' does not refer to any field in type 'const struct mtk_jpeg_variant'
    1964 |         .support_34bit = true,
         |         ~^~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +1948 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c

  1934	
  1935	static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
  1936		.clks = mtk_jpeg_clocks,
  1937		.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
  1938		.formats = mtk_jpeg_enc_formats,
  1939		.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
  1940		.qops = &mtk_jpeg_enc_qops,
  1941		.irq_handler = mtk_jpeg_enc_irq,
  1942		.hw_reset = mtk_jpeg_enc_reset,
  1943		.m2m_ops = &mtk_jpeg_enc_m2m_ops,
  1944		.dev_name = "mtk-jpeg-enc",
  1945		.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
  1946		.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
  1947		.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
> 1948		.support_34bit = true,
  1949	};
  1950	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
