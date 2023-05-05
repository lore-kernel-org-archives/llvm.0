Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FE5BE73;
	Fri,  5 May 2023 17:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683308788; x=1714844788;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xd7vqGdR6LklftChv05IthW0oVChTlovGhrn7lqWEMc=;
  b=SEHY/fFjfPYL7pTYjfLd5o+kJgJPDWneTLfAW4+bmAwnAE/za7h+5tAm
   Uh4xHgaOWzbmSC7LuS1kQ+VmkW10ageojKM6WoPJUBWOzAV/N9Ge3UASt
   CeoHUFGlx/lIOvfKdYuhbzeG6qDfFANyAM2WDlxSE/wELWkbbHy1qZjd+
   BRV4owOcWIawBcHUB4vSZXghx4Cb3x24AtY9dd8Sgl1F1c0HU6fgROCfj
   izmfSw3Iw1GtxZQWm9Nsl87ceSIwTkcd/3myFu/ZiyHnvFdS/RVhI4OLh
   RskeOlc51kjouRxzJC68iYHtXUdEisazKYdB8nOLwRPnxQcBL3xouTj4j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="328887219"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="328887219"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 10:46:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="943986799"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="943986799"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 May 2023 10:46:25 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puzVg-0000nF-1K;
	Fri, 05 May 2023 17:46:24 +0000
Date: Sat, 6 May 2023 01:46:13 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v4 17/68] clk: lochnagar: Add a determine_rate hook
Message-ID: <202305060148.hPASUhEx-lkp@intel.com>
References: <20221018-clk-range-checks-fixes-v4-17-971d5077e7d2@cerno.tech>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v4-17-971d5077e7d2@cerno.tech>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on 145e5cddfe8b4bf607510b2dcf630d95f4db420f]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
base:   145e5cddfe8b4bf607510b2dcf630d95f4db420f
patch link:    https://lore.kernel.org/r/20221018-clk-range-checks-fixes-v4-17-971d5077e7d2%40cerno.tech
patch subject: [PATCH v4 17/68] clk: lochnagar: Add a determine_rate hook
config: i386-randconfig-a012-20230501 (https://download.01.org/0day-ci/archive/20230506/202305060148.hPASUhEx-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/273bc4689da3909aebca0a3479e18194a748ee92
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
        git checkout 273bc4689da3909aebca0a3479e18194a748ee92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060148.hPASUhEx-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk-lochnagar.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
