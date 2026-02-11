Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320BD1624D5;
	Wed, 11 Feb 2026 05:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770786317; cv=none; b=VkK0kQRgzovipABLp6tkBniF4Q/XbDWK8B7rEXymCp5Xp9Sosdd8Snt9FayEDXk+OiO1jukNlqJOgUzWn8AZ8Y2xTBj//pFdjlONUKkwGYn2tDIZ27IBohaD/fIMBah7FUFdG34D9JZibErvINel81/oJyRpjBOO6uUaLTlEihU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770786317; c=relaxed/simple;
	bh=HAXCP0FLElP2zKVJaG2Nwv9y9/MJLxwcppNgilWMcEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egZQeIfd8P7BJASlP+LB5h17c+HLeFlE7UCqb/KFurYUeMRp3XX4osLHB5R1GsBVCOlARwv8BEOgYOYVNFR+Ve+CLXeIkqPV1k4AYnFFXps3+ENJiMYiTizj56wak8bA332JVgK730Vdf90e8Ttko2S3VkhgmxNiYVPcNzeKGko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmpCgMF5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmpCgMF5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770786315; x=1802322315;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HAXCP0FLElP2zKVJaG2Nwv9y9/MJLxwcppNgilWMcEM=;
  b=cmpCgMF5gE7MD6BnlGAGesRszRjhaFW4xsMZS2o4ZWaMnfzT+dhU1pDv
   aCUA47Kp2uhZpk435nE1OVIyJhCGjYwMK5G/+4SIdOfwRKEwi0zpOFo4i
   8FdnddZ1b7EQhUIFmkaFK6y8o6Z6YwaUAq97qtVV1Dsph+6cqwRoyMDe1
   zBw7YcSLdPn6D5AqaalZP6dvC8hvqxH4VbyvRlcvMOvRQsdYSrhOowzuS
   KJqNp+imYUxX8pAdkJX267Pxixa74mbgHa6Ua35plgu4jM+rezQO8K9HU
   oPjQDxop1LCy3wBSu+nOT+7yk97RYw7+DkbaSytvHEF3o6B0R7IptR6Hf
   Q==;
X-CSE-ConnectionGUID: SI6zKn2SRPKYvgtOtpJaXw==
X-CSE-MsgGUID: AvPkLzKZRP2WElWvJ5v+rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="75773232"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75773232"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 21:05:14 -0800
X-CSE-ConnectionGUID: NCSX8JFkR8qd26m1CUrKXw==
X-CSE-MsgGUID: f5Pnvmo/SlqH3a69tq5NDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211185555"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2026 21:05:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq2PW-00000000pge-1lKH;
	Wed, 11 Feb 2026 05:05:10 +0000
Date: Wed, 11 Feb 2026 13:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: markatbritain@gmail.com, gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	straube.linux@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Wu <markatbritain@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove NDIS_802_11 types and cleanup
 style
