Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6F648F843;
	Mon, 14 Sep 2026 19:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415140; cv=none; b=Rn/kS7DETgOnFyKHGpA6G7CSx0W9j7BX/4ztNaQQ8aEXsyJPUHHDBIv1r8ug1noG/7SEpHRhznI96V4jS3sQyOswkIMqtdUWgQQnW+B1vp1Jk+aHGnQMJk+yshVQaLv60vRHoE5PuE6cH4KROQ2BqAQP64SA/iR0wghMV6UaQSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415140; c=relaxed/simple;
	bh=QBg4dkQ5yFCSOOHH0lFuGTvb7s5rOAN5fM2quM9OlBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CfJuRrbnU1hgYvmg8ufYsuQYpxWGkO7vScxtTe2vkFlLiKgvOGnTt0/APmKZNRw98UVm0nflLBr4yT8VKptUZ0s0lLTGT/aXObhVvyxIR+KRCW2Y6KSU97a7ZRuBiBuHKoa45wvpswHQDAiPvNgdgXvv7zDnM09jLax96pwXWLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HzvW99Eh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HzvW99Eh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789415139; x=1820951139;
  h=date:from:to:cc:subject:message-id;
  bh=QBg4dkQ5yFCSOOHH0lFuGTvb7s5rOAN5fM2quM9OlBU=;
  b=HzvW99Ehhxgee2phfFbN0qHMDOysUzYRwePXbXZSQLsjZHBP914uhejM
   mInmZB5OVENioUqgwhUIbr/WHIC6psvsmLwkKrZwN6i84UsuYQETt9j/1
   mlrJxD92oc4wUUvZV/as/554mWmmX9cfnwObfTZ5jlQWNfXT2thYohHR2
   RLh3ia8/NSOq+DnYtHONzZXGQ2+WPg7SUGsCY9CVKZn6MjJ9GEApRT8aW
   ZbbvSog9ti1krTla73oSM6jAX7JZ9+UA1Tjcxa8LEebdST1HDXNrhR9CD
   DSWzKtfbCoDLgGNQNCBaha/SIdbDJta3/m4twzVNBS8ZJjMwS2UGufeB8
   w==;
X-CSE-ConnectionGUID: Va2pg1Y0RVmViHN8P0zO1A==
X-CSE-MsgGUID: 6UEOlvqPQUmf/mhq8lzm4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100927065"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="100927065"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 12:45:38 -0700
X-CSE-ConnectionGUID: njz3HylkRTSY/v9HFtBd1w==
X-CSE-MsgGUID: hx9ll3S7TtyIsm+pVd/JSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="296224692"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Sep 2026 12:45:36 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6CcQ-000000003Rz-0P7J;
	Mon, 14 Sep 2026 19:45:34 +0000
Date: Tue, 15 Sep 2026 03:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [dakr:poc/vgpu 41/44] error[E0425]: cannot find function
 `pci_iov_vf_id` in crate `bindings`
Message-ID: <202609150336.58q1V5kW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git poc/vgpu
head:   6292c1de7f0758dd31496a454b4034507f38bd40
commit: efac2cec97eab36edd01a2fe79aea67a04bd8842 [41/44] POC: rust: pci: add PF registration data for VFs
config: x86_64-randconfig-071-20260914 (https://download.01.org/0day-ci/archive/20260915/202609150336.58q1V5kW-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150336.58q1V5kW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150336.58q1V5kW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `pci_iov_vf_id` in crate `bindings`
   --> rust/kernel/pci.rs:593:37
   |
   593 |         let id = unsafe { bindings::pci_iov_vf_id(self.as_raw()) };
   |                                     ^^^^^^^^^^^^^ not found in `bindings`
--
>> error[E0425]: cannot find function `pci_enable_sriov` in crate `bindings`
   --> rust/kernel/pci.rs:772:39
   |
   772 | ...                   bindings::pci_enable_sriov(pdev.as_raw(), nr_vfs.into())
   |                                 ^^^^^^^^^^^^^^^^
   |
   ::: rust/bindings/bindings_generated.rs:124506:5
   |
   124506 |     pub fn pci_enable_rom(pdev: *mut pci_dev) -> ffi::c_int;
   |     -------------------------------------------------------- similarly named function `pci_enable_rom` defined here
   |
   help: a function with a similar name exists
   |
   772 -                             bindings::pci_enable_sriov(pdev.as_raw(), nr_vfs.into())
   772 +                             bindings::pci_enable_rom(pdev.as_raw(), nr_vfs.into())
   |
--
>> error[E0425]: cannot find function `pci_disable_sriov` in crate `bindings`
   --> rust/kernel/pci.rs:795:28
   |
   795 |         unsafe { bindings::pci_disable_sriov(self.pdev.as_raw()) };
   |                            ^^^^^^^^^^^^^^^^^
   |
   ::: rust/bindings/bindings_generated.rs:124509:5
   |
   124509 |     pub fn pci_disable_rom(pdev: *mut pci_dev);
   |     ------------------------------------------- similarly named function `pci_disable_rom` defined here
   |
   help: a function with a similar name exists
   |
   795 -         unsafe { bindings::pci_disable_sriov(self.pdev.as_raw()) };
   795 +         unsafe { bindings::pci_disable_rom(self.pdev.as_raw()) };
   |

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
