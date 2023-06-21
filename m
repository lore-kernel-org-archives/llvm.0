Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7193D20EB;
	Wed, 21 Jun 2023 04:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687322522; x=1718858522;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+Oyatk6UJM7WoUbA4Egxw1w1lf2ZrfcTPtl1VcnDick=;
  b=gVq8/Lt4qeXeJADiMJjDvNo91ROkVOrfXGLbbn/vTAMHOUSV8+Oajejc
   C+YrV1Caac770vb9mODoV9VPtVQlcZjv925d4LVA23ChGzqs41VzPjQW0
   enOYu6/JIE5zvaq8jaBy7xDD0L21t36oG2pcc7+ZbgZ62N774jwsAgIg+
   dZpqIsengPBUaq4lxMOmWJOMCZhsLweV/6nQO27jTgFa7EB+6Y58pRiDe
   puGZcgAVb17BxLMIw5/1f1bcKdGEUFr7+aPfvtMU1UVGIpuXEUiSStqmh
   SOOplH82hN2odxOZ4hWsDZK1tCcGbyJ0pYJU7KFfL/bT572qLXw2p/oiE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="349798502"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="349798502"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 21:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="714304953"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="714304953"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Jun 2023 21:41:57 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBpfI-0006Yp-0P;
	Wed, 21 Jun 2023 04:41:56 +0000
Date: Wed, 21 Jun 2023 12:41:04 +0800
From: kernel test robot <lkp@intel.com>
To: Lucas Tanure <tanure@linux.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Nick <nick@khadas.com>, Artem <art@khadas.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
	Lucas Tanure <tanure@linux.com>
Subject: Re: [PATCH 3/6] clk: meson: t7: add peripheral clock controller
Message-ID: <202306211239.HA6GmDhb-lkp@intel.com>
References: <20230615182938.18487-4-tanure@linux.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615182938.18487-4-tanure@linux.com>

Hi Lucas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on clk/clk-next tty/tty-testing tty/tty-next tty/tty-linus krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.4-rc7 next-20230620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lucas-Tanure/dt-bindings-arm-amlogic-add-Amlogic-T7-based-Khadas-VIM4-bindings/20230616-023038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20230615182938.18487-4-tanure%40linux.com
patch subject: [PATCH 3/6] clk: meson: t7: add peripheral clock controller
config: arm64-randconfig-r001-20230620 (https://download.01.org/0day-ci/archive/20230621/202306211239.HA6GmDhb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211239.HA6GmDhb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211239.HA6GmDhb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/clk/meson/t7.c:7084:23: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
                   [CLKID_VID_PLL]                 = &t7_vid_pll.hw,
                                                     ^~~~~~~~~~~~~~
   drivers/clk/meson/t7.c:7082:23: note: previous initialization is here
                   [CLKID_VID_PLL]                 = &t7_vid_pll_div.hw,
                                                     ^~~~~~~~~~~~~~~~~~
   drivers/clk/meson/t7.c:7946:29: warning: variable 'mclk_data' set but not used [-Wunused-but-set-variable]
           struct meson_clk_pll_data *mclk_data;
                                      ^
>> drivers/clk/meson/t7.c:93:29: warning: unused variable 'meson_pll_clk_no_ops' [-Wunused-const-variable]
   static const struct clk_ops meson_pll_clk_no_ops = {};
                               ^
>> drivers/clk/meson/t7.c:689:37: warning: unused variable 't7_a73_dyn_clk_sel' [-Wunused-const-variable]
   static const struct clk_parent_data t7_a73_dyn_clk_sel[] = {
                                       ^
   4 warnings generated.


vim +/meson_pll_clk_no_ops +93 drivers/clk/meson/t7.c

    92	
  > 93	static const struct clk_ops meson_pll_clk_no_ops = {};
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
