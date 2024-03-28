Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0A0446A5;
	Thu, 28 Mar 2024 17:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711647561; cv=none; b=QhlPp5YnVyM7egJQd97L1yzOcqPHE2+2SqiSALYVfTvnAgze5g9znnjB7VTJQjwvHsvGJYE5WOnpgcHmnpWH98JoTLOil8NSgmocalTWiplEt91CcmXps6I/bu+byk7u3SxtbdwKJ2RCX9GYwxMhbZzHNCmkQ0/te5L5Glx92N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711647561; c=relaxed/simple;
	bh=/cL68JVPKpK3dln5FCvuCsIUMWM5zxxIbP6lv5TQf9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z93xeS3NOsdEGEMVg3wHHgKZTCEshTLmlwSwseGqRHMr2yiEQBW6d++JZEAsLpZPU4CDw+/k4mfKK5lMtx+2FZC85TLwh6lAIwKELfKF9qnCruNmsOmm0HYL9M6L0rerlVSZdQI+1ky+e/w86OPXHLxjDhT/Xx1cOxDLjIXKaro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JbdupIjM; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JbdupIjM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711647560; x=1743183560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/cL68JVPKpK3dln5FCvuCsIUMWM5zxxIbP6lv5TQf9M=;
  b=JbdupIjMQy4jUdlfmi6pzTAwfqZtH9xxP4SylBJE22KJU0YBz+MlcZ9M
   p7+qjfi3XuPhEcQsCUe+mu44MLGqFyHoxv0EWs76aFLrDzYOR6+npDR9O
   OSdRihPHJQTO51GW360WRHondPwChoa7CxA7Gg3IWNWzrNiJbI5AplwPt
   829AjoZ75t+mis5CUxAU7N3apqgzO1s9NJdF9SVBB6V/k80k1DTVEs521
   AhciCSYdFyt2D+H91B2agRAp6Dp2oV1Tqsi5otoF30n0ODLAsMiXKakO0
   vbp+ERSWWrs9zSn9NvSkDWq625PD0rVuorOM4CfqmMOs9rvCzgEzfScYk
   A==;
X-CSE-ConnectionGUID: rB0QM6uhR8a48puBq64aFw==
X-CSE-MsgGUID: xfjHrhczT0uQ9LTuxG/28A==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="10619208"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="10619208"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 10:39:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17356179"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2024 10:39:18 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rptid-0002OI-1J;
	Thu, 28 Mar 2024 17:39:15 +0000
Date: Fri, 29 Mar 2024 01:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:filepKh54x 1/4] drivers/spi/spi-rspi.c:27:10: fatal
 error: 'linux/spi/rspi.h' file not found
Message-ID: <202403290134.xjwAEadY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git filepKh54x
head:   a283629ddd86c38aacfda153f0faa7f3bd4419a5
commit: e7b3c4623c421b1243a73e9e8ca7fd838f88b776 [1/4] spi: rspi: Get rid of unused struct rspi_plat_data
config: x86_64-buildonly-randconfig-001-20240325 (https://download.01.org/0day-ci/archive/20240329/202403290134.xjwAEadY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403290134.xjwAEadY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403290134.xjwAEadY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/spi/spi-rspi.c:27:10: fatal error: 'linux/spi/rspi.h' file not found
      27 | #include <linux/spi/rspi.h>
         |          ^~~~~~~~~~~~~~~~~~
   1 error generated.


vim +27 drivers/spi/spi-rspi.c

a3633fe7aa7022e Shimoda, Yoshihiro 2012-04-20 @27  #include <linux/spi/rspi.h>
f3a14a3a4d9a54c Geert Uytterhoeven 2020-03-09  28  #include <linux/spinlock.h>
0b2182ddac4b883 Shimoda, Yoshihiro 2012-03-07  29  

:::::: The code at line 27 was first introduced by commit
:::::: a3633fe7aa7022e2e9b2b799a0cbf3d6944d8ba5 spi/rspi: add dmaengine support

:::::: TO: Shimoda, Yoshihiro <yoshihiro.shimoda.uh@renesas.com>
:::::: CC: Grant Likely <grant.likely@secretlab.ca>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
