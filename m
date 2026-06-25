Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 033912F3600;
	Thu, 25 Jun 2026 02:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782356361; cv=none; b=njAiaOTvANCqA7RnLsZiLSlWaYEtWHaQ5uKRuS3595Sxclt71LnXGJRk6068jA73NfI39JKDf0Yu2VdlYSNmx+j3PgSma8PRe8ADZzSraxQHGJd1v7ZfpqhOMMjGAURYISXY0OYAXChdAjporI10bFPJ+apNPVZDdae6MM0rxFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782356361; c=relaxed/simple;
	bh=eMfs5R2dFLpBXLfjlHAmstYaIB6/fdR6Ir0ykkulW0w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R/b0XBUSikGWjaqVyS1f7rez3aiFn/NpWh9BT79d76Ea/K/ITRoWJWvmrcgJyXQoj7np2nbGxb7ZIOCktlM+NmMCEmiaW/NNdPVrBfJHMe6DcJJfuwQ+x9xjCpwuB2A/tXHcl1gFrEzCN3dgUsMHWmssJLjsegqCbErVev1SH8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L2yXj+Ts; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L2yXj+Ts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782356359; x=1813892359;
  h=date:from:to:cc:subject:message-id;
  bh=eMfs5R2dFLpBXLfjlHAmstYaIB6/fdR6Ir0ykkulW0w=;
  b=L2yXj+TsNaYz2J6GNqb0HG3EFnpO/N6yoJXwXwx7PGkNkuzuAd8PhD/1
   xVRcBHw04ipyOQYmGmxq02/ZOGlNAiRpCDdFApRZ0/N9RD5k+gflOaIv2
   BZIzYMlyNymKY+HW8pGeKYJtUmMARFEK27C3ZV/N4yOTZfA//vzK5jdh0
   2/KFzliLK+ts5Z2/zpofSnAa3kOculQ6jRKKmDPC9fvSVuORIk74lU9EU
   DidDir+TPG8KYfHDgGnpHRDWvValYVk46mfzKAGi9HvA7bh4FHj7Ef5nP
   B8IyBer2lvNaq/hRRZ+7mqE/d9a48KsMRRb4XQs0001sHMtcLbvSVl7qH
   Q==;
X-CSE-ConnectionGUID: zvOOelVxTGGy7MXKfDVMTw==
X-CSE-MsgGUID: 4gubAbDEQAGYKttEm1QTpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="105920559"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="105920559"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 19:59:19 -0700
X-CSE-ConnectionGUID: iaFWcuDmTam9eEFW82kHhA==
X-CSE-MsgGUID: yNuFrmpdSFKT9ingbEgwIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="250343545"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 24 Jun 2026 19:59:17 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcaJ8-000000006SX-46e7;
	Thu, 25 Jun 2026 02:59:14 +0000
Date: Thu, 25 Jun 2026 04:58:51 +0200
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 54/64] ld.lld: error: undefined symbol:
 rcu_preempt_blocked_readers_cgp_ndqs
Message-ID: <202606250457.8NKumsB0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev
head:   47e26f0fd70890ddd810887a043303a365a8bf03
commit: ab15f8d23a687736b674b3b8669a744dd709d97f [54/64] rcu: Make rcu_gp_cleanup() account for ->dqs_blkd_tasks
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260625/202606250457.8NKumsB0-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250457.8NKumsB0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250457.8NKumsB0-lkp@intel.com/

Note: the paulmckrcu/dev HEAD 47e26f0fd70890ddd810887a043303a365a8bf03 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: rcu_preempt_blocked_readers_cgp_ndqs
   >>> referenced by tree.c:2223 (kernel/rcu/tree.c:2223)
   >>>               vmlinux.o:(rcu_gp_cleanup)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
