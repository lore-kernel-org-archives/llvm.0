Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C279B1DA628;
	Sat, 21 Feb 2026 13:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771681515; cv=none; b=gAc1ef3VBnavij8urnJUtwyO/bcwS/uNCqm8WH8De/jQ9fKC2gFXSppCfUtWUykLkvTWu/EeI2IlwTYQ1ezdnpKcJY5tj22sBvfyFu34DPKW8Ram+kKgQNt6h26UljrRU8bbcLQI2DBDE8ur8klToAiDvTy6d1CbfrJZ+YUstyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771681515; c=relaxed/simple;
	bh=5gmChf/roBx12xhdeIouDawp+BBptEQmy/+TEwWG/Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCIlFommV6+2lLapUZuLsGlDAqxocri3Qr8h3xkVoOcaAThxtBF+KbCK5yvNMGO37hKsWzTxJ5YMNQvBA84m9PF6d0g+FT31xQNLLoW4u69gJevHorRTiLFN2I4t7RDtFVjrdAmr+dOCiBj/kAxCKk0zoutNnLG66z8dwWDxCDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPVzTtnn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPVzTtnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771681513; x=1803217513;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5gmChf/roBx12xhdeIouDawp+BBptEQmy/+TEwWG/Lo=;
  b=iPVzTtnnc/3Pf+rDVEWFXa0D5Ei4YBxhBRc2epza1DRDwLwRUeMmGHtL
   kM7Jrnx8DA9cnjnz4tCw0P8qHfHitb66O6TjLUk/W9cQSz+Mz3LVI/vsi
   YEBPOZ1YMKS7qNBcN6UWXpdKgoGHDi7LnkaLf0nv76Gi8S2V/nX5613Uq
   JHEKZsebsBWXG/ThlT7oMdvkAUsYBMiXSURa6+RA6vSsn+4ZXCR4Ugs/h
   gSH0HU2KWyjEdSURo4nP5IFsJMWPX4tQbarn7TmqjQUd5zswgezplTniL
   M0/uQeaYBHaussiikCSdXb7dQpNgRTdnMyeAdM0Htd21Ornf+kd722iN7
   w==;
X-CSE-ConnectionGUID: CMXhsYsfTXW1kzipAbByew==
X-CSE-MsgGUID: 55MAc0hwTnugUCTInQMHVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="72656736"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72656736"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 05:45:10 -0800
X-CSE-ConnectionGUID: wFo0ZL01Rf2JuG7ehCNiYw==
X-CSE-MsgGUID: c1H89yKlS1uT4fNQdxZqeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="218766916"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Feb 2026 05:45:08 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtnIA-000000014wy-1Ra7;
	Sat, 21 Feb 2026 13:45:06 +0000
Date: Sat, 21 Feb 2026 21:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: use kzalloc_obj() in rtw_wlan_util.c
Message-ID: <202602212141.LMXjQcjY-lkp@intel.com>
References: <20260221082311.128678-2-giorgitchankvetadze1997@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221082311.128678-2-giorgitchankvetadze1997@gmail.com>

Hi Giorgi,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Giorgi-Tchankvetadze/staging-rtl8723bs-use-kzalloc_obj-in-rtw_wlan_util-c/20260221-162627
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260221082311.128678-2-giorgitchankvetadze1997%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: use kzalloc_obj() in rtw_wlan_util.c
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20260221/202602212141.LMXjQcjY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602212141.LMXjQcjY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602212141.LMXjQcjY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/rtl8723bs/core/rtw_wlan_util.c:8:
   In file included from drivers/staging/rtl8723bs/include/drv_types.h:19:
   In file included from drivers/staging/rtl8723bs/include/osdep_service.h:15:
   In file included from drivers/staging/rtl8723bs/include/osdep_service_linux.h:18:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:44:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/staging/rtl8723bs/core/rtw_wlan_util.c:1134:8: error: incompatible pointer types assigning to 'struct wlan_bssid_ex *' from 'typeof (bssid) *' (aka 'struct wlan_bssid_ex **'); dereference with * [-Werror,-Wincompatible-pointer-types]
    1134 |         bssid = kzalloc_obj(bssid, GFP_KERNEL);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 *(                            )
   1 warning and 1 error generated.


