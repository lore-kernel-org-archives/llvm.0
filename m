Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096271FAA
	for <llvm@lists.linux.dev>; Tue, 13 Sep 2022 01:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663032701; x=1694568701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GcriuGJN8QkCZ6dALbv+nUQS22ajzVge8n1O9gPcMA=;
  b=gkoMHQx3+g8aTQaoV0mCCPELX4RK/nnc6Z/aeNGzhLq3E/5SBeEyILku
   xDuUmmMHR8iVSuQTHoak860w7RBVgCYCe0fTd1xcgIMcxO3IslGWXkMku
   03bPSTH9Hsk7eSuZUkxDpDPgEENEtP4d9GjtA6DeTw4fiuh8PXC38chKJ
   +ooWv18bkB4s0V6MkNl/WcMJ5BJP98nGNk8HSJJzzo7jdg+cLACqtNPVy
   6onKZPP0h1pX93JRlhd4suaKsMJFevwKlTHTkWvg+u87syTbEGpIeQ8zY
   ug5Kzb2lS76P3fJ9WRdIqfQt7iZFiSoFmytJxdFR0EBrWmx9KR5FP/s7S
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="359736835"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="359736835"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2022 18:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; 
   d="scan'208";a="944856083"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Sep 2022 18:31:38 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oXum2-00033x-0f;
	Tue, 13 Sep 2022 01:31:38 +0000
Date: Tue, 13 Sep 2022 09:30:58 +0800
From: kernel test robot <lkp@intel.com>
To: Saleem Abdulrasool <abdulras@google.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmerdabbelt@google.com>
Subject: llvm-nm: error: arch/riscv/kernel/vdso/vdso.so.dbg: No such file or
 directory
Message-ID: <202209130916.1lUqRlBJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Saleem,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e839a756012b6cad7a4eeb67b0598ac3f349f863
commit: fde9c59aebafb91caeed816cc510b56f14aa63ae riscv: explicitly use symbol offsets for VDSO
date:   1 year, 1 month ago
config: riscv-randconfig-r031-20220911 (https://download.01.org/0day-ci/archive/20220913/202209130916.1lUqRlBJ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 1546df49f5a6d09df78f569e4137ddb365a3e827)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fde9c59aebafb91caeed816cc510b56f14aa63ae
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout fde9c59aebafb91caeed816cc510b56f14aa63ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv prepare

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld.lld: error: section .text load address range overlaps with _ftrace_annotated_branch
   >>> .text range is [0x800, 0x112B]
   >>> _ftrace_annotated_branch range is [0x840, 0xAAF]
>> llvm-nm: error: arch/riscv/kernel/vdso/vdso.so.dbg: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
