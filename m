Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621AA27A47F;
	Tue, 15 Sep 2026 01:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436673; cv=none; b=r7R/EFL0sctcbfNaHlPEHp0BGBLoYnxM/s26O0V4GSwVh4VlEFFDUlrQCUd8OnUbAdAqQPbvme5hc/93ffjape/CF/kw1VzV3M81oyLq4goTgntRUX5p+8X2UHxiKvA/zd5PqiQawhu5KxQAqJUAjEflqWyy1Hf0ensK21rT30A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436673; c=relaxed/simple;
	bh=/pzDdZf/Sud0cF16hTuprFeHO4d7wO0i7IHquADjRKE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETSrVgw8c/pO5z2a3p/XWUhodSMBlY3Ab35Ix0LC2cC75Psj1BnE6npfNyg3pYsagxPHHCiNF3N+khOUI4DgdQ2EUvE7wnZzQij7FNn9X8Nw4cB+49Gqkf7rN1PFwSyCwcr5Usg6Y6xHa0212lCGyiMmhtVmVk4kOrnz/6Y0c5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHUDg338; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHUDg338"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789436672; x=1820972672;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=/pzDdZf/Sud0cF16hTuprFeHO4d7wO0i7IHquADjRKE=;
  b=aHUDg338Adv9AVdaQDnubEZN4uwQZ6qx3L6pxQhLUsBKB6sFBXHzuJQL
   420/K3DuwdXkIdY4uj2ZVkKcYGX2RFcY7VWE+Pg9zNuXRg7KPVCToGvXa
   7Pzpc/QOTLVqlMpyr5HHz934A11VfjOWJwk7L/XSspCmEpNcNithTB2L6
   eCGfkVNAABUz4cTXT4pHskZaE18TvwDRrL3SE5Ar4Lx2foZ5F/0iXL4kW
   ElcsvAVNTI3hC/j4IzWl4SZAqmFWjOnMPCabyrV8n0QuYRczEb52EpRwY
   qFJshTXKnS0F1SkANLCLB4CHOFfVwMvB0JAGyyQEb/lBT0Y3uRkEOTTNI
   Q==;
X-CSE-ConnectionGUID: JILunqXRTW274kdJFMF8gQ==
X-CSE-MsgGUID: bUFicJZoRRqqSj5uHN284g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89636228"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89636228"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 18:44:31 -0700
X-CSE-ConnectionGUID: VwTe2nyPSDqlLCN+t8v4VA==
X-CSE-MsgGUID: MiCS2eEORi6rBhnlQuco2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1010027"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 14 Sep 2026 18:44:29 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6IDi-000000003pe-2Dcn;
	Tue, 15 Sep 2026 01:44:26 +0000
Date: Tue, 15 Sep 2026 09:44:06 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	=?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: fix lines exceeding 100 columns in
 rtw_security.c
Message-ID: <202609150940.PBljt2rP-lkp@intel.com>
References: <20260914145256.996968-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260914145256.996968-1-vladurares@gmail.com>

