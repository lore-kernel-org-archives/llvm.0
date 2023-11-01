Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEC37F;
	Wed,  1 Nov 2023 05:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buL6ahxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698815716; x=1730351716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMqjr1u6Jq6hpunkoQM5QSqm910ej59C8rAAstVUpZM=;
  b=buL6ahxwkay4ds3wS3iX2n34Z+AB+wAa4sbPE5PjXXqtCwaTj/C2OVVa
   OhxNj+mfqPsXHUSkbFkAEQRpN/P2ulj3/icz0pIzopKpXilR4FYOOcKW7
   +ZCjz7ctdqiwDcBNA/ne7SPnEfipU7e6Mv/HEn0kTalqU779YrviqTLcT
   y/ZwqKprIdzf1Rh79OVUgSRAnpW9sOd1/Jadbktgd9s+thwgBx0xE61lo
   46Zdvtl+MMI3D65vDwwb2FTyxHNudwpOq8MVNTfJ47pJ/MMbhcyUL9q+v
   L2rGzEB6fBwe++VR/TtiiUkZHqp6xqIPK4RA22J32PDcAIPiZVVRhINaq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="368645203"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="368645203"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 22:15:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="851469284"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="851469284"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2023 22:15:13 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy3ZP-0000cK-04;
	Wed, 01 Nov 2023 05:15:11 +0000
Date: Wed, 1 Nov 2023 13:14:41 +0800
From: kernel test robot <lkp@intel.com>
To: Louis Kuo <louis.kuo@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>
Subject: [pinchartl:mtk/v6.6/pumpkin/backports 12/21]
 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1068:27:
 error: field has incomplete type 'struct v4l2_async_subdev'
