Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA777449EB6;
	Tue, 14 Jul 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784042482; cv=none; b=Rmqps0xfyXDSBVN2LCDHxitEawD6gkWDiIDu6csBJ1q7LiIVowSgI9Jhail9s7mtu3o7hjP+qnktZECyAh6WrXDWdB+3QE3+JfFBkGqzpoEJlJ65xeDVqyOTjhTg8D1/D7CscDclizPRazVtg2OiPVLglxEuHpSVkXfnMyktSCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784042482; c=relaxed/simple;
	bh=95JKWRkVVSbV8CGyZaqq2jhZY1rKKni7ZH2lxQcfEm0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KvnbBXFl+2j/eR34Pmd+hXEIslkt7FFtxCQpRfX1gKkC9/VAU5argMTjbcmBReD5W4EUC04ar9lO8zNNRCUrodR4iExDHAOHBKSxxh2+smQZkNIlkrJSXTtMNGvov23E7+m65uFbgozcGfOJhsScTZpFEwvVDD0rI4QY8f3XLIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TKkg9kwS; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TKkg9kwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784042480; x=1815578480;
  h=date:from:to:cc:subject:message-id;
  bh=95JKWRkVVSbV8CGyZaqq2jhZY1rKKni7ZH2lxQcfEm0=;
  b=TKkg9kwSTCYno4OvMaawa5pf1TCjRdHa+cgD7kXaxURYHmyRR91ZSiDj
   2no4RSY1FaUEv9c1cRFQvBeicubySzNLYQdmQzpkdMNZnOsThL9deeWUj
   HmwrLgVsM+lArkZ7btryk00PPAaydU72yi+t9+uPwOHbTLcugTTmDxS+q
   yuA7j7C2znNjM333XXUzzt+xO1/OX7nNxHqX1sbP93LIm/BdyoF1taAuF
   CTbCivJq2HZ+HjWQHnpHUZuXWVFH2b7eZHkkPpQ3mkvaoFoHkHm3hhwGC
   PogEthJJLS050mOZnvEDJeAPuLl25eMLJqx2RYt97FtiRQfINrEJj+BjR
   w==;
X-CSE-ConnectionGUID: CymLePgPQ6OygXtp0EUS1A==
X-CSE-MsgGUID: bb8Php36RT+kR0umAhgHQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11846"; a="84629874"
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="84629874"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2026 08:21:19 -0700
X-CSE-ConnectionGUID: LNkP3ph0T+qoJFo7xlR8Wg==
X-CSE-MsgGUID: WXgXSBwdR9STOvKYiERn/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,164,1779174000"; 
   d="scan'208";a="251928607"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Jul 2026 08:21:17 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjewc-0000000040j-2pch;
	Tue, 14 Jul 2026 15:21:14 +0000
Date: Tue, 14 Jul 2026 17:20:27 +0200
From: kernel test robot <lkp@intel.com>
To: Manish Rangankar <mrangankar@marvell.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>, Nilesh Javali <njavali@marvell.com>,
 Hannes Reinecke <hare@kernel.org>
Subject: drivers/scsi/qla2xxx/qla_init.c:9368:2: warning: label at
 end of compound statement is a C23 extension
Message-ID: <202607141733.w1IF5m43-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Nilesh-Javali/scsi-qla2xxx-Add-29xx-series-PCI-device-ID-support/20260714-180455
head:   a91be341107d322b5c157a8eb685f7d8d4d9277b
commit: da14b131a2d623b4393360a60ee862a7dd1d5d7a scsi: qla2xxx: Add NVRAM config support for 29xx adapters
date:   5 hours ago
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260714/202607141733.w1IF5m43-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607141733.w1IF5m43-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607141733.w1IF5m43-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/scsi/qla2xxx/qla_init.c:9368:2: warning: label at end of compound statement is a C23 extension [-Wc23-extensions]
    9368 |         } else {
         |         ^
   In file included from drivers/scsi/qla2xxx/qla_init.c:6:
   In file included from drivers/scsi/qla2xxx/qla_def.h:12:
   In file included from include/linux/module.h:13:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:5:
   In file included from arch/x86/include/asm/processor.h:25:
   In file included from arch/x86/include/asm/special_insns.h:10:
   In file included from include/linux/irqflags.h:18:
   In file included from arch/x86/include/asm/irqflags.h:100:
   In file included from arch/x86/include/asm/paravirt.h:19:
   In file included from include/linux/cpumask.h:11:
   In file included from include/linux/bitmap.h:13:
   In file included from include/linux/string.h:383:
   include/linux/fortify-string.h:530:4: warning: call to '__read_overflow2_field' declared with 'warning' attribute: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Wattribute-warning]
     530 |                         __read_overflow2_field(q_size_field, size);
         |                         ^
   2 warnings generated.