vim +1134 drivers/staging/rtl8723bs/core/rtw_wlan_util.c

  1100	
  1101	int rtw_check_bcn_info(struct adapter *Adapter, u8 *pframe, u32 packet_len)
  1102	{
  1103		unsigned int len;
  1104		unsigned char *p;
  1105		unsigned short	val16, subtype;
  1106		struct wlan_network *cur_network = &(Adapter->mlmepriv.cur_network);
  1107		/* u8 wpa_ie[255], rsn_ie[255]; */
  1108		u16 wpa_len = 0, rsn_len = 0;
  1109		u8 encryp_protocol = 0;
  1110		struct wlan_bssid_ex *bssid;
  1111		int group_cipher = 0, pairwise_cipher = 0, is_8021x = 0;
  1112		unsigned char *pbuf;
  1113		u32 wpa_ielen = 0;
  1114		u8 *pbssid = GetAddr3Ptr(pframe);
  1115		struct HT_info_element *pht_info = NULL;
  1116		struct ieee80211_ht_cap *pht_cap = NULL;
  1117		u32 bcn_channel;
  1118		unsigned short	ht_cap_info;
  1119		unsigned char ht_info_infos_0;
  1120		struct mlme_priv *pmlmepriv = &Adapter->mlmepriv;
  1121		int ssid_len;
  1122	
  1123		if (is_client_associated_to_ap(Adapter) == false)
  1124			return true;
  1125	
  1126		len = packet_len - sizeof(struct ieee80211_hdr_3addr);
  1127	
  1128		if (len > MAX_IE_SZ)
  1129			return _FAIL;
  1130	
  1131		if (memcmp(cur_network->network.mac_address, pbssid, 6))
  1132			return true;
  1133	
> 1134		bssid = kzalloc_obj(bssid, GFP_KERNEL);
  1135		if (!bssid)
  1136			return true;
  1137	
  1138		if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) > DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)) {
  1139			pmlmepriv->timeBcnInfoChkStart = 0;
  1140			pmlmepriv->NumOfBcnInfoChkFail = 0;
  1141		}
  1142	
  1143		subtype = GetFrameSubType(pframe) >> 4;
  1144	
  1145		if (subtype == WIFI_BEACON)
  1146			bssid->reserved[0] = 1;
  1147	
  1148		bssid->length = sizeof(struct wlan_bssid_ex) - MAX_IE_SZ + len;
  1149	
  1150		/* below is to copy the information element */
  1151		bssid->ie_length = len;
  1152		memcpy(bssid->ies, (pframe + sizeof(struct ieee80211_hdr_3addr)), bssid->ie_length);
  1153	
  1154		/* check bw and channel offset */
  1155		/* parsing HT_CAP_IE */
  1156		p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_CAPABILITY, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
  1157		if (p && len > 0) {
  1158			pht_cap = (struct ieee80211_ht_cap *)(p + 2);
  1159			ht_cap_info = le16_to_cpu(pht_cap->cap_info);
  1160		} else {
  1161			ht_cap_info = 0;
  1162		}
  1163		/* parsing HT_INFO_IE */
  1164		p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
  1165		if (p && len > 0) {
  1166			pht_info = (struct HT_info_element *)(p + 2);
  1167			ht_info_infos_0 = pht_info->infos[0];
  1168		} else {
  1169			ht_info_infos_0 = 0;
  1170		}
  1171		if (ht_cap_info != cur_network->bcn_info.ht_cap_info ||
  1172		    ((ht_info_infos_0 & 0x03) != (cur_network->bcn_info.ht_info_infos_0 & 0x03))) {
  1173			{
  1174				/* bcn_info_update */
  1175				cur_network->bcn_info.ht_cap_info = ht_cap_info;
  1176				cur_network->bcn_info.ht_info_infos_0 = ht_info_infos_0;
  1177				/* to do : need to check that whether modify related register of BB or not */
  1178			}
  1179			/* goto _mismatch; */
  1180		}
  1181	
  1182		/* Checking for channel */
  1183		p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_DS_PARAMS, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
  1184		if (p) {
  1185			bcn_channel = *(p + 2);
  1186		} else {/* In 5G, some ap do not have DSSET IE checking HT info for channel */
  1187			rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_HT_OPERATION,
  1188				   &len, bssid->ie_length - _FIXED_IE_LENGTH_);
  1189			if (pht_info)
  1190				bcn_channel = pht_info->primary_channel;
  1191			else /* we don't find channel IE, so don't check it */
  1192				bcn_channel = Adapter->mlmeextpriv.cur_channel;
  1193		}
  1194	
  1195		if (bcn_channel != Adapter->mlmeextpriv.cur_channel)
  1196			goto _mismatch;
  1197	
  1198		/* checking SSID */
  1199		ssid_len = 0;
  1200		p = rtw_get_ie(bssid->ies + _FIXED_IE_LENGTH_, WLAN_EID_SSID, &len, bssid->ie_length - _FIXED_IE_LENGTH_);
  1201		if (p) {
  1202			ssid_len = *(p + 1);
  1203			if (ssid_len > NDIS_802_11_LENGTH_SSID)
  1204				ssid_len = 0;
  1205		}
  1206		memcpy(bssid->ssid.ssid, (p + 2), ssid_len);
  1207		bssid->ssid.ssid_length = ssid_len;
  1208	
  1209		if (memcmp(bssid->ssid.ssid, cur_network->network.ssid.ssid, 32) ||
  1210				bssid->ssid.ssid_length != cur_network->network.ssid.ssid_length)
  1211			if (bssid->ssid.ssid[0] != '\0' &&
  1212			    bssid->ssid.ssid_length != 0) /* not hidden ssid */
  1213				goto _mismatch;
  1214	
  1215		/* check encryption info */
  1216		val16 = rtw_get_capability((struct wlan_bssid_ex *)bssid);
  1217	
  1218		if (val16 & BIT(4))
  1219			bssid->privacy = 1;
  1220		else
  1221			bssid->privacy = 0;
  1222	
  1223		if (cur_network->network.privacy != bssid->privacy)
  1224			goto _mismatch;
  1225	
  1226		rtw_get_sec_ie(bssid->ies, bssid->ie_length, NULL, &rsn_len, NULL, &wpa_len);
  1227	
  1228		if (rsn_len > 0)
  1229			encryp_protocol = ENCRYP_PROTOCOL_WPA2;
  1230		else if (wpa_len > 0)
  1231			encryp_protocol = ENCRYP_PROTOCOL_WPA;
  1232		else
  1233			if (bssid->privacy)
  1234				encryp_protocol = ENCRYP_PROTOCOL_WEP;
  1235	
  1236		if (cur_network->bcn_info.encryp_protocol != encryp_protocol)
  1237			goto _mismatch;
  1238	
  1239		if (encryp_protocol == ENCRYP_PROTOCOL_WPA || encryp_protocol == ENCRYP_PROTOCOL_WPA2) {
  1240			pbuf = rtw_get_wpa_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length - 12);
  1241			if (pbuf && (wpa_ielen > 0)) {
  1242				rtw_parse_wpa_ie(pbuf, wpa_ielen + 2, &group_cipher,
  1243						 &pairwise_cipher, &is_8021x);
  1244			} else {
  1245				pbuf = rtw_get_wpa2_ie(&bssid->ies[12], &wpa_ielen, bssid->ie_length - 12);
  1246	
  1247				if (pbuf && (wpa_ielen > 0))
  1248					rtw_parse_wpa2_ie(pbuf, wpa_ielen + 2, &group_cipher,
  1249							  &pairwise_cipher, &is_8021x);
  1250			}
  1251	
  1252			if (pairwise_cipher != cur_network->bcn_info.pairwise_cipher ||
  1253			    group_cipher != cur_network->bcn_info.group_cipher)
  1254				goto _mismatch;
  1255	
  1256			if (is_8021x != cur_network->bcn_info.is_8021x)
  1257				goto _mismatch;
  1258		}
  1259	
  1260		kfree(bssid);
  1261		return _SUCCESS;
  1262	
  1263	_mismatch:
  1264		kfree(bssid);
  1265	
  1266		if (pmlmepriv->NumOfBcnInfoChkFail == 0)
  1267			pmlmepriv->timeBcnInfoChkStart = jiffies;
  1268	
  1269		pmlmepriv->NumOfBcnInfoChkFail++;
  1270	
  1271		if ((pmlmepriv->timeBcnInfoChkStart != 0) && (jiffies_to_msecs(jiffies - pmlmepriv->timeBcnInfoChkStart) <= DISCONNECT_BY_CHK_BCN_FAIL_OBSERV_PERIOD_IN_MS)
  1272			&& (pmlmepriv->NumOfBcnInfoChkFail >= DISCONNECT_BY_CHK_BCN_FAIL_THRESHOLD)) {
  1273			pmlmepriv->timeBcnInfoChkStart = 0;
  1274			pmlmepriv->NumOfBcnInfoChkFail = 0;
  1275			return _FAIL;
  1276		}
  1277	
  1278		return _SUCCESS;
  1279	}
  1280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
