Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BF364E
	for <llvm@lists.linux.dev>; Wed, 23 Feb 2022 01:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645578851; x=1677114851;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=baiESWHpz0uunVvIKgNkRVXZewJXUk6lExLWq9l8kD4=;
  b=QuA4kzAJl5wLsxgVVx3MYcVO+y+XPBvnHy4Vp3NuIE02tPakRDnxplVR
   PTVbYeUvtkIi/xGxBjiJ+AMfeh+f+oKfCH4YqFtju6vvR2yi4YUopfAYo
   bbUlwwSLT4+PQkHkfRotC2LCnfDCt78eXYjteayD6YorO65IJ6flxvvzD
   F/nU51A8PTfypj3ty+DHTvGm/4h+XeQqDEPt1evGVDTibxiwpULJKkHWC
   x5K+5TGOKjTVjW5Q+K5hdWKrPvSX7QJO75ghtNmf+3pHJdhywkNvvB4Ol
   N2RhIeKGD8YV1zagH1xX27vOX2Ag7i0TTm4Hg8Aupv4FOFgJB+ZpZ1NID
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="239243952"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="239243952"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2022 17:14:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; 
   d="scan'208";a="491005833"
Received: from lkp-server01.sh.intel.com (HELO 788b1cd46f0d) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 22 Feb 2022 17:14:10 -0800
Received: from kbuild by 788b1cd46f0d with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nMgEL-0000oj-5d; Wed, 23 Feb 2022 01:14:09 +0000
Date: Wed, 23 Feb 2022 09:13:20 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v5 6/6] RISC-V: Improve /proc/cpuinfo output for ISA
 extensions
Message-ID: <202202230903.M0qWlyy9-lkp@intel.com>
References: <20220222204811.2281949-7-atishp@rivosinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220222204811.2281949-7-atishp@rivosinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Atish,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.17-rc5 next-20220217]
[cannot apply to linux/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Atish-Patra/Provide-a-fraemework-for-RISC-V-ISA-extensions/20220223-045009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 917bbdb107f8767cb78f24e7d6725a2f93b9effe
config: riscv-randconfig-r042-20220221 (https://download.01.org/0day-ci/archive/20220223/202202230903.M0qWlyy9-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/0day-ci/linux/commit/a37fdf595f84ec4073cb280703a36d440a7e8f96
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Atish-Patra/Provide-a-fraemework-for-RISC-V-ISA-extensions/20220223-045009
        git checkout a37fdf595f84ec4073cb280703a36d440a7e8f96
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/riscv/kernel/cpu.c:99: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * These are the only valid base (single letter) ISA extensions as per the spec.


vim +99 arch/riscv/kernel/cpu.c

    97	
    98	/**
  > 99	 * These are the only valid base (single letter) ISA extensions as per the spec.
   100	 * It also specifies the canonical order in which it appears in the spec.
   101	 * Some of the extension may just be a place holder for now (B, K, P, J).
   102	 * This should be updated once corresponding extensions are ratified.
   103	 */
   104	static const char base_riscv_exts[13] = "imafdqcbkjpvh";
   105	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
