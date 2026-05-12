Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAA32417DE;
	Tue, 12 May 2026 04:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778560307; cv=none; b=LttkxhzW7vJRMMcaEHZ0c/PkoIjp8uUnww1RDVe632sqHr9Jo5xLsVjZT6I1Svo6U4lgOyI8a3ir7HSoosR/Io3IwhIAdc8YGRRX1KyOZtXvM4LbcfaJfkg8n0WqU0I6hZKg0OyHGEGCSepjjiqQhCW3ubWVW8I+E8vbizsbdOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778560307; c=relaxed/simple;
	bh=QWY+Y8S5RMEwQDLqocSa9nK/xmxIwsEQMRdS9m+L6yM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fVdwMX7cx0vEcKJXL0SvaCsxoGYdQ6nz+PBP1/EkqDwutpzY4f3p/2h+cUg1RfbmTgR1APTm1QDDQYbEgXoTj01yl43kB+s8XBtj3hQlaEfVWpvIiJ+gGweUldzAN/rCgHJ0V2FkqpZR3VSuPEUHsxANXH/2bqNQswWzNZKpcoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAY101Xs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAY101Xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778560305; x=1810096305;
  h=date:from:to:cc:subject:message-id;
  bh=QWY+Y8S5RMEwQDLqocSa9nK/xmxIwsEQMRdS9m+L6yM=;
  b=cAY101Xs3swA8xqEiA68o3b5n83u+/FUHXG5P+xJL7xSccuaizqhLlep
   JWu3KWfVUFBargnNt0QpAOWb+eQmjuY1r+RT2R3qBxmHlThS4BWqQCw5q
   dVbKci45WK1xMgcX2+/GT+VQhFxY3uYcppynF9E8iIDccw2xUW42BiB6J
   sRIWmZx96dmRRZV6MuyZEn47EpZjRhHeFf/i+HJ957cYebuAtImxUAbbm
   2i7t+s45aRIGKMUCO8dfzTBo2oEcwuTT+SrvhvbyrVGUu75+0Cemjdg64
   dLu57CVZzVIZrt9hMiqbrQ0znftFPPhAPjj199P2fhmWAvF6hP92wbnU+
   w==;
X-CSE-ConnectionGUID: G1zwI5dFS1+6bEzwkFLKxA==
X-CSE-MsgGUID: 2Cb5l/AVRXmAH3uU/62BvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="66988371"
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="66988371"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 21:31:44 -0700
X-CSE-ConnectionGUID: MmwOudc4QoOSpz45mgPXaw==
X-CSE-MsgGUID: h9d4ypAORYWy0fz9IpAYfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,230,1770624000"; 
   d="scan'208";a="242650666"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 May 2026 21:31:43 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMemR-000000001a1-0ZnR;
	Tue, 12 May 2026 04:31:39 +0000
Date: Tue, 12 May 2026 12:31:12 +0800
From: kernel test robot <lkp@intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Dave Airlie <airlied@redhat.com>
Subject: [linux-next:master 4174/4394]
 drivers/gpu/drm/bridge/microchip-lvds.c:153:55: error: incompatible pointer
 types passing 'struct drm_atomic_state *' to parameter of type 'const struct
 drm_atomic_commit *'
Message-ID: <202605121203.Pv3sG5BJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: f96538285cfdbb3acf5e3356e0bb88c38815790b [4174/4394] Merge tag 'drm-misc-next-2026-05-07' of https://gitlab.freedesktop.org/drm/misc/kernel into drm-next
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20260512/202605121203.Pv3sG5BJ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605121203.Pv3sG5BJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605121203.Pv3sG5BJ-lkp@intel.com/

Note: the linux-next/master HEAD e98d21c170b01ddef366f023bbfcf6b31509fa83 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   drivers/gpu/drm/bridge/microchip-lvds.c:132:16: warning: declaration of 'struct drm_atomic_state' will not be visible outside of this function [-Wvisibility]
     132 |                                     struct drm_atomic_state *state)
         |                                            ^
