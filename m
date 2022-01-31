Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588372C82
	for <llvm@lists.linux.dev>; Mon, 31 Jan 2022 04:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643603167; x=1675139167;
  h=date:from:cc:subject:message-id:mime-version;
  bh=X9aPjUQ3TtdAEJpa+KJTxHgSrCl25GOVRwJ3b1RFo6o=;
  b=HOCyYxIMSZyU3kFd8+H22eX9VaBuQiCBv+fJ3gmKhMLNJ1cXX2MtYuO/
   /j+E+98nJ9spC9qBzZ7XEjaqMJO1KTq9LJ9XZuX9LjfnGxTSpIS5vweJy
   jXBpdRMQ2ju/h3IyU28wPTJZYTbXPcsN3yur0BCXMrP6M+yma+53HiZAD
   v7Nc4gfhS5BAxGa9+YsQqnZcKSboZ16hFoRp64MPScMdbCMGOe6IlINVg
   mPtaxKP8QPDWdoSSUVVY4tyEpzwjw7+pqdsG7xOhHiTpYuLqdq7Fe4ust
   UbMd5wDImC6AkC4V4APDWG6aMaOrSpqHamYidrEEH8YXV6qTKOXrS9QsM
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="333756727"
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="333756727"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2022 20:26:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; 
   d="scan'208";a="496803320"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2022 20:26:05 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nEOGT-000RNH-3f; Mon, 31 Jan 2022 04:26:05 +0000
Date: Mon, 31 Jan 2022 12:25:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: mm/vmscan.o: warning: objtool: shrink_node()+0xbbd: sibling call
 from callable instruction with modified stack frame
Message-ID: <202201311257.sKsDis4t-lkp@intel.com>
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
TO: Yang Shi <shy828301@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   26291c54e111ff6ba87a164d85d4a4e134b7315c
commit: 20f9ba4f995247bb79e243741b8fdddbd76dd923 mm: migrate: make demotion knob depend on migration
date:   3 months ago
config: x86_64-randconfig-r012-20220131 (https://download.01.org/0day-ci/archive/20220131/202201311257.sKsDis4t-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f1c18acb07aa40f42b87b70462a6d1ab77a4825c)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=20f9ba4f995247bb79e243741b8fdddbd76dd923
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 20f9ba4f995247bb79e243741b8fdddbd76dd923
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/vmscan.o: warning: objtool: shrink_node()+0xbbd: sibling call from callable instruction with modified stack frame

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
