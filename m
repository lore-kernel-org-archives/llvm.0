Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF21157E87;
	Sat,  7 Sep 2024 23:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725752615; cv=none; b=LCmQJyrPefcjzFctjdEvpgELUkS0RpYtnfj+bIJQp3E9y/n02gYvrFaF954v8PRnKgIM+y5PHEdMEmKfn/+tA1vIIHJh4cDeanrM5cdYRKD7mm0ASQFV4vz8UKM5wADtoUhxdsefNfVr6V8rOG8sTj6btnEFDDekznUUlBGwJP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725752615; c=relaxed/simple;
	bh=sc+aCtj+UEhS3AOysrX2JdySWJk+jxByVd8iyOT4nlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f7UyNUu+CdgGs1Snm9Md6plrBJ0WjPP9nDaphMVIdtUmLmIVhMVprj9KT5icBvDgEL9VPaAkzck8HdBcES037IbUEgHr7JxxaP28ziUMBekZCFjY+ItdtJE79IKVTo9CaQBKo1R9XifiiDGKQaQl0rFR97/JC11JZQcZcKhXHgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PRhp2meS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PRhp2meS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725752614; x=1757288614;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=sc+aCtj+UEhS3AOysrX2JdySWJk+jxByVd8iyOT4nlc=;
  b=PRhp2meSkvcY+ODj68hcxbGTgZ2gL89NmdDCCMp825wznT5CE1UoTMEx
   nyF/pbHlOkwpiw04R7fk6YaTfk5TfKNdODqI1Cgv5PKpXddCar7ujpDmo
   tlmrK04xPfAY1Xl37Ej+uUFZe2zP9KHPCKDH6r0c0xn4Xm6b+toQsknMF
   prP37SQXzrCqmYYIDgeBrKze6PETB12D0l8Xsei9SoENBDjc6JkDeVNOL
   jwzSCFsYmHurNBdCylHWxhNg33AjxIlBW+vELectDpQje4oURKUAvJNG9
   9d39aySSyPC/rZjImPUam9fkc/k26g2t3B9JtnlWEC7ElZT6ZLS1A4QE9
   Q==;
X-CSE-ConnectionGUID: foQo3ckkRWSNEbrhgStEiQ==
X-CSE-MsgGUID: 0AzfB8TjRbeXK3EX01ApqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="41987879"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="41987879"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 16:43:33 -0700
X-CSE-ConnectionGUID: bwSWk3GxTl2suxQZ3P1Bbg==
X-CSE-MsgGUID: L/sIJ98tTbyjV8Ibtkzp6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="103759016"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Sep 2024 16:43:32 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn55V-000D7D-1g;
	Sat, 07 Sep 2024 23:43:29 +0000
