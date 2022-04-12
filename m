Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C1B3D82
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 21:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649799978; x=1681335978;
  h=date:from:cc:subject:message-id:mime-version;
  bh=pUxRBs0JutkHwxlvDkJEA9k4C0XtgjokANMoeyyHU1k=;
  b=HCjusoyMjAqgF42NIhAfW8xh2KQa8qWoMvyRmPUZPsdzCoJu0gc0DWyR
   HeyXZU376dMiK3DoCTFVBNJu8YekGL9tvQbZtjXXzon9sfVqZlur6vVF+
   oeS5ggPWkT4jj5eZkRii+F+X2kqLgQeZmA/2rlEfVUYhXvuEF8BMKXe3Y
   +JEaKT9i9zf4p/lzS6I/9pUJleUUp6Gw3LFaEAryYAYtYRgK0iuvHjvo/
   dhp5WYbOvHJ+rFs96FdUzJzzv0vdllUlVvbQxGvTwztWISEtHXp/vRZIT
   y4Qm4EDsjkfzvE70qXtc8BdWocARgVeZuXfTn6VjAFSVK6tm2OV8FG3e5
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="243098277"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="243098277"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2022 14:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; 
   d="scan'208";a="724640311"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Apr 2022 14:46:16 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1neOL2-0003Bq-1W;
	Tue, 12 Apr 2022 21:46:16 +0000
Date: Wed, 13 Apr 2022 05:46:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [linux-stable-rc:queue/5.10 2688/9999] ld.lld: error:
 kernel/built-in.a(kallsyms.o):(function kallsyms_lookup: .text+0x6e4):
 relocation R_RISCV_PCREL_HI20 out of range: 33553705 is not in [-524288,
 524287]; references kallsyms_names
Message-ID: <202204130502.BLLV2Q8e-lkp@intel.com>
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
TO: Khem Raj <raj.khem@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Palmer Dabbelt <palmerdabbelt@google.com>
CC: Sasha Levin <sashal@kernel.org>

Hi Khem,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git queue/5.10
head:   b68f6a2cb08baf49e787c88f85391b58d6d2bc22
commit: bb73f2f789695028a4cc8baf9d6a8df03fb5ae14 [2688/9999] riscv: Use -mno-relax when using lld linker
config: riscv-randconfig-r042-20220412 (https://download.01.org/0day-ci/archive/20220413/202204130502.BLLV2Q8e-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project fe2478d44e4f7f191c43fef629ac7a23d0251e72)
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

>> ld.lld: error: kernel/built-in.a(kallsyms.o):(function kallsyms_lookup: .text+0x6e4): relocation R_RISCV_PCREL_HI20 out of range: 33553705 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in kernel/built-in.a(kallsyms.o)

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