Hi Rareș-Mihai,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Rare-Mihai-Vladu/staging-rtl8723bs-fix-lines-exceeding-100-columns-in-rtw_security-c/20260914-145256
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260914145256.996968-1-vladurares%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: fix lines exceeding 100 columns in rtw_security.c
config: hexagon-randconfig-002-20260915 (https://download.01.org/0day-ci/archive/20260915/202609150940.PBljt2rP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 148ee2b266b73a49f1f31d0bd17d4818b91bee9f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150940.PBljt2rP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150940.PBljt2rP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/core/rtw_security.c:1337:7: error: redefinition of 'keyid' with a different type: 'int' vs 'u16' (aka 'unsigned short')
    1337 |                 int keyid = padapter->securitypriv.dot11wBIPKeyid;
         |                     ^
   drivers/staging/rtl8723bs/core/rtw_security.c:1311:7: note: previous definition is here
    1311 |                 u16 keyid = 0;
         |                     ^
   1 error generated.


vim +1337 drivers/staging/rtl8723bs/core/rtw_security.c

  1277	
  1278	u32 rtw_BIP_verify(struct adapter *padapter, u8 *precvframe)
  1279	{
  1280		struct rx_pkt_attrib *pattrib = &((union recv_frame *)precvframe)->u.hdr.attrib;
  1281		u8 *pframe;
  1282		u8 *BIP_AAD, *p;
  1283		u32 res = _FAIL;
  1284		uint len, ori_len;
  1285		struct ieee80211_hdr *pwlanhdr;
  1286		u8 mic[16];
  1287		struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
  1288		__le16 le_tmp;
  1289		__le64 le_tmp64 = 0;
  1290	
  1291		ori_len = pattrib->pkt_len - WLAN_HDR_A3_LEN + BIP_AAD_SIZE;
  1292		BIP_AAD = kzalloc(ori_len, GFP_KERNEL);
  1293		if (!BIP_AAD)
  1294			return _FAIL;
  1295	
  1296		/* PKT start */
  1297		pframe = (unsigned char *)((union recv_frame *)precvframe)->u.hdr.rx_data;
  1298		/* mapping to wlan header */
  1299		pwlanhdr = (struct ieee80211_hdr *)pframe;
  1300		/* save the frame body + MME */
  1301		memcpy(BIP_AAD + BIP_AAD_SIZE,
  1302		       pframe + WLAN_HDR_A3_LEN,
  1303		       pattrib->pkt_len - WLAN_HDR_A3_LEN);
  1304		/* find MME IE pointer */
  1305		p = rtw_get_ie(BIP_AAD + BIP_AAD_SIZE,
  1306			       WLAN_EID_MMIE,
  1307			       &len,
  1308			       pattrib->pkt_len - WLAN_HDR_A3_LEN);
  1309		/* Baron */
  1310		if (p) {
  1311			u16 keyid = 0;
  1312			u64 temp_ipn = 0;
  1313			/* save packet number */
  1314			memcpy(&le_tmp64, p + 4, 6);
  1315			temp_ipn = le64_to_cpu(le_tmp64);
  1316			/* BIP packet number should bigger than previous BIP packet */
  1317			if (temp_ipn <= pmlmeext->mgnt_80211w_IPN_rx)
  1318				goto BIP_exit;
  1319	
  1320			/* copy key index */
  1321			memcpy(&le_tmp, p + 2, 2);
  1322			keyid = le16_to_cpu(le_tmp);
  1323			if (keyid != padapter->securitypriv.dot11wBIPKeyid)
  1324				goto BIP_exit;
  1325	
  1326			/* clear the MIC field of MME to zero */
  1327			memset(p + 2 + len - 8, 0, 8);
  1328	
  1329			/* conscruct AAD, copy frame control field */
  1330			memcpy(BIP_AAD, &pwlanhdr->frame_control, 2);
  1331			ClearRetry(BIP_AAD);
  1332			ClearPwrMgt(BIP_AAD);
  1333			ClearMData(BIP_AAD);
  1334			/* conscruct AAD, copy address 1 to address 3 */
  1335			memcpy(BIP_AAD + 2, &pwlanhdr->addrs, sizeof(pwlanhdr->addrs));
  1336	
> 1337			int keyid = padapter->securitypriv.dot11wBIPKeyid;
  1338			u8 *bip_key = padapter->securitypriv.dot11wBIPKey[keyid].skey;
  1339	
  1340			if (omac1_aes_128(bip_key, BIP_AAD, ori_len, mic))
  1341				goto BIP_exit;
  1342	
  1343			/* MIC field should be last 8 bytes of packet (packet without FCS) */
  1344			if (!memcmp(mic, pframe + pattrib->pkt_len - 8, 8)) {
  1345				pmlmeext->mgnt_80211w_IPN_rx = temp_ipn;
  1346				res = _SUCCESS;
  1347			} else {
  1348			}
  1349	
  1350		} else {
  1351			res = RTW_RX_HANDLED;
  1352		}
  1353	BIP_exit:
  1354	
  1355		kfree(BIP_AAD);
  1356		return res;
  1357	}
  1358	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
