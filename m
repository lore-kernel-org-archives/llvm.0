Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4E5318EDF;
	Fri,  6 Mar 2026 01:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772761181; cv=none; b=Z0ozR/RP8jAzcw3Mtg3xcLi/GYXZSRDqaUjPcwaDAeWM4A3muZ4wdYl+ZBR0ABQLhP0S1igAhZLtClqWY98XayfJj2jkzX/4X8OY+r7QscOJXrazmpL/DuqCjie+of1Npi0dS6eWgpdeIKuR/zaJKSkz1qgl9vKProA6GGwIrMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772761181; c=relaxed/simple;
	bh=2zUKG4tiRu6hGUTdeIaITNYk/oY+KWpXicvVIH1pFMk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=i8n/SPiaXU9c01cSaBJchxLcOw4MC4rFf2yEIIwkJAyjEV0vdlJrfl77vRujdSSzdvj0hrS/8d9qzQ6LxyZhdiNf6ED3vL/dI2woq3cbD987CAsFVELsFzHiT5ieYwvvqXAw8i5lnXPUaaRMFNCXTuTBV5gtMl1uR+cYOZP5jmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jkqy0kDF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jkqy0kDF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772761180; x=1804297180;
  h=date:from:to:cc:subject:message-id;
  bh=2zUKG4tiRu6hGUTdeIaITNYk/oY+KWpXicvVIH1pFMk=;
  b=jkqy0kDF3HxUAc1LzTBDmkAJGiVEBnK30I9CYuzRJhaaNe6MyYx1CMfo
   P9SzVb09BkzfiDS+JvvX4YXE71GY1G7cVZpsW5bqLB7CNLyOhKIoLdgMn
   UnPyb6WWJ/3fNHQFJdFsP4NRTEioHp65mGHOVQ+zy2KjJoEh0jjxhMdD6
   3mJ/Cns9EYhI4iAkjRc8/NPYBJB4SXfHh9Jj4BctUVfDqG1/MXCR6AGkd
   Euxn0RySDzRAghf0+u3YrckgBh6C3jPhXtgV5nsiqP2bSy11AjayEDyCd
   /mFjA2c7Zum2imq1XDx3VKQmpWirHHVAuDLQy8DOEL/au/To2EdMdwQqK
   A==;
X-CSE-ConnectionGUID: OpMotbASREGLMaSW9DAXJA==
X-CSE-MsgGUID: 4FEKGcTIQB2jMXPAiwMmAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85339450"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="85339450"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 17:39:38 -0800
X-CSE-ConnectionGUID: 5TGJR9CwQ5W/T6am6pbA+A==
X-CSE-MsgGUID: bdQEn8IaS5qZgt5FKpy/yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; 
   d="scan'208";a="215594872"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 17:39:35 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyKA9-000000000B5-1bhA;
	Fri, 06 Mar 2026 01:39:33 +0000
Date: Fri, 06 Mar 2026 09:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 137/467]
 drivers/gpu/drm/msm/dp/dp_debug.c:12:10: fatal error: 'dp_catalog.h' file not
 found
Message-ID: <202603060951.uZU17S3z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   9d549a35a0c4585bfc4ff24185c5d8cb7485078e
commit: 6ca67552105bac78ffe5e3c4621c94df665291d1 [137/467] drm: msm: convert to read/write iterators
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260306/202603060951.uZU17S3z-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260306/202603060951.uZU17S3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603060951.uZU17S3z-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/msm/dp/dp_debug.c:9:
   In file included from include/drm/drm_connector.h:32:
   In file included from include/drm/drm_util.h:35:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/gpu/drm/msm/dp/dp_debug.c:12:10: fatal error: 'dp_catalog.h' file not found
      12 | #include "dp_catalog.h"
         |          ^~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +12 drivers/gpu/drm/msm/dp/dp_debug.c

    11	
  > 12	#include "dp_catalog.h"
    13	#include "dp_aux.h"
    14	#include "dp_ctrl.h"
    15	#include "dp_debug.h"
    16	#include "dp_display.h"
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
