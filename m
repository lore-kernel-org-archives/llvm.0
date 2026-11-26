Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795663435;
	b=AYAjw1kXR1NpTHyltbThq/APBsJYm5LHAHiX+GQd0az1O7T4VMBn7MSqBLtBCgA60Pm3
	 R7OOWOxrHQU+3EqJswNOW17s06pEm+AjDkiFhfnbkZyeLTdEs7tmdAFii38Fw2tLMZ9WP
	 ZcDk+pLB4biSTizBcPok1feMvjrqT/EFjwS68AhsvySn7pL8K2mmEybwPqfVjiIHbEjYA
	 HAF6P2KYMsCpB7S5QslF1TpWWsKqNC+Jmuu+4OMOv6OlKmdw9bRmh/bLLIY0pG8dpH42z
	 ZtQ3BEPqMdFfCXQWHOCo/5FyiG5OqG7Ab/ZJJ+7oo66noZvv/Y1uEIKINxIHheSMLmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795663435;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9SCIE49WMzYwPp4ktfSJeuROtN0FBbwcDPIEmVvuWLE=;
	b=G8a3TDbWhGfnKe+SfvlyMgjvQAqNSMtCuGGwrwQl23YWuBqef8bV5nvemZdnBf+sExek
	 B1TU+yF1RD71QieoCzawAw61XvyieTlxiInQfJjzxueMzJKmwXZUkTgnHtApiwiWX/S/5
	 I0Zw3ZGQjm3zeAgEZor/NBIgg9LzQcX8jADQ6gkCGFsjffnDembk7m3P/Tmil4Ma4a+Bj
	 X7rskLUv99w87J7pjrVOyUdTjntWPg3/6FupZ9mtgKXjxZOWYQ2cjW24gaLeZbBcWo+i0
	 hbmQAjWoyDjIqxiPIEOLbBZSSW/y86fqyJQ9aKYoVvyD1a0j71M8jbVq7lPCvBMwysA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hj0M3Cjt;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05819606A31E;
	Thu, 26 Nov 2026 03:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05819606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hj0M3Cjt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795663435; x=1827199435;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KzqInPU2T2Q0Ilp3D07UjggUx1G2Mky+EM6C1eJB5pc=;
  b=hj0M3CjtiaSETNpzNPDe0AQawt+h8NFZRBR+a8LP8WFIdiuXUc5//gNB
   jh9odwhqTOscg+q37lIw35Z7ql7sGD334xPV/KmZoDjGv0hiW2BSjf4ro
   za/g96sFrQOyT/FOOop9n8qyIP4zUc0j0X6Ao1khiWxqUBjUgaCbmkWYw
   OGwVHjnRMJccTc09PvkgYAKMeXlT6+vC/fR0bJzN7Yc90E5FwJ2MQ61QQ
   p7NwTR/2yBUN/UjmcPmC2I55h9BFfmAUiJQD0MCYo4uVjkC/DUJWir77L
   53vlwnjkxKSjXUJXBYSPK3Exlh8lFm4duEaSNGO2rY++QJ9W5hHrQ573j
   g==;
X-CSE-ConnectionGUID: 4RAbfTTVQaWKHaqOSy9qRQ==
X-CSE-MsgGUID: Dac3le9VRiqB3pkR6/M8lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4485842"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4485842"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 19:23:54 -0800
X-CSE-ConnectionGUID: FExLKwtwQte2U/pAERnWMw==
X-CSE-MsgGUID: drPz814hQpa2PRHK4FNyQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12083337"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2026 19:23:48 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWQ5H-00000001TDO-2xfE;
	Thu, 26 Nov 2026 03:23:43 +0000
Date: Thu, 26 Nov 2026 11:23:16 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Javier Martinez Canillas <javierm@redhat.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Hui Pu <Hui.Pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 32/32] drm/mxsfb/lcdif: enable bridge hotplug
Message-ID: <20261126111350.x2HRRGyo-lkp@intel.com>
References: <20261125-drm-bridge-hotplug-v4-32-822722850492@bootlin.com>
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125-drm-bridge-hotplug-v4-32-822722850492@bootlin.com>

Hi Luca,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 479e381e77dcde0dfcc9d51e89ff3273da199804]

url:    https://github.com/intel-lab-lkp/linux/commits/Luca-Ceresoli/drm-display-hdmi-cec-helper-use-drmm_-prefix-for-drmm-action/20261125-185014
base:   479e381e77dcde0dfcc9d51e89ff3273da199804
patch link:    https://lore.kernel.org/r/20261125-drm-bridge-hotplug-v4-32-822722850492%40bootlin.com
patch subject: [PATCH v4 32/32] drm/mxsfb/lcdif: enable bridge hotplug
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261126/20261126111350.x2HRRGyo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2012344e5da8e03ea4b8283ecd6fad6e13f09d64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126111350.x2HRRGyo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126111350.x2HRRGyo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/display/drm_hotplug_helper.c:235:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
     235 |         }
         |         ^
   1 warning generated.


