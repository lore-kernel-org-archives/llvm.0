Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1298A46982B;
	Sun,  4 Oct 2026 18:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791138449; cv=none; b=EtmpcXqA8ftJGW/5AyXa++rvhme8GIDFUXy2f9UJzGnkjWmqb35l3vMwc7UR5IKbX68tvM6i4Tg17DmwXDeu6ZrNpKrAl6fON/JJM3uSw+V/HJERE82NfCdzNKzJpAk6yLEaptE2Phty4AaCCW3g2vRASxNEOqPMDI37d1Csup8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791138449; c=relaxed/simple;
	bh=XBMLkGSs/UUGuWSOdBxFf+6ksVrxBijnPoAXCuLanYE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HSFChM3TIrzp1q4ZLazFWWAcKv+SQYAUxsaGy3h1Zld+IT3uiOKj58lCLKYw1aGIVH7oJ9dHCgB5p7n4wYnEXhciXVoSeIa5y06NwvZ7u4IRj+kGlijl9NRxQeA8JP4yVPQHvUEYoAJUBm3gdDqNbLTdw4IQMPvHXFpd9pwtlxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WCMnrCLl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WCMnrCLl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791138448; x=1822674448;
  h=date:from:to:cc:subject:message-id;
  bh=XBMLkGSs/UUGuWSOdBxFf+6ksVrxBijnPoAXCuLanYE=;
  b=WCMnrCLlS0dPM+6m/xM9n0mhbImD9uDmCs30qkjLZAVDmH6Tw6N9pjPx
   6LI8+XSbqNFOLlPV4s99g7pslIYAK2kVXgSlQqkMtGZLAjTf4tsRF/q5E
   WuwXacqYOJ7nZ4AkHoJ0Knip6DFzfIKufXa/cesSPgiB5rCqPCwthvq4C
   kEH7LRJJJdney+8iTkxriHN8b+2nAFDu5uj/nIzAMqhbr/wEPNNFjBgBf
   +XKwIuFggVTwvoRLCBy9MwckkxvSsrjsOwqcry7HCmyxFP4yWlfHxXQ9e
   M+25jfTEKsDgLpjo/hCnEMAX9RQC73RUbk86iDvRxoYn3n90gACVAtlSj
   Q==;
X-CSE-ConnectionGUID: wwhinmRwT52o7cOJp0azeQ==
X-CSE-MsgGUID: ZqG0BbpvSCWvC0q4ROUbjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="102400631"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="102400631"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 11:27:27 -0700
X-CSE-ConnectionGUID: ewI2oHT3QrScuaFYV2/aJA==
X-CSE-MsgGUID: 9CheDwexTuWvnPnuDYcuvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="314656209"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Oct 2026 11:27:27 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDQvk-00000000Uy5-05Qh;
	Sun, 04 Oct 2026 18:27:24 +0000
Date: Mon, 05 Oct 2026 02:27:22 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:rodolfo-14-test 6/6] ld.lld: error: undefined symbol:
 pps_ntperr_head
Message-ID: <202610050232.er4dxHIZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux rodolfo-14-test
head:   ac905dba751ebcb9a8b734b5c7c93d397e557563
commit: ac905dba751ebcb9a8b734b5c7c93d397e557563 [6/6] [TEST HACK] minimal bench telemetry for 1-4-only run
config: i386-buildonly-randconfig-1000-20261004 (https://download.01.org/0day-ci/archive/20261005/202610050232.er4dxHIZ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610050232.er4dxHIZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610050232.er4dxHIZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pps_ntperr_head
   >>> referenced by pps-gpio.c
   >>>               drivers/pps/clients/pps-gpio.o:(pps_gpio_irq_hardirq) in archive vmlinux.a
   >>> referenced by pps-gpio.c
   >>>               drivers/pps/clients/pps-gpio.o:(pps_gpio_irq_hardirq) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: pps_ntperr_ring
   >>> referenced by pps-gpio.c
   >>>               drivers/pps/clients/pps-gpio.o:(pps_gpio_irq_hardirq) in archive vmlinux.a
   >>> referenced by pps-gpio.c
   >>>               drivers/pps/clients/pps-gpio.o:(pps_gpio_irq_hardirq) in archive vmlinux.a
   >>> referenced by pps-gpio.c
   >>>               drivers/pps/clients/pps-gpio.o:(pps_gpio_irq_hardirq) in archive vmlinux.a
   >>> referenced 9 more times

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
