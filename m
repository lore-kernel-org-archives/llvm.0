Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05FC1B4223;
	Thu,  9 Jul 2026 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783560043; cv=none; b=mECqGihiZ9ips2rF6Zm1myrgGHZ1Z5WnO2NtEOr1jrmhxDOvsO/kloxG6NpEy2wc6o5KEh5+R8NuTLfJZKPZhjoN1kDDfMGHb3XksSXkTG3kWmKPtpo2TAbZ3PQaEHwunNzxPsHzBcbxEXw1PT5P4cpp7u53QVFjsS+5qO07wRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783560043; c=relaxed/simple;
	bh=LttNXcGFbufaKTBAr4+JQHSVCQEjsZ32ZOusNaxmB28=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QVoL4dVfM1BkhdcIw08ZlsoqmyU08Ktc97vFC6WzbcawxHkt3A1Hd+f54Cgf0QnLD3smOlmmziVl6qfsr0eJFDu9PpCHi9OjFKhPomAP/oG5/PSYqn1o4DMsdtVEN1p1jQSy2LWUF+O8hcOYRapJrMj91f4J1SnZDwk3BvPj0Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X2EQ3+R5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X2EQ3+R5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783560041; x=1815096041;
  h=date:from:to:cc:subject:message-id;
  bh=LttNXcGFbufaKTBAr4+JQHSVCQEjsZ32ZOusNaxmB28=;
  b=X2EQ3+R5u1E6AtSvcqV4Akky/+x12nLAeSCP3AFx+hw/T+3+WOUCuIa0
   s1Z2gx+vZ7Re0ENKODqBqir8VmeB1gQ30okUKYjoqePs+IEqO5WijwbF4
   d/8u1vDxU6WxsPx1BmJ+xie4IVUvF9TLQPNW2fN+qOY/jkG818TFoOkn2
   pPqB3oTm3+IWC9f4bFIl8vZP5SRvzC4rl1lHgP496O7Ri6VJXK2FdZUd5
   pKdw6/yxTHO81nXpQ0FelxRPmsUE37U/U4s3eHgLB+csgER2A4C0T7LN6
   ZX/uX8k1w7I8Gt7F0qTQ1tctkAvwMiRe223Zg94lDhQZ63g81MNlWuKTL
   g==;
X-CSE-ConnectionGUID: +ZXfC37iRsiSZPz0alGWWw==
X-CSE-MsgGUID: yQCBtGT1Q0KID7aTTnfHPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="86779696"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="86779696"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:20:40 -0700
X-CSE-ConnectionGUID: agD6otz5Q1+rpLgJPJArDQ==
X-CSE-MsgGUID: /e05WLaZQdqHE1Jlx/0EFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251076537"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jul 2026 18:20:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whdRL-00000000H7b-2269;
	Thu, 09 Jul 2026 01:20:35 +0000
Date: Thu, 09 Jul 2026 09:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: "Chen-Yu Tsai" <wenst@chromium.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [wens:mtk-wip 28/60]
 drivers/input/mouse/elan_i2c_core.c:1258:10: error: call to undeclared
 function 'regulator_bulk_enable_and_wait'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202607090837.afHOrVIm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   6bb13b3f06e1186263e25a011225629d221dcf65
