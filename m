Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F87233D62;
	Sat,  9 Nov 2024 23:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731195375; cv=none; b=jFy9iW51v7AWjtor2RHf79XANWzX3kIgdxkyDU6/9qP5nPoEKJ/QXJkhn/AyedqkmRWtpw3QN8kqJFnwR9CRnhl6T0AgALcRdtoNOnjhA75E8ONS9/iBnpm2xf+LPVyE/2MF6X+LpaZnuyQsE6GC/CarYbEL03tTLuMhqZ0gRiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731195375; c=relaxed/simple;
	bh=AHoTS9qpYMcBhFBr992/66gjZhJT11vquEAsPR0mGpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JZerLKHKFEmhEwCLRxlMTVAANR/o2PZJgH/kavDMDIghvYTgWq1fk0GR82aZT1m4zzOkoCuMSWaysD9ig9f+LGEj1DFO99AT/Ndi/HO+hFSOIeyQ7SOhT/P7iz/rxTDWoMNSCZqpoWpHKi9JvZnPG223cmBph6Zj+B6bGhshQxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2GhU/Rt; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2GhU/Rt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731195373; x=1762731373;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AHoTS9qpYMcBhFBr992/66gjZhJT11vquEAsPR0mGpE=;
  b=Q2GhU/RtQ/gGttXktsjJd5TGwQkR8/9ZyFOahKA7DScm1y9eA9Trn6Fe
   QhMgtAq6bhPPzj/qTYtxYNqf1cRpTTwkRY995GD4TX9v+SL2RL/NSiwnh
   EtVHWpFfUKX185ScN65cIuEuCLWjwbNTP74IZ9ERphiX7ncqyUoM70uO6
   0DLXlCgCs0XrofpvAzvmLjk/OqciRWuYFW2oRmOJBBXT8umEzW4Zudvsm
   G4/Iv+trfBij4vRkUPVplKGDkuW8N8qS0V22OtrH/sZfU98JrmSSc4d4r
   OcFFYwn+O69+Ifvt3FtV5/vxdAW5XoIyGNu0xf83LTLhMdkGCrQE2Zq9z
   Q==;
X-CSE-ConnectionGUID: lFBiE6HASn+1AYAcNs0jkw==
X-CSE-MsgGUID: zy8IHWyKQPqX+xz0mc+5jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31204492"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31204492"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 15:36:12 -0800
X-CSE-ConnectionGUID: 5/hks4owS66/jCQDGPfVBg==
X-CSE-MsgGUID: 9rBc9ha/QBePMM8dGBkE6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="86359995"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Nov 2024 15:36:05 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9uzq-000slu-32;
	Sat, 09 Nov 2024 23:36:02 +0000
Date: Sun, 10 Nov 2024 07:35:37 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Alain Volmat <alain.volmat@foss.st.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 6/7] drm/display/hdmi: implement connector update
 functions
Message-ID: <202411100703.ctS5uHcW-lkp@intel.com>
References: <20241109-drm-bridge-hdmi-connector-v3-6-c15afdca5884@linaro.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109-drm-bridge-hdmi-connector-v3-6-c15afdca5884@linaro.org>

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 929beafbe7acce3267c06115e13e03ff6e50548a]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Baryshkov/ASoC-hdmi-codec-pass-data-to-get_dai_id-too/20241109-205026
base:   929beafbe7acce3267c06115e13e03ff6e50548a
patch link:    https://lore.kernel.org/r/20241109-drm-bridge-hdmi-connector-v3-6-c15afdca5884%40linaro.org
patch subject: [PATCH v3 6/7] drm/display/hdmi: implement connector update functions
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241110/202411100703.ctS5uHcW-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100703.ctS5uHcW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100703.ctS5uHcW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/drm/bridge/ite-it6263.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/bridge/ite-it6263.c:19:
>> include/drm/display/drm_hdmi_state_helper.h:24:21: warning: declaration of 'struct drm_edid' will not be visible outside of this function [-Wvisibility]
      24 |                                                  const struct drm_edid *drm_edid);
         |                                                               ^
   5 warnings generated.


vim +24 include/drm/display/drm_hdmi_state_helper.h

    10	
    11	void __drm_atomic_helper_connector_hdmi_reset(struct drm_connector *connector,
    12						      struct drm_connector_state *new_conn_state);
    13	
    14	int drm_atomic_helper_connector_hdmi_check(struct drm_connector *connector,
    15						   struct drm_atomic_state *state);
    16	
    17	int drm_atomic_helper_connector_hdmi_update_audio_infoframe(struct drm_connector *connector,
    18								    struct hdmi_audio_infoframe *frame);
    19	int drm_atomic_helper_connector_hdmi_clear_audio_infoframe(struct drm_connector *connector);
    20	int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *connector,
    21							       struct drm_atomic_state *state);
    22	
    23	int drm_atomic_helper_connector_hdmi_update_edid(struct drm_connector *connector,
  > 24							 const struct drm_edid *drm_edid);
    25	int drm_atomic_helper_connector_hdmi_update(struct drm_connector *connector);
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
