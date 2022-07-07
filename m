Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF22A7C
	for <llvm@lists.linux.dev>; Thu,  7 Jul 2022 22:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657234330; x=1688770330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BYQxuiqgPa+mfWpwJmnT77GinLD1xG1yjODhgvcPRh8=;
  b=mBbSHU2fEyZ1OC4W79VsxmIT0sNQbBeZWFrbVp0EDMSKn8a9eQ3agRHQ
   XKptFZ9r1TWX5xA2k769i6A1ffziACMjc9uQCPo1I+3OKF2CEX5TMPvoO
   gc2I4MAnQv0uK0P2w9V3lTUsNwfwdJozrRsyBIE/M69BXIZdwG6lx7eE+
   UjfgShzq4USnWQcqu1alAzimtdsE93FpWdivYCxnfxFAaL/l9k2oCflYN
   huyMuIgsMc3cSZvsiqvSXATfR7TQR/JpqiqFADnUzbHttr4QiVYckzlvs
   zrlPU+cE+jAQPkL0JzrxQDYwZr4toBGy4fbjSlktu7iyu3m1o/5egi6jy
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="284161259"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="284161259"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2022 15:52:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; 
   d="scan'208";a="840086652"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jul 2022 15:52:08 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o9aLv-000MZ0-KQ;
	Thu, 07 Jul 2022 22:52:07 +0000
Date: Fri, 8 Jul 2022 06:51:09 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel@sholland.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [arm-platforms:irq/affinity-nosmp 7/8]
 drivers/pci/controller/pci-hyperv.c:1654:35: error: passing 'const struct
 cpumask *' to parameter of type 'struct cpumask *' discards qualifiers
Message-ID: <202207080612.kREyVtTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/affinity-nosmp
head:   aa0813581b8d37bdd91cd40b67ef79ffa45104b2
commit: 4d0b8298818b623f5fa51d5c49e1a142d3618ac9 [7/8] genirq: Return a const cpumask from irq_data_get_affinity_mask
config: arm64-buildonly-randconfig-r001-20220707 (https://download.01.org/0day-ci/archive/20220708/202207080612.kREyVtTY-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 66ae1d60bb278793fd651cece264699d522bab84)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git/commit/?id=4d0b8298818b623f5fa51d5c49e1a142d3618ac9
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/affinity-nosmp
        git checkout 4d0b8298818b623f5fa51d5c49e1a142d3618ac9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/hwmon/pmbus/ drivers/pci/controller/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pci/controller/pci-hyperv.c:1654:35: error: passing 'const struct cpumask *' to parameter of type 'struct cpumask *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           cpu = hv_compose_msi_req_get_cpu(affinity);
                                            ^~~~~~~~
   drivers/pci/controller/pci-hyperv.c:1638:55: note: passing argument to parameter 'affinity' here
   static int hv_compose_msi_req_get_cpu(struct cpumask *affinity)
                                                         ^
   drivers/pci/controller/pci-hyperv.c:1674:35: error: passing 'const struct cpumask *' to parameter of type 'struct cpumask *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
           cpu = hv_compose_msi_req_get_cpu(affinity);
                                            ^~~~~~~~
   drivers/pci/controller/pci-hyperv.c:1638:55: note: passing argument to parameter 'affinity' here
   static int hv_compose_msi_req_get_cpu(struct cpumask *affinity)
                                                         ^
   2 errors generated.


vim +1654 drivers/pci/controller/pci-hyperv.c

8f6a6b3c50ce1ca drivers/pci/controller/pci-hyperv.c Sunil Muthuswamy 2021-07-12  1642  
7dcf90e9e032432 drivers/pci/host/pci-hyperv.c       Jork Loeser      2017-05-24  1643  static u32 hv_compose_msi_req_v2(
4d0b8298818b623 drivers/pci/controller/pci-hyperv.c Samuel Holland   2022-07-01  1644  	struct pci_create_interrupt2 *int_pkt, const struct cpumask *affinity,
a2bad844a67b1c7 drivers/pci/controller/pci-hyperv.c Jeffrey Hugo     2022-05-11  1645  	u32 slot, u8 vector, u8 vector_count)
7dcf90e9e032432 drivers/pci/host/pci-hyperv.c       Jork Loeser      2017-05-24  1646  {
7dcf90e9e032432 drivers/pci/host/pci-hyperv.c       Jork Loeser      2017-05-24  1647  	int cpu;
7dcf90e9e032432 drivers/pci/host/pci-hyperv.c       Jork Loeser      2017-05-24  1648  
7dcf90e9e032432 drivers/pci/host/pci-hyperv.c       Jork Loeser      2017-05-24  1649  	int_pkt->message_type.type = PCI_CREATE_INTERRUPT_MESSAGE2;
7dcf90e9e032432 drivers/pci/host/pci-hyperv.c       Jork Loeser      2017-05-24  1650  	int_pkt->wslot.slot = slot;
7dcf90e9e032432 drivers/pci/host/pci-hyperv.c       Jork Loeser      2017-05-24  1651  	int_pkt->int_desc.vector = vector;
a2bad844a67b1c7 drivers/pci/controller/pci-hyperv.c Jeffrey Hugo     2022-05-11  1652  	int_pkt->int_desc.vector_count = vector_count;
831c1ae725f7d2f drivers/pci/controller/pci-hyperv.c Sunil Muthuswamy 2022-01-05  1653  	int_pkt->int_desc.delivery_mode = DELIVERY_MODE;
8f6a6b3c50ce1ca drivers/pci/controller/pci-hyperv.c Sunil Muthuswamy 2021-07-12 @1654  	cpu = hv_compose_msi_req_get_cpu(affinity);
8f6a6b3c50ce1ca drivers/pci/controller/pci-hyperv.c Sunil Muthuswamy 2021-07-12  1655  	int_pkt->int_desc.processor_array[0] =
8f6a6b3c50ce1ca drivers/pci/controller/pci-hyperv.c Sunil Muthuswamy 2021-07-12  1656  		hv_cpu_number_to_vp_number(cpu);
8f6a6b3c50ce1ca drivers/pci/controller/pci-hyperv.c Sunil Muthuswamy 2021-07-12  1657  	int_pkt->int_desc.processor_count = 1;
7dcf90e9e032432 drivers/pci/host/pci-hyperv.c       Jork Loeser      2017-05-24  1658  
8f6a6b3c50ce1ca drivers/pci/controller/pci-hyperv.c Sunil Muthuswamy 2021-07-12  1659  	return sizeof(*int_pkt);
8f6a6b3c50ce1ca drivers/pci/controller/pci-hyperv.c Sunil Muthuswamy 2021-07-12  1660  }
8f6a6b3c50ce1ca drivers/pci/controller/pci-hyperv.c Sunil Muthuswamy 2021-07-12  1661  

:::::: The code at line 1654 was first introduced by commit
:::::: 8f6a6b3c50ce1caa81c47bb5855be02050c0eff7 PCI: hv: Support for create interrupt v3

:::::: TO: Sunil Muthuswamy <sunilmut@microsoft.com>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
