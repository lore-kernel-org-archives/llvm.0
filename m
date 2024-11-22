Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F311DE4E4;
	Fri, 22 Nov 2024 19:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732303690; cv=none; b=q3eCSoLZUQFoB1RvGPzyEQXsthYyurAJN6Pv0xfPpmF5ZjqnQxZJoi8R1e33p+D5BwcYpmwiJ9lmeMt2mI+je/kSTtp1T7ZFkMhD9MdAW+7XUhiJWTXkNSWmtq8F0OySuLQcCeo2PDK+tlgSU6ksv4t4iIJF3y/tKStAIr0w07k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732303690; c=relaxed/simple;
	bh=XOuugtMzqS81ax0GoSPiEWRpEv4ozJdRIVnvBRce30c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OEviYXalsYfB52wWAchAVIgp8lGdDKtFLdX0sNbm+sXQk8+ulVhjWniVBhnDKNqLi2pYLCNwjjTB5+K4wWd+g4mjOGlEhYI7rAkv/qT9qR7M2V8JEHqNC3KHzoXDWso2y7ryRwalYrQ4HV7+nPjRcqcbC5lvT95vwpLmc81aQxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fRUIA/6x; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fRUIA/6x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732303688; x=1763839688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XOuugtMzqS81ax0GoSPiEWRpEv4ozJdRIVnvBRce30c=;
  b=fRUIA/6xgVi5AsacOmk5eJugUMzoetZOVHby+Y1iBBPJdj1Lw43j9/1B
   7xuWK39CCgzfwRhfzjpvQkv/TmfeoylYVELIh+C8qXvtTrt5S1y8tN4Wl
   cWRiLvu27aUVMObNXqUqsZPQ1GEsTAbnj80FDXET98W1XSfcCo0fh7+aV
   ADIk37SJnfznV+FzsYV6jlhMjG9qotfeFu2V0H/365tlrnuj3Wmqp2Sy+
   Hkk+hNwgBUAyIehy3Mz+QLYjrWkbynqraOBm/RlpWcRwhM+R4UUJyzyps
   VEYuzowx3glOi1DdK9yIF5JomMji0ReBYx1fIVOVw2x17sADtGZV12izU
   Q==;
X-CSE-ConnectionGUID: HX0UUPS6QB6070W2969fOw==
X-CSE-MsgGUID: blzTBLeiQRyLJEJFLpP2xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="32408267"
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="32408267"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 11:28:06 -0800
X-CSE-ConnectionGUID: 4UzzGolKSMKuAjYnADxjzw==
X-CSE-MsgGUID: oRrOuiU0QEiK2IreCL4L2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,176,1728975600"; 
   d="scan'208";a="121615988"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2024 11:28:05 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEZJz-0004AR-09;
	Fri, 22 Nov 2024 19:28:03 +0000
Date: Sat, 23 Nov 2024 03:27:04 +0800
From: kernel test robot <lkp@intel.com>
To: Ding Xiang Fei <dingxiangfei2009@protonmail.ch>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Miguel Ojeda <ojeda@kernel.org>
Subject: [rust:pr/1130 1/2] error[E0432]: unresolved import
 `core::marker::CoercePointee`
Message-ID: <202411230332.WDjeYBE4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Rust-for-Linux/linux pr/1130
head:   36e9396cf5591aa42b19eacba22ee3f7e96bf792
commit: 54c00aa91853810a419c18207ce25034773b30ea [1/2] switch to CoercePointee macro, with examples
config: x86_64-randconfig-006-20241122 (https://download.01.org/0day-ci/archive/20241123/202411230332.WDjeYBE4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241123/202411230332.WDjeYBE4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411230332.WDjeYBE4-lkp@intel.com/

Note: the rust/pr/1130 HEAD 36e9396cf5591aa42b19eacba22ee3f7e96bf792 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   1 warning generated.
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   1 warning generated.
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   clang diag: include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
>> error[E0432]: unresolved import `core::marker::CoercePointee`
   --> rust/kernel/list/arc.rs:10:5
   |
   10 | use core::marker::CoercePointee;
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^ no `CoercePointee` in `marker`
--
>> error[E0432]: unresolved import `core::pin::PinCoerceUnsized`
   --> rust/kernel/list/arc.rs:13:22
   |
   13 | use core::pin::{Pin, PinCoerceUnsized};
   |                      ^^^^^^^^^^^^^^^^
   |                      |
   |                      no `PinCoerceUnsized` in `pin`
   |                      help: a similar name exists in the module: `CoerceUnsized`
--
>> error[E0432]: unresolved import `core::marker::CoercePointee`
   --> rust/kernel/sync/arc.rs:29:14
   |
   29 |     marker::{CoercePointee, PhantomData},
   |              ^^^^^^^^^^^^^ no `CoercePointee` in `marker`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
