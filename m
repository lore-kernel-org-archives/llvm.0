Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D887B
	for <llvm@lists.linux.dev>; Tue, 22 Feb 2022 01:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645494972; x=1677030972;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yIlI+25tyG/Vgfdvj/+Z7mkc94N2K7PKODOan4K5Vwg=;
  b=Utm+y2KcrCzojrNmSNCI0M+A93fSrDaV5E9skRYKvwt98CFvlLU0hC1y
   D97UEuOwXvE+RcLrniV5jIuHe1gM/tFre1yrW6mdPdNp3kJx5sYKcFOKB
   ACBLp3CuZY0/6r5VUvFGb+Dr50QPisVEQ9CdNLePM+y1dSfy4Bx5YNGZJ
   X3Vaj3mHmqaxE0obp2geCYJCR3f5b/1wgTMwBTidJvKzu66T7UqOLrRmO
   ixRH4WvX6RYgD8h4qNeq0EwmF48OQIEnSTGFopAEYLSndv8gP4qPLYlcl
   CLQ/NFLPCaAYPjxD1q9b3G0u8wwi9Uyqf9x4JKTsxDUBZgZI4qmhwjtWg
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="312338991"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="312338991"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 17:55:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; 
   d="scan'208";a="490605584"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 21 Feb 2022 17:55:48 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMKP5-0002DE-Vn; Tue, 22 Feb 2022 01:55:47 +0000
Date: Tue, 22 Feb 2022 09:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v1 1/8] iio: accel: adxl345: Convert to use
 dev_err_probe()
Message-ID: <202202220906.kb1l5tzA-lkp@intel.com>
References: <20220221233235.86893-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221233235.86893-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on v5.17-rc5 next-20220217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/iio-accel-adxl345-Convert-to-use-dev_err_probe/20220222-073422
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: i386-randconfig-a014-20220221 (https://download.01.org/0day-ci/archive/20220222/202202220906.kb1l5tzA-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/078715303e0289150d8a286c885fd2b493e36a22
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/iio-accel-adxl345-Convert-to-use-dev_err_probe/20220222-073422
        git checkout 078715303e0289150d8a286c885fd2b493e36a22
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/iio/accel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/iio/accel/adxl345_i2c.c:32:25: error: use of undeclared identifier 'spi'
                   return dev_err_probe(&spi->dev, PTR_ERR(regmap), "Error initializing regmap\n");
                                         ^
   1 error generated.


vim +/spi +32 drivers/iio/accel/adxl345_i2c.c

    21	
    22	static int adxl345_i2c_probe(struct i2c_client *client,
    23				     const struct i2c_device_id *id)
    24	{
    25		struct regmap *regmap;
    26	
    27		if (!id)
    28			return -ENODEV;
    29	
    30		regmap = devm_regmap_init_i2c(client, &adxl345_i2c_regmap_config);
    31		if (IS_ERR(regmap))
  > 32			return dev_err_probe(&spi->dev, PTR_ERR(regmap), "Error initializing regmap\n");
    33	
    34		return adxl345_core_probe(&client->dev, regmap, id->driver_data,
    35					  id->name);
    36	}
    37	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
