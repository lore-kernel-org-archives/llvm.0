Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B6C7B
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 01:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647827487; x=1679363487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fzt41KSKa4/2XvYlMa4CvDxRgn/3MOkiGKzHbYxHBb8=;
  b=AhDWAqWQskebQw4kIjgKIeR4svdhHAzmGEH6pxiMYwY0KyztBDypuBFu
   MblreZ8mF+ekNo7CID5yf02Uw1IccYZPOa+BRc76KHkMp8vN3m6DRtqIH
   mpq/f2XYlFlXe6+u62QTwKiOiPRarFEVyYnUOARPQ00XdgqPAmjApS5L2
   Krp8kQLG/VatgyJQA5/DU1l1N2SyuaPveHJJlwRboKWL22zlFY2t1zL6B
   NirGXztDSYGSLikx8WWxO1KDgSbXQcEH7OPZeB8IVXh0JK5nw/+12cBeX
   62BqPj2YK7Ytsc9/+8LfCqstcovWFhdXzHEdgo/l2NBf2uP2zvsAOueRW
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257168097"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; 
   d="scan'208";a="257168097"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2022 18:51:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; 
   d="scan'208";a="518244257"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 20 Mar 2022 18:51:24 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nW7Ce-000HN3-9j; Mon, 21 Mar 2022 01:51:24 +0000
Date: Mon, 21 Mar 2022 09:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 1894/2335] ./usr/include/linux/if_addr.h:5:10:
 fatal error: 'uapi/linux/types.h' file not found
Message-ID: <202203210958.W2be4Wwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git master
head:   85293bf3fca6d85608cff1447ce3097583f15fab
commit: d7d9f2ea99cbf84ff17c9ece920e5fe9102a6892 [1894/2335] headers/deps: net: Optimize <uapi/linux/if_addr.h> dependencies
config: i386-randconfig-a012-20220314 (https://download.01.org/0day-ci/archive/20220321/202203210958.W2be4Wwn-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=d7d9f2ea99cbf84ff17c9ece920e5fe9102a6892
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout d7d9f2ea99cbf84ff17c9ece920e5fe9102a6892
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/if_addr.h:5:10: fatal error: 'uapi/linux/types.h' file not found
   #include <uapi/linux/types.h>
            ^~~~~~~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
