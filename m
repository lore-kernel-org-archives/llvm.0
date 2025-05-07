Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBEA1221288;
	Wed,  7 May 2025 07:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603897; cv=none; b=JXOUUL02IkozYSUVd1Q9k3csw5mKd3ZLTc8EsaJ8qdUGlWupSTm+nPiKnwgb5iVnxxh94p8HNCK/xV4uUCols8J0p0znBThg9tYbUrG91AP6RYE1D1qBOnv2sGhovgokiJQD/MCXxXV7hD+4hwwBxMG9Qr7lO2w4mDsR0nXDE0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603897; c=relaxed/simple;
	bh=L5tux9jpe/E/uV0eLE1RMXcbc4onH7mMxwRoWsmlcXk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HADiJvVOxZ71Skv/z4jnpwXc1RhqTfuQ0RVZmsD/Bm94vbkaSwNa+Ko848sjP5WIHtNbtSaXu7mQMOfhTTjXEeut4uy6xWQZuK6cd5phtYDxkRp/zrHmDmHkqsEDU3+ofha5maFyxAbK0iWzjBbVKQc/NaANbgfXpNcQ73DyWdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q+uDjHig; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+uDjHig"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746603896; x=1778139896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L5tux9jpe/E/uV0eLE1RMXcbc4onH7mMxwRoWsmlcXk=;
  b=Q+uDjHiguP/oaI9DrleCOkaGjAySZYOtXCCAl+07xn4ZQRiFpmgPwQG0
   uDFHb37gn74Ikd7TWiXth71snQ7EpM//dwGcIciMx+Z5Cfb7HpE3DXupW
   O7ainlc4uXk/8bhjI7EKik4je+HdPEBpUGumr/InC23CkegDQIOV7DZ6y
   nccK60Y5p44LADXazBgIkaRqQlpkXnog9kf5DsXgEIP04oLiDP9AVbWAs
   S5EGrPW3nPYsA/d3MBqgZn6N6Q+BGqYmt02AWEn6iAgPLvwMllcsqAGeV
   tI3a+j79urVtwgRjyozk+JhL5W8lpn+N/lDc1xpZh+v7VWj37dAZOG6Gf
   A==;
X-CSE-ConnectionGUID: vlArd0niREeouMnCYpVmeg==
X-CSE-MsgGUID: c+3iNRNWTsSEC4ZXCjpgXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="52133179"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="52133179"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 00:44:53 -0700
X-CSE-ConnectionGUID: Tig9GanzS2uG6aA89nMkTA==
X-CSE-MsgGUID: dwJa1RDHSyiZr/Ra0FYC1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135875083"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2025 00:44:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCZSU-0007LZ-0F;
	Wed, 07 May 2025 07:44:50 +0000
Date: Wed, 7 May 2025 15:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:klp-build 6/38] arch/arm/vdso/note.c:14:1: error: a
 parameter list without types is only allowed in a function definition
Message-ID: <202505071526.fS9tpdhX-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20250507/202505071526.fS9tpdhX-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071526.fS9tpdhX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071526.fS9tpdhX-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/vdso/note.c:14:1: warning: 'const' type qualifier on return type has no effect [-Wignored-qualifiers]
      14 | ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);
         | ^
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:70:9: note: expanded from macro 'ELFNOTE'
      70 |         static const struct {                                           \
         |                ^
>> arch/arm/vdso/note.c:14:1: error: a parameter list without types is only allowed in a function definition
   include/linux/elfnote.h:90:37: note: expanded from macro 'ELFNOTE32'
      90 | #define ELFNOTE32(name, type, desc) ELFNOTE(32, name, type, desc)
         |                                     ^
   include/linux/elfnote.h:76:16: note: expanded from macro 'ELFNOTE'
      76 |         } __UNIQUE_ID(note)                                             \
         |                       ^
>> arch/arm/vdso/note.c:14:1: error: illegal initializer (only variables can be initialized)
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


vim +14 arch/arm/vdso/note.c

20e2fc42312f96 Vincenzo Frascino 2019-11-04  13  
20e2fc42312f96 Vincenzo Frascino 2019-11-04 @14  ELFNOTE32("Linux", 0, LINUX_VERSION_CODE);

:::::: The code at line 14 was first introduced by commit
:::::: 20e2fc42312f960f497ac2d617e3742754e1fa5e ARM: 8930/1: Add support for generic vDSO

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
