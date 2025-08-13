Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911E32EB5C4;
	Wed, 13 Aug 2025 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755093427; cv=none; b=APRK0NJxTN2o4WWNdaemC9XBHVlV8NKAmU+5M78KqfB3NN2Px6tvmzfKRGnwDmTSerxguajZHhjUkyPzbFFe9z/FDhX5Nk/OrvFX3KihDqm+BvQrVyVCeFZ8vGOEWyqsyOuWV31xxiCKe8MHl3y+4iNXli2Q9oFgF3/LQcWdk+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755093427; c=relaxed/simple;
	bh=YcrjMM/Br0h/iQfJ6e/kCnLzEpw1YyxgRTNbdJ7J5vg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LPLashdzRyYenflUcqIlp5RhBKp6i0GNOqzFwT/6JaMel+AtobIYm5m4025AjWUzvo5fiHFojlq+zonEHDvibY8hAuG6Q2L193YUge8xOkadjq7UA1VVHWyVUmC4YPTPnfzjfIb0OZtScgdfNQmPqVlzXZyGnP81dnfYvElQXq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f4csrPnR; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f4csrPnR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755093425; x=1786629425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YcrjMM/Br0h/iQfJ6e/kCnLzEpw1YyxgRTNbdJ7J5vg=;
  b=f4csrPnRT/t/RRzJL9LQIgBqrNKOdD2YMSEQE9ePALEioGZRljs7MML+
   cD1qUu91DnLP07nIASiD3QV174+mBLG8SgmBRpJf3Ah9N2J75aEcjjzdz
   sIUTvvMdTq79PSVvaGmFqzsOrTtBDcg7v1jX8+x0ktBA7BrxoB8h/oHUS
   QR4Pc2fjKM9cjZ2fn7RLJOgRRzav3l1BVbk1pENSo9f6+t4lZ7IapOpes
   rx7d4lGDW5TJHLIPU1RlJX0MXtpFD2hqIJcs/99ckxRr/bs7iBmKQHpN8
   X7GNuVl3ia7653BvmzreOQZGfxaP4ky0nTG4+MuQbF3KvpRlVNkhRLAGD
   Q==;
X-CSE-ConnectionGUID: Apr70uHuS/yg3/D56RyDIw==
X-CSE-MsgGUID: npof4JgKTCqOAKmiXAQcYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57256707"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="57256707"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:57:05 -0700
X-CSE-ConnectionGUID: KoaTlWNGSR20CKQhA9oERA==
X-CSE-MsgGUID: RyxWRJUSRQeOssNETHQ6gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="190184467"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 13 Aug 2025 06:57:04 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umBy1-0009xg-0o;
	Wed, 13 Aug 2025 13:56:49 +0000
Date: Wed, 13 Aug 2025 21:56:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>
Subject: [linux-next:master 2053/2153] ld.lld: error: undefined symbol:
 stmmac_simple_pm_ops
Message-ID: <202508132158.dEwQdick-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   43c3c17f0c805882d1b48818b1085747a68c80ec
commit: d7a276a5768ffe4f3dbcb0a2d9d037f117b53784 [2053/2153] net: stmmac: rk: convert to suspend()/resume() methods
config: arm64-randconfig-004-20250813 (https://download.01.org/0day-ci/archive/20250813/202508132158.dEwQdick-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508132158.dEwQdick-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508132158.dEwQdick-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: stmmac_simple_pm_ops
   >>> referenced by dwmac-rk.c
   >>>               drivers/net/ethernet/stmicro/stmmac/dwmac-rk.o:(rk_gmac_dwmac_driver) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
