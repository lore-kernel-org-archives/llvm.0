Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D56B934752F;
	Wed, 13 May 2026 04:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778645987; cv=none; b=MMQJt7QlJvRjxG+K2hPWKilTASEIuDxpIHjWg0TMgm/sSuegsMnyZYMjf39JcDEWk+BzTYNz5aXF3lSS37eokiX730b3LkF/BnYLneIxUr+pV06zSCPcNMz4OMYuxgfjBi9vdLsAnpOtNwJI8Hm0Bmwnn1pL8MgN7HztPt99xpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778645987; c=relaxed/simple;
	bh=Rnee8NAwRXRr/4sLd4W0aqMpfxXARj0vuCYq9oaaF60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzNQs3BO9Xob7j2eYSjIwQZg+4Gh5jUHN7BOimDPIYlhhgasgOoTSdDWB+AAnZPcNCc0WIWaCp7HaAzZ8mjSQR5BboHKC1056YfObcjsxaWs2Idmcpyi0jz1BJ/pg7Ab3eEva9fsiJmIwkWkFQsUZfHeAWdIPOnvhyttGxyXxwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKj0X6vF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKj0X6vF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778645985; x=1810181985;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Rnee8NAwRXRr/4sLd4W0aqMpfxXARj0vuCYq9oaaF60=;
  b=FKj0X6vF388iNHQS3CZ/L+Y2Aqy1f1N9G5Hm2VN+RDGznhraZnBh282A
   BFFXkKMx7wfuCOzib6RQqNHjsGXx9lHmXrakaafbSBRgpBbk/Yhfizt6h
   n5WousH9JgqvBqfUf646QicqEMHQiZaM4OFWrXtsN1HW6ShjGGGFkl770
   7e2IMiPaDce7gU9roQ7GEDsZUrxyJ+bBztCSiHCHG/cvnLH3iomxXcXtk
   lxgcTyBq7qbz2o8rx+jJeALeDA4xHCYmwBFsZK+79HydEaUTUqD9OJVmy
   1xDKq5u9Sr7jC2x9HNJhlkg1va06zrQtBYjGzXUkyaRQx6O8wk8ivzczu
   A==;
X-CSE-ConnectionGUID: hyXxT2Q1RMKRj4mrZcoSqQ==
X-CSE-MsgGUID: bDxD8l/7SA2GLUQ5bZmoGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="97132525"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="97132525"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 21:19:44 -0700
X-CSE-ConnectionGUID: YHOUdzTdR0WYfEX9Kwo+7Q==
X-CSE-MsgGUID: grRUPO5PRLiNloBeJGlFJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; 
   d="scan'208";a="239779683"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 May 2026 21:19:41 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wN14M-000000003Pd-2np0;
	Wed, 13 May 2026 04:19:38 +0000
Date: Wed, 13 May 2026 12:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Harshit Shaw <shawharshit116@gmail.com>, andriy.shevchenko@intel.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	gregkh@linuxfoundation.org, error27@gmail.com, deller@gmx.de,
	chintanlike@gmail.com, tzimmermann@suse.de,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Harshit Shaw <shawharshit116@gmail.com>
Subject: Re: [PATCH v3] staging: fbtft: convert sysfs attributes to use
 ATTRIBUTE_GROUPS
Message-ID: <202605131232.m3YE1tEv-lkp@intel.com>
References: <20260512200104.19002-1-shawharshit116@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512200104.19002-1-shawharshit116@gmail.com>

