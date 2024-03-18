Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C364EB39;
	Mon, 18 Mar 2024 15:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710774015; cv=none; b=mRPHawHGEINvv6g8M8Er3Ctt61Ai07RykTNsRXYZy+E9AuoKh6Has7z7RG734FpgOs7TflJ6Vr/8j+N14HrAI2p6wq7CHjeC8hkbZCdK1v+2CzzQc/+gqOz5aZfLvJ9HaA8jYlKi17mGLKSuJWZ4f52zZLF57RPmb6Jv8STCDbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710774015; c=relaxed/simple;
	bh=PC104PBOwXuviVlws1W/LwILT5gKE6sViJcHCXyEwlw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fzIPHvzJe7creIN70jKuE3dxrEmAhkJeubqSwFevTdt/YdgHD/HK3KfokHlm4RGdCFdoGNXnjCKgUZDF46ijGRZ7JPIhkT5ut9+42/4e0Ri36NxudVS5ZvYn7CeTUmJrd+nTCCyIwswjF+NWPUo8a34BusDFbDD6ZXpEjqaCL2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYacY3uT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYacY3uT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710774013; x=1742310013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PC104PBOwXuviVlws1W/LwILT5gKE6sViJcHCXyEwlw=;
  b=UYacY3uT/UrgdBcigYB2oJn+un/1bgywAVQgrdXBDewqte9Vgg4ZWrwf
   Vbt57aJgYNQxcjuHKFjFhR5PDmHW8O2fS4b4DODJ5FK9pMdqY/sDPT0Qa
   KBpkYdSIIdETtXN7Uwl69jGAvcgPJluqN4BpZplDA4PAgJXCnpIwLnDFw
   NvLew9S3C2zOr60QdxxGfc7AM+lDLSRJ6mBb+2+6p3dKFZ5NJ9wvaknbq
   1GGOMPTR7jBk33u+EUbMV9bxwgYY2rZYEXabFAMPysSthIaQB33NHVr5K
   GCJWEEP+yrZ88gC08Sb0jQv/lEnrn7poQ1xXAltK/JJ4+aeuz/qflhN1y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5527367"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5527367"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 08:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="36619807"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2024 08:00:04 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmET4-000H25-2E;
	Mon, 18 Mar 2024 15:00:02 +0000
Date: Mon, 18 Mar 2024 22:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [drm-misc:for-linux-next-fixes 1/1] ld.lld: error: undefined symbol:
 __drm_dev_dbg
Message-ID: <202403182236.BEDkBjub-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next-fixes
head:   e3f18b0dd1db242791afbc3bd173026163ce0ccc
commit: e3f18b0dd1db242791afbc3bd173026163ce0ccc [1/1] drm/bridge: Select DRM_KMS_HELPER for DRM_PANEL_BRIDGE
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240318/202403182236.BEDkBjub-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240318/202403182236.BEDkBjub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403182236.BEDkBjub-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: __drm_dev_dbg
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check_modeset) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check_modeset) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check_modeset) in archive vmlinux.a
   >>> referenced 52 more times
--
>> ld.lld: error: undefined symbol: drm_dev_has_vblank
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check_modeset) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_commit_modeset_disables) in archive vmlinux.a
   >>> referenced by drm_atomic_state_helper.c
   >>>               drivers/gpu/drm/drm_atomic_state_helper.o:(__drm_atomic_helper_crtc_reset) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: drm_atomic_set_crtc_for_connector
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(handle_conflicting_encoders) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_disable_all) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_atomic_set_mode_prop_for_crtc
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(handle_conflicting_encoders) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_disable_all) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_connector_list_iter_end
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(handle_conflicting_encoders) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_duplicate_state) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_duplicate_state) in archive vmlinux.a
   >>> referenced 25 more times
--
>> ld.lld: error: undefined symbol: drm_mode_copy
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(mode_fixup) in archive vmlinux.a
   >>> referenced by drm_crtc_helper.c
   >>>               drivers/gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive vmlinux.a
   >>> referenced by drm_crtc_helper.c
   >>>               drivers/gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive vmlinux.a
   >>> referenced 2 more times
--
>> ld.lld: error: undefined symbol: drm_atomic_bridge_chain_check
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(mode_fixup) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_mode_get_hv_timing
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check_plane_state) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_atomic_normalize_zpos
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_check) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_calc_timestamping_constants
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_calc_timestamping_constants) in archive vmlinux.a
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_commit_modeset_disables) in archive vmlinux.a
   >>> referenced by drm_crtc_helper.c
   >>>               drivers/gpu/drm/drm_crtc_helper.o:(drm_crtc_helper_set_mode) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: drm_atomic_bridge_chain_post_disable
   >>> referenced by drm_atomic_helper.c
   >>>               drivers/gpu/drm/drm_atomic_helper.o:(drm_atomic_helper_commit_modeset_disables) in archive vmlinux.a
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_KMS_HELPER
   Depends on [m]: HAS_IOMEM [=y] && DRM [=m]
   Selected by [y]:
   - DRM_PANEL_BRIDGE [=y] && HAS_IOMEM [=y] && DRM_BRIDGE [=y]
   Selected by [m]:
   - DRM [=m] && HAS_IOMEM [=y] && (AGP [=n] || AGP [=n]=n) && !EMULATED_CMPXCHG && HAS_DMA [=y] && DRM_FBDEV_EMULATION [=y]
   - DRM_RADEON [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y] && (AGP [=n] || !AGP [=n])
   - DRM_NOUVEAU [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && MMU [=y]
   - DRM_SUN4I [=m] && HAS_IOMEM [=y] && DRM [=m] && COMMON_CLK [=y] && (ARCH_SUNXI [=y] || COMPILE_TEST [=n])
   - DRM_VIRTIO_GPU [=m] && HAS_IOMEM [=y] && DRM [=m] && VIRTIO_MENU [=y] && MMU [=y]
   - DRM_DW_HDMI [=m] && HAS_IOMEM [=y] && DRM [=m] && DRM_BRIDGE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
