Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AB715C2;
	Fri,  6 Oct 2023 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjW0dVhs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696587674; x=1728123674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cnBX3yGmQzn0lVjgGu9lazbJAxYXsKftWp12kbfT8CE=;
  b=XjW0dVhsMgaCRN3dUiJi7Uiaws5fv6SFMMgM8A9N+bprTcXxDfBaFr4B
   noXAh7FIeQfA4UkQpzsEhf3h4Tjh2Jyvo4La+Uo3wyQO7aKkAkkCAxurW
   NIV/R1lKfbzEBro2LpSe9/Z2oFEbNGvWf2thaYrUX5JJQtGT/SnNXagS6
   nSNFgkGC6MKuz1ZjENKCK9LJCjjHNI4shQBHpizJtTSMvd1etWGW/Vcgk
   V6bdjFsBqZFmOTO3nfghLQGaYB8w7p2zdAbjtldxGZuCWFuVrX2Sv7GvZ
   zr7/hfuNfhjog+ipJEk5crxTS+Y5vQrDy4EeX+1/1FdrxyGEag5+grCmb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="447910450"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="447910450"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2023 03:21:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="745828311"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="745828311"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 06 Oct 2023 03:21:12 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qohxF-000MUy-2R;
	Fri, 06 Oct 2023 10:21:09 +0000
Date: Fri, 6 Oct 2023 18:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/spi/spi-mpc52xx-psc.c:195:5: warning: no previous prototype
 for function 'mpc52xx_psc_spi_transfer_one_message'
Message-ID: <202310061815.7Rtyi4hs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b78b18fb8ee19f7a05f20c3abc865b3bfe182884
commit: 145cfc3840e5931a789a8e2e76af841ab4cad44b spi: mpc52xx-psc: Switch to using core message queue
date:   1 year, 3 months ago
config: powerpc-mpc5200_defconfig (https://download.01.org/0day-ci/archive/20231006/202310061815.7Rtyi4hs-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231006/202310061815.7Rtyi4hs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310061815.7Rtyi4hs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   __do_insb
   ^
   arch/powerpc/include/asm/io.h:578:56: note: expanded from macro '__do_insb'
   #define __do_insb(p, b, n)      readsb((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/spi/spi-mpc52xx-psc.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:641:
   arch/powerpc/include/asm/io-defs.h:45:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insw, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:638:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:117:1: note: expanded from here
   __do_insw
   ^
   arch/powerpc/include/asm/io.h:579:56: note: expanded from macro '__do_insw'
   #define __do_insw(p, b, n)      readsw((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/spi/spi-mpc52xx-psc.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:641:
   arch/powerpc/include/asm/io-defs.h:47:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(insl, (unsigned long p, void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:638:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:119:1: note: expanded from here
   __do_insl
   ^
   arch/powerpc/include/asm/io.h:580:56: note: expanded from macro '__do_insl'
   #define __do_insl(p, b, n)      readsl((PCI_IO_ADDR)_IO_BASE+(p), (b), (n))
                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/spi/spi-mpc52xx-psc.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:641:
   arch/powerpc/include/asm/io-defs.h:49:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsb, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:638:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:121:1: note: expanded from here
   __do_outsb
   ^
   arch/powerpc/include/asm/io.h:581:58: note: expanded from macro '__do_outsb'
   #define __do_outsb(p, b, n)     writesb((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/spi/spi-mpc52xx-psc.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:641:
   arch/powerpc/include/asm/io-defs.h:51:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsw, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:638:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:123:1: note: expanded from here
   __do_outsw
   ^
   arch/powerpc/include/asm/io.h:582:58: note: expanded from macro '__do_outsw'
   #define __do_outsw(p, b, n)     writesw((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
   In file included from drivers/spi/spi-mpc52xx-psc.c:13:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/powerpc/include/asm/hardirq.h:6:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/powerpc/include/asm/io.h:641:
   arch/powerpc/include/asm/io-defs.h:53:1: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
   DEF_PCI_AC_NORET(outsl, (unsigned long p, const void *b, unsigned long c),
   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/io.h:638:3: note: expanded from macro 'DEF_PCI_AC_NORET'
                   __do_##name al;                                 \
                   ^~~~~~~~~~~~~~
   <scratch space>:125:1: note: expanded from here
   __do_outsl
   ^
   arch/powerpc/include/asm/io.h:583:58: note: expanded from macro '__do_outsl'
   #define __do_outsl(p, b, n)     writesl((PCI_IO_ADDR)_IO_BASE+(p),(b),(n))
                                           ~~~~~~~~~~~~~~~~~~~~~^
>> drivers/spi/spi-mpc52xx-psc.c:195:5: warning: no previous prototype for function 'mpc52xx_psc_spi_transfer_one_message' [-Wmissing-prototypes]
   int mpc52xx_psc_spi_transfer_one_message(struct spi_controller *ctlr,
       ^
   drivers/spi/spi-mpc52xx-psc.c:195:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int mpc52xx_psc_spi_transfer_one_message(struct spi_controller *ctlr,
   ^
   static 
   7 warnings generated.


vim +/mpc52xx_psc_spi_transfer_one_message +195 drivers/spi/spi-mpc52xx-psc.c

   194	
 > 195	int mpc52xx_psc_spi_transfer_one_message(struct spi_controller *ctlr,
   196						 struct spi_message *m)
   197	{
   198		struct spi_device *spi;
   199		struct spi_transfer *t = NULL;
   200		unsigned cs_change;
   201		int status;
   202	
   203		spi = m->spi;
   204		cs_change = 1;
   205		status = 0;
   206		list_for_each_entry (t, &m->transfers, transfer_list) {
   207			if (t->bits_per_word || t->speed_hz) {
   208				status = mpc52xx_psc_spi_transfer_setup(spi, t);
   209				if (status < 0)
   210					break;
   211			}
   212	
   213			if (cs_change)
   214				mpc52xx_psc_spi_activate_cs(spi);
   215			cs_change = t->cs_change;
   216	
   217			status = mpc52xx_psc_spi_transfer_rxtx(spi, t);
   218			if (status)
   219				break;
   220			m->actual_length += t->len;
   221	
   222			spi_transfer_delay_exec(t);
   223	
   224			if (cs_change)
   225				mpc52xx_psc_spi_deactivate_cs(spi);
   226		}
   227	
   228		m->status = status;
   229		if (status || !cs_change)
   230			mpc52xx_psc_spi_deactivate_cs(spi);
   231	
   232		mpc52xx_psc_spi_transfer_setup(spi, NULL);
   233	
   234		spi_finalize_current_message(ctlr);
   235	
   236		return 0;
   237	}
   238	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
