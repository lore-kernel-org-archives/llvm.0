Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B132DC79E;
	Mon, 13 Oct 2025 05:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760334512; cv=none; b=pE1FL6p/ipzPHuRw3hINLuvnujl9k+VP88PzrAX5AOch09igQGGavjuQe6GYKv35KuBk0uvOBEx05xUUnZOfLzm5uvERCmlogoiPiRxR07NRtuCY6ulchzimqXCXG7pBa72KCxaOcMmjZ+QBapAqEAJRCcVzwuSURutIasI2sa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760334512; c=relaxed/simple;
	bh=1CbkESsOV9wfYLzbIF/AdVP0kpVZargSZR3O7xR55a8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P61XUZJAs/xq+ZuUUjrSeAqH65YFe5PbuZk4K3Bs7nXgrlT0s966duyUXJ8r8fa4Y5K1g9ZQG6CQ9LiWpA5/kubnEd4QEZsCv7NX5oa4WH5RtVrSsaWenOnYtCi1XCls4keIflcDhhaIknOptxzIxYx90QB0COljfcPwrNta9dQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E11ydJbz; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E11ydJbz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760334512; x=1791870512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1CbkESsOV9wfYLzbIF/AdVP0kpVZargSZR3O7xR55a8=;
  b=E11ydJbzACvwILjYtPCqgoovXoD8n4NOtqs4S3pI7ATcVtpkUx54SDNe
   WEcFd07qzl19xJj2cKBoKhI4H9lVLE3hl4LVchIN1d+ODR2w0ub6XGrfq
   Ga/TtuRqCrij1QC/1U707bBKEb58TnHGIf8zVov7m5/ByM6rfFmCUsnah
   hjymvlSDXK+kPNuMgk8iHksahc7q6xAd99lf8WRwWemwlarbV9GO4M+Cz
   SJVz3ha47B3RTcHPdi/lFPSN3EBJWyVsSoMTDOJ+URPcrpE3WtSkZbkO+
   o0RU5VbQ5arkqsRU31GKs4AyVFwKDOAToYsX0vrrMHMvzTQB21KFOx5TS
   w==;
X-CSE-ConnectionGUID: JmPVI+lISPuywre4HMKp5A==
X-CSE-MsgGUID: E1op3GrERa6VH/00XwWvhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="80107046"
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="80107046"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2025 22:48:31 -0700
X-CSE-ConnectionGUID: 2tthKyD4STmYNJLs6Ilmgg==
X-CSE-MsgGUID: jKd+E5yDQxy154Hqf4YzPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,224,1754982000"; 
   d="scan'208";a="181935498"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 12 Oct 2025 22:48:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8BPS-0000BV-0X;
	Mon, 13 Oct 2025 05:48:07 +0000
Date: Mon, 13 Oct 2025 13:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: [drm-misc:drm-misc-next 135/212] ld.lld: error: undefined symbol:
 devm_backlight_device_register
Message-ID: <202510131347.mbEv1p8p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   5385871282e5c2831c226d32cf2ce26b45a7b164
commit: 7911d8cab55453b6bf59cd1f806503c3dbf0e990 [135/212] drm/panel: visionox-rm69299: Add backlight support
config: x86_64-buildonly-randconfig-003-20251013 (https://download.01.org/0day-ci/archive/20251013/202510131347.mbEv1p8p-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510131347.mbEv1p8p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510131347.mbEv1p8p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: devm_backlight_device_register
   >>> referenced by panel-visionox-rm69299.c:343 (drivers/gpu/drm/panel/panel-visionox-rm69299.c:343)
   >>>               vmlinux.o:(visionox_rm69299_probe)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
