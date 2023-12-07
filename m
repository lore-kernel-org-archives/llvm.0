Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAA83D0A9;
	Thu,  7 Dec 2023 12:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VG2pX0DB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701953146; x=1733489146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WANftC6vGgWkzvKQzOL4++YVO4G6mp7Ssn47vXs+fvw=;
  b=VG2pX0DBXTSHrvbhYv4qNRerHxT+YihteroCizaK4RpTKvJF3uS6GeGQ
   g6GZ786FoDjvTWgLNbvAZa5fIDlw8bg2vYLzmox70VN4a96WlOQ71HE2J
   bsdHJRVtGemm2zSiYAx6M+WeiGCAd/jQh15KeHxWnSfaIqsFPSGJU/pZU
   aBCjyImtlr7c7Ro0las1Og46kgkHGwGN0ejebUNm8UtD0fG9TakpVY684
   Xw+WM5Cu03dOsf5LWJIuLT3A4qNzc9J7wOjEihPkpyQyuv/C+IXTcoq2Q
   anea3/ybvFHptUgwITOJSTNOAKHm0i3jFq7fNQgoU8NDhU0r4BcRk6bDP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="458546468"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="458546468"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 04:45:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="889731743"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889731743"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 04:45:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBDl7-000CFC-2D;
	Thu, 07 Dec 2023 12:45:41 +0000
Date: Thu, 7 Dec 2023 20:44:54 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 5474/5882] fs/ntfs3/ntfs.h:530:1: error: static
 assertion failed due to requirement 'sizeof(struct ATTR_LIST_ENTRY) == 32':
 sizeof(struct ATTR_LIST_ENTRY) == 0x20
Message-ID: <202312072005.RcYtBUSp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e00ce02066e8f6f1ad5eab49a2ede7bf7a5ef64
commit: d155617006ebc172a80d3eb013c4b867f9a8ada4 [5474/5882] fs/ntfs3: Fix detected field-spanning write (size 8) of single field "le->name"
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231207/202312072005.RcYtBUSp-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312072005.RcYtBUSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072005.RcYtBUSp-lkp@intel.com/

All errors (new ones prefixed by >>):

   warning: unknown warning option '-Wold-style-declaration'; did you mean '-Wout-of-line-declaration'? [-Wunknown-warning-option]
   In file included from fs/ntfs3/attrib.c:14:
>> fs/ntfs3/ntfs.h:530:1: error: static assertion failed due to requirement 'sizeof(struct ATTR_LIST_ENTRY) == 32': sizeof(struct ATTR_LIST_ENTRY) == 0x20
   static_assert(sizeof(struct ATTR_LIST_ENTRY) == 0x20);
   ^             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:77:34: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                    ^               ~~~~
   include/linux/build_bug.h:78:41: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                           ^              ~~~~
   fs/ntfs3/ntfs.h:530:46: note: expression evaluates to '28 == 32'
   static_assert(sizeof(struct ATTR_LIST_ENTRY) == 0x20);
                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/linux/build_bug.h:77:50: note: expanded from macro 'static_assert'
   #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
                                                    ^~~~
   include/linux/build_bug.h:78:56: note: expanded from macro '__static_assert'
   #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
                                                          ^~~~
   1 warning and 1 error generated.


vim +530 fs/ntfs3/ntfs.h

4534a70b7056fd Konstantin Komarov 2021-08-13  529  
4534a70b7056fd Konstantin Komarov 2021-08-13 @530  static_assert(sizeof(struct ATTR_LIST_ENTRY) == 0x20);
4534a70b7056fd Konstantin Komarov 2021-08-13  531  

:::::: The code at line 530 was first introduced by commit
:::::: 4534a70b7056fd4b9a1c6db5a4ce3c98546b291e fs/ntfs3: Add headers and misc files

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
