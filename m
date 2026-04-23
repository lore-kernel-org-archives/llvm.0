Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E64A371053;
	Thu, 23 Apr 2026 04:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776918551; cv=none; b=ZoadXuaEiXpd5glp2fZ+VNAfGIP57sCs/gnACmEby902PKg/6gZgbVc1vjMlq1aZuFxVHciLjF0nkwb7ncXHmVmMtCeJUq3SqxVLhUx41xwwb+97ZXYKWdShwA55j1oL0ip2Pcz6smw4rjYp4tv6vzpHGaVHVjjj71hD3N1qcG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776918551; c=relaxed/simple;
	bh=ZMb5YrwAz5yRFO/s/tEHThMsgPC1cr4Y6u/lA6BREp8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WNODKT4cs9tdEgnOgHZEhFno26IfrExAOQidmlYxXO9+q7jUeJsE7PLQyBFKk+SeFoo5u5hpmZNbuGg4Cn4wCYPIZLqmac9nq9BjZ5gCNoKg3PNUAoYrfdNWrG4s/P1XdMnBr3XJZZLVT2rkzvSMCdK1cYYgAkPGjgipt4VYrtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HvzcHebk; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HvzcHebk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776918550; x=1808454550;
  h=date:from:to:cc:subject:message-id;
  bh=ZMb5YrwAz5yRFO/s/tEHThMsgPC1cr4Y6u/lA6BREp8=;
  b=HvzcHebkbqpjkvaMy26bLtzeulyTj6NCxeUk+znzeuh5Tg12mwKVCYHL
   auW01DAMdCWBRRTXXEbHoZ+kU7vg+rVt+HiYGikth93HEVGSiLe5Q+pwR
   sGpDJHxBCOG0iFAFzKcianhgO8v9Uv7kKEUVvefR2CZSqJE3TViyglYpm
   R26H6X0g47UYUvkr7wz8NRk21slbBllGq6H0uoS14IQ8E7XRLwDO9h08l
   PBgVd5uIHA4I8Th8a7kCJ2SNieY5g8oYKLiTZNuWSokoY5k9va4OImBtj
   wZWJv8uHZo/Je7jVfc60yq8A4EzpcX7BbXkBhyv+Wj/wyZVNyEzkuGLAO
   Q==;
X-CSE-ConnectionGUID: maGaWUuOQL6qM62IZQgehA==
X-CSE-MsgGUID: XtGBEXr1SdifgA7qORNtOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11764"; a="77761327"
X-IronPort-AV: E=Sophos;i="6.23,194,1770624000"; 
   d="scan'208";a="77761327"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 21:29:09 -0700
X-CSE-ConnectionGUID: 8PnrON1TSCCPFFWJju+z7Q==
X-CSE-MsgGUID: 9kjNsZsPQz+Hzp8LBeSB3A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 22 Apr 2026 21:29:07 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFlgQ-000000001St-06Fm;
	Thu, 23 Apr 2026 04:28:58 +0000
Date: Thu, 23 Apr 2026 12:28:33 +0800
From: kernel test robot <lkp@intel.com>
To: KancyJoe <kancy2333@outlook.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [superna9999:topic/sm8650/ayaneo-pocket-s2/pmos-v3 7/26]
 sound/soc/qcom/qdsp6/audioreach.c:755:29: error: cannot assign to variable
 'module' with const-qualified type 'const struct audioreach_module *'
Message-ID: <202604231213.g3VRFPQk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/superna9999/linux topic/sm8650/ayaneo-pocket-s2/pmos-v3
head:   8bac0544d1a4e155182b87aca13870ba2a0a3c49
commit: 29cdaf388e5fb3df4c09814c374e4aec27bddfed [7/26] audioreach: Add dedicated WSA2 support.
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260423/202604231213.g3VRFPQk-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260423/202604231213.g3VRFPQk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604231213.g3VRFPQk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/qcom/qdsp6/audioreach.c:755:29: error: cannot assign to variable 'module' with const-qualified type 'const struct audioreach_module *'
     755 |                 module->hw_interface_type = 2;  // need to set lpaif type back to WSA after set active channel mask
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   sound/soc/qcom/qdsp6/audioreach.c:692:40: note: variable 'module' declared const here
     692 |                                                  const struct audioreach_module *module,
         |                                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   1 error generated.


