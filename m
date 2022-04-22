Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC262901
	for <llvm@lists.linux.dev>; Fri, 22 Apr 2022 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1650641188; x=1682177188;
  h=date:from:cc:subject:message-id:mime-version;
  bh=fTWNjjODCCniKEyoV4eArqged7USGeqSDnoRcMoafoM=;
  b=F0BabJMDU0GNRZ5tbsxFHHW77f0dPOLadJhayzbYJ5bp1s4zzZooOlaz
   Eo34kyjojRqAlM5mZu889qUwODhLFFh59aLkVE7xGaMdMw8u4wDxT+ojO
   5bcAC9Myn+U7VQ0HtNDreaFe/MjHdAqi4topdRGlX7R0oMWDQQTC1sf9G
   J0C74w1LsBCiW5U7AezIWqtotIOiI3B7rG1Eic0mjjPRL6pBe/ynah9af
   0Mvm3HkrgNapkSQuD0EFSFRExda6P2xGK+SfWSHOTpvy4Fxi3sGNeUDmG
   /WEu5sXUygnznBjOCh+9lrlSejiRsR5uBfz8dqzoLxZZyUYVQaIePShU6
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="245272721"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="245272721"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2022 08:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; 
   d="scan'208";a="530887754"
Received: from lkp-server01.sh.intel.com (HELO 3abc53900bec) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Apr 2022 08:26:26 -0700
Received: from kbuild by 3abc53900bec with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1nhvAv-000AHe-SV;
	Fri, 22 Apr 2022 15:26:25 +0000
Date: Fri, 22 Apr 2022 23:26:18 +0800
From: kernel test robot <lkp@intel.com>
Cc: kbuild-all@lists.01.org, llvm@lists.linux.dev
Subject: [rt-devel:linux-5.18.y-rt-rebase 62/78] ld.lld: error:
 init/built-in.a(main.o):(function __traceiter_initcall_start: .text+0xbc):
 relocation R_RISCV_HI20 out of range: 531598 is not in [-524288, 524287];
 references __tracepoint_initcall_start
Message-ID: <202204222313.FeHOkWge-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: linux-kernel@vger.kernel.org
TO: "Yadi.hu" <yadi.hu@windriver.com>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-5.18.y-rt-rebase
head:   03e7725ddbfb0ffd7f3d7b257bfa504c6f795f6b
commit: 3aed8cf1fde30ca5631f4f59dbfb2c93013f3ff7 [62/78] ARM: enable irq in translation/section permission fault handlers
config: riscv-randconfig-r036-20220421 (https://download.01.org/0day-ci/archive/20220422/202204222313.FeHOkWge-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5bd87350a5ae429baf8f373cb226a57b62f87280)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=3aed8cf1fde30ca5631f4f59dbfb2c93013f3ff7
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-5.18.y-rt-rebase
        git checkout 3aed8cf1fde30ca5631f4f59dbfb2c93013f3ff7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> ld.lld: error: init/built-in.a(main.o):(function __traceiter_initcall_start: .text+0xbc): relocation R_RISCV_HI20 out of range: 531598 is not in [-524288, 524287]; references __tracepoint_initcall_start
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function __traceiter_initcall_finish: .text+0x154): relocation R_RISCV_HI20 out of range: 531598 is not in [-524288, 524287]; references __tracepoint_initcall_finish
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function trace_event_raw_event_initcall_level: .text+0x240): relocation R_RISCV_HI20 out of range: 531618 is not in [-524288, 524287]; references trace_trigger_soft_disabled.______f.27
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)
--
>> ld.lld: error: init/built-in.a(main.o):(function perf_trace_initcall_level: .text+0x388): relocation R_RISCV_HI20 out of range: 530554 is not in [-524288, 524287]; references .L.str.24
   >>> referenced by main.c
   >>> defined in init/built-in.a(main.o)

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on HAS_IOMEM && DRM && MMU
   Selected by
   - DRM_TTM_HELPER && HAS_IOMEM && DRM
   - DRM_HISI_HIBMC && HAS_IOMEM && DRM && PCI && (ARM64 || COMPILE_TEST

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
