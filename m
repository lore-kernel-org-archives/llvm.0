Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E478517E9
	for <llvm@lists.linux.dev>; Mon, 28 Mar 2022 07:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648453842; x=1679989842;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jlKlj0NQNWN05aZExDwr/vExb1oiL3GMzMEuXefJ6b8=;
  b=gnTnXRrwn85FtTSjUZ71q9uLAznqHD19+P93VQ1yDYWKERW5900iZbIz
   BGD4NKfaFzoNz3t5HI922mkycJ418xmsxVOk0lc/ohjQgs9UwM4gxRKOM
   dDbmzkyaMmxAXYGEWlVhRQUf3OeaYGFDtcPo2W6JJkQ+yvyZ27ZuFhXsb
   3Db2k+AibL7WAVHEMof2C/EthzgEHXF8rRMc3TIV5DbrHUJI9EUOELsPh
   bsZbvdrR7k/SQZSa4VYu0wZY2zSS9EgvwAjgQQZZC9TZyYRvlqNzQlWd3
   IUJ1BkI7Ofxp7+qdVWaWl8OmJ8lo60lONlceQU/Msnm2g/Exp2EzxRkvD
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="241090719"
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="241090719"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2022 00:50:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,216,1643702400"; 
   d="scan'208";a="502423396"
Received: from lkp-server02.sh.intel.com (HELO 89b41b6ae01c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 28 Mar 2022 00:50:40 -0700
Received: from kbuild by 89b41b6ae01c with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nYk99-0001qz-Ol; Mon, 28 Mar 2022 07:50:39 +0000
Date: Mon, 28 Mar 2022 15:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <anup@brainfault.org>, linux-doc@vger.kernel.org
Subject: arch/riscv/kernel/cpu.c:113: warning: This comment starts with
 '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202203281524.uFcj0Opf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ae085d7f9365de7da27ab5c0d16b12d51ea7fca9
commit: a9b202606c69312cdaa4db187837820ebf7213b2 RISC-V: Improve /proc/cpuinfo output for ISA extensions
date:   11 days ago
config: riscv-randconfig-r042-20220328 (https://download.01.org/0day-ci/archive/20220328/202203281524.uFcj0Opf-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0f6d9501cf49ce02937099350d08f20c4af86f3d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a9b202606c69312cdaa4db187837820ebf7213b2
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout a9b202606c69312cdaa4db187837820ebf7213b2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/ drivers/perf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/riscv/kernel/cpu.c:89: warning: cannot understand function prototype: 'struct riscv_isa_ext_data isa_ext_arr[] = '
>> arch/riscv/kernel/cpu.c:113: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * These are the only valid base (single letter) ISA extensions as per the spec.


vim +113 arch/riscv/kernel/cpu.c

   111	
   112	/**
 > 113	 * These are the only valid base (single letter) ISA extensions as per the spec.
   114	 * It also specifies the canonical order in which it appears in the spec.
   115	 * Some of the extension may just be a place holder for now (B, K, P, J).
   116	 * This should be updated once corresponding extensions are ratified.
   117	 */
   118	static const char base_riscv_exts[13] = "imafdqcbkjpvh";
   119	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
