Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A37320F;
	Sun, 26 Nov 2023 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlS6S74b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700982496; x=1732518496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xXlmE9TWRuZQikYJmU21zyaBKy4gdUNengQPgFZe6Xk=;
  b=WlS6S74bT0Hn+d1kmSEqcTvDskd0jZ6GoSv5hOwqGP1l8A7OooVLwAzJ
   2Rh68dcM7jSfef54va0r3uPg4cqAblmdZQGmTV6LKYL5f3ou0Tt4oph+V
   eOdc2gRbEznSQ+M0tl4AIfkjkHPGgZD+NR4mdPefRCprGzLl2SsTd9/vQ
   TmObNv8cpJI44VfRJ8xVvNQtMyXi18qC6nHORthrjbWij5hNDtwuCljhx
   pLGpkeYAJduJXnvWp1AJsp48MpzOZZJSqFQBipfNACjE9USp2DqXq01zo
   OBVkGU05rjCGZWbHXckSNUEEv/1ysHo/UDsAd7zOeQso4jRxAm6GGox+j
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="14112972"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="14112972"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 23:08:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="885661404"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="885661404"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2023 23:08:14 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r79FU-0004vs-1m;
	Sun, 26 Nov 2023 07:08:12 +0000
Date: Sun, 26 Nov 2023 15:07:10 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v2 60/67] ld.lld: error: undefined symbol:
 pci_msi_register_fwnode_provider
Message-ID: <202311261306.I2t3OhVU-lkp@intel.com>
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
commit: 7fe418be36099fd90cf18b243b30864413cf29bf [60/67] irqchip: riscv-imsic: Add ACPI support
config: riscv-randconfig-002-20231126 (https://download.01.org/0day-ci/archive/20231126/202311261306.I2t3OhVU-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311261306.I2t3OhVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311261306.I2t3OhVU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: pci_msi_register_fwnode_provider
   >>> referenced by irq-riscv-imsic-early.c
   >>>               drivers/irqchip/irq-riscv-imsic-early.o:(imsic_early_acpi_init) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
