Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC45273D8F;
	Sat, 11 Oct 2025 12:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760185142; cv=none; b=tUV6+q5hOke8icYZI1qXehTGuWgVF1xtrQT3No+ln7E+ISTv7badf4REoyOIbpmOgEYyEWDNBVHLNLVqbL9WQb+bxZ4vai1B5v+uQcksfxm/O1knPsSgD2HKTjC1lhphRQGdbAoUStkfB1a3At/fQ7Mf+2NFeGpTrxpGNBPHzzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760185142; c=relaxed/simple;
	bh=l3LNx/+oAM/Cf0BOnhqXfbPCFJvt0a77BKiCktsTK9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pzLdBBn0qvKBJKCXTgGaRMrh0kYSUILaFDQsW2e2ySIJPfpzzkBislRIUI4+q4piq22JHB0jPJl5XJf6Cw2JGJ4gRRP74RtJzXkaU0pwjNlp22qpnkk90zQ6ARjS9PNmCLRNUlxZ6yu09Kuc+r2U+xprnUvha02Dz9Ufny8Qx4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmuruzTH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmuruzTH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760185137; x=1791721137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l3LNx/+oAM/Cf0BOnhqXfbPCFJvt0a77BKiCktsTK9o=;
  b=DmuruzTHfwGwh+MglRzEXW2pnu/Ct96atcfSR/TP6ldkBAgIiBDSJl9H
   d7+LYfwz/uO74+4JiUfaQqwc3mtWymfwfOhTLogeFzkiJ01SbW7oag0ss
   0AYMrB6nYxPlCwUz9qkefEIqP39NvYi5n4Lvzs/q5yjOkquJhYSRevh96
   MDZ8clwXGZWO0aQQxwEKzkKoV5P8O/gUF+SWD7yscB2Xn1Eb9cNNf7365
   B8PrimGVYusu7zVYzWrgPmPhaR51Nb4fYUccAPz+Wlw7w6xeOmYYwbNSN
   Fk5JJpehmepmPwyEWSUO4dqNzo3yasdNWu+oNaBTyRuDCAyIdH8YE0x0h
   w==;
X-CSE-ConnectionGUID: Ti6d4qjORHaSHakxpgQBtw==
X-CSE-MsgGUID: gp1cUkDZQ7eJ4A8jPN35kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="85011435"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="85011435"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 05:18:52 -0700
X-CSE-ConnectionGUID: /Mv8Ym5dRL60uceTa4AAWw==
X-CSE-MsgGUID: VkjV+QwyTD6L1guW/QyYKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="204865394"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 11 Oct 2025 05:18:50 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7YYi-0003kz-0U;
	Sat, 11 Oct 2025 12:18:48 +0000
Date: Sat, 11 Oct 2025 20:18:46 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Ofir Weisse <oweisse@google.com>,
	Junaid Shahid <junaids@google.com>
Subject: [bjackman:asi/next 32/50] include/linux/asi.h:5:10: fatal error:
 'asm/pgtable_types.h' file not found
Message-ID: <202510112008.4wNGOpWa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bjackman/linux asi/next
head:   a6190e0f5b9d575cc97ef8289a7a6c5b0106fc4b
commit: 644177a8596b0310ce21cb08497b5a23cb307fce [32/50] mm: asi: Introduce ASI core API
config: riscv-randconfig-001-20251011 (https://download.01.org/0day-ci/archive/20251011/202510112008.4wNGOpWa-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112008.4wNGOpWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112008.4wNGOpWa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:9:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:8:
>> include/linux/asi.h:5:10: fatal error: 'asm/pgtable_types.h' file not found
       5 | #include <asm/pgtable_types.h>
         |          ^~~~~~~~~~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:182: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=4226938587
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=4226938587
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=4226938587
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=4226938587
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +5 include/linux/asi.h

     4	
   > 5	#include <asm/pgtable_types.h>
     6	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
