Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD2F4C7C;
	Wed, 25 Dec 2024 00:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735088258; cv=none; b=EnFnexLqCSFZKsCVUnP9Uth0QXlW+DEOkndsHk0Hfx+1/3GRs2VUjRxLj9K/X0z6J4N4OJHi69CJBDYXacr0WG47SqIoyf4a1/z4in3TPlg6BvpsH2HIPszT5iDnAKrBUdZcivhzewnL6GgzCK4ZAOxHa3rkxKlSyrXUb4hYih0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735088258; c=relaxed/simple;
	bh=docmcElX7OJY2AQrJf7YZ+sI6dPXVeTzFRoRNsKtrhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVjQEhh+3QB4GTvIw15kBwdZ8A2mRiDByoFHM1s3z2+bsE+4zbM5vq6Cv8zxznwmR86hDC4Ur+zgH7WUJWGzN43RyWppwDIOQ7kJBlMNdrSBivyvgLAANLKGbROSUmAMXc2eBh7ul0QBFNfYGgsZgqbuQsrLQQFn6qRB0i7Abw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzQEWu7V; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzQEWu7V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735088257; x=1766624257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=docmcElX7OJY2AQrJf7YZ+sI6dPXVeTzFRoRNsKtrhA=;
  b=VzQEWu7VTcuuqfXq0PjGHTHSVRmnyxPN/E2PSbmoe1dSoXR2qmBR01Va
   gRPFwQSRRRj1er7wfeq4hrKXX0NcJMe6gWVSCy0tuIYY5TfV6POODTzm9
   J3aIoXoQpITpLQ0dvr1VHyfufUIJ8dG+iKw4+arfYpawE90IBdpqtpI63
   jKlr92ZZ8EFyyvfRhTwxyNNVw/Pgqt+Js8PmlaDiit2PGM7OfofJ7RRwB
   wGmGIhHZr7863M5l2SQjOrYF4Wqp9jUvBKq5BqS7pwXwxzCMa2ScN41Ak
   OXxCOZeworU/gG0MB38u48k8klCcyJRN9tLfAiedWteuwR+3+wp7Q7jMI
   g==;
X-CSE-ConnectionGUID: hDxSysOaSBeHEk6YFfhbcA==
X-CSE-MsgGUID: 06bu7kUhQMeMKHtO1QNixA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="52952810"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="52952810"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 16:57:36 -0800
X-CSE-ConnectionGUID: tuT1MiXYT0a0SRbO05zssQ==
X-CSE-MsgGUID: Qvu3mIPWTXuljhD8l1Fdzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="104455294"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 Dec 2024 16:57:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQFiM-0001ZH-2L;
	Wed, 25 Dec 2024 00:57:30 +0000
Date: Wed, 25 Dec 2024 08:56:44 +0800
From: kernel test robot <lkp@intel.com>
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	evepolonium@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Meir Elisha <meir6264@gmail.com>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Dan Carpenter <error27@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix network selection and A-MPDU
 reordering in rtw_mlme.c
Message-ID: <202412250814.36DjhClh-lkp@intel.com>
References: <20241224072754.2352-1-evepolonium@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224072754.2352-1-evepolonium@gmail.com>

