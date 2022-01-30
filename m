Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8618F2C80
	for <llvm@lists.linux.dev>; Sun, 30 Jan 2022 03:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643511799; x=1675047799;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0s3g1cA4SVG5sZhT+2hM97nRhlx2ZuJaHt9PcpKbU4Y=;
  b=GoVHKDj7+AVq420oqfZoLOUxaxQ2WWDLQm55ZnuUhG+h5usDd2WKS15h
   452VNJjSHS5BQ9RfuKcZY85l/n62Q0D7Goy7BkusSJxQCKc98516geiGE
   kmD0n9szk5NlBN4ug679QMpaNPaB5NkSvBXR5vy2UnEj7wjo/rAzlTYyQ
   S7ppZeKVHAsiTEtZWrrOlOb+y60olGE6UHiwAUQ+uI7sqZtbVZGfXBq4M
   xt6f50TkTIizaItQEusSVO2W+jTWdUECmk70TMQe/uf+XU2W/kyBSYsW3
   ogT9MVzpUDPI/4oO+pbD/+4dwV2mtYjJUo1bTUam0QeoIW+F29rzNaGky
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10242"; a="247263132"
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="247263132"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2022 19:03:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,327,1635231600"; 
   d="scan'208";a="522154802"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Jan 2022 19:03:17 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nE0Un-000Pzd-3R; Sun, 30 Jan 2022 03:03:17 +0000
Date: Sun, 30 Jan 2022 11:02:31 +0800
From: kernel test robot <lkp@intel.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC v6 net-next 6/9] mfd: ocelot: add support for external mfd
 control over SPI for the VSC7512
Message-ID: <202201301017.FqxdEjuR-lkp@intel.com>
References: <20220129220221.2823127-7-colin.foster@in-advantage.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129220221.2823127-7-colin.foster@in-advantage.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Colin,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Colin-Foster/add-support-for-VSC7512-control-over-SPI/20220130-060423
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git ff58831fa02deb42fd731f830d8d9ec545573c7c
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20220130/202201301017.FqxdEjuR-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 33b45ee44b1f32ffdbc995e6fec806271b4b3ba4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/17c4774323c71c0893e531a24ebf76192cc78fd0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Colin-Foster/add-support-for-VSC7512-control-over-SPI/20220130-060423
        git checkout 17c4774323c71c0893e531a24ebf76192cc78fd0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/firmware/xilinx/ drivers/gpu/drm/amd/display/amdgpu_dm/ drivers/mfd/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/mfd/ocelot-core.c:70:16: warning: no previous prototype for function 'ocelot_get_regmap_from_resource' [-Wmissing-prototypes]
   struct regmap *ocelot_get_regmap_from_resource(struct device *dev,
                  ^
   drivers/mfd/ocelot-core.c:70:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   struct regmap *ocelot_get_regmap_from_resource(struct device *dev,
   ^
   static 
   1 warning generated.


vim +/ocelot_get_regmap_from_resource +70 drivers/mfd/ocelot-core.c

    69	
  > 70	struct regmap *ocelot_get_regmap_from_resource(struct device *dev,
    71						       const struct resource *res)
    72	{
    73		struct ocelot_core *core = dev_get_drvdata(dev);
    74	
    75		return ocelot_devm_regmap_init(core, dev, res);
    76	}
    77	EXPORT_SYMBOL(ocelot_get_regmap_from_resource);
    78	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
