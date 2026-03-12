Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D150037FF5A;
	Thu, 12 Mar 2026 04:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773289299; cv=none; b=Ep9LsRCi8uiQN6+ZlkjM0vQTKmFU5DD3yMJ7t9x6tZgl7yYMGNsmjIiAa50UASKPQsFO56CLY6n5kfRnZF9uaiibWpL0TNZ2HeZdGSn4nkPW/BaYuGhw3BugseuNMIybhfBJVN6RAxsB4iPdLZMPPx/H09+P7xRTayeN59V/55k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773289299; c=relaxed/simple;
	bh=yukLzMZqHtXh/GGuWBRwbEBnFo9PPUiC1EJUBT0Y+kA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cHg/oWUO3eYpifRTxl3FH+oIYEJdF7eX+0zytrG6uaBEI7ZCNHICfURB1uqqJOMtCt97FBxWHAcMZ1gZHvwLOkc8aicvUydo7+XXBlQ1nvx75loKhcAsGcwOtZX7r6MUG7OAZZH3hRUKe3w+2vXTdwu18a9mJzEDYGkt2gMWOA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PMhCQIvG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PMhCQIvG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773289297; x=1804825297;
  h=date:from:to:cc:subject:message-id;
  bh=yukLzMZqHtXh/GGuWBRwbEBnFo9PPUiC1EJUBT0Y+kA=;
  b=PMhCQIvGshlKUB7RWtw1iWSW+dgzBnbeZUAOsjtAc+3UsiTyiFNyMYbQ
   6w8/4qCniBLRIsAxxxYKlW6I7jL/G2CgG8WdtQR/EyxJy6AnJZViB+yBb
   7oYAFzCl57/9Bfs0fv7hHy/hoIiehw3PbuUm7Nktg6vu3sw8C1vvVaCu5
   X752bUpIIuUulbOXk2Y8RzgYsWzafF4lkZqcAjG+4qnewHAHkqtWXtzfv
   d1f5yFgmHNVwNHCqTZ2wKim4THmDqq6dh9e9lJM8JDVJZzZceEaokqZDs
   +VIV9xLlZ4qW9nlJYZF2mxcrjfGVZwKeq9S4BXva0Y7PN6gV4JLkW1pNV
   A==;
X-CSE-ConnectionGUID: VF7Yhw5IRWWzZhfTRQQdjg==
X-CSE-MsgGUID: h4TdDG+US0qkawrcC2JquQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74562526"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="74562526"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 21:21:36 -0700
X-CSE-ConnectionGUID: QjddNRd9ToSPvuVp5Fkqww==
X-CSE-MsgGUID: RoNmFPUwREmUQU+W+6fuaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="218131641"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Mar 2026 21:21:33 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0XYA-0000000024P-311o;
	Thu, 12 Mar 2026 04:21:30 +0000
Date: Thu, 12 Mar 2026 12:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>,
 Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
Message-ID: <202603121235.tpnRxFKO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
commit: 9ef1985c003ea271369c900a93f8b834119fd150 [5585/5731] Merge branch 'mm-unstable' of https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
config: x86_64-randconfig-002-20260312 (https://download.01.org/0day-ci/archive/20260312/202603121235.tpnRxFKO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603121235.tpnRxFKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603121235.tpnRxFKO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0277]: `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
   --> drivers/android/binder/page_range.rs:146:23
   |
   146   | static BINDER_VM_OPS: bindings::vm_operations_struct = pin_init::zeroed();
   |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `*const kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
   |
   = help: within `kernel::bindings::vm_operations_struct`, the trait `Sync` is not implemented for `*const kernel::bindings::vm_uffd_ops`
   note: required because it appears within the type `kernel::bindings::vm_operations_struct`
   --> rust/bindings/bindings_generated.rs:72795:12
   |
   72795 | pub struct vm_operations_struct {
   |            ^^^^^^^^^^^^^^^^^^^^
   = note: shared static variables must have a type that implements `Sync`

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
