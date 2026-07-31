Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1788E3AE6FC;
	Fri, 31 Jul 2026 09:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785489687; cv=none; b=Bg2HiH2rNGesxwGePOXKEO/swRULQFKnsKi6sT5rmA7pNdZrKKQdphkr24G7ab8HTT6C2lpzMzuQTjVQxAIgO2zMIqdB6YNTNujui/wWkmbNp6CyVl8ZezZGpTMMkHujen0A2Ql4km4Foa/U7SR7n3/0+enYnLius2XCfielKJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785489687; c=relaxed/simple;
	bh=dBwh3FSpTXPqmDQs1570AnW24Y7QPdbYUdzqfmXhm4M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hIfyqb8aIjHjigDLYxeFBgLQ4EvPMWNzCAI0BfTbS0mjiYJhWhi+KRigJAUelEqZFHBwnYrxLoc7eJ7LbhmL9Vlv9uS0PLAgDhm8AhxumZkws41j6rnPMOe1g/XAKaID5PoK0UxfQS7tNjugyywThuAVVMMi+73LPfOJlA/g3/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7Y0P892; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7Y0P892"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785489686; x=1817025686;
  h=date:from:to:cc:subject:message-id;
  bh=dBwh3FSpTXPqmDQs1570AnW24Y7QPdbYUdzqfmXhm4M=;
  b=R7Y0P892/bhoTKN8ArNgW5k8i75QeF9+0xBhcNWymyCp0DTw9QxzHC88
   0I0J7ONvESKugPOexqRwuuDFtFYWCt1MYNKsNV+p8yd3sLu//tADRxqaU
   6RkAbBGEz8peWdhTSW52ytEC5MEtZ7VJwJjr+XjzUNw/BHeZpRaKFLN46
   HnksytNswPzpx7/oIWvysEpni0h8WvpraE6XD0mDVk4NWDU5DMgERgZGb
   wHxmY17s0uhslwZjTpUXgGNx6a91r6sav5Km7Dupsi72Gykvf5NUDu7lX
   yBA75BWxjA5m+L4fz+I73W6yFuylH96Y7ch772x8FWRJVQh+g+cSF1rBM
   g==;
X-CSE-ConnectionGUID: MonweJkUTemaTOAxPEA6xQ==
X-CSE-MsgGUID: V9U7fKZUQ7ew9KXNBDasaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="97629151"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="97629151"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 02:21:24 -0700
X-CSE-ConnectionGUID: cU9Wyj7HQrGQYCaoqzUoMQ==
X-CSE-MsgGUID: UZcSoJ+7QSSXdFkwRA8V8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="264348245"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Jul 2026 02:21:23 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpjQe-000000000Ql-2fX7;
	Fri, 31 Jul 2026 09:21:20 +0000
Date: Fri, 31 Jul 2026 17:20:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 10847/10862] error[E0308]: mismatched
 types
Message-ID: <202607311740.f7GJKZ7y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95d6a9ccef99117115e41e9adb271243bd5e985b
commit: 2de2d480c5235c48d8b94f8cdce480df4d57073e [10847/10862] Merge branch 'slab/for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/slab.git
config: x86_64-buildonly-randconfig-004-20260731 (https://download.01.org/0day-ci/archive/20260731/202607311740.f7GJKZ7y-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311740.f7GJKZ7y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311740.f7GJKZ7y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0308]: mismatched types
   --> rust/kernel/sync/poll.rs:175:44
   |
   175 |         unsafe { bindings::kvfree_call_rcu((*ptr).rcu.get(), ptr.cast::<ffi::c_void>()) };
   |                  ------------------------- ^^^^^^^^^^^^^^^^ expected `*mut kvfree_rcu_head`, found `*mut callback_head`
   |                  |
   |                  arguments to this function are incorrect
   |
   = note: expected raw pointer `*mut bindings::kvfree_rcu_head`
   found raw pointer `*mut bindings::callback_head`
   note: function defined here
   --> rust/bindings/bindings_generated.rs:75494:12
   |
   75494 |     pub fn kvfree_call_rcu(head: *mut kvfree_rcu_head, ptr: *mut ffi::c_void);
   |            ^^^^^^^^^^^^^^^

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for QCOM_PDR_MSG
   Depends on [n]: QCOM_SOC [=n]
   Selected by [y]:
   - QCOM_PDR_HELPERS [=y] && NET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
