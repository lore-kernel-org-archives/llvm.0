Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3311F3E51FD;
	Mon,  9 Mar 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069885; cv=none; b=tfuXMzTtSWl+3go0gAsaRBGWF5JNFelI7M6peYe8qKMhrLbuni9jdFnUUj9e0zyEpJOn5wgPewxIjChuHxn1CoVp6Fxo6HDyrSkGUSultzeKVE5T2OeGkV55+BZJnc97BJg96TZId6XUzGlw49GjTI57OajmONrr59eEVGaUQrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069885; c=relaxed/simple;
	bh=Zm+H19KovkZIyk2JXUEuxV8cjqsBV83xuyYTiMBB5sQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2VMSv3QO65ar6FThoKGqyhtH5uzScT1LX/DoZIla/T+GX2JyIkxo3CJIagfp+zc19ALqiLAmGXMzkQP9LChYw50HDGfzbTFzAspuMnC375ocz32vK0HiWxvYBfAA3wuZE1eUImckYfE0kwHTmQWP3I23DRs2jQQAciz6uBXZwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6KBtG6H; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6KBtG6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773069881; x=1804605881;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Zm+H19KovkZIyk2JXUEuxV8cjqsBV83xuyYTiMBB5sQ=;
  b=I6KBtG6H6k15gZq/TAjCvcxg8MHB/D8IckT4Ag9kc2MBZ0Ndo1Sjh8qU
   3M2QnbUwPtQK9Q9sy6YGPX/Q4f7pYmckr+XzWyF3J67e3m7SxyWuVgXrE
   +9jagiWdg9tdFP71DQRV28xJdcH35yE0cJBxJutJLILhw35kfus7wj21E
   8Pgy3+wCCu09MJLgBddmlchfuRJIQFAmU8XZweF++s7l76pLucpAFS3FA
   jCAYW3u1jC28L+n3+tQGbpn43G/Bne4pjecx3jshGmRZwFh+y3EuToN+Z
   CFRJPxk38yKJLdZXIc0u7PDzR+Zdpw0KuyyOSG40NH3Y+BWwG01eWEbw3
   A==;
X-CSE-ConnectionGUID: JxkVTRTPRe625uJoEZUW+w==
X-CSE-MsgGUID: 8JBhHGUiTKq7wOCQl4khIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85444714"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85444714"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 08:24:40 -0700
X-CSE-ConnectionGUID: ayXV64CsT3aJxsGeowFNCw==
X-CSE-MsgGUID: 3KdhRDAqR827wiM7B0Hpfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="216700210"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Mar 2026 08:24:35 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzcTA-000000000Qi-0jhd;
	Mon, 09 Mar 2026 15:24:32 +0000
Date: Mon, 9 Mar 2026 23:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw,
	Hermes Wu <Hermes.Wu@ite.com.tw>, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm/bridge: Add ITE IT6162 MIPI DSI to HDMI
 bridge driver
Message-ID: <202603092305.W1fFHKL5-lkp@intel.com>
References: <20260309-upstream-6162-v2-2-debdb6c88030@ite.com.tw>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309-upstream-6162-v2-2-debdb6c88030@ite.com.tw>

Hi Hermes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2622649ad6cdbb3e77bfafc8c0fe686090b77f70]

