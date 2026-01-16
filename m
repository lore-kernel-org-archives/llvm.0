Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3962EB860;
	Fri, 16 Jan 2026 20:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768596924; cv=none; b=mE2RRaSXpc6K5HqK008Q9Ab3rG/1xgsvYMDYf5XUakYo9UZsIv11WBVmMdpHVQcfbtlg1hFLSJ5VXLg3uKVJkqR1QUV1O62UIoKsbEzOkM0gIs8LfwNKBokzkINsG81IqJJ5U+CMhaYK8NSpIXdhC9L1tqlEc4BQULx5NZ+AtqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768596924; c=relaxed/simple;
	bh=Epv9CgmCFAOAFerErPep9OpReyhN4yfC2fpKH94HcBg=;
	h=Date:From:Cc:Subject:Message-ID; b=O4JXGupuY7XZ+y8jPV2V9rD+Uzqveh9tQT5tBwBMOWDoYpAJB0RQm4TZOeqIShy3Oqrnf4RYvRt/d+GE7lObxF0FxRGAZhXjU934YSHMostRf0zRF0dG3e598Zjgu5I0vnu05H6SG2nzRz2kwnT3IvZXhrubFz6svmbAohOiNJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I3bLxJks; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I3bLxJks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768596923; x=1800132923;
  h=date:from:cc:subject:message-id;
  bh=Epv9CgmCFAOAFerErPep9OpReyhN4yfC2fpKH94HcBg=;
  b=I3bLxJksUx4lDeAGyCpC33YlX8iEQEqO+F67a6QA9uhcJz2l1zyHNjjv
   DUWpdCaFCK4jQ5ri3D6PaiCHUh7Wo6xiDKXB8XGjQsLDBsA+qEHlx174L
   WfO308EQLStc3VD3B8V89Qy0m+6J9ezjVYVK91TEi4+IMTozQgcEY/SKy
   EfjYFLxE3HTtLdqySNjha0VipSZvhS9MaKXyqfueajVwcI+O4URtdU30W
   /opZD06AIZLs4V1eGyOm8gJu5w07kxF/LIDoaZktgXgpMbc3ljqvTMMZG
   3q93kphgBILg49VVtYxhMweQs4TVvrJhXGfYdNlG/KrqDoK0xdMhjZLSX
   w==;
X-CSE-ConnectionGUID: CeT+XiWiRiW5wemXeMW/cw==
X-CSE-MsgGUID: rgF6ALMzROm44/VloOL/kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="87490332"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="87490332"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 12:55:22 -0800
X-CSE-ConnectionGUID: FbtE07McTXSSj3xS2DM+Gg==
X-CSE-MsgGUID: e2qrry6nRuiUynZYkS7e7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; 
   d="scan'208";a="236024684"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jan 2026 12:55:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgqqj-00000000LFG-3akh;
	Fri, 16 Jan 2026 20:55:17 +0000
Date: Sat, 17 Jan 2026 04:54:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 484/799] ld.lld:
 error: vmlinux.a(init/main.o):(function trace_initcall_finish_cb:
 .text.unlikely.+0x2ac): relocation R_RISCV_HI20 out of range: 533037 is not
 in [-524288, 524287]; references '.LCPI59_0'
Message-ID: <202601170437.5RVUDMrg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 3d8e248b2e15f09d5b41278ba5be0bd9ba2350f7 [484/799] bcachefs: Make sure we return a good error from read_extent() in retries
config: riscv-randconfig-001-20260116 (https://download.01.org/0day-ci/archive/20260117/202601170437.5RVUDMrg-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601170437.5RVUDMrg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601170437.5RVUDMrg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(init/main.o):(function trace_initcall_finish_cb: .text.unlikely.+0x2ac): relocation R_RISCV_HI20 out of range: 533037 is not in [-524288, 524287]; references '.LCPI59_0'
   >>> referenced by main.c:1387 (init/main.c:1387)
   >>> defined in vmlinux.a(init/main.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
