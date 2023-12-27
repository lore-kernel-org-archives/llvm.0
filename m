Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F671FA3;
	Wed, 27 Dec 2023 01:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mtbo93lT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703642109; x=1735178109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7v/ujX87syrPOWCR/vt8j3eTIvgnEYcg6Sg664+Dpmc=;
  b=Mtbo93lTtAXGoyhUxwNSd2y2gWgTqgO5v3MiY3QTJENQhrLmnDykysUO
   Y25MfxyEoVhLW0bYtKp7nMR8wTgA+Y5K1YzM4UBDASLMS31kiTrcpDxhn
   rJQllam/ESJiDpUG8kdxhjwbKig1mP4K5lG8sEGSkhCpJtCVGyLwBJnJA
   3bF43+Uu1C3YeodD1Nt8ee2uM1nKqDv+9hxaDku8Ex6rBcvjVxxKiPCjC
   KQRRQ+xHu96WFbo7rWrTXvj2PJ4G+x4YzJ2pvbiTwnHDll02exucBxvYN
   SV9HZMTUkDp49t5HxgXpXrz6whu0FQsGqUaN+iQo88Gd2cx4OpGPN2sS5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="3489027"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="3489027"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 17:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="1109506143"
X-IronPort-AV: E=Sophos;i="6.04,307,1695711600"; 
   d="scan'208";a="1109506143"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Dec 2023 17:55:06 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIJ8S-000ExN-2O;
	Wed, 27 Dec 2023 01:55:04 +0000
Date: Wed, 27 Dec 2023 09:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 6/11] ld.lld: error: undefined
 symbol: tick_cpu_dying
Message-ID: <202312270913.zbMZDVVQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   018d96d27486694a8496e3937ac2f7270442c7c3
commit: 0f851847642e32105fa0ace39063fa5018379f8c [6/11] timers: Start centralizing tick related CPU hotplug operations
config: arm-randconfig-002-20231227 (https://download.01.org/0day-ci/archive/20231227/202312270913.zbMZDVVQ-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312270913.zbMZDVVQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312270913.zbMZDVVQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: tick_cpu_dying
   >>> referenced by cpu.c
   >>>               kernel/cpu.o:(cpuhp_hp_states) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
