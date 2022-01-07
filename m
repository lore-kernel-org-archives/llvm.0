Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB442C9D
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641569164; x=1673105164;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ftt2PsGW68U+laV3RfDO0siN1D9/+OU62bwe6No4H0g=;
  b=epAr5IEXuk7iITSJn2TWhnA33/6kSK6O1IBMG5yFaf0YKp5BJdhvubS0
   IhB/NL4F0jsWDbTa9pKX70RLJ6uOwRY0/kfov0g8C0SPtPusxlrxhpvg6
   urp9KYm/p4rguRWhLDYM6ONBc8fN+VttPuZ+gYwglpkMM/ZrI8IDyRs2x
   AB2aphE3REKWrTcgQAX2HcHP0OxFiA43V4dkOC6w+HBJjbYCxDrlTM8l7
   rhf+FJuWGg5Sp7bLjYbQpft/o+veoFz9/mPDMWdzg4lNC0OJQnW/xRvZs
   lIJD9DNhWJa4frxRP1YZQRehIA1IZ0x9enQVl6t5Jds0XuPM7DO9TZE3L
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="329224150"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="329224150"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 07:26:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; 
   d="scan'208";a="621921706"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Jan 2022 07:26:01 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5r7w-000IoC-JI; Fri, 07 Jan 2022 15:26:00 +0000
Date: Fri, 7 Jan 2022 23:25:57 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: fs/reiserfs/reiserfs.lto.o: warning: objtool: balance_leaf()+0x5aee:
 stack state mismatch: cfa1=4+272 cfa2=4+264
Message-ID: <202201072349.9TACIqnL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Sami Tolvanen <samitolvanen@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Alexander Lobakin <alobakin@pm.me>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ddec8ed2d4905d0967ce2ec432e440e582aa52c6
commit: 850ded46c64299f04d15e39caaba21963fb966f8 kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG
date:   4 months ago
config: x86_64-randconfig-r002-20220106 (https://download.01.org/0day-ci/archive/20220107/202201072349.9TACIqnL-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project ca7ffe09dc6e525109e3cd570cc5182ce568be13)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=850ded46c64299f04d15e39caaba21963fb966f8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 850ded46c64299f04d15e39caaba21963fb966f8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> fs/reiserfs/reiserfs.lto.o: warning: objtool: balance_leaf()+0x5aee: stack state mismatch: cfa1=4+272 cfa2=4+264

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