url:    https://github.com/intel-lab-lkp/linux/commits/Hermes-Wu-via-B4-Relay/dt-bindings-display-bridge-Add-ITE-IT6162-MIPI-DSI-to-HDMI-bridge/20260309-174457
base:   2622649ad6cdbb3e77bfafc8c0fe686090b77f70
patch link:    https://lore.kernel.org/r/20260309-upstream-6162-v2-2-debdb6c88030%40ite.com.tw
patch subject: [PATCH v2 2/2] drm/bridge: Add ITE IT6162 MIPI DSI to HDMI bridge driver
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260309/202603092305.W1fFHKL5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603092305.W1fFHKL5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603092305.W1fFHKL5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/bridge/ite-it6162.c:728:7: warning: variable 'cp_status' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     728 |                 if (it6162->hdcp_sts != hdcp_sts ||
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     729 |                     it6162->hdcp_sts == NO_HDCP_STATE) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/ite-it6162.c:759:57: note: uninitialized use occurs here
     759 |                 drm_hdcp_update_content_protection(it6162->connector, cp_status);
         |                                                                       ^~~~~~~~~
   drivers/gpu/drm/bridge/ite-it6162.c:728:3: note: remove the 'if' if its condition is always true
     728 |                 if (it6162->hdcp_sts != hdcp_sts ||
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     729 |                     it6162->hdcp_sts == NO_HDCP_STATE) {
         |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/bridge/ite-it6162.c:703:15: note: initialize the variable 'cp_status' to silence this warning
     703 |         u64 cp_status;
         |                      ^
         |                       = 0
   1 warning generated.


vim +728 drivers/gpu/drm/bridge/ite-it6162.c

   695	
   696	static void it6162_hdcp_handler(struct it6162 *it6162)
   697	{
   698		struct regmap *regmap = it6162->regmap;
   699		unsigned int tx_status, sink_cap;
   700		enum hdcp_state hdcp_sts;
   701		struct it6162_hdcp_cfg *hdcp_cfg = &it6162->hdcp_cfg;
   702		u8 hdcp_ver;
   703		u64 cp_status;
   704	
   705		if (hdcp_cfg->hdcp_version == NO_HDCP || !it6162->en_hdcp) {
   706			drm_dbg(it6162->drm, "HDCP not enabled, skip hdcp check");
   707			return;
   708		}
   709	
   710		regmap_read(regmap, OFFSET_TX_STATUS, &tx_status);
   711		regmap_read(regmap, OFFSET_SINK_CAP, &sink_cap);
   712	
   713		drm_dbg(it6162->drm, "Tx status %x", tx_status);
   714		drm_dbg(it6162->drm, "SINK capability %x", sink_cap);
   715	
   716		if (!GET_TX_VIDEO_STATUS(tx_status)) {
   717			drm_dbg(it6162->drm, "video not stable, skip hdcp check");
   718			return;
   719		}
   720	
   721		hdcp_sts = GET_TX_HDCP_STATUS(tx_status);
   722		hdcp_ver = GET_SINK_CAP_HDCP_VER(sink_cap);
   723		drm_dbg(it6162->drm, "hdcp status: %x->%x, version: %x-%x",
   724			it6162->hdcp_sts, hdcp_sts,
   725			it6162->hdcp_version, hdcp_ver);
   726	
   727		if (it6162->hdcp_version != NO_HDCP) {
 > 728			if (it6162->hdcp_sts != hdcp_sts ||
   729			    it6162->hdcp_sts == NO_HDCP_STATE) {
   730				it6162->hdcp_sts = hdcp_sts;
   731				cp_status = DRM_MODE_CONTENT_PROTECTION_DESIRED;
   732				switch (hdcp_sts) {
   733				case AUTH_DONE:
   734					drm_dbg(it6162->drm, "HDCP AUTH DONE");
   735					it6162_update_hdcp(it6162);
   736					cp_status = DRM_MODE_CONTENT_PROTECTION_ENABLED;
   737					break;
   738				case AUTH_FAIL:
   739					drm_dbg(it6162->drm, "HDCP AUTH FAIL");
   740					if (hdcp_ver == HDCP_23) {
   741						drm_dbg(it6162->drm,
   742							"HDCP 2.3 auth fail, change to HDCP 1.4");
   743						it6162_tx_hdcp_setup(it6162,
   744								     HDCP_14,
   745								     true);
   746					} else {
   747						it6162_tx_hdcp_disable(it6162);
   748					}
   749	
   750					break;
   751				default:
   752					drm_dbg(it6162->drm, "HDCP NO AUTH");
   753					it6162_tx_hdcp_setup(it6162,
   754							     it6162->hdcp_version,
   755							     true);
   756					break;
   757				}
   758			}
   759			drm_hdcp_update_content_protection(it6162->connector, cp_status);
   760		}
   761	}
   762	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
