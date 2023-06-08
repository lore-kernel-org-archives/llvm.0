Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C284C84;
	Thu,  8 Jun 2023 05:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686203734; x=1717739734;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2Iucio4ou+pWP9d+rnZvmfJ3P/VBTd3iKUGOnWY6IeY=;
  b=QaAAeABxdZmtGXJvo2NmfWclmae3AlpV7+VUOsI/ri7rKoZZvA0fRvr4
   14fcguqXhBll32JiTvJ4krhjKM/OVpNXht3dfp7cxbmo43+BjeEkwXgcp
   dJufn8wQQZ0gzCj/Q5AD2ggNyLHMneRT6tXEJYYBjrhfP6iZFyTtVyabR
   cC2701qWKWnFO8pK5OYARA2ouNaEXVeyQI6q1mC4B1I1OqpFeH6Yp+biN
   GSc0kOURxsi4HBo2hqgUcQDLw1x91qjNfs19zhUhD4cLMYmuRA9UPnAvG
   vCPXVfGQvGTrifpAH8LgFjvJKA3n5I3g3KvjCB7P4LSFhGxltZaGMHt0V
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="423062895"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="423062895"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2023 22:55:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="709839416"
X-IronPort-AV: E=Sophos;i="6.00,226,1681196400"; 
   d="scan'208";a="709839416"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Jun 2023 22:55:32 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q78cO-0007NX-09;
	Thu, 08 Jun 2023 05:55:32 +0000
Date: Thu, 8 Jun 2023 13:54:30 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, llvm@lists.linux.dev
Subject: Re: [PATCH v2 bpf-next 17/18] libbpf: add BPF token support to
 bpf_prog_load() API
Message-ID: <202306081346.w8SEKYRr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In-Reply-To: <20230607235352.1723243-18-andrii@kernel.org>
References: <20230607235352.1723243-18-andrii@kernel.org>
TO: Andrii Nakryiko <andrii@kernel.org>
TO: bpf@vger.kernel.org
CC: linux-security-module@vger.kernel.org
CC: keescook@chromium.org
CC: brauner@kernel.org
CC: lennart@poettering.net
CC: cyphar@cyphar.com
CC: luto@kernel.org
CC: kernel-team@meta.com

Hi Andrii,

kernel test robot noticed the following build errors:

[auto build test ERROR on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrii-Nakryiko/bpf-introduce-BPF-token-object/20230608-080004
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230607235352.1723243-18-andrii%40kernel.org
patch subject: [PATCH v2 bpf-next 17/18] libbpf: add BPF token support to bpf_prog_load() API
config: riscv-randconfig-r033-20230607 (https://download.01.org/0day-ci/archive/20230608/202306081346.w8SEKYRr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add bpf-next https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
        git fetch bpf-next master
        git checkout bpf-next/master
        b4 shazam https://lore.kernel.org/r/20230607235352.1723243-18-andrii@kernel.org
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306081346.w8SEKYRr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(block/badblocks.o):(function badblocks_show: .text+0xff0): relocation R_RISCV_HI20 out of range: 532299 is not in [-524288, 524287]; references '.L.str.9'
   >>> referenced by badblocks.c
   >>> defined in vmlinux.a(block/badblocks.o)
--
>> ld.lld: error: vmlinux.a(block/badblocks.o):(function badblocks_store: .text+0x121c): relocation R_RISCV_HI20 out of range: 532284 is not in [-524288, 524287]; references '.L.str.10'
   >>> referenced by badblocks.c
   >>> defined in vmlinux.a(block/badblocks.o)
--
>> ld.lld: error: vmlinux.a(block/badblocks.o):(function badblocks_init: .text+0x1324): relocation R_RISCV_HI20 out of range: 532385 is not in [-524288, 524287]; references 'kmalloc_caches'
   >>> referenced by badblocks.c
   >>> defined in vmlinux.a(mm/slab_common.o)
--
>> ld.lld: error: vmlinux.a(block/badblocks.o):(function badblocks_init: .text+0x1354): relocation R_RISCV_HI20 out of range: 532048 is not in [-524288, 524287]; references '.L.str.11'
   >>> referenced by badblocks.c
   >>> defined in vmlinux.a(block/badblocks.o)
--
>> ld.lld: error: vmlinux.a(block/badblocks.o):(function badblocks_init: .text+0x135c): relocation R_RISCV_HI20 out of range: 535156 is not in [-524288, 524287]; references '__badblocks_init.__key'
   >>> referenced by badblocks.c
   >>> defined in vmlinux.a(block/badblocks.o)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
