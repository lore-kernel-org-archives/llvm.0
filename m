Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D1A35950;
	Fri, 20 Jun 2025 01:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382651; cv=none; b=GFk9YUqxRnPfKQjAKt5WQ8Li0c5aK/r9VGGdBX+ENS8x8o9jkZaIkyhqm/C3ZDfSTeU+Fa0t7saZZkOVzjPdJdyL+9KR3OZRsOsU+EaHiBQAJURN3L/SaY+eBcbDcXpOo0zjaH6foH/yUbo59c98kC1QnSptkFZbXOA3tVoHQN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382651; c=relaxed/simple;
	bh=rP6zF0Y0oDFlDzpS/N1Dam7Dm+9zIlihxVOBTqlkH5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rw6320lWon4fcjI5evFE+mA3S6CrNqkzXmInPDPo9xvube0Z2ykH1F8g6iKcsDWxcmQnJU6pDFLHKurdVc7kCyFPvrjAQ6hB6nJuqQhROh90urigeqqgONNO0nofkwHHHFsR+irKr4PVknw5IB/28xCiCZzGkhobWYir2ND7hsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oplu+b+I; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oplu+b+I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750382650; x=1781918650;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rP6zF0Y0oDFlDzpS/N1Dam7Dm+9zIlihxVOBTqlkH5Y=;
  b=Oplu+b+IDO0gKn3y7VbJYSLuaUCbW3eOCuBgokeyoGPn02U1tnXVUbZa
   N4zSxkA9vkbxdcbbBzZ1KubNhE5O6mVzrTUO6NRLphf6fC9R0QODEdbrb
   vgWgQ8F28aEEfpll84JPH3CL9+xl/yhg0970i3godBUGc114OhnSpNzah
   wBIW0vR/JfjnjuRSqxMYW8iA6gwYSyJeJuRz+m7XpMYETq7BhCq+GtPdp
   fx//A4gSycJjbQLbMPEVKG+G2Ad/QpXQTrXtwfu4QeoYkNO1Q6HA2yeDQ
   usui8t/3iv2GRxqfq9YZDC0Hh2YxYUKze/X9lpBBlkBXhkdGUgu38aWvX
   Q==;
X-CSE-ConnectionGUID: MffXdtRrTvWhndlLlH+EZQ==
X-CSE-MsgGUID: hjnHv+hrRBm4sab3FcqPpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="78048778"
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="78048778"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 18:24:10 -0700
X-CSE-ConnectionGUID: cmPDSLH/SOWbEhlJzy7Ucw==
X-CSE-MsgGUID: YUDPA2/iQ9mRhoYMk9D1mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,250,1744095600"; 
   d="scan'208";a="174393007"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 19 Jun 2025 18:24:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSQUA-000LFk-0z;
	Fri, 20 Jun 2025 01:24:06 +0000
Date: Fri, 20 Jun 2025 09:23:59 +0800
From: kernel test robot <lkp@intel.com>
To: Ricky Wu <ricky_wu@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: [ulfh-mmc:next 88/90] drivers/mmc/host/rtsx_usb_sdmmc.c:1042:2:
 warning: unannotated fall-through between switch labels