Message-ID: <202602111248.03HAaYiv-lkp@intel.com>
References: <20260210221556.73872-1-markatbritain@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210221556.73872-1-markatbritain@gmail.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/markatbritain-gmail-com/staging-rtl8723bs-remove-NDIS_802_11-types-and-cleanup-style/20260211-062107
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260210221556.73872-1-markatbritain%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: remove NDIS_802_11 types and cleanup style
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260211/202602111248.03HAaYiv-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602111248.03HAaYiv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602111248.03HAaYiv-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:787:29: error: incompatible pointer types initializing 'struct ieee_crypt_arg *' with an expression of type 'struct (unnamed struct at drivers/staging/rtl8723bs/include/ieee80211.h:181:3) *' [-Werror,-Wincompatible-pointer-types]
     787 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                                ^       ~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:788:25: error: incomplete definition of type 'struct ieee_crypt_arg'
     788 |                                         u32 len = min(crypt->key_len, 16U);
         |                                                       ~~~~~^
   include/linux/minmax.h:105:38: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                                            ^
   include/linux/minmax.h:98:25: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                ^
   include/linux/minmax.h:92:13: note: expanded from macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:787:13: note: forward declaration of 'struct ieee_crypt_arg'
     787 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:791:18: error: incomplete definition of type 'struct ieee_crypt_arg'
     791 |                                                crypt->key, len);
         |                                                ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:787:13: note: forward declaration of 'struct ieee_crypt_arg'
     787 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:29: error: incompatible pointer types initializing 'struct ieee_crypt_arg *' with an expression of type 'struct (unnamed struct at drivers/staging/rtl8723bs/include/ieee80211.h:181:3) *' [-Werror,-Wincompatible-pointer-types]
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                                ^       ~~~~~~~~~~~~~~~
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:804:25: error: incomplete definition of type 'struct ieee_crypt_arg'
     804 |                                         u32 len = min(crypt->key_len, 16U);
         |                                                       ~~~~~^
   include/linux/minmax.h:105:38: note: expanded from macro 'min'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                                            ^
   include/linux/minmax.h:98:25: note: expanded from macro '__careful_cmp'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                ^
   include/linux/minmax.h:92:13: note: expanded from macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                    ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:806:22: error: incomplete definition of type 'struct ieee_crypt_arg'
     806 |                                         if (strcmp(crypt->alg, "TKIP") == 0 ||
         |                                                    ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:807:22: error: incomplete definition of type 'struct ieee_crypt_arg'
     807 |                                             strcmp(crypt->alg, "CCMP") == 0) {
         |                                                    ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:808:42: error: incomplete definition of type 'struct ieee_crypt_arg'
     808 |                                                 memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
         |                                                                               ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:809:19: error: incomplete definition of type 'struct ieee_crypt_arg'
     809 |                                                        crypt->key, len);
         |                                                        ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:46: error: incomplete definition of type 'struct ieee_crypt_arg'
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                                                   ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
>> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:811:20: error: no member named 'dot18021XGrptxmickey' in 'struct security_priv'; did you mean 'dot118021XGrptxmickey'?
     811 |                                                 memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
         |                                                              ^~~~~~~~~~~~~~~~~~~~
         |                                                              dot118021XGrptxmickey
   drivers/staging/rtl8723bs/include/rtw_security.h:106:16: note: 'dot118021XGrptxmickey' declared here
     106 |         union Keytype   dot118021XGrptxmickey[BIP_MAX_KEYID + 1];
         |                         ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:812:20: error: incomplete definition of type 'struct ieee_crypt_arg'
     812 |                                                        &crypt->key[16], 8);
         |                                                         ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:814:47: error: incomplete definition of type 'struct ieee_crypt_arg'
     814 |                                                 memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
         |                                                                                    ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:815:20: error: incomplete definition of type 'struct ieee_crypt_arg'
     815 |                                                        &crypt->key[24], 8);
         |                                                         ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:818:39: error: incomplete definition of type 'struct ieee_crypt_arg'
     818 |                                                 psec->dot118021XGrpKeyid = crypt->idx;
         |                                                                            ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:819:40: error: incomplete definition of type 'struct ieee_crypt_arg'
     819 |                                                 rtw_set_key(padapter, psec, crypt->idx, 1, true);
         |                                                                             ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:820:29: error: incomplete definition of type 'struct ieee_crypt_arg'
     820 |                                         } else if (strcmp(crypt->alg, "BIP") == 0) {
         |                                                           ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:822:38: error: incomplete definition of type 'struct ieee_crypt_arg'
     822 |                                                 memcpy(psec->dot11wBIPKey[crypt->idx].skey,
         |                                                                           ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:823:19: error: incomplete definition of type 'struct ieee_crypt_arg'
     823 |                                                        crypt->key, len);
         |                                                        ~~~~~^
   drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:803:13: note: forward declaration of 'struct ieee_crypt_arg'
     803 |                                         struct ieee_crypt_arg *crypt = &param->u.crypt;
         |                                                ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +787 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c

   697	
   698	static int rtw_cfg80211_set_encryption(struct net_device *dev, struct ieee_param *param, u32 param_len)
   699	{
   700		int ret = 0;
   701		u8 max_idx;
   702		u32 wep_key_idx, wep_key_len;
   703		struct adapter *padapter = rtw_netdev_priv(dev);
   704		struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
   705		struct security_priv *psecuritypriv = &padapter->securitypriv;
   706	
   707		param->u.crypt.err = 0;
   708		param->u.crypt.alg[IEEE_CRYPT_ALG_NAME_LEN - 1] = '\0';
   709	
   710		if (param_len < (u32)((u8 *)param->u.crypt.key - (u8 *)param) + param->u.crypt.key_len) {
   711			ret =  -EINVAL;
   712			goto exit;
   713		}
   714	
   715		if (param->sta_addr[0] != 0xff || param->sta_addr[1] != 0xff ||
   716		    param->sta_addr[2] != 0xff || param->sta_addr[3] != 0xff ||
   717		    param->sta_addr[4] != 0xff || param->sta_addr[5] != 0xff) {
   718			ret = -EINVAL;
   719			goto exit;
   720		}
   721	
   722		if (strcmp(param->u.crypt.alg, "WEP") == 0)
   723			max_idx = WEP_KEYS - 1;
   724		else
   725			max_idx = BIP_MAX_KEYID;
   726	
   727		if (param->u.crypt.idx > max_idx) {
   728			netdev_err(dev, "Error crypt.idx %d > %d\n", param->u.crypt.idx, max_idx);
   729			ret = -EINVAL;
   730			goto exit;
   731		}
   732	
   733		if (strcmp(param->u.crypt.alg, "WEP") == 0) {
   734			wep_key_idx = param->u.crypt.idx;
   735			wep_key_len = param->u.crypt.key_len;
   736	
   737			if (wep_key_len <= 0) {
   738				ret = -EINVAL;
   739				goto exit;
   740			}
   741	
   742			if (psecuritypriv->bWepDefaultKeyIdxSet == 0) {
   743				/* wep default key has not been set, so use this key index as default key. */
   744	
   745				wep_key_len = wep_key_len <= 5 ? 5 : 13;
   746	
   747				psecuritypriv->ndisencryptstatus = NDIS_802_11_ENCRYPTION_ENABLED;
   748				psecuritypriv->dot11PrivacyAlgrthm = _WEP40_;
   749				psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
   750	
   751				if (wep_key_len == 13) {
   752					psecuritypriv->dot11PrivacyAlgrthm = _WEP104_;
   753					psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
   754				}
   755	
   756				psecuritypriv->dot11PrivacyKeyIndex = wep_key_idx;
   757			}
   758	
   759			memcpy(&(psecuritypriv->dot11DefKey[wep_key_idx].skey[0]), param->u.crypt.key, wep_key_len);
   760	
   761			psecuritypriv->dot11DefKeylen[wep_key_idx] = wep_key_len;
   762	
   763			rtw_set_key(padapter, psecuritypriv, wep_key_idx, 0, true);
   764	
   765			goto exit;
   766		}
   767	
   768		if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) { /*  802_1x */
   769			struct sta_info *psta, *pbcmc_sta;
   770			struct sta_priv *pstapriv = &padapter->stapriv;
   771	
   772			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE | WIFI_MP_STATE) == true) { /* sta mode */
   773				psta = rtw_get_stainfo(pstapriv, get_bssid(pmlmepriv));
   774				if (psta) {
   775					/* Jeff: don't disable ieee8021x_blocked while clearing key */
   776					if (strcmp(param->u.crypt.alg, "none") != 0)
   777						psta->ieee8021x_blocked = false;
   778	
   779					if ((padapter->securitypriv.ndisencryptstatus ==
   780					     NDIS_802_11_ENCRYPTION_2_ENABLED) ||
   781					    (padapter->securitypriv.ndisencryptstatus ==
   782					     NDIS_802_11_ENCRYPTION_3_ENABLED)) {
   783						psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
   784					}
   785	
   786					if (param->u.crypt.set_tx == 1) { /* pairwise key */
 > 787						struct ieee_crypt_arg *crypt = &param->u.crypt;
 > 788						u32 len = min(crypt->key_len, 16U);
   789	
   790						memcpy(psta->dot118021x_UncstKey.skey,
   791						       crypt->key, len);
   792						if (strcmp(param->u.crypt.alg, "TKIP") == 0) { /* set mic key */
   793							memcpy(psta->dot11tkiptxmickey.skey, &(param->u.crypt.key[16]), 8);
   794							memcpy(psta->dot11tkiprxmickey.skey, &(param->u.crypt.key[24]), 8);
   795	
   796							padapter->securitypriv.busetkipkey = false;
   797							/* _set_timer(&padapter->securitypriv.tkip_timer, 50); */
   798						}
   799	
   800						rtw_setstakey_cmd(padapter, psta, true, true);
   801					} else { /* group key */
   802						struct security_priv *psec = &padapter->securitypriv;
   803						struct ieee_crypt_arg *crypt = &param->u.crypt;
   804						u32 len = min(crypt->key_len, 16U);
   805	
   806						if (strcmp(crypt->alg, "TKIP") == 0 ||
   807						    strcmp(crypt->alg, "CCMP") == 0) {
   808							memcpy(psec->dot118021XGrpKey[crypt->idx].skey,
   809							       crypt->key, len);
   810	
 > 811							memcpy(psec->dot18021XGrptxmickey[crypt->idx].skey,
   812							       &crypt->key[16], 8);
   813	
   814							memcpy(psec->dot118021XGrprxmickey[crypt->idx].skey,
   815							       &crypt->key[24], 8);
   816	
   817							psec->binstallGrpkey = true;
   818							psec->dot118021XGrpKeyid = crypt->idx;
   819							rtw_set_key(padapter, psec, crypt->idx, 1, true);
   820						} else if (strcmp(crypt->alg, "BIP") == 0) {
   821							/* save the IGTK key, length 16 bytes */
   822							memcpy(psec->dot11wBIPKey[crypt->idx].skey,
   823							       crypt->key, len);
   824							psec->dot11wBIPKeyid = crypt->idx;
   825							psec->binstallBIPkey = true;
   826						}
   827					}
   828				}
   829	
   830				pbcmc_sta = rtw_get_bcmc_stainfo(padapter);
   831				if (pbcmc_sta) {
   832					/* Jeff: don't disable ieee8021x_blocked while clearing key */
   833					if (strcmp(param->u.crypt.alg, "none") != 0)
   834						pbcmc_sta->ieee8021x_blocked = false;
   835	
   836					if ((padapter->securitypriv.ndisencryptstatus ==
   837					     NDIS_802_11_ENCRYPTION_2_ENABLED) ||
   838					    (padapter->securitypriv.ndisencryptstatus ==
   839					     NDIS_802_11_ENCRYPTION_3_ENABLED)) {
   840						pbcmc_sta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
   841					}
   842				}
   843			} else if (check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) { /* adhoc mode */
   844			}
   845		}
   846	
   847	exit:
   848	
   849		return ret;
   850	}
   851	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
