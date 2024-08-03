Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A6413BAE4;
	Sat,  3 Aug 2024 15:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722700629; cv=none; b=pAa+QVjKBVbYdmShcfFM6twb5c5oyu3L4dSzr6lL1snhhm5ZrLgHFqsnVLTwDQ9Am+Utoze/Ergwpw6zOUH7Qi6gJPfO/jHrX5APQ9hnFuIT8uW7JAGz0aV9ky+sqmlJ4YOR5a/JQ+2uMECE33FS/50ygSthDry0s8GrptsigiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722700629; c=relaxed/simple;
	bh=IiPM5fKmjfXl0AHOKH0fbu6QjYolBv4O4tte1Vuu0cI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DjnZPfWbsO8soBsrYHdRju8Aq1yr8566BmURGNS7gcGAzo3M7g9j8sZR+QAobcWVYVdzDoqsntm+ZTs6LGuTKX+sNnNQ6a4VvVR/ogcSE4ct8jUe2RBvyHBAgd+syYD134wNrCv2Nk6UKSxUoNUNiSbPIb0e8vMyy78JYLke+aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKn5yn65; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKn5yn65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722700627; x=1754236627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IiPM5fKmjfXl0AHOKH0fbu6QjYolBv4O4tte1Vuu0cI=;
  b=UKn5yn65wNCJZPzkmV01Sj1Hb+SRTp6zGbuUmLBpMbb5ptOHL0//66xp
   ai+hoJeP19I0wlkppk7siZJ0TpJV5Fp9/Lctui1QnV5SazqGlPk11u77W
   QAJFtepL1+X7l10jz8BbKh86rqPLKtAyzO/Zbkarw+cUOFxO8HJYgXtz6
   ubK5khTYNFtxmmdt7u9TW5NwDkQknmS1SOJLV+gx1vvhooYSR8sK8vkwl
   5MYLcWyRuudKrOqKNka26zUMc1aJDumm/gqFACRUZpMBqnHEa7vuXPyMY
   C0kLOcDvRBOcT4/3FU5b8zM8g59inZKknTeivdEzMxFdR7MCBsC+q1jWa
   Q==;
X-CSE-ConnectionGUID: 8B+Xt5mDRGmvP0fyFm/AZQ==
X-CSE-MsgGUID: ZFAQBRaqQiiGfipqlmPF2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11153"; a="20550236"
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="20550236"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2024 08:56:55 -0700
X-CSE-ConnectionGUID: vsLQZT3yRqaiBYCvO5W/kA==
X-CSE-MsgGUID: qYyxrCAOQP6aGnfMQM8+lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,260,1716274800"; 
   d="scan'208";a="86671352"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 03 Aug 2024 08:56:52 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1saH7i-0000do-16;
	Sat, 03 Aug 2024 15:56:50 +0000
Date: Sat, 3 Aug 2024 23:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: Mounik Katikala <mounik.katikala@amd.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Vishal Sagar <vishal.sagar@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 1067/1093]
 drivers/media/platform/xilinx/xilinx-isppipeline.c:287:3: error: call to
 undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202408032346.jEunaUIp-lkp@intel.com>
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
commit: 116fbf86655bcc669b416defceabf085291f4500 [1067/1093] v4l: xilinx: isppipeline: Add support for AEC
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240803/202408032346.jEunaUIp-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408032346.jEunaUIp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408032346.jEunaUIp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/platform/xilinx/xilinx-isppipeline.c:287:3: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     287 |                 XISP_SET_CFG(XISP_AEC_INDEX, XISP_AEC_CONFIG_REG, xisp->threshold_aec);
         |                 ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:104:13: note: expanded from macro 'XISP_SET_CFG'
     104 |                 bool en = XGET_BIT(_index, xisp->module_en); \
         |                           ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:100:36: note: expanded from macro 'XGET_BIT'
     100 | #define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
         |                                    ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:815:18: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     815 |         bool en_index = XGET_BIT(index, xisp->module_en);
         |                         ^
   drivers/media/platform/xilinx/xilinx-isppipeline.c:100:36: note: expanded from macro 'XGET_BIT'
     100 | #define XGET_BIT(bitmask, reg)    (FIELD_GET(BIT(bitmask), (reg)))
         |                                    ^
   2 errors generated.


