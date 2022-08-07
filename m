Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070B81101
	for <llvm@lists.linux.dev>; Sun,  7 Aug 2022 01:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659834437; x=1691370437;
  h=date:from:cc:subject:message-id:mime-version;
  bh=9B5mXxNgrnsmiQFRIVSx7zMHw//ka6dmqUpXYUKs6p4=;
  b=RoEg1+ugVnjleCwxlBnUM1ZNg2nn8CpXLPwK0/gw6y5piAq7J4UkK7bb
   3yTVrJ9qgxk8ki0vpDOeZUtAhO/SihW6CGZP650efi8QI1vMvuEgLSV8t
   GzTY93P85KEChJgNEWh0DsnNdO84SorPAuQQtr0gw9PyyEUuaCiEVMUys
   Jf1y1oIBzYe6z/wTCPy7DTVDDgXVy4E6ob4e5Z7m2QPhuYc0Ks6TpOkjD
   q+QE9NarCizn5qMadsjHmgD1GoUGaU41RJ0bMGIPmzvQAP6PRuWVcm1Jt
   OF1a8A8n1X/V+ZctVC8qTh2DgCzw/UU7jATOyfVIPysSy9h6GZWlbAsnq
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10431"; a="354400962"
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="354400962"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2022 18:07:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,219,1654585200"; 
   d="scan'208";a="931632758"
Received: from lkp-server01.sh.intel.com (HELO e0eace57cfef) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 06 Aug 2022 18:07:15 -0700
Received: from kbuild by e0eace57cfef with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oKUl8-000KpP-2b;
	Sun, 07 Aug 2022 01:07:14 +0000
Date: Sun, 7 Aug 2022 09:06:21 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [ammarfaizi2-block:tglx/devel/depthtracking 33/59]
 mm/kasan/generic.o: warning: objtool: __asan_load1+0x40: return with UACCESS
 disabled from a UACCESS-safe function
Message-ID: <202208070933.v6IRoPg3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://github.com/ammarfaizi2/linux-block tglx/devel/depthtracking
head:   b518e558c49324fa002255761d2a7324ba31f7b5
commit: bbe008c180487386bb36b57a145eb74d7ea8aac0 [33/59] objtool: Fix find_{symbol,func}_containing()
config: x86_64-randconfig-a001-20220801 (https://download.01.org/0day-ci/archive/20220807/202208070933.v6IRoPg3-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/bbe008c180487386bb36b57a145eb74d7ea8aac0
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block tglx/devel/depthtracking
        git checkout bbe008c180487386bb36b57a145eb74d7ea8aac0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash mm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/kasan/generic.o: warning: objtool: __asan_load1+0x40: return with UACCESS disabled from a UACCESS-safe function
>> mm/kasan/generic.o: warning: objtool: __asan_store1+0x40: return with UACCESS disabled from a UACCESS-safe function
>> mm/kasan/generic.o: warning: objtool: __asan_load2+0x48: return with UACCESS disabled from a UACCESS-safe function
>> mm/kasan/generic.o: warning: objtool: __asan_store2+0x48: return with UACCESS disabled from a UACCESS-safe function
>> mm/kasan/generic.o: warning: objtool: __asan_load4+0x4e: return with UACCESS disabled from a UACCESS-safe function
>> mm/kasan/generic.o: warning: objtool: __asan_store4+0x4e: return with UACCESS disabled from a UACCESS-safe function
>> mm/kasan/generic.o: warning: objtool: __asan_load8+0x4d: return with UACCESS disabled from a UACCESS-safe function
>> mm/kasan/generic.o: warning: objtool: __asan_store8+0x4d: return with UACCESS disabled from a UACCESS-safe function
>> mm/kasan/generic.o: warning: objtool: __asan_load16+0x47: return with UACCESS disabled from a UACCESS-safe function
>> mm/kasan/generic.o: warning: objtool: __asan_store16+0x47: return with UACCESS disabled from a UACCESS-safe function
>> mm/kasan/generic.o: warning: objtool: __asan_loadN+0x14: return with UACCESS disabled from a UACCESS-safe function
>> mm/kasan/generic.o: warning: objtool: __asan_storeN+0x17: return with UACCESS disabled from a UACCESS-safe function

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
