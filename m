Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7670338E5DC;
	Mon,  9 Mar 2026 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051479; cv=none; b=h93CWaGzaQpsXCfo3QmBz3ANH0c5MXefKiycJTbdNhXhGgTUKy487bDUCjl6CrUM/SNvX5/zB4M2evtZcnsp5kY1MShN06/IOaIG9u5K9fenSlUXrgZIEtgccG/57N5vJx+pkU3U3sTJn1KYC9CrrqYcrS/N0vqHWGn4lV+gFt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051479; c=relaxed/simple;
	bh=RnOkfCfKAMoTQQlcqzc1AeWJtZlyjuxr4eJQccNZ1QU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jn+2w6NysH+8StYiNv7pshW8ReW1SsLH4f/pVCW3jFa3PQ86NbPRASYMVzrFvUCOxeOlUmTy0Pi/utIdLx3WP/pcRotphYd3VAg6wh4l09TxyMQeVolRv7RBpmQZImVV9VjtBLJD/BObWClon8W3/GZ0v+5aNCNbVms2SVMeqPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q4nlSzzc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q4nlSzzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773051477; x=1804587477;
  h=date:from:to:cc:subject:message-id;
  bh=RnOkfCfKAMoTQQlcqzc1AeWJtZlyjuxr4eJQccNZ1QU=;
  b=Q4nlSzzcxDNPOog9KM+ILi3d2L201UsM0sn+i/g/ldy9/NPdlrF7HfcY
   eRZeDwwBptFTGpMgaEZtt+G69YtURaxtgeFcphz5Xjcrvda96JxtcyWw9
   7w8dKuUuFT9Xnk9E7bkH/oj2R7PMuftAwBRLFzCs0j5kILmg5zc4OCpLK
   96SuOGyvNmihWGzp42qZB08n4UImRmyGy2/Vu7VQFuiHTuSJ6ZUmh5dsS
   3JnbzPpr/KiCNyYw3My7rVyy13dvZnouIRyBMi5rGOxJgcYC77yfvvjlT
   cZXkvLHnQGVMQMG+NYlTODZj/Q+plQmWbmebEV+sz8Mipa0/ApYRJCObn
   Q==;
X-CSE-ConnectionGUID: Usl9ax4mQm2YME8vSeVZnA==
X-CSE-MsgGUID: xXRcLBpiRJ6NppXfvxkGBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="96688245"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="96688245"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 03:17:57 -0700
X-CSE-ConnectionGUID: ykcVKZ4IQF+7FzYcOfBelQ==
X-CSE-MsgGUID: jc7MsdkFQOa5ZuGcDrAv7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="224639031"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Mar 2026 03:17:55 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzXgO-0000000004E-28FD;
	Mon, 09 Mar 2026 10:17:52 +0000
Date: Mon, 09 Mar 2026 18:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jfern:nova/mm 2/27] error[E0433]: failed to resolve: use of
 undeclared type `GpuBuddyFlags`
Message-ID: <202603091804.gtN2fvsF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova/mm
head:   f93bd1f081990c55183e8e7d0bcf33b6c895720d
commit: e8d69c8d924bc07172af6297d92e8a2056831d56 [2/27] rust: gpu: Add GPU buddy allocator bindings
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260309/202603091804.gtN2fvsF-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260309/202603091804.gtN2fvsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603091804.gtN2fvsF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0433]: failed to resolve: use of undeclared type `GpuBuddyFlags`
   --> rust/doctests_kernel_generated.rs:6635:9
   |
   6635 |         GpuBuddyFlags::default(),
   |         ^^^^^^^^^^^^^
   |         |
   |         use of undeclared type `GpuBuddyFlags`
   |         help: a struct with a similar name exists: `GpuBuddyParams`
--
>> error[E0433]: failed to resolve: use of undeclared type `GpuBuddyFlags`
   --> rust/doctests_kernel_generated.rs:6648:9
   |
   6648 |         GpuBuddyFlags::default(),
   |         ^^^^^^^^^^^^^
   |         |
   |         use of undeclared type `GpuBuddyFlags`
   |         help: a struct with a similar name exists: `GpuBuddyParams`
--
>> error[E0433]: failed to resolve: use of undeclared type `GpuBuddyFlags`
   --> rust/doctests_kernel_generated.rs:6741:9
   |
   6741 |         GpuBuddyFlags::default(),
   |         ^^^^^^^^^^^^^
   |         |
   |         use of undeclared type `GpuBuddyFlags`
   |         help: a struct with a similar name exists: `GpuBuddyParams`
--
>> error[E0433]: failed to resolve: use of undeclared type `GpuBuddyFlags`
   --> rust/doctests_kernel_generated.rs:6825:9
   |
   6825 |         GpuBuddyFlags::default(),
   |         ^^^^^^^^^^^^^
   |         |
   |         use of undeclared type `GpuBuddyFlags`
   |         help: a struct with a similar name exists: `GpuBuddyParams`
--
>> error[E0433]: failed to resolve: use of undeclared type `GpuBuddyFlags`
   --> rust/doctests_kernel_generated.rs:6912:9
   |
   6912 |         GpuBuddyFlags::default(),
   |         ^^^^^^^^^^^^^
   |         |
   |         use of undeclared type `GpuBuddyFlags`
   |         help: a struct with a similar name exists: `GpuBuddyParams`
--
>> error[E0433]: failed to resolve: use of undeclared type `GpuBuddyFlags`
   --> rust/doctests_kernel_generated.rs:6926:9
   |
   6926 |         GpuBuddyFlags::default(),
   |         ^^^^^^^^^^^^^
   |         |
   |         use of undeclared type `GpuBuddyFlags`
   |         help: a struct with a similar name exists: `GpuBuddyParams`
--
>> error[E0433]: failed to resolve: use of undeclared type `GpuBuddyFlags`
   --> rust/doctests_kernel_generated.rs:6938:9
   |
   6938 |         GpuBuddyFlags::default(),
   |         ^^^^^^^^^^^^^
   |         |
   |         use of undeclared type `GpuBuddyFlags`
   |         help: a struct with a similar name exists: `GpuBuddyParams`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
