Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AF7C143;
	Fri,  5 May 2023 18:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683310049; x=1714846049;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eeAz6Zs809+557OTuwGM9Irg/VyDlw+tTP7I/kEtW2Y=;
  b=j5vpK8IkTQRYaUnjBwJsI+gnCXQwH82WZY6FGCpvayPswQVnaMQR0Alz
   QfCaM3ViBacCxeeghI0er6M23KL57tEo+X52VubU+6wgDZqVG5p1Ket+O
   O9wh5pByMnS+uDNXBQz2szg3rh0ryYgSliQjeCJYloTb8KfQF2NyGwBhk
   qAoG3OOs0wMOYL0sOC9Udlir0qiMVVT/rVUoThwN/W+0dCDKYFg91pDcu
   Irbboww+FViImifbid6syLskUjef3FFjtHAoZBkEF0xdqpZLSqYbDIfXK
   hcgFAMwqPt1yuLrTMt3fER/QQed3nfiXN0fxIz+pidcbm0knvKiU75tqz
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="338467067"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="338467067"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 11:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="762561960"
X-IronPort-AV: E=Sophos;i="5.99,252,1677571200"; 
   d="scan'208";a="762561960"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 05 May 2023 11:07:25 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1puzq0-0000o9-31;
	Fri, 05 May 2023 18:07:24 +0000
Date: Sat, 6 May 2023 02:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <maxime@cerno.tech>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
	patches@opensource.cirrus.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v4 23/68] clk: wm831x: clkout: Add a determine_rate hook
Message-ID: <202305060140.iMPUOCu9-lkp@intel.com>
References: <20221018-clk-range-checks-fixes-v4-23-971d5077e7d2@cerno.tech>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221018-clk-range-checks-fixes-v4-23-971d5077e7d2@cerno.tech>

Hi Maxime,

kernel test robot noticed the following build errors:

[auto build test ERROR on 145e5cddfe8b4bf607510b2dcf630d95f4db420f]

url:    https://github.com/intel-lab-lkp/linux/commits/Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
base:   145e5cddfe8b4bf607510b2dcf630d95f4db420f
patch link:    https://lore.kernel.org/r/20221018-clk-range-checks-fixes-v4-23-971d5077e7d2%40cerno.tech
patch subject: [PATCH v4 23/68] clk: wm831x: clkout: Add a determine_rate hook
config: i386-randconfig-a011-20230501 (https://download.01.org/0day-ci/archive/20230506/202305060140.iMPUOCu9-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/3c4b2e3898c59b2dd85f6166f01357923713f8fe
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Maxime-Ripard/clk-Export-clk_hw_forward_rate_request/20230505-193724
        git checkout 3c4b2e3898c59b2dd85f6166f01357923713f8fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060140.iMPUOCu9-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "clk_hw_determine_rate_no_reparent" [drivers/clk/clk-wm831x.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
