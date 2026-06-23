Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B5030594F;
	Tue, 23 Jun 2026 13:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782220591; cv=none; b=pjUBa9M6F8PXuDyzK6e3at5ObGaV8P2na8zvPEDicsb+G1RpG12FOzNl4SCHaKIAF5IWwBmkKM2ElsgTzNb2v/yVJY2f2PpF3RzKTWoZCuq2NqjXAddtasjI1PUMYgDcvrDfDXkul7cwaBltJjoWMGXK08MgXVJEE1gee/KckpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782220591; c=relaxed/simple;
	bh=+1DwLqgnq1+sfIxHjus5jTDOrPOMlb3Yw2wOwmeLINA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CjmF7hDVQR2PUYd6PzONlhx9DMto9PKam2/0GkmFnnSqMwcDR9mo/rddmNY5uCIxj8MojakzFjOQgwtvbEoYnYbv8juK+OXFfoEZm3/yBoqXO/llTcIq6cqENm/BlFU9zeS8VUyjdoUkWKcmZSY9ty+p3T3vHhfZkB0AnTV2SZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIRYt5qk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIRYt5qk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782220589; x=1813756589;
  h=date:from:to:cc:subject:message-id;
  bh=+1DwLqgnq1+sfIxHjus5jTDOrPOMlb3Yw2wOwmeLINA=;
  b=FIRYt5qkOZPi0a/UfI56ly16O1eNLBAFCEBPHgLBhcKUKtRa7FsvLEjp
   gU2rjBPy7sSxL/xjslMW9VtzbYmoHFzofAI7uSQJtJlyQ+4PdU3sNQVUH
   gU7tdXU13tNcnvuc5nGKRabFgJQ+5h/VbvcDtm8mRYRSSC5LjpgN53cyH
   YzZdvJEGFfl8Z76+7kN4p9fFG8sU99tlUEGrsqEUdeUEJ6MmpcH0KIoHW
   LmeFzZFmHqfHVkVTmg5wgKN48aPL7Bd0pcGV/0GNVAnaEtUsOX5qIpqug
   rQiS379OTsnFikG8DvJUBz9ClG3w0hO8SxVNJLYq6yeDaiJWWQVITjTtN
   Q==;
X-CSE-ConnectionGUID: dU7gj4AEQdeq9J9ksvYbeA==
X-CSE-MsgGUID: lgq0BqfjQOCXFp5hWM/C4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="86868427"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="86868427"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 06:16:29 -0700
X-CSE-ConnectionGUID: bIhMJrZ1RVe2BbIjlYLSuA==
X-CSE-MsgGUID: +y238GU4TUWs762+q7SQeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="273214998"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Jun 2026 06:16:27 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wc0zI-000000002Xt-1gXf;
	Tue, 23 Jun 2026 13:16:24 +0000
Date: Tue, 23 Jun 2026 21:16:08 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Winkler <rwinkler@internships.antmicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Gabriel Somlo <gsomlo@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [litex-hub:litex-rebase 7/15]
 drivers/i2c/busses/i2c-litex.c:119:2: error: call to undeclared library
 function 'strncpy' with type 'char *(char *, const char *, __size_t)' (aka
 'char *(char *, const char *, unsigned int)'); ISO C99 and later do not
 support implicit function declaratio...
Message-ID: <202606232127.nAck8Dgj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   c13bee0670f8bcfe9e289c42a42a551462e8c5df
commit: 0feffc97be8ca96055d732a53f8946c9eccb3527 [7/15] LiteX: driver for I2CMaster
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606232127.nAck8Dgj-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606232127.nAck8Dgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606232127.nAck8Dgj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/i2c/busses/i2c-litex.c:119:2: error: call to undeclared library function 'strncpy' with type 'char *(char *, const char *, __size_t)' (aka 'char *(char *, const char *, unsigned int)'); ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     119 |         strncpy(i2c_s->adapter.name, "litex_i2c_adapter",
         |         ^
   drivers/i2c/busses/i2c-litex.c:119:2: note: include the header <string.h> or explicitly provide a declaration for 'strncpy'
   1 error generated.


vim +119 drivers/i2c/busses/i2c-litex.c

    93	
    94	static int litex_i2c_probe(struct platform_device *pdev)
    95	{
    96		struct device_node *node = pdev->dev.of_node;
    97		void __iomem *membase;
    98		struct litex_i2c *i2c_s;
    99		struct resource *res;
   100	
   101		if (!node)
   102			return -ENODEV;
   103	
   104		i2c_s = devm_kzalloc(&pdev->dev, sizeof(*i2c_s), GFP_KERNEL);
   105		if (!i2c_s)
   106			return -ENOMEM;
   107	
   108		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   109		if (!res)
   110			return -EBUSY;
   111	
   112		membase = devm_of_iomap(&pdev->dev, node, 0, &res->end);
   113		if (IS_ERR_OR_NULL(membase))
   114			return -EIO;
   115	
   116		i2c_s->reg_w = membase + OFFSET_REG_W;
   117		i2c_s->reg_r = membase + OFFSET_REG_R;
   118	
 > 119		strncpy(i2c_s->adapter.name, "litex_i2c_adapter",
   120			sizeof(i2c_s->adapter.name));
   121		i2c_s->adapter.owner        = THIS_MODULE;
   122		i2c_s->adapter.algo_data    = &i2c_s->algo_data;
   123		i2c_s->adapter.dev.parent   = &pdev->dev;
   124		i2c_s->adapter.dev.of_node  = node;
   125		i2c_s->algo_data.data       = i2c_s;
   126	
   127		i2c_s->algo_data.setsda  = litex_i2c_setsda;
   128		i2c_s->algo_data.setscl  = litex_i2c_setscl;
   129		i2c_s->algo_data.getsda  = litex_i2c_getsda;
   130		i2c_s->algo_data.getscl  = NULL;
   131		i2c_s->algo_data.udelay  = DRIVER_ALGO_BIT_UDELAY;
   132		i2c_s->algo_data.timeout = HZ;
   133	
   134		platform_set_drvdata(pdev, i2c_s);
   135		return i2c_bit_add_bus(&i2c_s->adapter);
   136	}
   137	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
