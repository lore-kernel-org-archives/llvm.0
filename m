Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF50168
	for <llvm@lists.linux.dev>; Fri,  7 Jan 2022 12:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641558248; x=1673094248;
  h=date:from:cc:subject:message-id:mime-version;
  bh=xg39QIhkC+DwoQ5dfoQmwxUJnabfoqeV/hoRP1e7e38=;
  b=JAFHVgpTgzYYcZfH6G1vV5rfEvGIypbrYfDqFdCaQim1Si2QtO+PeuHm
   8BnWPDk5ZDwMaz5yf0QJ/03DHG8gG6nKo2FbujCy/TEFAjug1bSbpFBbH
   grKj210R6Gmcn2g0g5zD++m75x0FFUrXidImb050PZZt2NznxE4hOj3AE
   BUfxldBqbsInjkcMNcjYFMSace1D4bWEQltsNjp1h6OlJ/1SzvXpUWDd7
   8gHuV4e43CX50pBQw8pkHG0NsI0toydJ3yIx53wg3eAja7HtcLqumPz9I
   oaGW4gSOq4MarhI5wvglWycNNA5BxzzU6qEwAcURUX8C8gM7SB/MB2dgW
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="223552658"
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; 
   d="scan'208";a="223552658"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2022 04:24:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,269,1635231600"; 
   d="scan'208";a="489277860"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 07 Jan 2022 04:24:06 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n5oHj-000Ifg-Sd; Fri, 07 Jan 2022 12:23:55 +0000
Date: Fri, 7 Jan 2022 20:23:00 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: section .dynamic file range overlaps with .text
Message-ID: <202201072047.0pSp9Xjg-lkp@intel.com>
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
head:   ddec8ed2d4905d0967ce2ec432e440e582aa52c6
commit: dffe11e280a42c2501e5b0cdebd85a77f539bb05 riscv/vdso: Add support for time namespaces
date:   3 months ago
config: riscv-buildonly-randconfig-r001-20220107 (https://download.01.org/0day-ci/archive/20220107/202201072047.0pSp9Xjg-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 32167bfe64a4c5dd4eb3f7a58e24f4cba76f5ac2)
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
   >>> .dynamic range is [0x7D0, 0x8FF]
   >>> .text range is [0x800, 0x182F]
--
>> ld.lld: error: section .text file range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x182F]
   >>> _ftrace_annotated_branch range is [0x900, 0xC5F]
--
>> ld.lld: error: section .dynamic virtual address range overlaps with .text
   >>> .dynamic range is [0x7D0, 0x8FF]
   >>> .text range is [0x800, 0x182F]
--
>> ld.lld: error: section .text virtual address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x182F]
   >>> _ftrace_annotated_branch range is [0x900, 0xC5F]
--
>> ld.lld: error: section .dynamic load address range overlaps with .text
   >>> .dynamic range is [0x7D0, 0x8FF]
   >>> .text range is [0x800, 0x182F]
--
>> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x182F]
   >>> _ftrace_annotated_branch range is [0x900, 0xC5F]
--
>> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x182F]
   >>> _ftrace_annotated_branch range is [0x900, 0xC5F]
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts
>> ld.lld: error: section .dynamic file range overlaps with .text
   >>> .dynamic range is [0x7D0, 0x8FF]
   >>> .text range is [0x800, 0x182F]
--
>> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x182F]
   >>> _ftrace_annotated_branch range is [0x900, 0xC5F]
   llvm-nm: error: arch/riscv/kernel/vdso/vdso.so.dbg: No such file or directory

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
