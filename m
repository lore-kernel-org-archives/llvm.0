Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D945020EA
	for <llvm@lists.linux.dev>; Fri, 13 May 2022 04:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652415581; x=1683951581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Q6AAwFpn7EgfENgSAv5kE08wZuOagWYX5yMoQwjjaUQ=;
  b=J0K6chWfBv/nvJ9eD3JAd7g0soKLbiIGRLqpGpqNnnHhocPYM9tCUlRH
   wrCpXrIDlI4I+xsZ1CacK9ZyGu5ZkqoCH6zbbZ/MuqT6F6AtIT0hs6QWq
   usBSj3qo8lBCm/vnATS5PD3+gQ+o8ngGUvY4PjGETbOngPUos0s/NQzsD
   uZGsydvnqvmE8c8aBJjcfmO6c1Y7f8ekgLK48ozJrzlmJJfE5ywE50IDd
   aCuQzhWA3I8TgFw+iJucCUS6rB5h0qGyA+1tXerj0c9UosnkRItw1JUST
   VTcxkBNeucv1pSXmLKx0QIp8HEDbTQoC0RG+HVmYSwfCVlX2NjjFfJqSr
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="356638290"
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="356638290"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 21:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,221,1647327600"; 
   d="scan'208";a="896081031"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 12 May 2022 21:19:39 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npMmB-000LIW-Bx;
	Fri, 13 May 2022 04:19:39 +0000
Date: Fri, 13 May 2022 12:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: Minchan Kim <minchan@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5] mm: fix is_pinnable_page against on cma page
Message-ID: <202205131200.LY0TVDcM-lkp@intel.com>
References: <20220512204143.3961150-1-minchan@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512204143.3961150-1-minchan@kernel.org>

Hi Minchan,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linux/master]
[also build test WARNING on linus/master v5.18-rc6]
[cannot apply to akpm-mm/mm-everything next-20220512]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Minchan-Kim/mm-fix-is_pinnable_page-against-on-cma-page/20220513-044258
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 0ac824f379fba2c2b17b75fd5ada69cd68c66348
config: hexagon-randconfig-r045-20220512 (https://download.01.org/0day-ci/archive/20220513/202205131200.LY0TVDcM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 9519dacab7b8afd537811fc2abaceb4d14f4e16a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cde6db32b52d5224e61443e12ccbc4c11fc583b0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Minchan-Kim/mm-fix-is_pinnable_page-against-on-cma-page/20220513-044258
        git checkout cde6db32b52d5224e61443e12ccbc4c11fc583b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iio/adc/ drivers/mmc/core/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/adc/fsl-imx25-gcq.c:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:20:
   include/linux/mm.h:1603:23: error: use of undeclared identifier '__mt'
           int mt = __READ_ONCE(__mt);
                                ^
   include/linux/mm.h:1603:23: error: use of undeclared identifier '__mt'
>> drivers/iio/adc/fsl-imx25-gcq.c:115:8: warning: shift count is negative [-Wshift-count-negative]
                        MX25_ADCQ_ITEM(0, chan->channel));
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:54:3: note: expanded from macro 'MX25_ADCQ_ITEM'
                   _MX25_ADCQ_ITEM((item) - 8, (x)) : _MX25_ADCQ_ITEM((item), (x)))
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mfd/imx25-tsadc.h:52:39: note: expanded from macro '_MX25_ADCQ_ITEM'
   #define _MX25_ADCQ_ITEM(item, x)        ((x) << ((item) * 4))
                                                ^  ~~~~~~~~~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/mmc/core/mmc.c:17:
   In file included from include/linux/mmc/host.h:18:
   In file included from include/linux/blk-crypto-profile.h:9:
   In file included from include/linux/bio.h:10:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:9:
   include/linux/mm.h:1603:23: error: use of undeclared identifier '__mt'
           int mt = __READ_ONCE(__mt);
                                ^
   include/linux/mm.h:1603:23: error: use of undeclared identifier '__mt'
>> drivers/mmc/core/mmc.c:108:22: warning: shift count >= width of type [-Wshift-count-overflow]
                   card->cid.serial        = UNSTUFF_BITS(resp, 16, 32);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/mmc.c:56:39: note: expanded from macro 'UNSTUFF_BITS'
                   const u32 __mask = (__size < 32 ? 1 << __size : 0) - 1; \
                                                       ^  ~~~~~~
   1 warning and 2 errors generated.
--
   In file included from drivers/mmc/core/sd.c:15:
   In file included from include/linux/scatterlist.h:8:
   include/linux/mm.h:1603:23: error: use of undeclared identifier '__mt'
           int mt = __READ_ONCE(__mt);
                                ^
   include/linux/mm.h:1603:23: error: use of undeclared identifier '__mt'