vim +/FIELD_GET +287 drivers/media/platform/xilinx/xilinx-isppipeline.c

   272	
   273	static int xisp_s_ctrl(struct v4l2_ctrl *ctrl)
   274	{
   275		struct xisp_dev *xisp =
   276			container_of(ctrl->handler,
   277				     struct xisp_dev, ctrl_handler);
   278	
   279		switch (ctrl->id) {
   280		case V4L2_CID_XILINX_ISP_AEC_EN:
   281			xisp->module_bypass = xisp_module_bypass(xisp->module_bypass,
   282								 XISP_AEC_INDEX, ctrl->val);
   283			xvip_write(&xisp->xvip, XISP_FUNCS_BYPASS_CONFIG_REG, xisp->module_bypass);
   284			break;
   285		case V4L2_CID_XILINX_ISP_AEC_THRESHOLD:
   286			xisp->threshold_aec = ctrl->val;
 > 287			XISP_SET_CFG(XISP_AEC_INDEX, XISP_AEC_CONFIG_REG, xisp->threshold_aec);
   288			break;
   289		case V4L2_CID_XILINX_ISP_RED_GAIN:
   290			xisp->rgain = ctrl->val;
   291			xvip_write(&xisp->xvip, XISP_RGAIN_REG, xisp->rgain);
   292			break;
   293		case V4L2_CID_XILINX_ISP_BLUE_GAIN:
   294			xisp->bgain = ctrl->val;
   295			xvip_write(&xisp->xvip, XISP_BGAIN_REG, xisp->bgain);
   296			break;
   297		case V4L2_CID_XILINX_ISP_AWB:
   298			xisp->mode_reg = ctrl->val;
   299			xvip_write(&xisp->xvip, XISP_MODE_REG, xisp->mode_reg);
   300			break;
   301		case V4L2_CID_XILINX_ISP_THRESHOLD:
   302			xisp->pawb = ctrl->val;
   303			xvip_write(&xisp->xvip, XISP_PAWB_REG, xisp->pawb);
   304			break;
   305		case V4L2_CID_XILINX_ISP_RED_GAMMA:
   306			select_gamma(ctrl->val, &xisp->red_lut, xisp->gamma_table);
   307			dev_dbg(xisp->xvip.dev, "Setting Red Gamma to %d.%d",
   308				ctrl->val / 10, ctrl->val % 10);
   309			xisp_set_lut_entries(xisp, xisp->red_lut, XISP_GAMMA_RED_REG);
   310			break;
   311		case V4L2_CID_XILINX_ISP_GREEN_GAMMA:
   312			select_gamma(ctrl->val, &xisp->green_lut, xisp->gamma_table);
   313			dev_dbg(xisp->xvip.dev, "Setting Green Gamma to %d.%d",
   314				ctrl->val / 10, ctrl->val % 10);
   315			xisp_set_lut_entries(xisp, xisp->green_lut, XISP_GAMMA_GREEN_REG);
   316			break;
   317		case V4L2_CID_XILINX_ISP_BLUE_GAMMA:
   318			select_gamma(ctrl->val, &xisp->blue_lut, xisp->gamma_table);
   319			dev_dbg(xisp->xvip.dev, "Setting Blue Gamma to %d.%d",
   320				ctrl->val / 10, ctrl->val % 10);
   321			xisp_set_lut_entries(xisp, xisp->blue_lut, XISP_GAMMA_BLUE_REG);
   322			break;
   323		default:
   324			return -EINVAL;
   325		}
   326	
   327		return 0;
   328	}
   329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
