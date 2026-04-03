Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB6E37700B;
	Fri,  3 Apr 2026 08:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206084; cv=none; b=aLkjN2mRBbRsD7VAJBTbC3h1xeQRmIfHWphFyVauH1UQeTlTX/fmRoAZpHLJSCdRnJ3CYoKbn131N8cgJfj5Uidv3GtFGN7q/rEaDr1HEhl/tTgiuB9vZR2WLRXMIje9M/Be3U7b/EBTz82ErkxvIu2Xl0EhnaEZanENOOYGoL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206084; c=relaxed/simple;
	bh=MoqdCPsXBaaps9JSCVsm43vX+JTtp4cFvBl7ADvTH1I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nvgjWAKEunhPGQB+Pz4upreWzltJH0Vi3BsRKakbV5/axfLDFUil10YOxpg7nKCB/5vyVbXJL6UbfoRgnldMo5fuGuWMwOW1OuHFfnaVibdw0Fp/R6fFlIhQUQNww+WNpmEAiDXdNfxiMDAcF2pFYJVk+gkwZGjxBroqpolQAhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YId7qrxG; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YId7qrxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775206083; x=1806742083;
  h=date:from:to:cc:subject:message-id;
  bh=MoqdCPsXBaaps9JSCVsm43vX+JTtp4cFvBl7ADvTH1I=;
  b=YId7qrxGubnTtRBHqU1kvuFAc25HwQAfeGWjYLemcHCIoCp7GlZYVx3t
   JDcuVbQ4Df/E7v3fI1Gq+GIf9ZkyYKg3YViYP2bMSpm4Sv6GgIm4mn+Lv
   zXr3owoMorXT4VkqKrPfohh7DiZb1YziR7mgLVss9nXydt/mqd3Cs0lag
   D2xDyrNJW6Mr4h8hwbuK7Ro5byyPxzAqthkNSBT8jN03z+hXJNjzocNxB
   ALhhM0m5PCo+1ho5Cn1cmozaTJa1xUt9DWfzmxJtBK5v0EqFcDcMgrr0a
   qDKJUuwYgkG5m0B0sEN2flewAPFeJXvteIg9xsN/cGdQkr5aBGYfGdWNr
   A==;
X-CSE-ConnectionGUID: qx1S9EAyR9WZmclhMSuDNA==
X-CSE-MsgGUID: PfafR1F1RKybGMCYPdkiUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="87658607"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="87658607"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:48:01 -0700
X-CSE-ConnectionGUID: DhsmPBc4TdmzcELcuKZPpQ==
X-CSE-MsgGUID: ShuRIog7ScqcZdiWQK8Ofw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="232014706"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Apr 2026 01:47:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aC5-0000000017Z-0yq7;
	Fri, 03 Apr 2026 08:47:57 +0000
Date: Fri, 03 Apr 2026 16:47:16 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 9437/11535]
 drivers/net/ethernet/cadence/macb_main.c:5710:12: error: use of undeclared
 identifier 'at91_default_usrio'
Message-ID: <202604031525.EQbObBW3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd0f139e5fc11182777b81cefc3893ea508544ec
commit: a17871778ee28e4df054521e966e9f37c61f541b [9437/11535] net: macb: rename macb_default_usrio to at91_default_usrio as not all platforms have mii mode control in usrio
config: x86_64-randconfig-075-20260403 (https://download.01.org/0day-ci/archive/20260403/202604031525.EQbObBW3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031525.EQbObBW3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604031525.EQbObBW3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/cadence/macb_main.c:5710:12: error: use of undeclared identifier 'at91_default_usrio'
    5710 |         .usrio = &at91_default_usrio,
         |                   ^
   1 error generated.


vim +/at91_default_usrio +5710 drivers/net/ethernet/cadence/macb_main.c

  5704	
  5705	static const struct macb_config default_gem_config = {
  5706		.caps = MACB_CAPS_GIGABIT_MODE_AVAILABLE |
  5707			MACB_CAPS_JUMBO |
  5708			MACB_CAPS_GEM_HAS_PTP,
  5709		.dma_burst_length = 16,
> 5710		.usrio = &at91_default_usrio,
  5711		.jumbo_max_len = 10240,
  5712	};
  5713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
