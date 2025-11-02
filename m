Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62111F4169;
	Sun,  2 Nov 2025 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762105469; cv=none; b=nGRyhJ1+HIqS9erMhbH2hoCZhBlywoy//LX2Jzi+GhN/1QiLOEAEWBlFsD76y8SwQT+HzDNJAc4sWGJ/H7VOhkIr7OMDU1fNrhfqinIq2S4r9JsArglUC5NVR2/eDWzcIvuaEXw6GusK9cp5SCuig1cpGQ6TXTqLbiHKGaDIIH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762105469; c=relaxed/simple;
	bh=cQ+afpCYO06+ikC4r0b46YiJTs/UziGPdqI74m66AhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fSWRDRSOvPdrtVplUi7bDNbqltJVmZhPej/kWWJ+Zx3zBUh3L8v+rABS88SKHbe8dONLWlswgpXXO2isOwlAbPDM6hYoOaxxnqp5NzX0/qDkt6YFG/VuLiv1xCpPmVJ3xWIx4y82PJ5GQq/28g7s6e8pjpSfGRwnhLGOOeLrqfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inBSigud; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inBSigud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762105468; x=1793641468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQ+afpCYO06+ikC4r0b46YiJTs/UziGPdqI74m66AhQ=;
  b=inBSigud+jAAqeRrV+Q2XTghetjJ2bSS2gTWNQL46yBT9OyXC8wrs/iN
   UTgv2bc5E7nfPioe6vVo1vHMhqBmUxrUP8gqBAajuRA5hL0KKwdLF3E+6
   78doU7M5WYWuO8KSoY2EdmFaEZR0spanZBIpKQ+J0PZz+Mvze6lKKDz9P
   DnXwXlT4YB5CWKFDuS6sqxgupPtwumnxjrxyRPDLI91pSzzu+Lk2q3U1K
   5dPwJauBX2LGvKfFxpIMLDGRx7crSB1/v2MbYn87nZOOFnEBcoMNOldgT
   m7NCJfavYwHa5yzwoddqTPEftWNiRUSyLeFu2FtNRw5MEsLxtS3GfL6ht
   A==;
X-CSE-ConnectionGUID: dZBP8LMCTRiGRTI9A0EfeA==
X-CSE-MsgGUID: V9N+zq8TTzKEqgJEQky1zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="75642187"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="75642187"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 09:44:27 -0800
X-CSE-ConnectionGUID: gyrxkkUvS4y3Du3Xvr89nw==
X-CSE-MsgGUID: LnMEDqhkQcOw0hupEXp/gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="210221626"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Nov 2025 09:44:26 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFc7s-000PTS-08;
	Sun, 02 Nov 2025 17:44:24 +0000
Date: Mon, 3 Nov 2025 01:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 8047/8682] ld.lld: error: duplicate
 symbol: __cfi_sof_hifixdsp_boot_sequence
Message-ID: <202511030110.Ls4snnqN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Peter,

FYI, the error/warning still remains.

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   757240fad173acf52d78a6bd2aff5e241c930eb8
commit: 4c9625c67f6916dadbec6d668955cda9d244161a [8047/8682] Merge branch 'sound/upstream-20251003' into merge/sound-upstream-20251003
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20251103/202511030110.Ls4snnqN-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030110.Ls4snnqN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030110.Ls4snnqN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: duplicate symbol: __cfi_sof_hifixdsp_boot_sequence
   >>> defined at mt8195-loader.c
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(__cfi_sof_hifixdsp_boot_sequence) in archive vmlinux.a
   >>> defined at mt8365-loader.c
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-loader.o:(.text+0x0) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_sof_hifixdsp_shutdown
   >>> defined at mt8195-loader.c:46 (sound/soc/sof/mediatek/mt8195/mt8195-loader.c:46)
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-loader.o:(__cfi_sof_hifixdsp_shutdown) in archive vmlinux.a
   >>> defined at mt8365-loader.c:47 (sound/soc/sof/mediatek/mt8365/mt8365-loader.c:47)
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-loader.o:(.text+0x200) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_adsp_clock_on
   >>> defined at mt8195-clk.c:44 (sound/soc/sof/mediatek/mt8195/mt8195-clk.c:44)
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(__cfi_adsp_clock_on) in archive vmlinux.a
   >>> defined at mt8365-clk.c:48 (sound/soc/sof/mediatek/mt8365/mt8365-clk.c:48)
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-clk.o:(.text+0x540) in archive vmlinux.a
--
>> ld.lld: error: duplicate symbol: __cfi_adsp_clock_off
   >>> defined at mt8195-clk.c:152 (sound/soc/sof/mediatek/mt8195/mt8195-clk.c:152)
   >>>            sound/soc/sof/mediatek/mt8195/mt8195-clk.o:(__cfi_adsp_clock_off) in archive vmlinux.a
   >>> defined at mt8365-clk.c:164 (sound/soc/sof/mediatek/mt8365/mt8365-clk.c:164)
   >>>            sound/soc/sof/mediatek/mt8365/mt8365-clk.o:(.text+0x1040) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
