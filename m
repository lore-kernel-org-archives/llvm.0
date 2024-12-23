Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92951C07DF;
	Mon, 23 Dec 2024 18:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734978292; cv=none; b=NraJf/92HwKSPMbmgU9X2CGCX1+01kLtgsv3Fuhle6R78UMWJ2+qhZUaGIfGUuC+TbVBzDOPBQrHiMNX37spK59X/BD+H1cvMQYhq78ithg+wC8H0Z4ouDXBHpC5KUWoYfJbzqoz8lgQk/5Ct51Tl6VS+IBCdkU2EJzp+5ORaeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734978292; c=relaxed/simple;
	bh=bLhfnBqRKCahRvZLYmtLFDUp/3rGnHOEIDYF4k97zu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GlvzLxoQuAJ9cSOQdOFYFdw78cYl989Us14qYDOuIvRKwE+djgUYWipyLTAa+MLzPM6DYk6FcY92rv/z0qMTIBC1pzA9+sWpks8Thr7uYxLAQRPtHwzEgyqCX5qeLI3adk6diXx/kVNA1dcFpbEl4EWGo20qjmFH9ObqvBc40jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Njq6SucB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Njq6SucB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734978290; x=1766514290;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bLhfnBqRKCahRvZLYmtLFDUp/3rGnHOEIDYF4k97zu0=;
  b=Njq6SucBQOOn1Vu5A4WqH6TBsLiIFoh+f7tHv5BLAAf4Mz/FCy+vRXh0
   x79GABgL5MPys6I+4zKOD50nofKeENxiGnR6J5ZDjtmXzC50mXPJYRkb4
   rWphlTWZFkwYd8azppir0/VeELGErRZWPGtxsm79PNBotPe7euClQsIv5
   +F4U4P6R7zPgsorXdKPQpZfj8g4RQfJp2GWdacnxksbLKly5mnpDGrWIA
   n6oOP6TXWp82S99XqrGDwOx7o78Zys0srnR0qHxXDUwgpJHT9DxYvBzvs
   4/zsmQqFKu5fb+CSDmg3SY95w2DuUg5fCj3JgUIcQXl8+/6wAZyC17ASy
   A==;
X-CSE-ConnectionGUID: nWpdSAaTTuWBB+Ka+y8R0A==
X-CSE-MsgGUID: W0SVM/xUTjGOFB9UbFKcbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35478385"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="35478385"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 10:24:50 -0800
X-CSE-ConnectionGUID: 1VeqdBfrQVSHB70oIy27wg==
X-CSE-MsgGUID: K+KcaVt+RM6vv2LBPM7hvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="99794769"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Dec 2024 10:24:47 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPn6i-0000YB-08;
	Mon, 23 Dec 2024 18:24:44 +0000
Date: Tue, 24 Dec 2024 02:24:18 +0800
From: kernel test robot <lkp@intel.com>
To: PavithraUdayakumar-adi via B4 Relay <devnull+pavithra.u.analog.com@kernel.org>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	PavithraUdayakumar-adi <pavithra.u@analog.com>
Subject: Re: [PATCH 2/2] rtc:max31335: Add driver support for max31331
Message-ID: <202412240128.bB1G2chN-lkp@intel.com>
References: <20241223-max31331-driver-support-v1-2-f9499bd598f5@analog.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241223-max31331-driver-support-v1-2-f9499bd598f5@analog.com>

Hi PavithraUdayakumar-adi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 4bbf9020becbfd8fc2c3da790855b7042fad455b]

url:    https://github.com/intel-lab-lkp/linux/commits/PavithraUdayakumar-adi-via-B4-Relay/dtbindings-rtc-max31335-Add-max31331-support/20241223-142214
base:   4bbf9020becbfd8fc2c3da790855b7042fad455b
patch link:    https://lore.kernel.org/r/20241223-max31331-driver-support-v1-2-f9499bd598f5%40analog.com
patch subject: [PATCH 2/2] rtc:max31335: Add driver support for max31331
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241224/202412240128.bB1G2chN-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240128.bB1G2chN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240128.bB1G2chN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/rtc/rtc-max31335.c:11:10: fatal error: 'asm-generic/unaligned.h' file not found
      11 | #include <asm-generic/unaligned.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +11 drivers/rtc/rtc-max31335.c

  > 11	#include <asm-generic/unaligned.h>
    12	#include <linux/bcd.h>
    13	#include <linux/bitfield.h>
    14	#include <linux/bitops.h>
    15	#include <linux/clk.h>
    16	#include <linux/clk-provider.h>
    17	#include <linux/hwmon.h>
    18	#include <linux/i2c.h>
    19	#include <linux/interrupt.h>
    20	#include <linux/kernel.h>
    21	#include <linux/module.h>
    22	#include <linux/of_device.h>
    23	#include <linux/regmap.h>
    24	#include <linux/rtc.h>
    25	#include <linux/util_macros.h>
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
