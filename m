Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F155C61C;
	Thu, 14 Mar 2024 21:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710450053; cv=none; b=ob8ac6TZOOKYXiXkTH3rspt+c/ZjLLGkyM/x2vSjCmMP9TflF8+gvTc5mjx1K1u0K736ab1jBCy7gp1BVYi63eLQ4l1rZW2rTdFJ8GAUXUEdEvO9XhZDlzcsSy1lpCu3C+RoYBB3AWRsJi18YFjBYLXMlhSP/cH5kQ1u8koFm8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710450053; c=relaxed/simple;
	bh=NLNh7zP2xa/u7v8yFQNbepClPmGY2IXg7oe0UqaMlw8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f4slrCIvMr7UcT8TQlJGWx21hgs2WcDlvDtOtkU/y/LQlOuf49lC6KJCQqzbP2orJM/wgGNOY387vM92fLHanGhfJ7Q+v5i0CY4Z2PFW1KhYbTplC/7CeBRAlttVSUMlNMAvna7C5FEatcvLhRWN1ixOZHo6BHhZ08dfCKWP2bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bk3cVo5L; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bk3cVo5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710450051; x=1741986051;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NLNh7zP2xa/u7v8yFQNbepClPmGY2IXg7oe0UqaMlw8=;
  b=bk3cVo5LEcGCP/ck2bERRQCmuJUTC3sCQhVUXGJezt0mBKkGqeIeoQxz
   D8c9pPfr8ZfT4rxl+FBYSE7I5tuujpRO1ryyAl9jfe91pD8qYegbG+Uqm
   5gINv4H2ZpQzEzFrw8nP6qYf0M5o8PnTqlGobw+EzNK0zgvw2iO1KLhKF
   MRqrkNNYPOLy/WXYB98o1HvSGowLf7R8mm8//roO+xxytTiRKwsYT3/qw
   xtjntNfgEri3m7A39pXmhLK/LuFqY4HF4OkhIf603CqeMP5wQDRawRXBj
   XmDkMIewSYn75ZBS1UYdJ4Tzo6KB4vCNm8hgY33lzundssjKuK3scUazA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5235247"
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="5235247"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 14:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,126,1708416000"; 
   d="scan'208";a="43451811"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Mar 2024 14:00:44 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rksBu-000DnF-0e;
	Thu, 14 Mar 2024 21:00:42 +0000
Date: Fri, 15 Mar 2024 05:00:20 +0800
From: kernel test robot <lkp@intel.com>
To: Dorcas Anono Litunya <anonolitunya@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:outreachy-vivid 51/53]
 drivers/media/test-drivers/vivid/vivid-ctrls.c:1094:57: warning: variable
 'dev' is uninitialized when used within its own initialization
Message-ID: <202403150440.BSFRkvlO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git outreachy-vivid
head:   4964cefc537c29dc9946430b8334a6de73a937b4
commit: a9ce0ed91ef0b798d3e8cefb238e33b2ea9a597d [51/53] media: vivid: Remove loop video ctrl
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240315/202403150440.BSFRkvlO-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240315/202403150440.BSFRkvlO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403150440.BSFRkvlO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/test-drivers/vivid/vivid-ctrls.c:1094:57: warning: variable 'dev' is uninitialized when used within its own initialization [-Wuninitialized]
                           struct vivid_dev *dev = vivid_output_is_connected_to(dev);
                                             ~~~                                ^~~
   1 warning generated.


vim +/dev +1094 drivers/media/test-drivers/vivid/vivid-ctrls.c

  1056	
  1057	static int vivid_vid_out_s_ctrl(struct v4l2_ctrl *ctrl)
  1058	{
  1059		struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_out);
  1060		struct v4l2_bt_timings *bt = &dev->dv_timings_out.bt;
  1061		u32 display_present = 0;
  1062		unsigned int i, j, bus_idx;
  1063	
  1064		switch (ctrl->id) {
  1065		case VIVID_CID_HAS_CROP_OUT:
  1066			dev->has_crop_out = ctrl->val;
  1067			vivid_update_format_out(dev);
  1068			break;
  1069		case VIVID_CID_HAS_COMPOSE_OUT:
  1070			dev->has_compose_out = ctrl->val;
  1071			vivid_update_format_out(dev);
  1072			break;
  1073		case VIVID_CID_HAS_SCALER_OUT:
  1074			dev->has_scaler_out = ctrl->val;
  1075			vivid_update_format_out(dev);
  1076			break;
  1077		case V4L2_CID_DV_TX_MODE:
  1078			dev->dvi_d_out = ctrl->val == V4L2_DV_TX_MODE_DVI_D;
  1079			if (!vivid_is_hdmi_out(dev))
  1080				break;
  1081			if (!dev->dvi_d_out && (bt->flags & V4L2_DV_FL_IS_CE_VIDEO)) {
  1082				if (bt->width == 720 && bt->height <= 576)
  1083					dev->colorspace_out = V4L2_COLORSPACE_SMPTE170M;
  1084				else
  1085					dev->colorspace_out = V4L2_COLORSPACE_REC709;
  1086				dev->quantization_out = V4L2_QUANTIZATION_DEFAULT;
  1087			} else {
  1088				dev->colorspace_out = V4L2_COLORSPACE_SRGB;
  1089				dev->quantization_out = dev->dvi_d_out ?
  1090						V4L2_QUANTIZATION_LIM_RANGE :
  1091						V4L2_QUANTIZATION_DEFAULT;
  1092			}
  1093			if (vivid_output_is_connected_to(dev)) {
> 1094				struct vivid_dev *dev = vivid_output_is_connected_to(dev);
  1095	
  1096				vivid_send_source_change(dev, HDMI);
  1097			}
  1098			break;
  1099		case VIVID_CID_DISPLAY_PRESENT:
  1100			if (dev->output_type[dev->output] != HDMI)
  1101				break;
  1102	
  1103			dev->display_present[dev->output] = ctrl->val;
  1104			for (i = 0, j = 0; i < dev->num_outputs; i++)
  1105				if (dev->output_type[i] == HDMI)
  1106					display_present |=
  1107						dev->display_present[i] << j++;
  1108	
  1109			__v4l2_ctrl_s_ctrl(dev->ctrl_tx_rxsense, display_present);
  1110	
  1111			if (dev->edid_blocks) {
  1112				__v4l2_ctrl_s_ctrl(dev->ctrl_tx_edid_present,
  1113						   display_present);
  1114				__v4l2_ctrl_s_ctrl(dev->ctrl_tx_hotplug,
  1115						   display_present);
  1116			}
  1117	
  1118			bus_idx = dev->cec_output2bus_map[dev->output];
  1119			if (!dev->cec_tx_adap[bus_idx])
  1120				break;
  1121	
  1122			if (ctrl->val && dev->edid_blocks)
  1123				cec_s_phys_addr(dev->cec_tx_adap[bus_idx],
  1124						dev->cec_tx_adap[bus_idx]->phys_addr,
  1125						false);
  1126			else
  1127				cec_phys_addr_invalidate(dev->cec_tx_adap[bus_idx]);
  1128	
  1129			break;
  1130		}
  1131		return 0;
  1132	}
  1133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
