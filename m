Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87612161
	for <llvm@lists.linux.dev>; Tue,  1 Mar 2022 17:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646154537; x=1677690537;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Tc3cXXEtQp7gVlb896tXkUWNIZ02jrKxUf+nwVkkawU=;
  b=OvCks0StXc0znlXikAZLMYN7tFRapXBOCFsldpUiL+K+RJucPAG/S7D/
   cu0R+ZBg/dbnlFB5N7K5YN9w4V7p6ehydCaTwWo1QXzzwbmvii7r5HqMI
   wF7SthXDaB6HUBIhfxPmwye8m0uueNx2Bu+4TyqDdZZ1RFu2v8HOcU+Xi
   8q6kyA/fpFHfx8bfstherMSZLqoMNnIcdIeFR9hRFxLNWkceTBFuVYz8D
   UVixZ1ua7WA19yq+LuDvDrFOmyOlqk9uLCwaCgwiOqlLJiJojlaDIddHR
   oM5zDKpWMFdLrpSIJrJuKlecnC65Twhqy/X+QkMu9MFYBwv2LixGZ+hRo
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10273"; a="236694221"
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="236694221"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2022 09:08:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,146,1643702400"; 
   d="scan'208";a="510589128"
Received: from lkp-server01.sh.intel.com (HELO 2146afe809fb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 01 Mar 2022 09:08:45 -0800
Received: from kbuild by 2146afe809fb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nP5zR-0000n6-72; Tue, 01 Mar 2022 17:08:45 +0000
Date: Wed, 2 Mar 2022 01:08:28 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH] net: dm9051: Make remove() callback a void function
Message-ID: <202203020142.s9p6tR7O-lkp@intel.com>
References: <20220228173957.1262628-2-broonie@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220228173957.1262628-2-broonie@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Mark,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net-next/master]
[cannot apply to net/master horms-ipvs/master linus/master v5.17-rc6 next-20220301]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Mark-Brown/net-dm9051-Make-remove-callback-a-void-function/20220301-020029
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git b42a738e409b62f38a15ce7530e8290b00f823a4
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20220302/202203020142.s9p6tR7O-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/4f1ed1b207b356e0ab8359938d59742f8bf418a9
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Mark-Brown/net-dm9051-Make-remove-callback-a-void-function/20220301-020029
        git checkout 4f1ed1b207b356e0ab8359938d59742f8bf418a9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/net/ethernet/davicom/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/davicom/dm9051.c:1253:12: error: incompatible function pointer types initializing 'int (*)(struct spi_device *)' with an expression of type 'void (struct spi_device *)' [-Werror,-Wincompatible-function-pointer-types]
           .remove = dm9051_drv_remove,
                     ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +1253 drivers/net/ethernet/davicom/dm9051.c

2dc95a4d30edda Joseph CHAMG 2022-02-11  1246  
2dc95a4d30edda Joseph CHAMG 2022-02-11  1247  static struct spi_driver dm9051_driver = {
2dc95a4d30edda Joseph CHAMG 2022-02-11  1248  	.driver = {
2dc95a4d30edda Joseph CHAMG 2022-02-11  1249  		.name = DRVNAME_9051,
2dc95a4d30edda Joseph CHAMG 2022-02-11  1250  		.of_match_table = dm9051_match_table,
2dc95a4d30edda Joseph CHAMG 2022-02-11  1251  	},
2dc95a4d30edda Joseph CHAMG 2022-02-11  1252  	.probe = dm9051_probe,
2dc95a4d30edda Joseph CHAMG 2022-02-11 @1253  	.remove = dm9051_drv_remove,
2dc95a4d30edda Joseph CHAMG 2022-02-11  1254  	.id_table = dm9051_id_table,
2dc95a4d30edda Joseph CHAMG 2022-02-11  1255  };
2dc95a4d30edda Joseph CHAMG 2022-02-11  1256  module_spi_driver(dm9051_driver);
2dc95a4d30edda Joseph CHAMG 2022-02-11  1257  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
