Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E42B258CE5;
	Sat, 23 May 2026 21:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779571673; cv=none; b=YVH0LcUyURUmBzdLHzs3EhwYd18GILdM3aJxau3E3hZUlbExZz2p9aXE0DuXivexF5L/XBn6CXEOTGTJIII7Tdd1mil9l0/9UyubAHPimtuS9rjl1kheZ6P9io3mpZxJmShFwuU55PWmN4X7fKaOunHG52mngKnmcHwC5+rm+zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779571673; c=relaxed/simple;
	bh=8IYUK5xq56efqx6Vuxx31NEaVmmezh5usu/pTlFA3xE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4W8b55QIKrRq2G6cWNMJjI3o2eYpjxbk2bkaMwXrvdW7P9KS9AQvuFawPkGrwl5GSFPBTHpnML4vj3T3xdaxXzQKhHTkxxuRHoD8hLb56DT1S76VULMNKP0ZRlTs/zv9ebIGYubpI8bGGmHC5+G/hvVQafm3oaBdwtTPgUUdxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLpUYDyf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLpUYDyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779571671; x=1811107671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8IYUK5xq56efqx6Vuxx31NEaVmmezh5usu/pTlFA3xE=;
  b=eLpUYDyf9XNazdoY1W2UoqJjaCRo+m53RpPE+Dn4YFL19ZaKMM35Rg7z
   D1g+MzSJSLyNZABH6ESNxqbohqcBruAPTGc2ssVLyicPZYxWZammPUpFS
   qGKEHoEH3l7n8MvJfytgJQfNv+2xugbGtROdk8rNFYBcIpDeQiepqnWoz
   UQSQvo8KDEl7gPZY65N+kDrZkssUmBXer0nSyzcxp+aEVSIyrhiTzziK9
   MVo3GyWv4bnAqXqFfQ6RjPJImMG2xPsVv97UR3/8Wkr2xaMiaMQYJ0zNJ
   GE/qo7szvAEcK6qf6B9AY7lED1a35oi9vTGPtVkdCnk+yx9epn6B2OW2m
   Q==;
X-CSE-ConnectionGUID: 8NHKSHVWRyWUsvnxAV5H+g==
X-CSE-MsgGUID: kibLw1JtQPGd/1pbx7JtXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="97882318"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="97882318"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 14:27:51 -0700
X-CSE-ConnectionGUID: F3WNPhk3ShC+F7vi76nyDQ==
X-CSE-MsgGUID: +1KW+9XbQC+0Mgic5P6xIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="237014075"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 May 2026 14:27:48 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQtsn-000000000M1-3UPP;
	Sat, 23 May 2026 21:27:45 +0000
Date: Sun, 24 May 2026 05:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: Diego Fernando Mancera =?iso-8859-1?Q?G=F3mez?= <diegomancera.dev@gmail.com>,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	m.steinmoetzger@gmail.com, guojy.bj@gmail.com,
	straube.linux@gmail.com, error27@gmail.com,
	linux-kernel@vger.kernel.org,
	Diego Fernando Mancera =?iso-8859-1?Q?G=F3mez?= <diegomancera.dev@gmail.com>
Subject: Re: [PATCH] staging: sm750fb: add const to g_fbmode array
Message-ID: <202605240543.MkxvjE7m-lkp@intel.com>
References: <20260521210523.133725-2-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521210523.133725-2-diegomancera.dev@gmail.com>

