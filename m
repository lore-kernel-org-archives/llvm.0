Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E6D733E5
	for <llvm@lists.linux.dev>; Thu, 12 May 2022 17:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652377608; x=1683913608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nEYj3OOQ3m648qxqkrIqIyY2ESb4SDyzBsyU91pQbJw=;
  b=OGnDGfcZFhc+mNGnhlinKCV6k2/Wb8oStvyj4aIHJ2Qlz1NLQ6g3R7Tc
   EFdkkPOnuriUgMRXkcllJ4guPJYSVxJjQkR3hGvv/wT2baG1sXYxIEIfF
   IMfPhA0t+NJ0xyTQJG1ZGNKkx1quvrvKIjtu4lEgvHDYam+c0AOzZAsBQ
   xCq7ElR0+hU9FQ5LDOspJRMj8G6DRY8RhHCwUrBL6dUPEXcjpgTDFjs0J
   ZJA7wBStQuoIMvuIvWk24jQj56iNQzDHnax3+KatufB5aFy+EvSJpJAW2
   9O5g4KeASgtTsMPt9sseAIYMxzSdbrfQeoh+KfNMqifiNlDx32Kr9KDyK
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10345"; a="267677594"
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="267677594"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2022 10:32:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,220,1647327600"; 
   d="scan'208";a="624502461"
Received: from lkp-server01.sh.intel.com (HELO 5056e131ad90) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 12 May 2022 10:32:41 -0700
Received: from kbuild by 5056e131ad90 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1npCg4-000KkM-EI;
	Thu, 12 May 2022 17:32:40 +0000
Date: Fri, 13 May 2022 01:32:15 +0800
From: kernel test robot <lkp@intel.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmerdabbelt@google.com>
Subject: ld.lld: error: section .dynamic file range overlaps with .text
Message-ID: <202205130116.ow8tWsMr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Tong,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   feb9c5e19e913b53cb536a7aa7c9f20107bb51ec
commit: dffe11e280a42c2501e5b0cdebd85a77f539bb05 riscv/vdso: Add support for time namespaces
date:   7 months ago
config: riscv-randconfig-r035-20220512 (https://download.01.org/0day-ci/archive/20220513/202205130116.ow8tWsMr-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 18dd123c56754edf62c7042dcf23185c3727610f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=dffe11e280a42c2501e5b0cdebd85a77f539bb05
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout dffe11e280a42c2501e5b0cdebd85a77f539bb05
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: section .dynamic file range overlaps with .text
   >>> .dynamic range is [0x710, 0x83F]
   >>> .text range is [0x800, 0x11E7]
--
>> ld.lld: error: section .text file range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x11E7]
   >>> _ftrace_annotated_branch range is [0x840, 0xB9F]
--
>> ld.lld: error: section .dynamic virtual address range overlaps with .text
   >>> .dynamic range is [0x710, 0x83F]
   >>> .text range is [0x800, 0x11E7]
--
>> ld.lld: error: section .text virtual address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x11E7]
   >>> _ftrace_annotated_branch range is [0x840, 0xB9F]
--
>> ld.lld: error: section .dynamic load address range overlaps with .text
   >>> .dynamic range is [0x710, 0x83F]
   >>> .text range is [0x800, 0x11E7]
--
>> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x11E7]
   >>> _ftrace_annotated_branch range is [0x840, 0xB9F]
--
>> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x11E7]
   >>> _ftrace_annotated_branch range is [0x840, 0xB9F]
--
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> ld.lld: error: section .dynamic file range overlaps with .text
   >>> .dynamic range is [0x710, 0x83F]
   >>> .text range is [0x800, 0x11E7]
--
>> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x11E7]
   >>> _ftrace_annotated_branch range is [0x840, 0xB9F]
   llvm-nm: error: arch/riscv/kernel/vdso/vdso.so.dbg: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
