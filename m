Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56ECA2CA0
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 09:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640080590; x=1671616590;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Jb2j9J1TFENipxHSoQK8a4GSiT/8jNnrsJkL6MYH1Zg=;
  b=VPhEGRoX7NyXzJSqnYP10X5OjqlGLKwXOqhxoB64ILU+v5uhFGmOQGcp
   SqRmAgNWVOcKF+vIc7O/JHI2oQdQXj8ho1VIuoUlsWs2jYoOVC58vyKvC
   uCXfnj5PsUwObi3F+XXlPliYSQ7pYbpl1QJIPe316rk/3U9sgJ5tt4EpV
   etNh/S6VhRetPtG8vxKFY2dNeHbpRziDtoT5s/kB5g0X4yvo9eTd1cxso
   uQ7IhgMEaeG01+rZkWIH2deKgGkoBTQYgDsLuGUacUb9k9qQK/ctkZCuS
   iZyggpOewpiLmxV3WqHqA05zF5OcPWVYxViArAV8tXgwLysUM8+HYfISj
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="240171625"
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="240171625"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 01:55:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,223,1635231600"; 
   d="scan'208";a="521184271"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Dec 2021 01:55:51 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzbs7-0008yB-4F; Tue, 21 Dec 2021 09:55:51 +0000
Date: Tue, 21 Dec 2021 17:55:32 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 4455/8898] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function kallsyms_open: .text+0x12c0):
 relocation R_RISCV_PCREL_HI20 out of range: -524532 is not in [-524288,
 524287]; references kallsyms_markers
Message-ID: <202112211750.5myzqdtX-lkp@intel.com>
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
TO: Miguel Ojeda <ojeda@kernel.org>
CC: Alex Gaynor <alex.gaynor@gmail.com>
CC: Wedson Almeida Filho <wedsonaf@google.com>
CC: Gary Guo <gary@garyguo.net>
CC: Boqun Feng <boqun.feng@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   07f8c60fe60f84977dc815ec8a6b1100827c34dd
commit: 026221a07000d799269199c93d734cb2f4b731a8 [4455/8898] kallsyms: support "big" kernel symbols
config: riscv-buildonly-randconfig-r004-20211220 (https://download.01.org/0day-ci/archive/20211221/202112211750.5myzqdtX-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=026221a07000d799269199c93d734cb2f4b731a8
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 026221a07000d799269199c93d734cb2f4b731a8
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_open: .text+0x12c0): relocation R_RISCV_PCREL_HI20 out of range: -524532 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
