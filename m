Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661FD46A4
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 06:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649743425; x=1681279425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A1EycYEFUamWp4+tkv/siN4klCeExrRkBTnQD/V9PCc=;
  b=QWrUgtVf95vUSJ4Z8r/F1msDAb2Mft5AcChpXgFciSO34jCyghuhzQEL
   hc9SXo6m1ctZy4Xm0BxjoM0qG2eVpcL2PkPk2fyV1CVlVT5qRBofKdZCN
   93tpID90zPK0o3Zz1lgrGZJYy19z+tLsgEqDj4sy8/OsUaMx4uwrmNrfl
   pkULDVNOBWXi8W70mQfkg/EGU/t0KFnV9xvK0t5gKNKN0Qq24PJiFo/ah
   rzcafJEGRgcy9YtMji61wlk9m9lwjDVug5zqcqRDX9IWsVh2Od9Jza8k0
   cXCd0PiPDl7muS5AMbeUy5k7LArlyuilZ+hN7f83Iwj+0BZCTSWZICQ8w
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="244168329"
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="244168329"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 23:03:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,253,1643702400"; 
   d="scan'208";a="724300461"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 11 Apr 2022 23:03:38 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ne9cn-0002Ya-Mx;
	Tue, 12 Apr 2022 06:03:37 +0000
Date: Tue, 12 Apr 2022 14:03:08 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [jpoimboe:objtool-run 5/5] Error: unknown option `vmlinux'
Message-ID: <202204121322.tAAxdXfr-lkp@intel.com>
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
head:   0060ff03f4882dcb7911b968e5d1f31aaf840c33
commit: 0060ff03f4882dcb7911b968e5d1f31aaf840c33 [5/5] todo
config: x86_64-randconfig-r034-20220411 (https://download.01.org/0day-ci/archive/20220412/202204121322.tAAxdXfr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=0060ff03f4882dcb7911b968e5d1f31aaf840c33
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-run
        git checkout 0060ff03f4882dcb7911b968e5d1f31aaf840c33
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> Error: unknown option `vmlinux'

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
