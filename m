Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6217A6AA4;
	Sat, 25 Nov 2023 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkkBYxxp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700907263; x=1732443263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8tVCaonThtAd2r/JDvQne+hflLGEIySDv58tWQ+41Js=;
  b=OkkBYxxpxTxG4OgLNm5GAaZGLkhY4lU5enF45WGiJ1fXsll5cFI03XuX
   I0pDEryFavviA7dapVz/NM9k6dEBeoGPOEjuqXY7hwy59+BEZ5eXJ6U3A
   3lhDhy8aM9/Wz1SNCuCwijQdHsCGD6J9YpHmQuTgReJ0rh0MJ70AoRSL6
   GFnjxQxXu2DzGp4f5RSZmDgzSG/AMLeMh8/0MZmc4v8PSijrXka6SZQ1F
   mv6ubhLlGJZ0TH2929hHvP6uICGmgiMtFn2P8heVkSDTdAVgAO6+c+Swp
   8AP3L3eyx4uepVTvCck+atek2lbE6pLt07LgFVHhqQIuQpzwBg1/ptgf1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="382909041"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="382909041"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 02:14:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="891259180"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="891259180"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Nov 2023 02:14:21 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6pg3-0003rd-01;
	Sat, 25 Nov 2023 10:14:19 +0000
Date: Sat, 25 Nov 2023 18:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:pr/237 3/3] drivers/gpu/drm/apple/iomfb.c:231:21:
 warning: variable 'dev' set but not used
Message-ID: <202311251722.t9dGaySl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux pr/237
head:   7b22b1e89a2618d45e40e5a9cf456d81cec2507b
commit: 7b22b1e89a2618d45e40e5a9cf456d81cec2507b [3/3] drm: apple: iomfb: Use drm_kms_helper_connector_hotplug_event
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231125/202311251722.t9dGaySl-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231125/202311251722.t9dGaySl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311251722.t9dGaySl-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/apple/iomfb.c:231:21: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
     231 |         struct drm_device *dev;
         |                            ^
   drivers/gpu/drm/apple/iomfb.c:504:6: warning: no previous prototype for function 'iomfb_start' [-Wmissing-prototypes]
     504 | void iomfb_start(struct apple_dcp *dcp)
         |      ^
   drivers/gpu/drm/apple/iomfb.c:504:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     504 | void iomfb_start(struct apple_dcp *dcp)
         | ^
         | static 
   2 warnings generated.


vim +/dev +231 drivers/gpu/drm/apple/iomfb.c

65b4ebeb872630 Janne Grunau 2022-10-02  220  
65b4ebeb872630 Janne Grunau 2022-10-02  221  /*
65b4ebeb872630 Janne Grunau 2022-10-02  222   * Helper to send a DRM hotplug event. The DCP is accessed from a single
65b4ebeb872630 Janne Grunau 2022-10-02  223   * (RTKit) thread. To handle hotplug callbacks, we need to call
65b4ebeb872630 Janne Grunau 2022-10-02  224   * drm_kms_helper_hotplug_event, which does an atomic commit (via DCP) and
65b4ebeb872630 Janne Grunau 2022-10-02  225   * waits for vblank (a DCP callback). That means we deadlock if we call from
65b4ebeb872630 Janne Grunau 2022-10-02  226   * the RTKit thread! Instead, move the call to another thread via a workqueue.
65b4ebeb872630 Janne Grunau 2022-10-02  227   */
65b4ebeb872630 Janne Grunau 2022-10-02  228  void dcp_hotplug(struct work_struct *work)
65b4ebeb872630 Janne Grunau 2022-10-02  229  {
65b4ebeb872630 Janne Grunau 2022-10-02  230  	struct apple_connector *connector;
65b4ebeb872630 Janne Grunau 2022-10-02 @231  	struct drm_device *dev;
65b4ebeb872630 Janne Grunau 2022-10-02  232  	struct apple_dcp *dcp;
65b4ebeb872630 Janne Grunau 2022-10-02  233  
65b4ebeb872630 Janne Grunau 2022-10-02  234  	connector = container_of(work, struct apple_connector, hotplug_wq);
65b4ebeb872630 Janne Grunau 2022-10-02  235  	dev = connector->base.dev;
65b4ebeb872630 Janne Grunau 2022-10-02  236  
65b4ebeb872630 Janne Grunau 2022-10-02  237  	dcp = platform_get_drvdata(connector->dcp);
ddd996d7221142 Janne Grunau 2023-11-21  238  	dev_info(dcp->dev, "%s() connected:%d valid_mode:%d\n", __func__,
ddd996d7221142 Janne Grunau 2023-11-21  239  		 connector->connected, dcp->valid_mode);
65b4ebeb872630 Janne Grunau 2022-10-02  240  
65b4ebeb872630 Janne Grunau 2022-10-02  241  	/*
65b4ebeb872630 Janne Grunau 2022-10-02  242  	 * DCP defers link training until we set a display mode. But we set
65b4ebeb872630 Janne Grunau 2022-10-02  243  	 * display modes from atomic_flush, so userspace needs to trigger a
65b4ebeb872630 Janne Grunau 2022-10-02  244  	 * flush, or the CRTC gets no signal.
65b4ebeb872630 Janne Grunau 2022-10-02  245  	 */
7b22b1e89a2618 Janne Grunau 2023-11-23  246  	if (connector->base.state && !dcp->valid_mode && connector->connected)
7b22b1e89a2618 Janne Grunau 2023-11-23  247  		drm_connector_set_link_status_property(&connector->base,
7b22b1e89a2618 Janne Grunau 2023-11-23  248  						       DRM_MODE_LINK_STATUS_BAD);
65b4ebeb872630 Janne Grunau 2022-10-02  249  
7b22b1e89a2618 Janne Grunau 2023-11-23  250  	drm_kms_helper_connector_hotplug_event(&connector->base);
65b4ebeb872630 Janne Grunau 2022-10-02  251  }
65b4ebeb872630 Janne Grunau 2022-10-02  252  EXPORT_SYMBOL_GPL(dcp_hotplug);
65b4ebeb872630 Janne Grunau 2022-10-02  253  

:::::: The code at line 231 was first introduced by commit
:::::: 65b4ebeb872630604d40dad74fc4e963ec261d9a drm/apple: Split dcpep/iomfb out of dcp.c

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Hector Martin <marcan@marcan.st>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
