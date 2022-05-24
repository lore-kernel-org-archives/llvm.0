Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A847810
	for <llvm@lists.linux.dev>; Tue, 24 May 2022 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653398498; x=1684934498;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BFliaCv+cB0PXbv3YekuYdrRznvm76kroRO4soD7CkE=;
  b=XaFHpP8f4rgoDQahhN6QpchC6yggeyijxQpEcF4k6jxKG78FB1sTtBiR
   398EIhX6Nr4OmRVOGEyYFI705/4a3DwNNyuCad1Q+fTzMUzd3MFJByaz0
   Goc/rpMlZ1wn0RZQHlSS8hLP0iUAvkiAT65lsO3VNtIHG6ntxEvywMiIa
   YHcRustnl+rIjkKVELKkVARSnu/CUwAcWr0t88afuAFzR20m+3e4V7aoJ
   VrGNi+9jFpbxOqCQNpmH4+yrLbF12N/ACQm9arhJ2NfFtjLoz+Qi6oZCZ
   x5tSwFKxZ/MbNbgsXWmBKoc0lUWGiqNaBMX2YkSeM8GvoHiPWXTSvjOGU
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="271101230"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="271101230"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2022 06:21:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; 
   d="scan'208";a="641935455"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 24 May 2022 06:21:34 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ntUTe-00025e-17;
	Tue, 24 May 2022 13:21:34 +0000
Date: Tue, 24 May 2022 21:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Miles Chen <miles.chen@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] clk: mediatek: mt6779: use mtk_clk_simple_probe
 to simplify driver
Message-ID: <202205242129.DezL7Tp0-lkp@intel.com>
References: <20220524083843.9994-5-miles.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220524083843.9994-5-miles.chen@mediatek.com>

Hi Miles,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on next-20220524]
[cannot apply to v5.18]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Miles-Chen/clk-mediatek-mt2701-use-mtk_clk_simple_probe-to-simplify-driver/20220524-173952
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
config: arm-randconfig-r014-20220524 (https://download.01.org/0day-ci/archive/20220524/202205242129.DezL7Tp0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 10c9ecce9f6096e18222a331c5e7d085bd813f75)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/22d101bc8621971e234c34276dce52c37b82b498
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Miles-Chen/clk-mediatek-mt2701-use-mtk_clk_simple_probe-to-simplify-driver/20220524-173952
        git checkout 22d101bc8621971e234c34276dce52c37b82b498
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: missing MODULE_LICENSE() in drivers/clk/imx/clk-imxrt1050.o
ERROR: modpost: "vmf_insert_pfn" [drivers/gpu/drm/drm_shmem_helper.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-aud.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-aud.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-vdec.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-vdec.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-cam.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-cam.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_remove" [drivers/clk/mediatek/clk-mt6779-ipe.ko] undefined!
>> ERROR: modpost: "mtk_clk_simple_probe" [drivers/clk/mediatek/clk-mt6779-ipe.ko] undefined!
ERROR: modpost: "imx_clk_hw_pfd" [drivers/clk/imx/clk-imxrt1050.ko] undefined!
WARNING: modpost: suppressed 1 unresolved symbol warnings because there were too many)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_GEM_SHMEM_HELPER
   Depends on HAS_IOMEM && DRM && MMU
   Selected by
   - DRM_SSD130X && HAS_IOMEM && DRM

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
