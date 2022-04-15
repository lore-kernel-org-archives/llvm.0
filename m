Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58E87B
	for <llvm@lists.linux.dev>; Fri, 15 Apr 2022 17:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650044127; x=1681580127;
  h=date:from:cc:subject:message-id:mime-version;
  bh=hYOvfoVpCGfvX7cZJ9MmAWIRsId58LZtNvFTiX6H/lI=;
  b=de9O0pZZfpFEa8T84m0EU+gNWhR0QWob2jvwG0SizmlN+nPJZeXuDKwt
   GkfQwgx9zsbjCIArtwt1a/KVEmSxkDo8z6HvM+KEoeNhQ3blzS01khztY
   0WP7LPWBXHYbxkNk+8bCyRyTnmIL5jK98oNB7+qTYYDxQId5Co+0aJGvp
   /OFaZKYr2aF4Q2bTyNUDjrXx/4YBFcJZQL//iQsB0ZqK7mzP9iKiMdOkQ
   9PKG7gqdyI+bhbdt4Zcs6pflVqpDSmwkB+4yOoKYENJcqKAIPs7/ycj0Q
   EMTzQpPYSdN2ie02vXE+YNBsKnM92E6RZr+P8/l5wWPdEuvfxDfvwjhX3
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10318"; a="243781104"
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="243781104"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2022 10:35:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,263,1643702400"; 
   d="scan'208";a="553241560"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Apr 2022 10:35:26 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nfPqv-0002EL-D1;
	Fri, 15 Apr 2022 17:35:25 +0000
Date: Sat, 16 Apr 2022 01:35:15 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [jpoimboe:objtool-run 19/35] fs/reiserfs/do_balan.o: warning:
 objtool: balance_leaf+0x7406: stack state mismatch: cfa1=4+344 cfa2=4+336
Message-ID: <202204160126.GotNznAW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Josh Poimboeuf <jpoimboe@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-run
head:   b8646d8664875281b48db7752d3dc7880b7561e1
commit: f2bec70312f62ef4f1ea21c134d9def627182ad3 [19/35] objtool: Don't print parentheses in function addresses
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20220416/202204160126.GotNznAW-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 6b7e6ea489f6dd45a9b0da9ac20871560917b9b0)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=f2bec70312f62ef4f1ea21c134d9def627182ad3
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe objtool-run
        git checkout f2bec70312f62ef4f1ea21c134d9def627182ad3
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/reiserfs/do_balan.o: warning: objtool: balance_leaf+0x7406: stack state mismatch: cfa1=4+344 cfa2=4+336

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
