Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8FE4EB24;
	Fri, 22 Mar 2024 13:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114111; cv=none; b=eM68QklIg9dBidYn2dnYD1tPHqnirq3AvyRzOao7N3Tr3OfKy1+vsctjaDl3zWjVMkBzhYCvVD+fN6JiCLRm1IUhC+OEtVlYx5QpAK18ywuUyCs8ksGTeve69FjOpZTMXM1mgxI2yKXxxQlY0MEYcw8CbDuX06e0BeMrJtwUOps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114111; c=relaxed/simple;
	bh=xVQ80WH9edDs+cia1aDlav5jSxdfwa2yEy82f3mRAtw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PYdANUthbYfXKscbMbFQjWM+ltrVoBnhHviqdxVw9oVxsNX9XUs3Sf8wAfRpw+lsv3+oIiJubZPPqNH5dIhkMfj9A01HANSB+VmH+ZZpFQyT3CO+XcDomIF1QuC6V+f5pnFzWUkyvDjTIuK+W0lg9n00k2YCyvGT34ZL/ExikQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZRWcx8C; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZRWcx8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711114109; x=1742650109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xVQ80WH9edDs+cia1aDlav5jSxdfwa2yEy82f3mRAtw=;
  b=NZRWcx8CnC1vWLunmCf45IlsFZt1Dl5qdtkiNPBHDdMNzmr3yzmlNK3D
   6My514v9aHYvqx0eSLwfIbtcbPkd9J83qXtGaMQiQCGYlyHb+8Ta++/21
   OcaHb01oqL4FKdsPy6zc8pn5JzecrKOvVD3tjk/oaQFlINwu6TvEIy7NH
   /QV9YItelGVc+jGZHay/CTRpCuMuMqKY5EtKbdAISGq+9/F6gT1anu9LN
   ON+jwO9JNmO0PvQKXIph54FK+sWu0FcQ2WYz/T/O4RzvglQzf1sKBUIhj
   ZtKpfbT5T+G4galZGegc2IV+exjfGZwMafSEWmDVHxj8xwlURiRIyrEQ+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="17307225"
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="17307225"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2024 06:28:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,146,1708416000"; 
   d="scan'208";a="15319898"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Mar 2024 06:28:25 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnewY-000KKd-0l;
	Fri, 22 Mar 2024 13:28:22 +0000
Date: Fri, 22 Mar 2024 21:27:38 +0800
From: kernel test robot <lkp@intel.com>
To: Dorcas Anono Litunya <anonolitunya@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [hverkuil-media-tree:outreachy-vivid 57/57]
 drivers/media/test-drivers/vivid/vivid-ctrls.c:617:3: error: expected
 expression
Message-ID: <202403222102.pV2R0plg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git outreachy-vivid
head:   be7e1305df5be4218e46775d59833b91e588dd09
commit: be7e1305df5be4218e46775d59833b91e588dd09 [57/57] media: vivid: Add selected output ctrl value in vivid_dev
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240322/202403222102.pV2R0plg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403222102.pV2R0plg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403222102.pV2R0plg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/test-drivers/vivid/vivid-ctrls.c:617:3: error: expected expression
                   int hdmi_index = ctrl->id - VIVID_CID_HDMI_IS_CONNECTED_TO_OUTPUT(0);
                   ^
>> drivers/media/test-drivers/vivid/vivid-ctrls.c:621:48: error: use of undeclared identifier 'hdmi_index'; did you mean 'pmd_index'?
                   input_index = dev->hdmi_index_to_input_index[hdmi_index];
                                                                ^~~~~~~~~~
                                                                pmd_index
   include/linux/pgtable.h:71:29: note: 'pmd_index' declared here
   static inline unsigned long pmd_index(unsigned long address)
                               ^
>> drivers/media/test-drivers/vivid/vivid-ctrls.c:621:47: error: array subscript is not an integer
                   input_index = dev->hdmi_index_to_input_index[hdmi_index];
                                                               ^~~~~~~~~~~
   drivers/media/test-drivers/vivid/vivid-ctrls.c:631:36: error: use of undeclared identifier 'hdmi_index'; did you mean 'pmd_index'?
                                   dev->hdmi_index_to_input_index[hdmi_index];
                                                                  ^~~~~~~~~~
                                                                  pmd_index
   include/linux/pgtable.h:71:29: note: 'pmd_index' declared here
   static inline unsigned long pmd_index(unsigned long address)
                               ^
   drivers/media/test-drivers/vivid/vivid-ctrls.c:631:35: error: array subscript is not an integer
                                   dev->hdmi_index_to_input_index[hdmi_index];
                                                                 ^~~~~~~~~~~
   drivers/media/test-drivers/vivid/vivid-ctrls.c:639:70: error: use of undeclared identifier 'hdmi_index'; did you mean 'pmd_index'?
                   vivid_send_input_source_change(dev, dev->hdmi_index_to_input_index[hdmi_index]);
                                                                                      ^~~~~~~~~~
                                                                                      pmd_index
   include/linux/pgtable.h:71:29: note: 'pmd_index' declared here
   static inline unsigned long pmd_index(unsigned long address)
                               ^
   drivers/media/test-drivers/vivid/vivid-ctrls.c:639:69: error: array subscript is not an integer
                   vivid_send_input_source_change(dev, dev->hdmi_index_to_input_index[hdmi_index]);
                                                                                     ^~~~~~~~~~~
   drivers/media/test-drivers/vivid/vivid-ctrls.c:645:3: error: expected expression
                   int svid_index = ctrl->id - VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(0);
                   ^
