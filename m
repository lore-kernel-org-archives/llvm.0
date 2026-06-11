Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5C5285068;
	Thu, 11 Jun 2026 02:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781144802; cv=none; b=qSsoaVsAUDnrcQD4BOS6HKRTREPXsTY65qCb+j4OQCK/5znI5Fnxnpx82HiHgP6WFxztJG2h+/X/NTflyoXsmOnbpvf+BpjkHi58cO6j7v1pYzjFlfMU88p2b8A3p6a/4UjOOSumP4/zLvk8kkU7sqZkjyOtQau9HQt0zlZdBwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781144802; c=relaxed/simple;
	bh=42ocNaY4J5enhd7f4uXUrDsldtOXegJngP81m4fa5o8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SsIBq+axcgzFLf0ga2gYcuwt9R33zZ00H2PSzwFfNx056ayJ5Gn+dk9UFX5ja2dxek4//9yVfbX3xKEyqGHAYjudMXbhZc3K0YjbchLxjiDFfdYl7T5T7vyqVLf8WSiTx90Xbf5ogZOA9X3quSL39YxqyPjGqZozKY+mJm4IXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXf7Rwdz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXf7Rwdz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781144800; x=1812680800;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=42ocNaY4J5enhd7f4uXUrDsldtOXegJngP81m4fa5o8=;
  b=lXf7Rwdzu8IlPHocgOXUksVyXHxT91z0pp8BC2rhJ+5jBNicStH/9GaB
   /C5MwpGAOxJuNE0+3C1rgD2ut+c6eO2l7nUS7JxfxSImOymEMvkCOc6fb
   lePcoyGLKegVmdx8WGNya0D7toDMqwxWx2i3074mdDVsyu8HcnuKucC2D
   pntT3VP66msFe1GmkjdfHjgCOVOXdk2+pphJLKeLBda+4NyucUKs1Zr62
   s+e+ywYxeFJ4bW3yNA+Uiz4n7Qd0dxFtpYmMAce5iuZMgaGttaTEWqw24
   8CdLCQioDcBACbnfpkM7d7V3+52+Ifbkg+jtMdvjyDWXMboqAyN6Btdt8
   A==;
X-CSE-ConnectionGUID: z75yNPa9Q9ShJQc7mimR0w==
X-CSE-MsgGUID: zBt9wY5gT8aBjQYlFvsKGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81695347"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="81695347"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 19:26:40 -0700
X-CSE-ConnectionGUID: 1CfD3wkvSDiRCrnQE4hKnA==
X-CSE-MsgGUID: lMipG0LISgmMXjJCBe5GgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="284426761"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jun 2026 19:26:37 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXV7p-00000000MBy-3uM3;
	Thu, 11 Jun 2026 02:26:34 +0000
Date: Thu, 11 Jun 2026 10:26:17 +0800
From: kernel test robot <lkp@intel.com>
To: Markus Elfring <Markus.Elfring@web.de>, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	Adrian Korwel <adriank20047@gmail.com>,
	Felix Gu <ustc.gu@gmail.com>
Subject: Re: [PATCH] USB: serial: io_ti: Use common error handling code in
 do_download_mode()
Message-ID: <202606111021.E9ag1FLC-lkp@intel.com>
References: <188a2ea8-6bb6-46aa-883d-a1472b35217f@web.de>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <188a2ea8-6bb6-46aa-883d-a1472b35217f@web.de>

Hi Markus,

kernel test robot noticed the following build errors:

