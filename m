Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1222E973D;
	Tue, 16 Sep 2025 22:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758063494; cv=none; b=pAWTbohPhfhfyt9kPm/QcnkqvXiIUWlJBu8d0bYPKujoPZq3AnhKtajLzxcbiOOGL+TPKWHsD7eH6INRzOsqoZpU12zUzHSD8OFaKaR4Gc0tcylmOzophLdsWriNJ7qTqVLziCbIJZBxa2HSA2AgkSE6YPqhaX426P3WaagXg5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758063494; c=relaxed/simple;
	bh=s1JKMMB7OtejfDR+UsTm3l/NeTjBEXZMjX3zorlKkl0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fsvztAmoPnWpnp3L0pCpWWdqzvTekaq/wLNW12SFy3nBAzUU48HBPvaoPn1VvSZ7jVg/GDF0zbsYJRSy40YiXVodgY5Zdzz9QPfxWZf8iVc+i6pNMmxFSV2pUFvRsnpOAUCibbJEK+NZgAMtRG2ohiFMPlgjhhGfVuVfYGPfNeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UyNXjkpI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UyNXjkpI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758063494; x=1789599494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s1JKMMB7OtejfDR+UsTm3l/NeTjBEXZMjX3zorlKkl0=;
  b=UyNXjkpItY5MoLKcf0cg1EzobQIE5+bEuadwVDRZeb+D0NjOoWIX57cB
   sYYI76FeJ8zQNFGbKWyCvZJvxOw2NV8y4/B+1SV9jJTmEczU0dJ755wKg
   Ki+dH7uEOwnkyZD4xuDzAu1GNcCpfoewKt6hPT44VfNJ9LzwmlKigUp4c
   poCaTIPLF50/FllZlKqhZkMWMnnm1f8p8mgPCDz6CAh3ymWciRQxN16Ye
   U/oV0FVPZksz+WWRiPANjSlwFRSENJdHXv7yVNxXSo9IKoPxhS+pf+pEB
   rEkEO7LRkSi6WdQDrQOvZS1Tx4ZDBLx8zMWkJbl/YJ2WaYu54+SWyugfv
   g==;
X-CSE-ConnectionGUID: ttqzjkf0QwiMINtjpMTADQ==
X-CSE-MsgGUID: ZzaXf5pBTyOh0RjpjFwDKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71782954"
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="71782954"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 15:58:10 -0700
X-CSE-ConnectionGUID: R4OJ0nN5SgSng4alSw+zCg==
X-CSE-MsgGUID: QwED7Hn1SkO0mhex1Zmh+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="174181382"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Sep 2025 15:58:09 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyecg-0000pj-0N;
	Tue, 16 Sep 2025 22:58:06 +0000
Date: Wed, 17 Sep 2025 06:57:18 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Subject: [linux-next:master 9218/9696] ERROR: modpost: "iwl_bz_mac_cfg"
 [drivers/net/wireless/intel/iwlwifi/tests/iwlwifi-tests.ko] undefined!
Message-ID: <202509170625.BAJBe7Bi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   05af764719214d6568adb55c8749dec295228da8
commit: 137b0bb916f1addb2ffbefd09a6e3e9d15fe6100 [9218/9696] wifi: iwlwifi: tests: check listed PCI IDs have configs
config: i386-randconfig-012-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170625.BAJBe7Bi-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170625.BAJBe7Bi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509170625.BAJBe7Bi-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "iwl_bz_mac_cfg" [drivers/net/wireless/intel/iwlwifi/tests/iwlwifi-tests.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
