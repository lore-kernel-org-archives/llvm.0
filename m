Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBFB7A
	for <llvm@lists.linux.dev>; Mon, 21 Mar 2022 05:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1647839763; x=1679375763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=szmX5mQ1irZlur5g+LvTvMsi9E1E7QaV9jSuI6zk0wU=;
  b=Ho5iAdAUD1BzXpbKE84KEbiV2QgQ5LFxhawho4DJi1bmF5QWqn+DN5sw
   k9jHJ7vIBJf5dW1NcrxjUpDdf6olCJj5QhLfAuBMkWI+pRF5ORos5gHg4
   mGq7EtmnIFApF7Ww35HvNHet0yGObh3cQ+ekX5IjUvBThFyI/o8ww3QDP
   OEBtOqGJ1aDg1h/KCP9hMB1seq7Q7pF3bqGxXCTixmSkcUMAcdAcFV3J8
   F5/GWIIecH9SSTEGNigHJqaU0bby+YOqYWk4TFcfcVaF80Gz95lP5Q7p5
   JdULkNA5JjmY0g0jU+zuoaQp6S+a69Kej1XWxkZAl5WfH4Sk1IYNdkRZK
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10292"; a="257660773"
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; 
   d="scan'208";a="257660773"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2022 22:16:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,197,1643702400"; 
   d="scan'208";a="500042968"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 20 Mar 2022 22:16:00 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nWAOd-000HVJ-Qv; Mon, 21 Mar 2022 05:15:59 +0000
Date: Mon, 21 Mar 2022 13:15:15 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [mingo-tip:master 1895/2335] ./usr/include/linux/neighbour.h:5:10:
 fatal error: 'uapi/linux/types.h' file not found
Message-ID: <202203211317.61fjNukZ-lkp@intel.com>
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
commit: 8941ec82b6cca439dcb9fafcc1955ebf70746139 [1895/2335] headers/deps: net: Optimize <uapi/linux/neighbour.h> dependencies
config: i386-randconfig-a012-20220314 (https://download.01.org/0day-ci/archive/20220321/202203211317.61fjNukZ-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a6ec1e3d798f8eab43fb3a91028c6ab04e115fcb)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git/commit/?id=8941ec82b6cca439dcb9fafcc1955ebf70746139
        git remote add mingo-tip git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git
        git fetch --no-tags mingo-tip master
        git checkout 8941ec82b6cca439dcb9fafcc1955ebf70746139
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/neighbour.h:5:10: fatal error: 'uapi/linux/types.h' file not found
   #include <uapi/linux/types.h>
            ^~~~~~~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