[auto build test ERROR on johan-usb-serial/usb-next]
[also build test ERROR on johan-usb-serial/usb-linus usb/usb-testing usb/usb-next usb/usb-linus westeri-thunderbolt/next linus/master v7.1-rc7 next-20260609]
[cannot apply to peter-chen-usb/for-usb-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Elfring/USB-serial-io_ti-Use-common-error-handling-code-in-do_download_mode/20260610-232603
base:   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git usb-next
patch link:    https://lore.kernel.org/r/188a2ea8-6bb6-46aa-883d-a1472b35217f%40web.de
patch subject: [PATCH] USB: serial: io_ti: Use common error handling code in do_download_mode()
config: i386-buildonly-randconfig-003-20260611 (https://download.01.org/0day-ci/archive/20260611/202606111021.E9ag1FLC-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606111021.E9ag1FLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606111021.E9ag1FLC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/usb/serial/io_ti.c:1325:8: error: use of undeclared identifier 'vheader'
    1325 |         kfree(vheader);
         |               ^~~~~~~
>> drivers/usb/serial/io_ti.c:1326:8: error: use of undeclared identifier 'header'
    1326 |         kfree(header);
         |               ^~~~~~
>> drivers/usb/serial/io_ti.c:1336:8: error: use of undeclared identifier 'record'
    1336 |         kfree(record);
         |               ^~~~~~
>> drivers/usb/serial/io_ti.c:1338:8: error: use of undeclared identifier 'firmware_version'
    1338 |         kfree(firmware_version);
         |               ^~~~~~~~~~~~~~~~
   4 errors generated.


vim +/vheader +1325 drivers/usb/serial/io_ti.c

  1065	
  1066	static int do_download_mode(struct edgeport_serial *serial,
  1067			const struct firmware *fw)
  1068	{
  1069		struct device *dev = &serial->serial->interface->dev;
  1070		int status = 0;
  1071		int start_address;
  1072		struct edge_ti_manuf_descriptor *ti_manuf_desc;
  1073		int download_cur_ver;
  1074		int download_new_ver;
  1075		struct edgeport_fw_hdr *fw_hdr = (struct edgeport_fw_hdr *)fw->data;
  1076		struct ti_i2c_desc *rom_desc;
  1077	
  1078		dev_dbg(dev, "%s - RUNNING IN DOWNLOAD MODE\n", __func__);
  1079	
  1080		status = check_i2c_image(serial);
  1081		if (status) {
  1082			dev_dbg(dev, "%s - DOWNLOAD MODE -- BAD I2C\n", __func__);
  1083			return status;
  1084		}
  1085	
  1086		/*
  1087		 * Validate Hardware version number
  1088		 * Read Manufacturing Descriptor from TI Based Edgeport
  1089		 */
  1090		ti_manuf_desc = kmalloc_obj(*ti_manuf_desc);
  1091		if (!ti_manuf_desc)
  1092			return -ENOMEM;
  1093	
  1094		status = get_manuf_info(serial, (u8 *)ti_manuf_desc);
  1095		if (status)
  1096			goto free_ti_manuf_desc;
  1097	
  1098		/* Check version number of ION descriptor */
  1099		if (!ignore_cpu_rev && ti_cpu_rev(ti_manuf_desc) < 2) {
  1100			dev_dbg(dev, "%s - Wrong CPU Rev %d (Must be 2)\n",
  1101				__func__, ti_cpu_rev(ti_manuf_desc));
  1102			status = -EINVAL;
  1103			goto free_ti_manuf_desc;
  1104		}
  1105	
  1106		rom_desc = kmalloc_obj(*rom_desc);
  1107		if (!rom_desc) {
  1108			status = -ENOMEM;
  1109			goto free_ti_manuf_desc;
  1110		}
  1111	
  1112		/* Search for type 2 record (firmware record) */
  1113		start_address = get_descriptor_addr(serial,
  1114				I2C_DESC_TYPE_FIRMWARE_BASIC, rom_desc);
  1115		if (start_address != 0) {
  1116			struct ti_i2c_firmware_rec *firmware_version;
  1117			u8 *record;
  1118	
  1119			dev_dbg(dev, "%s - Found Type FIRMWARE (Type 2) record\n",
  1120					__func__);
  1121	
  1122			firmware_version = kmalloc_obj(*firmware_version);
  1123			if (!firmware_version)
  1124				goto e_nomem;
  1125	
  1126			/*
  1127			 * Validate version number
  1128			 * Read the descriptor data
  1129			 */
  1130			status = read_rom(serial, start_address +
  1131					sizeof(struct ti_i2c_desc),
  1132					sizeof(struct ti_i2c_firmware_rec),
  1133					(u8 *)firmware_version);
  1134			if (status)
  1135				goto free_firmware_version;
  1136	
  1137			/*
  1138			 * Check version number of download with current
  1139			 * version in I2c
  1140			 */
  1141			download_cur_ver = (firmware_version->Ver_Major << 8) +
  1142					   (firmware_version->Ver_Minor);
  1143			download_new_ver = (fw_hdr->major_version << 8) +
  1144					   (fw_hdr->minor_version);
  1145	
  1146			dev_dbg(dev, "%s - >> FW Versions Device %d.%d  Driver %d.%d\n",
  1147				__func__, firmware_version->Ver_Major,
  1148				firmware_version->Ver_Minor,
  1149				fw_hdr->major_version, fw_hdr->minor_version);
  1150	
  1151			/*
  1152			 * Check if we have an old version in the I2C and
  1153			 * update if necessary
  1154			 */
  1155			if (download_cur_ver < download_new_ver) {
  1156				dev_dbg(dev, "%s - Update I2C dld from %d.%d to %d.%d\n",
  1157					__func__,
  1158					firmware_version->Ver_Major,
  1159					firmware_version->Ver_Minor,
  1160					fw_hdr->major_version,
  1161					fw_hdr->minor_version);
  1162	
  1163				record = kmalloc(1, GFP_KERNEL);
  1164				if (!record) {
  1165					status = -ENOMEM;
  1166					goto free_firmware_version;
  1167				}
  1168				/*
  1169				 * In order to update the I2C firmware we must
  1170				 * change the type 2 record to type 0xF2. This
  1171				 * will force the UMP to come up in Boot Mode.
  1172				 * Then while in boot mode, the driver will
  1173				 * download the latest firmware (padded to
  1174				 * 15.5k) into the UMP ram. Finally when the
  1175				 * device comes back up in download mode the
  1176				 * driver will cause the new firmware to be
  1177				 * copied from the UMP Ram to I2C and the
  1178				 * firmware will update the record type from
  1179				 * 0xf2 to 0x02.
  1180				 */
  1181				*record = I2C_DESC_TYPE_FIRMWARE_BLANK;
  1182	
  1183				/*
  1184				 * Change the I2C Firmware record type to
  1185				 * 0xf2 to trigger an update
  1186				 */
  1187				status = write_rom(serial, start_address,
  1188						sizeof(*record), record);
  1189				if (status)
  1190					goto free_record;
  1191	
  1192				/*
  1193				 * verify the write -- must do this in order
  1194				 * for write to complete before we do the
  1195				 * hardware reset
  1196				 */
  1197				status = read_rom(serial,
  1198							start_address,
  1199							sizeof(*record),
  1200							record);
  1201				if (status)
  1202					goto free_record;
  1203	
  1204				if (*record != I2C_DESC_TYPE_FIRMWARE_BLANK) {
  1205					dev_err(dev, "%s - error resetting device\n",
  1206							__func__);
  1207					goto e_nodev;
  1208				}
  1209	
  1210				dev_dbg(dev, "%s - HARDWARE RESET\n", __func__);
  1211	
  1212				/* Reset UMP -- Back to BOOT MODE */
  1213				status = ti_vsend_sync(serial->serial->dev,
  1214						UMPC_HARDWARE_RESET,
  1215						0, 0, NULL, 0,
  1216						TI_VSEND_TIMEOUT_DEFAULT);
  1217	
  1218				dev_dbg(dev, "%s - HARDWARE RESET return %d\n",
  1219						__func__, status);
  1220	
  1221				/* return an error on purpose. */
  1222				goto e_nodev;
  1223			}
  1224			/* Same or newer fw version is already loaded */
  1225			serial->fw_version = download_cur_ver;
  1226			kfree(firmware_version);
  1227		}
  1228		/* Search for type 0xF2 record (firmware blank record) */
  1229		else {
  1230			start_address = get_descriptor_addr(serial,
  1231					I2C_DESC_TYPE_FIRMWARE_BLANK, rom_desc);
  1232			if (start_address != 0) {
  1233	#define HEADER_SIZE	(sizeof(struct ti_i2c_desc) + \
  1234					sizeof(struct ti_i2c_firmware_rec))
  1235				u8 *header;
  1236				u8 *vheader;
  1237	
  1238				header = kmalloc(HEADER_SIZE, GFP_KERNEL);
  1239				if (!header)
  1240					goto e_nomem;
  1241	
  1242				vheader = kmalloc(HEADER_SIZE, GFP_KERNEL);
  1243				if (!vheader) {
  1244					kfree(header);
  1245					goto e_nomem;
  1246				}
  1247	
  1248				dev_dbg(dev, "%s - Found Type BLANK FIRMWARE (Type F2) record\n",
  1249						__func__);
  1250	
  1251				/*
  1252				 * In order to update the I2C firmware we must change
  1253				 * the type 2 record to type 0xF2. This will force the
  1254				 * UMP to come up in Boot Mode.  Then while in boot
  1255				 * mode, the driver will download the latest firmware
  1256				 * (padded to 15.5k) into the UMP ram. Finally when the
  1257				 * device comes back up in download mode the driver
  1258				 * will cause the new firmware to be copied from the
  1259				 * UMP Ram to I2C and the firmware will update the
  1260				 * record type from 0xf2 to 0x02.
  1261				 */
  1262				status = build_i2c_fw_hdr(header, fw);
  1263				if (status)
  1264					goto e_inval;
  1265	
  1266				/*
  1267				 * Update I2C with type 0xf2 record with correct
  1268				 * size and checksum
  1269				 */
  1270				status = write_rom(serial,
  1271							start_address,
  1272							HEADER_SIZE,
  1273							header);
  1274				if (status)
  1275					goto e_inval;
  1276	
  1277				/*
  1278				 * verify the write -- must do this in order for
  1279				 * write to complete before we do the hardware reset
  1280				 */
  1281				status = read_rom(serial, start_address,
  1282								HEADER_SIZE, vheader);
  1283	
  1284				if (status) {
  1285					dev_dbg(dev, "%s - can't read header back\n",
  1286							__func__);
  1287					goto free_vheader;
  1288				}
  1289				if (memcmp(vheader, header, HEADER_SIZE)) {
  1290					dev_dbg(dev, "%s - write download record failed\n",
  1291							__func__);
  1292					goto e_inval;
  1293				}
  1294	
  1295				kfree(vheader);
  1296				kfree(header);
  1297	
  1298				dev_dbg(dev, "%s - Start firmware update\n", __func__);
  1299	
  1300				/* Tell firmware to copy download image into I2C */
  1301				status = ti_vsend_sync(serial->serial->dev,
  1302						UMPC_COPY_DNLD_TO_I2C,
  1303						0, 0, NULL, 0,
  1304						TI_VSEND_TIMEOUT_FW_DOWNLOAD);
  1305	
  1306				dev_dbg(dev, "%s - Update complete 0x%x\n", __func__,
  1307						status);
  1308				if (status) {
  1309					dev_err(dev,
  1310						"%s - UMPC_COPY_DNLD_TO_I2C failed\n",
  1311						__func__);
  1312					goto free_rom_desc;
  1313				}
  1314			}
  1315		}
  1316	
  1317		/* The device is running the download code */
  1318		kfree(rom_desc);
  1319		kfree(ti_manuf_desc);
  1320		return 0;
  1321	
  1322	e_inval:
  1323		status = -EINVAL;
  1324	free_vheader:
> 1325		kfree(vheader);
> 1326		kfree(header);
  1327		goto free_rom_desc;
  1328	
  1329	e_nomem:
  1330		status = -ENOMEM;
  1331		goto free_rom_desc;
  1332	
  1333	e_nodev:
  1334		status = -ENODEV;
  1335	free_record:
> 1336		kfree(record);
  1337	free_firmware_version:
> 1338		kfree(firmware_version);
  1339	free_rom_desc:
  1340		kfree(rom_desc);
  1341	free_ti_manuf_desc:
  1342		kfree(ti_manuf_desc);
  1343		return status;
  1344	}
  1345	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
