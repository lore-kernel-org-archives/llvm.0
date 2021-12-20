Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DB32C9C
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 05:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639977959; x=1671513959;
  h=date:from:cc:subject:message-id:mime-version;
  bh=lvPR0Ti9DGcxkE3gyBnrX+fPs8jotAgwynmmSJtbKMA=;
  b=EgjkAXMWQicrMdjMbt83eH6UACRR12TB6Tvog3PcpRFZfwSeG3L6ecm6
   GFjD3puKlKYUGY1F8dcnAv69crW4UAdSNw6hHslW9SSvBzHhHVEdtja7P
   BxLa8073QKuGEmE0LlPkZ3+6jmZ9MadyWjzBPzqlVLBRuqm0rF8plZNp0
   vA3TJ+jiZNx09X9ANSzKZrBIxmveU6vVEOsSKDdV8bx7A7y5bNhu+otmn
   4xPf2Nz/jL9AOcaWdjCvz2scUaioyitLrfM6z9TPvK5YHZxDm5BP5emt2
   M1NL+2ShkKurpyqQXnOOsdknwtfAUC51P8PGbhWZ61XH21FJ6YDLnt0BZ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="326396628"
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; 
   d="scan'208";a="326396628"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2021 21:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; 
   d="scan'208";a="507554743"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Dec 2021 21:25:57 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzBBM-0007Wa-H0; Mon, 20 Dec 2021 05:25:56 +0000
Date: Mon, 20 Dec 2021 13:24:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: kernel/sched/rt.o: warning: objtool: set_next_task_rt()+0x452:
 unreachable instruction
Message-ID: <202112201352.3COtu9FY-lkp@intel.com>
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
TO: Kees Cook <keescook@chromium.org>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a7904a538933c525096ca2ccde1e60d0ee62c08e
commit: 804bccba71a57e7e5deb507a4c8ebbab730909c0 sched: Fill unconditional hole induced by sched_entity
date:   10 weeks ago
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211220/202112201352.3COtu9FY-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project dd245bab9fbb364faa1581e4f92ba3119a872fba)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=804bccba71a57e7e5deb507a4c8ebbab730909c0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 804bccba71a57e7e5deb507a4c8ebbab730909c0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/sched/rt.o: warning: objtool: set_next_task_rt()+0x452: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
