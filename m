Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB7B7A
	for <llvm@lists.linux.dev>; Thu, 21 Apr 2022 12:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650544324; x=1682080324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PMqVe53Hbsg7k9hFURsqKFTi+ZF+K3jn57xT2aqbFkg=;
  b=Ev9F8Fpe+CzerqJfnZlMXMKuYNz7Jr0KkfHePBbqRpFtCANN/tgW6y75
   GHZ9CN4SwPeDFOTomeX0K/91DkueCCIMVyB0H7rpY25hKySNEfAs8cwbI
   mizIa5dXQajiOxPRInLsiIVIA+SRAY9O07DWiFXNQID1vK7wBxgOuPu9V
   3TLdqV0zQx16CI54zt9Lsa12WAXYHU1YMVFodY+ushlVgpE9PumAYABGb
   zh8FcAmu6Uj9tE22Je3RD7v7C7BYb4Zvmn4bSGKr7PmoHbNoWVlNZSy8k
   AaFKCv1HSonPOI2BsDoCj9eaXNctNBdYaUGYeg9Bz6pbheXXHdxZPHwmQ
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="264102161"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="264102161"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2022 05:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; 
   d="scan'208";a="626497600"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Apr 2022 05:32:02 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhVyb-0008OF-HX;
	Thu, 21 Apr 2022 12:32:01 +0000
Date: Thu, 21 Apr 2022 20:31:06 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:sched/headers 102/2579]
 ./usr/include/asm-generic/shmbuf.h:9:10: fatal error:
 'uapi/asm-generic/ipcbuf.h' file not found
Message-ID: <202204212023.dIkUxbJS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git sched/headers
head:   49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe
commit: 303c55f2ed6ecc81b7b19a796a9d3562e99b350c [102/2579] headers/deps: Remove <linux/sem.h> from <linux/sched.h>
config: x86_64-randconfig-a013-20220418 (https://download.01.org/0day-ci/archive/20220421/202204212023.dIkUxbJS-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 429cbac0390654f90bba18a41799464adf31a5ec)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=303c55f2ed6ecc81b7b19a796a9d3562e99b350c
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip sched/headers
        git checkout 303c55f2ed6ecc81b7b19a796a9d3562e99b350c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Note: the mingo-tip/sched/headers HEAD 49e1ec6c70a6eb4b7de9250a455b8b63eb42afbe builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/shm.h:26:
   In file included from ./usr/include/asm/shmbuf.h:6:
>> ./usr/include/asm-generic/shmbuf.h:9:10: fatal error: 'uapi/asm-generic/ipcbuf.h' file not found
   #include <uapi/asm-generic/ipcbuf.h>
            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
