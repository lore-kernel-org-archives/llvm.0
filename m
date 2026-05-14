Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B032EB5B8;
	Thu, 14 May 2026 02:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778725524; cv=none; b=BUybVn7WJ9kpCKpQwgWNMtHluZxNPHtjQdDGvtaQ3ukAWCa8Nbn4hY1o1LCr76mYlYgf0H0569803ReTXfk/XEYM5u2vZIJ3AKxZAee9KlCJ/cJlf8Ji4ipvXs1Y4+DyeFKpp6vO0/r/2Ox7dVeIOnc6kMR1zneB+8GCftbE++U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778725524; c=relaxed/simple;
	bh=/pf7isI3byc11rrABu6e8n7Zzxos23Sk/PCCBbiveVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3OQyiRGUUisGHnABIwWgW4LSqpNzuO1hLsmFuR+uknqNyQkDeRFpcfusqDh8OZPElkKsCj1NvL8zwf0lpB5WaEC+2CItZ52G3O0+5Qfo10t5p0kPkDhHbisvcAnxCNTsN9SjCXK4DTrMCKLMYvkdAs4GNcUKbvyGu7P9yQbfWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kvp0Apl7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kvp0Apl7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778725523; x=1810261523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/pf7isI3byc11rrABu6e8n7Zzxos23Sk/PCCBbiveVs=;
  b=Kvp0Apl7NvtZrlOeKA5Vu85pMhSvmpgyH+aNB7iGo4XtzMT2+PM1nE2M
   iWe8wbMoueZVIuXcMVHosJ8mtwoeOgwI9JA097F7+eN2ihLpfe6nLkhQc
   aPkaLImiaimxOgnN3VT7aOqw07b3AKtYsQl1BWBWDLy3eDKMA65pwt04A
   9HOEPDI9icrgKsystv66eaU8p9+RKY7TbmSWxLr73HO1+Kv9Ayn2tdXNn
   rytKb9Zelp6EjXE6Za5vTtq4tA9gBGvFmjSoT1T5BXkCFXoH4c2320UBo
   kBIr7wtRbD3eT0LhW2wy7Tbah/+Uu5aMAWvJz675NW4rs101jG2t5r03O
   g==;
X-CSE-ConnectionGUID: Ep77P6n3RVOq32stHxquXg==
X-CSE-MsgGUID: DiqQNT/nRDqx3zbJ1rgA5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79644667"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="79644667"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 19:25:22 -0700
X-CSE-ConnectionGUID: BBnIGDTxRGOlXd/jFfeYVQ==
X-CSE-MsgGUID: 3Gn9w2a6QSKk7gNLQ9LT1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="231857809"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2026 19:25:20 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNLlE-000000005fP-3wZ4;
	Thu, 14 May 2026 02:25:16 +0000
Date: Thu, 14 May 2026 10:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Subject: Re: [PATCH] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with
 mips.pause
Message-ID: <202605141021.Fw5Aqgfw-lkp@intel.com>
References: <20260511-p8700-wfi-v1-1-099b1d10fcf2@htecgroup.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-p8700-wfi-v1-1-099b1d10fcf2@htecgroup.com>

Hi Aleksa,

kernel test robot noticed the following build errors:

[auto build test ERROR on c369299895a591d96745d6492d4888259b004a9e]

url:    https://github.com/intel-lab-lkp/linux/commits/Aleksa-Paunovic-via-B4-Relay/riscv-Add-ERRATA_MIPS_P8700_WFI-to-replace-WFI-with-mips-pause/20260513-011847
base:   c369299895a591d96745d6492d4888259b004a9e
patch link:    https://lore.kernel.org/r/20260511-p8700-wfi-v1-1-099b1d10fcf2%40htecgroup.com
patch subject: [PATCH] riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with mips.pause
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20260514/202605141021.Fw5Aqgfw-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141021.Fw5Aqgfw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141021.Fw5Aqgfw-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <instantiation>:1:7: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
         ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:25: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                           ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:43: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                             ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:61: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                                               ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:79: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                                                                 ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:97: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                                                                                   ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:115: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                                                                                                     ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^
   <instantiation>:1:133: error: expected instruction format
   .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .insn 0x00501013; .endr
                                                                                                                                       ^
   <instantiation>:10:2: note: while in macro instantiation
    .rept 8; .insn 0x00501013; .endr;
    ^
   <instantiation>:8:2: note: while in macro instantiation
    ALT_NEW_CONTENT 0x127, 1, 1, ".rept 8; .insn 0x00501013; .endr;"
    ^
   arch/riscv/kernel/head.S:201:2: note: while in macro instantiation
    ALTERNATIVE_CFG "wfi; .rept 7; nop; .endr;", ".rept 8; .insn 0x00501013; .endr;", 0x127, 1, 1
    ^

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
