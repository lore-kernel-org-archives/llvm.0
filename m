Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11EB2C82
	for <llvm@lists.linux.dev>; Wed, 26 Jan 2022 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643193168; x=1674729168;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vVnDq34QCosDr2LiFgNPae9cRy7wVW5kVSfd3omD9Uw=;
  b=O2QVQO1NdfkH+TFLILGPpCXozr+VbIv92Z2gG4NzkOPDpidejy7NVSIW
   SoY2USgdN+T5yKB96tc2yX55PKoCQcyAGUJWFoD246Dce5Kei53GNtqxB
   /zafEoIbJKKmjCa/37+WEh8fIgGqx9pkGtPC8RgoSkfxGpu4shjDa1bPk
   OMFCQOBbGmd1c5fPpBSyxHhvH7ixRuN+/P9bD5dW/SPFmv2dEhvWV7LT2
   CeCzsp+DHOgnP0lRhpwnfl/8Q9fzxo5fk6TdB+ox2/SBnu/fF82zXrOHl
   YTS9iBJzcTkxO4fRVYsV0W5bf0ax/DUP7A/qdXDCGOaWoj8EkrCcT75+G
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10238"; a="245355394"
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="245355394"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2022 02:32:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,317,1635231600"; 
   d="scan'208";a="674320932"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2022 02:32:47 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nCfba-000L5E-Lg; Wed, 26 Jan 2022 10:32:46 +0000
Date: Wed, 26 Jan 2022 18:31:54 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-next:master 1053/1734] ld.lld: error:
 init/built-in.a(main.o):(function trace_initcall_start: .text+0x650):
 relocation R_RISCV_HI20 out of range: 528388 is not in [-524288, 524287];
 references __tracepoint_initcall_start
Message-ID: <202201261832.05MibUeB-lkp@intel.com>
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
TO: Stanislav Jakubek <stano.jakubek@gmail.com>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d25ee88530253138d0b20d43511ca5acbda4e9f7
commit: 066aef69079415b3c873c7fee1c1022c511c4045 [1053/1734] dt-bindings: serial: Convert rda,8810pl-uart to YAML
config: riscv-buildonly-randconfig-r001-20220124 (https://download.01.org/0day-ci/archive/20220126/202201261832.05MibUeB-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 2a1b7aa016c0f4b5598806205bdfbab1ea2d92c4)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=066aef69079415b3c873c7fee1c1022c511c4045
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 066aef69079415b3c873c7fee1c1022c511c4045
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(main.o):(function trace_initcall_start: .text+0x650): relocation R_RISCV_HI20 out of range: 528388 is not in [-524288, 524287]; references __tracepoint_initcall_start
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function trace_initcall_start: .text+0x694): relocation R_RISCV_HI20 out of range: 528387 is not in [-524288, 524287]; references trace_initcall_start.__warned
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function trace_initcall_start: .text+0x6a8): relocation R_RISCV_HI20 out of range: 528048 is not in [-524288, 524287]; references .L.str.57
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function trace_initcall_start: .text+0x6d8): relocation R_RISCV_HI20 out of range: 528404 is not in [-524288, 524287]; references __cpu_online_mask
   >>> referenced by main.c
   >>> defined in kernel/built-in.a(cpu.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
