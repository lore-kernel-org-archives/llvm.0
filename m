Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341942;
	b=r/QnmiP+id8+VrCTCV2ksh2k24UnjGWh/lsdIFF1CK/JhQW//q2Zxkafv9iA1DyLNdsZ
	 JxmlzDv0zX9gc/iCgrm/BEF0LgarfUzbE+tSHg7wcNQvEqbPIT41bdlb0Guxdhk1p2bch
	 E+2ghAHMG+PGmMAbe28U/Sh9sbJ0y0E7QnwSMZePzXh/CbIFC92pIJrj9GSwtO9lS2Mg1
	 CJGDFGm1ujn5lt0/6rUKvjLqnfLwIDOJQhGWCBGqVAnKbxTAf0m9RPmSFSZrKbk2APPKB
	 5LvQ/IAwdITt/X5tAhHe723FThqIhZQXy69u51sQvQU1HNSyGpo7i+iezpx5Par2hPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341942;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=juK68wZhByXSKADyyYfPmjuuJBwSajAS7el5mvid4ZY=;
	b=Ul5OsP+HywsKXH+3qswQF+Oqjhuk9xptm04QkKZ/RlCK3y0l20vSNFQwrCZDeF+DdkA+
	 JJgn+5roLzLWLetP6+DEYYnV6I85qCO243Jal09wMoPZuaiClI+IWqo/DxNc3ONSCuKrS
	 E+Y3NzczHi51RR6kfJca08DEKfvCXlm9cRxAIMQrnHbtQ0bi7I8ocnNgZI3uRrxuDzXcu
	 /gdOHSe6LnKe91FeeiNpogujKl1e6d2JbASUXJeev9C4fiGaOwwjufjttfBqaIwOEqZOx
	 nV654Y1BZ1KCKqit0d/IeTRPMBKdgIoSHWFGzNZttyymrjz8RCKU3zYoq74peex2S2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TrF6p9up;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45D0606A320;
	Tue, 10 Nov 2026 20:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45D0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TrF6p9up
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794341941; x=1825877941;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xSTSWZR6Nw1Z+uKRJrpUe5ksHZNU7RF77FI0Rq6jAFw=;
  b=TrF6p9upz55gT8BQeYYjjNpJle9fkjhw5+HTKzUgDf9aYr3L9XemR8Wy
   GwMC8p+Fa4XvJxWdXa/rbWr3pIXqmHOGooQjp70KTkW/FM9MXvryBDR/I
   XGDlsfzONY9wCmdbE1BFyI2jasCVQrjyHkWDQZ9IuYe7fNnLRIKLhvWHw
   qb0PFm9/ZlcRJUj7qQwpM+e/bmC1pz76/02VTn301IAcqpHj4SPys4Myf
   3kLFW3ebxRSHYzIx+KPDYzQjWziP52kGRqPjKxlwCHQ7qPud4rWhZ5hnY
   ALdUdzfw57t0n48wZa5ZW2aJZSlxCDEzAOFWQWM+NWTrozOUx0gO9TMto
   g==;
X-CSE-ConnectionGUID: RtjKAoRGRXab3bpufyco8A==
X-CSE-MsgGUID: VKrrpjBsQKqo+k1HvdFllw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3097349"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3097349"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 12:19:00 -0800
X-CSE-ConnectionGUID: 19vcfB1bRk6BSkk74uN2TQ==
X-CSE-MsgGUID: YIXuxEJYSZG7ApbTiRH9ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8555566"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Nov 2026 12:18:56 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQsIu-00000000xRr-14R8;
	Tue, 10 Nov 2026 20:18:52 +0000
Date: Wed, 11 Nov 2026 04:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Wolfram Sang <wsa-dev@sang-engineering.com>,
	Paul Walmsley <paul@pwsan.com>,
	Russell King <linux@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Sicelo <absicsz@gmail.com>, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [PATCH 1/3] bus: ti-sysc: fix I2C quirk for OMAP3 variants
Message-ID: <202611110448.h78DkY1D-lkp@intel.com>
References: <20261110-i2c-sysc-v1-1-8945eb1d38f0@kemnade.info>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-i2c-sysc-v1-1-8945eb1d38f0@kemnade.info>

Hi Andreas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 7475ea8b58616b33c04afb976cf0fbaad9dd63fb]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/bus-ti-sysc-fix-I2C-quirk-for-OMAP3-variants/20261110-114612
base:   7475ea8b58616b33c04afb976cf0fbaad9dd63fb
patch link:    https://lore.kernel.org/r/20261110-i2c-sysc-v1-1-8945eb1d38f0%40kemnade.info
patch subject: [PATCH 1/3] bus: ti-sysc: fix I2C quirk for OMAP3 variants
config: arm64-randconfig-1000-20261110 (https://download.01.org/0day-ci/archive/20261111/202611110448.h78DkY1D-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e73e336290028f26553b46c9fba844c13da38c9c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110448.h78DkY1D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611110448.h78DkY1D-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/bus/ti-sysc.c:169 struct member 'revision_doubleword' not described in 'sysc'
>> Warning: drivers/bus/ti-sysc.c:169 struct member 'revision_doubleword' not described in 'sysc'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
