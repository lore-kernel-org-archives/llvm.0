Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254411EB3D;
	Sat, 15 Jun 2024 17:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718473356; cv=none; b=rQ1uKjpaFjrTQeERiRNf439sx8IvlaoFY8lTOJDyBmRpBtNLqSTZaP9YMLPNHttr91/a013mdO7Wa3ll+yOHBELn0BYITB9cKwe/447kwEjmDfpmquVC944ANpEqAlzIjQQiphpj1Koaxy8VYeva+vnWZqZwQCmGl2CBypkjn2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718473356; c=relaxed/simple;
	bh=0VUQB6pM3WQJPir8o/00tq+cNrVxxD0DNhSQZm3nEDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VpXQoUr0aja1NnVlBeyVSjFYbXgDyFwv6YoFXV+T+9lNQcdOF9ZGPH5x3G67oNl6PwgJURyjeb0QPxizuTVaWdRsH5EkW/I1F/JK+hTJlDp2/H6tdlj95wxTM+/P1xVoIhO0s7dX9hz7HwHYtNDqo9Rathm1nxif1zfOWGT+TwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwnxq+En; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwnxq+En"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718473354; x=1750009354;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0VUQB6pM3WQJPir8o/00tq+cNrVxxD0DNhSQZm3nEDk=;
  b=lwnxq+EnLwZeajmvxQd3eC3zoGlgz7tLKzlj8zqZlmmy7GuM2Eq7T94I
   LvEtVTx2rlMGLl9hG9ygN+QmEARn7jnS0f5MlSSd1wYlqDKW81KEQIlUz
   xs7LMaT7sj+BnYpP6tpX+m58ii6QD+N887Byf1lQ44Z63zw/KdUXcnk6L
   joFqqEtoeK68KR3Myq+u1Hhoxc0Ai5I1Kw9lZUjufmQuXCXfvv34K8Efh
   775roAvcJNtrSmsUgCSwtUdetDLOKeoHPaCy3vQuhgNoHRv4dOY+eAmk5
   KOtRH2tJOCrhtjj4OWrvtOym+NI2H0Ouy/U0uT+6DDfsLpNCVvP4sa+GR
   Q==;
X-CSE-ConnectionGUID: PogQY962Rm6bjTshZZDbBQ==
X-CSE-MsgGUID: WsB0cTlKQruKlC1bm8MR9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="37875118"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="37875118"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 10:42:33 -0700
X-CSE-ConnectionGUID: tIVc1G3TSQ2x2vzAOjAOAQ==
X-CSE-MsgGUID: GRaON1iaTRqs0XutZ0+6YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="72012304"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 15 Jun 2024 10:42:31 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIXQ5-0000LW-0w;
	Sat, 15 Jun 2024 17:42:29 +0000
Date: Sun, 16 Jun 2024 01:42:07 +0800
From: kernel test robot <lkp@intel.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 2997/5501] drivers/media/i2c/imx283.c:443:30:
 error: initializer element is not a compile-time constant
Message-ID: <202406160153.RvEj9c4I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6906a84c482f098d31486df8dc98cead21cce2d0
commit: ccb4eb4496fa94a9131c63ad0c412ebfe7f9ac35 [2997/5501] media: i2c: Add imx283 camera sensor driver
config: arm-randconfig-003-20240616 (https://download.01.org/0day-ci/archive/20240616/202406160153.RvEj9c4I-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160153.RvEj9c4I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160153.RvEj9c4I-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/imx283.c:443:30: error: initializer element is not a compile-time constant
                   .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx283.c:412:11: note: expanded from macro 'CENTERED_RECTANGLE'
                   .left = rect.left + ((rect.width - (_width)) / 2),      \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx283.c:492:30: error: initializer element is not a compile-time constant
                   .crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
                           ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/imx283.c:412:11: note: expanded from macro 'CENTERED_RECTANGLE'
                   .left = rect.left + ((rect.width - (_width)) / 2),      \
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +443 drivers/media/i2c/imx283.c

   409	
   410	#define CENTERED_RECTANGLE(rect, _width, _height)			\
   411		{								\
   412			.left = rect.left + ((rect.width - (_width)) / 2),	\
   413			.top = rect.top + ((rect.height - (_height)) / 2),	\
   414			.width = (_width),					\
   415			.height = (_height),					\
   416		}
   417	
   418	/* Mode configs */
   419	static const struct imx283_mode supported_modes_12bit[] = {
   420		{
   421			/* 20MPix 21.40 fps readout mode 0 */
   422			.mode = IMX283_MODE_0,
   423			.bpp = 12,
   424			.width = 5472,
   425			.height = 3648,
   426			.min_hmax = 5914, /* 887 @ 480MHz/72MHz */
   427			.min_vmax = 3793, /* Lines */
   428	
   429			.veff = 3694,
   430			.vst = 0,
   431			.vct = 0,
   432	
   433			.hbin_ratio = 1,
   434			.vbin_ratio = 1,
   435	
   436			/* 20.00 FPS */
   437			.default_hmax = 6000, /* 900 @ 480MHz/72MHz */
   438			.default_vmax = 4000,
   439	
   440			.min_shr = 11,
   441			.horizontal_ob = 96,
   442			.vertical_ob = 16,
 > 443			.crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
   444		},
   445		{
   446			/*
   447			 * Readout mode 2 : 2/2 binned mode (2736x1824)
   448			 */
   449			.mode = IMX283_MODE_2,
   450			.bpp = 12,
   451			.width = 2736,
   452			.height = 1824,
   453			.min_hmax = 2414, /* Pixels (362 * 480MHz/72MHz + padding) */
   454			.min_vmax = 3840, /* Lines */
   455	
   456			/* 50.00 FPS */
   457			.default_hmax = 2500, /* 375 @ 480MHz/72Mhz */
   458			.default_vmax = 3840,
   459	
   460			.veff = 1824,
   461			.vst = 0,
   462			.vct = 0,
   463	
   464			.hbin_ratio = 2,
   465			.vbin_ratio = 2,
   466	
   467			.min_shr = 12,
   468			.horizontal_ob = 48,
   469			.vertical_ob = 4,
   470	
   471			.crop = CENTERED_RECTANGLE(imx283_active_area, 5472, 3648),
   472		},
   473	};
   474	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
