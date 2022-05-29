Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760B7A
	for <llvm@lists.linux.dev>; Sun, 29 May 2022 00:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1653783726; x=1685319726;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G3SzwzgH6U90mNeORTOYFSFMHmyFrXPh3QZbsig10Lw=;
  b=c3viF06R5lp5mJ8mbvC34SXoKuG1cHGdXnO3/gqGixFSTMTVM/F7VsCF
   SBOoTIUX1UQJmZBfVjMvrwWWa0OzYPVGlnPsmt3OwgzAogwyTgZjRSVnj
   6EVXpdUSzrIDZPzx1WiaTBPEZiQXHOsSeMleX81KoeDAxLH4R6xPzajU8
   30wRM8dVzjR75TcfljrPpp/TCYDSjpKowSfAfNZ3WJ3NCpuQc31YCW7Z0
   YJoD83uC87CKO0XDeU2dL/H+pWIP2lIa9TacHc/rXjVAs5+isrACEHhj4
   Y+8T9D4POX9rUtHWOgw1pFqB2qKnHLQQu5wvqRbfl85sVpG0HpCzUE/Wo
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10361"; a="254603962"
X-IronPort-AV: E=Sophos;i="5.91,259,1647327600"; 
   d="scan'208";a="254603962"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2022 17:22:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,259,1647327600"; 
   d="scan'208";a="705667350"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 May 2022 17:22:03 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nv6h1-0000cm-0q;
	Sun, 29 May 2022 00:22:03 +0000
Date: Sun, 29 May 2022 08:21:22 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: <instantiation>:2:2: error: out of range pc-relative fixup value
Message-ID: <202205290805.1vZLAr36-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: 508074607c7b95b24f0adf633fdf606761bb7824 ARM: 9195/1: entry: avoid explicit literal loads
date:   9 days ago
config: arm-randconfig-r005-20220529 (https://download.01.org/0day-ci/archive/20220529/202205290805.1vZLAr36-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=508074607c7b95b24f0adf633fdf606761bb7824
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 508074607c7b95b24f0adf633fdf606761bb7824
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> <instantiation>:2:2: error: out of range pc-relative fixup value
    ldr tsk, =__current
    ^

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