>> drivers/media/test-drivers/vivid/vivid-ctrls.c:649:48: error: use of undeclared identifier 'svid_index'
                   input_index = dev->svid_index_to_input_index[svid_index];
                                                                ^
   drivers/media/test-drivers/vivid/vivid-ctrls.c:659:36: error: use of undeclared identifier 'svid_index'
                                   dev->svid_index_to_input_index[svid_index];
                                                                  ^
   drivers/media/test-drivers/vivid/vivid-ctrls.c:667:70: error: use of undeclared identifier 'svid_index'
                   vivid_send_input_source_change(dev, dev->svid_index_to_input_index[svid_index]);
                                                                                      ^
   11 errors generated.


vim +617 drivers/media/test-drivers/vivid/vivid-ctrls.c

   447	
   448	static int vivid_vid_cap_s_ctrl(struct v4l2_ctrl *ctrl)
   449	{
   450		static const u32 colorspaces[] = {
   451			V4L2_COLORSPACE_SMPTE170M,
   452			V4L2_COLORSPACE_REC709,
   453			V4L2_COLORSPACE_SRGB,
   454			V4L2_COLORSPACE_OPRGB,
   455			V4L2_COLORSPACE_BT2020,
   456			V4L2_COLORSPACE_DCI_P3,
   457			V4L2_COLORSPACE_SMPTE240M,
   458			V4L2_COLORSPACE_470_SYSTEM_M,
   459			V4L2_COLORSPACE_470_SYSTEM_BG,
   460		};
   461		struct vivid_dev *dev = container_of(ctrl->handler, struct vivid_dev, ctrl_hdl_vid_cap);
   462		unsigned int i, j;
   463		struct vivid_dev *output_inst = NULL;
   464		int index = 0;
   465		s32 input_index = 0;
   466	
   467		switch (ctrl->id) {
   468		case VIVID_CID_TEST_PATTERN:
   469			vivid_update_quality(dev);
   470			tpg_s_pattern(&dev->tpg, ctrl->val);
   471			break;
   472		case VIVID_CID_COLORSPACE:
   473			tpg_s_colorspace(&dev->tpg, colorspaces[ctrl->val]);
   474			vivid_send_source_change(dev, TV);
   475			vivid_send_source_change(dev, SVID);
   476			vivid_send_source_change(dev, HDMI);
   477			vivid_send_source_change(dev, WEBCAM);
   478			break;
   479		case VIVID_CID_XFER_FUNC:
   480			tpg_s_xfer_func(&dev->tpg, ctrl->val);
   481			vivid_send_source_change(dev, TV);
   482			vivid_send_source_change(dev, SVID);
   483			vivid_send_source_change(dev, HDMI);
   484			vivid_send_source_change(dev, WEBCAM);
   485			break;
   486		case VIVID_CID_YCBCR_ENC:
   487			tpg_s_ycbcr_enc(&dev->tpg, ctrl->val);
   488			vivid_send_source_change(dev, TV);
   489			vivid_send_source_change(dev, SVID);
   490			vivid_send_source_change(dev, HDMI);
   491			vivid_send_source_change(dev, WEBCAM);
   492			break;
   493		case VIVID_CID_HSV_ENC:
   494			tpg_s_hsv_enc(&dev->tpg, ctrl->val ? V4L2_HSV_ENC_256 :
   495							     V4L2_HSV_ENC_180);
   496			vivid_send_source_change(dev, TV);
   497			vivid_send_source_change(dev, SVID);
   498			vivid_send_source_change(dev, HDMI);
   499			vivid_send_source_change(dev, WEBCAM);
   500			break;
   501		case VIVID_CID_QUANTIZATION:
   502			tpg_s_quantization(&dev->tpg, ctrl->val);
   503			vivid_send_source_change(dev, TV);
   504			vivid_send_source_change(dev, SVID);
   505			vivid_send_source_change(dev, HDMI);
   506			vivid_send_source_change(dev, WEBCAM);
   507			break;
   508		case V4L2_CID_DV_RX_RGB_RANGE:
   509			if (!vivid_is_hdmi_cap(dev))
   510				break;
   511			tpg_s_rgb_range(&dev->tpg, ctrl->val);
   512			break;
   513		case VIVID_CID_LIMITED_RGB_RANGE:
   514			tpg_s_real_rgb_range(&dev->tpg, ctrl->val ?
   515					V4L2_DV_RGB_RANGE_LIMITED : V4L2_DV_RGB_RANGE_FULL);
   516			break;
   517		case VIVID_CID_ALPHA_MODE:
   518			tpg_s_alpha_mode(&dev->tpg, ctrl->val);
   519			break;
   520		case VIVID_CID_HOR_MOVEMENT:
   521			tpg_s_mv_hor_mode(&dev->tpg, ctrl->val);
   522			break;
   523		case VIVID_CID_VERT_MOVEMENT:
   524			tpg_s_mv_vert_mode(&dev->tpg, ctrl->val);
   525			break;
   526		case VIVID_CID_OSD_TEXT_MODE:
   527			dev->osd_mode = ctrl->val;
   528			break;
   529		case VIVID_CID_PERCENTAGE_FILL:
   530			tpg_s_perc_fill(&dev->tpg, ctrl->val);
   531			for (i = 0; i < VIDEO_MAX_FRAME; i++)
   532				dev->must_blank[i] = ctrl->val < 100;
   533			break;
   534		case VIVID_CID_INSERT_SAV:
   535			tpg_s_insert_sav(&dev->tpg, ctrl->val);
   536			break;
   537		case VIVID_CID_INSERT_EAV:
   538			tpg_s_insert_eav(&dev->tpg, ctrl->val);
   539			break;
   540		case VIVID_CID_INSERT_HDMI_VIDEO_GUARD_BAND:
   541			tpg_s_insert_hdmi_video_guard_band(&dev->tpg, ctrl->val);
   542			break;
   543		case VIVID_CID_HFLIP:
   544			dev->sensor_hflip = ctrl->val;
   545			tpg_s_hflip(&dev->tpg, dev->sensor_hflip ^ dev->hflip);
   546			break;
   547		case VIVID_CID_VFLIP:
   548			dev->sensor_vflip = ctrl->val;
   549			tpg_s_vflip(&dev->tpg, dev->sensor_vflip ^ dev->vflip);
   550			break;
   551		case VIVID_CID_REDUCED_FPS:
   552			dev->reduced_fps = ctrl->val;
   553			vivid_update_format_cap(dev, true);
   554			break;
   555		case VIVID_CID_HAS_CROP_CAP:
   556			dev->has_crop_cap = ctrl->val;
   557			vivid_update_format_cap(dev, true);
   558			break;
   559		case VIVID_CID_HAS_COMPOSE_CAP:
   560			dev->has_compose_cap = ctrl->val;
   561			vivid_update_format_cap(dev, true);
   562			break;
   563		case VIVID_CID_HAS_SCALER_CAP:
   564			dev->has_scaler_cap = ctrl->val;
   565			vivid_update_format_cap(dev, true);
   566			break;
   567		case VIVID_CID_SHOW_BORDER:
   568			tpg_s_show_border(&dev->tpg, ctrl->val);
   569			break;
   570		case VIVID_CID_SHOW_SQUARE:
   571			tpg_s_show_square(&dev->tpg, ctrl->val);
   572			break;
   573		case VIVID_CID_STD_ASPECT_RATIO:
   574			dev->std_aspect_ratio[dev->input] = ctrl->val;
   575			tpg_s_video_aspect(&dev->tpg, vivid_get_video_aspect(dev));
   576			break;
   577		case VIVID_CID_DV_TIMINGS_SIGNAL_MODE:
   578			dev->dv_timings_signal_mode[dev->input] =
   579				dev->ctrl_dv_timings_signal_mode->val;
   580			dev->query_dv_timings[dev->input] = dev->ctrl_dv_timings->val;
   581	
   582			dev->power_present = 0;
   583			for (i = 0, j = 0;
   584			     i < ARRAY_SIZE(dev->dv_timings_signal_mode);
   585			     i++)
   586				if (dev->input_type[i] == HDMI) {
   587					if (dev->dv_timings_signal_mode[i] != NO_SIGNAL)
   588						dev->power_present |= (1 << j);
   589					j++;
   590				}
   591			__v4l2_ctrl_s_ctrl(dev->ctrl_rx_power_present,
   592					   dev->power_present);
   593	
   594			v4l2_ctrl_activate(dev->ctrl_dv_timings,
   595				dev->dv_timings_signal_mode[dev->input] ==
   596					SELECTED_DV_TIMINGS);
   597	
   598			vivid_update_quality(dev);
   599			vivid_send_source_change(dev, HDMI);
   600			break;
   601		case VIVID_CID_DV_TIMINGS_ASPECT_RATIO:
   602			dev->dv_timings_aspect_ratio[dev->input] = ctrl->val;
   603			tpg_s_video_aspect(&dev->tpg, vivid_get_video_aspect(dev));
   604			break;
   605		case VIVID_CID_TSTAMP_SRC:
   606			dev->tstamp_src_is_soe = ctrl->val;
   607			dev->vb_vid_cap_q.timestamp_flags &= ~V4L2_BUF_FLAG_TSTAMP_SRC_MASK;
   608			if (dev->tstamp_src_is_soe)
   609				dev->vb_vid_cap_q.timestamp_flags |= V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
   610			break;
   611		case VIVID_CID_MAX_EDID_BLOCKS:
   612			dev->edid_max_blocks = ctrl->val;
   613			if (dev->edid_blocks > dev->edid_max_blocks)
   614				dev->edid_blocks = dev->edid_max_blocks;
   615			break;
   616		case VIVID_CID_HDMI_IS_CONNECTED_TO_OUTPUT(0) ... VIVID_CID_HDMI_IS_CONNECTED_TO_OUTPUT(14):
 > 617			int hdmi_index = ctrl->id - VIVID_CID_HDMI_IS_CONNECTED_TO_OUTPUT(0);
   618	
   619			output_inst = vivid_ctrl_hdmi_to_output_instance[ctrl->cur.val];
   620			index = vivid_ctrl_hdmi_to_output_index[ctrl->cur.val];
 > 621			input_index = dev->hdmi_index_to_input_index[hdmi_index];
   622			dev->input_is_connected_to_output[input_index] = ctrl->val;
   623	
   624			if (output_inst)
   625				output_inst->output_to_input_instance[index] = NULL;
   626			if (ctrl->val >= FIXED_MENU_ITEMS) {
   627				output_inst = vivid_ctrl_hdmi_to_output_instance[ctrl->val];
   628				index = vivid_ctrl_hdmi_to_output_index[ctrl->val];
   629				output_inst->output_to_input_instance[index] = dev;
   630				output_inst->output_to_input_index[index] =
   631					dev->hdmi_index_to_input_index[hdmi_index];
   632			}
   633			spin_lock(&hdmi_output_skip_mask_lock);
   634			hdmi_to_output_menu_skip_mask &= ~(1ULL << ctrl->cur.val);
   635			if (ctrl->val >= FIXED_MENU_ITEMS)
   636				hdmi_to_output_menu_skip_mask |= 1ULL << ctrl->val;
   637			spin_unlock(&hdmi_output_skip_mask_lock);
   638			vivid_update_quality(dev);
   639			vivid_send_input_source_change(dev, dev->hdmi_index_to_input_index[hdmi_index]);
   640			if (ctrl->val < FIXED_MENU_ITEMS && ctrl->cur.val < FIXED_MENU_ITEMS)
   641				break;
   642			queue_work(update_hdmi_ctrls_workqueue, &dev->update_hdmi_ctrl_work);
   643			break;
   644		case VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(0) ... VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(15):
   645			int svid_index = ctrl->id - VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(0);
   646	
   647			output_inst = vivid_ctrl_svid_to_output_instance[ctrl->cur.val];
   648			index = vivid_ctrl_svid_to_output_index[ctrl->cur.val];
 > 649			input_index = dev->svid_index_to_input_index[svid_index];
   650			dev->input_is_connected_to_output[input_index] = ctrl->val;
   651	
   652			if (output_inst)
   653				output_inst->output_to_input_instance[index] = NULL;
   654			if (ctrl->val >= FIXED_MENU_ITEMS) {
   655				output_inst = vivid_ctrl_svid_to_output_instance[ctrl->val];
   656				index = vivid_ctrl_svid_to_output_index[ctrl->val];
   657				output_inst->output_to_input_instance[index] = dev;
   658				output_inst->output_to_input_index[index] =
   659					dev->svid_index_to_input_index[svid_index];
   660			}
   661			spin_lock(&svid_output_skip_mask_lock);
   662			svid_to_output_menu_skip_mask &= ~(1ULL << ctrl->cur.val);
   663			if (ctrl->val >= FIXED_MENU_ITEMS)
   664				svid_to_output_menu_skip_mask |= 1ULL << ctrl->val;
   665			spin_unlock(&svid_output_skip_mask_lock);
   666			vivid_update_quality(dev);
   667			vivid_send_input_source_change(dev, dev->svid_index_to_input_index[svid_index]);
   668			if (ctrl->val < FIXED_MENU_ITEMS && ctrl->cur.val < FIXED_MENU_ITEMS)
   669				break;
   670			queue_work(update_svid_ctrls_workqueue, &dev->update_svid_ctrl_work);
   671			break;
   672		}
   673		return 0;
   674	}
   675	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
