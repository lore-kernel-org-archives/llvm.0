Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF0622E3F0
	for <llvm@lists.linux.dev>; Tue, 23 Jun 2026 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782221959; cv=none; b=QHSCxdFScILVatpZZOCsuDsJwlc3lmEbryjq9akLYRnVeDl6T//MTyDEx6XNIGtor2PreZxscwrZdjvxuwAL9aVhtDvyfANCxkOgRQ9O7ri3YnUbLH2Psb4YvSMNWwYcxN3szPwImzFNBIbywzEr2epBAQP30LyNtc51zGVqD78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782221959; c=relaxed/simple;
	bh=8MLEPyV55vpukal4JxO2VY2IlXpOWtWWjYs8zQiFC8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcjK3XO61pYmaCytlIvjWZ3MM7y2kzSSwHyX8MMgO9KWtd1adQs5a0uQBp3Zop246euB9sv3ZsgGgJRfDY9cwCs17gf4ni43cAUMb+z62Ca/JRmRDfOycltMAnD1j06Zj7XTPNnpCITzZ7k6pvtHcPrN479fOOfwZSNntrsRRj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7iaCDw4; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7iaCDw4"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aa68dbd44fso5735524e87.2
        for <llvm@lists.linux.dev>; Tue, 23 Jun 2026 06:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782221956; x=1782826756; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6wNYmYB+Hfq1vATWMUYnGFfcc+jSUuSsIIjRWiq5C1c=;
        b=S7iaCDw4onL1avchko3y8kPg7no+P2pZ0Y7iy0NUNiEK4Rl3k7jUrP7zZWiR3rvaLe
         m8+70ub0VRb5sTGzoU9ZLSZO8ZaHZZd9vS36L4p2Xz61CvyW5At1+4jqFKYkplkPepyc
         azXB/8AIPSt1oi6fpQfZUlb/9S5kBlKCKS6nMYK9EhzIbUohu4x87td+GDXALfKJAoEd
         /24MkgkTXt2k5IomgeFcm1+cCU8bBvsVGfD3RQgSACHAMMkH2jFLX9E6Dxt932jnLngu
         HpzdQXsiWMJaUNZhMhLu9ONdoseAL/fTDWjDUjeFE9slGXHAUCcMdVNUYEeKxLRUWMnv
         hVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782221956; x=1782826756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wNYmYB+Hfq1vATWMUYnGFfcc+jSUuSsIIjRWiq5C1c=;
        b=JM83Zw22WOcV5kyHyazLQ060lwWjgVN2NzTQbLhLGdZVy1VvvFAKw5CHMKHoCDWbVH
         97G5UM8V3XYAiwHITOysQf625Ai6jrpSx3DVfyQ9RKr4FKdcMa/mkMW5xbYWCcuyjZzx
         x2DFNaz2W2/7dwj95HJyxosYEZaPVbiHUXztfal6Gp4I1qds6gnzIV0Os5Xy7COZ6tvM
         2v9igjkNWnaHUok8dI50QEo0Ze1x2X6wwEopA3x402StoxU0dYC8JLH9p9ZNqg4dvAbV
         21WIEBvbveYOnUrf08LJMhtqlW8O72HyehXakwWuAoT0FZn9J/JtDM+/fkZ9s3wDU7cc
         cqEw==
X-Forwarded-Encrypted: i=1; AFNElJ9bXlvPsyCWS/jsa3qm999kdwsjk1IhPn+RWkfPLU0O77hfQXfFgG4Wb8lBkYgvKL3rer/i@lists.linux.dev
X-Gm-Message-State: AOJu0YzH9JUkKwcGVUld8+X/DEsIvARCgIzitZJUZx0ZWWlnaqFrTJCl
	DxxiTDWP9uR1hy3DFivtcnYlXPMN9SX4gyZXaMZl6XiDDdjKlmDMIJDA
X-Gm-Gg: AfdE7ckCDPpCXmAGI/6vNLm2YlTKYWG0xfdGSuPvMbugq/7dtfVX/wqaEgo35nu3wLL
	ggUy76pPrAvAuS/PPvtz6Ourr+yMhBlkxKwLRAiRpRYJX/X9dyEFd3OLnJcrvzusoYGM83T5oIG
	EIuENVXb8Q8QTS8DVky/Q5OBEXa0jQj0qjYaaVw3UNQmP+VOzNmbesSNuV3snPIH9tjSXiP37VL
	xXiw+UOVhqocSovv/BOFeNQHl6nxcfbi203n0hwxui+DbOBRFm0t94z4lc9qNy/JaaTuVb8RCQ8
	Tu896lJxwtqx989m6YHhoMSKIcKJow2TOUwXfh4OUFgrxx4mluG3zwkuVRFjWYihL3kKuUuzhwK
	YYSJCBp4vKfMWjct4mZoyh01nhQzH00tRsaTCpWy7iE6iZk1YvvN4rpjXm+dtuulP/6zePbpupd
	mN+MciCR3tgzfUfGjBig0LS7WkzguFb+BOJDodTgwEY+l2l0Sh
