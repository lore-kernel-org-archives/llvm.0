Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795476596;
	b=tiaWwIvrUEUXdZHcd99/sdQ9BDQixwp8/fjssn4oqHJt/Ek2NNP/mLcheCatDwfWCxe9
	 QmM2V54fKMLfBFcKmHXNwSLJIWtJWwF57D6nTfJCbPIGkX+C2buvUg9DW5+XfeZ+OzVux
	 C/oGOjFfl44NVSG9i7oGo5a6GTB/9WkFm7Y2LDk9vPGlOgomPsbp66t6myiS5yWRwN73g
	 UR27IeooqQgYYGudX+NzOzsblTl0l5R/fvrF+oy/ZH4bYaPf4+cQ7KaFZaALdHOqki1G5
	 kFgPuNmzJtm8OgAlTvrzzGLuY26MzxiGBftAo1WVimh4DqLv3KqyoIRoFeO+0L1k4/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795476596;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ij62NLxX4FUHE68o/nDUnkcGX/NAQzCWZMg6PCtAUGA=;
	b=mPtZ8n8wmqgx2g+3katfgiebasQNwO9HQqkdA/Xp8VzBslnD9SXhCb46/jW8ud28X3Cc
	 9/g/7im34r16q9rKoH2kE3GNrm+/vdoj21UGTfed1pe2BySQGxizeTEoVzYANKWlp4J/3
	 DXp3FOHwCS3g6R2MSMrBYfQ/9ZWcLE+dJWRlvS1uahQow1mz8Nn+lBDpDcfIT3bEM9jps
	 WKeIZ6MbZysCGLNbHTPv9oiGwie8L7gDH8vipMBRgycPDXw2qOKqo5JXuJ+3xBWGXsCpx
	 ACG4ZLlQykHs8GrBptRfvZTAHE7CFsauwgOUsgyxqyqJ4GUznUpn9Kxl3CtHZsgVhoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hRGm1da0;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A14606A31E;
	Mon, 23 Nov 2026 23:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0A14606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hRGm1da0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795476597; x=1827012597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+aoNxvX7CA7N3D6kz0fvGw63xB3T4spyF1H1SMyB54M=;
  b=hRGm1da023mP8MnCj0/8asUjl0Beef4canXEMSKYxDKx7AOjNP9DnXLc
   Ez7nIqmVpTGD6LuivkQ5mJDrYSefmAHXFCHdUz3xQ4XxY5Dos/tiho9hH
   KDjYvt6qb12lOAVAA+nFTrPKCb+OAFw/L5lmcELb2UA2yrtVoy7j9MuN7
   KkUvlTGqcedNZacw/0lnEZ0cxUevoDl2uQicqNfsF3Lg7w4hjWlxj9WBO
   FKstJNoFwTPz9aRG4kpWrROug6fs0XV2BoibQL4TAm4RNCb/j5Z+sw0W5
   oc7PMfmYkXaLEkoSU1l4bdXyRODxu/1kCgbxcDIhYz4Pnl7fcjCv8wp52
   Q==;
X-CSE-ConnectionGUID: RqmSvmLSQriPCrqQ1zOCDA==
X-CSE-MsgGUID: 8Pt/p0L7Q2CEbDP9XQNdBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4345317"
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="4345317"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 15:29:53 -0800
X-CSE-ConnectionGUID: i7U20as+TeeqpmGBO9jDcA==
X-CSE-MsgGUID: QplunU+aTYG6CetzR8lwVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,229,1787036400"; 
   d="scan'208";a="13106883"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 23 Nov 2026 15:29:47 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVdTk-00000001O74-0NaF;
	Mon, 23 Nov 2026 23:29:44 +0000
Date: Tue, 24 Nov 2026 07:28:44 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srini@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/24] ASoC: codecs: wsa884x: register the die
 temperature as a thermal zone
Message-ID: <20261124071812.oiRgQnHg-lkp@intel.com>
References: <20261122161437.5994-9-srinivas.kandagatla@oss.qualcomm.com>
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
In-Reply-To: <20261122161437.5994-9-srinivas.kandagatla@oss.qualcomm.com>

Hi Srinivas,

kernel test robot noticed the following build errors:

