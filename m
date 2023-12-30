Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAEB63B;
	Sat, 30 Dec 2023 00:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoQAPJyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703897457; x=1735433457;
  h=date:from:cc:subject:message-id:mime-version;
  bh=K/1CdXtWiEKrXcnLpYO1ovfsrkYnhJ01etEtbo33Fco=;
  b=LoQAPJyh9CRNaJfnkQFmK18C7ew5LilkL6R4gdPbT3P9mpQZL9Jow1Dn
   bU9iPi1gqEB9OGHTzM5ngC6s4Jf06Dnotzo7WaVtWBKAuPJv3009PDb8f
   OHd3h9y5L/6NjxL9DJiQEqlOh5/T9DW5ExUDmmptWo5xx2pbEaID1VZ3Y
   4bn9Vbtwgfwl9XZFZizJcjkqjAy0Aey+emJfSMDM8fHIYDO5v9MPV37SM
   cedYdz5n++ZdzU7URO1wAtBVIFQa+t/suUmy+1dRWbztHOvZUpHXSs+0L
   s4yYgNBVN76D0XQgtOGap3xeSOn8jmvQ4ZU/lwMLZqYHyt0OZtkmheG4k
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="482869606"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="482869606"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2023 16:50:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10938"; a="778917650"
X-IronPort-AV: E=Sophos;i="6.04,316,1695711600"; 
   d="scan'208";a="778917650"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 29 Dec 2023 16:50:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJNYy-000HwJ-23;
	Sat, 30 Dec 2023 00:50:52 +0000
Date: Sat, 30 Dec 2023 08:50:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/video/fbdev/sis/init301.o: warning: objtool:
 SiS_GetCRT2Ptr+0x1b0: stack state mismatch: cfa1=4+8 cfa2=4+16
Message-ID: <202312300834.VM19gkmO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f016f7547aeedefed9450499d002ba983b8fce15
commit: be2f0b1e12644c956a347d7fde93c2ffe9cdb1af objtool: Get rid of reloc->jump_table_start
date:   7 months ago
config: x86_64-randconfig-015-20231230 (https://download.01.org/0day-ci/archive/20231230/202312300834.VM19gkmO-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231230/202312300834.VM19gkmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312300834.VM19gkmO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/sis/init301.c:2688:24: warning: variable 'modeflag' set but not used [-Wunused-but-set-variable]
    2688 |   unsigned short i, j, modeflag, tempah=0;
         |                        ^
   drivers/video/fbdev/sis/init301.c:6234:52: warning: variable 'resinfo' set but not used [-Wunused-but-set-variable]
    6234 |   unsigned short  pushbx=0, CRT1Index=0, modeflag, resinfo=0;
         |                                                    ^
   drivers/video/fbdev/sis/init301.c:176:28: warning: unused variable 'SiS_Part2CLVX_1' [-Wunused-const-variable]
     176 | static const unsigned char SiS_Part2CLVX_1[] = {
         |                            ^~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:184:28: warning: unused variable 'SiS_Part2CLVX_2' [-Wunused-const-variable]
     184 | static const unsigned char SiS_Part2CLVX_2[] = {
         |                            ^~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:192:28: warning: unused variable 'SiS_Part2CLVX_3' [-Wunused-const-variable]
     192 | static const unsigned char SiS_Part2CLVX_3[] = {  /* NTSC, 525i, 525p */
         |                            ^~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:211:28: warning: unused variable 'SiS_Part2CLVX_4' [-Wunused-const-variable]
     211 | static const unsigned char SiS_Part2CLVX_4[] = {   /* PAL */
         |                            ^~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:230:28: warning: unused variable 'SiS_Part2CLVX_5' [-Wunused-const-variable]
     230 | static const unsigned char SiS_Part2CLVX_5[] = {   /* 750p */
         |                            ^~~~~~~~~~~~~~~
   drivers/video/fbdev/sis/init301.c:239:28: warning: unused variable 'SiS_Part2CLVX_6' [-Wunused-const-variable]
     239 | static const unsigned char SiS_Part2CLVX_6[] = {   /* 1080i */
         |                            ^~~~~~~~~~~~~~~
   8 warnings generated.
>> drivers/video/fbdev/sis/init301.o: warning: objtool: SiS_GetCRT2Ptr+0x1b0: stack state mismatch: cfa1=4+8 cfa2=4+16

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_I915_DEBUG_GEM
   Depends on [n]: HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && DRM_I915_WERROR [=n]
   Selected by [m]:
   - DRM_I915_DEBUG [=y] && HAS_IOMEM [=y] && DRM_I915 [=m] && EXPERT [=y] && !COMPILE_TEST [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
