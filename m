Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9965174EFB;
	Tue, 28 May 2024 19:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716924679; cv=none; b=PIMN9YijUjiggVf9BIvWKeIwahb6przDL2avbR0WGgCZo61ellyIZMceAU3XGeUt7ngMkDWwJIPGYwxepYuqqPhoqjgKlUCIgcJobQvu5fAWS/iG6ieess9kkENFHfawxmDCTY81TUjNRViH49j6S1AY3iWN1LTWXHbdMCcIzMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716924679; c=relaxed/simple;
	bh=iMxOwy35/r+i6hWDvEdLQKCH1R+B4cRa0wM5Ckf8snQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CnDyBXcvCQzc1vYXqPazZOiU72d6qrRu6xpqV7R7yBRtaIC0AEBJP6pi2JGEzQ5iO1Md5S41mU2GGxYZkeJUtCI4/VMYEnkEFkk9eE02TEu/PEiDXPb+BeJh46CH+OD426z8bKDO3Nh20qu1HJGgtL2Dvu3upm6Ts0MVFG0ht3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=beU7yKq+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="beU7yKq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716924678; x=1748460678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iMxOwy35/r+i6hWDvEdLQKCH1R+B4cRa0wM5Ckf8snQ=;
  b=beU7yKq+7835gkDdaKaF2FmY1iqcK1an7ndcTw2MDElYPfVRtG44xETE
   lDkNntqT2iXpcIBRZlnNgH4dhxR06EBJySen50BcYGzHa5pdELxhM4zj3
   2lPAGPYSLMozUwU5m7avGMEf/rVQVggn5/Z6GWwyHCjAcqM0quts9iPDL
   NotBHCZ/M5loxGz9K+7OnKlQ3M5qYDa/fxVSFxVX6eWHaB8uZHjN+n+ol
   GrC69bRv1auU+4mIISGctuC/bzTFSltNBgGWAAEeCAVEAmihew+BnEKSh
   rAqR8OWv0Cu54FVQbPwC7LQEdt5NZwAUVzM16btUWWrf74DtaqNajCv7s
   Q==;
X-CSE-ConnectionGUID: IRSBCG1MTaCAecZRIWrKnQ==
X-CSE-MsgGUID: +HcCK3moRomN3bM0920JTA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="17085278"
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="17085278"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 12:31:17 -0700
X-CSE-ConnectionGUID: omC4sSC2QuqXdqTinpvyLA==
X-CSE-MsgGUID: w4rC13J+S3+mLcfEOq7sMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,196,1712646000"; 
   d="scan'208";a="35255971"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 May 2024 12:31:15 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sC2XR-000CgM-01;
	Tue, 28 May 2024 19:31:13 +0000
Date: Wed, 29 May 2024 03:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [drm-misc:drm-misc-next 10/29] ld.lld: error: undefined symbol:
 drm_hdmi_compute_mode_clock
Message-ID: <202405290332.Sqtt0ix0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   c7ce956bb6d0f32ab921b6ffba1a6a834df96f21
commit: abb6f74973e20956d42e8227dde6fb4e92502c14 [10/29] drm/tests: Add HDMI TDMS character rate tests
config: i386-buildonly-randconfig-006-20240528 (https://download.01.org/0day-ci/archive/20240529/202405290332.Sqtt0ix0-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240529/202405290332.Sqtt0ix0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405290332.Sqtt0ix0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: drm_hdmi_compute_mode_clock
   >>> referenced by drm_connector_test.c
   >>>               drivers/gpu/drm/tests/drm_connector_test.o:(drm_test_drm_hdmi_compute_mode_clock_rgb) in archive vmlinux.a
   >>> referenced by drm_connector_test.c
   >>>               drivers/gpu/drm/tests/drm_connector_test.o:(drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc) in archive vmlinux.a
   >>> referenced by drm_connector_test.c
   >>>               drivers/gpu/drm/tests/drm_connector_test.o:(drm_test_drm_hdmi_compute_mode_clock_rgb_10bpc_vic_1) in archive vmlinux.a
   >>> referenced 9 more times

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_DISPLAY_HDMI_STATE_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_DISPLAY_HELPER [=y] && DRM_DISPLAY_HDMI_HELPER [=n]
   Selected by [y]:
   - DRM_KUNIT_TEST [=y] && HAS_IOMEM [=y] && DRM [=y] && KUNIT [=y] && MMU [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
