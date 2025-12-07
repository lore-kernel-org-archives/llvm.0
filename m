Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1A82882DE;
	Sun,  7 Dec 2025 09:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765098276; cv=none; b=O/E6nMIJfCzFPE8otf6/l/m5i4t3MkSgYrwYx60xheqiIxgJntCGOY0UhhFSMZFCpMTSf6kqmN4o7fpHjDzbBWOs4UzGaWrGPFVY5kuPO6m2OATq0HgqglMiwHP1QcIyf5nFMvP0uw6bJoc4+A/FrJVV+Lgg/UtDcEGxejP6gGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765098276; c=relaxed/simple;
	bh=KTiVpwRTsGHaAgvB/ZLburhsR8iN01v+o02lz27PEMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NjT+crNFlItzrwLpMrEdWzQgs7l0AneFVn6D+3R10+sX7un8dEQuqoYUsoFRO/EneHeZkcVAnbGIAlgKzOtSD4pa56yKukGA5tPzgmpWY7VascUvmoulDHj//Ur72973WdzNvGBP5KcBknUAM+zGio9RpZvAnqMVuq566qP9QNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EonuocYw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EonuocYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765098274; x=1796634274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KTiVpwRTsGHaAgvB/ZLburhsR8iN01v+o02lz27PEMU=;
  b=EonuocYwNBntwF96Ty8LRiEO8lhs5uws5eE53F+0lttjVoycsUvb16LX
   oKyb58d2UJwEzdQVnlByNhSuAXzC1tPDpg4z327ErbInjYWGwgAPnlhw9
   Jra2skQSDBYnSlhZISfRqSQnwxTxw3fbI0X83PvuiNSOjhHUQoxJ4W740
   7s0gF1VeEMKYqHgoOs9+2sJbVRgvxHI8gI6IHGPlUC+WrE4iiGMd7kNzb
   E8+G+PmFSAVkWFCkndpsAhrnBJKpyAq7iqpsJzybT+X+gsxhm0X7sleTK
   GFQpxq4qxRIzlypNCHGBrdBJrIOuhB8PrKlM8o+7qpS5U8odR5ZPafDmH
   w==;
X-CSE-ConnectionGUID: Yh/dpS1mQ8q3rZRWJjbr1g==
X-CSE-MsgGUID: KHQ1f5NSQgyYa8yiTBU+Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="70687129"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="70687129"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2025 01:04:34 -0800
X-CSE-ConnectionGUID: 2TmQ6pYgSoSQCm701wKoEg==
X-CSE-MsgGUID: XjD+hlEPQMulQdp9DN9McQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="195301344"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Dec 2025 01:04:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSAgw-00000000J9V-11Ut;
	Sun, 07 Dec 2025 09:04:30 +0000
Date: Sun, 7 Dec 2025 17:03:57 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:alternative-macro 5/8] include/linux/annotate.h:32:1:
 error: type specifier missing, defaults to 'int'; ISO C99 and later do not
 support implicit int