>> drivers/gpu/drm/bridge/microchip-lvds.c:153:55: error: incompatible pointer types passing 'struct drm_atomic_state *' to parameter of type 'const struct drm_atomic_commit *' [-Wincompatible-pointer-types]
     153 |         connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
         |                                                              ^~~~~
   include/drm/drm_atomic.h:758:74: note: passing argument to parameter 'state' here
     758 | drm_atomic_get_new_connector_for_encoder(const struct drm_atomic_commit *state,
         |                                                                          ^
   drivers/gpu/drm/bridge/microchip-lvds.c:161:17: warning: declaration of 'struct drm_atomic_state' will not be visible outside of this function [-Wvisibility]
     161 |                                      struct drm_atomic_state *state)
         |                                             ^
   drivers/gpu/drm/bridge/microchip-lvds.c:171:19: error: incompatible function pointer types initializing 'void (*)(struct drm_bridge *, struct drm_atomic_commit *)' with an expression of type 'void (struct drm_bridge *, struct drm_atomic_state *)' [-Wincompatible-function-pointer-types]
     171 |         .atomic_enable = mchp_lvds_atomic_enable,
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/microchip-lvds.c:172:20: error: incompatible function pointer types initializing 'void (*)(struct drm_bridge *, struct drm_atomic_commit *)' with an expression of type 'void (struct drm_bridge *, struct drm_atomic_state *)' [-Wincompatible-function-pointer-types]
     172 |         .atomic_disable = mchp_lvds_atomic_disable,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 3 errors generated.


vim +153 drivers/gpu/drm/bridge/microchip-lvds.c

179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  130  
c4cbe5d9e87d22 Dharma Balasubiramani 2025-06-25  131  static void mchp_lvds_atomic_enable(struct drm_bridge *bridge,
c4cbe5d9e87d22 Dharma Balasubiramani 2025-06-25 @132  				    struct drm_atomic_state *state)
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  133  {
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  134  	struct mchp_lvds *lvds = bridge_to_lvds(bridge);
57f68ed1f08cd1 Dharma Balasubiramani 2025-06-25  135  	struct drm_connector *connector;
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  136  	int ret;
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  137  
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  138  	ret = clk_prepare_enable(lvds->pclk);
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  139  	if (ret < 0) {
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  140  		dev_err(lvds->dev, "failed to enable lvds pclk %d\n", ret);
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  141  		return;
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  142  	}
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  143  
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  144  	ret = pm_runtime_get_sync(lvds->dev);
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  145  	if (ret < 0) {
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  146  		dev_err(lvds->dev, "failed to get pm runtime: %d\n", ret);
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  147  		return;
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  148  	}
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  149  
57f68ed1f08cd1 Dharma Balasubiramani 2025-06-25  150  	/* default to jeida-24 */
57f68ed1f08cd1 Dharma Balasubiramani 2025-06-25  151  	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_JEIDA;
57f68ed1f08cd1 Dharma Balasubiramani 2025-06-25  152  
57f68ed1f08cd1 Dharma Balasubiramani 2025-06-25 @153  	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
57f68ed1f08cd1 Dharma Balasubiramani 2025-06-25  154  	if (connector && connector->display_info.num_bus_formats)
57f68ed1f08cd1 Dharma Balasubiramani 2025-06-25  155  		bus_format = connector->display_info.bus_formats[0];
57f68ed1f08cd1 Dharma Balasubiramani 2025-06-25  156  
57f68ed1f08cd1 Dharma Balasubiramani 2025-06-25  157  	lvds_serialiser_on(lvds, bus_format);
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  158  }
179b0769fc5fc1 Dharma Balasubiramani 2024-04-21  159  

:::::: The code at line 153 was first introduced by commit
:::::: 57f68ed1f08cd10f51a9091645fd5dfcc369a885 drm/bridge: microchip-lvds: fix bus format mismatch with VESA displays

:::::: TO: Dharma Balasubiramani <dharma.b@microchip.com>
:::::: CC: Manikandan Muralidharan <manikandan.m@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
