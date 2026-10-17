Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FB33B7776;
	Sat, 17 Oct 2026 21:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792274104; cv=none; b=Z9twh2ynYgb0kTGEyCawu/7jBOXuxeOATR2ncLj470DMf+6KdPaK8D+nnmZhlrvKgj4qjqY5NvhdUprjPxvmRjImTsGFA7muragrJV4QD6unPsJs0xzm/VLYzSIFFt6MYXtnS6fkDXOSRZH4KC0ej7ubzhPwfaFKmS/FuYeXEFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792274104; c=relaxed/simple;
	bh=GJJNL7dZONPysGkubR+JlIZt3FdoirQQRKVRSRvxtP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jJb0/7RTZAH3KvzcKscaknL5cz/sDGXH4GuZKTAWWBmtziep4+ih0ZOM5p0WK0vbPCOpsddxY2C6LLWAuaB2WjmssueTGnGBBxN0IOyv1mFKWSMUoxjI32+dB1UfJYMQSA0Wssdh/nOlMMhOdLOsiplY6blwcxdjyg6MxBEpzUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myqAFG8U; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myqAFG8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792274103; x=1823810103;
  h=date:from:to:cc:subject:message-id;
  bh=GJJNL7dZONPysGkubR+JlIZt3FdoirQQRKVRSRvxtP4=;
  b=myqAFG8UJl90naJWBtawKCTmcFT726nham7tzSPMkEyE8EZODu1JUHRD
   Q1DAI1jEJjXvCh/J+dC6y9HXAzPiOUSILhi0XTaUit3sa052HyHYBIfo2
   c+WiYBlX2sUrANjT9M8arweNRvmQcHFCzp4X8Bgxz7KbxJT5Sb89LH8iK
   Gvi2LR9xoYhF/2nkPFXP/O17yKZB+6jvfrk5XXUnktGotGQbgDMklmauk
   BuqNtYtbWw/BS8kRYU6InVsHK0RbLzodNuLLg3u0qb3WKp5kHu/PRfgS8
   GfppwGEYwOxR5vA2hLczXq2ISsvjazVxGSn8QYFZoJ9XaGhdb2JNYYRBv
   A==;
X-CSE-ConnectionGUID: 8ZIAvyK6T0+RrTwRKvDlAQ==
X-CSE-MsgGUID: OaizeA5mSKaxy79pcVq2Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="918814"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="918814"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 14:55:02 -0700
X-CSE-ConnectionGUID: 0gRyvQLxTl+BqrlF5dWjVg==
X-CSE-MsgGUID: KJLhUyUATn6nmZ2HjPZDxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2487848"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2026 14:55:00 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xICMj-00000000Jn0-2ZCh;
	Sat, 17 Oct 2026 21:54:57 +0000
Date: Sun, 18 Oct 2026 05:54:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-media@vger.kernel.org
Subject: [sailus-media-tree:media-ref 2/17]
 drivers/media/mc/mc-device.c:761:49: error: use of undeclared identifier
 'devnode'
