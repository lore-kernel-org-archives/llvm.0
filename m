Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E6F101C8;
	Wed, 24 Jan 2024 06:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706078830; cv=none; b=YflEH4A1NXhb4SQZ9v2ro50jYCoApwilSIoz0C3DEhsk4WWJWOIfTVq7J/ABrewo1vFsbrkB4MTRjfTJFKQ4P5GKSlrd+ATrcOCQ3vqRqWMJEOr4TSRc2pvTxM0IUIuvwDBYl83nOruU+mvc4hraWlVf+HJasN7j8xNejsAZe1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706078830; c=relaxed/simple;
	bh=q6AjqT4kGsOs1zQNcv9Xft9ggAMOF9ly776lLLXfoK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kT7EInRIzZIExQHc2zHSJje1Bu4kiWbmtK39sjjRJ0K+h4xsb1kjlBMDZqAyb02OX6DST7DJIMWShveFLUwsHLRaMyUKaZNWY98ywgd+Jzu5eff4gcS9v6C8fiGufkFLzmIe89YkutLvPxXHz56r475uosgdPuygapeu3KtIU9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOCQWeoa; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOCQWeoa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706078828; x=1737614828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q6AjqT4kGsOs1zQNcv9Xft9ggAMOF9ly776lLLXfoK4=;
  b=UOCQWeoaOSNXkvDuQ0x/mL4WmJcKOuqSkwkqD0GTPRHgZg5d1hlUKEu6
   drW9ssIuVDg2W4a0mpEaEhb2lwff/9kncSbMMoh8s6FcYTu0d/9+sWCnm
   kvXIKLWgnxA0vGqz8dW7DVRt2t77H/hZ7jwFRT6VMz1OgQ8nnUU5tlEpK
   4PLbL2Kx6Tf1PWUuyc6fwWD9q2h07fBTE3IhK5G+om+u4KO5mleXh6WX9
   FGU5K/uY1h8+83BrH5TlyKCMNhIX0aNgH9H7EsJm5CJNQ4wGrMsMv1Rx8
   44dMAk+6NDRoh9dhDrSZfDTV7b2VkMf0Ka2fgvDf/636gbG+w+FVx6dFA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15276900"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="15276900"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 22:46:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="905505429"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="905505429"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 23 Jan 2024 22:46:55 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSX2D-0007wj-1i;
	Wed, 24 Jan 2024 06:46:53 +0000
Date: Wed, 24 Jan 2024 14:46:52 +0800
From: kernel test robot <lkp@intel.com>
To: Vishal Verma <vishal.l.verma@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	David Hildenbrand <david@redhat.com>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [vishal:vv/dax_abi 6/6] drivers/dax/bus.c:1372:22: error: call to
 undeclared function 'mhp_supports_memmap_on_memory'; ISO C99 and later do
 not support implicit function declarations
Message-ID: <202401241453.4WP5ruGd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vishal/linux.git vv/dax_abi
head:   6a9c721fafa6903e6a18ace2c5401ad674b1367b
commit: 6a9c721fafa6903e6a18ace2c5401ad674b1367b [6/6] dax: add a sysfs knob to control memmap_on_memory behavior
config: i386-buildonly-randconfig-002-20240124 (https://download.01.org/0day-ci/archive/20240124/202401241453.4WP5ruGd-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240124/202401241453.4WP5ruGd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401241453.4WP5ruGd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/dax/bus.c:1372:22: error: call to undeclared function 'mhp_supports_memmap_on_memory'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1372 |         if (val == true && !mhp_supports_memmap_on_memory()) {
         |                             ^
   1 error generated.


vim +/mhp_supports_memmap_on_memory +1372 drivers/dax/bus.c

  1359	
  1360	static ssize_t memmap_on_memory_store(struct device *dev,
  1361					      struct device_attribute *attr,
  1362					      const char *buf, size_t len)
  1363	{
  1364		struct dev_dax *dev_dax = to_dev_dax(dev);
  1365		bool val;
  1366		int rc;
  1367	
  1368		rc = kstrtobool(buf, &val);
  1369		if (rc)
  1370			return rc;
  1371	
> 1372		if (val == true && !mhp_supports_memmap_on_memory()) {
  1373			dev_dbg(dev, "memmap_on_memory is not available\n");
  1374			return -EOPNOTSUPP;
  1375		}
  1376	
  1377		rc = down_write_killable(&dax_dev_rwsem);
  1378		if (rc)
  1379			return rc;
  1380	
  1381		if (dev_dax->memmap_on_memory != val && dev->driver &&
  1382		    to_dax_drv(dev->driver)->type == DAXDRV_KMEM_TYPE) {
  1383			up_write(&dax_dev_rwsem);
  1384			return -EBUSY;
  1385		}
  1386	
  1387		dev_dax->memmap_on_memory = val;
  1388		up_write(&dax_dev_rwsem);
  1389	
  1390		return len;
  1391	}
  1392	static DEVICE_ATTR_RW(memmap_on_memory);
  1393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
