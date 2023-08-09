Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49BE648;
	Wed,  9 Aug 2023 04:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691554682; x=1723090682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7XAzbwjlLRXA3PjbZJ7Dcu2yyhkV+20zaLTJSvZY1O4=;
  b=FiUulMQN6Y7e3WgAIeBs1oTsoHkOOymDo73v5jbnvpDNwKZLGhJwUIos
   f1oiznjrxSdmtSlHQBk1SCjxGHLxQQ4dndoO+aoaQXLx9OCTF6fPmLUXh
   M44VmSo3bGL6rxfPFOarUcA4NqzS/GUf5e6G3zxv0T55VBbseo3CClwZe
   Z6ySuUm+4B+PMWdOE2XfjkEJWa0eJ89Wey0VYniZJKWsnA9oO2Z747aks
   4JZ/OLinANUX/hOOPQzLand22gX8ShwL5DDjnrgYh/mtdvo+QvaoFh7fM
   flbBDa10sU7WrwiTyc5xhKX3CFxe/z+NMqdV7XypOv8buw9LtJQk76s/+
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="361140105"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="361140105"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2023 21:08:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10795"; a="978220411"
X-IronPort-AV: E=Sophos;i="6.01,158,1684825200"; 
   d="scan'208";a="978220411"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 08 Aug 2023 21:08:22 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTaUf-0005nY-0a;
	Wed, 09 Aug 2023 04:08:21 +0000
Date: Wed, 9 Aug 2023 12:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-6.4.y 600/1652] ERROR: modpost: __ex_table+0x222c
 references non-executable section '.rodata'
Message-ID: <202308091247.i8jNaJgR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.4.y
head:   38ca69782268c8e9578ba2f1fccf931f643eb8da
commit: 884756f0203f9478391389465f8d6184223572be [600/1652] w1: fix loop in w1_fini()
config: riscv-randconfig-r042-20230731 (https://download.01.org/0day-ci/archive/20230809/202308091247.i8jNaJgR-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230809/202308091247.i8jNaJgR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308091247.i8jNaJgR-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

ERROR: modpost: __ex_table+0x2100 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2104): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2104 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x210c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x210c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2110): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2110 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2118): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2118 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x211c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x211c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2124): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2124 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2128): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2128 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2130): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2130 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2134): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2134 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x213c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x213c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2140): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2140 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2148): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2148 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x214c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x214c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2154): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2154 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2158): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2158 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2160): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2160 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2164): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2164 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x216c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x216c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2170): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2170 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2178): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2178 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x217c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x217c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2184): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2184 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2188): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2188 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2190): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2190 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2194): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2194 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x219c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x219c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21a0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21a0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21a8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21a8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21ac): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21ac references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21b4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21b4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21b8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21b8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21c0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21c0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21c4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21c4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21cc): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21cc references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21d0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21d0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21d8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21d8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21dc): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21dc references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21e4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21e4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21e8): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21e8 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21f0): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21f0 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21f4): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21f4 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x21fc): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x21fc references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2200): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2200 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2208): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2208 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x220c): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x220c references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2214): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2214 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2218): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2218 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2220): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2220 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2224): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2224 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x222c): Section mismatch in reference from the (unknown reference) (unknown) to the variable .rodata:elish_boe_init_sequence.d.8
>> ERROR: modpost: __ex_table+0x222c references non-executable section '.rodata'
WARNING: modpost: vmlinux.o(__ex_table+0x2244): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2244 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x2248): Section mismatch in reference from the (unknown reference) (unknown) to the (unknown reference) .debug_str:(unknown)
ERROR: modpost: __ex_table+0x2248 references non-executable section '.debug_str'
WARNING: modpost: vmlinux.o(__ex_table+0x225c): Section mismatch in reference from the (unknown reference) (unknown) to the variable .rodata.str1.1:.L.str.29
ERROR: modpost: __ex_table+0x225c references non-executable section '.rodata.str1.1'
WARNING: modpost: vmlinux.o: section mismatch in reference: fixed_mdio_bus_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: fixed_mdio_bus_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: smsc911x_cleanup_module (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: smsc911x_cleanup_module (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mipid02_i2c_driver_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mipid02_i2c_driver_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: w1_family_0d_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: w1_family_0d_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: bq24735_charger_driver_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: bq24735_charger_driver_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: dme1737_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: dme1737_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: dme1737_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: dme1737_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: dme1737_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: dme1737_exit (section: .exit.text) -> .LBB1_5 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: dme1737_exit (section: .exit.text) -> .LBB1_5 (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mmc_pwrseq_simple_driver_exit (section: .exit.text) -> set_reset_devices (section: .init.text)
WARNING: modpost: vmlinux.o: section mismatch in reference: mmc_pwrseq_simple_driver_exit (section: .exit.text) -> set_reset_devices (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