Hi Atharva,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Atharva-Tiwari/staging-rtl8723bs-fix-network-selection-and-A-MPDU-reordering-in-rtw_mlme-c/20241224-152918
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20241224072754.2352-1-evepolonium%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: fix network selection and A-MPDU reordering in rtw_mlme.c
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241225/202412250814.36DjhClh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250814.36DjhClh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250814.36DjhClh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/core/rtw_mlme.c:1005:7: error: call to undeclared function 'rtw_check_ap_supports_ampdu'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1005 |                 if (rtw_check_ap_supports_ampdu(pnetwork)) {
         |                     ^
   1 error generated.


vim +/rtw_check_ap_supports_ampdu +1005 drivers/staging/rtl8723bs/core/rtw_mlme.c

   946	
   947	static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, struct wlan_network *pnetwork)
   948	{
   949		int i;
   950		struct sta_info *bmc_sta, *psta = NULL;
   951		struct recv_reorder_ctrl *preorder_ctrl;
   952		struct sta_priv *pstapriv = &padapter->stapriv;
   953		struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
   954	
   955		psta = rtw_get_stainfo(pstapriv, pnetwork->network.mac_address);
   956		if (!psta)
   957			psta = rtw_alloc_stainfo(pstapriv, pnetwork->network.mac_address);
   958	
   959		if (psta) { /* update ptarget_sta */
   960	
   961			psta->aid  = pnetwork->join_res;
   962	
   963			update_sta_info(padapter, psta);
   964	
   965			/* update station supportRate */
   966			psta->bssratelen = rtw_get_rateset_len(pnetwork->network.supported_rates);
   967			memcpy(psta->bssrateset, pnetwork->network.supported_rates, psta->bssratelen);
   968			rtw_hal_update_sta_rate_mask(padapter, psta);
   969	
   970			psta->wireless_mode = pmlmeext->cur_wireless_mode;
   971			psta->raid = networktype_to_raid_ex(padapter, psta);
   972	
   973			/* sta mode */
   974			rtw_hal_set_odm_var(padapter, HAL_ODM_STA_INFO, psta, true);
   975	
   976			/* security related */
   977			if (padapter->securitypriv.dot11AuthAlgrthm == dot11AuthAlgrthm_8021X) {
   978				padapter->securitypriv.binstallGrpkey = false;
   979				padapter->securitypriv.busetkipkey = false;
   980				padapter->securitypriv.bgrpkey_handshake = false;
   981	
   982				psta->ieee8021x_blocked = true;
   983				psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
   984	
   985				memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
   986	
   987				memset((u8 *)&psta->dot11tkiprxmickey, 0, sizeof(union Keytype));
   988				memset((u8 *)&psta->dot11tkiptxmickey, 0, sizeof(union Keytype));
   989	
   990				memset((u8 *)&psta->dot11txpn, 0, sizeof(union pn48));
   991				psta->dot11txpn.val = psta->dot11txpn.val + 1;
   992				memset((u8 *)&psta->dot11wtxpn, 0, sizeof(union pn48));
   993				memset((u8 *)&psta->dot11rxpn, 0, sizeof(union pn48));
   994			}
   995	
   996			/* When doing the WPS, the wps_ie_len won't equal to 0 */
   997			/* And the Wi-Fi driver shouldn't allow the data packet to be transmitted. */
   998			if (padapter->securitypriv.wps_ie_len != 0) {
   999				psta->ieee8021x_blocked = true;
  1000				padapter->securitypriv.wps_ie_len = 0;
  1001			}
  1002	
  1003			/* for A-MPDU Rx reordering buffer control for bmc_sta & sta_info */
  1004			/* if A-MPDU Rx is enabled, resetting  rx_ordering_ctrl wstart_b(indicate_seq) to default value = 0xffff */
> 1005			if (rtw_check_ap_supports_ampdu(pnetwork)) {
  1006				for (i = 0; i < 16 ; i++) {
  1007					preorder_ctrl = &psta->recvreorder_ctrl[i];
  1008					preorder_ctrl->enable = true; /* Enable A-MPDU reordering */
  1009					preorder_ctrl->indicate_seq = 0; /* Starting sequence number */
  1010					preorder_ctrl->wend_b = 0xffff;
  1011					preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
  1012				}
  1013			} else {
  1014				for (i = 0; i < 16; i++) {
  1015					preorder_ctrl = &psta->recvreorder_ctrl[i];
  1016					preorder_ctrl->enable = false;
  1017					preorder_ctrl->indicate_seq = 0xffff;
  1018					preorder_ctrl->wend_b = 0xffff;
  1019					preorder_ctrl->wsize_b = 64;  /* max_ampdu_sz; adjust as needed */
  1020				}
  1021			}
  1022			bmc_sta = rtw_get_bcmc_stainfo(padapter);
  1023			if (bmc_sta) {
  1024				for (i = 0; i < 16 ; i++) {
  1025					preorder_ctrl = &bmc_sta->recvreorder_ctrl[i];
  1026					preorder_ctrl->enable = false;
  1027					preorder_ctrl->indicate_seq = 0xffff;
  1028					preorder_ctrl->wend_b = 0xffff;
  1029					preorder_ctrl->wsize_b = 64;/* max_ampdu_sz;ex. 32(kbytes) -> wsize_b =32 */
  1030				}
  1031			}
  1032		}
  1033	
  1034		return psta;
  1035	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
