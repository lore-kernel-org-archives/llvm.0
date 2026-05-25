Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7C714E2F2;
	Mon, 25 May 2026 13:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779714303; cv=none; b=dPaTxIWQ0QGjuAESmhDGHJCGhiK6sW7sk1H4WOUiVJrdnp0RamlNHtOmOm/yEsnkkpX18oy4tOJUreKusDPQgaGB/ub8ljac3AYvEWgtNRtoxW3OFNoFCCJRk0MBhtP+XUCHcoKTiTBCh37QRNg1YlyyioQlvYcFL7v1R9TYmEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779714303; c=relaxed/simple;
	bh=fCTcEX+ytvQPjmBV09R81/SGU5aECPeoQHz6IPY7QEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LIuYB3v8D0E6AZO2hI5+9GQg3qXBHtM0xwZU7dukKtKchXgKjJuLiky6BZLA082aQ2T1Fu9YpyQ1cXW3F1OWsQOUHT/7hNubOCroBwfjWQ2+2m2W3xGA45ReoH3rwXII3sxhdTl6yr0n7n22iMsoJSq7+3tvAXvrbvLPIesSjsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHbEn5Lu; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHbEn5Lu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779714301; x=1811250301;
  h=date:from:to:cc:subject:message-id;
  bh=fCTcEX+ytvQPjmBV09R81/SGU5aECPeoQHz6IPY7QEs=;
  b=oHbEn5Lurbia2b2jh17zNbWwTeX3tWFPDpVghNrvF5Pj3zlmWI0rvi27
   ZNtsBRxSlIKJnI/Uj2KYs10bONYZpETjUGvm5X99tHha4IrEwmE0pyC7K
   f3iOcmnk938tYBjhEmujZxcXu1ZKCP5zgWaSH5uEcg3jaeszy11jZgJd7
   /b3Kq2J70reoFxAKoHU7zE7msQUUEwrQJtUWdW3NR2Qv3bqy24/skrn86
   GpczB2NpNnPYbnmJ2e2RM4joOLO+k/9dZ95dSkMug1KyNKUzrvu38L6qg
   GWTbawWmFs1Vkcd1NK14DJOF5J/uzPTO6E1YCO68/Zt+0l7l7lOlGwLgr
   g==;
X-CSE-ConnectionGUID: bIIbp4blTzqJP9XhgP2uDw==
X-CSE-MsgGUID: 9cBL5pVVSPKiL+8b+7hbPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11797"; a="83112912"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="83112912"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 06:05:00 -0700
X-CSE-ConnectionGUID: 1mg5EJHiTcSSlPSQzryPGw==
X-CSE-MsgGUID: sK5xGynhSY+W74s7uSZulQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="235237807"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 25 May 2026 06:04:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRUzJ-000000001UE-0IV2;
	Mon, 25 May 2026 13:04:57 +0000
Date: Mon, 25 May 2026 21:04:02 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [morimoto:sound-cleanup-2026-05-22 254/254]
 sound/soc/samsung/snd-soc-arndale.o: warning: objtool: arndale_audio_probe():
 unexpected end of section .text.arndale_audio_probe
Message-ID: <202605252018.eQAkuHwh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/morimoto/linux sound-cleanup-2026-05-22
head:   65ed982efb72231d8feca201fdeb06adb64515a0
commit: 372b2ba4101c21c5561b1baf8e40cb5a6c2e0614 [254/254] ASoC: samsung: arndale: use snd_soc_card_register()
config: x86_64-buildonly-randconfig-005-20260525 (https://download.01.org/0day-ci/archive/20260525/202605252018.eQAkuHwh-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605252018.eQAkuHwh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605252018.eQAkuHwh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/samsung/snd-soc-arndale.o: warning: objtool: arndale_audio_probe(): unexpected end of section .text.arndale_audio_probe

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
