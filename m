Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC4F2F21
	for <llvm@lists.linux.dev>; Thu,  3 Feb 2022 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643904621; x=1675440621;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Kbd59A/a9kfCZjJuLwDQvMRswMrJrKguvQQqF+qs2KM=;
  b=lP0/c6EnlnwW93BuRC/14vep4jW/yb5zsHJZC8MkTyGFhGflnnjO0O46
   4B+lc2l5QxEt1m/eXAWQrPH5yMXZvoOREC8ppJvOsHkzBGKupB4XmToBM
   lyy4AG7n/nT9j2NRkIHHS/7h9Ueh/hgfICBXaI9nKW/VQRaDHvPT1am7/
   uRriZMX2IEqNia4nhK3MBZ5HK79eENXZ6ow0XmR7QVBBMci4fKJPUVcky
   7OEdisfz1Y7giwOOKZu7dg0eUzXpMlspN4JfXiyFydeHlNqRbuAwNuk2x
   3o5bEQBZ6iLjcz8Fm8JtQm2tHi3XMJpx7UxAKH8L5WpVM1A16WjVI311y
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="231745967"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="231745967"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 08:10:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="498179717"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Feb 2022 08:10:19 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFegd-000WJq-AE; Thu, 03 Feb 2022 16:10:19 +0000
Date: Fri, 4 Feb 2022 00:09:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v1 1/1] iio: chemical: atlas-ezo-sensor: Make use of
 device properties
Message-ID: <202202040047.MYaXoBXz-lkp@intel.com>
References: <20220203122543.75814-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203122543.75814-1-andriy.shevchenko@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Andy,

