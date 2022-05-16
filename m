Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBCB7A
	for <llvm@lists.linux.dev>; Mon, 16 May 2022 06:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652682884; x=1684218884;
  h=date:from:cc:subject:message-id:mime-version;
  bh=bU9N5vWuOm8/HcrBuvzPEua2XgnlPCmU6XK9h6GCSzo=;
  b=Qrdk1kPxXt9DnzP6cWwFu+I7NPc74Z5gAGDaIJ9O5NrFAMOP7Gu75oXV
   S5purdlQMpK7wv4szAjEkPmi7EKZ352NdzWpSw9/9+EzGC2180+0FltTC
   vXBYjYf8dn3/t/lgO2K6ZO2BSpI23adY80m2nZz1NMbqtqByNUwCnf99s
   dkWePZBLDyEqGK6jrEDDUQZvJBsup8f2RQ8AVywzrI+7H9rr+bpEM0CBg
   aCBQzatAYIs1CbWzc5COT50BLYYffrKt+3DzDvVfM6dJ95Mj7jID3zHci
   KPPlb0WwOOBdheTHObJ9+NimJiYCdxYJAz244YdqKDtkAMRUVgsNBTxZl
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="270443298"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="270443298"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2022 23:34:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; 
   d="scan'208";a="573869882"
Received: from lkp-server01.sh.intel.com (HELO d1462bc4b09b) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 15 May 2022 23:34:41 -0700
Received: from kbuild by d1462bc4b09b with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nqUJU-0002Co-Sq;
	Mon, 16 May 2022 06:34:40 +0000
Date: Mon, 16 May 2022 14:33:50 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: drivers/gpu/drm/radeon/sumo_dpm.o: warning: objtool:
 sumo_dpm_set_power_state() falls through to next function
 sumo_set_forced_mode_enabled()
Message-ID: <202205161453.9bnOipkM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42226c989789d8da4af1de0c31070c96726d990c
commit: 69d0db01e210e07fe915e5da91b54a867cda040f ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
date:   4 months ago
config: x86_64-buildonly-randconfig-r001-20220516 (https://download.01.org/0day-ci/archive/20220516/202205161453.9bnOipkM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=69d0db01e210e07fe915e5da91b54a867cda040f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 69d0db01e210e07fe915e5da91b54a867cda040f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/sumo_dpm.o: warning: objtool: sumo_dpm_set_power_state() falls through to next function sumo_set_forced_mode_enabled()

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
