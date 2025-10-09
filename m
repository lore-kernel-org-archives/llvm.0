Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CF7EEC0;
	Thu,  9 Oct 2025 17:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760031796; cv=none; b=Mb8xNidQE07M93Bd6KyDvK1DE245/rkDtkdP3Al2RMjRyBhn3bFGm+do/YtlLUrgKxoOZop/bniFjIhnCAYJaJYm4cR8EUiAwgCKr1kR+JuGcfFS/U/boUmssXRIAIkCx4rr0/ajzhbI8MgU7t7r3I6eWeH8m0BVkvnl2FuSiJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760031796; c=relaxed/simple;
	bh=+qAPM9tuiSbTcVyAJUug89S6DZoXfhdpy0E/n+ZtWSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eFkzSJCddy6RtExQYKv4FcJKi48HYHPrM46UK1qzaN7P2exBcNCqfu3jzFGVJ7rfgFEkcsWuq6Ag84+H+IesVUeT1tPj+RWvZIaBJc5NKDArSMOCP2C4D9eJAvAFCwWede2LGJa68M4dbsh9CfFvZs92JUXQhM617k9ZHE8d5L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fIc/yMnn; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fIc/yMnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760031795; x=1791567795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+qAPM9tuiSbTcVyAJUug89S6DZoXfhdpy0E/n+ZtWSw=;
  b=fIc/yMnn2j8GVxhluuSZTZS8qL0IIsxyNthqpinaQFZ4Jbmdg2wwGwcq
   C91HqjWRfNjdpBTl+OnKWmh8ewI+opKOcYFGSetWHi3ZiUNqIt7LVJWqC
   pf/gxO9lwPQQfI7LOIdU1jUINfPM/S1+FhCkvYdHfs9PCB02VOda5YHXM
   2BS3kphlyVcR8vM/fFPNGajkYWVzVhwpQTjabiKtRqqw+bYP64qX8hZsa
   jdESGPcqXioinBKpNVTAZPfFvbgek2NuHL5IZ6ex9NZMTw2yaLjtKOruB
   F4Dfh2QiXVX712MKHgDR0oUF0Om3nZMJhfjHLX3KDJvdq73CM33QxA/Yh
   Q==;
X-CSE-ConnectionGUID: Z2tv8z+0RvS68+X6IcIy+w==
X-CSE-MsgGUID: /yK3ynemQBuhU1VgpFl5IA==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62347852"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="62347852"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 10:43:13 -0700
X-CSE-ConnectionGUID: BINDzVwwRE2Qhre09P4kmA==
X-CSE-MsgGUID: v61HicyTSy68d/g6eorPgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="185158028"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2025 10:43:11 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6ufV-000187-1y;
	Thu, 09 Oct 2025 17:43:09 +0000
Date: Fri, 10 Oct 2025 01:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jakub Acs <acsjakub@amazon.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 36/102] error[E0425]: cannot find value `VM_READ` in
 crate `bindings`
Message-ID: <202510100127.yuqhg8uo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jakub,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   70478cb9da6fc4e7b987219173ba1681d5f7dd3d
commit: da4dbad77af8cc850a570fd05455369cc12b0be4 [36/102] mm: redefine VM_* flag constants with BIT()
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251010/202510100127.yuqhg8uo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100127.yuqhg8uo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100127.yuqhg8uo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/rq-offsets.c:5:
   kernel/sched/sched.h:3743:18: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
   3743 |         struct cpumask *cpumask;
   |                         ^
   1 warning generated.
>> error[E0425]: cannot find value `VM_READ` in crate `bindings`
   --> rust/kernel/mm/virt.rs:399:44
   |
   399 |     pub const READ: vm_flags_t = bindings::VM_READ as vm_flags_t;
   |                                            ^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find value `VM_WRITE` in crate `bindings`
   --> rust/kernel/mm/virt.rs:402:45
   |
   402 |     pub const WRITE: vm_flags_t = bindings::VM_WRITE as vm_flags_t;
   |                                             ^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find value `VM_DONTCOPY` in crate `bindings`
   --> rust/kernel/mm/virt.rs:429:48
   |
   429 |     pub const DONTCOPY: vm_flags_t = bindings::VM_DONTCOPY as vm_flags_t;
   |                                                ^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find value `VM_DONTEXPAND` in crate `bindings`
   --> rust/kernel/mm/virt.rs:432:50
   |
   432 |     pub const DONTEXPAND: vm_flags_t = bindings::VM_DONTEXPAND as vm_flags_t;
   |                                                  ^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find value `VM_LOCKONFAULT` in crate `bindings`
   --> rust/kernel/mm/virt.rs:435:51
   |
   435 |     pub const LOCKONFAULT: vm_flags_t = bindings::VM_LOCKONFAULT as vm_flags_t;
   |                                                   ^^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find value `VM_ACCOUNT` in crate `bindings`
   --> rust/kernel/mm/virt.rs:438:47
   |
   438 |     pub const ACCOUNT: vm_flags_t = bindings::VM_ACCOUNT as vm_flags_t;
   |                                               ^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find value `VM_NORESERVE` in crate `bindings`
   --> rust/kernel/mm/virt.rs:441:49
   |
   441  |     pub const NORESERVE: vm_flags_t = bindings::VM_NORESERVE as vm_flags_t;
   |                                                 ^^^^^^^^^^^^ help: a constant with a similar name exists: `SHN_LORESERVE`
   |
   ::: rust/bindings/bindings_generated.rs:8477:1
   |
   8477 | pub const SHN_LORESERVE: u32 = 65280;
   | ---------------------------- similarly named constant `SHN_LORESERVE` defined here
--
>> error[E0425]: cannot find value `VM_HUGETLB` in crate `bindings`
   --> rust/kernel/mm/virt.rs:444:47
   |
   444 |     pub const HUGETLB: vm_flags_t = bindings::VM_HUGETLB as vm_flags_t;
   |                                               ^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find value `VM_SYNC` in crate `bindings`
   --> rust/kernel/mm/virt.rs:447:44
   |
   447   |     pub const SYNC: vm_flags_t = bindings::VM_SYNC as vm_flags_t;
   |                                            ^^^^^^^ help: a constant with a similar name exists: `O_SYNC`
   |
   ::: rust/bindings/bindings_generated.rs:10666:1
   |
   10666 | pub const O_SYNC: u32 = 1052672;
   | --------------------- similarly named constant `O_SYNC` defined here
--
>> error[E0425]: cannot find value `VM_ARCH_1` in crate `bindings`
   --> rust/kernel/mm/virt.rs:450:46
   |
   450 |     pub const ARCH_1: vm_flags_t = bindings::VM_ARCH_1 as vm_flags_t;
   |                                              ^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find value `VM_WIPEONFORK` in crate `bindings`
   --> rust/kernel/mm/virt.rs:453:50
   |
   453 |     pub const WIPEONFORK: vm_flags_t = bindings::VM_WIPEONFORK as vm_flags_t;
   |                                                  ^^^^^^^^^^^^^ not found in `bindings`
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
