Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663178466;
	Fri,  2 Jun 2023 11:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685706750; x=1717242750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TjmBRBoV95Y63ZKfkcH6wm4kQQZkDzhlCWhtfqPoa/s=;
  b=ZNfN9X0rWICmbAeVQOVjVl7WdUU1QqhBZb7qoldJIMWbewgCcOA1/hXw
   7P3vleMgTtFFuWGFB3zGfcXFNlv9bJ/b6JHQQfMyPW698Kee83i9/E+eQ
   itxJZ+uQ6H//1C5MDYaW1ShS+3XTPxdSzKiedRIWjz5ysUoF4SbdMEqz2
   OKjoaNciKQTEewlbeCdt9X+ImAe8gNMvJ4P6Woq0TYk5q3OzFBhy8iZRa
   ja5Nt5qIyYllH5SpeI3R9XMbkylMA0WkuUKtMk/ujZJaOrqhsPStR+Au1
   9UgDEzUXcplqKojCHax1CPLMe1u4h7/tTkt2Ge7waxS+0JRt9VAE3C31E
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="353345858"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="353345858"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 04:52:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="710931689"
X-IronPort-AV: E=Sophos;i="6.00,212,1681196400"; 
   d="scan'208";a="710931689"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 02 Jun 2023 04:52:27 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q53KV-0000PE-07;
	Fri, 02 Jun 2023 11:52:27 +0000
Date: Fri, 2 Jun 2023 19:52:15 +0800
From: kernel test robot <lkp@intel.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Li Yang <leoyang.li@nxp.com>, Ioana Ciornei <ioana.ciornei@nxp.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: [linux-next:master 5699/6849]
 drivers/bus/fsl-mc/fsl-mc-allocator.c:108:12: warning: variable 'mc_bus_dev'
 is uninitialized when used here
Message-ID: <202306021936.OktTcMAT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc708bbd8260ee4eb3428b0109f5f3be661fae46
commit: b3134039c5b3cf879841e3ec84c8cbf7675554ec [5699/6849] bus: fsl-mc: fsl-mc-allocator: Improve error reporting
config: arm64-randconfig-r012-20230602 (https://download.01.org/0day-ci/archive/20230602/202306021936.OktTcMAT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=b3134039c5b3cf879841e3ec84c8cbf7675554ec
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b3134039c5b3cf879841e3ec84c8cbf7675554ec
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/bus/fsl-mc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021936.OktTcMAT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/fsl-mc/fsl-mc-allocator.c:108:12: warning: variable 'mc_bus_dev' is uninitialized when used here [-Wuninitialized]
                   dev_err(&mc_bus_dev->dev, "resource mismatch\n");
                            ^~~~~~~~~~
   include/linux/dev_printk.h:144:44: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                     ^~~
   include/linux/dev_printk.h:110:11: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                           ^~~
   drivers/bus/fsl-mc/fsl-mc-allocator.c:100:34: note: initialize the variable 'mc_bus_dev' to silence this warning
           struct fsl_mc_device *mc_bus_dev;
                                           ^
                                            = NULL
   drivers/bus/fsl-mc/fsl-mc-allocator.c:565:6: warning: variable 'free_count' set but not used [-Wunused-but-set-variable]
           int free_count = 0;
               ^
   2 warnings generated.


vim +/mc_bus_dev +108 drivers/bus/fsl-mc/fsl-mc-allocator.c

    87	
    88	/**
    89	 * fsl_mc_resource_pool_remove_device - remove an allocatable device from a
    90	 * resource pool
    91	 *
    92	 * @mc_dev: pointer to allocatable fsl-mc device
    93	 *
    94	 * It permanently removes an allocatable fsl-mc device from the resource
    95	 * pool. It's an error if the device is in use.
    96	 */
    97	static int __must_check fsl_mc_resource_pool_remove_device(struct fsl_mc_device
    98									   *mc_dev)
    99	{
   100		struct fsl_mc_device *mc_bus_dev;
   101		struct fsl_mc_bus *mc_bus;
   102		struct fsl_mc_resource_pool *res_pool;
   103		struct fsl_mc_resource *resource;
   104		int error = -EINVAL;
   105	
   106		resource = mc_dev->resource;
   107		if (!resource || resource->data != mc_dev) {
 > 108			dev_err(&mc_bus_dev->dev, "resource mismatch\n");
   109			goto out;
   110		}
   111	
   112		mc_bus_dev = to_fsl_mc_device(mc_dev->dev.parent);
   113		mc_bus = to_fsl_mc_bus(mc_bus_dev);
   114		res_pool = resource->parent_pool;
   115		if (res_pool != &mc_bus->resource_pools[resource->type]) {
   116			dev_err(&mc_bus_dev->dev, "pool mismatch\n");
   117			goto out;
   118		}
   119	
   120		mutex_lock(&res_pool->mutex);
   121	
   122		if (res_pool->max_count <= 0) {
   123			dev_err(&mc_bus_dev->dev, "max_count underflow\n");
   124			goto out_unlock;
   125		}
   126		if (res_pool->free_count <= 0 ||
   127		    res_pool->free_count > res_pool->max_count) {
   128			dev_err(&mc_bus_dev->dev, "free_count mismatch\n");
   129			goto out_unlock;
   130		}
   131	
   132		/*
   133		 * If the device is currently allocated, its resource is not
   134		 * in the free list and thus, the device cannot be removed.
   135		 */
   136		if (list_empty(&resource->node)) {
   137			error = -EBUSY;
   138			dev_err(&mc_bus_dev->dev,
   139				"Device %s cannot be removed from resource pool\n",
   140				dev_name(&mc_dev->dev));
   141			goto out_unlock;
   142		}
   143	
   144		list_del_init(&resource->node);
   145		res_pool->free_count--;
   146		res_pool->max_count--;
   147	
   148		devm_kfree(&mc_bus_dev->dev, resource);
   149		mc_dev->resource = NULL;
   150		error = 0;
   151	out_unlock:
   152		mutex_unlock(&res_pool->mutex);
   153	out:
   154		return error;
   155	}
   156	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
