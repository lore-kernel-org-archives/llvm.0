Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E363B42FC;
	Sun,  4 Oct 2026 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791086870; cv=none; b=FUFMq/noEQfLq7J1mXIt30sW/LC70twHw8lfEfG3yKewzsoqQKOws/xodYruLDa0g8vo/RGtDkFfBQcfiw1ntg/5Dgpy6+DZnx9NhcVvOTLDzeAij4bwGdszOsjsyW4CHO0YE7UBwq0DKoaFczP60EryHLxw2uRJxScQz8M3AZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791086870; c=relaxed/simple;
	bh=34EFU/pGumP9E2y2YDkZRM8R05BmCDPrvJSjCHugU2o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DPD4X/e6x+755KxA1/sXd+1QMzM6O9zifxcGmNyEtccjTp2viQ4yOviyYMpho62x1XwlTFUMN6x7LsqB3JVZKPzO97QcSwvR1CO3JoGVWnQBPM5pb+JDeOG1HHLLQpzSaNQI46b2CgtnbC/Tip//QtgYvO1nct3jClO+1Chhxkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kNGqx6fJ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kNGqx6fJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791086869; x=1822622869;
  h=date:from:to:cc:subject:message-id;
  bh=34EFU/pGumP9E2y2YDkZRM8R05BmCDPrvJSjCHugU2o=;
  b=kNGqx6fJ2HyTASPuOsQ71C8M95u8/Y3J2HHyO1rqkdT0oOpLieyxusnM
   W1IneGD0NezIx8MUYb2CTNgXDlqGNclJUIVSgdk3xGBirCApLJPzlKFM6
   8WbjASKQC+yH5JparzrzTj5Vw8QtRvjnnFhkaS84V4fyxohBT2y43ul+i
   Y6LVoM/vjhjRdYYG0LtGz9//mxCqtw4ODJRneUshtqbDpnJkbEwZEHGCO
   21phj3kNZHFw5c7ipmtD6ZkN5zmhRZRsPXwXm5Lni53utjeJXXSatkusO
   SUzWMNhKhtxFQR10YMnEScVLQl/jjKIY9ucHJ4qzmeiO578+m/IHDtou9
   Q==;
X-CSE-ConnectionGUID: RJ98vdlFQ56fUL2en6etSQ==
X-CSE-MsgGUID: HbHgA4arTAGutRYT/VHngg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90693280"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90693280"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 21:07:46 -0700
X-CSE-ConnectionGUID: vFYZOijHTsqfIRVjNafqMg==
X-CSE-MsgGUID: HjjVoBWVR1iAMtytfwkqsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="570112"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 03 Oct 2026 21:07:45 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDDVn-00000000URZ-0K8w;
	Sun, 04 Oct 2026 04:07:43 +0000
Date: Sun, 04 Oct 2026 12:06:56 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:r64-bench 14/14]
 drivers/pps/clients/pps-gpio.c:17:10: fatal error: 'asm/clock_inlined.h' file
 not found
Message-ID: <202610041214.1fMclYbJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux r64-bench
head:   51a9948e6ac20d8b60df0f50408133c864a66b8b
commit: 51a9948e6ac20d8b60df0f50408133c864a66b8b [14/14] [TEST HACKS] bench instrumentation for R64 PPS soak
config: arm-randconfig-1001-20261004 (https://download.01.org/0day-ci/archive/20261004/202610041214.1fMclYbJ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041214.1fMclYbJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610041214.1fMclYbJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pps/clients/pps-gpio.c:17:10: fatal error: 'asm/clock_inlined.h' file not found
      17 | #include <asm/clock_inlined.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +17 drivers/pps/clients/pps-gpio.c

    11	
    12	#include <linux/init.h>
    13	#include <linux/kernel.h>
    14	#include <linux/interrupt.h>
    15	#include <linux/irq.h>
    16	#include <asm/arch_timer.h>
  > 17	#include <asm/clock_inlined.h>
    18	#include <linux/module.h>
    19	#include <linux/platform_device.h>
    20	#include <linux/slab.h>
    21	#include <linux/pps_kernel.h>
    22	#include <linux/gpio/consumer.h>
    23	#include <linux/list.h>
    24	#include <linux/property.h>
    25	#include <linux/timer.h>
    26	#include <linux/jiffies.h>
    27	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
