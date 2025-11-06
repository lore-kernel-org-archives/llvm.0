Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB915301034;
	Thu,  6 Nov 2025 08:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762417534; cv=none; b=WiXw1RLIQ07R99ciLUPZHmNvXRtv85iSJVujRMEOCh7fI4a0jmPelBC5NxO+WQWFU35c+MVTqSODQiHbqnVhKlONuCGoqxNkUISlk451JK47gkhKQKc8DKlPXDC0eeCpDA7oqN4uDjG2GK79CxYlXRvfNW2G4UKAkaaEquRI28c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762417534; c=relaxed/simple;
	bh=wcMkvRvM2rxBATENH3MUgVd4MLzRYBId91zHJmnMrTg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LweExVDtLBPIhsJ6kZBknHDKAi2cX8WvjHDdyBPO7MmNeH8g0+FUlqknR01ohy7TKXmmkBRZZJy9YUJdpNL/gvUAALgsagvNAWbvJ4SpnZRkASeZfkF5gN7YCD5k+6rvivNK/292fxLg2mxHFRo0f08QUYxNhOHrZrOeS1uJWLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AGHrDh/f; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AGHrDh/f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762417533; x=1793953533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wcMkvRvM2rxBATENH3MUgVd4MLzRYBId91zHJmnMrTg=;
  b=AGHrDh/foN7KvkoBqKl8/NGZwHc0mEjnX4E6MALutz8cp0lbMegzFd7b
   B+Z6+kvevIgldx96JjMJLFk3OV7nTDyIbluLxbECsc8kprZF+velJ0Rg5
   AG83uT5ftJ/nF339VVOVUoXRdW5YCUtkkZ//fdBUC+rPYNv8KAhabXdFf
   Copu0Co88xPiaXU/RYy0pTxDNAVx5+swUDsnXI0pki7XwnLzf3YUXYx+s
   f76EnvTlD/zWk+Ll1MoToXVWejP+Wgg5mDkdQp18o+jHUZs2/y+Am2dq2
   xKmRIp/FsotIatqQzuDJ+w1whCX9sdJIk0ZOp0LSVEdsWU5kl/vS5GS5w
   g==;
X-CSE-ConnectionGUID: GkfX5bdHSAWCXe5tehce1A==
X-CSE-MsgGUID: Oq/74Fm9TZ6BJf9xBRtcUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75998675"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="75998675"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 00:25:32 -0800
X-CSE-ConnectionGUID: 7Bo9loeFSCGqTxaDFSQGHQ==
X-CSE-MsgGUID: 7FpxxH5HSh+15lqizB5UVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="192747006"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2025 00:25:31 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGvJB-000Tek-04;
	Thu, 06 Nov 2025 08:25:29 +0000
Date: Thu, 6 Nov 2025 16:24:45 +0800
From: kernel test robot <lkp@intel.com>
To: Weidong Wang <wangweidong.a@awinic.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v3_20251028_wangweidong_a_rework_the_awinic_driver
 41/46] sound/soc/codecs/aw88261.c:16:10: fatal error:
 'aw88395/aw88395_data_type.h' file not found
Message-ID: <202511061628.AIOG0CfO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20251028_wangweidong_a_rework_the_awinic_driver
head:   6911f5ed5253f3a0deaa3dea2e9e8cfa4324048e
commit: dc3ed59a386ff3ca76a05e77f29f5c34f9e4b23b [41/46] ASoC: codecs:Rework the awinic driver lib
config: x86_64-randconfig-012-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061628.AIOG0CfO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061628.AIOG0CfO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061628.AIOG0CfO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/aw88261.c:16:10: fatal error: 'aw88395/aw88395_data_type.h' file not found
      16 | #include "aw88395/aw88395_data_type.h"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +16 sound/soc/codecs/aw88261.c

028a2ae256916e Weidong Wang 2023-08-04  10  
028a2ae256916e Weidong Wang 2023-08-04  11  #include <linux/i2c.h>
028a2ae256916e Weidong Wang 2023-08-04  12  #include <linux/firmware.h>
028a2ae256916e Weidong Wang 2023-08-04  13  #include <linux/regmap.h>
028a2ae256916e Weidong Wang 2023-08-04  14  #include <sound/soc.h>
028a2ae256916e Weidong Wang 2023-08-04  15  #include "aw88261.h"
028a2ae256916e Weidong Wang 2023-08-04 @16  #include "aw88395/aw88395_data_type.h"
028a2ae256916e Weidong Wang 2023-08-04  17  #include "aw88395/aw88395_device.h"
028a2ae256916e Weidong Wang 2023-08-04  18  

:::::: The code at line 16 was first introduced by commit
:::::: 028a2ae256916eeae1040049d2d0129535ace60e ASoC: codecs: Add aw88261 amplifier driver

:::::: TO: Weidong Wang <wangweidong.a@awinic.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
