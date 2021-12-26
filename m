Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EF429CA
	for <llvm@lists.linux.dev>; Sun, 26 Dec 2021 02:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640487571; x=1672023571;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Jbz3u5gJydZHb6lOxXr8ZHFuls8hGbfCbxperOuOAC4=;
  b=A9a/aD2oAiBQ5rhuQDL4/uhy3QdwDemaPnvU1uacQevuZWqRgEbaIfgW
   GHMSeAHwmM+BA67YATVhEq0qnVha8onl4ELpWLVSqx+yysYworFUfM2nw
   F2T3LZ4EJfyXDPjdfhoeureQdQ1Dsqer3Fggf++Wxu0kaC2Y9KgPs15bz
   EXOKwJ/HOnpgFgJZ7/Unbi7FkKR4KVZ+rYoLySUwS3AwRWGW0cfXsadQd
   bKJIWLehrx8XOT6ZNs2fqRDXJpgrwvIEOfekCYfIYAtP5Q9sTFGFop6+A
   /B6ijinVsxCCbnOb6un/VxH/vJqannoE57hkd77pUapLnUElEnTEm/IXv
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10208"; a="227919072"
X-IronPort-AV: E=Sophos;i="5.88,236,1635231600"; 
   d="scan'208";a="227919072"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2021 18:59:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,236,1635231600"; 
   d="scan'208";a="571707909"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 25 Dec 2021 18:59:29 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n1Jku-0004yD-DU; Sun, 26 Dec 2021 02:59:28 +0000
Date: Sun, 26 Dec 2021 10:58:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: drivers/input/touchscreen/ads7846.c:705:24: warning: taking address
 of packed member 'data' of class or structure 'ads7846_buf' may result in an
 unaligned pointer value
Message-ID: <202112261050.OodYJnM4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e2ae0d4a6b0ba461542f0fd0ba0b828658013e9f
commit: 415e915fdfc775ad0c6675fde1008f6f43dd6251 Merge tag 'v5.11' into next
date:   10 months ago
config: mips-randconfig-r033-20211226 (https://download.01.org/0day-ci/archive/20211226/202112261050.OodYJnM4-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 0c553cc1af2e4c14100df6cf4a6fc91987e778e6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mips-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=415e915fdfc775ad0c6675fde1008f6f43dd6251
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 415e915fdfc775ad0c6675fde1008f6f43dd6251
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/input/touchscreen/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/ads7846.c:705:24: warning: taking address of packed member 'data' of class or structure 'ads7846_buf' may result in an unaligned pointer value [-Waddress-of-packed-member]
           value = be16_to_cpup(&buf->data);
                                 ^~~~~~~~~
   1 warning generated.


vim +705 drivers/input/touchscreen/ads7846.c

2991a1ca6e9b13 Jason Wang     2010-10-13  700  
6965eece2a89c3 Oleksij Rempel 2021-01-20  701  static int ads7846_get_value(struct ads7846_buf *buf)
2991a1ca6e9b13 Jason Wang     2010-10-13  702  {
879f2fea8a5a74 Andrey Gelman  2015-10-06  703  	int value;
2991a1ca6e9b13 Jason Wang     2010-10-13  704  
6965eece2a89c3 Oleksij Rempel 2021-01-20 @705  	value = be16_to_cpup(&buf->data);
879f2fea8a5a74 Andrey Gelman  2015-10-06  706  
879f2fea8a5a74 Andrey Gelman  2015-10-06  707  	/* enforce ADC output is 12 bits width */
879f2fea8a5a74 Andrey Gelman  2015-10-06  708  	return (value >> 3) & 0xfff;
2991a1ca6e9b13 Jason Wang     2010-10-13  709  }
ffa458c1bd9b6f David Brownell 2006-01-08  710  

:::::: The code at line 705 was first introduced by commit
:::::: 6965eece2a89c3f1d00881c6052ee1e987870c08 Input: ads7846 - convert to one message

:::::: TO: Oleksij Rempel <o.rempel@pengutronix.de>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