vim +235 drivers/gpu/drm/display/drm_hotplug_helper.c

6ee877a9b7f826 Luca Ceresoli 2026-11-25  200  
6ee877a9b7f826 Luca Ceresoli 2026-11-25  201  static int drm_hotplug_helper_handle_event(struct notifier_block *nb,
6ee877a9b7f826 Luca Ceresoli 2026-11-25  202  					   unsigned long event, void *data)
6ee877a9b7f826 Luca Ceresoli 2026-11-25  203  {
6ee877a9b7f826 Luca Ceresoli 2026-11-25  204  	struct drm_hotplug_helper *hotplug_helper =
6ee877a9b7f826 Luca Ceresoli 2026-11-25  205  		container_of(nb, struct drm_hotplug_helper, drm_event_nb);
6ee877a9b7f826 Luca Ceresoli 2026-11-25  206  	struct device *dev = hotplug_helper->encoder->dev->dev;
6ee877a9b7f826 Luca Ceresoli 2026-11-25  207  
6ee877a9b7f826 Luca Ceresoli 2026-11-25  208  	guard(mutex)(&hotplug_helper->event_mutex);
6ee877a9b7f826 Luca Ceresoli 2026-11-25  209  
6ee877a9b7f826 Luca Ceresoli 2026-11-25  210  	dev_dbg(dev, "received event %lu\n", event);
6ee877a9b7f826 Luca Ceresoli 2026-11-25  211  
6ee877a9b7f826 Luca Ceresoli 2026-11-25  212  	switch (event) {
6ee877a9b7f826 Luca Ceresoli 2026-11-25  213  	case DRM_BRIDGE_ADDED:
6ee877a9b7f826 Luca Ceresoli 2026-11-25  214  	case DRM_MIPI_DSI_ATTACHED:
6ee877a9b7f826 Luca Ceresoli 2026-11-25  215  		/*
6ee877a9b7f826 Luca Ceresoli 2026-11-25  216  		 * A bridges hot-plugged, try adding the
6ee877a9b7f826 Luca Ceresoli 2026-11-25  217  		 * drm_bridge_connector
6ee877a9b7f826 Luca Ceresoli 2026-11-25  218  		 */
6ee877a9b7f826 Luca Ceresoli 2026-11-25  219  		drm_hotplug_helper_try_complete(hotplug_helper);
6ee877a9b7f826 Luca Ceresoli 2026-11-25  220  		break;
6ee877a9b7f826 Luca Ceresoli 2026-11-25  221  	case DRM_BRIDGE_DETACHED:
6ee877a9b7f826 Luca Ceresoli 2026-11-25  222  	{
6ee877a9b7f826 Luca Ceresoli 2026-11-25  223  		/*
6ee877a9b7f826 Luca Ceresoli 2026-11-25  224  		 * A bridge was unplugged, remove the drm_bridge_connector
6ee877a9b7f826 Luca Ceresoli 2026-11-25  225  		 * if it's part of the same pipeline
6ee877a9b7f826 Luca Ceresoli 2026-11-25  226  		 */
6ee877a9b7f826 Luca Ceresoli 2026-11-25  227  		struct drm_bridge *bridge = (struct drm_bridge *)data;
6ee877a9b7f826 Luca Ceresoli 2026-11-25  228  
6ee877a9b7f826 Luca Ceresoli 2026-11-25  229  		if (hotplug_helper->connector &&
6ee877a9b7f826 Luca Ceresoli 2026-11-25  230  		    bridge->encoder == hotplug_helper->encoder)
6ee877a9b7f826 Luca Ceresoli 2026-11-25  231  			drm_hotplug_helper_connector_remove(hotplug_helper);
6ee877a9b7f826 Luca Ceresoli 2026-11-25  232  		break;
6ee877a9b7f826 Luca Ceresoli 2026-11-25  233  	}
6ee877a9b7f826 Luca Ceresoli 2026-11-25  234  	default:
6ee877a9b7f826 Luca Ceresoli 2026-11-25 @235  	}
6ee877a9b7f826 Luca Ceresoli 2026-11-25  236  
6ee877a9b7f826 Luca Ceresoli 2026-11-25  237  	return NOTIFY_DONE;
6ee877a9b7f826 Luca Ceresoli 2026-11-25  238  }
6ee877a9b7f826 Luca Ceresoli 2026-11-25  239  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
