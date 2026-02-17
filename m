Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD075318EF8;
	Tue, 17 Feb 2026 09:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771321835; cv=none; b=QZ6AHe+qJvdKgJQWQBmfj2yD96NurrV/vHsftPD/opOxKw82jbPJOftbe57zF9K+Z92or8+SkwSlw9gc8RzoaK5FM1HEKmYtnz510FsKMB4m4PBDJTUvkmq2PVBj6K5McAVS9vuoxlcbvdv9EapSmW+tdSCPz3w0LeZVnw4vlNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771321835; c=relaxed/simple;
	bh=4hqnKKFgYM+HUt9oYyGqO1IfY2Nj33yVzUgcARf1qKY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SFPx+1VpaPhKf52r6lDiuwzKvUySvEjsXhUh1DAN/QOQpkOzwkI+HEP9ZfrrdDi1Tck+GQUbu1/cTwVJ4XBL/GM6X+viq550ZK0uy4wvLDFOf5A7GdPOeYvzfawbt0LDkiBg77f3rccGMgBNRlPTTRBwuEiAoFD6BJuXB3kke6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ksM5bxYF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ksM5bxYF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771321834; x=1802857834;
  h=date:from:to:cc:subject:message-id;
  bh=4hqnKKFgYM+HUt9oYyGqO1IfY2Nj33yVzUgcARf1qKY=;
  b=ksM5bxYFgVWuX9xg64XhFXSe3fb6/mY31nfKsaFeI6ULYQgUaFcsy0vY
   R+YkBM0oHbBX5R3O4epNhRXL6yT6RBHDV4jLsvXwWdnAFEKhyJiMwqHlF
   u4MWHQMzrvIb8fGhZBN2Rg6pJa7L95JOqdsBcVfeRQgp3Nz5fZFBogHlI
   KRmgdA0a0CCvMAdQt0pzNTABAn31XPammnDk8cqkUjJ1jFDsLbtN9vv8r
   w2iFaz0xeij/MksHwSqGCAbxV+JPLOKu/yZfbuTxy2HBZvRDDlIB+BT1e
   tbrv7CQWKS4Vna1dV3u12KM5gz9L2rL4pQNoICj/3/0VwIr6PONfd2bqu
   Q==;
X-CSE-ConnectionGUID: M+eAa324RXmSlYpSGTbrwg==
X-CSE-MsgGUID: JtxyqnmlR6GN0jkEEQy6wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72453991"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72453991"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 01:50:33 -0800
X-CSE-ConnectionGUID: DMEJ5aqtSCOOgRwO37BCAQ==
X-CSE-MsgGUID: O2YsWbJHT7Gmzm0pibJtMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213844534"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Feb 2026 01:50:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsHiv-000000010oW-152J;
	Tue, 17 Feb 2026 09:50:29 +0000
Date: Tue, 17 Feb 2026 17:50:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:highmem-reduce 19/20] error[E0061]: this
 function takes 4 arguments but 3 arguments were supplied
Message-ID: <202602171755.8IDBzBkd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git highmem-reduce
head:   718dd72a00e45b52f424a6db19645b761fefc2ac
commit: 076a0021788d8a03d976c2d17e9887ec2c0b17b2 [19/20] drm: add explict 'gfp' argument to drm_gem_object_init()
config: x86_64-randconfig-005-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171755.8IDBzBkd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171755.8IDBzBkd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171755.8IDBzBkd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0061]: this function takes 4 arguments but 3 arguments were supplied
   --> rust/kernel/drm/gem/mod.rs:211:28
   |
   211   |         to_result(unsafe { bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size) })?;
   |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^----------------------------------- argument #4 of type `u32` is missing
   |
   note: function defined here
   --> rust/bindings/bindings_generated.rs:82854:12
   |
   82854 |     pub fn drm_gem_object_init(
   |            ^^^^^^^^^^^^^^^^^^^
   help: provide the argument
   |
   211   |         to_result(unsafe { bindings::drm_gem_object_init(dev.as_raw(), obj.obj.get(), size, /* u32 */) })?;
   |                                                                                           +++++++++++

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
