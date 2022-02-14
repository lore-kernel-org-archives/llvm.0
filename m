Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181037E4
	for <llvm@lists.linux.dev>; Mon, 14 Feb 2022 04:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644814788; x=1676350788;
  h=date:from:cc:subject:message-id:mime-version;
  bh=mnVdV9g6h7sGGeNidmpco4mIzuDJEZ7mJohPavhO5m0=;
  b=DE7dXO4sfWEGp96dK9tAU2RQT/kXFVb7lpCcwTbfdhdiDX0p1V942KAK
   iDqB8c5xFaBInG5OM8/KoIU1unAWy5qQv7Sty/ZvlYc6nCWQBoqqgHiTA
   5Cu5ZE7FYb9VEpMq+NEmtsUIDsKmGScm4n4sdvbkuXTA8zrfF0tNDjMq/
   NUdpBX864p7I1osYj6+Nbz3L7c0QvRaUo/xnLqRO00W3CA8GDZcGR6hEa
   l9SQv5xC8slwVrktGetcvByHyUz5mku/sGKHHdgYpjQpzi/IT286OHw15
   K9+qg0vu2vgMIW9hDElKbO2/CwQ5XftjFUDLN437Ooc/qjgmh2+pGS6j+
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10257"; a="230649798"
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; 
   d="scan'208";a="230649798"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2022 20:59:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,366,1635231600"; 
   d="scan'208";a="495144459"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Feb 2022 20:59:45 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nJTSj-0008CB-8q; Mon, 14 Feb 2022 04:59:45 +0000
Date: Mon, 14 Feb 2022 12:59:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: kernel/built-in.a(kallsyms.o):(function reset_iter:
 .text+0xb0e): relocation R_RISCV_PCREL_HI20 out of range: -524453 is not in
 [-524288, 524287]; references kallsyms_markers
Message-ID: <202202141205.JHKIRnxH-lkp@intel.com>
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
TO: Gal Pressman <gal@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Tariq Toukan <tariqt@nvidia.com>
CC: Eric Dumazet <edumazet@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   754e0b0e35608ed5206d6a67a791563c631cec07
commit: 48cec899e357cfb92d022a9c0df6bbe72a7f6951 tcp: Add a stub for sk_defer_free_flush()
date:   3 weeks ago
config: riscv-randconfig-r016-20220213 (https://download.01.org/0day-ci/archive/20220214/202202141205.JHKIRnxH-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project ea071884b0cc7210b3cc5fe858f0e892a779a23b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=48cec899e357cfb92d022a9c0df6bbe72a7f6951
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 48cec899e357cfb92d022a9c0df6bbe72a7f6951
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function reset_iter: .text+0xb0e): relocation R_RISCV_PCREL_HI20 out of range: -524453 is not in [-524288, 524287]; references kallsyms_markers
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function reset_iter: .text+0xb20): relocation R_RISCV_PCREL_HI20 out of range: -524453 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0xb8c): relocation R_RISCV_PCREL_HI20 out of range: -524453 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0xbb8): relocation R_RISCV_PCREL_HI20 out of range: -524453 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
