Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20958433DC;
	Fri, 13 Sep 2024 20:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726260089; cv=none; b=Q+Ehh2JeIkcLwc7sf6kXl7dzdDL1Tas9RjC+EhaIpcuaxl3SfhHEAg073EL3rYAKvDX2QS3JBGy0ZwmC8LYjwLi7Ls5dna9Vr8FICmDmHzFyw5Ypj67xZzOZJpv8ymYCzvT8A3LQwAtB5hZDcWewzD7lXrtWG0K/c1GdlZW1biI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726260089; c=relaxed/simple;
	bh=dxtHkHhZlIEtYto+4D7ABktR9JYb+fxPTDKaT0Bg+p4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMTFU+kmcf55Wb15KP4AvN3SlsYjpa8oopcC4Qnky0Ja5vkYmHBoQCqsuO/kHHIgSMyCH8V6uNTmcuG+QjqZ5lrpI406DDigk6ElsUF9XF/P61YT8SoCONX8dqG9jgh3C3AGMZENRJj3f4pMlLmPUWgdFkofONk9xASLFLK8u8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D573NmcD; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D573NmcD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726260088; x=1757796088;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dxtHkHhZlIEtYto+4D7ABktR9JYb+fxPTDKaT0Bg+p4=;
  b=D573NmcDVatQctSj2Lyv/O97Ri+H1w4aje+hssWBKCjQ0yawP3yndLgd
   PA3xSic5IipQ5AHnRHAfBzxdDPwIFkOGaSSoOeHFnuPyH9qwjLfCcJV8n
   LkK14fWQHET3daGAdkYS8u/weNscYksdnRtsfyKToqDheuH5T+vwpVps8
   CNThuYw3NAT9LM2EsNNF2Tc3GKU2PCVStBPgdM6KB1jlgBGMCufhK8H/E
   JWuCyHc9b4yjRvVQeqO0jOGqXMyLqcns3PeB8h2qrq4ISJYFg6a9hR8YM
   sOvNyObKAHe0icJXeMvFWiC7xTOFSwUgevXpmZOd20UIbtT/v+VyYc/e/
   Q==;
X-CSE-ConnectionGUID: BIdYh5rvSpWcEIPf6CtoIA==
X-CSE-MsgGUID: taNrUlZsR/GZgJNSw24kNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35848672"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="35848672"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 13:41:28 -0700
X-CSE-ConnectionGUID: GVjA4IFURsadu4GOWs5ACw==
X-CSE-MsgGUID: 1LTFprj9SQKpm0G8VRBwfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68966522"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Sep 2024 13:41:21 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spD6U-0006yI-2Y;
	Fri, 13 Sep 2024 20:41:18 +0000
Date: Sat, 14 Sep 2024 04:40:58 +0800
From: kernel test robot <lkp@intel.com>
To: Arturs Artamonovs via B4 Relay <devnull+arturs.artamonovs.analog.com@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Malysa <greg.malysa@timesys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Utsav Agarwal <Utsav.Agarwal@analog.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Arturs Artamonovs <arturs.artamonovs@analog.com>,
	adsp-linux@analog.com,
	Nathan Barrett-Morrison <nathan.morrison@timesys.com>
Subject: Re: [PATCH 11/21] irqchip: Add irqchip for ADI ADSP-SC5xx platform
Message-ID: <202409140451.t2a9fck6-lkp@intel.com>
References: <20240912-test-v1-11-458fa57c8ccf@analog.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240912-test-v1-11-458fa57c8ccf@analog.com>

Hi Arturs,

kernel test robot noticed the following build warnings:

[auto build test WARNING on da3ea35007d0af457a0afc87e84fddaebc4e0b63]

url:    https://github.com/intel-lab-lkp/linux/commits/Arturs-Artamonovs-via-B4-Relay/arm64-Add-ADI-ADSP-SC598-SoC/20240913-022308
base:   da3ea35007d0af457a0afc87e84fddaebc4e0b63
patch link:    https://lore.kernel.org/r/20240912-test-v1-11-458fa57c8ccf%40analog.com
patch subject: [PATCH 11/21] irqchip: Add irqchip for ADI ADSP-SC5xx platform
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240914/202409140451.t2a9fck6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240914/202409140451.t2a9fck6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140451.t2a9fck6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/irqchip/irq-adi-adsp.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * ADSP PINT PORT driver.
   drivers/irqchip/irq-adi-adsp.c:51: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Each gpio device should be connected to one of the two valid pints with an
   drivers/irqchip/irq-adi-adsp.c:152: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * This handles the GIC interrupt associated with this PINT being activated.


vim +3 drivers/irqchip/irq-adi-adsp.c

   > 3	 * ADSP PINT PORT driver.
     4	 *
     5	 * The default mapping is used for all PINTs, refer to the HRM to identify
     6	 * PORT mapping to PINTs. For example, PINT0 has PORT B (0-15) and PORT A
     7	 * (16-31).
     8	 *
     9	 * Copyright (C) 2022-2024, Analog Devices, Inc.
    10	 */
    11	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
