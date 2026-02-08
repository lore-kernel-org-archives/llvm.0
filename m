Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE241C3C1F;
	Sun,  8 Feb 2026 18:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770575778; cv=none; b=schjawdjQTBZ1zxWpIlWaeVAe2b/ikDb/us3A76++M0nrGa5mdaLx/qHc6ANNGOUPE60PGAUd9lV97qZuIEF60v+1kSEzRH2MB3Z6UNFgodd6S12mdzO2n9Lnxrl0eR7fE4nwadRA2sNQYWBaNauA6kUkNwYG2bBxQ9r1u8IC7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770575778; c=relaxed/simple;
	bh=W8KZyHGs21/B6lh/JVqh0DJK7X83q4/2RwtxVlpYLZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bnby3jLC0NITRAoOItQodCK0rIXILiugtwsXhMom/GVYDZi6q5I4+xQBzeh9ZDxpSOrFOmNM3RVOd1pRWvx8+0CLtrx87xg8D+QYhlVVk/C4K6wexCngH39RIo/dHx32ihTiLKHmKxcs93cZWRmidpmwJDB+r1YuG7YFQKDOXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFnjSN/r; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFnjSN/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770575777; x=1802111777;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W8KZyHGs21/B6lh/JVqh0DJK7X83q4/2RwtxVlpYLZw=;
  b=BFnjSN/rN2GU2MVxc9I+utf/KUtnR5Slgh9bhHQloj2rUVs8ool1+NbA
   AEh3OGivzWUQKfw3lX4rL32Sd0cDvjPfPBGLMzFFNHdR/CxnAOqSa0Blw
   KHIpypPu5PviCXF3EvUdfEqcb0Iqwo/36VhZllzeyCaOXh3Tc8cOgVszx
   vf1ny58Zp8GFDOJ/79w4NHh/414Iw6y2/GVxqq18MxhkUeWnb4a6Rez2P
   A2z6N029Fs8ewps3ajXwBfxDdTStjwIUWXqmv/n08esQtJFUChR6nv/L8
   xuQ2DKRac71+7H6s7+KJpFXmHjOC1/Vcrsw8ereBKdHNrTZGXvyzQlcq8
   Q==;
X-CSE-ConnectionGUID: Pwj/uI3IQkOHjWVNR4QQkQ==
X-CSE-MsgGUID: pGdt7CCxQYCeregVkNFrVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11695"; a="82434955"
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; 
   d="scan'208";a="82434955"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2026 10:36:16 -0800
X-CSE-ConnectionGUID: diqZtrUGTualKAE/DG1O9A==
X-CSE-MsgGUID: Ge7IOH7HRJelpKRRJOidDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,280,1763452800"; 
   d="scan'208";a="211431734"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2026 10:36:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vp9dk-00000000mMG-2Gjc;
	Sun, 08 Feb 2026 18:36:12 +0000
Date: Mon, 9 Feb 2026 02:35:20 +0800
From: kernel test robot <lkp@intel.com>
To: Bera =?iso-8859-1?B?Wfx6bPw=?= <b9788213@gmail.com>,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: refactor
 halbtc8723b1ant_CoexTableWithType() to remove duplication
Message-ID: <202602090207.A176hCPb-lkp@intel.com>
References: <aYiMi-X5r4aUEC32@BERA.localdomain>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYiMi-X5r4aUEC32@BERA.localdomain>

Hi Bera,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Bera-Y-zl/staging-rtl8723bs-refactor-halbtc8723b1ant_CoexTableWithType-to-remove-duplication/20260208-211800
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/aYiMi-X5r4aUEC32%40BERA.localdomain
patch subject: [PATCH] staging: rtl8723bs: refactor halbtc8723b1ant_CoexTableWithType() to remove duplication
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260209/202602090207.A176hCPb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602090207.A176hCPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602090207.A176hCPb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:700:9: warning: result of comparison of constant -1 with expression of type 'u8' (aka 'unsigned char') is always true [-Wtautological-constant-out-of-range-compare]
     700 |         if (-1 < type && type < 8)
         |             ~~ ^ ~~~~
   1 warning generated.


vim +700 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c

   682	
   683	static void halbtc8723b1ant_CoexTableWithType(
   684		struct btc_coexist *pBtCoexist, bool bForceExec, u8 type
   685	)
   686	{
   687		static const u32 table[8][2] = {
   688			{0x55555555, 0x55555555},
   689			{0x55555555, 0x5a5a5a5a},
   690			{0x5a5a5a5a, 0x5a5a5a5a},
   691			{0xaaaa5555, 0xaaaa5a5a},
   692			{0x55555555, 0xaaaa5a5a},
   693			{0x5a5a5a5a, 0xaaaa5a5a},
   694			{0x55555555, 0xaaaaaaaa},
   695			{0xaaaaaaaa, 0xaaaaaaaa}
   696		};
   697	
   698		pCoexSta->nCoexTableType = type;
   699	
 > 700		if (-1 < type && type < 8)
   701			halbtc8723b1ant_CoexTable(
   702				pBtCoexist, bForceExec, table[type][0], table[type][1], 0xffffff, 0x3
   703			);
   704	}
   705	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
