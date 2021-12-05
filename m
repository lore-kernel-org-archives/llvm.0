Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EE1168
	for <llvm@lists.linux.dev>; Sun,  5 Dec 2021 01:03:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10188"; a="237094557"
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; 
   d="scan'208";a="237094557"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2021 17:03:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,288,1631602800"; 
   d="scan'208";a="461401608"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Dec 2021 17:03:07 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mtfvm-000Jdv-EF; Sun, 05 Dec 2021 01:03:06 +0000
Date: Sun, 5 Dec 2021 09:02:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: section .dynamic file range overlaps with .text
Message-ID: <202112050859.LDwHSVrD-lkp@intel.com>
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
TO: Tong Tiangen <tongtiangen@huawei.com>
CC: Palmer Dabbelt <palmerdabbelt@google.com>

Hi Tong,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23b55d673d7527b093cd97b7c217c82e70cd1af0
commit: dffe11e280a42c2501e5b0cdebd85a77f539bb05 riscv/vdso: Add support for time namespaces
date:   9 weeks ago
config: riscv-randconfig-r024-20211205 (https://download.01.org/0day-ci/archive/20211205/202112050859.LDwHSVrD-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5f1d1854eb1450d352663ee732235893c5782237)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dffe11e280a42c2501e5b0cdebd85a77f539bb05
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dffe11e280a42c2501e5b0cdebd85a77f539bb05
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: section .dynamic file range overlaps with .text
   >>> .dynamic range is [0x710, 0x83F]
   >>> .text range is [0x800, 0x120B]
--
>> ld.lld: error: section .text file range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x120B]
   >>> _ftrace_annotated_branch range is [0x840, 0xB9F]
--
>> ld.lld: error: section .dynamic virtual address range overlaps with .text
   >>> .dynamic range is [0x710, 0x83F]
   >>> .text range is [0x800, 0x120B]
--
>> ld.lld: error: section .text virtual address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x120B]
   >>> _ftrace_annotated_branch range is [0x840, 0xB9F]
--
>> ld.lld: error: section .dynamic load address range overlaps with .text
   >>> .dynamic range is [0x710, 0x83F]
   >>> .text range is [0x800, 0x120B]
--
>> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x120B]
   >>> _ftrace_annotated_branch range is [0x840, 0xB9F]
--
>> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x120B]
   >>> _ftrace_annotated_branch range is [0x840, 0xB9F]
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts
>> ld.lld: error: section .dynamic file range overlaps with .text
   >>> .dynamic range is [0x710, 0x83F]
   >>> .text range is [0x800, 0x120B]
--
>> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x120B]
   >>> _ftrace_annotated_branch range is [0x840, 0xB9F]
   llvm-nm: error: arch/riscv/kernel/vdso/vdso.so.dbg: No such file or directory

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
