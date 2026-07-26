Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198971DF75A;
	Sun, 26 Jul 2026 04:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785040638; cv=none; b=Z6pHqOPbLM9vTDBKoukQee9N+TvgrcAlzj7TVYXFNW4Pfhy1ZFYQe3CMHaqUJEnvpWmcXeLbJMFCWgzzWWsHhZeYjNpP+EAkscB0isIQrV4fq1Vql7PPtE5ctoEtNPJLg7CR4QcjQ6YVGoqBEnNV5UCjb2L97iJuUFsiDcrMjks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785040638; c=relaxed/simple;
	bh=z0b1TNa7XMe61BGMTRa951L9tgXjFWPi7u81hfN3WDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M43YX1zzh49BXrkUqWkrLHja7uvXtb9Zlm0svuGTI/Vnx/qK8pU+nY98CN064dgIpNpbV3pN+Sa2M4HOq70L8pEFeU7qGtLpvsbluxQf0QP5AxmRmHt3PVzV2wdM2tE4OyeEIw8doLYzMb+5CyjoRGPyUz0Esi8IV94MavBCvBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3FXuKvw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3FXuKvw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785040636; x=1816576636;
  h=date:from:to:cc:subject:message-id;
  bh=z0b1TNa7XMe61BGMTRa951L9tgXjFWPi7u81hfN3WDk=;
  b=O3FXuKvwGwhc1H7FaRMd4o6n29tWT37h1uRJ1itp/CRta0WMxRUcJR2H
   4je9y4irTPFeoXnn0vInB8mHy2sNSp3aSKPGpT2LhCkmmSRp3ceXVl8jN
   0QOeAFnbM5Rwviu88XTEZZDYbsk+aT7ipbsfUztFuHkBzw2FnWA9h5rpC
   6IH83gYhsFnPNXlqv2MP4hnB77Uqft6//JQGPxOIUX5TfDL+pqs0E1XD2
   RMFt/rnZH8CBlNVl28mzd5K5V9QHXlwGbEsApo5EJYPXifRSZc5R2DFd4
   R2/7Gd3xpeukDxHrKG8aYywpp4+01kBHAMig+JymYsLSOZ0YZz4dmJXf7
   Q==;
X-CSE-ConnectionGUID: l2KhVj7qQ9+rY9WM1ydjnQ==
X-CSE-MsgGUID: wNHkbr7BQiih1rWOzR3aTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85734604"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="85734604"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 21:37:16 -0700
X-CSE-ConnectionGUID: ehd+UnDDTCaXh9uzBc3vow==
X-CSE-MsgGUID: YjqFkPxhTZyD9hH4azp+Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="263384652"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 25 Jul 2026 21:37:14 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnqbw-00000000cHj-0qGT;
	Sun, 26 Jul 2026 04:37:12 +0000
Date: Sun, 26 Jul 2026 12:36:19 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-rng 5/5]
 drivers/crypto/gemini/sl3516-ce-core.c:11:10: fatal error:
 'crypto/internal/rng.h' file not found
Message-ID: <202607261238.vNbZPkyA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-rng
head:   b3d559623a0829567d9f40d2d71da0e63ba7f549
commit: b3d559623a0829567d9f40d2d71da0e63ba7f549 [5/5] crypto: rng - Remove crypto_rng
config: sparc64-randconfig-002-20260726 (https://download.01.org/0day-ci/archive/20260726/202607261238.vNbZPkyA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890b11e09e45e9d8b29f2f94f22052be3934e757)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260726/202607261238.vNbZPkyA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607261238.vNbZPkyA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/crypto/gemini/sl3516-ce-core.c:11:10: fatal error: 'crypto/internal/rng.h' file not found
      11 | #include <crypto/internal/rng.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +11 drivers/crypto/gemini/sl3516-ce-core.c

67b7702c5b03b8 Herbert Xu     2023-08-13 @11  #include <crypto/internal/rng.h>
67b7702c5b03b8 Herbert Xu     2023-08-13  12  #include <crypto/internal/skcipher.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  13  #include <linux/clk.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  14  #include <linux/debugfs.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  15  #include <linux/dev_printk.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  16  #include <linux/dma-mapping.h>
67b7702c5b03b8 Herbert Xu     2023-08-13  17  #include <linux/err.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  18  #include <linux/interrupt.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  19  #include <linux/io.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  20  #include <linux/irq.h>
67b7702c5b03b8 Herbert Xu     2023-08-13  21  #include <linux/kernel.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  22  #include <linux/module.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  23  #include <linux/of.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  24  #include <linux/platform_device.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  25  #include <linux/pm_runtime.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  26  #include <linux/reset.h>
46c5338db7bd45 Corentin Labbe 2021-06-01  27  

:::::: The code at line 11 was first introduced by commit
:::::: 67b7702c5b03b89ca196c5bd137407509b397049 crypto: sl3516 - Use new crypto_engine_op interface

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
