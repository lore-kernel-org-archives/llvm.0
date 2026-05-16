Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D0F405C31;
	Sat, 16 May 2026 19:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778958660; cv=none; b=f0dXNVV1C+K1kUXedAk4Cgckj8gE9IfUcfdWzOgyFL8eAFDYtZPk1Kkjve+fgmpH5QoQmqQ+RuSmxH+bJpaiVTUBdGRsq57Ig55lIMIbuapXAM+wrzkre6c1vSlLazy+79b9lO5srnlVGilpLFj25daFDuqhVLDf4hX53yyaui4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778958660; c=relaxed/simple;
	bh=kWcxCCvGz9WmxFUjNmbLt9d+zggHWWgdhLuazVG86w8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JatAVUeLrP6A7IFAAN2j4OiwcmLftLzYcgJRNLC4KWSvMRYcfrIqRbEB3PA2MomTq15hig1+ejhvhTWXX7zKpIUqR3lx7qB2iey1JUDNvbU546M+N9qoUMgsIf/a6l9MZqvtj04keGaZ/kcp76pWicxdHP03AmJ03lEZbOCcnuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knbWP63K; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knbWP63K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778958657; x=1810494657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kWcxCCvGz9WmxFUjNmbLt9d+zggHWWgdhLuazVG86w8=;
  b=knbWP63KPM3gLYjC3+muuMII4cVTWOuw1gmogADSy9Ny1xnxbhJ1ZoYV
   uUJVcRCANhd5UiTQiMJbdo5tWcCqjzhKQPT7/dhFSqR6zFvY+KJzDJfPl
   OuQyk10MnNNqV+ZdhVJj5DM9uxkfdRg5WmBuXDrgdC02OagH9JlwSBmuY
   ArULr/5V0B8/3G2JgjR8HA+QWdPAIPIAWa4W8AnXWcrg5adjUVChw8LcN
   tdd3Af9SZuxbpkPwCZ9oeQ4fz8ztZt0QS84CSTkABgoX56Ny+oKxne5pt
   Lig5X6VUBeXFkxdJF+7/u1yugyErhBws1gBSi9Uehl6J15Gpdq52u3Mgz
   g==;
X-CSE-ConnectionGUID: kKgF1jWvTsqXDZoaZ/4uDA==
X-CSE-MsgGUID: d4Le+uOwSk+yJhQ35TZH+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="79773927"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="79773927"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 12:10:56 -0700
X-CSE-ConnectionGUID: Rw/74fL7Q+GAAeqq/aCG9g==
X-CSE-MsgGUID: Ws3VKb0KTGmzJst1x/eAww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="262777441"
Received: from lkp-server01.sh.intel.com (HELO d94e5e629b2d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 16 May 2026 12:10:55 -0700
Received: from kbuild by d94e5e629b2d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOKPU-0000000014U-1JiA;
	Sat, 16 May 2026 19:10:52 +0000
Date: Sun, 17 May 2026 03:10:40 +0800
From: kernel test robot <lkp@intel.com>
To: Benno Lossin <lossin@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Gary Guo <gary@garyguo.net>
Subject: [linux-next:master 6256/13385] vmlinux.o: error: objtool:
 =?us-ascii?Q?=5FRINvMs0=5FNvNtNtCshc5sK6KjdJJ=5F6kernel4sync4lock1?=
 =?us-ascii?Q?=5F=5FINtB6=5F12=5F=5F=5FThePinDataINtNtNtBc=5F5alloc4kvec?=
 =?us-ascii?Q?3VecINtNtCsbsbRiabPlh9=5F4core3pin3PinINtNtB1a=5F4kbox3BoxIN?=
 =?us-ascii?Q?tNtBc=5F7debugfs5ScopeNtCscKcGI1asYQG=5F19rust=5Fdebugfs=5Fs?=
 =?us-ascii?Q?coped10DeviceDataENtNtB1a=5F9al...?=
Message-ID: <202605170339.69SX0hFt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: 560f6d13c33f9f06ca34c14dc7c0a045d949c4a0 [6256/13385] rust: pin-init: rewrite `#[pin_data]` using `syn`
config: x86_64-randconfig-001-20260512 (https://download.01.org/0day-ci/archive/20260517/202605170339.69SX0hFt-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170339.69SX0hFt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605170339.69SX0hFt-lkp@intel.com/

All errors (new ones prefixed by >>):

   vmlinux.o: error: objtool: .altinstr_replacement+0x18e4: redundant UACCESS disable
>> vmlinux.o: error: objtool: _RINvMs0_NvNtNtCshc5sK6KjdJJ_6kernel4sync4lock1__INtB6_12___ThePinDataINtNtNtBc_5alloc4kvec3VecINtNtCsbsbRiabPlh9_4core3pin3PinINtNtB1a_4kbox3BoxINtNtBc_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataENtNtB1a_9allocator7KmallocEEB3s_ENtNtB8_5mutex12MutexBackendE5stateNtNtB1z_7convert10InfallibleINtNtCs57PXBekmiam_8pin_init10___internal11InitClosureNCINvMs5_NtBc_5typesINtB60_6OpaqueNtNtCsfd3uB5I4hpp_8bindings12bindings_raw5mutexE8ffi_initNCNCINvMs0_B8_INtB8_4LockB15_B3Z_E3newB15_E0s_0E0B6b_B4x_EEB2G_: symbol name too long, can't create __pfx_ symbol
   vmlinux.o: error: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10DeviceDataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7convert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_17create_file_writes0_0B27_E0B27_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create __pfx_ symbol
   vmlinux.o: error: objtool: _RINvXs5_NtNtCshc5sK6KjdJJ_6kernel5alloc4kboxINtB6_3BoxINtNtNtCsbsbRiabPlh9_4core3mem12maybe_uninit11MaybeUninitINtNtBa_7debugfs5ScopeNtCscKcGI1asYQG_19rust_debugfs_scoped10ModuleDataEENtNtB8_9allocator7KmallocEINtCs57PXBekmiam_8pin_init12InPlaceWriteB1L_E14write_pin_initNtNtBa_5error5ErrorINtNtB3p_10___internal11InitClosureNCINvYIBH_B1L_B2W_EINtNtBa_4init11InPlaceInitB1L_E8pin_initNtNtBX_7convert10InfallibleINtB3p_12ChainPinInitIB4F_NCINvMs_B1O_B1L_3newB6a_NCINvMB1O_NtB1O_3Dir5scopeB27_B6a_NCNvB29_12init_control0IB4F_NCNvMB29_B27_4inits_0B27_B6a_EE0B8k_Es0_0B1L_B6a_ENCB73_0B1L_B6a_EE0B1L_B4l_EEB29_: symbol name too long, can't create __pfx_ symbol

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
