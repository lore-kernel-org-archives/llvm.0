Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840AD2E8B85;
	Sat,  6 Dec 2025 09:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765013274; cv=none; b=k1bHSmJJ/B5aI1KINgQ0Z1KOclHQctrK4ODqOSIga4Y4brwwUf91qp3YLcK7gfWQX9QXNZj+ugi/jeiquz9ySLBRMX6XQwzXD9tCQGsmPi6eT9rJYvBKmK/Wj4GwE6vztHlDLvI7aJkYIQXobt0etZ6cAt+CgfSnugrNogqCZV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765013274; c=relaxed/simple;
	bh=YHwnkhHZ+HYlxJ0Q8OkyTRCzbj4PMCS8Rm/9sWTD1vY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j33zUXdxoeeHaA4jQOXCHPRVhZpUlcSeEjs5VqkezCn1A+owZXJ+BgNELFfEgZ4zoWUtXPTrj1wsAcdKsAQ4KktI7dodFx8+g2yDmuEjEHDYTiRzFL3VCTfehf7mA3eaOqvRNc6kgW3EL9ofcNMTm7IEmBqyhAD9OS+d3d9iM38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gx4U9e17; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gx4U9e17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765013273; x=1796549273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YHwnkhHZ+HYlxJ0Q8OkyTRCzbj4PMCS8Rm/9sWTD1vY=;
  b=Gx4U9e17RE+Jc8owhmktQM0oXqX9SzmTxMlnNwmrKxOt32bjcfNZgIgv
   50M8SLY3e9FANLdkDhNK/bkN/5Lezlde0ei/msDjhtgW19Lbuka/aO9Yn
   x3k/xJrww0D/yuHqu0/n68eagps5YaYwhPKUXJ7HvhHrjy/O/fuvRh2JY
   KEiJrjoEKJYd+TK0xBqcg5CIFi6FjHB7tyFKmaHga0Q8MyNgiHOkk15Fv
   HnLI/vwteI3XjYFN7+hnGzgR5SYAOuLracgQnD4zE9pStVRHQpBaodHDE
   UFFiWJ/78T6ORhH8xLtDdpyWmxq35NVlnZ39UWMePbOecA5CXm29Ke4pc
   w==;
X-CSE-ConnectionGUID: NTav+0JLTkyuFn2/uN3rJg==
X-CSE-MsgGUID: hhJo6+9tQUiSe71KcqHyog==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="70888505"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="70888505"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 01:27:53 -0800
X-CSE-ConnectionGUID: d65HHtxgSQGPWNEPhKk9rg==
X-CSE-MsgGUID: aQWgirU8QWKp3EkK7hiPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="195513166"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 06 Dec 2025 01:27:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRoZw-00000000G2d-0JWd;
	Sat, 06 Dec 2025 09:27:48 +0000
Date: Sat, 6 Dec 2025 17:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>
Subject: error[E0432]: unresolved import `kernel::firmware`
Message-ID: <202512061721.rxKGnt5q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   416f99c3b16f582a3fc6d64a1f77f39d94b76de5
commit: 97ad568cd6a58804129ba071f3258b5c4782fb0d drm: nova: select NOVA_CORE
date:   5 weeks ago
config: x86_64-buildonly-randconfig-003-20251206 (https://download.01.org/0day-ci/archive/20251206/202512061721.rxKGnt5q-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512061721.rxKGnt5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512061721.rxKGnt5q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0432]: unresolved import `kernel::firmware`
   --> drivers/gpu/nova-core/firmware.rs:10:5
   |
   10 | use kernel::firmware;
   |     ^^^^^^^^^^^^^^^^ no `firmware` in the root
   |
   note: found an item that was configured out
   --> rust/kernel/lib.rs:94:9
   |
   94 | pub mod firmware;
   |         ^^^^^^^^
   note: the item is gated here
   --> rust/kernel/lib.rs:93:1
   |
   93 | #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   help: consider importing this module instead
   |
   10 - use kernel::firmware;
   10 + use crate::firmware;
   |
--
>> error[E0432]: unresolved import `kernel::firmware`
   --> drivers/gpu/nova-core/firmware/riscv.rs:9:13
   |
   9  | use kernel::firmware::Firmware;
   |             ^^^^^^^^ could not find `firmware` in `kernel`
   |
   note: found an item that was configured out
   --> rust/kernel/lib.rs:94:9
   |
   94 | pub mod firmware;
   |         ^^^^^^^^
   note: the item is gated here
   --> rust/kernel/lib.rs:93:1
   |
   93 | #[cfg(CONFIG_RUST_FW_LOADER_ABSTRACTIONS)]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
--
>> error[E0433]: failed to resolve: could not find `module_firmware` in `kernel`
   --> drivers/gpu/nova-core/nova_core.rs:30:9
   |
   30 | kernel::module_firmware!(firmware::ModInfoBuilder);
   |         ^^^^^^^^^^^^^^^ could not find `module_firmware` in `kernel`

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NOVA_CORE
   Depends on [n]: HAS_IOMEM [=y] && 64BIT [=y] && PCI [=y] && RUST [=y] && RUST_FW_LOADER_ABSTRACTIONS [=n]
   Selected by [y]:
   - DRM_NOVA [=y] && HAS_IOMEM [=y] && 64BIT [=y] && DRM [=y]=y [=y] && PCI [=y] && RUST [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
