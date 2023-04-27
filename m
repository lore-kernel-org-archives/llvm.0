Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9435B8827;
	Thu, 27 Apr 2023 20:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682628576; x=1714164576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SbiNhqeK/sFFjne8751fHlbtlKa1ST6clbpXqG1XT/E=;
  b=OyEIfSYZXRw0FewhDVzFgv9o0zydiB0gyi6msdJcftRwU07GDDBnAdjj
   kVJ8ftctxoN2Pe7TIN+2X0hu5se+kt9x5Pp7oLYq8iGdIef3jTJxewoba
   Oo1P9FgKk4cM/S9ce5MOM+/4wsYmN1kv9Cdxu1r/BS8IR6LCD6L4RXdVL
   0PUYImNiB8QGBAsxgEJKI477FdrkAxpVdj+rcWoVoINfd52mzJDIlkLdv
   aOx31eXBzX2yU0GBYc2aI6xYWdyuNWTeioO5bjrbyZrY/0k8lat967hlr
   p9HCt87AkjUXeQUsQlD2ZH6qEYeHZ6AAQTNV9EM2F5HmO7Q9ZN7sH1zNY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="347586842"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="347586842"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 13:49:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="763982222"
X-IronPort-AV: E=Sophos;i="5.99,232,1677571200"; 
   d="scan'208";a="763982222"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2023 13:49:26 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ps8YP-00006v-1v;
	Thu, 27 Apr 2023 20:49:25 +0000
Date: Fri, 28 Apr 2023 04:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [robh:dt/header-cleanups 55/57] drivers/mfd/wm831x-i2c.c:32:56:
 error: use of undeclared identifier 'spi'
Message-ID: <202304280427.XQeii4F6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/header-cleanups
head:   d03f4bcb40575c1caf4deb8072eb2f9486e51b25
commit: a581a78403b6af4ee0aa9c6ee6701e92dc2555f6 [55/57] Use of_device_get_match_data
config: x86_64-randconfig-a016 (https://download.01.org/0day-ci/archive/20230428/202304280427.XQeii4F6-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?id=a581a78403b6af4ee0aa9c6ee6701e92dc2555f6
        git remote add robh https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
        git fetch --no-tags robh dt/header-cleanups
        git checkout a581a78403b6af4ee0aa9c6ee6701e92dc2555f6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280427.XQeii4F6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/mfd/wm831x-i2c.c:32:56: error: use of undeclared identifier 'spi'
                   type = (enum wm831x_parent)of_device_get_match_data(&spi->dev);
                                                                        ^
>> drivers/mfd/wm831x-i2c.c:37:30: error: use of undeclared identifier 'of_id'
                   type = (enum wm831x_parent)of_id->data;
                                              ^
   2 errors generated.


vim +/spi +32 drivers/mfd/wm831x-i2c.c

    22	
    23	static int wm831x_i2c_probe(struct i2c_client *i2c)
    24	{
    25		const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
    26		struct wm831x_pdata *pdata = dev_get_platdata(&i2c->dev);
    27		struct wm831x *wm831x;
    28		enum wm831x_parent type;
    29		int ret;
    30	
    31		if (i2c->dev.of_node) {
  > 32			type = (enum wm831x_parent)of_device_get_match_data(&spi->dev);
    33			if (!type) {
    34				dev_err(&i2c->dev, "Failed to match device\n");
    35				return -ENODEV;
    36			}
  > 37			type = (enum wm831x_parent)of_id->data;
    38		} else {
    39			type = (enum wm831x_parent)id->driver_data;
    40		}
    41	
    42		wm831x = devm_kzalloc(&i2c->dev, sizeof(struct wm831x), GFP_KERNEL);
    43		if (wm831x == NULL)
    44			return -ENOMEM;
    45	
    46		i2c_set_clientdata(i2c, wm831x);
    47		wm831x->dev = &i2c->dev;
    48		wm831x->type = type;
    49	
    50		wm831x->regmap = devm_regmap_init_i2c(i2c, &wm831x_regmap_config);
    51		if (IS_ERR(wm831x->regmap)) {
    52			ret = PTR_ERR(wm831x->regmap);
    53			dev_err(wm831x->dev, "Failed to allocate register map: %d\n",
    54				ret);
    55			return ret;
    56		}
    57	
    58		if (pdata)
    59			memcpy(&wm831x->pdata, pdata, sizeof(*pdata));
    60	
    61		return wm831x_device_init(wm831x, i2c->irq);
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