[auto build test ERROR on next-20261120]
[cannot apply to broonie-sound/for-next tiwai-sound/for-next tiwai-sound/for-linus robh/for-next v7.4-rc3 v7.4-rc2 v7.4-rc1 linus/master v7.4-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-soc-pcm-add-multi_direction_codecs-link-flag/20261122-161415
base:   next-20261120
patch link:    https://lore.kernel.org/r/20261122161437.5994-9-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH v2 08/24] ASoC: codecs: wsa884x: register the die temperature as a thermal zone
config: sparc64-randconfig-1000-20261124 (https://download.01.org/0day-ci/archive/20261124/20261124071812.oiRgQnHg-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261124/20261124071812.oiRgQnHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261124071812.oiRgQnHg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/wsa884x.c:2248:11: error: passing 'const struct thermal_zone_device_ops *' to parameter of type 'struct thermal_zone_device_ops *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
    2248 |                                                            &wsa884x_tz_ops,
         |                                                            ^~~~~~~~~~~~~~~
   include/linux/thermal.h:333:38: note: passing argument to parameter 'ops' here
     333 |                                         struct thermal_zone_device_ops *ops,
         |                                                                         ^
   1 error generated.


vim +2248 sound/soc/codecs/wsa884x.c

  2143	
  2144	static int wsa884x_probe(struct sdw_slave *pdev,
  2145				 const struct sdw_device_id *id)
  2146	{
  2147		struct device *dev = &pdev->dev;
  2148		struct wsa884x_priv *wsa884x;
  2149		unsigned int i;
  2150		int ret;
  2151	
  2152		wsa884x = devm_kzalloc_obj(dev, *wsa884x);
  2153		if (!wsa884x)
  2154			return -ENOMEM;
  2155	
  2156		mutex_init(&wsa884x->sp_lock);
  2157	
  2158		for (i = 0; i < WSA884X_SUPPLIES_NUM; i++)
  2159			wsa884x->supplies[i].supply = wsa884x_supply_name[i];
  2160	
  2161		ret = devm_regulator_bulk_get(dev, WSA884X_SUPPLIES_NUM,
  2162					      wsa884x->supplies);
  2163		if (ret)
  2164			return dev_err_probe(dev, ret, "Failed to get regulators\n");
  2165	
  2166		ret = regulator_bulk_enable(WSA884X_SUPPLIES_NUM, wsa884x->supplies);
  2167		if (ret)
  2168			return dev_err_probe(dev, ret, "Failed to enable regulators\n");
  2169	
  2170		ret = devm_add_action_or_reset(dev, wsa884x_regulator_disable,
  2171					       wsa884x->supplies);
  2172		if (ret)
  2173			return ret;
  2174	
  2175		ret = wsa884x_get_reset(dev, wsa884x);
  2176		if (ret)
  2177			return ret;
  2178	
  2179		dev_set_drvdata(dev, wsa884x);
  2180		wsa884x->slave = pdev;
  2181		wsa884x->dev = dev;
  2182		wsa884x->dev_mode = WSA884X_SPEAKER;
  2183		wsa884x->sconfig.ch_count = 1;
  2184		wsa884x->sconfig.bps = 1;
  2185		wsa884x->sconfig.direction = SDW_DATA_DIR_RX;
  2186		wsa884x->sconfig.type = SDW_STREAM_PDM;
  2187	
  2188		/*
  2189		 * Port map index starts with 0, however the data port for this codec
  2190		 * are from index 1
  2191		 */
  2192		if (of_property_read_u32_array(dev->of_node, "qcom,port-mapping", &pdev->m_port_map[1],
  2193						WSA884X_MAX_SWR_PORTS))
  2194			dev_dbg(dev, "Static Port mapping not specified\n");
  2195	
  2196		pdev->prop.sink_ports = GENMASK(WSA884X_MAX_SWR_PORTS - 1, 0) & ~BIT(WSA884X_PORT_VISENSE);
  2197		pdev->prop.source_ports = BIT(WSA884X_PORT_VISENSE);
  2198		pdev->prop.simple_clk_stop_capable = true;
  2199		pdev->prop.sink_dpn_prop = wsa884x_sink_dpn_prop;
  2200		pdev->prop.src_dpn_prop = wsa884x_src_dpn_prop;
  2201		pdev->prop.scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY;
  2202	
  2203		wsa884x_reset_deassert(wsa884x);
  2204		ret = devm_add_action_or_reset(dev, wsa884x_reset_powerdown, wsa884x);
  2205		if (ret)
  2206			return ret;
  2207	
  2208		wsa884x->regmap = devm_regmap_init_sdw(pdev, &wsa884x_regmap_config);
  2209		if (IS_ERR(wsa884x->regmap))
  2210			return dev_err_probe(dev, PTR_ERR(wsa884x->regmap),
  2211					     "regmap_init failed\n");
  2212	
  2213		/* Start in cache-only until device is enumerated */
  2214		regcache_cache_only(wsa884x->regmap, true);
  2215	
  2216		if (IS_REACHABLE(CONFIG_HWMON)) {
  2217			struct device *hwmon;
  2218	
  2219			hwmon = devm_hwmon_device_register_with_info(dev, "wsa884x",
  2220								     wsa884x,
  2221								     &wsa884x_hwmon_chip_info,
  2222								     NULL);
  2223			if (IS_ERR(hwmon))
  2224				return dev_err_probe(dev, PTR_ERR(hwmon),
  2225						     "Failed to register hwmon sensor\n");
  2226		}
  2227	
  2228		pm_runtime_set_autosuspend_delay(dev, 3000);
  2229		pm_runtime_use_autosuspend(dev);
  2230		pm_runtime_mark_last_busy(dev);
  2231		pm_runtime_set_active(dev);
  2232		ret = devm_pm_runtime_enable(dev);
  2233		if (ret)
  2234			return ret;
  2235	
  2236		if (IS_REACHABLE(CONFIG_THERMAL)) {
  2237			char tz_name[THERMAL_NAME_LENGTH];
  2238			struct thermal_zone_device *tz;
  2239	
  2240			/*
  2241			 * Register after runtime PM is enabled, as the zone is read
  2242			 * right away. dev_name() is too long for a zone name.
  2243			 */
  2244			scnprintf(tz_name, sizeof(tz_name), "wsa-%d-%u",
  2245				  pdev->bus->id, pdev->id.unique_id);
  2246			tz = thermal_tripless_zone_device_register(tz_name,
  2247								   wsa884x,
> 2248								   &wsa884x_tz_ops,
  2249								   NULL);
  2250			if (IS_ERR(tz)) {
  2251				dev_warn(dev,
  2252					 "thermal zone '%s' registration failed (%ld); SP T0 kcontrol will read 0 for this codec\n",
  2253					 tz_name, PTR_ERR(tz));
  2254			} else {
  2255				ret = devm_add_action_or_reset(dev,
  2256							       wsa884x_tz_unregister,
  2257							       tz);
  2258				if (ret)
  2259					return ret;
  2260	
  2261				thermal_zone_device_enable(tz);
  2262			}
  2263		}
  2264	
  2265		return devm_snd_soc_register_component(dev,
  2266						       &wsa884x_component_drv,
  2267						       wsa884x_dais,
  2268						       ARRAY_SIZE(wsa884x_dais));
  2269	}
  2270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
