Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77211EA2
	for <llvm@lists.linux.dev>; Tue, 19 Apr 2022 04:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650342808; x=1681878808;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3WQ96fk4qp35tKfaZUm43O+5DsFp25/ZxLI7z4orMHY=;
  b=jBWAecruNT5I13VOCTlvWK4PRccRVFbbmk4f8jwR0/v5OJyMgW9QmB7I
   J+404MoaZJT3H8PibluAXdb46NpjHpje2M3GcX6kifiGm1M/BTDRVj1JI
   RJ/NnWIrlUGA3s2iiXCxFleX4KSrjLMXLZoY72jUEDL+1pxiZNQc7fV3L
   IY9tSMdslUuPBBrTNhbwHxpL7qkQ/Xw+sE+4n3E7oR6K4VFziW2E0Tk2C
   AZ7wOFsji7LahSFltP2wL4Nq5wIVEHCuEyiAWeC2lxiwLswasBJuW3peW
   EUcR1uWpyUaD+eTCMXg7hlASOHggygcFelVE6DvIQ35AwvD9Z/ydqpVUH
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10321"; a="263133841"
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="263133841"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2022 21:33:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,271,1643702400"; 
   d="scan'208";a="665771761"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Apr 2022 21:33:24 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ngfYK-0005Lq-3B;
	Tue, 19 Apr 2022 04:33:24 +0000
Date: Tue, 19 Apr 2022 12:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 1770/2356]
 drivers/iio/dac/ltc2688.c:711:47: warning: incompatible integer to pointer
 conversion passing 'int' to parameter of type 'struct device_node *'
Message-ID: <202204191213.e2qAQvKm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   af93551cf39027d176f30b9beafc60a4c130998a
commit: 323ab388e14d9548f526543e901e7feb2459c442 [1770/2356] headers/deps: ACPI: Optimize <linux/acpi.h> dependencies, remove <linux/irqdomain.h> inclusion
config: x86_64-randconfig-a012-20220418 (https://download.01.org/0day-ci/archive/20220419/202204191213.e2qAQvKm-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=323ab388e14d9548f526543e901e7feb2459c442
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 323ab388e14d9548f526543e901e7feb2459c442
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/ drivers/block/aoe/ drivers/bus/mhi/host/ drivers/gpu/drm/i915/ drivers/gpu/drm/tiny/ drivers/hwmon/ drivers/iio/dac/ drivers/misc/ drivers/platform/x86/ drivers/power/supply/ drivers/spi/ drivers/thermal/intel/ lib/crypto/ net/mctp/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/iio/dac/ltc2688.c:711:47: error: implicit declaration of function 'to_of_node' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
           clk = devm_get_clk_from_child(&st->spi->dev, to_of_node(node), NULL);
                                                        ^
   drivers/iio/dac/ltc2688.c:711:47: note: did you mean 'dev_of_node'?
   include/linux/device_api.h:423:35: note: 'dev_of_node' declared here
   static inline struct device_node *dev_of_node(struct device *dev)
                                     ^
>> drivers/iio/dac/ltc2688.c:711:47: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct device_node *' [-Wint-conversion]
           clk = devm_get_clk_from_child(&st->spi->dev, to_of_node(node), NULL);
                                                        ^~~~~~~~~~~~~~~~
   include/linux/clk.h:489:29: note: passing argument to parameter 'np' here
                                       struct device_node *np, const char *con_id);
                                                           ^
   1 warning and 1 error generated.


vim +711 drivers/iio/dac/ltc2688.c

832cb9eeb9312d Nuno Sá 2022-02-25  702  
832cb9eeb9312d Nuno Sá 2022-02-25  703  static int ltc2688_tgp_clk_setup(struct ltc2688_state *st,
832cb9eeb9312d Nuno Sá 2022-02-25  704  				 struct ltc2688_chan *chan,
832cb9eeb9312d Nuno Sá 2022-02-25  705  				 struct fwnode_handle *node, int tgp)
832cb9eeb9312d Nuno Sá 2022-02-25  706  {
832cb9eeb9312d Nuno Sá 2022-02-25  707  	unsigned long rate;
832cb9eeb9312d Nuno Sá 2022-02-25  708  	struct clk *clk;
832cb9eeb9312d Nuno Sá 2022-02-25  709  	int ret, f;
832cb9eeb9312d Nuno Sá 2022-02-25  710  
832cb9eeb9312d Nuno Sá 2022-02-25 @711  	clk = devm_get_clk_from_child(&st->spi->dev, to_of_node(node), NULL);
832cb9eeb9312d Nuno Sá 2022-02-25  712  	if (IS_ERR(clk))
832cb9eeb9312d Nuno Sá 2022-02-25  713  		return dev_err_probe(&st->spi->dev, PTR_ERR(clk),
832cb9eeb9312d Nuno Sá 2022-02-25  714  				     "failed to get tgp clk.\n");
832cb9eeb9312d Nuno Sá 2022-02-25  715  
832cb9eeb9312d Nuno Sá 2022-02-25  716  	ret = clk_prepare_enable(clk);
832cb9eeb9312d Nuno Sá 2022-02-25  717  	if (ret)
832cb9eeb9312d Nuno Sá 2022-02-25  718  		return dev_err_probe(&st->spi->dev, ret,
832cb9eeb9312d Nuno Sá 2022-02-25  719  				     "failed to enable tgp clk.\n");
832cb9eeb9312d Nuno Sá 2022-02-25  720  
832cb9eeb9312d Nuno Sá 2022-02-25  721  	ret = devm_add_action_or_reset(&st->spi->dev, ltc2688_clk_disable, clk);
832cb9eeb9312d Nuno Sá 2022-02-25  722  	if (ret)
832cb9eeb9312d Nuno Sá 2022-02-25  723  		return ret;
832cb9eeb9312d Nuno Sá 2022-02-25  724  
832cb9eeb9312d Nuno Sá 2022-02-25  725  	if (chan->toggle_chan)
832cb9eeb9312d Nuno Sá 2022-02-25  726  		return 0;
832cb9eeb9312d Nuno Sá 2022-02-25  727  
832cb9eeb9312d Nuno Sá 2022-02-25  728  	/* calculate available dither frequencies */
832cb9eeb9312d Nuno Sá 2022-02-25  729  	rate = clk_get_rate(clk);
832cb9eeb9312d Nuno Sá 2022-02-25  730  	for (f = 0; f < ARRAY_SIZE(chan->dither_frequency); f++)
832cb9eeb9312d Nuno Sá 2022-02-25  731  		chan->dither_frequency[f] = DIV_ROUND_CLOSEST(rate, ltc2688_period[f]);
832cb9eeb9312d Nuno Sá 2022-02-25  732  
832cb9eeb9312d Nuno Sá 2022-02-25  733  	return 0;
832cb9eeb9312d Nuno Sá 2022-02-25  734  }
832cb9eeb9312d Nuno Sá 2022-02-25  735  

:::::: The code at line 711 was first introduced by commit
:::::: 832cb9eeb9312dd2e14133681d3920b773ef1eac iio: dac: add support for ltc2688

:::::: TO: Nuno Sá <nuno.sa@analog.com>
:::::: CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
