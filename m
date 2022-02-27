Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F704A83
	for <llvm@lists.linux.dev>; Sun, 27 Feb 2022 16:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645978718; x=1677514718;
  h=date:from:cc:subject:message-id:mime-version;
  bh=lO3bLT5AeXWJ5qunGRLafy+z+nNfefN9Qlpa/NApswM=;
  b=RGBlzrsbolP2lh2qQYcFgEt7bnbcwYvWt9d8d5vMcR821JYCBfYfdquP
   G7VhoqKCelnla36JA8oKYVSAYqQOL3cSz67sjHa+hRzW0YfCY+h0cDH7Z
   wIt3sNLQRNn8lGMrzQXJsThi9NhYxfy/FPmZSOtCTz1I9Z7fYr7T1k/7V
   zi19/H0eyBHkPIMTiNF5NyOZikcliqqIEM1aksgJr7AttXXFIcGPi0FF6
   9QdXiv0B8YldmdmaXgyE+ndXpPQsgcKKzN5UdiLmzCX0+nSuNSYXMFBYi
   i7X7noSS4pesPYnFj7oKuBTZ1rAOLnORbEy9rPfMHNW2cOdPLGaJczkMU
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="252670478"
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; 
   d="scan'208";a="252670478"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2022 08:18:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,141,1643702400"; 
   d="scan'208";a="640635429"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 Feb 2022 08:18:37 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nOMFo-0006d5-EW; Sun, 27 Feb 2022 16:18:36 +0000
Date: Mon, 28 Feb 2022 00:17:46 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [krzk-github:n/driver-override-v3 3/14] ld.lld: error:
 kernel/built-in.a(bpf/btf.o):(function btf_parse_vmlinux: .text+0x1864):
 relocation R_RISCV_PCREL_HI20 out of range: -524573 is not in [-524288,
 524287]; references __start_BTF
Message-ID: <202202280057.yF03bpot-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/driver-override-v3
head:   2c511c1ba6dc5deb9712f2bcebfc964ea23b6209
commit: e4823f160612e013b11cd211995b59554d07ea03 [3/14] fixup
config: riscv-buildonly-randconfig-r006-20220227 (https://download.01.org/0day-ci/archive/20220228/202202280057.yF03bpot-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/krzk/linux/commit/e4823f160612e013b11cd211995b59554d07ea03
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/driver-override-v3
        git checkout e4823f160612e013b11cd211995b59554d07ea03
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: kernel/built-in.a(bpf/btf.o):(function btf_parse_vmlinux: .text+0x1864): relocation R_RISCV_PCREL_HI20 out of range: -524573 is not in [-524288, 524287]; references __start_BTF
   >>> referenced by btf.c
   >>> defined in kernel/built-in.a(bpf/btf.o)
--
>> ld.lld: error: kernel/built-in.a(bpf/btf.o):(function btf_parse_vmlinux: .text+0x1870): relocation R_RISCV_PCREL_HI20 out of range: -524573 is not in [-524288, 524287]; references __stop_BTF
   >>> referenced by btf.c
   >>> defined in kernel/built-in.a(bpf/btf.o)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