X-Received: by 2002:a05:6512:2c94:b0:5aa:7653:49b3 with SMTP id 2adb3069b0e04-5ae3e518188mr849928e87.32.1782221956148;
        Tue, 23 Jun 2026 06:39:16 -0700 (PDT)
Received: from glsmbp.wifi.local.cmu.edu (cmu-device2.nat.cmu.net. [128.2.149.252])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad6957a746sm805345e87.42.2026.06.23.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:39:15 -0700 (PDT)
Date: Tue, 23 Jun 2026 09:39:06 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Robert Winkler <rwinkler@internships.antmicro.com>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [litex-hub:litex-rebase 7/15]
 drivers/i2c/busses/i2c-litex.c:119:2: error: call to undeclared library
 function 'strncpy' with type 'char *(char *, const char *, __size_t)' (aka
 'char *(char *, const char *, unsigned int)'); ISO C99 and later do not
 support implicit function declaratio...
Message-ID: <ajqMem6ILfps_4tP@glsmbp.wifi.local.cmu.edu>
References: <202606232127.nAck8Dgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202606232127.nAck8Dgj-lkp@intel.com>
X-Clacks-Overhead: GNU Terry Pratchett

Thanks for the heads-up, I replaced `strncpy` with `strscpy`.

Best,
--Gabriel

On Tue, Jun 23, 2026 at 09:16:08PM +0800, kernel test robot wrote:
> tree:   https://github.com/litex-hub/linux litex-rebase
> head:   c13bee0670f8bcfe9e289c42a42a551462e8c5df
> commit: 0feffc97be8ca96055d732a53f8946c9eccb3527 [7/15] LiteX: driver for I2CMaster
> config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606232127.nAck8Dgj-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606232127.nAck8Dgj-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202606232127.nAck8Dgj-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> drivers/i2c/busses/i2c-litex.c:119:2: error: call to undeclared library function 'strncpy' with type 'char *(char *, const char *, __size_t)' (aka 'char *(char *, const char *, unsigned int)'); ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      119 |         strncpy(i2c_s->adapter.name, "litex_i2c_adapter",
>          |         ^
>    drivers/i2c/busses/i2c-litex.c:119:2: note: include the header <string.h> or explicitly provide a declaration for 'strncpy'
>    1 error generated.
> 
> 
> vim +119 drivers/i2c/busses/i2c-litex.c
> 
>     93	
>     94	static int litex_i2c_probe(struct platform_device *pdev)
>     95	{
>     96		struct device_node *node = pdev->dev.of_node;
>     97		void __iomem *membase;
>     98		struct litex_i2c *i2c_s;
>     99		struct resource *res;
>    100	
>    101		if (!node)
>    102			return -ENODEV;
>    103	
>    104		i2c_s = devm_kzalloc(&pdev->dev, sizeof(*i2c_s), GFP_KERNEL);
>    105		if (!i2c_s)
>    106			return -ENOMEM;
>    107	
>    108		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>    109		if (!res)
>    110			return -EBUSY;
>    111	
>    112		membase = devm_of_iomap(&pdev->dev, node, 0, &res->end);
>    113		if (IS_ERR_OR_NULL(membase))
>    114			return -EIO;
>    115	
>    116		i2c_s->reg_w = membase + OFFSET_REG_W;
>    117		i2c_s->reg_r = membase + OFFSET_REG_R;
>    118	
>  > 119		strncpy(i2c_s->adapter.name, "litex_i2c_adapter",
>    120			sizeof(i2c_s->adapter.name));
>    121		i2c_s->adapter.owner        = THIS_MODULE;
>    122		i2c_s->adapter.algo_data    = &i2c_s->algo_data;
>    123		i2c_s->adapter.dev.parent   = &pdev->dev;
>    124		i2c_s->adapter.dev.of_node  = node;
>    125		i2c_s->algo_data.data       = i2c_s;
>    126	
>    127		i2c_s->algo_data.setsda  = litex_i2c_setsda;
>    128		i2c_s->algo_data.setscl  = litex_i2c_setscl;
>    129		i2c_s->algo_data.getsda  = litex_i2c_getsda;
>    130		i2c_s->algo_data.getscl  = NULL;
>    131		i2c_s->algo_data.udelay  = DRIVER_ALGO_BIT_UDELAY;
>    132		i2c_s->algo_data.timeout = HZ;
>    133	
>    134		platform_set_drvdata(pdev, i2c_s);
>    135		return i2c_bit_add_bus(&i2c_s->adapter);
>    136	}
>    137	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
