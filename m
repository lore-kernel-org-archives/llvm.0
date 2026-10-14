Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C6D37F301;
	Wed, 14 Oct 2026 05:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791956279; cv=none; b=uF4cjY/ukUpCS3xZbYBK4riRWImkPXjSW1Mh4gKknMieUS0j6OPAtIRAQUCtq/Ry0uW0uepOLPzX7n+B+PF9UKjKMuzE5O+TyH680nZ8uiLb7MK1wNq7sPPxTplOQ78WeMYxDCw3ghCoUaDzfkmc8NRH6YQKy2WmBgfWrCEmPEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791956279; c=relaxed/simple;
	bh=KLQLSwtwMfdActLLHb1t3B9g7TGrfNXupKshdeRihfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JGNLhwsRhp81Cw9UEhZWWjCQexFwikDEiJktGUYiqNlSDvhZXM+DWtsPckzja4UTgNrtWJOWLTDbJ2vMCqq7t9b9HDti/uTq96x/IuOyk+NOMFtQ4SV6FHSBzgtETRO63bWkp1lCES5XY3MFZyrPBUCdA79MtC67QWdynwG4jBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mbpWt4yq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mbpWt4yq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791956278; x=1823492278;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KLQLSwtwMfdActLLHb1t3B9g7TGrfNXupKshdeRihfw=;
  b=mbpWt4yqbMAbsBa1nF7PjLOu54516I4f5Wz8unpt+S3WvJj+6lGxmK8A
   zayP+nFBMIfjqozBe2S7rpzuBxc0hwLvNifMZw4oNwxFksLoKNWG5A9L8
   Coopx7PqyzPo8QBrgqZ51UucmVvV6TKN8cLWo6bPFiVdGlJoJTuSOiNgi
   BGdReRtXWTdsXv7nmuLB99wNaAuVwrLZYuCicxF9R5I7bFBElrclXL5sF
   BUL+WA5WvEKy9y68LZ9zT3MAa7G13OHM7d7z3LM1qr6uo0SuUHXFKgXwC
   it+KFqXdCOo96QZ2EtfLywyGPspErs0ogYWfXhcigFCtS7iDmS5CzqSUW
   A==;
X-CSE-ConnectionGUID: zMLenybYS5irVIuPbcw1BQ==
X-CSE-MsgGUID: me4MbLJsQMyjXyXPsc8dbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="594165"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="594165"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 22:37:57 -0700
X-CSE-ConnectionGUID: hEgQPaK2R9aPLUUnvB+9hQ==
X-CSE-MsgGUID: YQNxwNdZRRSK8mdela4Ucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1302075"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Oct 2026 22:37:53 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGrgT-00000000EB8-1TAl;
	Wed, 14 Oct 2026 05:37:49 +0000
Date: Wed, 14 Oct 2026 13:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: Ho Jie Feng <hjf3108@gmail.com>, dri-devel@lists.freedesktop.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, cyrozap@gmail.com,
	Ho Jie Feng <hjf3108@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/trigger5: Add MCT Trigger 5 USB display driver
Message-ID: <202610141333.eWqPGRTA-lkp@intel.com>
References: <20261012131539.67790-1-hjf3108@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012131539.67790-1-hjf3108@gmail.com>

Hi Ho,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 73df79cceb8c01f311055a61794e229dc81546cb]

url:    https://github.com/intel-lab-lkp/linux/commits/Ho-Jie-Feng/drm-trigger5-Add-MCT-Trigger-5-USB-display-driver/20261012-211537
base:   73df79cceb8c01f311055a61794e229dc81546cb
patch link:    https://lore.kernel.org/r/20261012131539.67790-1-hjf3108%40gmail.com
patch subject: [PATCH v4] drm/trigger5: Add MCT Trigger 5 USB display driver
config: powerpc-randconfig-1000-20261014 (https://download.01.org/0day-ci/archive/20261014/202610141333.eWqPGRTA-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610141333.eWqPGRTA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610141333.eWqPGRTA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tiny/trigger5.c:550:19: warning: result of comparison of constant 65536 with expression of type 'const u16' (aka 'const unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     550 |             mode->htotal > U16_MAX + 1)
         |             ~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   drivers/gpu/drm/tiny/trigger5.c:555:19: warning: result of comparison of constant 65536 with expression of type 'const u16' (aka 'const unsigned short') is always false [-Wtautological-constant-out-of-range-compare]
     555 |             mode->vtotal > U16_MAX + 1)
         |             ~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   2 warnings generated.


vim +550 drivers/gpu/drm/tiny/trigger5.c

   540	
   541	static enum drm_mode_status
   542	trigger5_crtc_mode_valid(struct drm_crtc *crtc,
   543				 const struct drm_display_mode *mode)
   544	{
   545		struct trigger5_pll pll;
   546		u64 err, ppm;
   547	
   548		if (mode->hsync_end <= mode->hsync_start ||
   549		    mode->htotal <= mode->hsync_end ||
 > 550		    mode->htotal > U16_MAX + 1)
   551			return MODE_H_ILLEGAL;
   552	
   553		if (mode->vsync_end <= mode->vsync_start ||
   554		    mode->vtotal <= mode->vsync_end ||
   555		    mode->vtotal > U16_MAX + 1)
   556			return MODE_V_ILLEGAL;
   557	
   558		if (trigger5_mode_buf_len(mode) > TRIGGER5_TRANSFER_BUF_SIZE)
   559			return MODE_MEM;
   560	
   561		err = trigger5_calculate_pll(&pll, mode->clock);
   562		ppm = div64_u64(err * 1000, mode->clock);
   563		if (ppm > 10000)
   564			return MODE_CLOCK_RANGE;
   565	
   566		return MODE_OK;
   567	}
   568	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
