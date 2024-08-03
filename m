Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602D16D1B9;
	Sat,  3 Aug 2024 22:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722725952; cv=none; b=H76C2s+tG1klkulvDcVHbcasKIhV2c1LtOSqpsL9DZ36d8FfD42rJyfDwlJX2oK5NwKoxHUE/g0W75uU96Lrbm7kQN3sAwSIG+GM8lMYAnmsLS8bcHcOuvUh8k/tgQiw0UCZnhOmtROvC11uXFH69POoDt4XXKzE34Gs9cgDOXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722725952; c=relaxed/simple;
	bh=7vd6bAHUCHPNdoz1T/kNUu0ljp7Jwf7gWlE8XxSW/Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UFG8nkADhD1BVyQxjAnYzdBCRpr89r887NsIYO034e/FQwy/A967zHsEAgju7OUEi6oTUmMnswPRBPuHIKQwcNtA1TCQv//XVPGZJzLyY/UkFhABxB6BQ/wZ1cmnLM3XeDcYCPsVW00n/PrsKwf2Cxfu7OPCmi595kg0dtpl/Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WwOCS5c/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WwOCS5c/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722725951; x=1754261951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7vd6bAHUCHPNdoz1T/kNUu0ljp7Jwf7gWlE8XxSW/Vk=;
  b=WwOCS5c/sBzDXjFBr66VWSXGbkNivHplEb8e1b4bYNthzmWI9/Ytx0o1
   WmkvI9MxKuqL46FA1LlBIxmCvTysKVLVYade3VDaMs80nmdVeXKSU8f25
   2rkyQP70DHZLUOw1Htu5kkd4CFj2abrP63pYkCzy5HsCcmR3R/KObCe+W
   a+K+2Z80PPqHixFHHD5nuK8Yozmc117pGNt0HkT7glqf2Ny02mITzqjwa
   fnTc9p3Ghh6xsdGVy1ekNMr0Y/SZnW6wzK/CLkwvW9kS+GWRhXlWwJ8NA
   zftR2CJxc+EsvCcw/rNKPgG4BdXUrWcsChs1wdmGPQFSL9jscSP+m97kY
   Q==;
X-CSE-ConnectionGUID: HNxa0q9uQCqxqYHsj7VR8A==
X-CSE-MsgGUID: iZStMQodR42UyCkPW/ymdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="12860597"
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="12860597"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 15:59:10 -0700
X-CSE-ConnectionGUID: KKSv+4XuSUS5gBxAo5DiNw==
X-CSE-MsgGUID: XMKLH5vmQOis/XOZjpa9rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,261,1716274800"; 
   d="scan'208";a="56375841"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Aug 2024 15:59:08 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saNiL-00010o-0F;
	Sat, 03 Aug 2024 22:59:05 +0000
Date: Sun, 4 Aug 2024 06:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mounik Katikala <mounik.katikala@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 1076/1093]
 drivers/media/platform/xilinx/xilinx-isppipeline.c:582:11: error: call to
 undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202408040604.GRM891tZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   868286d51b5753a66ab89c1c899510c6047b998d
commit: 4bb3a1e83a07aa7e02851f53298c1102fa37a28e [1076/1093] v4l: xilinx: isppipeline: Add support for Gain Control
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240804/202408040604.GRM891tZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240804/202408040604.GRM891tZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408040604.GRM891tZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/xilinx/xilinx-isppipeline.c:477:27: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     477 |         bool in_type_conf_gain = XGET_BIT(XISP_IN_TYPE_INDEX, xisp->module_conf);
         |                                  ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:153:36: note: expanded from macro 'XGET_BIT'
     153 | #define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
         |                                    ^
