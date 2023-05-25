Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C3C15A9;
	Thu, 25 May 2023 01:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684977872; x=1716513872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pmlBBtuFgQNk8EG4wzOI9XnDQu8zC14ec7nhbJBerjc=;
  b=h5nB7d+L6NWO5RNSV4CPnBQE/fXDOammIE1x96hVPLudiJBZ2yt82zFA
   PINLAmmftsDmOIRrMPTiS3f4atB/EkulhlZF5wnGwbHUwrtgizTTNy+w/
   C4DnIcI8buASmzV8OCqaREjVtZQAsk362oy+Jwwmil/Ybe8kq/FoUNIx2
   hhjRLH9yKOrvNU0N+mw3Ka6FTHXEIWoq/Q8UlPuyZ6TQl+z/LFk2tNY42
   aHslS30OxUvqO5Zbl88NSSLIIKSuxRRqIXkeUz9jidAwt1hg9yo6hKSpu
   DdJQDSzWsDG2pCDkJksaZsTrCYpYkPQRMuNRFW1q3ekf9wOZJYlfLEIlH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343208080"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="343208080"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2023 18:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="769672044"
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="scan'208";a="769672044"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 May 2023 18:24:29 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q1ziO-000FLB-0n;
	Thu, 25 May 2023 01:24:28 +0000
Date: Thu, 25 May 2023 09:23:37 +0800
From: kernel test robot <lkp@intel.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 3477/4617]
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: error: initializer
 element is not a compile-time constant
Message-ID: <202305250935.6XsyIBcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cf09e328589a2ed7f6c8d90f2edb697fb4f8a96b
commit: 6810bb390282bb75801832f31d088236503fee89 [3477/4617] drm/panel: Add Samsung S6D7AA0 panel controller driver
config: riscv-buildonly-randconfig-r002-20230524 (https://download.01.org/0day-ci/archive/20230525/202305250935.6XsyIBcZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6810bb390282bb75801832f31d088236503fee89
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6810bb390282bb75801832f31d088236503fee89
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/drm/panel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305250935.6XsyIBcZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/include/asm/io.h:105:53: note: expanded from macro 'insw'
   #define insw(addr, buffer, count) __insw(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:8:
   In file included from include/linux/backlight.h:13:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:759:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           insl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:106:53: note: expanded from macro 'insl'
   #define insl(addr, buffer, count) __insl(PCI_IOBASE + (addr), buffer, count)
                                            ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:8:
   In file included from include/linux/backlight.h:13:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:768:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsb(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:118:55: note: expanded from macro 'outsb'
   #define outsb(addr, buffer, count) __outsb(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:8:
   In file included from include/linux/backlight.h:13:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:777:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsw(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:119:55: note: expanded from macro 'outsw'
   #define outsw(addr, buffer, count) __outsw(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:8:
   In file included from include/linux/backlight.h:13:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:786:2: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           outsl(addr, buffer, count);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/io.h:120:55: note: expanded from macro 'outsl'
   #define outsl(addr, buffer, count) __outsl(PCI_IOBASE + (addr), buffer, count)
                                              ~~~~~~~~~~ ^
   In file included from drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:8:
   In file included from include/linux/backlight.h:13:
   In file included from include/linux/fb.h:6:
   In file included from include/linux/kgdb.h:19:
   In file included from include/linux/kprobes.h:28:
   In file included from include/linux/ftrace.h:10:
   In file included from include/linux/trace_recursion.h:5:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/riscv/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/riscv/include/asm/io.h:136:
   include/asm-generic/io.h:1134:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
                                                     ~~~~~~~~~~ ^
>> drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:312:14: error: initializer element is not a compile-time constant
           .drm_mode = s6d7aa0_lsl080al02_mode,
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:415:14: error: initializer element is not a compile-time constant
           .drm_mode = s6d7aa0_lsl080al03_mode,
                       ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c:443:14: error: initializer element is not a compile-time constant
           .drm_mode = s6d7aa0_ltl101at01_mode,
                       ^~~~~~~~~~~~~~~~~~~~~~~
   13 warnings and 3 errors generated.


vim +312 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c

   307	
   308	static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
   309		.panel_type = S6D7AA0_PANEL_LSL080AL02,
   310		.init_func = s6d7aa0_lsl080al02_init,
   311		.off_func = s6d7aa0_lsl080al02_off,
 > 312		.drm_mode = s6d7aa0_lsl080al02_mode,
   313		.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_NO_HFP,
   314		.bus_flags = DRM_BUS_FLAG_DE_HIGH,
   315	
   316		.has_backlight = false,
   317		.use_passwd3 = false,
   318	};
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