Date: Sun, 8 Sep 2024 07:43:03 +0800
From: kernel test robot <lkp@intel.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 09/12] media: i2c: ov5645: Add internal image sink pad
Message-ID: <202409080711.N8d4wdQ1-lkp@intel.com>
References: <20240904210719.52466-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904210719.52466-10-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on media-tree/master]
[also build test ERROR on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.11-rc6 next-20240906]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Prabhakar/media-i2c-ov5645-Add-V4L2_SUBDEV_FL_HAS_EVENTS-and-subscribe-hooks/20240905-051300
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240904210719.52466-10-prabhakar.mahadev-lad.rj%40bp.renesas.com
patch subject: [RFC PATCH 09/12] media: i2c: ov5645: Add internal image sink pad
config: i386-buildonly-randconfig-004-20240908 (https://download.01.org/0day-ci/archive/20240908/202409080711.N8d4wdQ1-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080711.N8d4wdQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080711.N8d4wdQ1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ov5645.c:1167:61: error: use of undeclared identifier 'MEDIA_PAD_FL_INTERNAL'
    1167 |         ov5645->pads[OV5645_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
         |                                                                    ^
   1 error generated.


vim +/MEDIA_PAD_FL_INTERNAL +1167 drivers/media/i2c/ov5645.c

  1057	
  1058	static int ov5645_probe(struct i2c_client *client)
  1059	{
  1060		struct device *dev = &client->dev;
  1061		struct device_node *endpoint;
  1062		struct ov5645 *ov5645;
  1063		u8 chip_id_high, chip_id_low;
  1064		unsigned int i;
  1065		u32 xclk_freq;
  1066		int ret;
  1067	
  1068		ov5645 = devm_kzalloc(dev, sizeof(struct ov5645), GFP_KERNEL);
  1069		if (!ov5645)
  1070			return -ENOMEM;
  1071	
  1072		ov5645->i2c_client = client;
  1073		ov5645->dev = dev;
  1074	
  1075		endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
  1076		if (!endpoint)
  1077			return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
  1078	
  1079		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
  1080						 &ov5645->ep);
  1081	
  1082		of_node_put(endpoint);
  1083	
  1084		if (ret < 0)
  1085			return dev_err_probe(dev, ret, "parsing endpoint node failed\n");
  1086	
  1087		if (ov5645->ep.bus_type != V4L2_MBUS_CSI2_DPHY)
  1088			return dev_err_probe(dev, -EINVAL, "invalid bus type, must be CSI2\n");
  1089	
  1090		/* get system clock (xclk) */
  1091		ov5645->xclk = devm_clk_get(dev, NULL);
  1092		if (IS_ERR(ov5645->xclk))
  1093			return dev_err_probe(dev, PTR_ERR(ov5645->xclk), "could not get xclk");
  1094	
  1095		ret = of_property_read_u32(dev->of_node, "clock-frequency", &xclk_freq);
  1096		if (ret)
  1097			return dev_err_probe(dev, ret, "could not get xclk frequency\n");
  1098	
  1099		/* external clock must be 24MHz, allow 1% tolerance */
  1100		if (xclk_freq < 23760000 || xclk_freq > 24240000)
  1101			return dev_err_probe(dev, -EINVAL, "external clock frequency %u is not supported\n",
  1102					     xclk_freq);
  1103	
  1104		ret = clk_set_rate(ov5645->xclk, xclk_freq);
  1105		if (ret)
  1106			return dev_err_probe(dev, ret, "could not set xclk frequency\n");
  1107	
  1108		for (i = 0; i < OV5645_NUM_SUPPLIES; i++)
  1109			ov5645->supplies[i].supply = ov5645_supply_name[i];
  1110	
  1111		ret = devm_regulator_bulk_get(dev, OV5645_NUM_SUPPLIES,
  1112					      ov5645->supplies);
  1113		if (ret < 0)
  1114			return ret;
  1115	
  1116		ov5645->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
  1117		if (IS_ERR(ov5645->enable_gpio))
  1118			return dev_err_probe(dev, PTR_ERR(ov5645->enable_gpio), "cannot get enable gpio\n");
  1119	
  1120		ov5645->rst_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
  1121		if (IS_ERR(ov5645->rst_gpio))
  1122			return dev_err_probe(dev, PTR_ERR(ov5645->rst_gpio), "cannot get reset gpio\n");
  1123	
  1124		v4l2_ctrl_handler_init(&ov5645->ctrls, 9);
  1125		v4l2_ctrl_new_std(&ov5645->ctrls, &ov5645_ctrl_ops,
  1126				  V4L2_CID_SATURATION, -4, 4, 1, 0);
  1127		v4l2_ctrl_new_std(&ov5645->ctrls, &ov5645_ctrl_ops,
  1128				  V4L2_CID_HFLIP, 0, 1, 1, 0);
  1129		v4l2_ctrl_new_std(&ov5645->ctrls, &ov5645_ctrl_ops,
  1130				  V4L2_CID_VFLIP, 0, 1, 1, 0);
  1131		v4l2_ctrl_new_std(&ov5645->ctrls, &ov5645_ctrl_ops,
  1132				  V4L2_CID_AUTOGAIN, 0, 1, 1, 1);
  1133		v4l2_ctrl_new_std(&ov5645->ctrls, &ov5645_ctrl_ops,
  1134				  V4L2_CID_AUTO_WHITE_BALANCE, 0, 1, 1, 1);
  1135		v4l2_ctrl_new_std_menu(&ov5645->ctrls, &ov5645_ctrl_ops,
  1136				       V4L2_CID_EXPOSURE_AUTO, V4L2_EXPOSURE_MANUAL,
  1137				       0, V4L2_EXPOSURE_AUTO);
  1138		v4l2_ctrl_new_std_menu_items(&ov5645->ctrls, &ov5645_ctrl_ops,
  1139					     V4L2_CID_TEST_PATTERN,
  1140					     ARRAY_SIZE(ov5645_test_pattern_menu) - 1,
  1141					     0, 0, ov5645_test_pattern_menu);
  1142		ov5645->pixel_clock = v4l2_ctrl_new_std(&ov5645->ctrls,
  1143							&ov5645_ctrl_ops,
  1144							V4L2_CID_PIXEL_RATE,
  1145							1, INT_MAX, 1, 1);
  1146		ov5645->link_freq = v4l2_ctrl_new_int_menu(&ov5645->ctrls,
  1147							   &ov5645_ctrl_ops,
  1148							   V4L2_CID_LINK_FREQ,
  1149							   ARRAY_SIZE(link_freq) - 1,
  1150							   0, link_freq);
  1151		if (ov5645->link_freq)
  1152			ov5645->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
  1153	
  1154		ov5645->sd.ctrl_handler = &ov5645->ctrls;
  1155	
  1156		if (ov5645->ctrls.error) {
  1157			ret = ov5645->ctrls.error;
  1158			dev_err_probe(dev, ret, "%s: control initialization error %d\n",
  1159				      __func__, ov5645->ctrls.error);
  1160			goto free_ctrl;
  1161		}
  1162	
  1163		v4l2_i2c_subdev_init(&ov5645->sd, client, &ov5645_subdev_ops);
  1164		ov5645->sd.internal_ops = &ov5645_internal_ops;
  1165		ov5645->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
  1166		ov5645->pads[OV5645_PAD_SOURCE].flags = MEDIA_PAD_FL_SOURCE;
> 1167		ov5645->pads[OV5645_PAD_IMAGE].flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
  1168		ov5645->sd.dev = dev;
  1169		ov5645->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
  1170	
  1171		ret = media_entity_pads_init(&ov5645->sd.entity, ARRAY_SIZE(ov5645->pads), ov5645->pads);
  1172		if (ret < 0) {
  1173			dev_err_probe(dev, ret, "could not register media entity\n");
  1174			goto free_ctrl;
  1175		}
  1176	
  1177		ret = ov5645_set_power_on(dev);
  1178		if (ret)
  1179			goto free_entity;
  1180	
  1181		ret = ov5645_read_reg(ov5645, OV5645_CHIP_ID_HIGH, &chip_id_high);
  1182		if (ret < 0 || chip_id_high != OV5645_CHIP_ID_HIGH_BYTE) {
  1183			ret = -ENODEV;
  1184			dev_err_probe(dev, ret, "could not read ID high\n");
  1185			goto power_down;
  1186		}
  1187		ret = ov5645_read_reg(ov5645, OV5645_CHIP_ID_LOW, &chip_id_low);
  1188		if (ret < 0 || chip_id_low != OV5645_CHIP_ID_LOW_BYTE) {
  1189			ret = -ENODEV;
  1190			dev_err_probe(dev, ret, "could not read ID low\n");
  1191			goto power_down;
  1192		}
  1193	
  1194		dev_info(dev, "OV5645 detected at address 0x%02x\n", client->addr);
  1195	
  1196		ret = ov5645_read_reg(ov5645, OV5645_AEC_PK_MANUAL,
  1197				      &ov5645->aec_pk_manual);
  1198		if (ret < 0) {
  1199			ret = -ENODEV;
  1200			dev_err_probe(dev, ret, "could not read AEC/AGC mode\n");
  1201			goto power_down;
  1202		}
  1203	
  1204		ret = ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG20,
  1205				      &ov5645->timing_tc_reg20);
  1206		if (ret < 0) {
  1207			ret = -ENODEV;
  1208			dev_err_probe(dev, ret, "could not read vflip value\n");
  1209			goto power_down;
  1210		}
  1211	
  1212		ret = ov5645_read_reg(ov5645, OV5645_TIMING_TC_REG21,
  1213				      &ov5645->timing_tc_reg21);
  1214		if (ret < 0) {
  1215			ret = -ENODEV;
  1216			dev_err_probe(dev, ret, "could not read hflip value\n");
  1217			goto power_down;
  1218		}
  1219	
  1220		ov5645->sd.state_lock = ov5645->ctrls.lock;
  1221		ret = v4l2_subdev_init_finalize(&ov5645->sd);
  1222		if (ret < 0) {
  1223			dev_err_probe(dev, ret, "subdev init error\n");
  1224			goto power_down;
  1225		}
  1226	
  1227		ret = v4l2_async_register_subdev_sensor(&ov5645->sd);
  1228		if (ret < 0) {
  1229			dev_err_probe(dev, ret, "could not register v4l2 device\n");
  1230			goto error_subdev_cleanup;
  1231		}
  1232	
  1233		pm_runtime_set_active(dev);
  1234		pm_runtime_get_noresume(dev);
  1235		pm_runtime_enable(dev);
  1236		pm_runtime_set_autosuspend_delay(dev, 1000);
  1237		pm_runtime_use_autosuspend(dev);
  1238		pm_runtime_mark_last_busy(dev);
  1239		pm_runtime_put_autosuspend(dev);
  1240	
  1241		return 0;
  1242	
  1243	error_subdev_cleanup:
  1244		v4l2_subdev_cleanup(&ov5645->sd);
  1245	power_down:
  1246		ov5645_set_power_off(dev);
  1247	free_entity:
  1248		media_entity_cleanup(&ov5645->sd.entity);
  1249	free_ctrl:
  1250		v4l2_ctrl_handler_free(&ov5645->ctrls);
  1251	
  1252		return ret;
  1253	}
  1254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
