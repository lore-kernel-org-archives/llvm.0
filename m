Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA9722066;
	Sat, 28 Dec 2024 05:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735362759; cv=none; b=EXal7SQ5BmurRB7mrbH3VovzSai6WbQJRzOA/Ra3RuLEOM01yF2H+FZXbuWJUFm3FMWTNAxhygQbP+P2jwcJ/tPV8+2LsoULBEpjQVKjqHBn9CeCOEpuX0zq//EP1pUg0btGfsWR9iquQeg+kNw6Z+PROg6liCA9W5Rat1O8wQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735362759; c=relaxed/simple;
	bh=ioBF6btaLkebkM4HUjVJqFMRdhQwf4/nTJIficbpk6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GEo6jfPM3fTDXmgnsJZ5YxQEy7Lp4gpWoeEMlsgl5GHwG1sABZoDgaXmS5nzvzXG4nc0+tvo6lcuGiHGQ5bJavtkugKn+RuwMla4VUwUyNMzI7rhXsjrPb7Mn964qTlPYL+ay7vyWdKlvb6NQg3om4z8BhShHE8gTTT6G6H4PUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LKcN3fMK; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LKcN3fMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735362758; x=1766898758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ioBF6btaLkebkM4HUjVJqFMRdhQwf4/nTJIficbpk6U=;
  b=LKcN3fMKDoIlWfj3jnCOIYgnXIeTL1oWhjhc3Nl5tHZ12yOza1EgptTs
   HuxE1TFJ9sdl7fNkwMujO6HEUfQnnkLBOoJxcKTzu3Ag5Z34EmPgSKnX9
   TxNmZ/K+oDf7TdF68INBdTn8uTsuYrL9jxisgALgGE1xcFE+TE70KIV4d
   9Y8hWr/hIjq195ybG4yKf+MRf0h8BaamDgggg5D+bC803UBp+Oe2ViSse
   WYpr2Q0GrmZltPE1aDbDsDy1cYGZ1cgOZ3nafKeCEflbUYIOWXR1fj+un
   YGZXFyNhIxu2PkGcJsswjplko5W+HtHznXc4xwy8qp5qilKaafkNRzLUZ
   A==;
X-CSE-ConnectionGUID: U5bjRAm5R7O7vqBg/i5AdA==
X-CSE-MsgGUID: hg0JBhu+TNe5Hv9I0RzIdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35886907"
X-IronPort-AV: E=Sophos;i="6.12,271,1728975600"; 
   d="scan'208";a="35886907"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 21:12:38 -0800
X-CSE-ConnectionGUID: h4uyA0ddSTuuZ4tzLd9DvQ==
X-CSE-MsgGUID: Go8sLyvHTGyzRo44j8EaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131267180"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Dec 2024 21:12:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRP7m-0003rw-0r;
	Sat, 28 Dec 2024 05:12:30 +0000
Date: Sat, 28 Dec 2024 13:11:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 03/12] input: keyboard: omap4_keypad: Use
 devm_pm_set_wake_irq
Message-ID: <202412281211.h6tPLOqJ-lkp@intel.com>
References: <20241228-wake_irq-v1-3-09cfca77cd47@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228-wake_irq-v1-3-09cfca77cd47@nxp.com>

Hi Peng,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2]

url:    https://github.com/intel-lab-lkp/linux/commits/Peng-Fan-OSS/PM-sleep-wakeirq-Introduce-device-managed-variant-of-dev_pm_set_wake_irq/20241228-091859
base:   8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
patch link:    https://lore.kernel.org/r/20241228-wake_irq-v1-3-09cfca77cd47%40nxp.com
patch subject: [PATCH 03/12] input: keyboard: omap4_keypad: Use devm_pm_set_wake_irq
config: i386-buildonly-randconfig-002-20241228 (https://download.01.org/0day-ci/archive/20241228/202412281211.h6tPLOqJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412281211.h6tPLOqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281211.h6tPLOqJ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/zlib_inflate/zlib_inflate.o
>> ERROR: modpost: "devm_pm_set_wake_irq" [drivers/input/keyboard/omap4-keypad.ko] undefined!
WARNING: modpost: module snd-compress uses symbol dma_buf_fd from namespace DMA_BUF, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
WARNING: modpost: module snd-compress uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
