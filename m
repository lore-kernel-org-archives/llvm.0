Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A871F09AD;
	Wed, 20 May 2026 05:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779254690; cv=none; b=eCetrxr2XojVg06wsOyapMK/4pqVFgpYPLKh5/UFCPlNYT7w4EK/tGFG4buA9dkxRqFbyJV0g0k3AhXI+ciGFPwBHQYCEfeE3ypLuAQsvowswEQg5nX4iqx8Y0i9P4PJ2b080ZcTLwNy8HUuWtPWvg+D0ohmU/Ba0N1GcHVlvCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779254690; c=relaxed/simple;
	bh=5FtgcHzC+cvdzpW47mluAWxAcYPo1AP5Z6jlHvKYBjA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QT5yOwUWxxXRTsDRP+Uy6y3y0XrDI5doXB4alJJoFlnzDV4b+DxDg4GXMZSLWy2mdgMANbG/mm7KT+t6+JYX0jxttssCfljrOib140rqStFM/R7klXgaoTXxlNJbbJgHA/wUsj8a3qc9+ZjqaLFmM7tApi5ihQ4oM7rnX5miNp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEiBzN4m; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEiBzN4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779254689; x=1810790689;
  h=date:from:to:cc:subject:message-id;
  bh=5FtgcHzC+cvdzpW47mluAWxAcYPo1AP5Z6jlHvKYBjA=;
  b=cEiBzN4mZRWc6bgTWzRuISYrdARHXKYaM/RywfBdP48xcSE2V79veMIA
   F9KDuqzOXGMKJbrX1dLUMDc++g4ajuYDedCZy6O0dwTuo453lOY0MDQMn
   cFcZE4Kax1bUyFPK3ou040Mkp8bAyA5lJU6rivdXFBi//qWRhaybf43dL
   xRk6sGJ4evbuOjbIi3z0DlOZ5xlk4RpWLmPqbil8ibgfPDTVlsudV6pPX
   yW3AAMQPnUaCqSTxq2aKBpIHJgnVmpxkvTS6sxaJwexrTCkpqJ9dBk/de
   g6i2FNE9jwgyXlHOQj/PewHE+gQNpiFcP3/dSlw2R1TxMjz8+uJR/K5uk
   w==;
X-CSE-ConnectionGUID: C2eyttHjRJOBS+7pxwU7YA==
X-CSE-MsgGUID: Vr9yT16kTvinVtnXJtjkSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="90841933"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90841933"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 22:24:49 -0700
X-CSE-ConnectionGUID: 1br6bhAYR4eNhErKCss96Q==
X-CSE-MsgGUID: 8Une9ZjNTtCzcKjzvO3iuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="245020313"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 May 2026 22:24:47 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPZQC-000000002WL-1pnO;
	Wed, 20 May 2026 05:24:44 +0000
Date: Wed, 20 May 2026 13:22:34 +0800
From: kernel test robot <lkp@intel.com>
To: Brajesh Gupta <brajesh.gupta@imgtec.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 dri-devel@lists.freedesktop.org, Matt Coster <matt.coster@imgtec.com>
Subject: [drm-misc:for-linux-next 3/5]
 drivers/gpu/drm/imagination/pvr_power.c:382:44: error: too few arguments to
 function call, expected 3, have 2
Message-ID: <202605201342.BrTzQUAE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git for-linux-next
head:   c1079aebb4de218caa86c44f9a53700d1a582683
commit: 42577ba79fbfbc6c2f246d523cb22a66329d4826 [3/5] drm/imagination: Rename FW booted to FW initialised
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260520/202605201342.BrTzQUAE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201342.BrTzQUAE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201342.BrTzQUAE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/imagination/pvr_power.c:382:44: error: too few arguments to function call, expected 3, have 2
     382 |                 err = pvr_power_fw_disable(pvr_dev, false);
         |                       ~~~~~~~~~~~~~~~~~~~~               ^
   drivers/gpu/drm/imagination/pvr_power.c:93:1: note: 'pvr_power_fw_disable' declared here
      93 | pvr_power_fw_disable(struct pvr_device *pvr_dev, bool hard_reset, bool rpm_suspend)
         | ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/imagination/pvr_power.c:412:36: error: too few arguments to function call, expected 2, have 1
     412 |                 err = pvr_power_fw_enable(pvr_dev);
         |                       ~~~~~~~~~~~~~~~~~~~        ^
   drivers/gpu/drm/imagination/pvr_power.c:122:1: note: 'pvr_power_fw_enable' declared here
     122 | pvr_power_fw_enable(struct pvr_device *pvr_dev, bool rpm_resume)
         | ^                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +382 drivers/gpu/drm/imagination/pvr_power.c

   368	
   369	int
   370	pvr_power_device_suspend(struct device *dev)
   371	{
   372		struct platform_device *plat_dev = to_platform_device(dev);
   373		struct drm_device *drm_dev = platform_get_drvdata(plat_dev);
   374		struct pvr_device *pvr_dev = to_pvr_device(drm_dev);
   375		int err = 0;
   376		int idx;
   377	
   378		if (!drm_dev_enter(drm_dev, &idx))
   379			return -EIO;
   380	
   381		if (pvr_dev->fw_dev.initialised) {
 > 382			err = pvr_power_fw_disable(pvr_dev, false);
   383			if (err)
   384				goto err_drm_dev_exit;
   385		}
   386	
   387		err = pvr_dev->device_data->pwr_ops->power_off(pvr_dev);
   388	
   389	err_drm_dev_exit:
   390		drm_dev_exit(idx);
   391	
   392		return err;
   393	}
   394	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
