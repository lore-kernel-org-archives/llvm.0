Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA77A2F26
	for <llvm@lists.linux.dev>; Fri,  4 Feb 2022 01:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643938307; x=1675474307;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Zma4VorC+cs1TXhDpDCR9bpueCZR46i7lgj5N0Cag3A=;
  b=Olj5eV1X+u4wr0T+UFRAKBrfiAhkgqsRPA+riU+oS7sF/htJsklNj4xc
   TLrgse+QZhIFBebXZtMpB4HjdoEcBxudH5OPkkHK3i4tjlwTw2stXotH5
   y0OipW5yMFCwToJ0M296xnukWxKoRUyYTB3fg/7+HTEEj4hoZdQwxpwwJ
   Nj0c8zMNOvpRKzuLWTJTCmo5G2shjX9H0lW+BWCr0fLRD++hOgO6F7XFX
   vwmlWTrmz34Wbwy0I3HiWZmJioD/wlMRef2517su0iJGIv4GI5lrWIm8A
   STmy7rgNb0hGWOBqvhXdN71ark/D+ezviVI1TYMFAba+QznU3sT+2neNz
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="228264717"
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="228264717"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2022 17:31:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,340,1635231600"; 
   d="scan'208";a="566608966"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Feb 2022 17:31:45 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nFnRx-000Ww8-3z; Fri, 04 Feb 2022 01:31:45 +0000
Date: Fri, 4 Feb 2022 09:30:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range:
 34075148288 is not in
Message-ID: <202202040710.uRW0o2ty-lkp@intel.com>
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
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Will Deacon <will@kernel.org>
CC: Fangrui Song <maskray@google.com>

Hi Ard,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f2cfdd349b7647f438c1e552dc1b983da86d830
commit: 13150bc5416f45234c955e5bed91623d178c6117 module: use hidden visibility for weak symbol references
date:   1 year, 3 months ago
config: arm64-randconfig-r035-20220130 (https://download.01.org/0day-ci/archive/20220204/202202040710.uRW0o2ty-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project a73e4ce6a59b01f0e37037761c1e6889d539d233)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=13150bc5416f45234c955e5bed91623d178c6117
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 13150bc5416f45234c955e5bed91623d178c6117
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 34075148288 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 34075148288 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 34075148288 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 34075148288 is not in [-4294967296, 4294967295]
>> ld.lld: error: relocation R_AARCH64_ADR_PREL_PG_HI21 out of range: 34075148288 is not in [-4294967296, 4294967295]

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
