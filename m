Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F043E764F;
	Fri, 11 Sep 2026 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128553; cv=none; b=PwqyoYMJZFGgE6464FukDe/rhXjh+vQsG/+MyTOVm4YbOa5IWSuq0pcaPnMNn1Tk/Q1CeaKjEFgVSJn9wAoCFT0RUH0pWoh3oWSwY95vWIdO4tqqsdfwLfIA29ay5ALX4HOJrlW5QTt2XqwTaxwcDozIF/svaHwDlfllBpsFl8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128553; c=relaxed/simple;
	bh=8xFWvWnbbxNtSScIWZyOyOwoPgT3OidLM+h8HVaJUFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R83Ly7mQUQYGK2dJ9gJaFvyPIty6MdC4ALsURNokckCmJVvEaqWGnrMByrsZGmutpc0LoHtJLoqPQCWxy2WH/sxhSXPTm2fSe4HUOBKJU7ITflY11ezlQ+cffYzQXocyDhgH0vMZygIJKBncZAATwpFExwyc8knzxhAY1cAMhr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEYRq08u; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEYRq08u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789128552; x=1820664552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8xFWvWnbbxNtSScIWZyOyOwoPgT3OidLM+h8HVaJUFA=;
  b=hEYRq08uwQT1er9BbDpUD9GUhHdgIZU9Dxsuo7CQQTtxaTNk+2s8M1X3
   KGUKWR6+/UaeE1M25To+dsYsngl/Fuc+ZuGblXFyx7LMb3gdhwKIaQzsV
   AM6u0pQHT7/Io1RDtR4BCqnzsoN63v/HeMl0kiZ4EioDJt03uhardMxNH
   Z7JWIv8UoRg0yXT9A/JHUC4oITiB4pJXoEdyKga+vAHlVdiZbHdk8/sxA
   TMfvdK3y6SwsVbPKB8kFIUuGYvIqb6YwJ3FIsOMRontXB2qeX30V4Uv/M
   faV9JD/9FxqKczN9JS4Q1HglXPn8ucSLmmvS8CdPjWF/xv6x9wwVZlf1Y
   g==;
X-CSE-ConnectionGUID: iXtMts61Q7OmULRuu64ZnQ==
X-CSE-MsgGUID: DJ1NQGvMSS6LKZuItjEn6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="92099597"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="92099597"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 05:09:11 -0700
X-CSE-ConnectionGUID: ciNHh1x4S2qZz+hvQtA+VQ==
X-CSE-MsgGUID: 3mOiteiKSlqRl4rKs8o73A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268226892"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 11 Sep 2026 05:09:08 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x503s-000000001VB-2MFa;
	Fri, 11 Sep 2026 12:09:00 +0000
Date: Fri, 11 Sep 2026 20:08:19 +0800
From: kernel test robot <lkp@intel.com>
To: Ho Jie Feng <hjf3108@gmail.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, cyrozap@gmail.com,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/trigger5: Add MCT Trigger 5 USB display driver
Message-ID: <202609111951.Hco6MgXH-lkp@intel.com>
References: <20260910171709.396071-1-hjf3108@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910171709.396071-1-hjf3108@gmail.com>

Hi Ho,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3ab04dcce43cd4fdaed94f08f4e6289be4921ea4]

url:    https://github.com/intel-lab-lkp/linux/commits/Ho-Jie-Feng/drm-trigger5-Add-MCT-Trigger-5-USB-display-driver/20260911-011705
base:   3ab04dcce43cd4fdaed94f08f4e6289be4921ea4
patch link:    https://lore.kernel.org/r/20260910171709.396071-1-hjf3108%40gmail.com
patch subject: [PATCH] drm/trigger5: Add MCT Trigger 5 USB display driver
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260911/202609111951.Hco6MgXH-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609111951.Hco6MgXH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609111951.Hco6MgXH-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/trigger5/trigger5_drv.c:435:19: warning: result of comparison of constant 65536 with expression of type 'const u16' (aka 'const unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     435 |             mode->htotal > U16_MAX + 1)
         |             ~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   drivers/gpu/drm/trigger5/trigger5_drv.c:440:19: warning: result of comparison of constant 65536 with expression of type 'const u16' (aka 'const unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     440 |             mode->vtotal > U16_MAX + 1)
         |             ~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   2 warnings generated.


vim +435 drivers/gpu/drm/trigger5/trigger5_drv.c

   420	
   421	static enum drm_mode_status
   422	trigger5_crtc_mode_valid(struct drm_crtc *crtc,
   423				 const struct drm_display_mode *mode)
   424	{
   425		struct trigger5_pll pll;
   426		size_t frame_len, payload_len;
   427		u64 err, ppm;
   428	
   429		/*
   430		 * The protocol stores totals, sync pulses, and back porches minus one
   431		 * in 16-bit fields.
   432		 */
   433		if (mode->hsync_end <= mode->hsync_start ||
   434		    mode->htotal <= mode->hsync_end ||
 > 435		    mode->htotal > U16_MAX + 1)
   436			return MODE_H_ILLEGAL;
   437	
   438		if (mode->vsync_end <= mode->vsync_start ||
   439		    mode->vtotal <= mode->vsync_end ||
   440		    mode->vtotal > U16_MAX + 1)
   441			return MODE_V_ILLEGAL;
   442	
   443		payload_len = array3_size(mode->hdisplay, mode->vdisplay, 3);
   444		frame_len = size_add(payload_len, sizeof(struct trigger5_bulk_header));
   445		if (frame_len > SZ_16M)
   446			return MODE_MEM;
   447	
   448		err = trigger5_calculate_pll(&pll, mode->clock);
   449		ppm = div64_u64(err * 1000, mode->clock);
   450		if (ppm > 10000)
   451			return MODE_CLOCK_RANGE;
   452	
   453		return MODE_OK;
   454	}
   455	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
