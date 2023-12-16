Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F5E30F83;
	Sat, 16 Dec 2023 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YOyzlsWt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702748079; x=1734284079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=402cdQLodVrpXuoqgrpWGCqbyHfuW6nE1Q3MXtfy9qk=;
  b=YOyzlsWtfbWEUDmTbYV9guigtJFZBbOGXaPafIqH8ZEd7EYHDHqDRGUh
   JpKfl5dOpVal8sr9XK/Ch9zszWW5XDuHFn5RoF5CpuiSbnzaqiuQTXtLN
   Lys1P6w6r3kAyLHDx3IUm5OsKycScnRI2DZjQjEq/XmWc75GY3YKU8k+D
   rgq+ZCYMBJ6Q9FjqjCd8Rh5L39RNDvSWAcU6gDZEqrxDbag0sxeL5t6Dv
   zXxnTFS12k/Ks5NDnMnHANOAw03ICs1MKKad7UIraRtJZXcLYveoluBzJ
   EjB795gSmfxylVSNf4eNQbo4lXF7fqR6I8jO7XFU864QgFuJZ3HlFdkOR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="2207957"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="2207957"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 09:34:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="809325571"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="809325571"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 16 Dec 2023 09:34:36 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEYYb-0001xe-2L;
	Sat, 16 Dec 2023 17:34:33 +0000
Date: Sun, 17 Dec 2023 01:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>
Subject: [morse:mpam/monitors_and_locking/v8 24/24] ld.lld: error: undefined
 symbol: lockdep_is_cpus_held
Message-ID: <202312170155.WAkuJVpm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/monitors_and_locking/v8
head:   b45f49cea5c2946c280481a479a2a9bd09a265be
commit: b45f49cea5c2946c280481a479a2a9bd09a265be [24/24] x86/resctrl: Separate arch and fs resctrl locks
config: x86_64-randconfig-002-20231216 (https://download.01.org/0day-ci/archive/20231217/202312170155.WAkuJVpm-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170155.WAkuJVpm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170155.WAkuJVpm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: lockdep_is_cpus_held
   >>> referenced by core.c:374 (arch/x86/kernel/cpu/resctrl/core.c:374)
   >>>               arch/x86/kernel/cpu/resctrl/core.o:(get_domain_from_cpu) in archive vmlinux.a
   >>> referenced by core.c:374 (arch/x86/kernel/cpu/resctrl/core.c:374)
   >>>               arch/x86/kernel/cpu/resctrl/core.o:(rdt_ctrl_update) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
