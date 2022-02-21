Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77642615C
	for <llvm@lists.linux.dev>; Mon, 21 Feb 2022 02:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645412045; x=1676948045;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YBiB8N4+/UqrxwO2UBOVjn/JmtmYtfSA57JBk0+K0IA=;
  b=cmQWx+KzeHGZ5Az93Sp2kImO4LShv5/AzFe6tnHPCB/gScSHlBpmKYX7
   jp6sp3agTic8EbnO6S7/8FDp1n85h9tylpckJmA1jTDeF3q145XJn1jKk
   SaV3kBzzx82WKmls4XSfX6v6+1juCekz4fz3f2hN7Zdigbgx8NqrTnz9N
   AwEtveM8hsdupbL6Q/mLdJexOJf5jhwli5xzmv07smTYmGBdXDDtc+xD6
   e8i9gXLjW3+UxKmlHgJJnW31sWWAUy/TponXpt5HXAjeqN5YwRJgFzqyk
   waYjwbUCy4AkvG5/kIuDI5uqB2mupjLCTT34boerGFHiIXT1Vb/7czZWM
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="314688600"
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="314688600"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2022 18:54:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,384,1635231600"; 
   d="scan'208";a="531682557"
Received: from lkp-server01.sh.intel.com (HELO da3212ac2f54) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Feb 2022 18:54:04 -0800
Received: from kbuild by da3212ac2f54 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nLypv-0001E6-G9; Mon, 21 Feb 2022 02:54:03 +0000
Date: Mon, 21 Feb 2022 10:53:01 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:queue/5.10 3891/9999] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function kallsyms_lookup: .text+0x654):
 relocation R_RISCV_PCREL_HI20 out of range: -525044 is not in [-524288,
 524287]; references kallsyms_token_table
Message-ID: <202202211056.TnJqoZKV-lkp@intel.com>
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
TO: Khem Raj <raj.khem@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Palmer Dabbelt <palmerdabbelt@google.com>
CC: Sasha Levin <sashal@kernel.org>

Hi Khem,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   683a16ca38ef0307a1b025bae4e4bd8304c27956
commit: bb73f2f789695028a4cc8baf9d6a8df03fb5ae14 [3891/9999] riscv: Use -mno-relax when using lld linker
config: riscv-randconfig-r003-20220220 (https://download.01.org/0day-ci/archive/20220221/202202211056.TnJqoZKV-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git/commit/?id=bb73f2f789695028a4cc8baf9d6a8df03fb5ae14
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc queue/5.10
        git checkout bb73f2f789695028a4cc8baf9d6a8df03fb5ae14
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup: .text+0x654): relocation R_RISCV_PCREL_HI20 out of range: -525044 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
