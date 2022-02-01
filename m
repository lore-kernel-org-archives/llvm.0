Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4DF2CA1
	for <llvm@lists.linux.dev>; Tue,  1 Feb 2022 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643711555; x=1675247555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+ah6ZvrJhajAxWVyZg0CQ8gmK81vXiJAct41Moo7cc=;
  b=bCro2eqojk+pVBa9veij5joNg6kugbkzJB9+AJ1rSeAPmdENXFRwRMAL
   l0kIdYZq4A+jhj4rPka8+PxdKHrknDcdDPdYhfZQzboXRnqt8sqpPUbuc
   XtTOhreNNSR3X7YFHIDeBKbYqNqAG31Ft3Sypr/dXHSvKpfunP9DqYTvd
   GiJ1d+GSa0rLolE1C7ALxtDX27iP+C7ZBJ5u6JNy+3el7g9StjGjfQRvA
   nVl3NaWb5GICEMUJqXPwrDXX7CNyQiWGdwtAe4RH9RXwmOmrB7gkPtgp8
   6ECryfs1R01F1bPdOnIfIjrHKLTErVBbfx8lSxSRWQITfl3sBnFgnAb+x
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10244"; a="246496662"
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="246496662"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2022 02:32:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,333,1635231600"; 
   d="scan'208";a="768889617"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 01 Feb 2022 02:32:30 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEqSc-000T7F-7V; Tue, 01 Feb 2022 10:32:30 +0000
Date: Tue, 1 Feb 2022 18:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2792/2969] lib/test_string.c:188:30: error:
 initializer element is not a compile-time constant
Message-ID: <202202011846.EbcxQdke-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   887a333c44eb67973622e530e43cd5e4cf9af927
commit: 05a5ff1e0c9581e4ceb8cdc2cbcce5ed0e9fa2b7 [2792/2969] lib/test_string.c: Add test for strlen()
config: mips-randconfig-r025-20220130 (https://download.01.org/0day-ci/archive/20220201/202202011846.EbcxQdke-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 6b1e844b69f15bb7dffaf9365cd2b355d2eb7579)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=05a5ff1e0c9581e4ceb8cdc2cbcce5ed0e9fa2b7
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 05a5ff1e0c9581e4ceb8cdc2cbcce5ed0e9fa2b7
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> lib/test_string.c:188:30: error: initializer element is not a compile-time constant
   static const int strlen_ce = strlen("tada, a constant expression");
                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +188 lib/test_string.c

   181	
   182	/*
   183	 * Unlike many other string functions, strlen() can be used in
   184	 * static initializers when string lengths are known at compile
   185	 * time. (i.e. Under these conditions, strlen() is a constant
   186	 * expression.) Make sure it can be used this way.
   187	 */
 > 188	static const int strlen_ce = strlen("tada, a constant expression");
   189	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
