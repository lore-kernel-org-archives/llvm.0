Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C43533F1
	for <llvm@lists.linux.dev>; Sun, 20 Mar 2022 15:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647789749; x=1679325749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7h7VKqjqREY/mBDGPxzGzD0dmkyuCZT5dWmwIMhSAlE=;
  b=d1JlAMa9seKbXggxc8nDUAmD1KxcaC9bqtcsjjWIjl3w/SVsM6fBFXgP
   KgjVh639+7jt80rll9IeMyHpNUwizgQu0iMzjsRZvS+CLvkL11JB92XCY
   YBSM7L2s1+9kHQqOACIdlsaZTX7w1GYOhLrC7XBc03Ivil2VGt0te+cK8
   U4rDmWJr5Jj739ykAWZCCu9wsJxaKlUF8ahIqJ1NgBnLQ3H/82OBqxiil
   8Xprfyf17ZIZWuSCvlEV6HNE1W1VjuMfTvvK7dCNzvqlUCnypHlsFh/dU
   8aymG7rE6WHevfdU4FacopJSA9v0jLkG2Ls6DTciwRfXn1iRJfgNOW5Hw
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="320609137"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="320609137"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2022 08:22:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; 
   d="scan'208";a="716193914"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Mar 2022 08:22:27 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nVxNz-000H1I-3G; Sun, 20 Mar 2022 15:22:27 +0000
Date: Sun, 20 Mar 2022 23:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 1563/2335] ./usr/include/linux/if_link.h:5:10:
 fatal error: 'uapi/linux/netlink.h' file not found
Message-ID: <202203202314.QNWyvGYM-lkp@intel.com>
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
commit: f9feb19bd4ff82d90e72d9471ed90de86b38aeb5 [1563/2335] headers/deps: net: Optimize <uapi/linux/if_link.h>
config: i386-randconfig-a012-20220314 (https://download.01.org/0day-ci/archive/20220320/202203202314.QNWyvGYM-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=f9feb19bd4ff82d90e72d9471ed90de86b38aeb5
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout f9feb19bd4ff82d90e72d9471ed90de86b38aeb5
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/if_link.h:5:10: fatal error: 'uapi/linux/netlink.h' file not found
   #include <uapi/linux/netlink.h>
            ^~~~~~~~~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
