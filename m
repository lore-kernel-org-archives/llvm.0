Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A279832182;
	Mon, 20 Nov 2023 21:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fs8Ziv8A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700515695; x=1732051695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fgbT9umBX5qx6FDkSEMaq0vWexN6eBlM61WrBeIo+1o=;
  b=fs8Ziv8AaDnz79ewbmCNzSG484jZn3brOzkqz+UaAsI5X+jXBEx7958j
   bij+cZp6HxPYE+U59OzK3QXU0uqngIzvc/LHnu6+jo1x4VEGNUbDdRP31
   gLsONzTU5wupCbreFK82q8RsOmDtRHNZhidI+Kx/q/jyx0bPf1XeUaNAq
   U1ke8nq/dNN25Lw8latQ5zbyItRl0ncZdo9kDAWwMTEamI+NhF/ti9wH2
   MVZPzf/JtfHk6Nt4Y6LDEbyJycQA3qsKu/VWDuFIGByyhaAYGUNpkfafx
   owvSOq2Odv/k92oT/1kV3jfU4eUqcPF2/r9kzlDL1Tji4AbVBE192vzYw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="4823356"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="4823356"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:28:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="7688814"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2023 13:28:11 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5BoN-0006wQ-3A;
	Mon, 20 Nov 2023 21:28:07 +0000
Date: Tue, 21 Nov 2023 05:27:13 +0800
From: kernel test robot <lkp@intel.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: Re: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extension
Message-ID: <202311210512.n4evtQf6-lkp@intel.com>
References: <20231115133127.107575-1-heinrich.schuchardt@canonical.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231115133127.107575-1-heinrich.schuchardt@canonical.com>

Hi Heinrich,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.7-rc2 next-20231120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Heinrich-Schuchardt/tty-serial-RISC-V-SBI-earlycon-via-DBCN-extension/20231115-213355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20231115133127.107575-1-heinrich.schuchardt%40canonical.com
patch subject: [PATCH 1/1] tty/serial: RISC-V SBI earlycon via DBCN extension
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231121/202311210512.n4evtQf6-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311210512.n4evtQf6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210512.n4evtQf6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/tty/serial/earlycon-riscv-sbi.c:11:10: fatal error: 'asm/sbi.h' file not found
      11 | #include <asm/sbi.h>
         |          ^~~~~~~~~~~
   1 error generated.


vim +11 drivers/tty/serial/earlycon-riscv-sbi.c

27de1f541f1f91 Anup Patel 2018-12-04 @11  #include <asm/sbi.h>
27de1f541f1f91 Anup Patel 2018-12-04  12  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