vim +9368 drivers/scsi/qla2xxx/qla_init.c

  9284	
  9285	int
  9286	qla81xx_nvram_config(scsi_qla_host_t *vha)
  9287	{
  9288		int   rval;
  9289		struct init_cb_81xx *icb;
  9290		struct nvram_81xx *nv;
  9291		__le32 *dptr;
  9292		uint8_t  *dptr1, *dptr2;
  9293		uint32_t chksum;
  9294		uint16_t cnt;
  9295		struct qla_hw_data *ha = vha->hw;
  9296		uint32_t faddr;
  9297		struct active_regions active_regions = { };
  9298	
  9299		rval = QLA_SUCCESS;
  9300		icb = (struct init_cb_81xx *)ha->init_cb;
  9301		nv = ha->nvram;
  9302	
  9303		/* Determine NVRAM starting address. */
  9304		ha->nvram_size = sizeof(*nv);
  9305		ha->vpd_size = FA_NVRAM_VPD_SIZE;
  9306		if (IS_P3P_TYPE(ha) || IS_QLA8031(ha))
  9307			ha->vpd_size = FA_VPD_SIZE_82XX;
  9308	
  9309		/* Get VPD data into cache */
  9310		ha->vpd = ha->nvram + VPD_OFFSET;
  9311	
  9312		if (IS_QLA29XX(ha)) {
  9313			uint16_t fw_options = 0, r_code;
  9314			uint32_t vpd_r[] = {FLT_REG_VPD_0, FLT_REG_VPD_1,
  9315					    FLT_REG_VPD_2, FLT_REG_VPD_3};
  9316			uint32_t nvram_r[] = {FLT_REG_NVRAM_0, FLT_REG_NVRAM_1,
  9317					      FLT_REG_NVRAM_2, FLT_REG_NVRAM_3};
  9318			void *buf;
  9319	
  9320			BUILD_BUG_ON((VPD_OFFSET + FA_NVRAM_VPD_SIZE +
  9321				      sizeof(struct qla_flash_memo_block)) >
  9322				     MAX_NVRAM_SIZE);
  9323	
  9324			ha->fiv = (struct qla_flash_memo_block *)
  9325				((char *)ha->vpd + ha->vpd_size);
  9326	
  9327			buf = qla29xx_read_optrom_data(vha, FLT_REG_FMB_PRI,
  9328						       fw_options, ha->fiv, 0,
  9329						       sizeof(struct qla_flash_memo_block));
  9330			if (!buf) {
  9331				ql_log(ql_log_info, vha, 0x01be,
  9332				    "Unable to read Flash Image Version.\n");
  9333			} else if (ha->fiv->signature != QLFC_FMB_SIG) {
  9334				ql_log(ql_log_warn, vha, 0x01bf,
  9335				    "Invalid FMB signature %#x, expected %#x.\n",
  9336				    le32_to_cpu(ha->fiv->signature),
  9337				    le32_to_cpu(QLFC_FMB_SIG));
  9338				ha->fiv = NULL;
  9339			} else {
  9340				ql_log(ql_log_info, vha, 0x0024,
  9341				    "Flash Image Version %u.%02u.%02u\n",
  9342				    ha->fiv->mbi_ver.major,
  9343				    ha->fiv->mbi_ver.minor,
  9344				    ha->fiv->mbi_ver.sub);
  9345			}
  9346	
  9347			if (ha->port_no >= ARRAY_SIZE(vpd_r)) {
  9348				ql_log(ql_log_warn, vha, 0x002e,
  9349				    "Invalid port number %u, skipping VPD/NVRAM read.\n",
  9350				    ha->port_no);
  9351				goto out_29xx;
  9352			}
  9353	
  9354			r_code = vpd_r[ha->port_no];
  9355			buf = qla29xx_read_optrom_data(vha, r_code, fw_options,
  9356						       ha->vpd, 0, ha->vpd_size);
  9357			if (!buf)
  9358				ql_log(ql_log_info, vha, 0x002d,
  9359				    "Unable to read VPD info.\n");
  9360	
  9361			r_code = nvram_r[ha->port_no];
  9362			buf = qla29xx_read_optrom_data(vha, r_code, fw_options,
  9363						       ha->nvram, 0, ha->nvram_size);
  9364			if (!buf)
  9365				ql_log(ql_log_info, vha, 0x0013,
  9366				    "Unable to read nvram config info.\n");
  9367	out_29xx:
> 9368		} else {
  9369			if (IS_QLA28XX(ha) || IS_QLA27XX(ha))
  9370				qla28xx_get_aux_images(vha, &active_regions);
  9371	
  9372			faddr = ha->flt_region_vpd;
  9373			if (IS_QLA28XX(ha)) {
  9374				if (active_regions.aux.vpd_nvram ==
  9375				    QLA27XX_SECONDARY_IMAGE)
  9376					faddr = ha->flt_region_vpd_sec;
  9377				ql_dbg(ql_dbg_init, vha, 0x0110,
  9378				    "Loading %s nvram image.\n",
  9379				    active_regions.aux.vpd_nvram ==
  9380				    QLA27XX_PRIMARY_IMAGE ?
  9381				    "primary" : "secondary");
  9382			}
  9383			ha->isp_ops->read_optrom(vha, ha->vpd, faddr << 2,
  9384						 ha->vpd_size);
  9385	
  9386			/* Get NVRAM data into cache and calculate checksum. */
  9387			faddr = ha->flt_region_nvram;
  9388			if (IS_QLA28XX(ha)) {
  9389				if (active_regions.aux.vpd_nvram ==
  9390				    QLA27XX_SECONDARY_IMAGE)
  9391					faddr = ha->flt_region_nvram_sec;
  9392			}
  9393			ql_dbg(ql_dbg_init, vha, 0x0110,
  9394			    "Loading %s nvram image.\n",
  9395			    active_regions.aux.vpd_nvram == QLA27XX_PRIMARY_IMAGE ?
  9396			    "primary" : "secondary");
  9397			ha->isp_ops->read_optrom(vha, ha->nvram, faddr << 2,
  9398						 ha->nvram_size);
  9399		}
  9400	
  9401		dptr = (__force __le32 *)nv;
  9402		for (cnt = 0, chksum = 0; cnt < ha->nvram_size >> 2; cnt++, dptr++)
  9403			chksum += le32_to_cpu(*dptr);
  9404	
  9405		ql_dbg(ql_dbg_init + ql_dbg_buffer, vha, 0x0111,
  9406		    "Contents of NVRAM:\n");
  9407		ql_dump_buffer(ql_dbg_init + ql_dbg_buffer, vha, 0x0112,
  9408		    nv, ha->nvram_size);
  9409	
  9410		/* Bad NVRAM data, set defaults parameters. */
  9411		if (chksum || memcmp("ISP ", nv->id, sizeof(nv->id)) ||
  9412		    le16_to_cpu(nv->nvram_version) < ICB_VERSION) {
  9413			/* Reset NVRAM data. */
  9414			ql_log(ql_log_info, vha, 0x0073,
  9415			    "Inconsistent NVRAM checksum=%#x id=%.4s version=%#x.\n",
  9416			    chksum, nv->id, le16_to_cpu(nv->nvram_version));
  9417			ql_dump_buffer(ql_dbg_init, vha, 0x0073, nv, sizeof(*nv));
  9418			ql_log(ql_log_info, vha, 0x0074,
  9419			    "Falling back to functioning (yet invalid -- WWPN) "
  9420			    "defaults.\n");
  9421	
  9422			/*
  9423			 * Set default initialization control block.
  9424			 */
  9425			memset(nv, 0, ha->nvram_size);
  9426			nv->nvram_version = cpu_to_le16(ICB_VERSION);
  9427			nv->version = cpu_to_le16(ICB_VERSION);
  9428			nv->frame_payload_size = cpu_to_le16(2048);
  9429			nv->execution_throttle = cpu_to_le16(0xFFFF);
  9430			nv->exchange_count = cpu_to_le16(0);
  9431			nv->port_name[0] = 0x21;
  9432			nv->port_name[1] = 0x00 + ha->port_no + 1;
  9433			nv->port_name[2] = 0x00;
  9434			nv->port_name[3] = 0xe0;
  9435			nv->port_name[4] = 0x8b;
  9436			nv->port_name[5] = 0x1c;
  9437			nv->port_name[6] = 0x55;
  9438			nv->port_name[7] = 0x86;
  9439			nv->node_name[0] = 0x20;
  9440			nv->node_name[1] = 0x00;
  9441			nv->node_name[2] = 0x00;
  9442			nv->node_name[3] = 0xe0;
  9443			nv->node_name[4] = 0x8b;
  9444			nv->node_name[5] = 0x1c;
  9445			nv->node_name[6] = 0x55;
  9446			nv->node_name[7] = 0x86;
  9447			nv->login_retry_count = cpu_to_le16(8);
  9448			nv->interrupt_delay_timer = cpu_to_le16(0);
  9449			nv->login_timeout = cpu_to_le16(0);
  9450			nv->firmware_options_1 =
  9451			    cpu_to_le32(BIT_14|BIT_13|BIT_2|BIT_1);
  9452			if (IS_QLA29XX(ha))
  9453				nv->firmware_options_2 = cpu_to_le32(BIT_4);
  9454			else
  9455				nv->firmware_options_2 = cpu_to_le32(BIT_5);
  9456			nv->firmware_options_2 |= cpu_to_le32(BIT_12);
  9457			nv->firmware_options_3 = cpu_to_le32(2 << 13);
  9458			nv->host_p = cpu_to_le32(BIT_11|BIT_10);
  9459			nv->efi_parameters = cpu_to_le32(0);
  9460			nv->reset_delay = 5;
  9461			nv->max_luns_per_target = cpu_to_le16(128);
  9462			nv->port_down_retry_count = cpu_to_le16(30);
  9463			nv->link_down_timeout = cpu_to_le16(180);
  9464			nv->enode_mac[0] = 0x00;
  9465			nv->enode_mac[1] = 0xC0;
  9466			nv->enode_mac[2] = 0xDD;
  9467			nv->enode_mac[3] = 0x04;
  9468			nv->enode_mac[4] = 0x05;
  9469			nv->enode_mac[5] = 0x06 + ha->port_no + 1;
  9470	
  9471			rval = 1;
  9472		}
  9473	
  9474		if (IS_T10_PI_CAPABLE(ha))
  9475			nv->frame_payload_size &= cpu_to_le16(~7);
  9476	
  9477		qlt_81xx_config_nvram_stage1(vha, nv);
  9478	
  9479		/* Reset Initialization control block */
  9480		memset(icb, 0, ha->init_cb_size);
  9481	
  9482		/* Copy 1st segment. */
  9483		dptr1 = (uint8_t *)icb;
  9484		dptr2 = (uint8_t *)&nv->version;
  9485		cnt = (uint8_t *)&icb->response_q_inpointer - (uint8_t *)&icb->version;
  9486		while (cnt--)
  9487			*dptr1++ = *dptr2++;
  9488	
  9489		icb->login_retry_count = nv->login_retry_count;
  9490	
  9491		/* Copy 2nd segment. */
  9492		dptr1 = (uint8_t *)&icb->interrupt_delay_timer;
  9493		dptr2 = (uint8_t *)&nv->interrupt_delay_timer;
  9494		cnt = (uint8_t *)&icb->reserved_5 -
  9495		    (uint8_t *)&icb->interrupt_delay_timer;
  9496		while (cnt--)
  9497			*dptr1++ = *dptr2++;
  9498	
  9499		memcpy(icb->enode_mac, nv->enode_mac, sizeof(icb->enode_mac));
  9500		/* Some boards (with valid NVRAMs) still have NULL enode_mac!! */
  9501		if (!memcmp(icb->enode_mac, "\0\0\0\0\0\0", sizeof(icb->enode_mac))) {
  9502			icb->enode_mac[0] = 0x00;
  9503			icb->enode_mac[1] = 0xC0;
  9504			icb->enode_mac[2] = 0xDD;
  9505			icb->enode_mac[3] = 0x04;
  9506			icb->enode_mac[4] = 0x05;
  9507			icb->enode_mac[5] = 0x06 + ha->port_no + 1;
  9508		}
  9509	
  9510		/* Use extended-initialization control block. */
  9511		memcpy(ha->ex_init_cb, &nv->ex_version, sizeof(*ha->ex_init_cb));
  9512		ha->frame_payload_size = le16_to_cpu(icb->frame_payload_size);
  9513		/*
  9514		 * Setup driver NVRAM options.
  9515		 */
  9516		qla2x00_set_model_info(vha, nv->model_name, sizeof(nv->model_name),
  9517		    "QLE8XXX");
  9518	
  9519		qlt_81xx_config_nvram_stage2(vha, icb);
  9520	
  9521		/* Use alternate WWN? */
  9522		if (nv->host_p & cpu_to_le32(BIT_15)) {
  9523			memcpy(icb->node_name, nv->alternate_node_name, WWN_SIZE);
  9524			memcpy(icb->port_name, nv->alternate_port_name, WWN_SIZE);
  9525		}
  9526	
  9527		/* Prepare nodename */
  9528		if ((icb->firmware_options_1 & cpu_to_le32(BIT_14)) == 0) {
  9529			/*
  9530			 * Firmware will apply the following mask if the nodename was
  9531			 * not provided.
  9532			 */
  9533			memcpy(icb->node_name, icb->port_name, WWN_SIZE);
  9534			icb->node_name[0] &= 0xF0;
  9535		}
  9536	
  9537		/* SCM Enabled in NVRAM */
  9538		if (IS_QLA29XX(ha) || IS_QLA28XX(ha) || IS_QLA27XX(ha)) {
  9539			if ((le16_to_cpu(nv->enhanced_features) & BIT_7) == 0) {
  9540				ql_log(ql_log_info, vha, 0x0062,
  9541				       "USCM enabled in NVRAM\n");
  9542				ha->flags.scm_supported_a = 1;
  9543			}
  9544		}
  9545	
  9546		/* Set host adapter parameters. */
  9547		ha->flags.disable_risc_code_load = 0;
  9548		ha->flags.enable_lip_reset = 0;
  9549		ha->flags.enable_lip_full_login =
  9550		    le32_to_cpu(nv->host_p) & BIT_10 ? 1 : 0;
  9551		ha->flags.enable_target_reset =
  9552		    le32_to_cpu(nv->host_p) & BIT_11 ? 1 : 0;
  9553		ha->flags.enable_led_scheme = 0;
  9554		ha->flags.disable_serdes = le32_to_cpu(nv->host_p) & BIT_5 ? 1 : 0;
  9555	
  9556		ha->operating_mode = (le32_to_cpu(icb->firmware_options_2) &
  9557		    (BIT_6 | BIT_5 | BIT_4)) >> 4;
  9558	
  9559		/* save HBA serial number */
  9560		ha->serial0 = icb->port_name[5];
  9561		ha->serial1 = icb->port_name[6];
  9562		ha->serial2 = icb->port_name[7];
  9563		memcpy(vha->node_name, icb->node_name, WWN_SIZE);
  9564		memcpy(vha->port_name, icb->port_name, WWN_SIZE);
  9565	
  9566		icb->execution_throttle = cpu_to_le16(0xFFFF);
  9567	
  9568		ha->retry_count = le16_to_cpu(nv->login_retry_count);
  9569	
  9570		/* Set minimum login_timeout to 4 seconds. */
  9571		if (le16_to_cpu(nv->login_timeout) < ql2xlogintimeout)
  9572			nv->login_timeout = cpu_to_le16(ql2xlogintimeout);
  9573		if (le16_to_cpu(nv->login_timeout) < 4)
  9574			nv->login_timeout = cpu_to_le16(4);
  9575		ha->login_timeout = le16_to_cpu(nv->login_timeout);
  9576	
  9577		/* Set minimum RATOV to 100 tenths of a second. */
  9578		ha->r_a_tov = 100;
  9579	
  9580		ha->loop_reset_delay = nv->reset_delay;
  9581	
  9582		/* Link Down Timeout = 0:
  9583		 *
  9584		 *	When Port Down timer expires we will start returning
  9585		 *	I/O's to OS with "DID_NO_CONNECT".
  9586		 *
  9587		 * Link Down Timeout != 0:
  9588		 *
  9589		 *	 The driver waits for the link to come up after link down
  9590		 *	 before returning I/Os to OS with "DID_NO_CONNECT".
  9591		 */
  9592		if (le16_to_cpu(nv->link_down_timeout) == 0) {
  9593			ha->loop_down_abort_time =
  9594			    (LOOP_DOWN_TIME - LOOP_DOWN_TIMEOUT);
  9595		} else {
  9596			ha->link_down_timeout =	le16_to_cpu(nv->link_down_timeout);
  9597			ha->loop_down_abort_time =
  9598			    (LOOP_DOWN_TIME - ha->link_down_timeout);
  9599		}
  9600	
  9601		/* Need enough time to try and get the port back. */
  9602		ha->port_down_retry_count = le16_to_cpu(nv->port_down_retry_count);
  9603		if (qlport_down_retry)
  9604			ha->port_down_retry_count = qlport_down_retry;
  9605	
  9606		/* Set login_retry_count */
  9607		ha->login_retry_count  = le16_to_cpu(nv->login_retry_count);
  9608		if (ha->port_down_retry_count ==
  9609		    le16_to_cpu(nv->port_down_retry_count) &&
  9610		    ha->port_down_retry_count > 3)
  9611			ha->login_retry_count = ha->port_down_retry_count;
  9612		else if (ha->port_down_retry_count > (int)ha->login_retry_count)
  9613			ha->login_retry_count = ha->port_down_retry_count;
  9614		if (ql2xloginretrycount)
  9615			ha->login_retry_count = ql2xloginretrycount;
  9616	
  9617		/* if not running MSI-X we need handshaking on interrupts */
  9618		if (!vha->hw->flags.msix_enabled &&
  9619		    (IS_QLA83XX(ha) || IS_QLA27XX(ha) || IS_QLA28XX(ha) ||
  9620		     IS_QLA29XX(ha)))
  9621			icb->firmware_options_2 |= cpu_to_le32(BIT_22);
  9622	
  9623		/* Enable ZIO. */
  9624		if (!vha->flags.init_done) {
  9625			ha->zio_mode = le32_to_cpu(icb->firmware_options_2) &
  9626			    (BIT_3 | BIT_2 | BIT_1 | BIT_0);
  9627			ha->zio_timer = le16_to_cpu(icb->interrupt_delay_timer) ?
  9628			    le16_to_cpu(icb->interrupt_delay_timer) : 2;
  9629		}
  9630		icb->firmware_options_2 &= cpu_to_le32(
  9631		    ~(BIT_3 | BIT_2 | BIT_1 | BIT_0));
  9632		vha->flags.process_response_queue = 0;
  9633		if (ha->zio_mode != QLA_ZIO_DISABLED) {
  9634			ha->zio_mode = QLA_ZIO_MODE_6;
  9635	
  9636			ql_log(ql_log_info, vha, 0x0075,
  9637			    "ZIO mode %d enabled; timer delay (%d us).\n",
  9638			    ha->zio_mode,
  9639			    ha->zio_timer * 100);
  9640	
  9641			icb->firmware_options_2 |= cpu_to_le32(
  9642			    (uint32_t)ha->zio_mode);
  9643			icb->interrupt_delay_timer = cpu_to_le16(ha->zio_timer);
  9644			vha->flags.process_response_queue = 1;
  9645		}
  9646	
  9647		 /* enable RIDA Format2 */
  9648		icb->firmware_options_3 |= cpu_to_le32(BIT_0);
  9649	
  9650		/* N2N: driver will initiate Login instead of FW */
  9651		icb->firmware_options_3 |= cpu_to_le32(BIT_8);
  9652	
  9653		/* Determine NVMe/FCP priority for target ports */
  9654		ha->fc4_type_priority = qla2xxx_get_fc4_priority(vha);
  9655	
  9656		if (rval) {
  9657			ql_log(ql_log_warn, vha, 0x0076,
  9658			    "NVRAM configuration failed.\n");
  9659		}
  9660		return (rval);
  9661	}
  9662	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
