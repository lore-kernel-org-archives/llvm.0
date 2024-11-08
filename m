Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C3421CFBD;
	Fri,  8 Nov 2024 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731087378; cv=none; b=HEFndx6HCyabFnlkhBGZKhNzr49jmfcqAk4SyViKxu8sMOzhiuW2o6gZPvaKzBY18o7ABkeFQdMkq2lUZNJ4JtvrAzJM449xsLDW/FNcvBpM58+Q3/RX0b73g94k9D+bFX0lIw7ioRpUV/w5jDTCacuozUCApsgbSrVm6RfcBkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731087378; c=relaxed/simple;
	bh=VYRtOv+nPghOh1Cg4oPCcRkHkKNpWrkOKEbceRGuIs0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CoznZV6sIndSafdpvZ50GuwE1fCqymvq6Th+nJyESjoX4LC80OOo0wxRzJ9KRGbCqTCQz8nqLzw6C7T6G8fnwd2qAR6D9AVoR4YlaW1XFILIBmkO270uHmmvYLp/ZyKHL2vF6IPnf9jeZt/mP7uCpS0+Xz60GHApDzDffJSQG7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVc15i7+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVc15i7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731087377; x=1762623377;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VYRtOv+nPghOh1Cg4oPCcRkHkKNpWrkOKEbceRGuIs0=;
  b=aVc15i7+9+hpW2dpu4rYldYMu2runTPoriREkG3WTsij3xEXhyRWsgdG
   LNAY7SJh91MYZq2lKBSww0xFkNuAknvtUL4YVmdvMLT19obfuXOhTMOz1
   fTujmROAqAS9ziUKYA8Rc55uic5YN0GHPmYaFQq2TPlWJ1uzQg4H0eVbr
   2LFc0CjZ8O3Y8sVlxyR6W9pYW7pL+jUJfKTBAjKe4S33N7tPVv7niYR7r
   h3tl+uUEMvLkVoi3MuD63CNeCERvr88aKlWqEzYU6UeSbDrNj3GPUIvnu
   P8+w3QFtXoBKWr2nhYfs443+5Q9MfoZx/WezrR7RF0Fa4IdmET01CWjBs
   g==;
X-CSE-ConnectionGUID: p7eBU/CcQrWH+1nbHVCDpw==
X-CSE-MsgGUID: rnNscdtdQNCSc5WULsdpKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="34765142"
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="34765142"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 09:36:16 -0800
X-CSE-ConnectionGUID: fSSNJeBoT1iCWbyIt3pcaw==
X-CSE-MsgGUID: P11TbQ9UQRKLr4/jfFZM5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,138,1728975600"; 
   d="scan'208";a="108951162"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Nov 2024 09:36:13 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Su3-000reg-0e;
	Fri, 08 Nov 2024 17:36:11 +0000
Date: Sat, 9 Nov 2024 01:36:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Ramon Cristopher M. Calam" <ramoncristopher.calam@analog.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristopher Calam <ramoncristopher.calam@analog.com>
Subject: Re: [PATCH 1/2] regulator: lt8722: Add driver for LT8722
Message-ID: <202411090141.pm0JwBtT-lkp@intel.com>
References: <20241108093544.9492-2-ramoncristopher.calam@analog.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108093544.9492-2-ramoncristopher.calam@analog.com>

Hi Ramon,

kernel test robot noticed the following build errors:

[auto build test ERROR on e18da71634d12a94a15138947538ef2f0ac22746]

url:    https://github.com/intel-lab-lkp/linux/commits/Ramon-Cristopher-M-Calam/regulator-lt8722-Add-driver-for-LT8722/20241108-174141
base:   e18da71634d12a94a15138947538ef2f0ac22746
patch link:    https://lore.kernel.org/r/20241108093544.9492-2-ramoncristopher.calam%40analog.com
patch subject: [PATCH 1/2] regulator: lt8722: Add driver for LT8722
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20241109/202411090141.pm0JwBtT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090141.pm0JwBtT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411090141.pm0JwBtT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/lt8722-regulator.c:8:10: fatal error: 'asm/unaligned.h' file not found
       8 | #include <asm/unaligned.h>
         |          ^~~~~~~~~~~~~~~~~
   1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +8 drivers/regulator/lt8722-regulator.c

   > 8	#include <asm/unaligned.h>
     9	#include <linux/bitfield.h>
    10	#include <linux/bits.h>
    11	#include <linux/crc8.h>
    12	#include <linux/delay.h>
    13	#include <linux/gpio.h>
    14	#include <linux/math.h>
    15	#include <linux/module.h>
    16	#include <linux/regulator/driver.h>
    17	#include <linux/regulator/machine.h>
    18	#include <linux/regulator/of_regulator.h>
    19	#include <linux/spi/spi.h>
    20	#include <linux/util_macros.h>
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