Message-ID: <202610180552.6MBNpZSk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://linuxtv.org/sailus/media_tree.git media-ref
head:   cf47170584526b52366e936406ce2430b99a03a9
commit: 803515300f06fabf69ad489f3f1f8e5ab3f4717f [2/17] media: mc: Merge struct media_device back into struct media_devnode
config: hexagon-randconfig-1001-20261017 (https://download.01.org/0day-ci/archive/20261018/202610180552.6MBNpZSk-lkp@intel.com/config)
compiler: clang version 21.1.8 (https://github.com/llvm/llvm-project 2078da43e25a4623cab2d0d60decddf709aaea28)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180552.6MBNpZSk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180552.6MBNpZSk-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/mc/mc-device.c:31:1: error: unknown type name 'param_check_unsigned'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^
   include/linux/moduleparam.h:140:2: note: expanded from macro 'module_param'
     140 |         module_param_named(name, name, type, perm)
         |         ^
   include/linux/moduleparam.h:163:2: note: expanded from macro 'module_param_named'
     163 |         param_check_##type(name, &(value));                                \
         |         ^
   <scratch space>:165:1: note: expanded from here
     165 | param_check_unsigned
         | ^
   drivers/media/mc/mc-device.c:31:1: error: expected ')'
   include/linux/moduleparam.h:140:2: note: expanded from macro 'module_param'
     140 |         module_param_named(name, name, type, perm)
         |         ^
   include/linux/moduleparam.h:163:25: note: expanded from macro 'module_param_named'
     163 |         param_check_##type(name, &(value));                                \
         |                                ^
   drivers/media/mc/mc-device.c:31:1: note: to match this '('
   include/linux/moduleparam.h:140:2: note: expanded from macro 'module_param'
     140 |         module_param_named(name, name, type, perm)
         |         ^
   include/linux/moduleparam.h:163:20: note: expanded from macro 'module_param_named'
     163 |         param_check_##type(name, &(value));                                \
         |                           ^
   drivers/media/mc/mc-device.c:31:1: error: use of undeclared identifier 'param_ops_unsigned'; did you mean 'param_ops_uint'?
      31 | module_param(kaboom, unsigned int, 0077);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:140:2: note: expanded from macro 'module_param'
     140 |         module_param_named(name, name, type, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:164:25: note: expanded from macro 'module_param_named'
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |                                ^~~~~~~~~~~~~~~~
   <scratch space>:166:1: note: expanded from here
     166 | param_ops_unsigned
         | ^~~~~~~~~~~~~~~~~~
   include/linux/moduleparam.h:459:38: note: 'param_ops_uint' declared here
     459 | extern const struct kernel_param_ops param_ops_uint;
         |                                      ^
   drivers/media/mc/mc-device.c:31:31: error: expected '}'
      31 | module_param(kaboom, unsigned int, 0077);
         |                               ^
   drivers/media/mc/mc-device.c:31:1: note: to match this '{'
      31 | module_param(kaboom, unsigned int, 0077);
         | ^
   include/linux/moduleparam.h:140:2: note: expanded from macro 'module_param'
     140 |         module_param_named(name, name, type, perm)
         |         ^
   include/linux/moduleparam.h:164:2: note: expanded from macro 'module_param_named'
     164 |         module_param_cb(name, &param_ops_##type, &value, perm);            \
         |         ^
   include/linux/moduleparam.h:189:2: note: expanded from macro 'module_param_cb'
     189 |         __module_param_call(MODULE_PARAM_PREFIX, name, ops, arg, perm, -1, 0)
         |         ^
   include/linux/moduleparam.h:305:4: note: expanded from macro '__module_param_call'
     305 |         = { __param_str_##name, THIS_MODULE, ops,                       \
         |           ^
>> drivers/media/mc/mc-device.c:761:49: error: use of undeclared identifier 'devnode'
     761 |         mdev->media_dir = debugfs_create_dir(dev_name(&devnode->dev),
         |                                                        ^~~~~~~
   drivers/media/mc/mc-device.c:763:31: error: use of undeclared identifier 'devnode'
     763 |         debugfs_create_devm_seqfile(&devnode->dev, "requests",
         |                                      ^~~~~~~
   6 errors generated.
--
>> drivers/media/mc/mc-devnode.c:233:33: error: use of undeclared identifier 'mdev'
     233 |         dev_set_drvdata(&devnode->dev, mdev);
         |                                        ^~~~
   1 error generated.


vim +/devnode +761 drivers/media/mc/mc-device.c

9832e155f1ed30 drivers/media/media-device.c Javier Martinez Canillas 2015-12-11  733  
9832e155f1ed30 drivers/media/media-device.c Javier Martinez Canillas 2015-12-11  734  int __must_check __media_device_register(struct media_device *mdev,
9832e155f1ed30 drivers/media/media-device.c Javier Martinez Canillas 2015-12-11  735  					 struct module *owner)
9832e155f1ed30 drivers/media/media-device.c Javier Martinez Canillas 2015-12-11  736  {
9832e155f1ed30 drivers/media/media-device.c Javier Martinez Canillas 2015-12-11  737  	int ret;
9832e155f1ed30 drivers/media/media-device.c Javier Martinez Canillas 2015-12-11  738  
176fb0d108f749 drivers/media/media-device.c Laurent Pinchart         2009-12-09  739  	/* Register the device node. */
803515300f06fa drivers/media/mc/mc-device.c Sakari Ailus             2016-06-18  740  	mdev->devnode.fops = &media_device_fops;
803515300f06fa drivers/media/mc/mc-device.c Sakari Ailus             2016-06-18  741  	mdev->devnode.parent = mdev->dev;
8a95079668bf35 drivers/media/media-device.c Javier Martinez Canillas 2015-12-11  742  
8a95079668bf35 drivers/media/media-device.c Javier Martinez Canillas 2015-12-11  743  	/* Set version 0 to indicate user-space that the graph is static */
8a95079668bf35 drivers/media/media-device.c Javier Martinez Canillas 2015-12-11  744  	mdev->topology_version = 0;
8a95079668bf35 drivers/media/media-device.c Javier Martinez Canillas 2015-12-11  745  
803515300f06fa drivers/media/mc/mc-device.c Sakari Ailus             2016-06-18  746  	ret = media_devnode_register(&mdev->devnode, owner);
803515300f06fa drivers/media/mc/mc-device.c Sakari Ailus             2016-06-18  747  	if (ret < 0)
176fb0d108f749 drivers/media/media-device.c Laurent Pinchart         2009-12-09  748  		return ret;
176fb0d108f749 drivers/media/media-device.c Laurent Pinchart         2009-12-09  749  
803515300f06fa drivers/media/mc/mc-device.c Sakari Ailus             2016-06-18  750  	ret = device_create_file(&mdev->devnode.dev, &dev_attr_model);
176fb0d108f749 drivers/media/media-device.c Laurent Pinchart         2009-12-09  751  	if (ret < 0) {
803515300f06fa drivers/media/mc/mc-device.c Sakari Ailus             2016-06-18  752  		media_devnode_unregister(&mdev->devnode);
176fb0d108f749 drivers/media/media-device.c Laurent Pinchart         2009-12-09  753  		return ret;
176fb0d108f749 drivers/media/media-device.c Laurent Pinchart         2009-12-09  754  	}
176fb0d108f749 drivers/media/media-device.c Laurent Pinchart         2009-12-09  755  
8f5a3188fbd13f drivers/media/media-device.c Mauro Carvalho Chehab    2015-08-13  756  	dev_dbg(mdev->dev, "Media device registered\n");
8f5a3188fbd13f drivers/media/media-device.c Mauro Carvalho Chehab    2015-08-13  757  
de9f0c2a1ce3d9 drivers/media/mc/mc-device.c Hans Verkuil             2025-11-28  758  #ifdef CONFIG_DEBUG_FS
de9f0c2a1ce3d9 drivers/media/mc/mc-device.c Hans Verkuil             2025-11-28  759  	if (!media_debugfs_root)
de9f0c2a1ce3d9 drivers/media/mc/mc-device.c Hans Verkuil             2025-11-28  760  		media_debugfs_root = debugfs_create_dir("media", NULL);
de9f0c2a1ce3d9 drivers/media/mc/mc-device.c Hans Verkuil             2025-11-28 @761  	mdev->media_dir = debugfs_create_dir(dev_name(&devnode->dev),
de9f0c2a1ce3d9 drivers/media/mc/mc-device.c Hans Verkuil             2025-11-28  762  					     media_debugfs_root);
de9f0c2a1ce3d9 drivers/media/mc/mc-device.c Hans Verkuil             2025-11-28  763  	debugfs_create_devm_seqfile(&devnode->dev, "requests",
de9f0c2a1ce3d9 drivers/media/mc/mc-device.c Hans Verkuil             2025-11-28  764  				    mdev->media_dir, media_device_requests);
de9f0c2a1ce3d9 drivers/media/mc/mc-device.c Hans Verkuil             2025-11-28  765  #endif
de9f0c2a1ce3d9 drivers/media/mc/mc-device.c Hans Verkuil             2025-11-28  766  
176fb0d108f749 drivers/media/media-device.c Laurent Pinchart         2009-12-09  767  	return 0;
176fb0d108f749 drivers/media/media-device.c Laurent Pinchart         2009-12-09  768  }
85de721c46ba8a drivers/media/media-device.c Sakari Ailus             2013-12-12  769  EXPORT_SYMBOL_GPL(__media_device_register);
176fb0d108f749 drivers/media/media-device.c Laurent Pinchart         2009-12-09  770  

:::::: The code at line 761 was first introduced by commit
:::::: de9f0c2a1ce3d97561d5cf4678b80e13943647fd media: mc: add debugfs node to keep track of requests

:::::: TO: Hans Verkuil <hverkuil+cisco@kernel.org>
:::::: CC: Hans Verkuil <hverkuil+cisco@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
