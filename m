Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440041FE455;
	Wed,  7 May 2025 05:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746596995; cv=none; b=BA3D9U8X8MnjbiOx4ZcyfSxV5coVD3AHHUNovD+sX0/qa7xazMVTD3qqROs3AV4t8JvOA5VYOJgWxLszTVhoRS2BH9FL1n9hlEckLw8wZ+Jxcre1NylbiJZ/yV5+vjY9htVJTdPCFFG1eSE3X/RaSl+koAP+A1D8cbpAeuR4nM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746596995; c=relaxed/simple;
	bh=K0ZdZOF8oxlLKY05qGf4a1uOhr3KI/ilO2WnO2SkbjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WFTHu5Z1sU40B1uHHVge8L01S9yTXFgQNwTnuUqPnsH1xnhvG5bB9woVaJbVcgx7WBEkrJChp1XjKzADlOf5i8ADpaILEd02rRDOcWU+fMAm+geOD9xkRj71Z9xR4AL33hYGyNl3IPk7WlfgEyVgJBrYch1cfAaevjRGxeNR0F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DoINva+7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DoINva+7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746596994; x=1778132994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K0ZdZOF8oxlLKY05qGf4a1uOhr3KI/ilO2WnO2SkbjU=;
  b=DoINva+7LEmpvF2Sy36Hcha2HJWgqC1DhyzGSwfZMipdT+9vtJQ3OV5y
   cmOC0YoD6em59YjgNj+sBtDnGSQtKOkHRHF3kBF6Qzs2u23TIMjTlaYRb
   USNun1zlrJT8I45QSS+sRcGvxUn2gZ942PiPc54lfjLM78cIvVlrr2DD4
   0djXuqA7CVVuMNCWqQge25Mg1vDxR1woTUDqhgZRCcy2mll4KvMqKk3uZ
   v9e3QA9zHy0Js5L6UEWPB2SYVHtImwnzYGFGQeNt6JXvev9p//btR0D6X
   QXOVYvR/V3V9E5cv9JJ/Lqy2TEO/BJwWAHvP7o97abAI40wqTNdyodKuI
   A==;
X-CSE-ConnectionGUID: wY1JBCkpS86AIQaiYjCS3Q==
X-CSE-MsgGUID: TqN9f56aR/Glk4iFWRozMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52120525"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52120525"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 22:49:50 -0700
X-CSE-ConnectionGUID: 1wwIYz7UQW6PO0IJxLueIg==
X-CSE-MsgGUID: OxNPxtWLSlGKVKGp5nmwYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="140580419"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 May 2025 22:49:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCXf8-00077c-2Y;
	Wed, 07 May 2025 05:49:46 +0000
Date: Wed, 7 May 2025 13:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 6/38] arch/arm/vdso/note.c:14:1: warning:
 'const' type qualifier on return type has no effect
Message-ID: <202505071317.xEwm3WSw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git klp-build
head:   efc6506f59755cae4a370a151466c8d3e9e63fa4
commit: a9935a943de283a32d11dbdbc95da2af1b9768c3 [6/38] elfnote: Use __UNIQUE_ID() for note symbols
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250507/202505071317.xEwm3WSw-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071317.xEwm3WSw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071317.xEwm3WSw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/vdso/note.c:14:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:70:9: note: expanded from macro 'ELFNOTE'
      70 |         static const struct {                                           \
         |                ^
   arch/arm/vdso/note.c:14:1: error: a parameter list without types is only allowed in a function definition
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:76:16: note: expanded from macro 'ELFNOTE'
      76 |         } __UNIQUE_ID(note)                                             \
         |                       ^
   arch/arm/vdso/note.c:14:1: error: illegal initializer (only variables can be initialized)
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:76:4: note: expanded from macro 'ELFNOTE'
      76 |         } __UNIQUE_ID(note)                                             \
         |           ^
   arch/arm/vdso/note.c:15:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      15 | BUILD_SALT;
         | ^
   include/linux/build-salt.h:16:8: note: expanded from macro 'BUILD_SALT'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:70:9: note: expanded from macro 'ELFNOTE'
      70 |         static const struct {                                           \
         |                ^
   arch/arm/vdso/note.c:15:1: error: a parameter list without types is only allowed in a function definition
   include/linux/build-salt.h:16:8: note: expanded from macro 'BUILD_SALT'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:76:16: note: expanded from macro 'ELFNOTE'
      76 |         } __UNIQUE_ID(note)                                             \
         |                       ^
   arch/arm/vdso/note.c:15:1: error: illegal initializer (only variables can be initialized)
   include/linux/build-salt.h:16:8: note: expanded from macro 'BUILD_SALT'
      16 |        ELFNOTE32("Linux", LINUX_ELFNOTE_BUILD_SALT, CONFIG_BUILD_SALT)
         |        ^
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:76:4: note: expanded from macro 'ELFNOTE'
      76 |         } __UNIQUE_ID(note)                                             \
         |           ^
   2 warnings and 4 errors generated.


vim +/const +14 arch/arm/vdso/note.c

20e2fc42312f96 Vincenzo Frascino 2019-11-04  13  
20e2fc42312f96 Vincenzo Frascino 2019-11-04 @14  ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);

:::::: The code at line 14 was first introduced by commit
:::::: 20e2fc42312f960f497ac2d617e3742754e1fa5e ARM: 8930/1: Add support for generic vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