Hi Diego,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Diego-Fernando-Mancera-G-mez/staging-sm750fb-add-const-to-g_fbmode-array/20260522-050816
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260521210523.133725-2-diegomancera.dev%40gmail.com
patch subject: [PATCH] staging: sm750fb: add const to g_fbmode array
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260524/202605240543.MkxvjE7m-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240543.MkxvjE7m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240543.MkxvjE7m-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/sm750fb/sm750.c:773:19: error: cannot assign to variable 'g_fbmode' with const-qualified type 'const char *const[2]'
     773 |                 g_fbmode[index] = g_def_fbmode;
         |                 ~~~~~~~~~~~~~~~ ^
   drivers/staging/sm750fb/sm750.c:24:27: note: variable 'g_fbmode' declared const here
      24 | static const char * const g_fbmode[] = {NULL, NULL};
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/sm750fb/sm750.c:775:20: error: cannot assign to variable 'g_fbmode' with const-qualified type 'const char *const[2]'
     775 |                         g_fbmode[index] = g_fbmode[0];
         |                         ~~~~~~~~~~~~~~~ ^
   drivers/staging/sm750fb/sm750.c:24:27: note: variable 'g_fbmode' declared const here
      24 | static const char * const g_fbmode[] = {NULL, NULL};
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/sm750fb/sm750.c:884:17: error: cannot assign to variable 'g_fbmode' with const-qualified type 'const char *const[2]'
     884 |                                 g_fbmode[0] = opt;
         |                                 ~~~~~~~~~~~ ^
   drivers/staging/sm750fb/sm750.c:24:27: note: variable 'g_fbmode' declared const here
      24 | static const char * const g_fbmode[] = {NULL, NULL};
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/sm750fb/sm750.c:888:17: error: cannot assign to variable 'g_fbmode' with const-qualified type 'const char *const[2]'
     888 |                                 g_fbmode[1] = opt;
         |                                 ~~~~~~~~~~~ ^
   drivers/staging/sm750fb/sm750.c:24:27: note: variable 'g_fbmode' declared const here
      24 | static const char * const g_fbmode[] = {NULL, NULL};
         | ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +773 drivers/staging/sm750fb/sm750.c

