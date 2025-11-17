Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B7633E36C;
	Mon, 17 Nov 2025 20:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763411086; cv=none; b=G6VLnTcpDYmdNKhM6I5ZWI6LxB6H4pW10i9a1ZovmCNsAJSQm0xIhloUtr69cOy9URgGp7Gk7T8oKaSyt8OivXNGTEFeqC5h4EbUzlPJAUSZjiqKt4yPVBhPRM6+YbjbHiDoWCddrCt0nt6V/ZkU62BA1OGEMh6s3/fxgZkCJ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763411086; c=relaxed/simple;
	bh=JrY/5UTWPXVD/Her5W69pZN1QG5Nzpa5eGTOOGV7muk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BM4SAM/8OXr6GzTGZLqZFl4DYHqI400Sui2EYyZvh/XpM7XZwFEvhDQA8J9uJBBr4j/KTdsymoD40hGzfbb4AuRZ95PMZTiXlI/hj+7EW5x8bx23DLRoWkegB82IzW1MtGF9g9NKhSQYwz3popPWrmlVnKIE28S6fgsPv9TkoBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYZrHwK5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYZrHwK5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763411064; x=1794947064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JrY/5UTWPXVD/Her5W69pZN1QG5Nzpa5eGTOOGV7muk=;
  b=GYZrHwK5Fd6iA/8dNseWRH4j/jX/JCAY7rkHnEr3G0VTzg41cRiAcuLU
   AdgkyUWw8vUlC2BoLhN+/AtVaCltIeq69/jS6GZZnZeIdZXyggfq1w4jA
   HXm+gqIvTyZWBkkp4ecWLTb+n3uv7uHRwAhpTBdYe9d6evxY2+jnxf/VI
   cUvS5YCZ+ucpHlf1cGNLIMIvkOyU2zAcABLvgZ30ro5a2E9IzcNOisu0G
   kIuENGkCpxXwJz8SnR8M57z3OIgwPOZ7aRe6Om9sGINUDtCLtHD2eVo7k
   ZB8WzNsC5m9+kcmm2niyZVZ8wnt2rpy3TeUITQfOUC748/NxyU0emQuE7
   A==;
X-CSE-ConnectionGUID: 4GsGu/XPQlOOadJtnDml7A==
X-CSE-MsgGUID: 5ojzU2TWTM21gQsdvUqpGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="76775669"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="76775669"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 12:23:48 -0800
X-CSE-ConnectionGUID: WOYhaCxAQp2/sGCle29Q/g==
X-CSE-MsgGUID: EHLBHeT1RuS1nZyeYzFmGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="195479489"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Nov 2025 12:23:47 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL5lI-00011x-20;
	Mon, 17 Nov 2025 20:23:44 +0000
Date: Tue, 18 Nov 2025 04:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: Saravana Kannan <saravanak@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [robh:dt/linus 6/6] drivers/base/core.c:269:9: error: call to
 undeclared function 'get_device_from_fwnode'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202511180429.HKkjl2gG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/linus
head:   227c4e0e70fe3a1c47b96295af364e512882cef7
commit: 227c4e0e70fe3a1c47b96295af364e512882cef7 [6/6] of: dynamic: Fix overlayed devices not probing because of fw_devlink
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20251118/202511180429.HKkjl2gG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180429.HKkjl2gG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180429.HKkjl2gG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/base/core.c:269:9: error: call to undeclared function 'get_device_from_fwnode'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     269 |                 dev = get_device_from_fwnode(fwnode);
         |                       ^
   drivers/base/core.c:269:9: note: did you mean 'get_dev_from_fwnode'?
   include/linux/device.h:1093:16: note: 'get_dev_from_fwnode' declared here
    1093 | struct device *get_dev_from_fwnode(struct fwnode_handle *fwnode);
         |                ^
>> drivers/base/core.c:269:7: error: incompatible integer to pointer conversion assigning to 'struct device *' from 'int' [-Wint-conversion]
     269 |                 dev = get_device_from_fwnode(fwnode);
         |                     ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/get_device_from_fwnode +269 drivers/base/core.c

   248	
   249	/**
   250	 * fw_devlink_refresh_fwnode - Recheck the tree under this firmware node
   251	 * @fwnode: The fwnode under which the fwnode tree has changed
   252	 *
   253	 * This function is mainly meant to adjust the supplier/consumer dependencies
   254	 * after a fwnode tree overlay has occurred.
   255	 */
   256	void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
   257	{
   258		struct device *dev;
   259	
   260		/*
   261		 * Find the closest ancestor fwnode that has been converted to a device
   262		 * that can bind to a driver (bus device).
   263		 */
   264		fwnode_handle_get(fwnode);
   265		do {
   266			if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
   267				continue;
   268	
 > 269			dev = get_device_from_fwnode(fwnode);
   270			if (!dev)
   271				continue;
   272	
   273			if (dev->bus)
   274				break;
   275	
   276			put_device(dev);
   277		} while ((fwnode = fwnode_get_next_parent(fwnode)));
   278	
   279		/*
   280		 * If none of the ancestor fwnodes have (yet) been converted to a device
   281		 * that can bind to a driver, there's nothing to fix up.
   282		 */
   283		if (!fwnode)
   284			return;
   285	
   286		WARN(device_is_bound(dev) && dev->links.status != DL_DEV_DRIVER_BOUND,
   287		     "Don't multithread overlaying and probing the same device!\n");
   288	
   289		/*
   290		 * If the device has already bound to a driver, then we need to redo
   291		 * some of the work that was done after the device was bound to a
   292		 * driver. If the device hasn't bound to a driver, running thing too
   293		 * soon would incorrectly pick up consumers that it shouldn't.
   294		 */
   295		if (dev->links.status == DL_DEV_DRIVER_BOUND)
   296			fw_devlink_pickup_dangling_consumers(dev);
   297	
   298		put_device(dev);
   299		fwnode_handle_put(fwnode);
   300	}
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
