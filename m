Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9677E3090FD;
	Sat, 21 Feb 2026 01:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771637144; cv=none; b=oLI1SyZ7WDugEjGlIfBWsGu87G8mYc83nuKVkZf2it8+PXCYLcQzoLKWLwVIUcSYDCy5pZSMRZKa0RJxqNwqylNDIi4z8h1HA63BDMDI1DXc/FbGydQINjRPZpKQTclRXhtW8ng0EB3jL6/rgO6yNa3Lxw4EYMBqbEFEZUlh4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771637144; c=relaxed/simple;
	bh=VNO7bSe94E4iAwMvPPC6DF/o0jW6Va8cJdoPGHz0nRE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/vdzgMkVhoB/7OgnyY5MvnTFbgq79S6qwpxowHFJALF/rLjgz/xhkauiSEpLbQ5UCzuBaLC+wWsPVtvWlQqeMQErc/pFjpkNTT/lPqc2ohEQt8ctvpjaRg+LMCOTb2KMaXArLyfJuJDne0zku0l+p9Ura1ksRhoRhrHLpXzdTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RkEoNEMs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RkEoNEMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771637142; x=1803173142;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VNO7bSe94E4iAwMvPPC6DF/o0jW6Va8cJdoPGHz0nRE=;
  b=RkEoNEMsDfOwxec3LsT/291fDRowohZeITlE2XBHwoy2LHRn9yol85t8
   VqKpYl8E+5BjUTsIXzV1CoN/wql8gBIgZHFJnT6hNR+41uWRa6NP6LIMH
   qIKwmZd3MuNKO3yP7leXYuXTcBsANgl138D71H3CQU32d1cWVpDmBE0+n
   18lrJZ+hy2QbiGwYaKUYd2uat2DeIVQ6qs09W/uE4dfUYCq8VIiqAvoYY
   ca36QQk2SRPevvhnpEKD8G24SzG0kFVgHqBQ0uQGQCIaXnyfDMvbUCdD/
   vhhX1NFR2xXbfUFYI+mSjp10dskP68F70peXr1/s5aCH+LAZeYaW8KLLW
   w==;
X-CSE-ConnectionGUID: Ad60FXidRdayQmFB1ae6bg==
X-CSE-MsgGUID: DtWnklytQkS+N1uec4h3mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="84091167"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="84091167"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 17:25:41 -0800
X-CSE-ConnectionGUID: dZEVgxKBQu25CKsW8FRAQA==
X-CSE-MsgGUID: E9r7j119SJO4g6xM/6PyDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219542249"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Feb 2026 17:25:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtbkV-000000014cC-1izw;
	Sat, 21 Feb 2026 01:25:35 +0000
Date: Sat, 21 Feb 2026 09:25:32 +0800
From: kernel test robot <lkp@intel.com>
To: Priit Laes <plaes@plaes.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Priit Laes <plaes@plaes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <error27@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/11] staging: rtl8723bs: rtw_ieee80211: Reduce global
 symbols
Message-ID: <202602210910.tUaMjS3m-lkp@intel.com>
References: <20260220173104.2410217-1-plaes@plaes.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220173104.2410217-1-plaes@plaes.org>

Hi Priit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Priit-Laes/staging-rtl8723bs-Remove-unused-BIT32-BIT36-definitions/20260221-013719
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260220173104.2410217-1-plaes%40plaes.org
patch subject: [PATCH 11/11] staging: rtl8723bs: rtw_ieee80211: Reduce global symbols
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260221/202602210910.tUaMjS3m-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260221/202602210910.tUaMjS3m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602210910.tUaMjS3m-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/core/rtw_ieee80211.c:19:17: warning: unused variable 'WPA_CIPHER_SUITE_WRAP' [-Wunused-const-variable]
      19 | static const u8 WPA_CIPHER_SUITE_WRAP[] = { 0x00, 0x50, 0xf2, 3 };
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/rtl8723bs/core/rtw_ieee80211.c:27:17: warning: unused variable 'RSN_CIPHER_SUITE_WRAP' [-Wunused-const-variable]
      27 | static const u8 RSN_CIPHER_SUITE_WRAP[] = { 0x00, 0x0f, 0xac, 3 };
         |                 ^~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/WPA_CIPHER_SUITE_WRAP +19 drivers/staging/rtl8723bs/core/rtw_ieee80211.c

    14	
    15	#define WPA_SELECTOR_LEN 4
    16	static const u8 WPA_CIPHER_SUITE_NONE[] = { 0x00, 0x50, 0xf2, 0 };
    17	static const u8 WPA_CIPHER_SUITE_WEP40[] = { 0x00, 0x50, 0xf2, 1 };
    18	static const u8 WPA_CIPHER_SUITE_TKIP[] = { 0x00, 0x50, 0xf2, 2 };
  > 19	static const u8 WPA_CIPHER_SUITE_WRAP[] = { 0x00, 0x50, 0xf2, 3 };
    20	static const u8 WPA_CIPHER_SUITE_CCMP[] = { 0x00, 0x50, 0xf2, 4 };
    21	static const u8 WPA_CIPHER_SUITE_WEP104[] = { 0x00, 0x50, 0xf2, 5 };
    22	
    23	#define RSN_SELECTOR_LEN 4
    24	static const u8 RSN_CIPHER_SUITE_NONE[] = { 0x00, 0x0f, 0xac, 0 };
    25	static const u8 RSN_CIPHER_SUITE_WEP40[] = { 0x00, 0x0f, 0xac, 1 };
    26	static const u8 RSN_CIPHER_SUITE_TKIP[] = { 0x00, 0x0f, 0xac, 2 };
  > 27	static const u8 RSN_CIPHER_SUITE_WRAP[] = { 0x00, 0x0f, 0xac, 3 };
    28	static const u8 RSN_CIPHER_SUITE_CCMP[] = { 0x00, 0x0f, 0xac, 4 };
    29	static const u8 RSN_CIPHER_SUITE_WEP104[] = { 0x00, 0x0f, 0xac, 5 };
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