81dee67e215b23f Sudip Mukherjee      2015-03-03  707  
81dee67e215b23f Sudip Mukherjee      2015-03-03  708  static int lynxfb_set_fbinfo(struct fb_info *info, int index)
81dee67e215b23f Sudip Mukherjee      2015-03-03  709  {
81dee67e215b23f Sudip Mukherjee      2015-03-03  710  	int i;
81dee67e215b23f Sudip Mukherjee      2015-03-03  711  	struct lynxfb_par *par;
e359b6a863e19f2 Mike Rapoport        2015-10-26  712  	struct sm750_dev *sm750_dev;
81dee67e215b23f Sudip Mukherjee      2015-03-03  713  	struct lynxfb_crtc *crtc;
81dee67e215b23f Sudip Mukherjee      2015-03-03  714  	struct lynxfb_output *output;
81dee67e215b23f Sudip Mukherjee      2015-03-03  715  	struct fb_var_screeninfo *var;
81dee67e215b23f Sudip Mukherjee      2015-03-03  716  	struct fb_fix_screeninfo *fix;
81dee67e215b23f Sudip Mukherjee      2015-03-03  717  
81dee67e215b23f Sudip Mukherjee      2015-03-03  718  	const struct fb_videomode *pdb[] = {
81dee67e215b23f Sudip Mukherjee      2015-03-03  719  		lynx750_ext, NULL, vesa_modes,
81dee67e215b23f Sudip Mukherjee      2015-03-03  720  	};
81dee67e215b23f Sudip Mukherjee      2015-03-03  721  	int cdb[] = {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
d0856045f0e9fc9 Hungyu Lin           2026-04-01  722  	static const char * const fix_id[2] = {
81dee67e215b23f Sudip Mukherjee      2015-03-03  723  		"sm750_fb1", "sm750_fb2",
81dee67e215b23f Sudip Mukherjee      2015-03-03  724  	};
81dee67e215b23f Sudip Mukherjee      2015-03-03  725  
81dee67e215b23f Sudip Mukherjee      2015-03-03  726  	int ret, line_length;
81dee67e215b23f Sudip Mukherjee      2015-03-03  727  
81dee67e215b23f Sudip Mukherjee      2015-03-03  728  	ret = 0;
81dee67e215b23f Sudip Mukherjee      2015-03-03  729  	par = (struct lynxfb_par *)info->par;
e359b6a863e19f2 Mike Rapoport        2015-10-26  730  	sm750_dev = par->dev;
81dee67e215b23f Sudip Mukherjee      2015-03-03  731  	crtc = &par->crtc;
81dee67e215b23f Sudip Mukherjee      2015-03-03  732  	output = &par->output;
81dee67e215b23f Sudip Mukherjee      2015-03-03  733  	var = &info->var;
81dee67e215b23f Sudip Mukherjee      2015-03-03  734  	fix = &info->fix;
81dee67e215b23f Sudip Mukherjee      2015-03-03  735  
81dee67e215b23f Sudip Mukherjee      2015-03-03  736  	/* set index */
81dee67e215b23f Sudip Mukherjee      2015-03-03  737  	par->index = index;
81dee67e215b23f Sudip Mukherjee      2015-03-03  738  	output->channel = &crtc->channel;
81dee67e215b23f Sudip Mukherjee      2015-03-03  739  	sm750fb_set_drv(par);
81dee67e215b23f Sudip Mukherjee      2015-03-03  740  
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  741  	/*
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  742  	 * set current cursor variable and proc pointer,
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  743  	 * must be set after crtc member initialized
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  744  	 */
fdc234d85210d91 Benjamin Philip      2021-07-28  745  	crtc->cursor.offset = crtc->o_screen + crtc->vidmem_size - 1024;
e359b6a863e19f2 Mike Rapoport        2015-10-26  746  	crtc->cursor.mmio = sm750_dev->pvReg +
e359b6a863e19f2 Mike Rapoport        2015-10-26  747  		0x800f0 + (int)crtc->channel * 0x140;
81dee67e215b23f Sudip Mukherjee      2015-03-03  748  
cd33da26036ea54 Christopher Carbone  2022-08-23  749  	crtc->cursor.max_h = 64;
cd33da26036ea54 Christopher Carbone  2022-08-23  750  	crtc->cursor.max_w = 64;
39f9137268ee3df Benjamin Philip      2021-07-26  751  	crtc->cursor.size = crtc->cursor.max_h * crtc->cursor.max_w * 2 / 8;
f50b4602fea62fe Jennifer Guo         2026-05-09  752  	crtc->cursor.vstart = sm750_dev->vmem + crtc->cursor.offset;
81dee67e215b23f Sudip Mukherjee      2015-03-03  753  
3de08a2d14ff8c7 Lorenzo Stoakes      2015-03-20  754  	memset_io(crtc->cursor.vstart, 0, crtc->cursor.size);
f7c8a046577e09d Thomas Zimmermann    2023-11-27  755  	if (!g_hwcursor)
52d0744d751d8f1 Arnd Bergmann        2016-11-09  756  		sm750_hw_cursor_disable(&crtc->cursor);
81dee67e215b23f Sudip Mukherjee      2015-03-03  757  
81dee67e215b23f Sudip Mukherjee      2015-03-03  758  	/* set info->fbops, must be set before fb_find_mode */
e359b6a863e19f2 Mike Rapoport        2015-10-26  759  	if (!sm750_dev->accel_off) {
81dee67e215b23f Sudip Mukherjee      2015-03-03  760  		/* use 2d acceleration */
f7c8a046577e09d Thomas Zimmermann    2023-11-27  761  		if (!g_hwcursor)
f7c8a046577e09d Thomas Zimmermann    2023-11-27  762  			info->fbops = &lynxfb_ops_accel;
f7c8a046577e09d Thomas Zimmermann    2023-11-27  763  		else
f7c8a046577e09d Thomas Zimmermann    2023-11-27  764  			info->fbops = &lynxfb_ops_accel_with_cursor;
f7c8a046577e09d Thomas Zimmermann    2023-11-27  765  	} else {
f7c8a046577e09d Thomas Zimmermann    2023-11-27  766  		if (!g_hwcursor)
81dee67e215b23f Sudip Mukherjee      2015-03-03  767  			info->fbops = &lynxfb_ops;
f7c8a046577e09d Thomas Zimmermann    2023-11-27  768  		else
f7c8a046577e09d Thomas Zimmermann    2023-11-27  769  			info->fbops = &lynxfb_ops_with_cursor;
f7c8a046577e09d Thomas Zimmermann    2023-11-27  770  	}
81dee67e215b23f Sudip Mukherjee      2015-03-03  771  
81dee67e215b23f Sudip Mukherjee      2015-03-03  772  	if (!g_fbmode[index]) {
81dee67e215b23f Sudip Mukherjee      2015-03-03 @773  		g_fbmode[index] = g_def_fbmode;
81dee67e215b23f Sudip Mukherjee      2015-03-03  774  		if (index)
81dee67e215b23f Sudip Mukherjee      2015-03-03  775  			g_fbmode[index] = g_fbmode[0];
81dee67e215b23f Sudip Mukherjee      2015-03-03  776  	}
81dee67e215b23f Sudip Mukherjee      2015-03-03  777  
81dee67e215b23f Sudip Mukherjee      2015-03-03  778  	for (i = 0; i < 3; i++) {
81dee67e215b23f Sudip Mukherjee      2015-03-03  779  		ret = fb_find_mode(var, info, g_fbmode[index],
81dee67e215b23f Sudip Mukherjee      2015-03-03  780  				   pdb[i], cdb[i], NULL, 8);
81dee67e215b23f Sudip Mukherjee      2015-03-03  781  
db7fb3588ab4920 Artem Lytkin         2026-02-23  782  		if (ret == 1 || ret == 2)
81dee67e215b23f Sudip Mukherjee      2015-03-03  783  			break;
81dee67e215b23f Sudip Mukherjee      2015-03-03  784  	}
81dee67e215b23f Sudip Mukherjee      2015-03-03  785  
81dee67e215b23f Sudip Mukherjee      2015-03-03  786  	/* set par */
81dee67e215b23f Sudip Mukherjee      2015-03-03  787  	par->info = info;
81dee67e215b23f Sudip Mukherjee      2015-03-03  788  
81dee67e215b23f Sudip Mukherjee      2015-03-03  789  	/* set info */
e3a3f9f5123683b Mike Rapoport        2015-10-26  790  	line_length = ALIGN((var->xres_virtual * var->bits_per_pixel / 8),
e3a3f9f5123683b Mike Rapoport        2015-10-26  791  			    crtc->line_pad);
81dee67e215b23f Sudip Mukherjee      2015-03-03  792  
81dee67e215b23f Sudip Mukherjee      2015-03-03  793  	info->pseudo_palette = &par->pseudo_palette[0];
cc59bde1c920ab6 Benjamin Philip      2021-07-28  794  	info->screen_base = crtc->v_screen;
81dee67e215b23f Sudip Mukherjee      2015-03-03  795  	info->screen_size = line_length * var->yres_virtual;
81dee67e215b23f Sudip Mukherjee      2015-03-03  796  
81dee67e215b23f Sudip Mukherjee      2015-03-03  797  	/* set info->fix */
81dee67e215b23f Sudip Mukherjee      2015-03-03  798  	fix->type = FB_TYPE_PACKED_PIXELS;
81dee67e215b23f Sudip Mukherjee      2015-03-03  799  	fix->type_aux = 0;
81dee67e215b23f Sudip Mukherjee      2015-03-03  800  	fix->xpanstep = crtc->xpanstep;
81dee67e215b23f Sudip Mukherjee      2015-03-03  801  	fix->ypanstep = crtc->ypanstep;
81dee67e215b23f Sudip Mukherjee      2015-03-03  802  	fix->ywrapstep = crtc->ywrapstep;
81dee67e215b23f Sudip Mukherjee      2015-03-03  803  	fix->accel = FB_ACCEL_SMI;
81dee67e215b23f Sudip Mukherjee      2015-03-03  804  
8c475735085a7db Tim Wassink          2025-12-21  805  	strscpy(fix->id, fix_id[index], sizeof(fix->id));
81dee67e215b23f Sudip Mukherjee      2015-03-03  806  
fdc234d85210d91 Benjamin Philip      2021-07-28  807  	fix->smem_start = crtc->o_screen + sm750_dev->vidmem_start;
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  808  	/*
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  809  	 * according to mmap experiment from user space application,
81dee67e215b23f Sudip Mukherjee      2015-03-03  810  	 * fix->mmio_len should not larger than virtual size
81dee67e215b23f Sudip Mukherjee      2015-03-03  811  	 * (xres_virtual x yres_virtual x ByPP)
81dee67e215b23f Sudip Mukherjee      2015-03-03  812  	 * Below line maybe buggy when user mmap fb dev node and write
81dee67e215b23f Sudip Mukherjee      2015-03-03  813  	 * data into the bound over virtual size
d11ac7cbcc266c6 Sudip Mukherjee      2015-08-07  814  	 */
81dee67e215b23f Sudip Mukherjee      2015-03-03  815  	fix->smem_len = crtc->vidmem_size;
81dee67e215b23f Sudip Mukherjee      2015-03-03  816  	info->screen_size = fix->smem_len;
81dee67e215b23f Sudip Mukherjee      2015-03-03  817  	fix->line_length = line_length;
e359b6a863e19f2 Mike Rapoport        2015-10-26  818  	fix->mmio_start = sm750_dev->vidreg_start;
e359b6a863e19f2 Mike Rapoport        2015-10-26  819  	fix->mmio_len = sm750_dev->vidreg_size;
b610e1193a917f4 Matej Dujava         2020-04-30  820  
b610e1193a917f4 Matej Dujava         2020-04-30  821  	lynxfb_set_visual_mode(info);
81dee67e215b23f Sudip Mukherjee      2015-03-03  822  
81dee67e215b23f Sudip Mukherjee      2015-03-03  823  	/* set var */
81dee67e215b23f Sudip Mukherjee      2015-03-03  824  	var->activate = FB_ACTIVATE_NOW;
81dee67e215b23f Sudip Mukherjee      2015-03-03  825  	var->accel_flags = 0;
81dee67e215b23f Sudip Mukherjee      2015-03-03  826  	var->vmode = FB_VMODE_NONINTERLACED;
81dee67e215b23f Sudip Mukherjee      2015-03-03  827  
61c507cf652da1b Michel von Czettritz 2015-03-26  828  	ret = fb_alloc_cmap(&info->cmap, 256, 0);
61c507cf652da1b Michel von Czettritz 2015-03-26  829  	if (ret < 0) {
fbab250eb51d6d6 Artem Lytkin         2026-02-07  830  		dev_err(info->device, "Could not allocate memory for cmap.\n");
81dee67e215b23f Sudip Mukherjee      2015-03-03  831  		goto exit;
81dee67e215b23f Sudip Mukherjee      2015-03-03  832  	}
81dee67e215b23f Sudip Mukherjee      2015-03-03  833  
81dee67e215b23f Sudip Mukherjee      2015-03-03  834  exit:
81dee67e215b23f Sudip Mukherjee      2015-03-03  835  	lynxfb_ops_check_var(var, info);
81dee67e215b23f Sudip Mukherjee      2015-03-03  836  	return ret;
81dee67e215b23f Sudip Mukherjee      2015-03-03  837  }
81dee67e215b23f Sudip Mukherjee      2015-03-03  838  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
