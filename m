Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9991872
	for <llvm@lists.linux.dev>; Tue, 20 Sep 2022 11:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663672242; x=1695208242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6xRufgAOPeHl07DR4DHjGbYt8F/8YiY/XrFzHNzT8FQ=;
  b=ba+E7Fa26NnoK48mGApGJUPYMgo24il+7HM1qDHkVsXKdwjBqiS3nBcl
   KKdq0B6OWWuyk9JFr8zB2s+HRODcLOB0swLoqCXnuU7BVSwpP2shmIWEQ
   OuhViDUXHMIrX0+6aqo+q/JKCQaTsMKbhoJ2Qslwyw3ReizaXivsSdewT
   4qnx6pNhdFDy1RQXskopQRhmFhOxUGFL9qdKifjwnopzJABtIf1/3wiff
   cVo7p3kcvyNzmmvoZ5TKz8pgoO3wDlvJnzOyGQYvYmxGCEIlUGXqLWes/
   4IDqr1GUtSvDSv9K6zoa0XatbO5pvnYf9+6r5nXcv42KSQaMqmRE7A+XS
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10475"; a="282694178"
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="282694178"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2022 04:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="618873529"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 20 Sep 2022 04:10:36 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oab99-0002iB-0T;
	Tue, 20 Sep 2022 11:10:35 +0000
Date: Tue, 20 Sep 2022 19:09:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
	linux-kernel@vger.kernel.org
Subject: [ammarfaizi2-block:crng/random/jd/vdso 3/3]
 include/vdso/processor.h:10:10: fatal error: 'asm/vdso/processor.h' file not
 found
Message-ID: <202209201951.cz31hRjJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block crng/random/jd/vdso
head:   a7b31acb923dbd25e7bf030ca209f131c31f5288
commit: a7b31acb923dbd25e7bf030ca209f131c31f5288 [3/3] random: implement getrandom() in vDSO
config: hexagon-randconfig-r045-20220919 (https://download.01.org/0day-ci/archive/20220920/202209201951.cz31hRjJ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 791a7ae1ba3efd6bca96338e10ffde557ba83920)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/a7b31acb923dbd25e7bf030ca209f131c31f5288
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block crng/random/jd/vdso
        git checkout a7b31acb923dbd25e7bf030ca209f131c31f5288
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash drivers/char/ drivers/iommu/ mm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/char/random.c:64:
   In file included from include/vdso/datapage.h:17:
>> include/vdso/processor.h:10:10: fatal error: 'asm/vdso/processor.h' file not found
   #include <asm/vdso/processor.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +10 include/vdso/processor.h

d8bb6993d871f5 Vincenzo Frascino 2020-03-20   9  
d8bb6993d871f5 Vincenzo Frascino 2020-03-20 @10  #include <asm/vdso/processor.h>
d8bb6993d871f5 Vincenzo Frascino 2020-03-20  11  

:::::: The code at line 10 was first introduced by commit
:::::: d8bb6993d871f5d3cd6d65d3772e4b1f4ef17380 common: Introduce processor.h

:::::: TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
