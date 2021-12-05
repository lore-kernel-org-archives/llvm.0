Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18282C9D
	for <llvm@lists.linux.dev>; Sun,  5 Dec 2021 06:19:23 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10188"; a="224416341"
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; 
   d="scan'208";a="224416341"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2021 22:19:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; 
   d="scan'208";a="460484665"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 04 Dec 2021 22:19:22 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtkrp-000Jsf-HF; Sun, 05 Dec 2021 06:19:21 +0000
Date: Sun, 5 Dec 2021 14:18:56 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 2186/5128] net/mptcp/sockopt.o: warning: objtool:
 mptcp_setsockopt()+0x1817: unreachable instruction
Message-ID: <202112051404.2Nfriz4e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Florian Westphal <fw@strlen.de>
CC: Mat Martineau <mathew.j.martineau@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7afeac307a9561e3a93682c1e7eb22f918aa1187
commit: c9406a23c1161c3a9a672d055ec840b00d730a6f [2186/5128] mptcp: sockopt: add SOL_IP freebind & transparent options
config: x86_64-randconfig-a015-20211205 (https://download.01.org/0day-ci/archive/20211205/202112051404.2Nfriz4e-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=c9406a23c1161c3a9a672d055ec840b00d730a6f
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout c9406a23c1161c3a9a672d055ec840b00d730a6f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash net/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> net/mptcp/sockopt.o: warning: objtool: mptcp_setsockopt()+0x1817: unreachable instruction

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
