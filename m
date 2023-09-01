Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3478BE4D;
	Fri,  1 Sep 2023 13:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693575044; x=1725111044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I8ClIdFrd8bCrFDXWH/4gWSrQB3EMQdFm6TZpxfkCQ8=;
  b=XsZ8Jn4/GLwj5vJwZb9IbG/+eUBq0XST0ZL+4Ts05ikyjV7H8hv8K2GL
   n7qZPviUxlcYvHOVLosdexNQghEm3CWTn/KiTD/VSnuiK76j/6np05c3f
   aCneXVouKQia/g1JHfLWzR1WBTv+uuglSTZ3OXKI3yv62LqcK112rXEpb
   dNDOSdqdRTLqoGx/otavqt4WmVyv/yOr8VwYSBWHdsTOjQSKbB6h/Qte3
   /7fZUtkBOOcwRxLHvwyweP5dNRYZwElC+F+FzuYEu04FKh0O0Q0nJwX0h
   Z5ZPIfaSklhKlI8QJJmHoP77qrVt9xiJ8WBZOW6NUOfyUJ+a7tHM1jT1j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="442614818"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="442614818"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 06:30:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="883188487"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000"; 
   d="scan'208";a="883188487"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 01 Sep 2023 06:30:42 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qc4EP-0001KZ-2G;
	Fri, 01 Sep 2023 13:30:37 +0000
Date: Fri, 1 Sep 2023 21:30:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Andi Shyti <andi.shyti@linux.intel.com>
Subject: [drm-misc:drm-misc-next 1/3] include/drm/drm_drv.h:587:13: error:
 unused function 'drm_debugfs_dev_init'
Message-ID: <202309012131.FeakBzEj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   8e455145d8f163aefa6b9cc29478e0a9f82276e6
commit: 0b30d57acafcaa5374756d314ee54f80d0bcc860 [1/3] drm/debugfs: rework debugfs directory creation v5
config: arm-randconfig-r021-20230901 (https://download.01.org/0day-ci/archive/20230901/202309012131.FeakBzEj-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230901/202309012131.FeakBzEj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309012131.FeakBzEj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/tilcdc/tilcdc_drv.c:18:
>> include/drm/drm_drv.h:587:13: error: unused function 'drm_debugfs_dev_init' [-Werror,-Wunused-function]
     587 | static void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
         |             ^
   1 error generated.


vim +/drm_debugfs_dev_init +587 include/drm/drm_drv.h

   583	
   584	#if defined(CONFIG_DEBUG_FS)
   585	void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root);
   586	#else
 > 587	static void drm_debugfs_dev_init(struct drm_device *dev, struct dentry *root)
   588	{
   589	}
   590	#endif
   591	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
