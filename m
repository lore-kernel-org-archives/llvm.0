Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C9E1A9F91;
	Wed, 18 Feb 2026 22:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771454416; cv=none; b=n40tGHG8nl7vGYdnlcs+g/BLija8lpVAaloAkg76drfeEkXSUnvRFLpCFeyIn6x85DJ+seGtZI6fXo4hUo7/nyAUv8GT4NiqjimWhZ1WQzY1fQFENAZVFgXGBVpeK1agbxhLwwELZVCgq0W5IiakNUV7ZcZ3DJJIHVvWwAMy37A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771454416; c=relaxed/simple;
	bh=UB6DxCBaKFZS7wk47e7Tqm9WUWA21I2w3REJ4Vo2KKo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YqrqsFgryMNFyw8kfdtiXOEPOGIqdSa5XK7oscvc6rX65WE9nnd4DGp7RAUs95uCYbPL+BO0tmI7ZYaxfaK0Hadp9apaVrkKiJ1Gl8IOUgrZKJQSr4G+8Lx/aPJ6GakJ6OeNvrLy6nKot6BcPYjPcDqq3gSTO850S7NtfcFebus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/LHwYoM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/LHwYoM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771454415; x=1802990415;
  h=date:from:to:cc:subject:message-id;
  bh=UB6DxCBaKFZS7wk47e7Tqm9WUWA21I2w3REJ4Vo2KKo=;
  b=b/LHwYoMH8ai4xRQ5D9qFWEj3IbCiZJHHiAtmxIdElKUvkPWIO7nA2lp
   gYPbGstW3C1CWMqBjd0UPzUpctlnnG16DW+TmPQvttB9BVESp5Z8zQJUe
   D6kZmwqQJZXDQ6kPJYxmGnQK/8tveI6t73nZDe1Vgo/lRHpH3rDBrsy/U
   vjf2aJbMuIxmwgLNrOArCF3aW91mhsL1ZTstav42NZ+gTKMYomOJ1U1Yf
   G1kb1zOjMOxVyGc3GOidNdV6fNaqtcpZqiGr6Ra7UVvWOOvghdh8moJ8B
   VBdTcryM6D5Ppyx8/h6HBY2Gok4Q6FvEHrSztXX5MkhUNY9P9wHt5dlf1
   w==;
X-CSE-ConnectionGUID: eVaEdKieToKVaCuM86EKlw==
X-CSE-MsgGUID: NcBEGDsdQP638dE1ncigoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="72442371"
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="72442371"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 14:40:15 -0800
X-CSE-ConnectionGUID: YVRTRynRR2aXSaBwj/1p9w==
X-CSE-MsgGUID: y9Io6G1LRjGlyOGdPMi0vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,299,1763452800"; 
   d="scan'208";a="218479636"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Feb 2026 14:40:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsqDK-000000012nU-0we0;
	Wed, 18 Feb 2026 22:40:10 +0000
Date: Thu, 19 Feb 2026 06:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Linus Walleij <linusw@kernel.org>
Subject: ld.lld: error: undefined symbol: gpiochip_get_data
Message-ID: <202602190633.Rq12lOqw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23b0f90ba871f096474e1c27c3d14f455189d2d9
commit: da1d3596b1e456b5d5d5f719bbf5ce562f4fe22d iio: adc: ad4062: Add GPIO Controller support
date:   7 weeks ago
config: s390-randconfig-002-20260219 (https://download.01.org/0day-ci/archive/20260219/202602190633.Rq12lOqw-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260219/202602190633.Rq12lOqw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602190633.Rq12lOqw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_gpiochip_add_data_with_key
   >>> referenced by ad4062.c:1464 (drivers/iio/adc/ad4062.c:1464)
   >>>               drivers/iio/adc/ad4062.o:(ad4062_gpio_init) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: gpiochip_get_data
   >>> referenced by ad4062.c:1409 (drivers/iio/adc/ad4062.c:1409)
   >>>               drivers/iio/adc/ad4062.o:(ad4062_gpio_init_valid_mask) in archive vmlinux.a
   >>> referenced by ad4062.c:1363 (drivers/iio/adc/ad4062.c:1363)
   >>>               drivers/iio/adc/ad4062.o:(ad4062_gpio_set) in archive vmlinux.a
   >>> referenced by ad4062.c:1378 (drivers/iio/adc/ad4062.c:1378)
   >>>               drivers/iio/adc/ad4062.o:(ad4062_gpio_get) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
