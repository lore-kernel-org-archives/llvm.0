Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD402AF03;
	Thu, 25 Apr 2024 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714045559; cv=none; b=G08Tc4P4fYdJPlJLp0LS5maqP1enHG02Y5SGEKWYAg+H8P/byLIV69U1uPwPiqo9ZzV+VuO69IsWC0k7lzYWwNVddLyF9AhPEKsfwQG1yaf8qpxUoXuWXPWQAALplGnO6TUGvrh0Ca1nL2Thd/keD2irdZyItOEFZRye+aPv53o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714045559; c=relaxed/simple;
	bh=4BnOzWoPTsgvu/Qp5phgwx8gKZtiOJNmd0K8aKF4D7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ROQmmLW9rKFHmDMn4VjMP8X0bJv5N94NaWlvtk3CNpCTTgIaFqItiYEAoQJiy31/8ESiSnm/ib1/8IwDlAmuNSJ0e/R60g6KV79SYYv2bgB/BrIHQqEdZiUzX2PB8SAY5H8FkV8a7VS/GzyKTN9aUptwd60yqxMAHe8XA31xv3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPbm/zOw; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPbm/zOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714045557; x=1745581557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4BnOzWoPTsgvu/Qp5phgwx8gKZtiOJNmd0K8aKF4D7A=;
  b=CPbm/zOwZavvUdEGeqPzCgURfMwryNh/SnolEwJT73RmBMxEyEPuRypC
   ghkI+eQKaerNjCcNDlVa7ucBeUDd4teu4glT1OpLysh+iWUTO3wLNMkdI
   T0ITeCzDR3AEDBEObflalu+AfXYMvdy/0scBgBJYlTxqrYEJAtvhun84c
   rp/ucp34zEL5AHcnjykw4nB05Rd4CoVxptSZml3TpdQoan4fA/9+NK5Dw
   D0WjF1oogPybbFn4sgae9xwLm0ASlYAU2Bw0/lJTjYdhIOJpcPhB6WEqH
   8LFAoYtbGxj5YqgXBCfHsp7B2U32FJ9KWkX8scXF6eBEJI5+w7uKVu4pD
   Q==;
X-CSE-ConnectionGUID: lUI5nBGiR/KaTopA5eYBQA==
X-CSE-MsgGUID: v1GuSOFkR3CSzA9J0F1Zqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9846352"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9846352"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 04:45:57 -0700
X-CSE-ConnectionGUID: Snb7qg9ASK6u/x4QXmP95g==
X-CSE-MsgGUID: 3OiX8IOBRmeD8NiUTNSSbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="29672396"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Apr 2024 04:45:55 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzxY1-0002JM-06;
	Thu, 25 Apr 2024 11:45:53 +0000
Date: Thu, 25 Apr 2024 19:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: Gary Guo <gary@garyguo.net>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [nbdd0121:thin-lto 1/1] warning: linking module flags 'Dwarf
 Version': IDs have conflicting values ('i32 5' from ./rust/helpers.bc with
 'i32 4' from llvm-link)
Message-ID: <202404251927.CZoj5I1e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/nbdd0121/linux thin-lto
head:   b0a98f58bf741dea8f63918b49d7284a8813529a
commit: b0a98f58bf741dea8f63918b49d7284a8813529a [1/1] WIP
config: x86_64-randconfig-002-20240425 (https://download.01.org/0day-ci/archive/20240425/202404251927.CZoj5I1e-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240425/202404251927.CZoj5I1e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251927.CZoj5I1e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: linking module flags 'Dwarf Version': IDs have conflicting values ('i32 5' from ./rust/helpers.bc with 'i32 4' from llvm-link)
   clang: warning: argument unused during compilation: '-MMD' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-MF samples/rust/.rust_minimal.o.d' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I arch/x86/include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I arch/x86/include/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I include/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./include/generated/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/compiler-version.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/compiler_types.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-fmacro-prefix-map==' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I samples/rust' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./samples/rust' [-Wunused-command-line-argument]
--
>> warning: linking module flags 'Dwarf Version': IDs have conflicting values ('i32 5' from ./rust/helpers.bc with 'i32 4' from llvm-link)
   clang: warning: argument unused during compilation: '-MMD' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-MF samples/rust/.rust_print.o.d' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I arch/x86/include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I arch/x86/include/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I include/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./include/generated/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/compiler-version.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/compiler_types.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-fmacro-prefix-map==' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I samples/rust' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./samples/rust' [-Wunused-command-line-argument]
--
>> warning: linking module flags 'Dwarf Version': IDs have conflicting values ('i32 5' from rust/helpers.bc with 'i32 4' from llvm-link)
   clang: warning: argument unused during compilation: '-MMD' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-MF rust/.bindings.o.d' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I arch/x86/include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I arch/x86/include/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I include/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./include/generated/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/compiler-version.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/compiler_types.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-fmacro-prefix-map==' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I rust' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./rust' [-Wunused-command-line-argument]
>> warning: linking module flags 'Dwarf Version': IDs have conflicting values ('i32 5' from rust/helpers.bc with 'i32 4' from llvm-link)
   clang: warning: argument unused during compilation: '-MMD' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-MF rust/.kernel.o.d' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I arch/x86/include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./include' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I arch/x86/include/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./arch/x86/include/generated/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I include/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./include/generated/uapi' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/compiler-version.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/kconfig.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-include include/linux/compiler_types.h' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-fmacro-prefix-map==' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I rust' [-Wunused-command-line-argument]
   clang: warning: argument unused during compilation: '-I ./rust' [-Wunused-command-line-argument]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
