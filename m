Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D67173
	for <llvm@lists.linux.dev>; Tue, 28 Dec 2021 13:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640696946; x=1672232946;
  h=date:from:cc:subject:message-id:mime-version;
  bh=T9KienbKoJRSijMppvQxduQLqVCCs4k5PR0zcKzGI2E=;
  b=bmrcvJwyn0N2ApfQEu1XMOYyvGQLVvT6HJvxRu6AxkyZOFkgke20TFot
   TsxtYFAh4BtVLGKkyTzZ9j+n4n8eGWR8GY7LvSzKMWcn++TGolfwPuVbD
   B5Jg+XhrPWtfPNpI6lIGXUHTzCG0PgeKtrFVrDOTJCo18z7nbCtBA232c
   J0feQWg1GYKBBL1hFtKDPFckS3RaEfIDIs6RycKNnGiDTpvcZsKas2DEK
   mlSZLvF9ZSR/A5ue14g1g9uRSN8GOvzP4fmnTmBoqg2IoQmYiijao5ipW
   4pIL0MwyOlCMa+/GHHqgZQfvYyDbib/Bjx47YCf5T8RT6KMdvZ0CZ8chD
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="304721083"
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; 
   d="scan'208";a="304721083"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2021 05:09:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; 
   d="scan'208";a="470024011"
Received: from lkp-server01.sh.intel.com (HELO e357b3ef1427) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Dec 2021 05:09:04 -0800
Received: from kbuild by e357b3ef1427 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1n2CDw-0007Zh-4n; Tue, 28 Dec 2021 13:09:04 +0000
Date: Tue, 28 Dec 2021 21:08:11 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: ld.lld: error: section .dynamic file range overlaps with .text
Message-ID: <202112282014.LvW1YqPi-lkp@intel.com>
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
head:   a8ad9a2434dc7967ab285437f443cae633b6fc1c
commit: dffe11e280a42c2501e5b0cdebd85a77f539bb05 riscv/vdso: Add support for time namespaces
date:   3 months ago
config: riscv-buildonly-randconfig-r005-20211228 (https://download.01.org/0day-ci/archive/20211228/202112282014.LvW1YqPi-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 7171af744543433ac75b232eb7dfdaef7efd4d7a)
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
   >>> .text range is [0x800, 0x1C57]
--
>> ld.lld: error: section .text file range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x1C57]
   >>> _ftrace_annotated_branch range is [0x900, 0xC5F]
--
>> ld.lld: error: section .dynamic virtual address range overlaps with .text
   >>> .dynamic range is [0x7D0, 0x8FF]
   >>> .text range is [0x800, 0x1C57]
--
>> ld.lld: error: section .text virtual address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x1C57]
   >>> _ftrace_annotated_branch range is [0x900, 0xC5F]
--
>> ld.lld: error: section .dynamic load address range overlaps with .text
   >>> .dynamic range is [0x7D0, 0x8FF]
   >>> .text range is [0x800, 0x1C57]
--
>> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x1C57]
   >>> _ftrace_annotated_branch range is [0x900, 0xC5F]
--
>> ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x1C57]
   >>> _ftrace_annotated_branch range is [0x900, 0xC5F]
   llvm-nm: error: arch/riscv/kernel/vdso/vdso.so.dbg: No such file or directory

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
