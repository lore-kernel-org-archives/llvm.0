Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF534C97;
	Fri, 20 Mar 2026 00:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773967169; cv=none; b=DIh13T+5SYLuUn8FAX7OqD0LH6GITawLxPkxo0Guf56pzW59vP47JZ4Enj5b29o0hrCHNw2rh28Bvu08QFyH6m+WapJ0vKkcrVfDX3DWyrKEez7RnHhcQ9kM+Lw/pnIimdKs5wiwgZqOJGnhCOOy6APWbW1Iu7XmpaL4wARkaJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773967169; c=relaxed/simple;
	bh=52MslHm26hkj3I56QNBIIe5gMv5CuBeolyHCzmo6oKQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WJZSHip8y5M2k9TjORwAfnEEpEW6ZsKJHHITO3BBtNYt9OC8g65LV3YpCbXGrRtrUkxhpc4m5Xpm6NgdzesO90uvlpRw+fENtTe3AvPiNprmyWWdyP2hKWQLvn7ViWqJHYr0ovxqft9bmXm20JPDUtjkUDSuJNyOhOwGVqaAXS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QaDxMgFn; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QaDxMgFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773967168; x=1805503168;
  h=date:from:to:cc:subject:message-id;
  bh=52MslHm26hkj3I56QNBIIe5gMv5CuBeolyHCzmo6oKQ=;
  b=QaDxMgFnQV8MYzFk60oIJyUASvunPYyzFBU4QECSNbBSPHFNqDRiev45
   TGEKO2qznvysnAqXfMo4xpOXtYE6HaYBtpE5v9pbEJ5aQlEetO6rRtgOY
   P98kXBNT6Fof4j3R0J1uAf2Ow6WoXrU8zTC4Tv6j/CpxRnFsUKR22xgKr
   IVysP0vkxVvoYUIh8iZpJrVom3JvCIw9b0jIIokXPvtsZGd+aAh1UPAWx
   CMlWiViRQb23Nji3ma48R3WjsrJnMhPlVNaT4kXSvcD7i1xg6q7/SRqMo
   Ctix6Yn0W1OOFW6yZnFiLaxY8pXsmxic/s/2CU6iIA+WbV8Q/z+2xw1zY
   Q==;
X-CSE-ConnectionGUID: hYma8/VQQrGMhrgE9DVLaw==
X-CSE-MsgGUID: hi8RBFPuQM6pTb1nr5yAlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="85366039"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="85366039"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 17:39:28 -0700
X-CSE-ConnectionGUID: OFlePCaNR+CXVlrAcOrc9Q==
X-CSE-MsgGUID: Xq/oDOmxQA68xvNDQ8QRLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="246158706"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Mar 2026 17:39:25 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Ntb-000000004w9-1xY4;
	Fri, 20 Mar 2026 00:39:23 +0000
Date: Fri, 20 Mar 2026 01:38:40 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:locking/futex 11/11] ld.lld: error: version
 script assignment of 'LINUX_2.6' to symbol
 '__vdso_futex_robust_list32_try_unlock' failed: symbol not defined
Message-ID: <202603200131.uK5Xj1iG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git locking/futex
head:   5b80f3b3cea35ea00ce9d14357e3ec65416bdcb0
commit: 5b80f3b3cea35ea00ce9d14357e3ec65416bdcb0 [11/11] x86/vdso: Implement __vdso_futex_robust_try_unlock()
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260320/202603200131.uK5Xj1iG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200131.uK5Xj1iG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200131.uK5Xj1iG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/futex/core.c:1460:44: error: no member named 'cs_pop_size32' in 'struct futex_unlock_cs_range'; did you mean 'pop_size32'?
    1460 |         futex_robust_list_clear_pending(pop, csr->cs_pop_size32 ? FLAGS_ROBUST_LIST32 : 0);
         |                                                   ^~~~~~~~~~~~~
         |                                                   pop_size32
   include/linux/futex_types.h:42:22: note: 'pop_size32' declared here
      42 |         unsigned int           pop_size32;
         |                                ^
   1 error generated.
--
>> ld.lld: error: version script assignment of 'LINUX_2.6' to symbol '__vdso_futex_robust_list32_try_unlock' failed: symbol not defined

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
