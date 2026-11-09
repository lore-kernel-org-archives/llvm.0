Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794243239;
	b=rudYWtQlHJCBq3zzSCe0tPuZVJfatYD/n4J6rFAF9ocgfx1zW9CL9YSn8vzyyx1KutWh
	 okfuoK07UzSe/YQJWYZYNHNMCInvxpH8Jux/G55ZI8PM85pQsJHQzxRmCgxpc1B6Z1YpH
	 tvQZX7NzMAVhTizars2vJ6KXiwQSvPeF5azHrP5c9OrenzaUolYixfhfbnhGBRCDonkNf
	 +pCxwoWH8gGGiXcuGv3yxGXOVJkKN29aJoVQ3vefKOrQVCSEzRpXSPEJcJb/nbmEotzyv
	 rXDGfmc81Lo/5SLrUf0cYb3/cVyxJCJmqq524KErqxp6LNoocTBZraU3V1sWleJvTkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794243239;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=F4OsWvsOE965wAHjkF/7l2DBKBtn2FrxEEok76qtD2A=;
	b=lFqZlzNouWqKHWQd1g0a3L8XS5Y4Kd8eJkkmqymZZfRjX4v/b4gkjeb2kjb3TRyXUeu4
	 I2CR6CSwnTFJSKKDwsAwlV+1+WLaKjSii69Qp78dDTyKqP9ofk1S1d7tEnZHATwmp8RpY
	 yPBt2lSx6itU2DcMU+8o2uJPPRX/pgTEO79fomEmoSZ6n+BDfjjWd/m6IZNn/cE7dxjAG
	 n1FQbsq8dIE0tSlb5cnbE8F82cp8muMqSYOJj4O4dSJceIkbFgIwJ1TI+VbCkWNDyiDk2
	 Feu2Zcy0exzHcEQyWdC9Sq+Ns+fDYNUXokJTVhSgHphkw1PdKgUQKD5NdYK5aAEv9iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RKWSdG7u;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5882F60A2622;
	Mon,  9 Nov 2026 16:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5882F60A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RKWSdG7u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794243239; x=1825779239;
  h=date:from:to:cc:subject:message-id;
  bh=pEYH3oMbEKk9oi0Ge9VhJ9xfpnu+GDZM9dOoKLqjC5w=;
  b=RKWSdG7uRsO1o3MfZvFkx7pYxsaSFFSDCElN5DtRH/ugpjWDcluqhA4M
   8WNThIMXkSpH5z3GnDedkFd4noYMosYdB69yT348ivzfaYGDE49qR50z7
   qk9fgsgMv5Lo5eHjiXji+8SHeqBuJsJ7eBT65ZieSsQJW4BODlmO44IyH
   WHLEy+t/nMiHyo4hn8iz+PxABnhop7Agd5uWI2BlsOeeDiLsQ3+UKCLFC
   zSwOCQkKsWWd50NPFY45G3RhOnumscVc5z5mL/Vj4uFuDHK5EQDm+qJha
   dPb+cUeLreNwU9x76cXfew4AB+ogHf6gdAyvbSFtEAu0Z4UrTpl4ZMAkh
   w==;
X-CSE-ConnectionGUID: /cka6lPYTG2W6qk3nLFcYw==
X-CSE-MsgGUID: JUKEH8sGTWyzxbZzM7OHMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3005666"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3005666"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 08:53:58 -0800
X-CSE-ConnectionGUID: dv72q4y0R828zQiA5rpoUQ==
X-CSE-MsgGUID: QQTfKDaDRZKE74g0PbVW1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="9653633"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 09 Nov 2026 08:53:56 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQScw-000000000Pd-0zqL;
	Mon, 09 Nov 2026 16:53:50 +0000
Date: Mon, 09 Nov 2026 17:52:50 +0100
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [sudeep-holla:for-next/arm_fw/updates 2/2]
 drivers/firmware/arm/psci/psci.c:81:13: warning: variable
 'psci_system_off2_hibernate_supported' set but not used
Message-ID: <202611091729.V7epDaiS-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/arm_fw/updates
head:   49c49ca0c4d02848a9576f72c4741c38c5ba09de
commit: 49c49ca0c4d02848a9576f72c4741c38c5ba09de [2/2] firmware: arm: Group interface drivers under arm/
config: arm64-randconfig-2002-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091729.V7epDaiS-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0d1bc7245734217f06f9bb7e09f9dfd09d31361b)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091729.V7epDaiS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091729.V7epDaiS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm/psci/psci.c:81:13: warning: variable 'psci_system_off2_hibernate_supported' set but not used [-Wunused-but-set-global]
      81 | static bool psci_system_off2_hibernate_supported;
         |             ^
   1 warning generated.


vim +/psci_system_off2_hibernate_supported +81 drivers/firmware/arm/psci/psci.c

6df3e14436f6ee2 drivers/firmware/psci/psci.c David Brazdil     2020-12-02  69  
068654c200cc329 drivers/firmware/psci.c      Lorenzo Pieralisi 2015-05-26  70  #define PSCI_0_2_POWER_STATE_MASK		\
068654c200cc329 drivers/firmware/psci.c      Lorenzo Pieralisi 2015-05-26  71  				(PSCI_0_2_POWER_STATE_ID_MASK | \
068654c200cc329 drivers/firmware/psci.c      Lorenzo Pieralisi 2015-05-26  72  				PSCI_0_2_POWER_STATE_TYPE_MASK | \
068654c200cc329 drivers/firmware/psci.c      Lorenzo Pieralisi 2015-05-26  73  				PSCI_0_2_POWER_STATE_AFFL_MASK)
068654c200cc329 drivers/firmware/psci.c      Lorenzo Pieralisi 2015-05-26  74  
a5c00bb28da0bb3 drivers/firmware/psci.c      Lorenzo Pieralisi 2015-05-26  75  #define PSCI_1_0_EXT_POWER_STATE_MASK		\
a5c00bb28da0bb3 drivers/firmware/psci.c      Lorenzo Pieralisi 2015-05-26  76  				(PSCI_1_0_EXT_POWER_STATE_ID_MASK | \
a5c00bb28da0bb3 drivers/firmware/psci.c      Lorenzo Pieralisi 2015-05-26  77  				PSCI_1_0_EXT_POWER_STATE_TYPE_MASK)
a5c00bb28da0bb3 drivers/firmware/psci.c      Lorenzo Pieralisi 2015-05-26  78  
a5c00bb28da0bb3 drivers/firmware/psci.c      Lorenzo Pieralisi 2015-05-26  79  static u32 psci_cpu_suspend_feature;
4302e381a870aaf drivers/firmware/psci/psci.c Sudeep Holla      2019-04-15  80  static bool psci_system_reset2_supported;
3e251afaec9a671 drivers/firmware/psci/psci.c David Woodhouse   2024-10-19 @81  static bool psci_system_off2_hibernate_supported;
a5c00bb28da0bb3 drivers/firmware/psci.c      Lorenzo Pieralisi 2015-05-26  82  

:::::: The code at line 81 was first introduced by commit
:::::: 3e251afaec9a671716c9cc4c184f4e4a09915ec4 arm64: Use SYSTEM_OFF2 PSCI call to power off for hibernate

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
