Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AF57C
	for <llvm@lists.linux.dev>; Sun, 28 Aug 2022 22:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661725598; x=1693261598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dcSE9LOG7cZJjuiBzpglSaypITbH/OCbn76AdIOCtCs=;
  b=duBlYbJkW6JPrtYd9ShIbyC45jwV2f2JjS5PzOT2Bm2XCBk9kmEYgtEd
   ddBvwH/EEDIPsK5FbVaxweiXFHdPpmovTJbSNjLXEnCvT7j0HIynfaK37
   7Ejlmsuh3jMabzfhz+HzZ3LkX/lcOUh4WK/vO6q1QYrHxL7EHdhGMcJGl
   cAtdeqfHzz8a5q/tvhPlulsBeYfE6bnUY5jSgn0tsXEQS1w8UfPRpKDAp
   icqe0AKlfegx6HnXTH4D8AFiBk2FkR6PoxELZFUxp5zTxFcP2ln5bVFHJ
   K2aK3Up+sxZXd1wl7TszUJpABz7w80bEroylxuzu9Y4eVhqwyiyNxr8vE
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10453"; a="281742676"
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="281742676"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2022 15:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,271,1654585200"; 
   d="scan'208";a="939367547"
Received: from lkp-server01.sh.intel.com (HELO fc16deae1c42) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2022 15:26:36 -0700
Received: from kbuild by fc16deae1c42 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oSQjj-0001gf-2d;
	Sun, 28 Aug 2022 22:26:35 +0000
Date: Mon, 29 Aug 2022 06:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Rokosov <DDRokosov@sberdevices.ru>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [jic23-iio:testing 124/129] drivers/iio/accel/msa311.c:993:24:
 warning: format specifies type 'unsigned char' but the argument has type
 'unsigned int'
Message-ID: <202208290618.wU7mHfOp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   fc32c348a52157665cd8f3f060669ef4e8a03cd4
commit: 1a622d75985c5950a470edc50c7ad7c10e79a1d3 [124/129] iio: add MEMSensing MSA311 3-axis accelerometer driver
config: powerpc-randconfig-r024-20220829 (https://download.01.org/0day-ci/archive/20220829/202208290618.wU7mHfOp-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project a2100daf12fb980a29fd1a9c85ccf8eaaaf79730)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git/commit/?id=1a622d75985c5950a470edc50c7ad7c10e79a1d3
        git remote add jic23-iio https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
        git fetch --no-tags jic23-iio testing
        git checkout 1a622d75985c5950a470edc50c7ad7c10e79a1d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/iio/accel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/iio/accel/msa311.c:993:24: warning: format specifies type 'unsigned char' but the argument has type 'unsigned int' [-Wformat]
                                              "msa311-%hhx", partid);
                                                      ~~~~   ^~~~~~
                                                      %x
   1 warning generated.


vim +993 drivers/iio/accel/msa311.c

   977	
   978	static int msa311_check_partid(struct msa311_priv *msa311)
   979	{
   980		struct device *dev = msa311->dev;
   981		unsigned int partid;
   982		int err;
   983	
   984		err = regmap_read(msa311->regs, MSA311_PARTID_REG, &partid);
   985		if (err)
   986			return dev_err_probe(dev, err, "failed to read partid\n");
   987	
   988		if (partid != MSA311_WHO_AM_I)
   989			dev_warn(dev, "invalid partid (%#x), expected (%#x)\n",
   990				 partid, MSA311_WHO_AM_I);
   991	
   992		msa311->chip_name = devm_kasprintf(dev, GFP_KERNEL,
 > 993						   "msa311-%hhx", partid);
   994		if (!msa311->chip_name)
   995			return dev_err_probe(dev, -ENOMEM, "can't alloc chip name\n");
   996	
   997		return 0;
   998	}
   999	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