Hi Harshit,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Harshit-Shaw/staging-fbtft-convert-sysfs-attributes-to-use-ATTRIBUTE_GROUPS/20260513-044051
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260512200104.19002-1-shawharshit116%40gmail.com
patch subject: [PATCH v3] staging: fbtft: convert sysfs attributes to use ATTRIBUTE_GROUPS
config: powerpc64-randconfig-002-20260513 (https://download.01.org/0day-ci/archive/20260513/202605131232.m3YE1tEv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605131232.m3YE1tEv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605131232.m3YE1tEv-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/staging/fbtft/fb_ssd1305.c:198:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     198 | FBTFT_REGISTER_DRIVER(DRVNAME, "solomon,ssd1305", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_ssd1305.c:198:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     198 | FBTFT_REGISTER_DRIVER(DRVNAME, "solomon,ssd1305", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   drivers/staging/fbtft/fb_ssd1305.c:198:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     198 | FBTFT_REGISTER_DRIVER(DRVNAME, "solomon,ssd1305", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_ssd1305.c:198:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     198 | FBTFT_REGISTER_DRIVER(DRVNAME, "solomon,ssd1305", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   4 errors generated.
--
   drivers/staging/fbtft/fb_upd161704.c:175:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     175 | FBTFT_REGISTER_DRIVER(DRVNAME, "nec,upd161704", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_upd161704.c:175:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     175 | FBTFT_REGISTER_DRIVER(DRVNAME, "nec,upd161704", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   drivers/staging/fbtft/fb_upd161704.c:175:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     175 | FBTFT_REGISTER_DRIVER(DRVNAME, "nec,upd161704", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_upd161704.c:175:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     175 | FBTFT_REGISTER_DRIVER(DRVNAME, "nec,upd161704", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   4 errors generated.
--
   drivers/staging/fbtft/fb_tls8204.c:153:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     153 | FBTFT_REGISTER_DRIVER(DRVNAME, "teralane,tls8204", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_tls8204.c:153:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     153 | FBTFT_REGISTER_DRIVER(DRVNAME, "teralane,tls8204", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   drivers/staging/fbtft/fb_tls8204.c:153:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     153 | FBTFT_REGISTER_DRIVER(DRVNAME, "teralane,tls8204", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_tls8204.c:153:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     153 | FBTFT_REGISTER_DRIVER(DRVNAME, "teralane,tls8204", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   4 errors generated.
--
   drivers/staging/fbtft/fb_ili9341.c:136:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     136 | FBTFT_REGISTER_SPI_DRIVER(DRVNAME, "ilitek", "ili9341", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:368:11: note: expanded from macro 'FBTFT_REGISTER_SPI_DRIVER'
     368 |                                                                                 \
         |                                                                                 ^
     369 | FBTFT_SPI_DRIVER(_name, _comp_vend "," _comp_dev, _display, spi_ids)            \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_ili9341.c:136:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     136 | FBTFT_REGISTER_SPI_DRIVER(DRVNAME, "ilitek", "ili9341", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:368:11: note: expanded from macro 'FBTFT_REGISTER_SPI_DRIVER'
     368 |                                                                                 \
         |                                                                                 ^
     369 | FBTFT_SPI_DRIVER(_name, _comp_vend "," _comp_dev, _display, spi_ids)            \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   2 errors generated.
--
   drivers/staging/fbtft/fb_st7735r.c:165:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     165 | FBTFT_REGISTER_DRIVER(DRVNAME, "sitronix,st7735r", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_st7735r.c:165:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     165 | FBTFT_REGISTER_DRIVER(DRVNAME, "sitronix,st7735r", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   drivers/staging/fbtft/fb_st7735r.c:165:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     165 | FBTFT_REGISTER_DRIVER(DRVNAME, "sitronix,st7735r", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_st7735r.c:165:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     165 | FBTFT_REGISTER_DRIVER(DRVNAME, "sitronix,st7735r", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   4 errors generated.
--
   drivers/staging/fbtft/fb_hx8357d.c:178:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     178 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8357d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_hx8357d.c:178:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     178 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8357d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   drivers/staging/fbtft/fb_hx8357d.c:178:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     178 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8357d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_hx8357d.c:178:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     178 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8357d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   4 errors generated.
--
   drivers/staging/fbtft/fb_hx8347d.c:174:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     174 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8347d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_hx8347d.c:174:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     174 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8347d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   drivers/staging/fbtft/fb_hx8347d.c:174:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     174 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8347d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_hx8347d.c:174:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     174 | FBTFT_REGISTER_DRIVER(DRVNAME, "himax,hx8347d", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   4 errors generated.
--
   drivers/staging/fbtft/fb_uc1611.c:325:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     325 | FBTFT_REGISTER_DRIVER(DRVNAME, "ultrachip,uc1611", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_uc1611.c:325:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     325 | FBTFT_REGISTER_DRIVER(DRVNAME, "ultrachip,uc1611", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:323:13: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     323 |                                                                            \
         |                                                                            ^
     324 | FBTFT_SPI_DRIVER(_name, _compatible, _display, NULL)                       \
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:301:17: note: expanded from macro '\
   FBTFT_SPI_DRIVER'
     301 |                 .dev_groups = fbtft_groups,                                     \
         |                               ^~~~~~~~~~~~
   drivers/staging/fbtft/fb_uc1611.c:325:1: error: use of undeclared identifier 'fbtft_groups'; did you mean 'set_groups'?
     325 | FBTFT_REGISTER_DRIVER(DRVNAME, "ultrachip,uc1611", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   include/linux/cred.h:70:13: note: 'set_groups' declared here
      70 | extern void set_groups(struct cred *, struct group_info *);
         |             ^
>> drivers/staging/fbtft/fb_uc1611.c:325:1: error: incompatible pointer types initializing 'const struct attribute_group **' with an expression of type 'void (struct cred *, struct group_info *)' [-Wincompatible-pointer-types]
     325 | FBTFT_REGISTER_DRIVER(DRVNAME, "ultrachip,uc1611", &display);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft.h:331:17: note: expanded from macro 'FBTFT_REGISTER_DRIVER'
     331 |                 .dev_groups = fbtft_groups,                                \
         |                               ^~~~~~~~~~~~
   4 errors generated.
..


vim +198 drivers/staging/fbtft/fb_ssd1305.c

5795354f75132a Alexey Mednyy 2016-01-27  197  
5795354f75132a Alexey Mednyy 2016-01-27 @198  FBTFT_REGISTER_DRIVER(DRVNAME, "solomon,ssd1305", &display);
5795354f75132a Alexey Mednyy 2016-01-27  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
