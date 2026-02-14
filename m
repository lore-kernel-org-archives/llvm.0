Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C91A3166;
	Sat, 14 Feb 2026 12:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771073670; cv=none; b=eKUkhLAEqSDF24cr0g4RKTlvn7dsQJBx2td54K4ALUAgWQaMOlTOFAsFy5FP9y+R3vgzzMNSCUEGjuazIqp9O+HNZiVBAlimAe8S1Xh30ORr8Hq0mJgofKiGtKjO1nIvWpHORIaHq/56O0whYZ7NEGueCxsBBtCxXu8dzbnGzz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771073670; c=relaxed/simple;
	bh=WHXK6420mmGvbIRP5eez8HD9ENue1ml6+Qq/Vs7KrFs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GFTiw+02WZkZ7wg55JcWqa32csQ0nyliq+nSfJGAQlkhA+Bh2SNeWm6r1eSj0H5NklilXOjDar6nmd67b/hQ2dSdKcV5Sx8hwEAtGAA/3ECRL2R5/jdbr7b69TzTkAqSL0T83WpGi6O6Xu0XBhe1eIcYb8o7jfIZexX+MerusWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HF2LTvQj; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HF2LTvQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771073669; x=1802609669;
  h=date:from:to:cc:subject:message-id;
  bh=WHXK6420mmGvbIRP5eez8HD9ENue1ml6+Qq/Vs7KrFs=;
  b=HF2LTvQjDclUe9V+k3aR6o7UZ7Ftd460M/PJYOiqpNxV6CpXCxrgz9+t
   DVTKGz/1ODkwfaHU6CEPPFN42CrkS5zj9n4cVgUGefwLz62IjIFf+7gm0
   E30GyDGwsS34/BuBhL3N5XDPeL0Hh1KrnBrAu6+HPyNEXd9HFVkdCeP5b
   GeqDQb24OsGJ9IvzHsBtJ/t4egpuKsWjD801aY2o3uEkN0hIS5fFb61E0
   bD7xICnab8mliSM+wPRl3hK6ZGr1fCcrEVL86ZUH/gLQLYTFL2DAKBORd
   3EjOGKFEtCmKlisVGwFL47Jtop/BwWUswNVuTrz/dZGN3Sx6Hk7tntK66
   g==;
X-CSE-ConnectionGUID: ZmLc1+sLSHORc07una0kyA==
X-CSE-MsgGUID: bjvXI6CXS5+acXtdqgL2xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="71265812"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="71265812"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 04:54:28 -0800
X-CSE-ConnectionGUID: jx9sIBFBQJmEv+66ybB1Xg==
X-CSE-MsgGUID: BrYtVBnMQIi7Scr8zzQ7xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="212549787"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2026 04:54:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrFAG-00000000wXo-3boc;
	Sat, 14 Feb 2026 12:54:24 +0000
Date: Sat, 14 Feb 2026 20:53:26 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:b4/aarch64-clear-pages 2/2] make[7]: *** No
 rule to make target 'arch/arm64/kvm/hyp/nvhe/../../../lib/clear_page.nvhe.o',
 needed by 'arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o'.
Message-ID: <202602142051.bzpo4KnU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-clear-pages
head:   a925ec351435c4da7f3ca8877af9e0aee81bcca5
commit: a925ec351435c4da7f3ca8877af9e0aee81bcca5 [2/2] arm64: Implement clear_pages()
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260214/202602142051.bzpo4KnU-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602142051.bzpo4KnU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602142051.bzpo4KnU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[7]: *** No rule to make target 'arch/arm64/kvm/hyp/nvhe/../../../lib/clear_page.nvhe.o', needed by 'arch/arm64/kvm/hyp/nvhe/kvm_nvhe.tmp.o'.
   make[7]: Target 'arch/arm64/kvm/hyp/nvhe/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
