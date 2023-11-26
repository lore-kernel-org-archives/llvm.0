Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D497FD;
	Sun, 26 Nov 2023 00:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+dmAxG6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700960326; x=1732496326;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uZiDbOo1HWu4XZP2rKho0TDY/qvxYHcEcXFxL3s0m+M=;
  b=P+dmAxG6t54d30sVZTVTqSBb+lQXkbNtyYp0OboSa5RH1tWiuD7YNqUm
   jUZp1agw5WCi30T/cTs+lBZAwd0PwnW0AVkXonklNSzcmQKEVycozZxI+
   FAvBoaklogK7r6kzJKhZy0WI/5Emef7DEmlNEvbP/rqgclLxpR+iAvnqe
   24Pr5qqvbdZUty11m+iJcvb7ppFWdc2kGwIW+l/DhdtPKaRqz3IR3lzwX
   cH8co1L/aLLZFiL/t/o/FoafBwMDXAmKmOmKoAUwY221v55F8zKqyhh3b
   8W6Yio8h9+29QXmAas4ZMbU/XN0eD/DqeVyvSv0r7Xqlh2h/3g5/dsJV0
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="396445980"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="396445980"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 16:58:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="767801030"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="767801030"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Nov 2023 16:58:44 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r73Tu-0004by-0I;
	Sun, 26 Nov 2023 00:58:42 +0000
Date: Sun, 26 Nov 2023 08:57:56 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v2 66/67] drivers/acpi/riscv/irq.c:103:13:
 warning: no previous prototype for function 'riscv_acpi_aplic_platform_init'
Message-ID: <202311260847.sRYcck5Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v2
head:   b1784362df37fa8f3f9ae8639df656623d268319
commit: f9ff78c52eb6bc45107100ecea80e74a62d0bfc9 [66/67] ACPI: RISC-V: Create APLIC platform device
config: riscv-randconfig-002-20231126 (https://download.01.org/0day-ci/archive/20231126/202311260847.sRYcck5Z-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260847.sRYcck5Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260847.sRYcck5Z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/riscv/irq.c:103:13: warning: no previous prototype for function 'riscv_acpi_aplic_platform_init' [-Wmissing-prototypes]
     103 | void __init riscv_acpi_aplic_platform_init(void)
         |             ^
   drivers/acpi/riscv/irq.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | void __init riscv_acpi_aplic_platform_init(void)
         | ^
         | static 
   1 warning generated.


vim +/riscv_acpi_aplic_platform_init +103 drivers/acpi/riscv/irq.c

   102	
 > 103	void __init riscv_acpi_aplic_platform_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
