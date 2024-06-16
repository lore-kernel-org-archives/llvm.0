Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8115311CB8;
	Sun, 16 Jun 2024 23:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718581387; cv=none; b=eJdgZjrSEIjTV+y12qd9wjXHQOjOMiHOSbyq2KT9jGlifmGGcjAK//f2J4s6ZclOQ/SE+9qlUeS22gaUqJCKlXe7xdxo8TaXCu1wpgKx/cwXftsYkjh/A/G9WTQztz/ssG+N27JL55Mjy+YPaG+v1xpq23SS7DF85+WO+6EZ/IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718581387; c=relaxed/simple;
	bh=YlfxSKtg6WVsYZ13Hx2l/TEDR3MnXSvuyy4a8H3SioE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D3CrCyBi4+7MULrNyNYrlbXbDIzHjlpKArJjNisiOIqQB3eOJyItmA3jHl6mQxXC7TKiGOVfPmBVB1disyfPCB1suqWjLw7KOSjREhNiJJkt4nI2/M1deQ6A5dB8G9qjiPrj1uv1ued799O/TL/obPt6HTwhTbTpltpRjoPcIBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mMnSn0X/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mMnSn0X/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718581384; x=1750117384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YlfxSKtg6WVsYZ13Hx2l/TEDR3MnXSvuyy4a8H3SioE=;
  b=mMnSn0X/BUgyksjzheeFLHghKVX5s7m/WuGjNkc5hNOv2LmokXsg0Qpi
   rDMOVY8k54dpWt73ONlG0S4bpGC1CDpOkT/54kBRhM4smTk2jVMvhIxi8
   TYUoT9F8eW0CevKPXpNJRjVOIDx6krGRG6SZz4ZvoZf9VbLwcNxhbyPky
   oXRdbpF2n4Kmqt4fb4DWvVwuCkcAx6TjIp8ySdWIny3PKj4Xtp6XdpUZ2
   /ayMPKqYNvbvzf7/bxi+FXyqDIc77DOLfryEq+vopdTCQKe7RalFSoAYk
   9QtF4B8D/vAMbWOcK0hFZtulmbtruaG9m7PNrCpLhM8lo6lzY3jwY2Knq
   Q==;
X-CSE-ConnectionGUID: 77px/wyTTjWx2U1QzroU8g==
X-CSE-MsgGUID: YRlHcQ0tRyKeC2ReKoK35w==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15275300"
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="15275300"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 16:43:04 -0700
X-CSE-ConnectionGUID: bRPC9MD1Q/6oRA3YMqpqrw==
X-CSE-MsgGUID: +3FlXk15Tx+wOye5GQJWKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,243,1712646000"; 
   d="scan'208";a="78514236"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Jun 2024 16:43:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIzWW-0003Uw-1I;
	Sun, 16 Jun 2024 23:43:00 +0000
Date: Mon, 17 Jun 2024 07:42:45 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org
Subject: [driver-core:const_driver 16/23] drivers/cdx/cdx.c:648:12: error:
 incompatible function pointer types initializing 'int (*)(struct device *,
 const struct device_driver *)' with an expression of type 'int (struct
 device *, struct device_driver *)'
Message-ID: <202406170739.qxdbTrrC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git const_driver
head:   59a02fe9d47c712050ae1895d753dd46ce97f357
commit: 271b7e9b52810c0931a92496d9de0e3e07be51e0 [16/23] driver core: have match() callback in struct bus_type take a const *
config: arm64-randconfig-004-20240617 (https://download.01.org/0day-ci/archive/20240617/202406170739.qxdbTrrC-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406170739.qxdbTrrC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406170739.qxdbTrrC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/cdx/cdx.c:648:12: error: incompatible function pointer types initializing 'int (*)(struct device *, const struct device_driver *)' with an expression of type 'int (struct device *, struct device_driver *)' [-Werror,-Wincompatible-function-pointer-types]
           .match          = cdx_bus_match,
                             ^~~~~~~~~~~~~
   1 error generated.


vim +648 drivers/cdx/cdx.c

2959ab247061e6 Nipun Gupta 2023-03-13  645  
2959ab247061e6 Nipun Gupta 2023-03-13  646  struct bus_type cdx_bus_type = {
2959ab247061e6 Nipun Gupta 2023-03-13  647  	.name		= "cdx",
2959ab247061e6 Nipun Gupta 2023-03-13 @648  	.match		= cdx_bus_match,
2959ab247061e6 Nipun Gupta 2023-03-13  649  	.probe		= cdx_probe,
2959ab247061e6 Nipun Gupta 2023-03-13  650  	.remove		= cdx_remove,
2959ab247061e6 Nipun Gupta 2023-03-13  651  	.shutdown	= cdx_shutdown,
2959ab247061e6 Nipun Gupta 2023-03-13  652  	.dma_configure	= cdx_dma_configure,
b8c5ff76059ded Nipun Gupta 2023-06-05  653  	.dma_cleanup	= cdx_dma_cleanup,
2959ab247061e6 Nipun Gupta 2023-03-13  654  	.bus_groups	= cdx_bus_groups,
48a6c7bced2a78 Nipun Gupta 2023-03-13  655  	.dev_groups	= cdx_dev_groups,
2959ab247061e6 Nipun Gupta 2023-03-13  656  };
2959ab247061e6 Nipun Gupta 2023-03-13  657  EXPORT_SYMBOL_GPL(cdx_bus_type);
2959ab247061e6 Nipun Gupta 2023-03-13  658  

:::::: The code at line 648 was first introduced by commit
:::::: 2959ab247061e67485d83b6af8feb3761ec08cb9 cdx: add the cdx bus driver

:::::: TO: Nipun Gupta <nipun.gupta@amd.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
