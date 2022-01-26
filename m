Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C71229CA
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 07:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643182780; x=1674718780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qpwkq/tfgyuDWo8286GPA9d2hhEfNOjp5kDGgAGyq0I=;
  b=cC21OywXFxqRudnkmCnrYVinZ2bu+jRt41ZhdG56Q69Gftg2vNGwdxyw
   H7j1d3qUjrqXBV7dpDcqKnh+nqNTb2IxOLs9fl/CjWP31qWyPVcBvnRR7
   t3GDm8N2nK3z3rlhnsvDzxSdyUJgULG0TwdwjPg57Q5DoXJGcyEbUoNCD
   S+pQnaITzvM3RoBW+75xvSccmFCT+f/VyUrUtnj/A8I6vs8Lf687g2cL3
   DdO5iWmN3JtdURcDWEb1wm4qZVx0f1MeaBzXEWpIEBi61zK4w5iYDhPTt
   GbDJJ3l4eY0NKJw7xnM8B/woW0yJodo0ElmcjC1jbX6eL/gnkv/FO7bMS
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="230073199"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="230073199"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2022 23:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="696135344"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Jan 2022 23:39:38 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCcu1-000KwV-Ba; Wed, 26 Jan 2022 07:39:37 +0000
Date: Wed, 26 Jan 2022 15:39:17 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [morse:mpam/snapshot/v5.16 60/137] WARNING: modpost:
 vmlinux.o(.text+0x48087): Section mismatch in reference from the function
 resctrl_init() to the function .init.text:thread_throttle_mode_init()
Message-ID: <202201261528.jKedbVna-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v5.16
head:   364c1c42b229912132e1615c2ce15be7154e2156
commit: 5d118e3da1ad725c2ea8da30eda516096e550289 [60/137] x86/resctrl: Drop __init/__exit on assorted symbols
config: i386-randconfig-a011-20220124 (https://download.01.org/0day-ci/archive/20220126/202201261528.jKedbVna-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e128e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/commit/?id=5d118e3da1ad725c2ea8da30eda516096e550289
        git remote add morse https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git
        git fetch --no-tags morse mpam/snapshot/v5.16
        git checkout 5d118e3da1ad725c2ea8da30eda516096e550289
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux.o(.text+0x48087): Section mismatch in reference from the function resctrl_init() to the function .init.text:thread_throttle_mode_init()
The function resctrl_init() references
the function __init thread_throttle_mode_init().
This is often because resctrl_init lacks a __init
annotation or the annotation of thread_throttle_mode_init is wrong.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
