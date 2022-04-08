Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98343362
	for <llvm@lists.linux.dev>; Fri,  8 Apr 2022 07:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649403582; x=1680939582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zrp1LCinPGbxnXslarJ2cePZid18+wENiG18pbmG/4=;
  b=DdmoQoENAMgbYlf83YlYQHeGiX34oUAiQOykDZs3SYD2Xl/+z0SdlGZH
   9P5W9LeyzRsth9+Ub2wB1lo8Fm5PDIX/zeVyrsGnuvPr9O4QG55fmLONk
   0Fp28EsNu0MR+wLAWbWlWR9e7DoJ4ypYp8+PBydcrodgnFQxjK2mQ4pXO
   dV+fDC5lRvCGS246BX4QuXIpDVBLUPSJTZU4xqBHZO8glHUKsz0xeAVMT
   JWivNfztC8Qo9qjmXXFKz43qDOBx1wW8UCHsp0HNvxpLCSmAGsXigrbWP
   UFdutxnAB7gPTrtkS1RKi5emBJFo0B5Sdls5Jl8FzdNcXyl9Tx17ekGzm
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="286525173"
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; 
   d="scan'208";a="286525173"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2022 00:39:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,244,1643702400"; 
   d="scan'208";a="794490563"
Received: from lkp-server02.sh.intel.com (HELO a44fdfb70b94) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 08 Apr 2022 00:39:28 -0700
Received: from kbuild by a44fdfb70b94 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ncjDM-0006Az-0o;
	Fri, 08 Apr 2022 07:39:28 +0000
Date: Fri, 8 Apr 2022 15:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: zhanglianjie <zhanglianjie@uniontech.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [mcgrof:sysctl-testing 12/18] mm/page-writeback.c:93:28: warning:
 unused variable 'dirty_bytes_min'
Message-ID: <202204081510.D41wQr6m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git sysctl-testing
head:   7cde53da38a3ea00d75ef6a6ab06fa85b80bcf87
commit: 87125d15aa3c4046e902758a39062f213b3664ad [12/18] mm: move page-writeback sysctls to their own file
config: s390-randconfig-r034-20220406 (https://download.01.org/0day-ci/archive/20220408/202204081510.D41wQr6m-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b306233f78876a1d197ed6e1f05785505de7c63)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/commit/?id=87125d15aa3c4046e902758a39062f213b3664ad
        git remote add mcgrof https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git
        git fetch --no-tags mcgrof sysctl-testing
        git checkout 87125d15aa3c4046e902758a39062f213b3664ad
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/page-writeback.c:93:28: warning: unused variable 'dirty_bytes_min' [-Wunused-const-variable]
   static const unsigned long dirty_bytes_min = 2 * PAGE_SIZE;
                              ^
   1 warning generated.


vim +/dirty_bytes_min +93 mm/page-writeback.c

    91	
    92	/* this is needed for the proc_doulongvec_minmax of vm_dirty_bytes */
  > 93	static const unsigned long dirty_bytes_min = 2 * PAGE_SIZE;
    94	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
