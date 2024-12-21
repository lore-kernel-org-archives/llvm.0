Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F26E4A08;
	Sat, 21 Dec 2024 21:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734816893; cv=none; b=ZZtatqX+siTRPAXeQweNhGOliZ8kMpc7sOGZtRlL1t2jolPefhu/qcR4FtnM+mo1ViyvfzWWswabEpB9Go9k0zKwxElNfZ9wvjXnCdwDlt1UzFrOtGspPMnKjbL8Yx7Q+tq9blJ+nXmFWv7OFQ+7weco7aVuChvXasjkhPTt9nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734816893; c=relaxed/simple;
	bh=YxlzdWfwmYTI3t9YBoLzFLq3mQe0fR3+KQEdm56scS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jm5l3C/woFl5EDbNKEE9oJleSYQ5mcA2xnhUR9lYOb37B+IhQ3PS/AiXcQUWA/ey579WbPEoI3dyQVeW7CHY01wzpoUTuS/NL3PBiD+jLQDaaiC27CXjcNltedKN1KeORJ+Q95civlHXARxFHolYZhr1lYXF+W/THYsA0mhoacA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aJieigve; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aJieigve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734816892; x=1766352892;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YxlzdWfwmYTI3t9YBoLzFLq3mQe0fR3+KQEdm56scS0=;
  b=aJieigvehPSkdObEDD0FfF2VtpfwGV0+3CVqDMzoFxtrgD66rr8iPWBZ
   nuxSbn6p5gjGDu6FdXmBOGUB4t3az/n0dog2uIXflBxr5eErAivXBUenU
   4UMZc2QhKR+S9pgPxgqiBRCsatBE2gn6i5FDThTaqfE3Tmku5Ais0q6D4
   H86EMfC9bYeuY8hKRLPQkj1lMvB7qFcWNGWTQJLeE/KPmB1xA/e37IDVX
   0IHiOvqGGFo+4qE6HfWvulGFPmnyfAeScb8RwTSHte28RmwYtgqQQV9fx
   5/wW47APW3d72qhsRLFWVQZ5GgCUImVP52hdsuDTXXaX/yGgYCTDbRuyW
   A==;
X-CSE-ConnectionGUID: KFQFQrXaTOeqIMTMjZb8vA==
X-CSE-MsgGUID: QQMirYgCSSGlC0qFcIwEpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="52860574"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="52860574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 13:34:49 -0800
X-CSE-ConnectionGUID: OndXaOARTmiurUYJjpNEkg==
X-CSE-MsgGUID: pPyrD21lSSeNEWPkXBCT+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102945246"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2024 13:34:47 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP77V-0002VP-0T;
	Sat, 21 Dec 2024 21:34:45 +0000
Date: Sun, 22 Dec 2024 05:33:46 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Subject: [rust:staging/dev 18/23] warning: trait `Sealed` is never used
Message-ID: <202412220513.9Lps4Oe9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux staging/dev
head:   9c5819498a69da0c66d6142e486f462a1d43b3a8
commit: 60a98cb043f1c5416825caaa19cbc5bb568773e4 [18/23] rust: Add a Sealed trait
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20241222/202412220513.9Lps4Oe9-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220513.9Lps4Oe9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220513.9Lps4Oe9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: trait `Sealed` is never used
   --> rust/kernel/lib.rs:98:15
   |
   98 |     pub trait Sealed {}
   |               ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default
--
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   505 |                            item];
   |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   512 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   525 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
   ***
   *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang >= 19.1
   *** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),
   *** unless patched (like Debian's).
   ***   Your bindgen version:  0.65.1
   ***   Your libclang version: 19.1.3
   ***
   ***
   *** Please see Documentation/rust/quick-start.rst for details
   *** on how to set up the Rust support.
   ***
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   505 |                            item];
   |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   512 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   525 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   4 warnings generated.
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
>> warning: trait `Sealed` is never used
   --> rust/kernel/lib.rs:98:15
   |
   98 |     pub trait Sealed {}
   |               ^^^^^^
   |
   = note: `#[warn(dead_code)]` on by default

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
