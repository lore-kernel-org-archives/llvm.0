Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ECD94A1E;
	Sat,  9 Nov 2024 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731136120; cv=none; b=eg3u2aQHTrVyFlv4ZawGcR++vFcP0d2tHhe0RZ2S05vQfwpQZEYjnubV8NzUezC3Jq/KHvznPHai8/SGBVK/09FKpxLzkIzP1KK4whM1mg+/Xjsu1Uo+egVjVKNdE9WaiIRfldo86IiuA9ueDOrY3D8pMoyQuKkA7tEThZJmgIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731136120; c=relaxed/simple;
	bh=L6oCa9TrlD0TfiMCSzrm2l8bStG4pehkNWDm2Ah1lVU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oz8meA3rhSAsXVsQf5hFV2H26SiAmrQBag2oGwOV1r7ODQm1zzRAB4Auc0URd239dskBgp6wOmWkKl/yTKVv27Zg/d2MCdWtknwaUslT84aSMRX7SUcY0sGttI8sXyUaxjx1OLkL8tfwPbRh3fXwi9u8dbTWSX3vXQ7MAWnivyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F+2lCh+e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F+2lCh+e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731136118; x=1762672118;
  h=date:from:cc:subject:message-id:mime-version;
  bh=L6oCa9TrlD0TfiMCSzrm2l8bStG4pehkNWDm2Ah1lVU=;
  b=F+2lCh+eQuzaS+qJ5qM3OozGmlvjusrDUyhH9FYqM3X5ZP9b2YTYzAYe
   w4tPoSujFDqEvvp9HRy1R5wQFkNOAORKtF91zwmq0e3ry7q5zZGbW5TNi
   cWK8pvHqkTlKlh9qXR7fIfm1ZN5eWxcGq4aL1MHgG/zZZZRumfAjYcFz7
   MBQyZLDc71wVTZ3ZGFYvG7jZdLlID4vmPMateUPE1KqGTSR0c44DZDGLW
   dHzG9SATlB/ePfTRrFj2Hu2fQtoXn4YWv2GOHUoXpdC/F4IV2fetLb9mu
   QJdNgYFYAOhx8FjNUEH04JGtq2cVHyjH6NDTQPAxZU0ewpcfrmiyBPATc
   g==;
X-CSE-ConnectionGUID: /xN4v3I0S0q5/eptV7oZqA==
X-CSE-MsgGUID: xw/iTGbSRwG4oa0ncYdkAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30417803"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="30417803"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 23:08:37 -0800
X-CSE-ConnectionGUID: AlcgsCGORmazoHDA0IaWrA==
X-CSE-MsgGUID: 00b85e9HQ4qh6/VtyXwx3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="86054395"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Nov 2024 23:08:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9faF-000sB4-07;
	Sat, 09 Nov 2024 07:08:35 +0000
Date: Sat, 9 Nov 2024 15:07:58 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [linux-next:master 9470/10559] ld.lld: error:
 vmlinux.a(init/main.o):(function run_init_process: .text.unlikely.+0x10):
 relocation R_RISCV_HI20 out of range: 528087 is not in [-524288, 524287];
 references 'argv_init'
Message-ID: <202411091555.zOnIL8kl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

TO: Rong Xu <xur@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Han Shen <shenhan@google.com>
CC: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   929beafbe7acce3267c06115e13e03ff6e50548a
commit: 622240ea8d71a75055399fd4b3cc2b190e44d2e2 [9470/10559] vmlinux.lds.h: Adjust symbol ordering in text output section
config: riscv-randconfig-001-20241108 (https://download.01.org/0day-ci/archive/20241109/202411091555.zOnIL8kl-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091555.zOnIL8kl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091555.zOnIL8kl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function run_init_process: .text.unlikely.+0x10): relocation R_RISCV_HI20 out of range: 528087 is not in [-524288, 524287]; references 'argv_init'
   >>> referenced by main.c:1382 (init/main.c:1382)
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
