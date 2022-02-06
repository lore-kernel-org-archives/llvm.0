Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591602F28
	for <llvm@lists.linux.dev>; Sun,  6 Feb 2022 22:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644187911; x=1675723911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BrKj9CoaljraG4j1hO16wX7QL1RU5vkQdhGVuGLS20c=;
  b=iPaphqEaBT+q124ShKwwXtKqz2+q2tDHdCnk4DAo8HmUsOQ9XaCEhbNE
   2WDgG5613cu3bhXVEeA8rnxRg61QASBv64+ab8yGqrCpmEhLnwDDTd/02
   4MwsVVKMRIGk51jfyXp0HgrHXDKADSEWOYqSZAQf0DJDzSOBhaszE6j+U
   2a2iTmE5+ZB4OZl9xa7iyy8hDOdUdaBZKct8ozKPyl8SzgENRNiNT4F3e
   4sHKq6A1GEG4JL5MqALmarbdql5W3hvECBfIupU8tzuOYDRxUhMh4YtnJ
   4B5+adYMRBayx4LleRzX0KGnYU9uk45r9KQo2rhU6in+MIA8aOHIeGTge
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309356063"
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; 
   d="scan'208";a="309356063"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2022 14:51:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,348,1635231600"; 
   d="scan'208";a="632265515"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 06 Feb 2022 14:51:47 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nGqNn-000aon-5o; Sun, 06 Feb 2022 22:51:47 +0000
Date: Mon, 7 Feb 2022 06:51:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Aswani Reddy <aswani.reddy@samsung.com>,
	Niyas Ahmed S T <niyas.ahmed@samsung.com>,
	Chandrasekar R <rcsekar@samsung.com>,
	Jayati Sahu <jayati.sahu@samsung.com>,
	Sriranjani P <sriranjani.p@samsung.com>,
	Ajay Kumar <ajaykumar.rs@samsung.com>,
	Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [linux-next:master 1773/4147] ld.lld: error: undefined symbol:
 exynos_arm64_register_cmu
Message-ID: <202202070602.Ff39h8TP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef6b35306dd8f15a7e5e5a2532e665917a43c5d9
commit: e3f3dc3810d3765128d28b241f4afb761d81678a [1773/4147] clk: samsung: fsd: Add cmu_peric block clock information
config: hexagon-randconfig-r045-20220207 (https://download.01.org/0day-ci/archive/20220207/202202070602.Ff39h8TP-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6daaf5a44925592c764c59219b0024ee06317028)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=e3f3dc3810d3765128d28b241f4afb761d81678a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout e3f3dc3810d3765128d28b241f4afb761d81678a
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the linux-next/master HEAD ef6b35306dd8f15a7e5e5a2532e665917a43c5d9 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: exynos_arm64_register_cmu
   >>> referenced by clk-fsd.c
   >>>               clk/samsung/clk-fsd.o:(fsd_cmu_probe) in archive drivers/built-in.a
   >>> referenced by clk-fsd.c
   >>>               clk/samsung/clk-fsd.o:(fsd_cmu_probe) in archive drivers/built-in.a

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