>> drivers/media/platform/xilinx/xilinx-isppipeline.c:582:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     582 |                                      (FIELD_PREP(GENMASK(XISP_UPPER_WORD_MSB,
         |                                       ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:592:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     592 |                                      (FIELD_PREP(GENMASK(XISP_UPPER_WORD_MSB,
         |                                       ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:602:11: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     602 |                                      (FIELD_PREP(GENMASK(XISP_UPPER_WORD_MSB,
         |                                       ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:1094:7: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1094 |                 if (FIELD_GET(BIT(XISP_RGBIR_INDEX), xisp->module_en))
         |                     ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:1435:18: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1435 |         bool en_index = XGET_BIT(index, xisp->module_en);
         |                         ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:153:36: note: expanded from macro 'XGET_BIT'
     153 | #define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
         |                                    ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:1557:7: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1557 |                 if (XGET_BIT(XISP_CCM_INDEX, xisp->module_en))
         |                     ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:153:36: note: expanded from macro 'XGET_BIT'
     153 | #define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
         |                                    ^
   7 errors generated.


vim +/FIELD_PREP +582 drivers/media/platform/xilinx/xilinx-isppipeline.c

   469	
   470	static int xisp_s_ctrl(struct v4l2_ctrl *ctrl)
   471	{
   472		struct xisp_dev *xisp =
   473			container_of(ctrl->handler,
   474				     struct xisp_dev, ctrl_handler);
   475		bool degamma_enabled, degamma_bypass_enabled, degamma_bypass;
   476		bool ccm_enabled, ccm_bypass_enabled, ccm_bypass;
   477		bool in_type_conf_gain = XGET_BIT(XISP_IN_TYPE_INDEX, xisp->module_conf);
   478	
   479		switch (ctrl->id) {
   480		case V4L2_CID_XILINX_ISP_AEC_EN:
   481			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   482								 XISP_AEC_INDEX, ctrl->val);
   483			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   484			break;
   485		case V4L2_CID_XILINX_ISP_AEC_THRESHOLD:
   486			xisp->threshold_aec = ctrl->val;
   487			XISP_SET_CFG(XISP_AEC_INDEX, XISP_AEC_CONFIG_REG, xisp->threshold_aec);
   488			break;
   489		case V4L2_CID_XILINX_ISP_AWB_EN:
   490			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   491								 XISP_AWB_INDEX, ctrl->val);
   492			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   493			break;
   494		case V4L2_CID_XILINX_ISP_AWB_THRESHOLD:
   495			xisp->threshold_awb = ctrl->val;
   496			XISP_SET_CFG(XISP_AWB_INDEX, XISP_AWB_CONFIG_REG, xisp->threshold_awb);
   497			break;
   498		case V4L2_CID_XILINX_ISP_BLC_EN:
   499			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   500								 XISP_BLC_INDEX, ctrl->val);
   501			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   502			break;
   503		case V4L2_CID_XILINX_ISP_MULTI_FACTOR:
   504			xisp->mult_factor = ctrl->val;
   505			XISP_SET_CFG(XISP_BLC_INDEX, XISP_BLC_CONFIG_1_REG, xisp->mult_factor);
   506			break;
   507		case V4L2_CID_BLACK_LEVEL:
   508			xisp->black_level = ctrl->val;
   509			XISP_SET_CFG(XISP_BLC_INDEX, XISP_BLC_CONFIG_2_REG, xisp->black_level);
   510			break;
   511		case V4L2_CID_XILINX_ISP_BPC_EN:
   512			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   513								 XISP_BPC_INDEX, ctrl->val);
   514			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   515			break;
   516		case V4L2_CID_XILINX_ISP_RGBIR_EN:
   517			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   518								 XISP_RGBIR_INDEX, ctrl->val);
   519			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   520			break;
   521		case V4L2_CID_XILINX_ISP_DEGAMMA_EN:
   522			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   523								 XISP_DEGAMMA_INDEX, ctrl->val);
   524			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   525			break;
   526		case V4L2_CID_XILINX_ISP_DEGAMMA_PARAMS:
   527			xisp->degamma_select = ctrl->val;
   528			degamma_enabled = XGET_BIT(XISP_DEGAMMA_INDEX, xisp->module_en);
   529			degamma_bypass_enabled = XGET_BIT(XISP_DEGAMMA_INDEX, xisp->module_bypass_en);
   530			degamma_bypass = XGET_BIT(XISP_DEGAMMA_INDEX, xisp->module_bypass);
   531	
   532			if (degamma_enabled)
   533				if (!degamma_bypass_enabled || !(degamma_bypass_enabled &&
   534								 degamma_bypass)) {
   535					xisp->degamma_lut = xisp_degamma_choices[xisp->degamma_select];
   536					xisp_set_degamma_entries(xisp, XISP_DEGAMMA_CONFIG_BASE,
   537								 xisp->degamma_lut);
   538				}
   539			break;
   540		case V4L2_CID_XILINX_ISP_LSC_EN:
   541			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   542								 XISP_LSC_INDEX, ctrl->val);
   543			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   544			break;
   545		case V4L2_CID_XILINX_ISP_DEMOSAIC_EN:
   546			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   547								 XISP_DEMOSAIC_INDEX, ctrl->val);
   548			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   549			break;
   550		case V4L2_CID_XILINX_ISP_CCM_EN:
   551			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   552								 XISP_CCM_INDEX, ctrl->val);
   553			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   554			break;
   555		case V4L2_CID_XILINX_ISP_CCM_PARAMS:
   556			xisp->ccm_select = ctrl->val;
   557	
   558			ccm_enabled = XGET_BIT(XISP_CCM_INDEX, xisp->module_en);
   559			ccm_bypass_enabled = XGET_BIT(XISP_CCM_INDEX, xisp->module_bypass_en);
   560			ccm_bypass = XGET_BIT(XISP_CCM_INDEX, xisp->module_bypass);
   561	
   562			if (ccm_enabled)
   563				if (!ccm_bypass_enabled || !(ccm_bypass_enabled && ccm_bypass)) {
   564					xisp->ccm_matrix_lut = xisp_ccm_matrix_choices[xisp->ccm_select];
   565					xisp->ccm_offsetarray_lut =
   566					xisp_ccm_offsetarray_choices[xisp->ccm_select];
   567					xisp_set_ccm_matrix_entries(xisp, XISP_CCM_CONFIG_1_BASE,
   568								    XISP_CCM_CONFIG_2_BASE,
   569								    xisp->ccm_matrix_lut,
   570								    xisp->ccm_offsetarray_lut);
   571				}
   572			break;
   573		case V4L2_CID_XILINX_ISP_GAIN_EN:
   574			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   575								 XISP_GAIN_INDEX, ctrl->val);
   576			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   577			break;
   578		case V4L2_CID_XILINX_ISP_GAIN_CONTROL_RED_GAIN:
   579			xisp->rgain = ctrl->val;
   580			if (in_type_conf_gain) {
   581				XISP_SET_CFG(XISP_GAIN_INDEX, XISP_GAIN_CONTROL_CONFIG_1_REG,
 > 582					     (FIELD_PREP(GENMASK(XISP_UPPER_WORD_MSB,
   583								 XISP_UPPER_WORD_LSB),
   584								 xisp->bgain)) |
   585								 xisp->rgain);
   586			}
   587			break;
   588		case V4L2_CID_XILINX_ISP_GAIN_CONTROL_BLUE_GAIN:
   589			xisp->bgain = ctrl->val;
   590			if (in_type_conf_gain) {
   591				XISP_SET_CFG(XISP_GAIN_INDEX, XISP_GAIN_CONTROL_CONFIG_1_REG,
   592					     (FIELD_PREP(GENMASK(XISP_UPPER_WORD_MSB,
   593								 XISP_UPPER_WORD_LSB),
   594								 xisp->bgain)) |
   595								 xisp->rgain);
   596			}
   597			break;
   598		case V4L2_CID_XILINX_ISP_GAIN_CONTROL_GREEN_GAIN:
   599			xisp->ggain = ctrl->val;
   600			if (in_type_conf_gain) {
   601				XISP_SET_CFG(XISP_GAIN_INDEX, XISP_GAIN_CONTROL_CONFIG_2_REG,
   602					     (FIELD_PREP(GENMASK(XISP_UPPER_WORD_MSB,
   603								 XISP_UPPER_WORD_LSB),
   604								 xisp->bayer_fmt)) |
   605								 xisp->ggain);
   606			}
   607			break;
   608		case V4L2_CID_XILINX_ISP_LUMA_GAIN:
   609			xisp->luma_gain = ctrl->val;
   610			if (!in_type_conf_gain)
   611				XISP_SET_CFG(XISP_GAIN_INDEX, XISP_GAIN_CONTROL_CONFIG_1_REG,
   612					     xisp->luma_gain);
   613			break;
   614		case V4L2_CID_XILINX_ISP_RED_GAIN:
   615			xisp->rgain = ctrl->val;
   616			xvip_write(&xisp->xvip, XISP_RGAIN_REG, xisp->rgain);
   617			break;
   618		case V4L2_CID_XILINX_ISP_BLUE_GAIN:
   619			xisp->bgain = ctrl->val;
   620			xvip_write(&xisp->xvip, XISP_BGAIN_REG, xisp->bgain);
   621			break;
   622		case V4L2_CID_XILINX_ISP_AWB:
   623			xisp->mode_reg = ctrl->val;
   624			xvip_write(&xisp->xvip, XISP_MODE_REG, xisp->mode_reg);
   625			break;
   626		case V4L2_CID_XILINX_ISP_THRESHOLD:
   627			xisp->pawb = ctrl->val;
   628			xvip_write(&xisp->xvip, XISP_PAWB_REG, xisp->pawb);
   629			break;
   630		case V4L2_CID_XILINX_ISP_RED_GAMMA:
   631			select_gamma(ctrl->val, &xisp->red_lut, xisp->gamma_table);
   632			dev_dbg(xisp->xvip.dev, "Setting Red Gamma to %d.%d",
   633				ctrl->val / 10, ctrl->val % 10);
   634			xisp_set_lut_entries(xisp, xisp->red_lut, XISP_GAMMA_RED_REG);
   635			break;
   636		case V4L2_CID_XILINX_ISP_GREEN_GAMMA:
   637			select_gamma(ctrl->val, &xisp->green_lut, xisp->gamma_table);
   638			dev_dbg(xisp->xvip.dev, "Setting Green Gamma to %d.%d",
   639				ctrl->val / 10, ctrl->val % 10);
   640			xisp_set_lut_entries(xisp, xisp->green_lut, XISP_GAMMA_GREEN_REG);
   641			break;
   642		case V4L2_CID_XILINX_ISP_BLUE_GAMMA:
   643			select_gamma(ctrl->val, &xisp->blue_lut, xisp->gamma_table);
   644			dev_dbg(xisp->xvip.dev, "Setting Blue Gamma to %d.%d",
   645				ctrl->val / 10, ctrl->val % 10);
   646			xisp_set_lut_entries(xisp, xisp->blue_lut, XISP_GAMMA_BLUE_REG);
   647			break;
   648		default:
   649			return -EINVAL;
   650		}
   651	
   652		return 0;
   653	}
   654	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
