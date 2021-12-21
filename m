Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E62C9C
	for <llvm@lists.linux.dev>; Tue, 21 Dec 2021 01:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640051620; x=1671587620;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fGWc9OGexhAuL+XwExyMXw/N5l7laR2wlnZnfj0Jqmw=;
  b=caJAmoTRpSqjg51NivyXVH0z9z/TqXIqQWTjMHPKP6NaonGtn6m+R/S4
   peOSGeqVXm5hPsSFa3DTSccG6tBmCgK8fjja1cw35LDta7OZl1nWzx5+z
   93hWInUgsHS5gc6p0lnOs1EF/vq+JKXG3RbyHGRxnloCVPGRVFNtNze30
   1S/pyCL/LPnSAi8D/rs4G8F6tp0swkVvH4pgpMNWEH9unt9LiZ1YIo0DY
   8aHuACjsKZL2DHCLvBd9kt0u8IzrkeWAUJgvIZTr7lRpRI9oGtovOUkgY
   w1qyVq+G0GLVRXXUUIqZ5J1hLjVjl1M21yJuN+J7jg4hTVWwsMGjuk0SQ
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10204"; a="264491190"
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; 
   d="scan'208";a="264491190"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2021 17:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,222,1635231600"; 
   d="scan'208";a="507897668"
Received: from lkp-server02.sh.intel.com (HELO 9f38c0981d9f) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 20 Dec 2021 17:53:38 -0800
Received: from kbuild by 9f38c0981d9f with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mzULR-0008XC-Oy; Tue, 21 Dec 2021 01:53:37 +0000
Date: Tue, 21 Dec 2021 09:53:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 7629/8898] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_buildid:
 .text+0x490): relocation R_RISCV_PCREL_HI20 out of range: -524452 is not in
 [-524288, 524287]; references kallsyms_token_index
Message-ID: <202112210911.BJ42CgD4-lkp@intel.com>
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
TO: Kees Cook <keescook@chromium.org>
CC: Marco Elver <elver@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   07f8c60fe60f84977dc815ec8a6b1100827c34dd
commit: 70a691bde53c0f7b8e2ff04e1a59f710ae355b69 [7629/8898] ubsan: remove CONFIG_UBSAN_OBJECT_SIZE
config: riscv-randconfig-r042-20211220 (https://download.01.org/0day-ci/archive/20211221/202112210911.BJ42CgD4-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 555eacf75f21cd1dfc6363d73ad187b730349543)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=70a691bde53c0f7b8e2ff04e1a59f710ae355b69
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 70a691bde53c0f7b8e2ff04e1a59f710ae355b69
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_buildid: .text+0x490): relocation R_RISCV_PCREL_HI20 out of range: -524452 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup_buildid: .text+0x498): relocation R_RISCV_PCREL_HI20 out of range: -524452 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