I love your patch! Yet something to improve:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on v5.17-rc2 next-20220203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Andy-Shevchenko/iio-chemical-atlas-ezo-sensor-Make-use-of-device-properties/20220203-202716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
config: hexagon-randconfig-r041-20220203 (https://download.01.org/0day-ci/archive/20220204/202202040047.MYaXoBXz-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/262e5b667d25332f90b88e6869ba161b11e8f88e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Andy-Shevchenko/iio-chemical-atlas-ezo-sensor-Make-use-of-device-properties/20220203-202716
        git checkout 262e5b667d25332f90b88e6869ba161b11e8f88e
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/iio/chemical/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

>> drivers/iio/chemical/atlas-ezo-sensor.c:183:21: warning: incompatible pointer to integer conversion initializing 'kernel_ulong_t' (aka 'unsigned long') with an expression of type 'struct atlas_ezo_device *' [-Wint-conversion]
           { "atlas-co2-ezo", &atlas_ezo_devices[0] },
                              ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/atlas-ezo-sensor.c:184:20: warning: incompatible pointer to integer conversion initializing 'kernel_ulong_t' (aka 'unsigned long') with an expression of type 'struct atlas_ezo_device *' [-Wint-conversion]
           { "atlas-o2-ezo", &atlas_ezo_devices[1] },
                             ^~~~~~~~~~~~~~~~~~~~~
   drivers/iio/chemical/atlas-ezo-sensor.c:185:21: warning: incompatible pointer to integer conversion initializing 'kernel_ulong_t' (aka 'unsigned long') with an expression of type 'struct atlas_ezo_device *' [-Wint-conversion]
           { "atlas-hum-ezo", &atlas_ezo_devices[2] },
                              ^~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/chemical/atlas-ezo-sensor.c:221:13: error: assigning to 'struct atlas_ezo_device *' from 'const struct atlas_ezo_device *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           data->chip = chip;
                      ^ ~~~~
   3 warnings and 1 error generated.


vim +221 drivers/iio/chemical/atlas-ezo-sensor.c

8712b3098b3d03 Matt Ranostay   2020-05-11  181  
8712b3098b3d03 Matt Ranostay   2020-05-11  182  static const struct i2c_device_id atlas_ezo_id[] = {
262e5b667d2533 Andy Shevchenko 2022-02-03 @183  	{ "atlas-co2-ezo", &atlas_ezo_devices[0] },
262e5b667d2533 Andy Shevchenko 2022-02-03  184  	{ "atlas-o2-ezo", &atlas_ezo_devices[1] },
262e5b667d2533 Andy Shevchenko 2022-02-03  185  	{ "atlas-hum-ezo", &atlas_ezo_devices[2] },
8712b3098b3d03 Matt Ranostay   2020-05-11  186  	{}
8712b3098b3d03 Matt Ranostay   2020-05-11  187  };
8712b3098b3d03 Matt Ranostay   2020-05-11  188  MODULE_DEVICE_TABLE(i2c, atlas_ezo_id);
8712b3098b3d03 Matt Ranostay   2020-05-11  189  
8712b3098b3d03 Matt Ranostay   2020-05-11  190  static const struct of_device_id atlas_ezo_dt_ids[] = {
262e5b667d2533 Andy Shevchenko 2022-02-03  191  	{ .compatible = "atlas,co2-ezo", .data = &atlas_ezo_devices[0], },
262e5b667d2533 Andy Shevchenko 2022-02-03  192  	{ .compatible = "atlas,o2-ezo", .data = &atlas_ezo_devices[1], },
262e5b667d2533 Andy Shevchenko 2022-02-03  193  	{ .compatible = "atlas,hum-ezo", .data = &atlas_ezo_devices[2], },
8712b3098b3d03 Matt Ranostay   2020-05-11  194  	{}
8712b3098b3d03 Matt Ranostay   2020-05-11  195  };
8712b3098b3d03 Matt Ranostay   2020-05-11  196  MODULE_DEVICE_TABLE(of, atlas_ezo_dt_ids);
8712b3098b3d03 Matt Ranostay   2020-05-11  197  
8712b3098b3d03 Matt Ranostay   2020-05-11  198  static int atlas_ezo_probe(struct i2c_client *client,
8712b3098b3d03 Matt Ranostay   2020-05-11  199  		       const struct i2c_device_id *id)
8712b3098b3d03 Matt Ranostay   2020-05-11  200  {
262e5b667d2533 Andy Shevchenko 2022-02-03  201  	const struct atlas_ezo_device *chip;
8712b3098b3d03 Matt Ranostay   2020-05-11  202  	struct atlas_ezo_data *data;
8712b3098b3d03 Matt Ranostay   2020-05-11  203  	struct iio_dev *indio_dev;
8712b3098b3d03 Matt Ranostay   2020-05-11  204  
8712b3098b3d03 Matt Ranostay   2020-05-11  205  	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
8712b3098b3d03 Matt Ranostay   2020-05-11  206  	if (!indio_dev)
8712b3098b3d03 Matt Ranostay   2020-05-11  207  		return -ENOMEM;
8712b3098b3d03 Matt Ranostay   2020-05-11  208  
262e5b667d2533 Andy Shevchenko 2022-02-03  209  	chip = device_get_match_data(&client->dev);
262e5b667d2533 Andy Shevchenko 2022-02-03  210  	if (!chip)
262e5b667d2533 Andy Shevchenko 2022-02-03  211  		chip = (const struct atlas_ezo_device *)id->driver_data;
8712b3098b3d03 Matt Ranostay   2020-05-11  212  
8712b3098b3d03 Matt Ranostay   2020-05-11  213  	indio_dev->info = &atlas_info;
8712b3098b3d03 Matt Ranostay   2020-05-11  214  	indio_dev->name = ATLAS_EZO_DRV_NAME;
8712b3098b3d03 Matt Ranostay   2020-05-11  215  	indio_dev->channels = chip->channels;
8712b3098b3d03 Matt Ranostay   2020-05-11  216  	indio_dev->num_channels = chip->num_channels;
8712b3098b3d03 Matt Ranostay   2020-05-11  217  	indio_dev->modes = INDIO_DIRECT_MODE;
8712b3098b3d03 Matt Ranostay   2020-05-11  218  
8712b3098b3d03 Matt Ranostay   2020-05-11  219  	data = iio_priv(indio_dev);
8712b3098b3d03 Matt Ranostay   2020-05-11  220  	data->client = client;
8712b3098b3d03 Matt Ranostay   2020-05-11 @221  	data->chip = chip;
8712b3098b3d03 Matt Ranostay   2020-05-11  222  	mutex_init(&data->lock);
8712b3098b3d03 Matt Ranostay   2020-05-11  223  
8712b3098b3d03 Matt Ranostay   2020-05-11  224  	return devm_iio_device_register(&client->dev, indio_dev);
8712b3098b3d03 Matt Ranostay   2020-05-11  225  };
8712b3098b3d03 Matt Ranostay   2020-05-11  226  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
