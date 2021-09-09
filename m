Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201D3FF0
	for <llvm@lists.linux.dev>; Thu,  9 Sep 2021 17:08:50 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="200376888"
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; 
   d="gz'50?scan'50,208,50";a="200376888"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2021 10:08:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,280,1624345200"; 
   d="gz'50?scan'50,208,50";a="694261576"
Received: from lkp-server01.sh.intel.com (HELO 730d49888f40) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 09 Sep 2021 10:08:45 -0700
Received: from kbuild by 730d49888f40 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mONXZ-0003MT-2r; Thu, 09 Sep 2021 17:08:45 +0000
Date: Fri, 10 Sep 2021 01:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Pham <jackp@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Felipe Balbi <balbi@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pavel Hofman <pavel.hofman@ivitera.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-usb@vger.kernel.org, Ferry Toth <fntoth@gmail.com>,
	Wesley Cheng <wcheng@codeaurora.org>,
	Pawel Laszczak <pawell@cadence.com>
Subject: Re: [PATCH v2 2/2] usb: gadget: f_uac2: Populate SS descriptors'
 wBytesPerInterval
Message-ID: <202109100030.4qMPkRBj-lkp@intel.com>
References: <20210909082651.11912-3-jackp@codeaurora.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
In-Reply-To: <20210909082651.11912-3-jackp@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jack,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on peter.chen-usb/for-usb-next linus/master next-20210909]
[cannot apply to v5.14]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jack-Pham/usb-gadget-f_uac2-Fixes-for-SuperSpeed/20210909-162955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
config: i386-randconfig-a016-20210908 (attached as .config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 261cbe98c38f8c1ee1a482fe76511110e790f58a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/f262014b234c389fc10439b7c11aa10ea84270f6
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Jack-Pham/usb-gadget-f_uac2-Fixes-for-SuperSpeed/20210909-162955
        git checkout f262014b234c389fc10439b7c11aa10ea84270f6
        # save the attached .config to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/usb/gadget/function/f_uac2.c:1181:19: error: member reference type 'struct usb_ss_ep_comp_descriptor' is not a pointer; did you mean to use '.'?
           ss_epin_desc_comp->wBytesPerInterval = ss_epin_desc->wMaxPacketSize;
           ~~~~~~~~~~~~~~~~~^~
                            .
>> drivers/usb/gadget/function/f_uac2.c:1181:53: error: member reference type 'struct usb_endpoint_descriptor' is not a pointer; did you mean to use '.'?
           ss_epin_desc_comp->wBytesPerInterval = ss_epin_desc->wMaxPacketSize;
                                                  ~~~~~~~~~~~~^~
                                                              .
>> drivers/usb/gadget/function/f_uac2.c:1181:39: error: expression is not assignable
           ss_epin_desc_comp->wBytesPerInterval = ss_epin_desc->wMaxPacketSize;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   drivers/usb/gadget/function/f_uac2.c:1182:20: error: member reference type 'struct usb_ss_ep_comp_descriptor' is not a pointer; did you mean to use '.'?
           ss_epout_desc_comp->wBytesPerInterval = ss_epout_desc->wMaxPacketSize;
           ~~~~~~~~~~~~~~~~~~^~
                             .
   drivers/usb/gadget/function/f_uac2.c:1182:55: error: member reference type 'struct usb_endpoint_descriptor' is not a pointer; did you mean to use '.'?
           ss_epout_desc_comp->wBytesPerInterval = ss_epout_desc->wMaxPacketSize;
                                                   ~~~~~~~~~~~~~^~
                                                                .
   drivers/usb/gadget/function/f_uac2.c:1182:40: error: expression is not assignable
           ss_epout_desc_comp->wBytesPerInterval = ss_epout_desc->wMaxPacketSize;
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   6 errors generated.


vim +1181 drivers/usb/gadget/function/f_uac2.c

   939	
   940	static int
   941	afunc_bind(struct usb_configuration *cfg, struct usb_function *fn)
   942	{
   943		struct f_uac2 *uac2 = func_to_uac2(fn);
   944		struct g_audio *agdev = func_to_g_audio(fn);
   945		struct usb_composite_dev *cdev = cfg->cdev;
   946		struct usb_gadget *gadget = cdev->gadget;
   947		struct device *dev = &gadget->dev;
   948		struct f_uac2_opts *uac2_opts = g_audio_to_uac2_opts(agdev);
   949		struct usb_string *us;
   950		int ret;
   951	
   952		ret = afunc_validate_opts(agdev, dev);
   953		if (ret)
   954			return ret;
   955	
   956		us = usb_gstrings_attach(cdev, fn_strings, ARRAY_SIZE(strings_fn));
   957		if (IS_ERR(us))
   958			return PTR_ERR(us);
   959	
   960		if (FUOUT_EN(uac2_opts)) {
   961			out_feature_unit_desc = build_fu_desc(uac2_opts->c_chmask);
   962			if (!out_feature_unit_desc)
   963				return -ENOMEM;
   964		}
   965		if (FUIN_EN(uac2_opts)) {
   966			in_feature_unit_desc = build_fu_desc(uac2_opts->p_chmask);
   967			if (!in_feature_unit_desc) {
   968				ret = -ENOMEM;
   969				goto err_free_fu;
   970			}
   971		}
   972	
   973		iad_desc.iFunction = us[STR_ASSOC].id;
   974		std_ac_if_desc.iInterface = us[STR_IF_CTRL].id;
   975		in_clk_src_desc.iClockSource = us[STR_CLKSRC_IN].id;
   976		out_clk_src_desc.iClockSource = us[STR_CLKSRC_OUT].id;
   977		usb_out_it_desc.iTerminal = us[STR_USB_IT].id;
   978		io_in_it_desc.iTerminal = us[STR_IO_IT].id;
   979		usb_in_ot_desc.iTerminal = us[STR_USB_OT].id;
   980		io_out_ot_desc.iTerminal = us[STR_IO_OT].id;
   981		std_as_out_if0_desc.iInterface = us[STR_AS_OUT_ALT0].id;
   982		std_as_out_if1_desc.iInterface = us[STR_AS_OUT_ALT1].id;
   983		std_as_in_if0_desc.iInterface = us[STR_AS_IN_ALT0].id;
   984		std_as_in_if1_desc.iInterface = us[STR_AS_IN_ALT1].id;
   985	
   986		if (FUOUT_EN(uac2_opts)) {
   987			u8 *i_feature = (u8 *)out_feature_unit_desc +
   988					out_feature_unit_desc->bLength - 1;
   989			*i_feature = us[STR_FU_OUT].id;
   990		}
   991		if (FUIN_EN(uac2_opts)) {
   992			u8 *i_feature = (u8 *)in_feature_unit_desc +
   993					in_feature_unit_desc->bLength - 1;
   994			*i_feature = us[STR_FU_IN].id;
   995		}
   996	
   997	
   998		/* Initialize the configurable parameters */
   999		usb_out_it_desc.bNrChannels = num_channels(uac2_opts->c_chmask);
  1000		usb_out_it_desc.bmChannelConfig = cpu_to_le32(uac2_opts->c_chmask);
  1001		io_in_it_desc.bNrChannels = num_channels(uac2_opts->p_chmask);
  1002		io_in_it_desc.bmChannelConfig = cpu_to_le32(uac2_opts->p_chmask);
  1003		as_out_hdr_desc.bNrChannels = num_channels(uac2_opts->c_chmask);
  1004		as_out_hdr_desc.bmChannelConfig = cpu_to_le32(uac2_opts->c_chmask);
  1005		as_in_hdr_desc.bNrChannels = num_channels(uac2_opts->p_chmask);
  1006		as_in_hdr_desc.bmChannelConfig = cpu_to_le32(uac2_opts->p_chmask);
  1007		as_out_fmt1_desc.bSubslotSize = uac2_opts->c_ssize;
  1008		as_out_fmt1_desc.bBitResolution = uac2_opts->c_ssize * 8;
  1009		as_in_fmt1_desc.bSubslotSize = uac2_opts->p_ssize;
  1010		as_in_fmt1_desc.bBitResolution = uac2_opts->p_ssize * 8;
  1011		if (FUOUT_EN(uac2_opts)) {
  1012			__le32 *bma = (__le32 *)&out_feature_unit_desc->bmaControls[0];
  1013			u32 control = 0;
  1014	
  1015			if (uac2_opts->c_mute_present)
  1016				control |= CONTROL_RDWR << FU_MUTE_CTRL;
  1017			if (uac2_opts->c_volume_present)
  1018				control |= CONTROL_RDWR << FU_VOL_CTRL;
  1019			*bma = cpu_to_le32(control);
  1020		}
  1021		if (FUIN_EN(uac2_opts)) {
  1022			__le32 *bma = (__le32 *)&in_feature_unit_desc->bmaControls[0];
  1023			u32 control = 0;
  1024	
  1025			if (uac2_opts->p_mute_present)
  1026				control |= CONTROL_RDWR << FU_MUTE_CTRL;
  1027			if (uac2_opts->p_volume_present)
  1028				control |= CONTROL_RDWR << FU_VOL_CTRL;
  1029			*bma = cpu_to_le32(control);
  1030		}
  1031	
  1032		snprintf(clksrc_in, sizeof(clksrc_in), "%uHz", uac2_opts->p_srate);
  1033		snprintf(clksrc_out, sizeof(clksrc_out), "%uHz", uac2_opts->c_srate);
  1034	
  1035		ret = usb_interface_id(cfg, fn);
  1036		if (ret < 0) {
  1037			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1038			goto err_free_fu;
  1039		}
  1040		iad_desc.bFirstInterface = ret;
  1041	
  1042		std_ac_if_desc.bInterfaceNumber = ret;
  1043		uac2->ac_intf = ret;
  1044		uac2->ac_alt = 0;
  1045	
  1046		if (EPOUT_EN(uac2_opts)) {
  1047			ret = usb_interface_id(cfg, fn);
  1048			if (ret < 0) {
  1049				dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1050				goto err_free_fu;
  1051			}
  1052			std_as_out_if0_desc.bInterfaceNumber = ret;
  1053			std_as_out_if1_desc.bInterfaceNumber = ret;
  1054			uac2->as_out_intf = ret;
  1055			uac2->as_out_alt = 0;
  1056	
  1057			if (EPOUT_FBACK_IN_EN(uac2_opts)) {
  1058				fs_epout_desc.bmAttributes =
  1059				  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
  1060				hs_epout_desc.bmAttributes =
  1061				  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
  1062				ss_epout_desc.bmAttributes =
  1063				  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC;
  1064				std_as_out_if1_desc.bNumEndpoints++;
  1065			} else {
  1066				fs_epout_desc.bmAttributes =
  1067				  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
  1068				hs_epout_desc.bmAttributes =
  1069				  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
  1070				ss_epout_desc.bmAttributes =
  1071				  USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ADAPTIVE;
  1072			}
  1073		}
  1074	
  1075		if (EPIN_EN(uac2_opts)) {
  1076			ret = usb_interface_id(cfg, fn);
  1077			if (ret < 0) {
  1078				dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1079				goto err_free_fu;
  1080			}
  1081			std_as_in_if0_desc.bInterfaceNumber = ret;
  1082			std_as_in_if1_desc.bInterfaceNumber = ret;
  1083			uac2->as_in_intf = ret;
  1084			uac2->as_in_alt = 0;
  1085		}
  1086	
  1087		if (FUOUT_EN(uac2_opts) || FUIN_EN(uac2_opts)) {
  1088			uac2->int_ep = usb_ep_autoconfig(gadget, &fs_ep_int_desc);
  1089			if (!uac2->int_ep) {
  1090				dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1091				ret = -ENODEV;
  1092				goto err_free_fu;
  1093			}
  1094	
  1095			std_ac_if_desc.bNumEndpoints = 1;
  1096		}
  1097	
  1098		/* Calculate wMaxPacketSize according to audio bandwidth */
  1099		ret = set_ep_max_packet_size(uac2_opts, &fs_epin_desc, USB_SPEED_FULL,
  1100					     true);
  1101		if (ret < 0) {
  1102			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1103			return ret;
  1104		}
  1105	
  1106		ret = set_ep_max_packet_size(uac2_opts, &fs_epout_desc, USB_SPEED_FULL,
  1107					     false);
  1108		if (ret < 0) {
  1109			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1110			return ret;
  1111		}
  1112	
  1113		ret = set_ep_max_packet_size(uac2_opts, &hs_epin_desc, USB_SPEED_HIGH,
  1114					     true);
  1115		if (ret < 0) {
  1116			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1117			return ret;
  1118		}
  1119	
  1120		ret = set_ep_max_packet_size(uac2_opts, &hs_epout_desc, USB_SPEED_HIGH,
  1121					     false);
  1122		if (ret < 0) {
  1123			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1124			return ret;
  1125		}
  1126	
  1127		ret = set_ep_max_packet_size(uac2_opts, &ss_epin_desc, USB_SPEED_SUPER,
  1128					     true);
  1129		if (ret < 0) {
  1130			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1131			return ret;
  1132		}
  1133	
  1134		ret = set_ep_max_packet_size(uac2_opts, &ss_epout_desc, USB_SPEED_SUPER,
  1135					     false);
  1136		if (ret < 0) {
  1137			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1138			return ret;
  1139		}
  1140	
  1141		if (EPOUT_EN(uac2_opts)) {
  1142			agdev->out_ep = usb_ep_autoconfig(gadget, &fs_epout_desc);
  1143			if (!agdev->out_ep) {
  1144				dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1145				ret = -ENODEV;
  1146				goto err_free_fu;
  1147			}
  1148			if (EPOUT_FBACK_IN_EN(uac2_opts)) {
  1149				agdev->in_ep_fback = usb_ep_autoconfig(gadget,
  1150							       &fs_epin_fback_desc);
  1151				if (!agdev->in_ep_fback) {
  1152					dev_err(dev, "%s:%d Error!\n",
  1153						__func__, __LINE__);
  1154					ret = -ENODEV;
  1155					goto err_free_fu;
  1156				}
  1157			}
  1158		}
  1159	
  1160		if (EPIN_EN(uac2_opts)) {
  1161			agdev->in_ep = usb_ep_autoconfig(gadget, &fs_epin_desc);
  1162			if (!agdev->in_ep) {
  1163				dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
  1164				ret = -ENODEV;
  1165				goto err_free_fu;
  1166			}
  1167		}
  1168	
  1169		agdev->in_ep_maxpsize = max_t(u16,
  1170					le16_to_cpu(fs_epin_desc.wMaxPacketSize),
  1171					le16_to_cpu(hs_epin_desc.wMaxPacketSize));
  1172		agdev->out_ep_maxpsize = max_t(u16,
  1173					le16_to_cpu(fs_epout_desc.wMaxPacketSize),
  1174					le16_to_cpu(hs_epout_desc.wMaxPacketSize));
  1175	
  1176		agdev->in_ep_maxpsize = max_t(u16, agdev->in_ep_maxpsize,
  1177					le16_to_cpu(ss_epin_desc.wMaxPacketSize));
  1178		agdev->out_ep_maxpsize = max_t(u16, agdev->out_ep_maxpsize,
  1179					le16_to_cpu(ss_epout_desc.wMaxPacketSize));
  1180	
> 1181		ss_epin_desc_comp->wBytesPerInterval = ss_epin_desc->wMaxPacketSize;
  1182		ss_epout_desc_comp->wBytesPerInterval = ss_epout_desc->wMaxPacketSize;
  1183	
  1184		// HS and SS endpoint addresses are copied from autoconfigured FS descriptors
  1185		hs_ep_int_desc.bEndpointAddress = fs_ep_int_desc.bEndpointAddress;
  1186		hs_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
  1187		hs_epin_fback_desc.bEndpointAddress = fs_epin_fback_desc.bEndpointAddress;
  1188		hs_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
  1189		ss_epout_desc.bEndpointAddress = fs_epout_desc.bEndpointAddress;
  1190		ss_epin_fback_desc.bEndpointAddress = fs_epin_fback_desc.bEndpointAddress;
  1191		ss_epin_desc.bEndpointAddress = fs_epin_desc.bEndpointAddress;
  1192		ss_ep_int_desc.bEndpointAddress = fs_ep_int_desc.bEndpointAddress;
  1193	
  1194		setup_descriptor(uac2_opts);
  1195	
  1196		ret = usb_assign_descriptors(fn, fs_audio_desc, hs_audio_desc, ss_audio_desc,
  1197					     ss_audio_desc);
  1198		if (ret)
  1199			goto err_free_fu;
  1200	
  1201		agdev->gadget = gadget;
  1202	
  1203		agdev->params.p_chmask = uac2_opts->p_chmask;
  1204		agdev->params.p_srate = uac2_opts->p_srate;
  1205		agdev->params.p_ssize = uac2_opts->p_ssize;
  1206		if (FUIN_EN(uac2_opts)) {
  1207			agdev->params.p_fu.id = USB_IN_FU_ID;
  1208			agdev->params.p_fu.mute_present = uac2_opts->p_mute_present;
  1209			agdev->params.p_fu.volume_present = uac2_opts->p_volume_present;
  1210			agdev->params.p_fu.volume_min = uac2_opts->p_volume_min;
  1211			agdev->params.p_fu.volume_max = uac2_opts->p_volume_max;
  1212			agdev->params.p_fu.volume_res = uac2_opts->p_volume_res;
  1213		}
  1214		agdev->params.c_chmask = uac2_opts->c_chmask;
  1215		agdev->params.c_srate = uac2_opts->c_srate;
  1216		agdev->params.c_ssize = uac2_opts->c_ssize;
  1217		if (FUOUT_EN(uac2_opts)) {
  1218			agdev->params.c_fu.id = USB_OUT_FU_ID;
  1219			agdev->params.c_fu.mute_present = uac2_opts->c_mute_present;
  1220			agdev->params.c_fu.volume_present = uac2_opts->c_volume_present;
  1221			agdev->params.c_fu.volume_min = uac2_opts->c_volume_min;
  1222			agdev->params.c_fu.volume_max = uac2_opts->c_volume_max;
  1223			agdev->params.c_fu.volume_res = uac2_opts->c_volume_res;
  1224		}
  1225		agdev->params.req_number = uac2_opts->req_number;
  1226		agdev->params.fb_max = uac2_opts->fb_max;
  1227	
  1228		if (FUOUT_EN(uac2_opts) || FUIN_EN(uac2_opts))
  1229	    agdev->notify = afunc_notify;
  1230	
  1231		ret = g_audio_setup(agdev, "UAC2 PCM", "UAC2_Gadget");
  1232		if (ret)
  1233			goto err_free_descs;
  1234	
  1235		return 0;
  1236	
  1237	err_free_descs:
  1238		usb_free_all_descriptors(fn);
  1239		agdev->gadget = NULL;
  1240	err_free_fu:
  1241		kfree(out_feature_unit_desc);
  1242		out_feature_unit_desc = NULL;
  1243		kfree(in_feature_unit_desc);
  1244		in_feature_unit_desc = NULL;
  1245		return ret;
  1246	}
  1247	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--8t9RHnE3ZwKMSgU+
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
QHRVIwAL4RS5/wOK531gxn4CAA==

--8t9RHnE3ZwKMSgU+--
