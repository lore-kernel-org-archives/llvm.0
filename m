Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC34D2C1598;
	Fri,  6 Feb 2026 11:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770376437; cv=none; b=ilJMQxKdz9j9bIqWuyJ1RAfjTNzxWHhhJEXejvG4FFI6wC5pkBIghEAmqxfKr8YI7wxiRHb9nk6D2lVt7ZufuFIflXrxGfc0vhg9GC3sgGHU2pyhoYT5bFaEScgJVXGqhsnbHzf46Sa5u7erXOwupOoVRsrZgqESM4oHWbbqZek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770376437; c=relaxed/simple;
	bh=k52xHfDOKmvgjVkvuXFUvJngmxyJNmUT2QESE45Md4U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=utcG6AbyCkzG/b5H2N/9vDk97c3pkwL+mk/sgksSuxIXBH6oAwPMVNbX6h/Y/3Uwre3KaVexmhN3hfxObVCcb2Ey7tl75toX3O7zdIzahx0c9QPeedGaOmTwJZ3ngVup9R6EjOraq7IMiP7eFtgavEpJF9f+N9ClVArevL4ZRA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgENHqgE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgENHqgE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770376437; x=1801912437;
  h=date:from:to:cc:subject:message-id;
  bh=k52xHfDOKmvgjVkvuXFUvJngmxyJNmUT2QESE45Md4U=;
  b=jgENHqgEATF67G6ZDb6Rf28S5yHkuT9Fe8r8WsO+Eau/7xbvZ4lCO8so
   abcsvBZa6DZveKKekgEj3SE213xekYBuRaN/2uHLxxSAacErkcqpdrFp0
   /ISmD6oqyB8BKc5mXUj0k/78SZW0zuM6X75SdJLf6JY1xZug5+DWXnJ+z
   cHzIcvPwDNljI7PiO9EA/avAy7vpPkcJMjS2WuQz8OIXUgaCOoWTY8bXe
   iYEpq5c85YIcw6io1qPXz4iT2Bt1g+RxKmA7TqTNrkHcUFrXqbo9Naiae
   LW5qFZsJXek0m+3w0oW1gOkRm3u37Ak4wWjWJoftsHW4xqDUOugL1SG70
   Q==;
X-CSE-ConnectionGUID: C/1aGeCFSyiYr0UMYtqFWw==
X-CSE-MsgGUID: DlnipL0IQ3CAW+VEIX7pNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11692"; a="70597987"
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="70597987"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 03:13:56 -0800
X-CSE-ConnectionGUID: ajngoHokQ0KVIP2e+JZFZg==
X-CSE-MsgGUID: 61645xwlSm+at0qOUp658A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,276,1763452800"; 
   d="scan'208";a="210735677"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 06 Feb 2026 03:13:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voJma-00000000kgS-2NxN;
	Fri, 06 Feb 2026 11:13:52 +0000
Date: Fri, 06 Feb 2026 19:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm-snapshot-2-4-2025 6/31] error[E0603]: module
 `clist` is private
Message-ID: <202602061927.NHxEdwh1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm-snapshot-2-4-2025
head:   db8da9f88880a9d0a5053cb4b0276dab7df3f003
commit: 2314b867ecdc547cea44919b4c179bd1479b9208 [6/31] gpu: Move DRM buddy allocator one level up
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260206/202602061927.NHxEdwh1-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260206/202602061927.NHxEdwh1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602061927.NHxEdwh1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0603]: module `clist` is private
   --> rust/kernel/clist.rs:313:17
   |
   313  |         $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
   |                 ^^^^^ private module
   |
   ::: rust/doctests_kernel_generated.rs:3700:21
   |
   3700 | let list = unsafe { clist_create!(head, Item, SampleItemC, link) };
   |                     -------------------------------------------- struct `CList` is not publicly re-exported
   |
   note: the module `clist` is defined here
   --> rust/kernel/lib.rs:79:1
   |
   79   | pub(crate) mod clist;
   | ^^^^^^^^^^^^^^^^^^^^
--
>> error[E0624]: associated function `from_raw` is private
   --> rust/doctests_kernel_generated.rs:3700:21
   |
   3700 | let list = unsafe { clist_create!(head, Item, SampleItemC, link) };
   |                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ private associated function
   |
   ::: rust/kernel/clist.rs:231:5
   |
   231  |     pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
   |     ---------------------------------------------------------------------------- private associated function defined here
   |
   = note: this error originates in the macro `clist_create` (in Nightly builds, run with -Z macro-backtrace for more info)
--
>> error[E0624]: method `iter` is private
   --> rust/doctests_kernel_generated.rs:3707:18
   |
   3707 | for item in list.iter() {
   |                  ^^^^ private method
   |
   ::: rust/kernel/clist.rs:247:5
   |
   247  |     pub(crate) fn iter(&self) -> CListIter<'_, T, OFFSET> {
   |     ----------------------------------------------------- private method defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
