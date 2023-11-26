Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5403137E;
	Sun, 26 Nov 2023 03:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUJpHMfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700969479; x=1732505479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vREWrSePHt7Y8aUnVWnDF1mZlsjNpVcYliQFl6/Z6ko=;
  b=mUJpHMfxJqmfdpLOkTTyH/BSKDh1k+fSIoVdSACjzqwWbZSLv/2OsH4l
   5la4jo+WyC3/ZBxZF42wKPpPXlbHkl9YGCGpJl5OthgiKzycN9iCE1Xhq
   VAAEYWHHK7iKNdWDXCszULLIucN0/gXL/kCsnNm9NvnW1LWcmTRP/vcDm
   ECHKgRTKA8zWtVl5r/GyEfezjTTBonKbYJS4yMtao4Ugr9gEwcpfXib52
   bWJqkfiFaSfs3/uFWFP704JhlW+O+cCEL0pCJU7nKW1B0s4I+cFhlWs0/
   6Fr8hGTY2wU0L/ma1Ccj+sHlt/YzwPlFWURU/n69rCcbwY/rqaZ1KVVx/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="391411822"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="391411822"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 19:31:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="838391183"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="838391183"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Nov 2023 19:31:17 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r75rX-0004p4-16;
	Sun, 26 Nov 2023 03:31:15 +0000
Date: Sun, 26 Nov 2023 11:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v2 67/67] drivers/acpi/riscv/irq.c:117:13:
 warning: no previous prototype for function 'riscv_acpi_plic_platform_init'
Message-ID: <202311261056.5PIToTCM-lkp@intel.com>
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
commit: b1784362df37fa8f3f9ae8639df656623d268319 [67/67] ACPI: RISC-V: Create PLIC platform device
config: riscv-randconfig-002-20231126 (https://download.01.org/0day-ci/archive/20231126/202311261056.5PIToTCM-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311261056.5PIToTCM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311261056.5PIToTCM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/riscv/irq.c:103:13: warning: no previous prototype for function 'riscv_acpi_aplic_platform_init' [-Wmissing-prototypes]
     103 | void __init riscv_acpi_aplic_platform_init(void)
         |             ^
   drivers/acpi/riscv/irq.c:103:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     103 | void __init riscv_acpi_aplic_platform_init(void)
         | ^
         | static 
>> drivers/acpi/riscv/irq.c:117:13: warning: no previous prototype for function 'riscv_acpi_plic_platform_init' [-Wmissing-prototypes]
     117 | void __init riscv_acpi_plic_platform_init(void)
         |             ^
   drivers/acpi/riscv/irq.c:117:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     117 | void __init riscv_acpi_plic_platform_init(void)
         | ^
         | static 
   2 warnings generated.


vim +/riscv_acpi_plic_platform_init +117 drivers/acpi/riscv/irq.c

   102	
 > 103	void __init riscv_acpi_aplic_platform_init(void)
   104	{
   105		acpi_table_parse_madt(ACPI_MADT_TYPE_APLIC, aplic_parse_madt, 0);
   106	}
   107	
   108	static int __init plic_parse_madt(union acpi_subtable_headers *header,
   109					  const unsigned long end)
   110	{
   111		struct acpi_madt_plic *plic = (struct acpi_madt_plic *)header;
   112	
   113		return irqchip_add_platform_device("riscv-plic", plic->id, plic->base_addr,
   114						   plic->size, header);
   115	}
   116	
 > 117	void __init riscv_acpi_plic_platform_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
