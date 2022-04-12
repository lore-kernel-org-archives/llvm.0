Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC3B7B
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649758862; x=1681294862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w0qqzuPg6fre0pLykL1SiwIqyX/9przAgXnZ0xEkhnI=;
  b=Wpv7SBhD+uHdqW7j3/iyVaWjScExXDHkmPgxu9EOdYyPrqLzTYa52xhB
   dniWxck2ajj7fGJOtC7vHxTC1g/QRxVZtcnGOKyEjehoqf3SWOqFOaljE
   6h9HTv1l2Jr4A7lvG5uHKFNzKpHY4CRo6ZVW/l7ycrZnUfOzHmNOVxRmh
   hc1KaTNSDY754opklX7M6/CvQUvzhBxVmcIsx8jBo7kltDfdfpC8AuhWi
   2hESQPs2OW3E1+Hsa776m2wrJigcWOF+CoxKnbQySDSD9djuLpKnYSgG/
   kG/LTFvXO/wI0W5pDxupMwhvc8V0Oz7tn7W/WrFnpIZMGTFx5QZMiEMGG
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="261776746"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="261776746"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 03:21:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="559271710"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Apr 2022 03:21:00 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neDdr-0002kx-Lb;
	Tue, 12 Apr 2022 10:20:59 +0000
Date: Tue, 12 Apr 2022 18:20:55 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpoimboe:objtool-run 14/14] ld.lld: error: unknown argument '--link'
Message-ID: <202204121858.7ox6amp1-lkp@intel.com>
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
config: i386-randconfig-a003-20220411 (https://download.01.org/0day-ci/archive/20220412/202204121858.7ox6amp1-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: unknown argument '--link'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
