Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E12417C7;
	Thu, 25 May 2023 01:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684977881; x=1716513881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hFml+IFBGpyck4Ofg1pKOuGV669kPAVkwNRi7Imskrg=;
  b=H3ceuDZI326NkNxI9fAPjpiqSwIPWob0TfTTKA3b8+SdwN4iixnUMUU3
   cNxoK5DnEaADj4AkWPdYT6FMUek2PaBJvrXWS1pypxE594cMqK1nnWCro
   pbpU5BZhKW1uprt4OtvnqUBharphHZL9JEVgFR7utLk6OxZH9vOQB3k9o
   DqYadS2NY6yE/dNyMvyZBja9T3OTK/ktqoOWNZVpDugHKSLXk7ZIF5USD
   2muQNDqzGc/y7pzeZs4er0LZ7ytGSVneT/TTWVA/89eymPerrViVX4x+L
   NOHFiCqQ7mEQ6Krg4OCN4UsHe50SAK2wMYIbJ15xGBhYklXtqrOTwXAT6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343208094"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="343208094"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 18:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="769672043"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="769672043"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 May 2023 18:24:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1ziO-000FLD-0t;
	Thu, 25 May 2023 01:24:28 +0000
Date: Thu, 25 May 2023 09:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: Runyang Chen <runyang.chen@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	Runyang Chen <runyang.chen@mediatek.com>
Subject: Re: [PATCH v3 2/2] clk: mediatek: reset: add infra_ao reset support
 for MT8188
Message-ID: <202305250908.Uvas9u4E-lkp@intel.com>
References: <20230524133439.20659-3-runyang.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524133439.20659-3-runyang.chen@mediatek.com>

Hi Runyang,

kernel test robot noticed the following build errors:

[auto build test ERROR on clk/clk-next]
[also build test ERROR on pza/reset/next]
[cannot apply to pza/imx-drm/next mbgg-mediatek/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Runyang-Chen/dt-bindings-reset-mt8188-add-thermal-reset-control-bit/20230524-213538
base:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-next
patch link:    https://lore.kernel.org/r/20230524133439.20659-3-runyang.chen%40mediatek.com
patch subject: [PATCH v3 2/2] clk: mediatek: reset: add infra_ao reset support for MT8188
config: riscv-randconfig-r042-20230524 (https://download.01.org/0day-ci/archive/20230525/202305250908.Uvas9u4E-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/7d969d160489d561f9b1fb6388adaa1ba8fe06a1
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Runyang-Chen/dt-bindings-reset-mt8188-add-thermal-reset-control-bit/20230524-213538
        git checkout 7d969d160489d561f9b1fb6388adaa1ba8fe06a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/clk/mediatek/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305250908.Uvas9u4E-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/mediatek/clk-mt8188-infra_ao.c:196:18: error: initializing 'u16 *' (aka 'unsigned short *') with an expression of type 'const u16[5]' (aka 'const unsigned short[5]') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .rst_bank_ofs = infra_ao_rst_ofs,
                           ^~~~~~~~~~~~~~~~
   drivers/clk/mediatek/clk-mt8188-infra_ao.c:198:17: error: initializing 'u16 *' (aka 'unsigned short *') with an expression of type 'const u16[3]' (aka 'const unsigned short[3]') discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           .rst_idx_map = infra_ao_idx_map,
                          ^~~~~~~~~~~~~~~~
   2 errors generated.


vim +196 drivers/clk/mediatek/clk-mt8188-infra_ao.c

   193	
   194	static const struct mtk_clk_rst_desc infra_ao_rst_desc = {
   195		.version = MTK_RST_SET_CLR,
 > 196		.rst_bank_ofs = infra_ao_rst_ofs,
   197		.rst_bank_nr = ARRAY_SIZE(infra_ao_rst_ofs),
   198		.rst_idx_map = infra_ao_idx_map,
   199		.rst_idx_map_nr = ARRAY_SIZE(infra_ao_idx_map),
   200	};
   201	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
