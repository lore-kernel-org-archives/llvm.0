Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C464B189F55;
	Fri, 18 Oct 2024 07:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729236079; cv=none; b=tKQTXW3qyJQ7MiRsElDi1nrxx+Nga/8GJJqTmqPnwzMxz8POrdqn2qM4MItlI5GUYs+EQY/gpR4fBHlkPB9oq6ihwacy9mfxEqV/WDJyAEqSwQ/wCU85GmlY4QSz+1cPAIS5cJDXj1Nto6f6Dh7/oQk7t6/y+s1VTbBCZnAWEF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729236079; c=relaxed/simple;
	bh=0llwrEoLG4NX33UFiX7Gy/0tt2ZKm1q52WQd7wYcKgY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K9ldaWvigB9+FwPXzvLSclGS0sgfTpx3NIrXo59C5v9ALfXaCinXqCZ2oe9PmNMvKXyGo6/lGJusKf4xCfxm+kMESutc1FVUUUdXsMt0UA6VWp21a/znPhL/QHYHa/8hIWrXY00orQpilz5brtOPet01y8IaO/ajTfjGFT4ispo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1Y5cBBu; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1Y5cBBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729236078; x=1760772078;
  h=date:from:cc:subject:message-id:mime-version;
  bh=0llwrEoLG4NX33UFiX7Gy/0tt2ZKm1q52WQd7wYcKgY=;
  b=J1Y5cBBucz/H/T7RZ6aHMcifnGEuk/NR2OoyuH25EYwln7ZXxkTl0hjI
   cH3gp94EdSNW5S3Exu9k0O20T9WjXRpSBBHi8QTTvtBzKXPSWgAR7n1I/
   eq5x0c6I3Of9RA9UwrwpnupMe9DhTLsw3rJ1fPS1xQnr4ZCfmnX/JeRrm
   43uoR0auLP6Gemj9LOTpT0HS8Bx0/XxluyZ4n9JoD4RSce+jGaj5rLMYw
   PXigcvI3ccS80FTtNAlKwrJ+N0Id0y7KcD8zLJwgoPvJooM2o8rutuUce
   Afn/kEvfoTHHQ6t8KbktjvgjUpCqL3Ny3ujocVMvnPO3rdvRcGx5PqnjR
   g==;
X-CSE-ConnectionGUID: D2qy75LWRkySfYjPdmdj7Q==
X-CSE-MsgGUID: 57QnS4ddSPCqkvusQql7Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51301952"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51301952"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 00:21:14 -0700
X-CSE-ConnectionGUID: nt+cLW71TuO3RmcUC38mzg==
X-CSE-MsgGUID: uw4g23SbS9OyPsTCtd4/Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; 
   d="scan'208";a="78395890"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Oct 2024 00:21:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1hIM-000NPX-0O;
	Fri, 18 Oct 2024 07:21:10 +0000
Date: Fri, 18 Oct 2024 15:20:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 4087/5321] drivers/net/phy/intel-xway.o: warning:
 objtool: xway_gphy_led_polarity_set+0x62: can't find jump dest instruction
 at .text+0xbfe
Message-ID: <202410181554.kk707VdB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Daniel Golle <daniel@makrotopia.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7df1e7189cecb6965ce672e820a5ec6cf499b65b
commit: 1758af47b98c17da464cb45f476875150955dd48 [4087/5321] net: phy: intel-xway: add support for PHY LEDs
config: x86_64-randconfig-015-20241017 (https://download.01.org/0day-ci/archive/20241018/202410181554.kk707VdB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410181554.kk707VdB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410181554.kk707VdB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/phy/intel-xway.o: warning: objtool: xway_gphy_led_polarity_set+0x62: can't find jump dest instruction at .text+0xbfe

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
