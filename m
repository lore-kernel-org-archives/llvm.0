Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5AD173
	for <llvm@lists.linux.dev>; Sat, 18 Dec 2021 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1639833225; x=1671369225;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xYymQO5ZP0LMqNiZ/6z1mYZP6WqbHReS19i63za/5xs=;
  b=U0wGPG82TD3wdE6wlts/3fw+vaNIQX8em7yV9uvyyw/1W0vCFd8p7oI8
   h3KBkZRK2seJqMwMNP1XQEdSozajWThQAciAh0FEViawgRrB87K2bi2DD
   +DL75VKQrNWz2dcCf4DSwkmtQNlHsO5D2JKDydRla3rOgnGVfVOg9gWA6
   XTDkREXLJRfEALq2OcCnhqSsqZif3zoWdNGrsIbat3lrOgb1bb7H4H0vc
   a7rdEkV8kFnwpoDjR+otFMtv66LsrueoceHGnbxazABo/UJiq9Q0W8Krk
   l+jVJAuRMeNG2YILt0wPBe+e4FF3BG07Dckob1HkxNwDoO0NbaQTgOCCK
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10201"; a="303297796"
X-IronPort-AV: E=Sophos;i="5.88,216,1635231600"; 
   d="scan'208";a="303297796"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2021 05:13:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,216,1635231600"; 
   d="scan'208";a="507111963"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 18 Dec 2021 05:13:44 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1myZWx-00060q-PB; Sat, 18 Dec 2021 13:13:43 +0000
Date: Sat, 18 Dec 2021 21:13:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [mark:locking/debug-refcount 2/3] mm/z3fold.o: warning: objtool:
 z3fold_zpool_malloc()+0x1df: unreachable instruction
Message-ID: <202112182105.T58rRsh2-lkp@intel.com>
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
TO: Mark Rutland <mark.rutland@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git locking/debug-refcount
head:   fb4984c339109f2ee2dd0000e7744aab91b974f5
commit: ae5010b75aaeb2f0110399b12099d59044d3b22d [2/3] WIP: kref: use refcount_init()
config: x86_64-randconfig-a011-20211216 (https://download.01.org/0day-ci/archive/20211218/202112182105.T58rRsh2-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4c9e31a4814592bbda7153833e46728dc7b21100)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=ae5010b75aaeb2f0110399b12099d59044d3b22d
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark locking/debug-refcount
        git checkout ae5010b75aaeb2f0110399b12099d59044d3b22d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/z3fold.o: warning: objtool: z3fold_zpool_malloc()+0x1df: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
