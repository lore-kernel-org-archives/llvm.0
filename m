Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF821A47;
	Sun, 17 Dec 2023 01:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i1qtMYRG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702777993; x=1734313993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mvmno45SUaf+lUX97G/YRDOTLbKVqRSMcuT5pizlEhk=;
  b=i1qtMYRGqW3D5CiZWspGcojMAUN+KRje9PXMml5VTHLvf4C9cPe7D8h4
   dSxB/gUOJlKZYER3o3ueL6IN+KQPku2Sl3Qkk+RUjJhscVACRdCbx+C6E
   9go+D/OoDnMSVD7HvFNH6nhrCwzwr/thqgjC0/X8E1QZLI8MVtMCYfS1X
   fy7vek4grL9O8qgR7e7t3YqoyToH1LpDX3xsAYUZ+OdP4ioHpunMxAdhW
   AeULsvw7fNTuV8lFGE4z+1BPZbK0oRrJ/PiHpSCAOcrXz+DCe0wyNaXN4
   IIhPbW3y954Ypdkd31B5nKNvI2EcrObpUOB4irNyAS27voIAd3Rm4MjmL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="461853618"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="461853618"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 17:53:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="845536132"
X-IronPort-AV: E=Sophos;i="6.04,282,1695711600"; 
   d="scan'208";a="845536132"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Dec 2023 17:53:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEgL5-0002Tv-0q;
	Sun, 17 Dec 2023 01:53:07 +0000
Date: Sun, 17 Dec 2023 09:52:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 50/61] include/linux/console.h:36:2: error:
 expected identifier
Message-ID: <202312170941.HOLDO4AL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   29f593717f831f4fe1c36efd2d1b0404f705bc0f
commit: 9138c2328ccc3a9bc4868c7a74b1539036a92501 [50/61] con: use enum for VESA blanking modes
config: i386-buildonly-randconfig-003-20231217 (https://download.01.org/0day-ci/archive/20231217/202312170941.HOLDO4AL-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170941.HOLDO4AL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170941.HOLDO4AL-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/video/fbdev/gxt4500.c:13:
>> include/linux/console.h:36:2: error: expected identifier
           VESA_NO_BLANKING        = 0,
           ^
   include/uapi/linux/fb.h:297:33: note: expanded from macro 'VESA_NO_BLANKING'
   #define VESA_NO_BLANKING        0
                                   ^
   In file included from drivers/video/fbdev/gxt4500.c:13:
   include/linux/console.h:37:2: error: expected identifier
           VESA_VSYNC_SUSPEND      = 1,
           ^
   include/uapi/linux/fb.h:298:33: note: expanded from macro 'VESA_VSYNC_SUSPEND'
   #define VESA_VSYNC_SUSPEND      1
                                   ^
   In file included from drivers/video/fbdev/gxt4500.c:13:
   include/linux/console.h:38:2: error: expected identifier
           VESA_HSYNC_SUSPEND      = 2,
           ^
   include/uapi/linux/fb.h:299:33: note: expanded from macro 'VESA_HSYNC_SUSPEND'
   #define VESA_HSYNC_SUSPEND      2
                                   ^
   In file included from drivers/video/fbdev/gxt4500.c:13:
   include/linux/console.h:39:2: error: expected identifier
           VESA_POWERDOWN          = VESA_VSYNC_SUSPEND | VESA_HSYNC_SUSPEND,
           ^
   include/uapi/linux/fb.h:300:33: note: expanded from macro 'VESA_POWERDOWN'
   #define VESA_POWERDOWN          3
                                   ^
   4 errors generated.
--
   In file included from drivers/video/fbdev/matrox/g450_pll.c:17:
   In file included from drivers/video/fbdev/matrox/g450_pll.h:5:
   In file included from drivers/video/fbdev/matrox/matroxfb_base.h:37:
>> include/linux/console.h:36:2: error: expected identifier
           VESA_NO_BLANKING        = 0,
           ^
   include/uapi/linux/fb.h:297:33: note: expanded from macro 'VESA_NO_BLANKING'
   #define VESA_NO_BLANKING        0
                                   ^
   In file included from drivers/video/fbdev/matrox/g450_pll.c:17:
   In file included from drivers/video/fbdev/matrox/g450_pll.h:5:
   In file included from drivers/video/fbdev/matrox/matroxfb_base.h:37:
   include/linux/console.h:37:2: error: expected identifier
           VESA_VSYNC_SUSPEND      = 1,
           ^
   include/uapi/linux/fb.h:298:33: note: expanded from macro 'VESA_VSYNC_SUSPEND'
   #define VESA_VSYNC_SUSPEND      1
                                   ^
   In file included from drivers/video/fbdev/matrox/g450_pll.c:17:
   In file included from drivers/video/fbdev/matrox/g450_pll.h:5:
   In file included from drivers/video/fbdev/matrox/matroxfb_base.h:37:
   include/linux/console.h:38:2: error: expected identifier
           VESA_HSYNC_SUSPEND      = 2,
           ^
   include/uapi/linux/fb.h:299:33: note: expanded from macro 'VESA_HSYNC_SUSPEND'
   #define VESA_HSYNC_SUSPEND      2
                                   ^
   In file included from drivers/video/fbdev/matrox/g450_pll.c:17:
   In file included from drivers/video/fbdev/matrox/g450_pll.h:5:
   In file included from drivers/video/fbdev/matrox/matroxfb_base.h:37:
   include/linux/console.h:39:2: error: expected identifier
           VESA_POWERDOWN          = VESA_VSYNC_SUSPEND | VESA_HSYNC_SUSPEND,
           ^
   include/uapi/linux/fb.h:300:33: note: expanded from macro 'VESA_POWERDOWN'
   #define VESA_POWERDOWN          3
                                   ^
   drivers/video/fbdev/matrox/g450_pll.c:410:18: warning: variable 'mnp' set but not used [-Wunused-but-set-variable]
                                   unsigned int mnp;
                                                ^
   1 warning and 4 errors generated.


vim +36 include/linux/console.h

    33	
    34	/* Note: fbcon defines the below as macros for userspace (in fb.h). */
    35	enum vesa_blank_mode {
  > 36		VESA_NO_BLANKING	= 0,
    37		VESA_VSYNC_SUSPEND	= 1,
    38		VESA_HSYNC_SUSPEND	= 2,
    39		VESA_POWERDOWN		= VESA_VSYNC_SUSPEND | VESA_HSYNC_SUSPEND,
    40		VESA_BLANK_MAX		= VESA_POWERDOWN,
    41	};
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
