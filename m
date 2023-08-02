Received: from mgamail.intel.com (unknown [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CED9EBB;
	Wed,  2 Aug 2023 06:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690958298; x=1722494298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=06s6IXT38pDIEvuOZNt5UOvKSjWFDSzTRJ2afpvCZJY=;
  b=GH31+cGN4838sk4BN/FNf8uSvmX0dn8TM8AdjPxg+Q0RBqOOnDPScA30
   JEij/inC+LcdHXzMNhZswuOdpSG4dSjCoCw6Lh2dL0QMQh1p5QZc0cxGV
   wZ//Os+7kHLckQjNJozvs7fNEOjejpmQFFxZW48njpe/YQvZuS0rfwj4X
   Tgbl6csQFPx7gIF2nNldd1wGOXER3LZAGioHsIM7tHozOKxN+uFlK0Gfp
   SfpJWIdu61Jwx9XfLbdI3oUNOK/uHrdQnqSs8NiUidOyKBTOaxGTmoaGf
   NwgPqnZHb5eFk2wf5sHpE05lI52FA9wv8dXkt4e2CSCGQIQ4hNlqAZhcM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="372227786"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="372227786"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 23:38:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="975564207"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="975564207"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Aug 2023 23:38:15 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qR5Us-0000x9-2a;
	Wed, 02 Aug 2023 06:38:14 +0000
Date: Wed, 2 Aug 2023 14:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Tobin C. Harding" <tobin@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.19.y 5172/9999] lib/string.c:312:7: error:
 redefinition of 'stpcpy'
Message-ID: <202308021401.lhJd2bLx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tobin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   767049cead76cf699707290d5aeefb3e4d0d5b43
commit: 2a3687034e47c51cd4f01ce82ed16f1964008b9e [5172/9999] lib/string: Add strscpy_pad() function
config: x86_64-randconfig-x003-20230731 (https://download.01.org/0day-ci/archive/20230802/202308021401.lhJd2bLx-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308021401.lhJd2bLx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308021401.lhJd2bLx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/string.c:312:7: error: redefinition of 'stpcpy'
   char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
         ^
   lib/string.c:255:7: note: previous definition is here
   char *stpcpy(char *__restrict__ dest, const char *__restrict__ src)
         ^
   lib/string.c:318:1: error: redefinition of '__kstrtab_stpcpy'
   EXPORT_SYMBOL(stpcpy);
   ^
   include/linux/export.h:124:2: note: expanded from macro 'EXPORT_SYMBOL'
           __EXPORT_SYMBOL(sym, "")
           ^
   include/linux/export.h:120:25: note: expanded from macro '__EXPORT_SYMBOL'
   #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                           ^
   include/linux/export.h:81:20: note: expanded from macro '___EXPORT_SYMBOL'
           static const char __kstrtab_##sym[]                             \
                             ^
   <scratch space>:220:1: note: expanded from here
   __kstrtab_stpcpy
   ^
   lib/string.c:261:1: note: previous definition is here
   EXPORT_SYMBOL(stpcpy);
   ^
   include/linux/export.h:124:2: note: expanded from macro 'EXPORT_SYMBOL'
           __EXPORT_SYMBOL(sym, "")
           ^
   include/linux/export.h:120:25: note: expanded from macro '__EXPORT_SYMBOL'
   #define __EXPORT_SYMBOL ___EXPORT_SYMBOL
                           ^
   include/linux/export.h:81:20: note: expanded from macro '___EXPORT_SYMBOL'
           static const char __kstrtab_##sym[]                             \
                             ^
   <scratch space>:202:1: note: expanded from here
   __kstrtab_stpcpy
   ^
   2 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BACKLIGHT_CLASS_DEVICE
   Depends on [n]: HAS_IOMEM [=y] && BACKLIGHT_LCD_SUPPORT [=n]
   Selected by [m]:
   - DRM_GMA500 [=m] && HAS_IOMEM [=y] && DRM [=m] && PCI [=y] && X86 [=y] && MMU [=y] && ACPI [=y]


vim +/stpcpy +312 lib/string.c

2a3687034e47c5 Tobin C. Harding               2019-04-05  295  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  296  #ifndef __HAVE_ARCH_STRCAT
^1da177e4c3f41 Linus Torvalds                 2005-04-16  297  /**
^1da177e4c3f41 Linus Torvalds                 2005-04-16  298   * strcat - Append one %NUL-terminated string to another
^1da177e4c3f41 Linus Torvalds                 2005-04-16  299   * @dest: The string to be appended to
^1da177e4c3f41 Linus Torvalds                 2005-04-16  300   * @src: The string to append to it
^1da177e4c3f41 Linus Torvalds                 2005-04-16  301   */
0c28130b5c9e8f Paolo 'Blaisorblade' Giarrusso 2005-05-05  302  #undef strcat
^1da177e4c3f41 Linus Torvalds                 2005-04-16  303  char *strcat(char *dest, const char *src)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  304  {
^1da177e4c3f41 Linus Torvalds                 2005-04-16  305  	char *tmp = dest;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  306  
^1da177e4c3f41 Linus Torvalds                 2005-04-16  307  	while (*dest)
^1da177e4c3f41 Linus Torvalds                 2005-04-16  308  		dest++;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  309  	while ((*dest++ = *src++) != '\0')
^1da177e4c3f41 Linus Torvalds                 2005-04-16  310  		;
^1da177e4c3f41 Linus Torvalds                 2005-04-16  311  	return tmp;
^1da177e4c3f41 Linus Torvalds                 2005-04-16 @312  }
^1da177e4c3f41 Linus Torvalds                 2005-04-16  313  EXPORT_SYMBOL(strcat);
^1da177e4c3f41 Linus Torvalds                 2005-04-16  314  #endif
^1da177e4c3f41 Linus Torvalds                 2005-04-16  315  

:::::: The code at line 312 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