commit: d6806397b23038f2497ae717bc64bd25c22c1e07 [28/60] Input: elan_i2c: Support vddio regulator supply
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260709/202607090837.afHOrVIm-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090837.afHOrVIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090837.afHOrVIm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/mouse/elan_i2c_core.c:1258:10: error: call to undeclared function 'regulator_bulk_enable_and_wait'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1258 |         error = regulator_bulk_enable_and_wait(ARRAY_SIZE(data->supplies), data->supplies,
         |                 ^
   drivers/input/mouse/elan_i2c_core.c:1258:10: note: did you mean 'regulator_bulk_enable'?
   include/linux/regulator/consumer.h:465:19: note: 'regulator_bulk_enable' declared here
     465 | static inline int regulator_bulk_enable(int num_consumers,
         |                   ^
   drivers/input/mouse/elan_i2c_core.c:1415:11: error: call to undeclared function 'regulator_bulk_enable_and_wait'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1415 |                 error = regulator_bulk_enable_and_wait(ARRAY_SIZE(data->supplies),
         |                         ^
   2 errors generated.


vim +/regulator_bulk_enable_and_wait +1258 drivers/input/mouse/elan_i2c_core.c

  1218	
  1219	static int elan_probe(struct i2c_client *client)
  1220	{
  1221		const struct elan_transport_ops *transport_ops;
  1222		struct device *dev = &client->dev;
  1223		struct elan_tp_data *data;
  1224		unsigned long irqflags;
  1225		int error;
  1226	
  1227		if (IS_ENABLED(CONFIG_MOUSE_ELAN_I2C_I2C) &&
  1228		    i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
  1229			transport_ops = &elan_i2c_ops;
  1230		} else if (IS_ENABLED(CONFIG_MOUSE_ELAN_I2C_SMBUS) &&
  1231			   i2c_check_functionality(client->adapter,
  1232						   I2C_FUNC_SMBUS_BYTE_DATA |
  1233							I2C_FUNC_SMBUS_BLOCK_DATA |
  1234							I2C_FUNC_SMBUS_I2C_BLOCK)) {
  1235			transport_ops = &elan_smbus_ops;
  1236		} else {
  1237			dev_err(dev, "not a supported I2C/SMBus adapter\n");
  1238			return -EIO;
  1239		}
  1240	
  1241		data = devm_kzalloc(dev, sizeof(struct elan_tp_data), GFP_KERNEL);
  1242		if (!data)
  1243			return -ENOMEM;
  1244	
  1245		i2c_set_clientdata(client, data);
  1246	
  1247		data->ops = transport_ops;
  1248		data->client = client;
  1249		init_completion(&data->fw_completion);
  1250		mutex_init(&data->sysfs_mutex);
  1251	
  1252		data->supplies[0].supply = "vcc";
  1253		data->supplies[1].supply = "vddio";
  1254		error = devm_regulator_bulk_get(dev, ARRAY_SIZE(data->supplies), data->supplies);
  1255		if (error)
  1256			return dev_err_probe(dev, error, "Failed to get regulators\n");
  1257	
> 1258		error = regulator_bulk_enable_and_wait(ARRAY_SIZE(data->supplies), data->supplies,
  1259						       ETP_POWER_ON_DELAY_US);
  1260		if (error) {
  1261			dev_err(dev, "Failed to enable regulators: %d\n", error);
  1262			return error;
  1263		}
  1264	
  1265		error = devm_add_action_or_reset(dev, elan_disable_regulator, data);
  1266		if (error) {
  1267			dev_err(dev, "Failed to add disable regulator action: %d\n",
  1268				error);
  1269			return error;
  1270		}
  1271	
  1272		/* Make sure there is something at this address */
  1273		error = i2c_smbus_read_byte(client);
  1274		if (error < 0) {
  1275			dev_dbg(&client->dev, "nothing at this address: %d\n", error);
  1276			return -ENXIO;
  1277		}
  1278	
  1279		/* Initialize the touchpad. */
  1280		error = elan_initialize(data, false);
  1281		if (error)
  1282			return error;
  1283	
  1284		error = elan_query_device_info(data);
  1285		if (error)
  1286			return error;
  1287	
  1288		error = elan_query_device_parameters(data);
  1289		if (error)
  1290			return error;
  1291	
  1292		dev_info(dev,
  1293			 "Elan Touchpad: Module ID: 0x%04x, Firmware: 0x%04x, Sample: 0x%04x, IAP: 0x%04x\n",
  1294			 data->product_id,
  1295			 data->fw_version,
  1296			 data->sm_version,
  1297			 data->iap_version);
  1298	
  1299		dev_dbg(dev,
  1300			"Elan Touchpad Extra Information:\n"
  1301			"    Max ABS X,Y:   %d,%d\n"
  1302			"    Width X,Y:   %d,%d\n"
  1303			"    Resolution X,Y:   %d,%d (dots/mm)\n"
  1304			"    ic type: 0x%x\n"
  1305			"    info pattern: 0x%x\n",
  1306			data->max_x, data->max_y,
  1307			data->width_x, data->width_y,
  1308			data->x_res, data->y_res,
  1309			data->ic_type, data->pattern);
  1310	
  1311		/* Set up input device properties based on queried parameters. */
  1312		error = elan_setup_input_device(data);
  1313		if (error)
  1314			return error;
  1315	
  1316		if (device_property_read_bool(&client->dev, "elan,trackpoint")) {
  1317			error = elan_setup_trackpoint_input_device(data);
  1318			if (error)
  1319				return error;
  1320		}
  1321	
  1322		/*
  1323		 * Platform code (ACPI, DTS) should normally set up interrupt
  1324		 * for us, but in case it did not let's fall back to using falling
  1325		 * edge to be compatible with older Chromebooks.
  1326		 */
  1327		irqflags = irq_get_trigger_type(client->irq);
  1328		if (!irqflags)
  1329			irqflags = IRQF_TRIGGER_FALLING;
  1330	
  1331		error = devm_request_threaded_irq(dev, client->irq, NULL, elan_isr,
  1332						  irqflags | IRQF_ONESHOT,
  1333						  client->name, data);
  1334		if (error) {
  1335			dev_err(dev, "cannot register irq=%d\n", client->irq);
  1336			return error;
  1337		}
  1338	
  1339		error = input_register_device(data->input);
  1340		if (error) {
  1341			dev_err(dev, "failed to register input device: %d\n", error);
  1342			return error;
  1343		}
  1344	
  1345		if (data->tp_input) {
  1346			error = input_register_device(data->tp_input);
  1347			if (error) {
  1348				dev_err(&client->dev,
  1349					"failed to register TrackPoint input device: %d\n",
  1350					error);
  1351				return error;
  1352			}
  1353		}
  1354	
  1355		return 0;
  1356	}
  1357	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
