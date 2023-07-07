Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EFE33D0;
	Fri,  7 Jul 2023 13:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688736903; x=1720272903;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zJMl5SY47pBGwDkNPoefM/yltDD51XulbBFX8TC/LJw=;
  b=cKV0b8mvz/6XF9yPvh1+WkeYIdWjM5SCdjiK6KL9rLB+FhgY4mKNLulF
   6q7tx7TEeQJv1K4fhASR7BRBL/+smNl5JBKUqwe9XbVpqH1olQGNssEhU
   3T6AXLMx6p34JSqhsmNd7hY5YydOA05vu7XPEAu9sYFGl4vooiPLtD6Hc
   EGN52aGXr6DIY1Lor3kcCCAlq6X2SLnSbLP99kDHEquvUsXTsLdBUUCLS
   oCuSkluY94+LKf/1B4ewoLFsBT2VaS9HoSt62/6kRsJqhFoT6VdTJ6Bmx
   I5awONVNUGGmR68Rz2BCSRXTtRdAfjnLCdh6W3TrpxY7S7p02Z0JdIaFc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="366471757"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="366471757"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 06:33:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="966656794"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="966656794"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jul 2023 06:33:00 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHlZz-000212-2G;
	Fri, 07 Jul 2023 13:32:59 +0000
Date: Fri, 7 Jul 2023 21:32:28 +0800
From: kernel test robot <lkp@intel.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org,
	peng.fan@nxp.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
	shengjiu.wang@gmail.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] clk: imx: imx8: add audio clock mux driver
Message-ID: <202307072131.S4pYlrxM-lkp@intel.com>
References: <1688449175-1677-4-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1688449175-1677-4-git-send-email-shengjiu.wang@nxp.com>

Hi Shengjiu,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelvesa/clk/imx]
[also build test ERROR on linus/master v6.4 next-20230707]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shengjiu-Wang/dt-bindings-clock-imx8-acm-Add-audio-clock-mux-support/20230704-141425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git clk/imx
patch link:    https://lore.kernel.org/r/1688449175-1677-4-git-send-email-shengjiu.wang%40nxp.com
patch subject: [PATCH 3/3] clk: imx: imx8: add audio clock mux driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20230707/202307072131.S4pYlrxM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307072131.S4pYlrxM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307072131.S4pYlrxM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: init_module
   >>> defined at clk-imx8qxp.c
   >>>            drivers/clk/imx/clk-imx8qxp.o:(init_module)
   >>> defined at clk-imx8-acm.c
   >>>            drivers/clk/imx/clk-imx8-acm.o:(.init.text+0x4)
--
>> ld.lld: error: duplicate symbol: cleanup_module
   >>> defined at clk-imx8qxp.c
   >>>            drivers/clk/imx/clk-imx8qxp.o:(cleanup_module)
   >>> defined at clk-imx8-acm.c
   >>>            drivers/clk/imx/clk-imx8-acm.o:(.exit.text+0x4)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
