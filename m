Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956AA10F6;
	Sat,  4 Mar 2023 08:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677920029; x=1709456029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h2N1Dsnuu4apfKa64luavxCyFxtbqkgn5Zef0gGSBzQ=;
  b=b38kxVz90E5Zvqp0tYzARuf6DOw/Z+1iKMcsLFzQUmCHd1K6RB6xAufP
   FauUHLtwLBv8ROIEaCqpXHGyFwSrVmKdlYvpoBToLYNw7AoSJq2oDVmyQ
   XWl+0N28tlkcNtKldxxCghEYWGLIiJWdUWCnZafX7gt3x0doycdqMNjPZ
   jawA9HohTvzK9gggf0RD9EVF6KusAWd2fIAf6bceDDv5QUQ3hHw1yixN7
   bezT6pMmpnWfneIaQVC5GE9psXrvZl0JR0FdDR15OALt/DmQzx0yW2m6n
   f72GT/M0VhebiTLHBvX31cbZX3GnIbzhucR6yFnmOVPfXtqYQuwGjCiNn
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="335267937"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="335267937"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2023 00:53:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10638"; a="818770868"
X-IronPort-AV: E=Sophos;i="5.98,233,1673942400"; 
   d="scan'208";a="818770868"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Mar 2023 00:53:47 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pYNeE-00021i-1S;
	Sat, 04 Mar 2023 08:53:46 +0000
Date: Sat, 4 Mar 2023 16:53:41 +0800
From: kernel test robot <lkp@intel.com>
To: Fangrui Song <maskray@google.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nathan Chancellor <natechancellor@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [stable:linux-4.14.y 5132/9999] arch/mips/math-emu/cp1emu.c:2813:5:
 warning: stack frame size (1048) exceeds limit (1024) in
 'fpu_emulator_cop1Handler'
Message-ID: <202303041628.02DK6zpr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fangrui,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   7878a41b6cc1ada4bb804eee96beb2c54322806c
commit: 71749b1181eca12af96654a781cabcd058c37c8f [5132/9999] Makefile: Fix GCC_TOOLCHAIN_DIR prefix for Clang cross compilation
config: mips-randconfig-r022-20230303 (https://download.01.org/0day-ci/archive/20230304/202303041628.02DK6zpr-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=71749b1181eca12af96654a781cabcd058c37c8f
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.14.y
        git checkout 71749b1181eca12af96654a781cabcd058c37c8f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303041628.02DK6zpr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/mips/math-emu/cp1emu.c:2813:5: warning: stack frame size (1048) exceeds limit (1024) in 'fpu_emulator_cop1Handler' [-Wframe-larger-than]
   int fpu_emulator_cop1Handler(struct pt_regs *xcp, struct mips_fpu_struct *ctx,
       ^
   992/1048 (94.66%) spills, 56/1048 (5.34%) variables
   1 warning generated.


vim +/fpu_emulator_cop1Handler +2813 arch/mips/math-emu/cp1emu.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  2783  
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2784  /*
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2785   * Emulate FPU instructions.
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2786   *
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2787   * If we use FPU hardware, then we have been typically called to handle
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2788   * an unimplemented operation, such as where an operand is a NaN or
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2789   * denormalized.  In that case exit the emulation loop after a single
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2790   * iteration so as to let hardware execute any subsequent instructions.
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2791   *
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2792   * If we have no FPU hardware or it has been disabled, then continue
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2793   * emulating floating-point instructions until one of these conditions
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2794   * has occurred:
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2795   *
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2796   * - a non-FPU instruction has been encountered,
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2797   *
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2798   * - an attempt to emulate has ended with a signal,
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2799   *
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2800   * - the ISA mode has been switched.
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2801   *
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2802   * We need to terminate the emulation loop if we got switched to the
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2803   * MIPS16 mode, whether supported or not, so that we do not attempt
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2804   * to emulate a MIPS16 instruction as a regular MIPS FPU instruction.
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2805   * Similarly if we got switched to the microMIPS mode and only the
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2806   * regular MIPS mode is supported, so that we do not attempt to emulate
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2807   * a microMIPS instruction as a regular MIPS FPU instruction.  Or if
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2808   * we got switched to the regular MIPS mode and only the microMIPS mode
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2809   * is supported, so that we do not attempt to emulate a regular MIPS
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2810   * instruction that should cause an Address Error exception instead.
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2811   * For simplicity we always terminate upon an ISA mode switch.
13769ebad0c427 Maciej W. Rozycki 2017-06-16  2812   */
e04582b7bc70b4 Atsushi Nemoto    2006-10-09 @2813  int fpu_emulator_cop1Handler(struct pt_regs *xcp, struct mips_fpu_struct *ctx,

:::::: The code at line 2813 was first introduced by commit
:::::: e04582b7bc70b40c57287cdc24f81964ee88f565 [MIPS] Make sure cpu_has_fpu is used only in atomic context

:::::: TO: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