Message-ID: <202512071645.OJU1fHw1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git alternative-macro
head:   051df5c21cbf6d9ac396c22b3ab3c51d73c0def7
commit: 28e63e2c890661dc9bcdbe172eba06b26220d455 [5/8] objtool: Convert annotations to assembler macros
config: loongarch-randconfig-002-20251207 (https://download.01.org/0day-ci/archive/20251207/202512071645.OJU1fHw1-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251207/202512071645.OJU1fHw1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512071645.OJU1fHw1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/bounds.c:11:
   In file included from include/linux/page-flags.h:10:
   In file included from include/linux/bug.h:5:
   In file included from arch/loongarch/include/asm/bug.h:7:
   In file included from include/linux/objtool.h:6:
>> include/linux/annotate.h:32:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      32 | DEFINE_MACRO(__ANNOTATE);
         | ^
         | int
>> include/linux/annotate.h:32:14: error: a parameter list without types is only allowed in a function definition
      32 | DEFINE_MACRO(__ANNOTATE);
         |              ^
   include/linux/annotate.h:33:14: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      33 | DEFINE_MACRO(ANNOTATE(NOENDBR));
         |              ^
         |              int
   include/linux/annotate.h:33:23: error: a parameter list without types is only allowed in a function definition
      33 | DEFINE_MACRO(ANNOTATE(NOENDBR));
         |                       ^
   include/linux/annotate.h:33:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      33 | DEFINE_MACRO(ANNOTATE(NOENDBR));
         | ^
         | int
   include/linux/annotate.h:34:14: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      34 | DEFINE_MACRO(ANNOTATE(RETPOLINE_SAFE));
         |              ^
         |              int
   include/linux/annotate.h:34:23: error: a parameter list without types is only allowed in a function definition
      34 | DEFINE_MACRO(ANNOTATE(RETPOLINE_SAFE));
         |                       ^
   include/linux/annotate.h:34:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      34 | DEFINE_MACRO(ANNOTATE(RETPOLINE_SAFE));
         | ^
         | int
   include/linux/annotate.h:35:14: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      35 | DEFINE_MACRO(ANNOTATE(INSTR_BEGIN));
         |              ^
         |              int
   include/linux/annotate.h:35:23: error: a parameter list without types is only allowed in a function definition
      35 | DEFINE_MACRO(ANNOTATE(INSTR_BEGIN));
         |                       ^
   include/linux/annotate.h:35:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      35 | DEFINE_MACRO(ANNOTATE(INSTR_BEGIN));
         | ^
         | int
   include/linux/annotate.h:36:14: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      36 | DEFINE_MACRO(ANNOTATE(INSTR_END));
         |              ^
         |              int
   include/linux/annotate.h:36:23: error: a parameter list without types is only allowed in a function definition
      36 | DEFINE_MACRO(ANNOTATE(INSTR_END));
         |                       ^
   include/linux/annotate.h:36:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      36 | DEFINE_MACRO(ANNOTATE(INSTR_END));
         | ^
         | int
   include/linux/annotate.h:37:14: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      37 | DEFINE_MACRO(ANNOTATE(IGNORE_ALTERNATIVE));
         |              ^
         |              int
   include/linux/annotate.h:37:23: error: a parameter list without types is only allowed in a function definition
      37 | DEFINE_MACRO(ANNOTATE(IGNORE_ALTERNATIVE));
         |                       ^
   include/linux/annotate.h:37:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      37 | DEFINE_MACRO(ANNOTATE(IGNORE_ALTERNATIVE));
         | ^
         | int
   include/linux/annotate.h:38:14: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      38 | DEFINE_MACRO(ANNOTATE(INTRA_FUNCTION_CALL));
         |              ^
         |              int
   include/linux/annotate.h:38:23: error: a parameter list without types is only allowed in a function definition
      38 | DEFINE_MACRO(ANNOTATE(INTRA_FUNCTION_CALL));
         |                       ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
   make[3]: *** [scripts/Makefile.build:182: kernel/bounds.s] Error 1 shuffle=3358751018
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1283: prepare0] Error 2 shuffle=3358751018
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3358751018
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3358751018
   make: Target 'prepare' not remade because of errors.


vim +/int +32 include/linux/annotate.h

    31	
  > 32	DEFINE_MACRO(__ANNOTATE);
    33	DEFINE_MACRO(ANNOTATE(NOENDBR));
    34	DEFINE_MACRO(ANNOTATE(RETPOLINE_SAFE));
    35	DEFINE_MACRO(ANNOTATE(INSTR_BEGIN));
    36	DEFINE_MACRO(ANNOTATE(INSTR_END));
    37	DEFINE_MACRO(ANNOTATE(IGNORE_ALTERNATIVE));
    38	DEFINE_MACRO(ANNOTATE(INTRA_FUNCTION_CALL));
    39	DEFINE_MACRO(ANNOTATE(UNRET_BEGIN));
    40	DEFINE_MACRO(ANNOTATE(REACHABLE));
    41	DEFINE_MACRO(ANNOTATE(NOCFI));
    42	DEFINE_MACRO(ANNOTATE_DATA(DATA_SPECIAL));
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
