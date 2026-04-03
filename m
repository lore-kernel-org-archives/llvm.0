Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F72B37D101;
	Fri,  3 Apr 2026 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205604; cv=none; b=j8ceqkfA3v5uxJuZwtLMANflX253iMvYruqxU/EZaZauvBXnT8MCNs1H9G88eHptjreAkGSKtep4fnfro5SykTMSd5AqeeJHQX7nM3e8lKuGr5gDUhZMDloDb6QMsWhT1XH3ZPh3Z/HhqV0cQGKIqE1ummIPpd6ZJ2HzDt1PBS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205604; c=relaxed/simple;
	bh=qE1aYuqUlE93FXWNkFbP62ja+EW3XA/Ya4PvU2wlXOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmKO/nl0gxPr4AhbPnBZShRYviS2V4qjCEo01As6+UI6NOCCtmSiLxS+3NgXFZr1BVEYeUzlua2zw4n+OmRxN7b6hn4JNcBqodvARWiXERLAwXLoTjO+GYZlf2z501PkK3ZNfcoiy+Wflt7aDBUEFQ8t5wBUuoCrjFU2DSvmrog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZXlYrtRP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZXlYrtRP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205604; x=1806741604;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qE1aYuqUlE93FXWNkFbP62ja+EW3XA/Ya4PvU2wlXOI=;
  b=ZXlYrtRP8kWedwb+NfwEi3JgJDEUo+8Sf+/VsICqyeO+t0ZVVfXyMDDB
   tWMK0tpyFF6M66OMwWC1j7StIDmkSz6D9iWtwSf5SoMGoXs5gKSKQNa/u
   7zgVapGIweIDtJAm4k6vCxl2yHLTVGGpQSH9Zp1YfdjR3YoW0n7dfk8Sn
   4Pvdkse4d1gWURQb38OhPdYAeW5BbfhWjm2iW30sIScvZ5NcwDEzCckGA
   KS7qDrBXXZUGLCmbvEsNe2Ef3R/37DRePMqoGRhrSypqfmsHYOOCcIgmK
   1iv5vJnLhzhBPFIqcuA3PDr52+PwFqI26llCVkteGZrJ5ukRyFujqvJNn
   Q==;
X-CSE-ConnectionGUID: W617i+1RQg+lqvG+FPv6nA==
X-CSE-MsgGUID: uSYgSfpwQGuvGw2dKufX/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76156562"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76156562"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:40:02 -0700
X-CSE-ConnectionGUID: NcQzPotSTqOM77lF7ZnhxQ==
X-CSE-MsgGUID: bOdGHcWoQYmSAvVkpedJdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="220570309"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Apr 2026 01:39:57 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a4H-0000000011Z-3Noi;
	Fri, 03 Apr 2026 08:39:53 +0000
Date: Fri, 3 Apr 2026 16:39:11 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Marek Vasut <marex@denx.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v2 02/12] drm/bridge: tc358762: Improce SYSCTRL register
 defines
Message-ID: <202604021223.FtCNpGqO-lkp@intel.com>
References: <20260327-tc358762-fixes-v2-2-3589d3c45f4a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-tc358762-fixes-v2-2-3589d3c45f4a@ideasonboard.com>

Hi Tomi,

kernel test robot noticed the following build errors:

[auto build test ERROR on 11439c4635edd669ae435eec308f4ab8a0804808]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/drm-bridge-tc358762-Clean-up-register-defines/20260328-164947
base:   11439c4635edd669ae435eec308f4ab8a0804808
patch link:    https://lore.kernel.org/r/20260327-tc358762-fixes-v2-2-3589d3c45f4a%40ideasonboard.com
patch subject: [PATCH v2 02/12] drm/bridge: tc358762: Improce SYSCTRL register defines
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260402/202604021223.FtCNpGqO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604021223.FtCNpGqO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604021223.FtCNpGqO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/tc358762.c:154:10: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     154 |                        FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
         |                        ^
   1 error generated.


vim +/FIELD_PREP +154 drivers/gpu/drm/bridge/tc358762.c

   127	
   128	static int tc358762_init(struct tc358762 *ctx)
   129	{
   130		u32 lcdctrl;
   131	
   132		tc358762_write(ctx, DSI_LANEENABLE,
   133			       DSI_LANEENABLE_L0EN | DSI_LANEENABLE_CLEN);
   134		tc358762_write(ctx, PPI_D0S_CLRSIPOCOUNT, 5);
   135		tc358762_write(ctx, PPI_D1S_CLRSIPOCOUNT, 5);
   136		tc358762_write(ctx, PPI_D0S_ATMR, 0);
   137		tc358762_write(ctx, PPI_D1S_ATMR, 0);
   138		tc358762_write(ctx, PPI_LPTXTIMECNT, LPX_PERIOD);
   139	
   140		tc358762_write(ctx, SPICMR, 0x00);
   141	
   142		lcdctrl = LCDCTRL_VSDELAY(1) | LCDCTRL_RGB888 |
   143			  LCDCTRL_UNK6 | LCDCTRL_VTGEN;
   144	
   145		if (ctx->mode.flags & DRM_MODE_FLAG_NHSYNC)
   146			lcdctrl |= LCDCTRL_HSPOL;
   147	
   148		if (ctx->mode.flags & DRM_MODE_FLAG_NVSYNC)
   149			lcdctrl |= LCDCTRL_VSPOL;
   150	
   151		tc358762_write(ctx, LCDCTRL, lcdctrl);
   152	
   153		tc358762_write(ctx, SYSCTRL,
 > 154			       FIELD_PREP(SYSCTRL_DPIDATA_IO_MASK, SYSCTRL_DPIDATA_IO_4MA) |
   155			       FIELD_PREP(SYSCTRL_DPISTB_IO_MASK, SYSCTRL_DPISTB_IO_4MA) |
   156			       FIELD_PREP(SYSCTRL_PCLKDIV_MASK, SYSCTRL_PCLKDIV_DIV_3));
   157	
   158		msleep(100);
   159	
   160		tc358762_write(ctx, PPI_STARTPPI, PPI_STARTPPI_STARTPPI);
   161		tc358762_write(ctx, DSI_STARTDSI, DSI_STARTDSI_STARTDSI);
   162	
   163		msleep(100);
   164	
   165		return tc358762_clear_error(ctx);
   166	}
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
