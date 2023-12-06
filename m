Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5206AA1;
	Wed,  6 Dec 2023 02:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZhA35QA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701830841; x=1733366841;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Ixwvo+egK2y3bXIOAJjzwITO2pWTI2O/Xgq8OecP0qw=;
  b=ZhA35QA+CHCcA0fhuqfdElqDlvL0qP1JZrPDGsen8WgAVrnzMQiqinXc
   RMANigwWuqQK+8BVNAc3aSPGud2lj4oMpMkJ0QxZ4QLd9ly5XXKnPb74u
   MAgcIcZWRbANRkFR5vX1z349tOFHJ/+BXE+XgZob30tzXs2wWJuj1uxJ3
   wHoNAhu3P4LAVKsRqigB8zxLdn9iB6LyqNP7NMfTh5mraxORJBvqOPG1m
   DgPRdi2ASHwpB9rKrDfKDCqxsrLVS0PEe2w5OB0EnTuhFA7h5GbCCQiGy
   ieKRDWNi1NSQIUm9qJU0rAIX+WPF8qxlxNYvwRWQvI3ylqiCS/IF1q6Z1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1086591"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1086591"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 18:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="771143879"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="771143879"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 05 Dec 2023 18:47:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAhwS-000A7C-1H;
	Wed, 06 Dec 2023 02:47:16 +0000
Date: Wed, 6 Dec 2023 10:46:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: drivers/net/ethernet/jme.o: warning: objtool: jme_check_link() falls
 through to next function jme_powersave_phy()
Message-ID: <202312061033.JFMs51bY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 55c84a5cf2c72a821719823ef2ebef01b119025b fortify: strcat: Move definition to use fortified strlcat()
date:   7 months ago
config: x86_64-randconfig-075-20231202 (https://download.01.org/0day-ci/archive/20231206/202312061033.JFMs51bY-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061033.JFMs51bY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061033.JFMs51bY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/jme.o: warning: objtool: jme_check_link() falls through to next function jme_powersave_phy()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