vim +755 sound/soc/qcom/qdsp6/audioreach.c

   689	
   690	/* LPASS Codec DMA port Module Media Format Setup */
   691	static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
   692							 const struct audioreach_module *module,
   693							 const struct audioreach_module_config *cfg)
   694	{
   695		struct apm_codec_dma_module_intf_cfg *intf_cfg;
   696		struct apm_module_frame_size_factor_cfg *fs_cfg;
   697		struct apm_module_hw_ep_power_mode_cfg *pm_cfg;
   698		struct apm_module_param_data *param_data;
   699		struct apm_module_hw_ep_mf_cfg *hw_cfg;
   700		int ic_sz = APM_CDMA_INTF_CFG_PSIZE;
   701		int ep_sz = APM_HW_EP_CFG_PSIZE;
   702		int fs_sz = APM_FS_CFG_PSIZE;
   703		int pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
   704		int size = ic_sz + ep_sz + fs_sz + pm_sz;
   705		void *p;
   706	
   707		struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
   708		static u8 last_active_channel_mask = 0;
   709	
   710		if (IS_ERR(pkt))
   711			return PTR_ERR(pkt);
   712	
   713		p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
   714	
   715		hw_cfg = p;
   716		param_data = &hw_cfg->param_data;
   717		param_data->module_instance_id = module->instance_id;
   718		param_data->error_code = 0;
   719		param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
   720		param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
   721	
   722		hw_cfg->mf.sample_rate = cfg->sample_rate;
   723		hw_cfg->mf.bit_width = cfg->bit_width;
   724		hw_cfg->mf.num_channels = cfg->num_channels;
   725		hw_cfg->mf.data_format = module->data_format;
   726		p += ep_sz;
   727	
   728		fs_cfg = p;
   729		param_data = &fs_cfg->param_data;
   730		param_data->module_instance_id = module->instance_id;
   731		param_data->error_code = 0;
   732		param_data->param_id = PARAM_ID_HW_EP_FRAME_SIZE_FACTOR;
   733		param_data->param_size = fs_sz - APM_MODULE_PARAM_DATA_SIZE;
   734		fs_cfg->frame_size_factor = 1;
   735		p += fs_sz;
   736	
   737		intf_cfg = p;
   738		param_data = &intf_cfg->param_data;
   739		param_data->module_instance_id = module->instance_id;
   740		param_data->error_code = 0;
   741		param_data->param_id = PARAM_ID_CODEC_DMA_INTF_CFG;
   742		param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
   743	
   744		intf_cfg->cfg.lpaif_type = module->hw_interface_type;
   745		intf_cfg->cfg.intf_index = module->hw_interface_idx;
   746		// dev_err(graph->dev, "IDX: 0x%08X, TYPE: 0x%08X", module->hw_interface_idx, module->hw_interface_type);
   747	
   748		if((intf_cfg->cfg.lpaif_type == 7 && cfg->num_channels <= 2 && intf_cfg->cfg.intf_index == 1)
   749			|| ((intf_cfg->cfg.intf_index == 1) && (intf_cfg->cfg.lpaif_type == 2) && (cfg->num_channels <= 2) && (last_active_channel_mask>>2 & 0b11) != 0)) // Dedicated WSA2 RX0
   750		{
   751			intf_cfg->cfg.active_channels_mask = ((1 << cfg->num_channels) - 1) << 2; 
   752			last_active_channel_mask = intf_cfg->cfg.active_channels_mask;
   753			// dev_err(graph->dev, "Setting mask to 0b1100");
   754			intf_cfg->cfg.lpaif_type = 2;	// adsp do not support WSA2 DMA
 > 755			module->hw_interface_type = 2;	// need to set lpaif type back to WSA after set active channel mask
   756		} else
   757			intf_cfg->cfg.active_channels_mask = (1 << cfg->num_channels) - 1;
   758	
   759		p += ic_sz;
   760	
   761		pm_cfg = p;
   762		param_data = &pm_cfg->param_data;
   763		param_data->module_instance_id = module->instance_id;
   764		param_data->error_code = 0;
   765		param_data->param_id = PARAM_ID_HW_EP_POWER_MODE_CFG;
   766		param_data->param_size = pm_sz - APM_MODULE_PARAM_DATA_SIZE;
   767		pm_cfg->power_mode.power_mode = 0;
   768	
   769		return q6apm_send_cmd_sync(graph->apm, pkt, 0);
   770	}
   771	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