Message-ID: <202311011342.LIk8BYos-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.6/pumpkin/backports
head:   eef5453d892b19767a44d8a683fe6a3d0992bfdb
commit: 58edac54d6fd6ad03fbf9b2a590287296860f845 [12/21] media: platform: mediatek: isp_30: add mediatek ISP3.0 sensor interface
config: powerpc64-allmodconfig (https://download.01.org/0day-ci/archive/20231101/202311011342.LIk8BYos-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011342.LIk8BYos-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011342.LIk8BYos-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:401:3: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     401 |                 mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI0,
         |                 ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:328:8: note: expanded from macro 'mtk_seninf_update'
     328 |                             FIELD_PREP(reg##_##field, val))
         |                             ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:415:3: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     415 |                 mtk_seninf_update(priv, SENINF_TOP_PHY_SENINF_CTL_CSI1,
         |                 ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:328:8: note: expanded from macro 'mtk_seninf_update'
     328 |                             FIELD_PREP(reg##_##field, val))
         |                             ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:447:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     447 |         mtk_seninf_input_update(input, MIPI_RX_CON24_CSI0, CSI0_BIST_LN0_MUX, lanes[0]);
         |         ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:340:7: note: expanded from macro 'mtk_seninf_input_update'
     340 |                                   FIELD_PREP(reg##_##field, val))
         |                                   ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:472:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     472 |         mtk_seninf_input_update(input, SENINF_CTRL, SENINF_EN, 1);
         |         ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:340:7: note: expanded from macro 'mtk_seninf_input_update'
     340 |                                   FIELD_PREP(reg##_##field, val))
         |                                   ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:550:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     550 |         mtk_seninf_mux_update(mux, SENINF_MUX_CTRL, SENINF_MUX_EN, 1);
         |         ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:363:5: note: expanded from macro 'mtk_seninf_mux_update'
     363 |                                 FIELD_PREP(reg##_##field, val))
         |                                 ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:623:2: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     623 |         mtk_seninf_update(priv, SENINF_TOP_CTRL, MUX_LP_MODE, 0);
         |         ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:328:8: note: expanded from macro 'mtk_seninf_update'
     328 |                             FIELD_PREP(reg##_##field, val))
         |                             ^
>> drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1068:27: error: field has incomplete type 'struct v4l2_async_subdev'
    1068 |         struct v4l2_async_subdev asd;
         |                                  ^
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1068:9: note: forward declaration of 'struct v4l2_async_subdev'
    1068 |         struct v4l2_async_subdev asd;
         |                ^
>> drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1101:8: error: invalid application of 'sizeof' to an incomplete type 'struct v4l2_async_subdev'
    1101 |         asd = v4l2_async_nf_add_fwnode(&priv->notifier,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1102 |                                        fwnode, struct v4l2_async_subdev);
         |                                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/media/v4l2-async.h:196:56: note: expanded from macro 'v4l2_async_nf_add_fwnode'
     196 |         ((type *)__v4l2_async_nf_add_fwnode(notifier, fwnode, sizeof(type)))
         |                                                               ^     ~~~~~~
   drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1068:9: note: forward declaration of 'struct v4l2_async_subdev'
    1068 |         struct v4l2_async_subdev asd;
         |                ^
>> drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1215:11: error: incompatible function pointer types initializing 'int (*)(struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_connection *)' with an expression of type 'int (struct v4l2_async_notifier *, struct v4l2_subdev *, struct v4l2_async_subdev *)' [-Wincompatible-function-pointer-types]
    1215 |         .bound = mtk_seninf_notifier_bound,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1259:36: error: too few arguments to function call, expected 2, have 1
    1259 |         v4l2_async_nf_init(&priv->notifier);
         |         ~~~~~~~~~~~~~~~~~~                ^
   include/media/v4l2-async.h:159:6: note: 'v4l2_async_nf_init' declared here
     159 | void v4l2_async_nf_init(struct v4l2_async_notifier *notifier,
         |      ^
>> drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c:1271:48: error: too many arguments to function call, expected single argument 'notifier', have 2 arguments
    1271 |         ret = v4l2_async_nf_register(&priv->v4l2_dev, &priv->notifier);
         |               ~~~~~~~~~~~~~~~~~~~~~~                  ^~~~~~~~~~~~~~~
   include/media/v4l2-async.h:281:5: note: 'v4l2_async_nf_register' declared here
     281 | int v4l2_async_nf_register(struct v4l2_async_notifier *notifier);
         |     ^
   11 errors generated.


vim +1068 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c

  1062	
  1063	/* -----------------------------------------------------------------------------
  1064	 * Async Subdev Notifier
  1065	 */
  1066	
  1067	struct mtk_seninf_async_subdev {
> 1068		struct v4l2_async_subdev asd;
  1069		struct mtk_seninf_input *input;
  1070		unsigned int port;
  1071	};
  1072	
  1073	static int mtk_seninf_fwnode_parse(struct device *dev,
  1074					   unsigned int id)
  1075	
  1076	{
  1077		static const char * const phy_names[] = { "csi0", "csi1", "csi2", "csi0b"};
  1078		struct mtk_seninf *priv = dev_get_drvdata(dev);
  1079		struct mtk_seninf_async_subdev *s_asd;
  1080		struct fwnode_handle *ep, *fwnode;
  1081		struct mtk_seninf_input *input;
  1082		struct v4l2_async_subdev *asd;
  1083		struct v4l2_fwnode_endpoint vep = {
  1084			.bus_type = V4L2_MBUS_CSI2_DPHY,
  1085		};
  1086		unsigned int port;
  1087		int ret;
  1088	
  1089		ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), id, 0, 0);
  1090		if (!ep)
  1091			return 0;
  1092	
  1093		fwnode = fwnode_graph_get_remote_endpoint(ep);
  1094		ret = v4l2_fwnode_endpoint_parse(ep, &vep);
  1095		if (ret) {
  1096			dev_err(dev, "Failed to parse %pOF\n", to_of_node(fwnode));
  1097			ret = -EINVAL;
  1098			goto out;
  1099		}
  1100	
> 1101		asd = v4l2_async_nf_add_fwnode(&priv->notifier,
  1102					       fwnode, struct v4l2_async_subdev);
  1103		if (IS_ERR(asd)) {
  1104			ret = PTR_ERR(asd);
  1105			goto out;
  1106		}
  1107		s_asd = container_of(asd, struct mtk_seninf_async_subdev, asd);
  1108	
  1109		port = vep.base.port;
  1110		s_asd->port = port;
  1111	
  1112		if (mtk_seninf_pad_is_source(priv, port)) {
  1113			ret = 0;
  1114			goto out;
  1115		}
  1116	
  1117		if (vep.bus_type != V4L2_MBUS_CSI2_DPHY) {
  1118			dev_err(dev, "Only CSI2 bus type is currently supported\n");
  1119			ret = -EINVAL;
  1120			goto out;
  1121		}
  1122	
  1123		input = &priv->inputs[port];
  1124	
  1125		input->pad = port;
  1126		input->seninf_id = port_to_seninf_id[port];
  1127		input->base = priv->base + 0x1000 * input->seninf_id;
  1128		input->seninf = priv;
  1129	
  1130		input->bus = vep.bus.mipi_csi2;
  1131	
  1132		input->phy = devm_phy_get(dev, phy_names[port]);
  1133		if (IS_ERR(input->phy)) {
  1134			dev_err(dev, "failed to get phy:%ld\n", PTR_ERR(input->phy));
  1135			ret = PTR_ERR(input->phy);
  1136			goto out;
  1137		}
  1138		input->phy_mode = SENINF_PHY_MODE_4D1C;
  1139	
  1140		s_asd->input = input;
  1141	
  1142		ret = 0;
  1143	out:
  1144		fwnode_handle_put(ep);
  1145		fwnode_handle_put(fwnode);
  1146		return ret;
  1147	}
  1148	
  1149	static int mtk_seninf_notifier_bound(struct v4l2_async_notifier *notifier,
  1150					     struct v4l2_subdev *sd,
  1151					     struct v4l2_async_subdev *asd)
  1152	{
  1153		struct mtk_seninf *priv = container_of(notifier, struct mtk_seninf, notifier);
  1154		struct mtk_seninf_async_subdev *s_asd =
  1155			container_of(asd, struct mtk_seninf_async_subdev, asd);
  1156		struct device_link *link;
  1157		int ret;
  1158	
  1159		dev_dbg(priv->dev, "%s bound to SENINF port %u\n", sd->entity.name, s_asd->port);
  1160	
  1161		if (mtk_seninf_pad_is_sink(priv, s_asd->port)) {
  1162			struct mtk_seninf_input *input = s_asd->input;
  1163	
  1164			input->source_sd = sd;
  1165	
  1166			link = device_link_add(priv->dev, sd->dev,
  1167					       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
  1168			if (!link) {
  1169				dev_err(priv->dev,
  1170					"Failed to create device link from source %s\n", sd->name);
  1171				return -EINVAL;
  1172			}
  1173	
  1174			ret = v4l2_create_fwnode_links_to_pad(sd, &priv->pads[input->pad],
  1175							      MEDIA_LNK_FL_IMMUTABLE |
  1176							      MEDIA_LNK_FL_ENABLED);
  1177		} else {
  1178			link = device_link_add(sd->dev, priv->dev,
  1179					       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
  1180			if (!link) {
  1181				dev_err(priv->dev,
  1182					"Failed to create device link to output %s\n", sd->name);
  1183				return -EINVAL;
  1184			}
  1185	
  1186			ret = v4l2_create_fwnode_links_to_pad(&priv->subdev,
  1187							      &sd->entity.pads[0],
  1188							      MEDIA_LNK_FL_IMMUTABLE |
  1189							      MEDIA_LNK_FL_ENABLED);
  1190		}
  1191		if (ret) {
  1192			dev_err(priv->dev, "Failed to create links between SENINF port %u and %s (%d)\n",
  1193				s_asd->port, sd->entity.name, ret);
  1194			return ret;
  1195		}
  1196	
  1197		return 0;
  1198	}
  1199	
  1200	static int mtk_seninf_notifier_complete(struct v4l2_async_notifier *notifier)
  1201	{
  1202		struct mtk_seninf *priv = container_of(notifier, struct mtk_seninf, notifier);
  1203		int ret;
  1204	
  1205		ret = v4l2_device_register_subdev_nodes(&priv->v4l2_dev);
  1206		if (ret) {
  1207			dev_err(priv->dev, "Failed to register subdev nodes: %d\n", ret);
  1208			return ret;
  1209		}
  1210	
  1211		return 0;
  1212	}
  1213	
  1214	static const struct v4l2_async_notifier_operations mtk_seninf_async_ops = {
> 1215		.bound = mtk_seninf_notifier_bound,
  1216		.complete = mtk_seninf_notifier_complete,
  1217	};
  1218	
  1219	static int mtk_seninf_media_init(struct mtk_seninf *priv)
  1220	{
  1221		struct media_device *media_dev = &priv->media_dev;
  1222		const struct mtk_seninf_conf *conf = priv->conf;
  1223		u8 num_pads = conf->nb_outputs + conf->nb_inputs;
  1224		struct media_pad *pads = priv->pads;
  1225		struct device *dev = priv->dev;
  1226		unsigned int i;
  1227		int ret;
  1228	
  1229		media_dev->dev = dev;
  1230		strscpy(media_dev->model, conf->model, sizeof(media_dev->model));
  1231		snprintf(media_dev->bus_info, sizeof(media_dev->bus_info),
  1232			 "platform:%s", dev_name(dev));
  1233		media_dev->hw_revision = 0;
  1234		media_device_init(media_dev);
  1235	
  1236		ret = media_entity_pads_init(&priv->subdev.entity, num_pads, pads);
  1237		if (ret)
  1238			goto err_clean_media;
  1239	
  1240		for (i = 0; i < conf->nb_inputs; i++)
  1241			pads[i].flags = MEDIA_PAD_FL_SINK;
  1242		for (i = conf->nb_inputs; i < num_pads; i++)
  1243			pads[i].flags = MEDIA_PAD_FL_SOURCE;
  1244	
  1245		return 0;
  1246	err_clean_media:
  1247		media_device_cleanup(media_dev);
  1248	
  1249		return ret;
  1250	}
  1251	
  1252	static int mtk_seninf_v4l2_async_register(struct mtk_seninf *priv)
  1253	{
  1254		const struct mtk_seninf_conf *conf = priv->conf;
  1255		struct device *dev = priv->dev;
  1256		unsigned int i;
  1257		int ret;
  1258	
> 1259		v4l2_async_nf_init(&priv->notifier);
  1260	
  1261		for (i = 0; i < conf->nb_inputs + conf->nb_outputs; ++i) {
  1262			ret = mtk_seninf_fwnode_parse(dev, i);
  1263	
  1264			if (ret) {
  1265				dev_err(dev, "Failed to parse endpoint at port %d, err: %d\n", i, ret);
  1266				goto err_clean_notififer;
  1267			}
  1268		}
  1269	
  1270		priv->notifier.ops = &mtk_seninf_async_ops;
  1271		ret = v4l2_async_nf_register(&priv->v4l2_dev, &priv->notifier);
  1272		if (ret) {
  1273			dev_err(dev, "Failed to register async notifier: %d\n", ret);
  1274			goto err_clean_notififer;
  1275		}
  1276		return 0;
  1277	
  1278	err_clean_notififer:
  1279		v4l2_async_nf_cleanup(&priv->notifier);
  1280	
  1281		return ret;
  1282	}
  1283	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
