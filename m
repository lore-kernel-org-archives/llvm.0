Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0FE173
	for <llvm@lists.linux.dev>; Wed, 19 Jan 2022 00:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1642553954; x=1674089954;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Mu4lZTU1RSlvlw4Mq8oI2HoHgVbxoDGDrDQ9dFwGk2s=;
  b=VK6W3Bh2fpP6IFJ3C5vBGh7YmlR1OQ6EpLZI3nuezTJXj9RBxDwDA3lQ
   TOlqO2FIPw2UkEbFUQcEA1/KOc+hLhxLPkVYoc63EsZtwOfUx/rn7xRP3
   WNlF9K9fmfQiTKYAg17GNNptK9VZuPQdLYmpFReedCzUWQk65iZIv5lGN
   GARNOa7wDTdViKd/doHgNfgonh/fadJheoshQFqBOEOMwpsu0t5XtCdjB
   Ht6Qr4Mr8BOC92woWSA1T8ghRWL2BGYVavpQANcqj+9d57iJ8ERGpvXa9
   oEsWn/sZ0herl2QEwF6M/HuR2LfbMm7hhQfsgvCZV1zSALQxTf/H2vDmQ
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="308294334"
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; 
   d="scan'208";a="308294334"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2022 16:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,298,1635231600"; 
   d="scan'208";a="532031592"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Jan 2022 16:59:12 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n9zJg-000D5W-4y; Wed, 19 Jan 2022 00:59:12 +0000
Date: Wed, 19 Jan 2022 08:58:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 12073/12461] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function update_iter: .text+0x11dc):
 relocation R_RISCV_PCREL_HI20 out of range: -524582 is not in [-524288,
 524287]; references kallsyms_names
Message-ID: <202201190810.SMzRmKCt-lkp@intel.com>
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
TO: Hans de Goede <hdegoede@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f59bc242877fcb9c9a5136ea62d383fce5615df
commit: 23636544a3a42f5884e73233778934b501f96af9 [12073/12461] proc: make the proc_create[_data]() stubs static inlines
config: riscv-randconfig-r012-20220116 (https://download.01.org/0day-ci/archive/20220119/202201190810.SMzRmKCt-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project c10cbb243cafc0cf42c3e922cb29183279444432)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=23636544a3a42f5884e73233778934b501f96af9
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 23636544a3a42f5884e73233778934b501f96af9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0x11dc): relocation R_RISCV_PCREL_HI20 out of range: -524582 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)
--
>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function update_iter: .text+0x11ec): relocation R_RISCV_PCREL_HI20 out of range: -524582 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
