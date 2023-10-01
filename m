Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22E6361;
	Sun,  1 Oct 2023 03:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696131693; x=1727667693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LI+6UM5Tv0w36fWduzQn0s5tcys35ZDR2qir42AEbJE=;
  b=T9k3ET1VoEXfGKK9xasf2GJxYtWy7rNFwiFO3iFANbi4OHGs1R0i8VTi
   7uBsIEuzayyBbAv30YH2Q1K+8L6r0UXyU1Z6oOa5OvIMGDproDlfXZBc+
   UqAYMyg5xCn8fyJbGtZiMZIdlbP/FtpBOT/xpFnQsG0tjKAZTDjGta83R
   qTmD6CClJYLILRTnfE51fvpeluPcThIpbSa0tcgUVG1VrlWv9xUiEHJ9l
   kbTfYcEFnMBwqV93IwLcnGFAp+eDkg5jBiumPitXFctRJW3FLP3gZ9f0S
   UHcn0XPbAIv/Ou2JYcyk4GPZg2oAvqYNjkn9W79TZzm1FS6kWK9Du1O7R
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="446645790"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="446645790"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 20:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10849"; a="753744301"
X-IronPort-AV: E=Sophos;i="6.03,191,1694761200"; 
   d="scan'208";a="753744301"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Sep 2023 20:41:31 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmnKj-0004iz-0T;
	Sun, 01 Oct 2023 03:41:29 +0000
Date: Sun, 1 Oct 2023 11:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:uti260b 4/24] drivers/media/i2c/gc0308.c:1261:27: warning:
 unused variable 'gc0308_effects_menu'
Message-ID: <202310011156.ycairb2f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git uti260b
head:   4e145d94d9d20e457f5aa3d51e765f7b1dd78a22
commit: 6c27014c45ea572d49dd42bb79b0ecb1fca39c33 [4/24] media: i2c: gc0308: new driver
config: powerpc64-allyesconfig (https://download.01.org/0day-ci/archive/20231001/202310011156.ycairb2f-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231001/202310011156.ycairb2f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310011156.ycairb2f-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/i2c/gc0308.c:1261:27: warning: unused variable 'gc0308_effects_menu' [-Wunused-const-variable]
    1261 | static const char * const gc0308_effects_menu[] = {
         |                           ^
   1 warning generated.


vim +/gc0308_effects_menu +1261 drivers/media/i2c/gc0308.c

  1260	
> 1261	static const char * const gc0308_effects_menu[] = {
  1262		"Normal", // V4L2_COLORFX_NONE = 0
  1263		"Grayscale", // V4L2_COLORFX_BW = 1
  1264		"Sepia", // V4L2_COLORFX_SEPIA = 2
  1265		"Color Invert", // V4L2_COLORFX_NEGATIVE = 3
  1266	};
  1267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
