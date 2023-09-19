Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9990B328B1;
	Tue, 19 Sep 2023 14:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695134574; x=1726670574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iSPzEI6ai+IfQ92VJY4BsG+KgWguOThO7IO/TLYrv00=;
  b=V1uf6BEW05GDF6xs6S9D1t9iVpfriUnxIAX948jaGZM3lydYOnG5tNVw
   S7P+gTneSn8KCvUnLutOBPZ1SLb56IQX4a7g5rkRXa0ovI3Md/cpYaxiQ
   T5fnhT4bzILi1ye1azZVUNdeiZ0oF0D15pv3mvILTZBUcGG0Woi0XH2f4
   ChmIQwTRJiFjekdSc1NIOl91EEI8VazU/mKWpmsQsm8KXLphYCmzE9KSb
   ORzB+kk2nlEzOOv050TPSHVL4qxPZ1cQd/ry89Q/ZHy0aanPY354r4KBB
   HKN0TzZq0T21CUACt/gZkPXqFAnP2PnrdNeLiiEWS24rRqiEmfnmgxR2t
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="378850856"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="378850856"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 07:42:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749508232"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="749508232"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 19 Sep 2023 07:42:35 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qibvL-0007TQ-1a;
	Tue, 19 Sep 2023 14:42:03 +0000
Date: Tue, 19 Sep 2023 22:40:57 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>
Subject: warning: unknown warning option '-Wrestrict'
Message-ID: <202309192257.IAbw1lnx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf0f715623872823a72e451243bbf555d10d032
commit: feb843a469fb0ab00d2d23cfb9bcc379791011bb kbuild: add $(CLANG_FLAGS) to KBUILD_CPPFLAGS
date:   4 months ago
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20230919/202309192257.IAbw1lnx-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309192257.IAbw1lnx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309192257.IAbw1lnx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> warning: unknown warning option '-Wrestrict' [-Wunknown-warning-option]
>> warning: unknown warning option '-Wformat-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
>> warning: unknown warning option '-Wformat-truncation' [-Wunknown-warning-option]
>> warning: unknown warning option '-Wstringop-overflow'; did you mean '-Wshift-overflow'? [-Wunknown-warning-option]
   arch/x86/um/user-offsets.c:17:6: warning: no previous prototype for function 'foo' [-Wmissing-prototypes]
      17 | void foo(void)
         |      ^
   arch/x86/um/user-offsets.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      17 | void foo(void)
         | ^
         | static 
   5 warnings generated.
   error: unknown warning option '-Wrestrict' [-Werror,-Wunknown-warning-option]
   error: unknown warning option '-Wformat-overflow'; did you mean '-Wshift-overflow'? [-Werror,-Wunknown-warning-option]
   error: unknown warning option '-Wformat-truncation' [-Werror,-Wunknown-warning-option]
   error: unknown warning option '-Wstringop-overflow'; did you mean '-Wshift-overflow'? [-Werror,-Wunknown-warning-option]
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1
   error: unknown warning option '-Wrestrict' [-Werror,-Wunknown-warning-option]
   error: unknown warning option '-Wformat-overflow'; did you mean '-Wshift-overflow'? [-Werror,-Wunknown-warning-option]
   error: unknown warning option '-Wformat-truncation' [-Werror,-Wunknown-warning-option]
   error: unknown warning option '-Wstringop-overflow'; did you mean '-Wshift-overflow'? [-Werror,-Wunknown-warning-option]
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
