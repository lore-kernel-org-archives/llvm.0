Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BA43D903E;
	Wed, 18 Mar 2026 13:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841747; cv=none; b=KhOUQRQJt75xc7Ywt2BUKfJuORwF66Xeh9Sm2FVK9QOUKKCNckTuT2BakTwVp96cgotSMfClkgeSs9y9cZhSGRDMeKS5oLXQYW1cjWFZO2AJV0PYU/Hc1mx5TRPOl/FtN0lmBu2WKqCk5DtSEL13KHznPxkCHFUFnbnavZ79jxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841747; c=relaxed/simple;
	bh=zy77gScoCt/IITvdb7WU8KaieiMi/byfiAx0hJRXfuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mWLEBtWlgrbgKmpx1ZORE+KOzU+dxwrdfWPsjpn84NUtfbec3RRQccelL864x0ftYuRH711LiCc3YJz9PZwP7RRGoPtSb5lyFVx9S9DE55SvOKLD1Jhujt9mRnyksVAfyFy2u0VCT2nf/6+AX+MttbHFuRm/SaDttYkcVF98ATo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZjhqakTV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZjhqakTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773841745; x=1805377745;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zy77gScoCt/IITvdb7WU8KaieiMi/byfiAx0hJRXfuM=;
  b=ZjhqakTVxDfyvuaFoC2YIHAf/KT2OmQFAeXgFQS+ZY2sYPxrwA5YU5GF
   iwLYzvIzv+I+LL3ZA/UrP7uWOz/9NinK5K3OzPqv5AtdqYEwOVGM8VwwP
   Uu7TP1N4L87wHa9Tg48JYSZ4V3YiOEJZ2ECXitbsuuc4exA4vN16kb1y2
   gFMErqNFTy9CGsxkSa2vBzSmeLJr0jFDFkkDjWjWkL4kDdHWKXSqhiB7J
   10WIgVt5K5Tw89OMRgpVpxXZyByt/tPmPsHY4IyyDf/PkvIGqknk7+dPN
   XCBvjxVhXiFZkMBVLyIrmuD23XOSqBOh31+geB2cIO1bkyWklLyTIOitk
   A==;
X-CSE-ConnectionGUID: KifIvIj6SdqvRVyi44+3Kw==
X-CSE-MsgGUID: /BQhHNCqQJuythkUfbtWhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85590350"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="85590350"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 06:49:03 -0700
X-CSE-ConnectionGUID: ck6+dHBRTRykZ20FKjK4gQ==
X-CSE-MsgGUID: n+yXV0tsSaqMIjF4t32nmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="226763029"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 18 Mar 2026 06:49:01 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2rGc-000000002y5-3ecu;
	Wed, 18 Mar 2026 13:48:58 +0000
Date: Wed, 18 Mar 2026 21:48:16 +0800
From: kernel test robot <lkp@intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>,
	gregkh@linuxfoundation.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	straube.linux@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary braces in single
 statement blocks
Message-ID: <202603182154.qP1dKSZf-lkp@intel.com>
References: <20260317203715.7430-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317203715.7430-1-rayfraytech@gmail.com>

Hi Oskar,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Oskar-Ray-Frayssinet/staging-rtl8723bs-remove-unnecessary-braces-in-single-statement-blocks/20260318-121311
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260317203715.7430-1-rayfraytech%40gmail.com
patch subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in single statement blocks
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603182154.qP1dKSZf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 4abb927bacf37f18f6359a41639a6d1b3bffffb5)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182154.qP1dKSZf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182154.qP1dKSZf-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:131:4: error: expected expression
     131 |                         else
         |                         ^
>> drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:153:1: error: function definition is not allowed here
     153 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:171:1: error: function definition is not allowed here
     171 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:182:1: error: function definition is not allowed here
     182 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:213:1: error: function definition is not allowed here
     213 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:277:1: error: function definition is not allowed here
     277 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:400:1: error: function definition is not allowed here
     400 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:413:1: error: function definition is not allowed here
     413 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:424:1: error: function definition is not allowed here
     424 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:439:1: error: function definition is not allowed here
     439 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:456:1: error: function definition is not allowed here
     456 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:471:1: error: function definition is not allowed here
     471 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:486:1: error: function definition is not allowed here
     486 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:505:1: error: function definition is not allowed here
     505 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:519:1: error: function definition is not allowed here
     519 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:528:1: error: function definition is not allowed here
     528 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:542:1: error: function definition is not allowed here
     542 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:561:1: error: function definition is not allowed here
     561 | {
         | ^
   drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c:615:1: error: function definition is not allowed here
     615 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +131 drivers/staging/rtl8723bs/hal/HalBtc8723b2Ant.c

    82	
    83	static u8 halbtc8723b2ant_WifiRssiState(
    84		struct btc_coexist *pBtCoexist,
    85		u8 index,
    86		u8 levelNum,
    87		u8 rssiThresh,
    88		u8 rssiThresh1
    89	)
    90	{
    91		s32 wifiRssi = 0;
    92		u8 wifiRssiState = pCoexSta->preWifiRssiState[index];
    93	
    94		pBtCoexist->fBtcGet(pBtCoexist, BTC_GET_S4_WIFI_RSSI, &wifiRssi);
    95	
    96		if (levelNum == 2) {
    97			if (
    98				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
    99				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
   100			) {
   101				if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
   102					wifiRssiState = BTC_RSSI_STATE_HIGH;
   103				else
   104					wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
   105			} else {
   106				if (wifiRssi < rssiThresh)
   107					wifiRssiState = BTC_RSSI_STATE_LOW;
   108				else
   109					wifiRssiState = BTC_RSSI_STATE_STAY_HIGH;
   110			}
   111		} else if (levelNum == 3) {
   112			if (rssiThresh > rssiThresh1)
   113				return pCoexSta->preWifiRssiState[index];
   114	
   115			if (
   116				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_LOW) ||
   117				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_LOW)
   118			) {
   119				if (wifiRssi >= (rssiThresh + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
   120					wifiRssiState = BTC_RSSI_STATE_MEDIUM;
   121				else
   122					wifiRssiState = BTC_RSSI_STATE_STAY_LOW;
   123			} else if (
   124				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_MEDIUM) ||
   125				(pCoexSta->preWifiRssiState[index] == BTC_RSSI_STATE_STAY_MEDIUM)
   126			) {
   127				if (wifiRssi >= (rssiThresh1 + BTC_RSSI_COEX_THRESH_TOL_8723B_2ANT))
   128					wifiRssiState = BTC_RSSI_STATE_HIGH;
   129				else if (wifiRssi < rssiThresh) {
   130					wifiRssiState = BTC_RSSI_STATE_LOW;
 > 131				else
   132					wifiRssiState = BTC_RSSI_STATE_STAY_MEDIUM;
   133			} else {
   134				if (wifiRssi < rssiThresh1)
   135					wifiRssiState = BTC_RSSI_STATE_MEDIUM;
   136				else
   137					wifiRssiState = BTC_RSSI_STATE_STAY_HIGH;
   138			}
   139		}
   140	
   141		pCoexSta->preWifiRssiState[index] = wifiRssiState;
   142	
   143		return wifiRssiState;
   144	}
   145	
   146	static void halbtc8723b2ant_LimitedRx(
   147		struct btc_coexist *pBtCoexist,
   148		bool bForceExec,
   149		bool bRejApAggPkt,
   150		bool bBtCtrlAggBufSize,
   151		u8 aggBufSize
   152	)
 > 153	{
   154		bool bRejectRxAgg = bRejApAggPkt;
   155		bool bBtCtrlRxAggSize = bBtCtrlAggBufSize;
   156		u8 rxAggSize = aggBufSize;
   157	
   158		/*  */
   159		/* 	Rx Aggregation related setting */
   160		/*  */
   161		pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_TO_REJ_AP_AGG_PKT, &bRejectRxAgg);
   162		/*  decide BT control aggregation buf size or not */
   163		pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_BL_BT_CTRL_AGG_SIZE, &bBtCtrlRxAggSize);
   164		/*  aggregation buf size, only work when BT control Rx aggregation size. */
   165		pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_U1_AGG_BUF_SIZE, &rxAggSize);
   166		/*  real update aggregation setting */
   167		pBtCoexist->fBtcSet(pBtCoexist, BTC_SET_ACT_AGGREGATE_CTRL, NULL);
   168	}
   169	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