>> drivers/mmc/core/sd.c:99:22: warning: shift count >= width of type [-Wshift-count-overflow]
           card->cid.serial                = UNSTUFF_BITS(resp, 24, 32);
                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/core/sd.c:60:39: note: expanded from macro 'UNSTUFF_BITS'
                   const u32 __mask = (__size < 32 ? 1 << __size : 0) - 1; \
                                                       ^  ~~~~~~
   1 warning and 2 errors generated.


vim +115 drivers/iio/adc/fsl-imx25-gcq.c

6df2e98c3ea567 Markus Pargmann 2015-12-14  104  
6df2e98c3ea567 Markus Pargmann 2015-12-14  105  static int mx25_gcq_get_raw_value(struct device *dev,
6df2e98c3ea567 Markus Pargmann 2015-12-14  106  				  struct iio_chan_spec const *chan,
6df2e98c3ea567 Markus Pargmann 2015-12-14  107  				  struct mx25_gcq_priv *priv,
6df2e98c3ea567 Markus Pargmann 2015-12-14  108  				  int *val)
6df2e98c3ea567 Markus Pargmann 2015-12-14  109  {
6df2e98c3ea567 Markus Pargmann 2015-12-14  110  	long timeout;
6df2e98c3ea567 Markus Pargmann 2015-12-14  111  	u32 data;
6df2e98c3ea567 Markus Pargmann 2015-12-14  112  
6df2e98c3ea567 Markus Pargmann 2015-12-14  113  	/* Setup the configuration we want to use */
6df2e98c3ea567 Markus Pargmann 2015-12-14  114  	regmap_write(priv->regs, MX25_ADCQ_ITEM_7_0,
6df2e98c3ea567 Markus Pargmann 2015-12-14 @115  		     MX25_ADCQ_ITEM(0, chan->channel));
6df2e98c3ea567 Markus Pargmann 2015-12-14  116  
6df2e98c3ea567 Markus Pargmann 2015-12-14  117  	regmap_update_bits(priv->regs, MX25_ADCQ_MR, MX25_ADCQ_MR_EOQ_IRQ, 0);
6df2e98c3ea567 Markus Pargmann 2015-12-14  118  
6df2e98c3ea567 Markus Pargmann 2015-12-14  119  	/* Trigger queue for one run */
6df2e98c3ea567 Markus Pargmann 2015-12-14  120  	regmap_update_bits(priv->regs, MX25_ADCQ_CR, MX25_ADCQ_CR_FQS,
6df2e98c3ea567 Markus Pargmann 2015-12-14  121  			   MX25_ADCQ_CR_FQS);
6df2e98c3ea567 Markus Pargmann 2015-12-14  122  
6df2e98c3ea567 Markus Pargmann 2015-12-14  123  	timeout = wait_for_completion_interruptible_timeout(
6df2e98c3ea567 Markus Pargmann 2015-12-14  124  		&priv->completed, MX25_GCQ_TIMEOUT);
6df2e98c3ea567 Markus Pargmann 2015-12-14  125  	if (timeout < 0) {
6df2e98c3ea567 Markus Pargmann 2015-12-14  126  		dev_err(dev, "ADC wait for measurement failed\n");
6df2e98c3ea567 Markus Pargmann 2015-12-14  127  		return timeout;
6df2e98c3ea567 Markus Pargmann 2015-12-14  128  	} else if (timeout == 0) {
6df2e98c3ea567 Markus Pargmann 2015-12-14  129  		dev_err(dev, "ADC timed out\n");
6df2e98c3ea567 Markus Pargmann 2015-12-14  130  		return -ETIMEDOUT;
6df2e98c3ea567 Markus Pargmann 2015-12-14  131  	}
6df2e98c3ea567 Markus Pargmann 2015-12-14  132  
6df2e98c3ea567 Markus Pargmann 2015-12-14  133  	regmap_read(priv->regs, MX25_ADCQ_FIFO, &data);
6df2e98c3ea567 Markus Pargmann 2015-12-14  134  
6df2e98c3ea567 Markus Pargmann 2015-12-14  135  	*val = MX25_ADCQ_FIFO_DATA(data);
6df2e98c3ea567 Markus Pargmann 2015-12-14  136  
6df2e98c3ea567 Markus Pargmann 2015-12-14  137  	return IIO_VAL_INT;
6df2e98c3ea567 Markus Pargmann 2015-12-14  138  }
6df2e98c3ea567 Markus Pargmann 2015-12-14  139  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
