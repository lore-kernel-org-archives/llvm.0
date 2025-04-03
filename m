Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD5E1862;
	Thu,  3 Apr 2025 02:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743648632; cv=none; b=FJ9zb5JuBTxVEXRDZDeaNrixQmTdfntMf27XDBlW9IB7DiAnnI2ig0TcddPCDhUUIg3tesXdVpqmO3eLRyDYXbwCe794fgAQLClMxBbXERoydPZFLKPQAFHqHquJO6SXBA85vIqQOzVXm0y0s0c0NyoGIWl8WXj9GTr9X1WYfxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743648632; c=relaxed/simple;
	bh=o/kcmmGAYouBe95hJfaUoaBa0V7fdOrf7FRlY1Qf/Zo=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hesl0ZZRZRqmssiNM4W3JbPf/lA9iY/CP2ttgZF7MDDiUKx4j4X1Rh1rbsRLtTDfn+Dy/P4ShTevcoiVr2hCReh3sk3dMjTzcnmxz73PplHxN5wpEqvOVtpu+eax0/mI3Jkn6izSsfsEK2qjH5h9yhPkJ/NcSZ1U5JZwPB4hTGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k1V29Xzr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k1V29Xzr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743648631; x=1775184631;
  h=date:from:cc:subject:message-id:mime-version;
  bh=o/kcmmGAYouBe95hJfaUoaBa0V7fdOrf7FRlY1Qf/Zo=;
  b=k1V29Xzr6XX7bJKwuri+xieeWsfFugFQTtp2ru70x7wPou8IIulKBHm8
   2WWmhuWPMJuY8a+YNweycK7JMaYKzfiuviFNMSOoBASNTZSnkuReEHVVi
   Ma89eEPh/xi5e1sbdkjTue/VGuISd/GXBDzOzf7NuwyiZzVVb/rX1i41y
   YwcA1ZjCmVXY7HtJspkPBSPpJeqi34LbK7A543M7B5RrzenQGJmgZFv0H
   PyCgQJzJQfbiHdfa1kynn59GDtgzRr4z55eRStqbeBYEoOHl/2+VfKtB8
   xRDLgqlJ0MNfWj2m8+4wmlTbtU5sRXOpvSBLMUr0rB0jPxM9+zYrXD6jr
   w==;
X-CSE-ConnectionGUID: dHbPe+zmQYqEgHntqisWlQ==
X-CSE-MsgGUID: oQ9V83UHQ0GMIOXh8D19zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44933828"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="44933828"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 19:50:30 -0700
X-CSE-ConnectionGUID: guhZkeQ1R/uga7rIl46PJw==
X-CSE-MsgGUID: 3GvMjFEiSWiD5BFhm3XESg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="126636871"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Apr 2025 19:50:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0Aet-000BBO-1F;
	Thu, 03 Apr 2025 02:50:24 +0000
Date: Thu, 3 Apr 2025 10:49:48 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: ld.lld: error: call to __read_overflow marked "dontcall-error":
 detected read beyond size of object (1st parameter)
Message-ID: <202504031024.1XGGoOYN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a1b5bd45d4ee58af4f56e49497b8c3db96d8f8a3
commit: 6ee149f61bcce39692f0335a01e99355d4cec8da kunit/fortify: Replace "volatile" with OPTIMIZER_HIDE_VAR()
date:   3 weeks ago
config: riscv-randconfig-002-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031024.1XGGoOYN-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031024.1XGGoOYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031024.1XGGoOYN-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: call to __read_overflow marked "dontcall-error": detected read beyond size of object (1st parameter)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
