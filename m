Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4918C46A7
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 14:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649774121; x=1681310121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HHsgRkFWikOLC0+eUkqw7b7yg2tukWfTOUQdrXgfpyE=;
  b=J3GsG3/UyKPQig8P8/uJGo7gdCYA8jMzvgdQUlTFkkg3zjcMDyHP1SAL
   Gg7s2V+S6Yt48tpKuSeIfY8fuvz2OvD9v1SfP8xFhJt+rwU/iA2q+G6C8
   2Dwvjcy54ob1Vo/9VrNY4pYO3CmYvYGthad4oRSV7ShihtS9fV73lvHyJ
   tJZNdkvYtiiqhPvrs0ZJgfuO6MqqbMaLrw7d9yAEM4vKpnVCouYmyO7So
   GZzoKRoselNO/zBV017CLbwYyllwlr1mZjpkNP2XkMgzXAUHFMDumMBCA
   ol104hKhHvEP0xf2Km7uDgDQ32kU7wQKWygOjfJW5r/CBuxKRVkS9/bSd
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="322832802"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="322832802"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 07:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="724471172"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2022 07:35:11 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neHbq-0002uS-Ko;
	Tue, 12 Apr 2022 14:35:10 +0000
Date: Tue, 12 Apr 2022 22:34:11 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpoimboe:objtool-run 14/14] Error: unknown option `link'
Message-ID: <202204122219.oMEWJFBW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-run
head:   7f408460a07320dc0da22915e82ec3b444fef8c8
commit: 7f408460a07320dc0da22915e82ec3b444fef8c8 [14/14] todo
config: x86_64-randconfig-a001-20220411 (https://download.01.org/0day-ci/archive/20220412/202204122219.oMEWJFBW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=7f408460a07320dc0da22915e82ec3b444fef8c8
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-run
        git checkout 7f408460a07320dc0da22915e82ec3b444fef8c8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: unknown option `link'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
