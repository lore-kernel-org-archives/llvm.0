Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A6516F91D;
	Tue, 28 May 2024 14:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716907140; cv=none; b=t8I3aB48/JOxcDKStPVcYi2nQiRF4XTjtBlfzf/KLc1SfWt4k1RZigM5M2uQ1lHksiBo9s7LaZkXtNBGXeNdVq71/3BLJEgyx6V1ZhmQqzOz30PoUkBDRydhd8joBrz2ERfOB0Ohb5nIZMNYHC2VjW1eVP9+3TEMveYG+4dyQ64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716907140; c=relaxed/simple;
	bh=M6zz23ytNcIYjpmOBVGRwLDdpmrQad24JbGnhp4sZto=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZQ6Qrsorw/NgdPvc5x/MivH2jTwZp7y0SdbEDBwPkkqblv3h2qgtY+cysCGD9LUjwjZyNVrWPK8/E6yOCbFnRsuQks1fUg3J8egHnwnz7L51Thf80/iM+WyDuxaLcoUUQPk0Rg0tGZgnjXSDHCWrpgKWvpNRqZLZHCG63lZDxqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ViWTw5dy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ViWTw5dy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716907138; x=1748443138;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M6zz23ytNcIYjpmOBVGRwLDdpmrQad24JbGnhp4sZto=;
  b=ViWTw5dyFrdhzL6dKgVYRnTObQRx0Z7XDaPEULIxiu08Hy3YP/3M+2VQ
   FHkhUZmPhGID01vGdVJI8NOjgslnIe6RaK2T7VW9+SMecvP0vcIlvxiZI
   bWbPmK2NmGfmIzklumhYHuTkbvUXj3FAtkvmdmKUFoNkaNOiJ4gCIAYiC
   0K7hcth7A40+IjqOGMpRYDrlNP82Iz26/22Gv80NJseZW1TO1FJyCNM33
   iNwZMPWwlFt/hcmxGwGgMrZ7IVIJQ2rjtYzAUeQBTrSHQvqX8GNAkKZph
   VeIcbLaeIMQTGpU/J/IudFiXKLA2BONW7gzQKfSpRfh9AQTbws+XRBpbz
   g==;
X-CSE-ConnectionGUID: g8VGptm7TICrHCqRgNIwpQ==
X-CSE-MsgGUID: HAhdimppQWicGXamyalBeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13097648"
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="13097648"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 07:38:58 -0700
X-CSE-ConnectionGUID: dA1SJRMtSvSOTk2Fpy2o+Q==
X-CSE-MsgGUID: 53UMXH7CRJGOnwsVBk8ANA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,195,1712646000"; 
   d="scan'208";a="40056247"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 May 2024 07:38:56 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBxyY-000CL3-0s;
	Tue, 28 May 2024 14:38:54 +0000
Date: Tue, 28 May 2024 22:38:48 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Andy Yan <andyshrk@163.com>
Subject: [drm-misc:drm-misc-next 29/29]
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:3: error: implicit declaration of
 function 'drm_connector_hdmi_compute_mode_clock' is invalid in C99
Message-ID: <202405282205.EU7NUoeQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   62545c719e26ec9f62efab7e9582deb73265b6d0
commit: ea64761a54a25fa2c27bae99b3c72dadfaa74d3e [29/29] drm/sun4i: hdmi: Switch to HDMI connector
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240528/202405282205.EU7NUoeQ-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405282205.EU7NUoeQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405282205.EU7NUoeQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:3: error: implicit declaration of function 'drm_connector_hdmi_compute_mode_clock' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   drm_connector_hdmi_compute_mode_clock(mode, 8,
                   ^
   drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c:213:3: note: did you mean 'drm_hdmi_compute_mode_clock'?
   include/drm/display/drm_hdmi_helper.h:28:1: note: 'drm_hdmi_compute_mode_clock' declared here
   drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
   ^
   1 error generated.


vim +/drm_connector_hdmi_compute_mode_clock +213 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c

   207	
   208	static enum drm_mode_status
   209	sun4i_hdmi_connector_mode_valid(struct drm_connector *connector,
   210					struct drm_display_mode *mode)
   211	{
   212		unsigned long long rate =
 > 213			drm_connector_hdmi_compute_mode_clock(mode, 8,
   214							      HDMI_COLORSPACE_RGB);
   215	
   216		return sun4i_hdmi_connector_clock_valid(connector, mode, rate);
   217	}
   218	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
