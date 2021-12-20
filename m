Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711112CA0
	for <llvm@lists.linux.dev>; Mon, 20 Dec 2021 02:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639967035; x=1671503035;
  h=date:from:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sx6gTPtNUj/01z+ansh2FebHniUGeZ+PAvJXbz7nnGk=;
  b=VAwLdDEGZBv+zoUESPQ6GUsPhxusXyb86tw81N/jgv2kSC69qBmuYYXa
   H28httFahZU77mg0gnyTCZW+T0Hiq1yBCLRl1u5jqGrcVd78YGNADgVFH
   mMQeygh6waERUsCraBkjiGL6ipj5DfubSrbNUqmTT+Sjr1Bmk1EDJpPBv
   YqmnI5YBRtrBwWvSrarnHL/pzO/cTFXu88/otTfE32z9pqxOVONcJrmrG
   VUDDosOLtrsndChj8cDpDA1mt+FU31A3eEhc20UQLp8PWSqsNJc+wfKGa
   2rmlMAFwI5hvWyGAk7R0vaJYMhpYdoJz9EX2nXEvAkSLTBAYCIEHcHx48
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10203"; a="239889688"
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; 
   d="scan'208";a="239889688"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2021 18:23:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,219,1635231600"; 
   d="scan'208";a="507509892"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Dec 2021 18:23:53 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mz8LB-0007SO-6z; Mon, 20 Dec 2021 02:23:53 +0000
Date: Mon, 20 Dec 2021 10:23:12 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: kernel/futex/core.o: warning: objtool:
 get_inode_sequence_number()+0xab: unreachable instruction
Message-ID: <202112201042.JnlkJ1nL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>
CC: "André Almeida" <andrealmeid@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a7904a538933c525096ca2ccde1e60d0ee62c08e
commit: 85dc28fa4ec058645c29bda952d901b29dfaa0b0 futex: Split out PI futex
date:   2 months ago
config: x86_64-randconfig-r035-20211128 (https://download.01.org/0day-ci/archive/20211220/202112201042.JnlkJ1nL-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5c64d8ef8cc0c0ed3e0f2ae693d99e7f70f20a84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=85dc28fa4ec058645c29bda952d901b29dfaa0b0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 85dc28fa4ec058645c29bda952d901b29dfaa0b0
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> kernel/futex/core.o: warning: objtool: get_inode_sequence_number()+0xab: unreachable instruction
--
>> kernel/futex/pi.o: warning: objtool: fixup_pi_owner()+0x10d: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
