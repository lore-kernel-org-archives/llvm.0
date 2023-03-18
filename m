Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090307EE;
	Sat, 18 Mar 2023 05:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679118399; x=1710654399;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XwBj/9hfmpagIdGRdqZJjnfQeY4udKL5fw//ppbl99Q=;
  b=nVhOtB4h4Dsfr/PFYnyYmpFtMFXmXWd9yFkoTMn1h9Do+zPQzo9rQbGY
   NEuyFSh/emrH8zEYK1i3goSEvnHHaAMnsG8Kx8MHXu5KnOStMUsp9/lEq
   gqZkVE96U+pzRmBrUkHspnJm+NaAi6ylT2kx3ny1oNlVgRrfrzuxppEs4
   HGgZlVAYE+Fb6JdPvzgz771o39m3t6RGjdXRHXqOg83ol+AAUJk3BtQMh
   FzRYrMvMg9LqeKmiNzvscap0qhk6gUm5+b9t+ceT2Q9f/1JJA7ggX/chF
   HTJWK7BZsPxvB75d7kTiyanctU++uw5Fm/1uEoN9BbX2bDV6gjkq7y5Go
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="424685486"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="424685486"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 22:46:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="790989675"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="790989675"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 17 Mar 2023 22:46:35 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdPOk-0009pm-1D;
	Sat, 18 Mar 2023 05:46:34 +0000
Date: Sat, 18 Mar 2023 13:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>
Subject: Re: [PATCH v3 3/4] clk: loongson1: Re-implement the clock driver
Message-ID: <202303181358.BXLJVMkh-lkp@intel.com>
References: <20230316104707.236034-4-keguang.zhang@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230316104707.236034-4-keguang.zhang@gmail.com>

Hi Keguang,

I love your patch! Yet something to improve:

[auto build test ERROR on 6f173737e1b5670c200329677e821cce1d3d755e]

url:    https://github.com/intel-lab-lkp/linux/commits/Keguang-Zhang/dt-bindings-clock-Add-Loongson-1-clock/20230316-185026
base:   6f173737e1b5670c200329677e821cce1d3d755e
patch link:    https://lore.kernel.org/r/20230316104707.236034-4-keguang.zhang%40gmail.com
patch subject: [PATCH v3 3/4] clk: loongson1: Re-implement the clock driver
config: mips-loongson1c_defconfig (https://download.01.org/0day-ci/archive/20230318/202303181358.BXLJVMkh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/de00eab744ddc82edb1853048dd5d50aa8220115
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Keguang-Zhang/dt-bindings-clock-Add-Loongson-1-clock/20230316-185026
        git checkout de00eab744ddc82edb1853048dd5d50aa8220115
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181358.BXLJVMkh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/clk/clk-loongson1.c:300:15: error: expected parameter declarator
   MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
                 ^
>> drivers/clk/clk-loongson1.c:300:15: error: expected ')'
   drivers/clk/clk-loongson1.c:300:14: note: to match this '('
   MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
                ^
>> drivers/clk/clk-loongson1.c:300:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
   ^
   int
>> drivers/clk/clk-loongson1.c:300:14: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");
                ^
                                                          void
   drivers/clk/clk-loongson1.c:301:20: error: expected parameter declarator
   MODULE_DESCRIPTION("Loongson1 clock driver");
                      ^
   drivers/clk/clk-loongson1.c:301:20: error: expected ')'
   drivers/clk/clk-loongson1.c:301:19: note: to match this '('
   MODULE_DESCRIPTION("Loongson1 clock driver");
                     ^
   drivers/clk/clk-loongson1.c:301:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
   MODULE_DESCRIPTION("Loongson1 clock driver");
   ^
   int
   drivers/clk/clk-loongson1.c:301:19: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
   MODULE_DESCRIPTION("Loongson1 clock driver");
                     ^
                                              void
   8 errors generated.


vim +300 drivers/clk/clk-loongson1.c

   299	
 > 300	MODULE_AUTHOR("Keguang Zhang <keguang.zhang@gmail.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
