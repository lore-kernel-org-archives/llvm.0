Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4415446B8;
	Mon,  9 Dec 2024 05:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733722258; cv=none; b=t1TxVb6RylTc1qn8lg5OoES8IFlLZU3Ohk1F8N0W1b/7ZPBSKhNSEi/truJScb0t8mpZ3pQ9gcG5svBbTmM1Kn6WFPEWS0ouxxKiO9KzzP01WPEQRS7aMANeDST/4TUZOeCYKhyKAwMCIc1873sq49LB7z9GITK3HdMeBLk+z9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733722258; c=relaxed/simple;
	bh=TF4YnwUZfD0BYfFL4Aid0KzbItmkS6wE6a5HcGYoqlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SH5+wETWTzzUEbSUK8ejJr5B6R+4duDO8EqEhqkMlLj/praUB9cg1lV1HbPYQGFoaCF8gEpPBLDPN85j/fKpfXjlM9TiqViJ6ZU0I3jUxKUtF32U36yA+UVwB5mNxC+8moIdnhHKH0fIOPpa8e0Z+DUG9uYNKPZAguGDVHdQrng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acQFSncZ; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acQFSncZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733722255; x=1765258255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TF4YnwUZfD0BYfFL4Aid0KzbItmkS6wE6a5HcGYoqlo=;
  b=acQFSncZWQT/PDW5n/W0S8SGsZZX8hquXtVi2K312uym09ocVedyJkCO
   Hj76it5HgGLEiTttZAhFilpLiRZnITWz2X17y1xDp1TCb4VOEylyt/5+j
   Eva7q9YrASMXqgu7RAiN7D79+N1VGHbXwSyufArbabOy9nsZ9w/APfhi9
   gHS/yzIUN+Qff2l01juNS7eHu7d299l7fSIKc3r8YOCNkYf42ZoJspTPj
   xEOC4GCoRZwsyUShvPdcj/vMAHROcxIVPcvMiOAm1Pdvws+P3WCCi6CPC
   cggQbgx6Num+ADXge7JyPS4+4p1N9uvgrwcmkfxJwwe/64vzg96bvadLr
   Q==;
X-CSE-ConnectionGUID: Jmw/HQZ/QkCDiN7sXKaFXg==
X-CSE-MsgGUID: qPepxiZMR8uOBYiXqF//AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33895833"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33895833"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 21:30:55 -0800
X-CSE-ConnectionGUID: z8oYUA29S2+6SNV9rr32xg==
X-CSE-MsgGUID: 4+qic6n6QH6s5DjqvYwiTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95168339"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Dec 2024 21:30:50 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKWM4-0003zJ-0l;
	Mon, 09 Dec 2024 05:30:48 +0000
Date: Mon, 9 Dec 2024 13:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol
 'sifive_errata_patch_func.______f.3'; recompile with -fPIC
Message-ID: <202412091329.zKaAkS8r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
commit: f79dc03fe68c79d388908182e68d702f7f1786bc kconfig: refactor choice value calculation
date:   5 months ago
config: riscv-randconfig-002-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091329.zKaAkS8r-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091329.zKaAkS8r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412091329.zKaAkS8r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'sifive_errata_patch_func.______f.3'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'sifive_errata_patch_func.______f.3'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_HI20 cannot be used against symbol 'sifive_errata_patch_func.______f'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a
--
>> ld.lld: error: relocation R_RISCV_LO12_I cannot be used against symbol 'sifive_errata_patch_func.______f'; recompile with -fPIC
   >>> defined in vmlinux.a(arch/riscv/errata/sifive/errata.o)
   >>> referenced by errata.c
   >>>               arch/riscv/errata/sifive/errata.o:(sifive_errata_patch_func) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
