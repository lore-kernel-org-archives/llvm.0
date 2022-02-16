Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529771FBB
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 03:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644983366; x=1676519366;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ynVC1WDjg5YL1mEuhcZxYE2nNJPQL6BBVAU4mI2ZslA=;
  b=YLBAM5rhOhM+gep328WLgDeNK0EDiZn4OCtFPsD9nyc3r0LYXzqVUQth
   K6GGtQEtvj3xabJi936/P0oMQJ3RSpOf+jCTTj5/GEHkGh86tN6AYf8mk
   Jmy7GoQk8ITLiA2y7BBJVaVoRDFe3z6pYIECEYgUSbdKfYB8tW1CXUFrG
   dUN34Z6QSm6SmZoVrLV5thjnV0So+HQWEIsYeCeUSR4hOZrhH2tAkt5uW
   uLn3Ih3z+B1BdCeaEjeq0bQ2msvGiZTsBApb/zGb2rCRlbhgqQmt/kw6G
   wBXZyCAvW/pW/EH9X1otUPP8w6/2dlXXD+fEbcuApXpwlJ7apNYTSzBXq
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250717200"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="250717200"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 19:49:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; 
   d="scan'208";a="681328161"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 15 Feb 2022 19:49:23 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKBJi-000ANA-IT; Wed, 16 Feb 2022 03:49:22 +0000
Date: Wed, 16 Feb 2022 11:48:57 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Scally <djrscally@gmail.com>, linux-media@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org, yong.zhi@intel.com,
	sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, andriy.shevchenko@linux.intel.com,
	hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 09/10] media: i2c: Remove .s_power() from ov7251
Message-ID: <202202161122.Qh05mcn0-lkp@intel.com>
References: <20220215230737.1870630-10-djrscally@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215230737.1870630-10-djrscally@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.17-rc4 next-20220215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/Support-OVTI7251-on-Microsoft-Surface-line/20220216-071110
base:   git://linuxtv.org/media_tree.git master
config: riscv-randconfig-r003-20220216 (https://download.01.org/0day-ci/archive/20220216/202202161122.Qh05mcn0-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/5c7425707438fee74daeb7faf41774d88a04b561
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Daniel-Scally/Support-OVTI7251-on-Microsoft-Surface-line/20220216-071110
        git checkout 5c7425707438fee74daeb7faf41774d88a04b561
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/media/i2c/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/ov7251.c:190:31: warning: unused variable 'ov7251_global_init_setting' [-Wunused-const-variable]
   static const struct reg_value ov7251_global_init_setting[] = {
                                 ^
   1 warning generated.


vim +/ov7251_global_init_setting +190 drivers/media/i2c/ov7251.c

9276bc868a46fc Daniel Scally 2022-02-15  189  
d30bb512da3d8e Todor Tomov   2018-04-25 @190  static const struct reg_value ov7251_global_init_setting[] = {
d30bb512da3d8e Todor Tomov   2018-04-25  191  	{ 0x0103, 0x01 },
d30bb512da3d8e Todor Tomov   2018-04-25  192  	{ 0x303b, 0x02 },
d30bb512da3d8e Todor Tomov   2018-04-25  193  };
d30bb512da3d8e Todor Tomov   2018-04-25  194  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
