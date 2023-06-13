Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315E73732F;
	Tue, 13 Jun 2023 19:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686683482; x=1718219482;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=n85A7XX5nbTTFgI8vxPPQTfwXp2EqTftD8XoZuF/4ak=;
  b=U0VEGzPUSlTPQeWcnCJOLOxAjdQPX+57vRQXchr4lnBw/RgjNlinacyU
   lZlAV05Ip6hi83bS0xGO33/bQcIKb6MIKSOzp36V2Z55OXMWDzPC7WL6N
   9/EVVYTLioRTPgYw+UNMHe13IoVa5IeK2lSP6gIYGV9R89rAlonhTaI0U
   bXiwvgF2UXMttQMfiEpgiuMABbL5/Zq3XyoEzE0pKzWB/3HGh1T6wohwx
   V6rV/sMIE7BOjYpeo+SXq1mwcUcQEc5CuEuxAyvTWlcVVJ7q2Nlm+YpqZ
   634fIaUMa3GBel4ZlIi4RAU2pJN1xDaF+3F/nplR7dpy2Aap47jaK9tCh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="422027725"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="422027725"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 12:11:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="856232720"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="856232720"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 13 Jun 2023 12:11:17 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q99QD-0001gs-0V;
	Tue, 13 Jun 2023 19:11:17 +0000
Date: Wed, 14 Jun 2023 03:10:43 +0800
From: kernel test robot <lkp@intel.com>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 8/8] rtc: isl12022: implement support for the
 #clock-cells DT property
Message-ID: <202306140237.9IMWa7cz-lkp@intel.com>
References: <20230613130011.305589-9-linux@rasmusvillemoes.dk>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613130011.305589-9-linux@rasmusvillemoes.dk>

Hi Rasmus,

kernel test robot noticed the following build errors:

[auto build test ERROR on abelloni/rtc-next]
[also build test ERROR on robh/for-next linus/master v6.4-rc6 next-20230613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rasmus-Villemoes/rtc-isl12022-remove-wrong-warning-for-low-battery-level/20230613-210308
base:   https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git rtc-next
patch link:    https://lore.kernel.org/r/20230613130011.305589-9-linux%40rasmusvillemoes.dk
patch subject: [PATCH v2 8/8] rtc: isl12022: implement support for the #clock-cells DT property
config: hexagon-randconfig-r041-20230612 (https://download.01.org/0day-ci/archive/20230614/202306140237.9IMWa7cz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add abelloni https://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
        git fetch abelloni rtc-next
        git checkout abelloni/rtc-next
        b4 shazam https://lore.kernel.org/r/20230613130011.305589-9-linux@rasmusvillemoes.dk
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140237.9IMWa7cz-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __clk_hw_register_fixed_rate
   >>> referenced by rtc-isl12022.c:272 (drivers/rtc/rtc-isl12022.c:272)
   >>>               drivers/rtc/rtc-isl12022.o:(isl12022_probe) in archive vmlinux.a
   >>> referenced by rtc-isl12022.c:272 (drivers/rtc/rtc-isl12022.c:272)
   >>>               drivers/rtc/rtc-isl12022.o:(isl12022_probe) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