Message-ID: <202506200902.0b5Z1InC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git next
head:   f5c755ef810009b85350884c483705bd04365370
commit: 2c3809bd6f65cdd8c13853af1ab2a80ddf80528d [88/90] mmc: rtsx_usb_sdmmc: Add 74 clocks in poweron flow
config: i386-buildonly-randconfig-003-20250620 (https://download.01.org/0day-ci/archive/20250620/202506200902.0b5Z1InC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506200902.0b5Z1InC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506200902.0b5Z1InC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mmc/host/rtsx_usb_sdmmc.c:1042:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    1042 |         case MMC_POWER_UNDEFINED:
         |         ^
   drivers/mmc/host/rtsx_usb_sdmmc.c:1042:2: note: insert 'break;' to avoid fall-through
    1042 |         case MMC_POWER_UNDEFINED:
         |         ^
         |         break; 
   1 warning generated.


vim +1042 drivers/mmc/host/rtsx_usb_sdmmc.c

c7f6558d84afe6 Roger Tseng 2014-04-11  1012  
ddf60f1cf1d2c0 Ulf Hansson 2025-06-10  1013  static void sd_set_power_mode(struct rtsx_usb_sdmmc *host,
c7f6558d84afe6 Roger Tseng 2014-04-11  1014  		unsigned char power_mode)
c7f6558d84afe6 Roger Tseng 2014-04-11  1015  {
c7f6558d84afe6 Roger Tseng 2014-04-11  1016  	int err;
2c3809bd6f65cd Ricky Wu    2025-06-16  1017  	struct rtsx_ucr *ucr = host->ucr;
c7f6558d84afe6 Roger Tseng 2014-04-11  1018  
c7f6558d84afe6 Roger Tseng 2014-04-11  1019  	if (power_mode == host->power_mode)
ddf60f1cf1d2c0 Ulf Hansson 2025-06-10  1020  		return;
c7f6558d84afe6 Roger Tseng 2014-04-11  1021  
4a4b1d2837322e Ulf Hansson 2025-06-10  1022  	switch (power_mode) {
4a4b1d2837322e Ulf Hansson 2025-06-10  1023  	case MMC_POWER_OFF:
c7f6558d84afe6 Roger Tseng 2014-04-11  1024  		err = sd_power_off(host);
e7c56431e1996f Ulf Hansson 2025-06-10  1025  		if (err)
e7c56431e1996f Ulf Hansson 2025-06-10  1026  			dev_dbg(sdmmc_dev(host), "power-off (err = %d)\n", err);
f275179f7bdcf0 Ulf Hansson 2018-05-31  1027  		pm_runtime_put_noidle(sdmmc_dev(host));
4a4b1d2837322e Ulf Hansson 2025-06-10  1028  		break;
4a4b1d2837322e Ulf Hansson 2025-06-10  1029  
4a4b1d2837322e Ulf Hansson 2025-06-10  1030  	case MMC_POWER_UP:
f275179f7bdcf0 Ulf Hansson 2018-05-31  1031  		pm_runtime_get_noresume(sdmmc_dev(host));
c7f6558d84afe6 Roger Tseng 2014-04-11  1032  		err = sd_power_on(host);
e7c56431e1996f Ulf Hansson 2025-06-10  1033  		if (err)
e7c56431e1996f Ulf Hansson 2025-06-10  1034  			dev_dbg(sdmmc_dev(host), "power-on (err = %d)\n", err);
2c3809bd6f65cd Ricky Wu    2025-06-16  1035  		/* issue the clock signals to card at least 74 clocks */
2c3809bd6f65cd Ricky Wu    2025-06-16  1036  		rtsx_usb_write_register(ucr, SD_BUS_STAT, SD_CLK_TOGGLE_EN, SD_CLK_TOGGLE_EN);
4a4b1d2837322e Ulf Hansson 2025-06-10  1037  		break;
4a4b1d2837322e Ulf Hansson 2025-06-10  1038  
4a4b1d2837322e Ulf Hansson 2025-06-10  1039  	case MMC_POWER_ON:
2c3809bd6f65cd Ricky Wu    2025-06-16  1040  		/* stop to send the clock signals */
2c3809bd6f65cd Ricky Wu    2025-06-16  1041  		rtsx_usb_write_register(ucr, SD_BUS_STAT, SD_CLK_TOGGLE_EN, 0x00);
4a4b1d2837322e Ulf Hansson 2025-06-10 @1042  	case MMC_POWER_UNDEFINED:
4a4b1d2837322e Ulf Hansson 2025-06-10  1043  		break;
4a4b1d2837322e Ulf Hansson 2025-06-10  1044  
4a4b1d2837322e Ulf Hansson 2025-06-10  1045  	default:
4a4b1d2837322e Ulf Hansson 2025-06-10  1046  		break;
c7f6558d84afe6 Roger Tseng 2014-04-11  1047  	}
c7f6558d84afe6 Roger Tseng 2014-04-11  1048  
c7f6558d84afe6 Roger Tseng 2014-04-11  1049  	host->power_mode = power_mode;
c7f6558d84afe6 Roger Tseng 2014-04-11  1050  }
c7f6558d84afe6 Roger Tseng 2014-04-11  1051  

:::::: The code at line 1042 was first introduced by commit
:::::: 4a4b1d2837322e9cc46c93a2e88ec40977a56afc mmc: rtsx_usb_sdmmc: Re-work the code in sd_set_power_mode()

:::::: TO: Ulf Hansson <ulf.hansson@linaro.org>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
