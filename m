Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3918A46551;
	Tue, 21 Nov 2023 10:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DnGIi6RR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700563493; x=1732099493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LhwXFIYKtVCEhAxPnMuXdg5aY5GNWDLoi8kfr3kxfhE=;
  b=DnGIi6RR1GAX2ZnxeK6pt9xivaajbr4AcuQ8Hy8Al+lq+GwT1ENtCFxY
   3hr32UswxMvSRVhAHJgWDWHsyfH5DCO+Z7Qi+wsx5eAeEgsNR65CM2Jpl
   p3NUx3on3ADLRO4bmlUbA1AiIU5Vidt+6DFE0m1ymbs2gYOHH9XLcvVnB
   BPWNCCbrby0BkAT84yyIgh7HuJMIBVFWmCEnOsLeJVlH33QiYmbxYdYFn
   Ack+1MRCyOvDleLxnQn7VeG9f4/2edx2KrkQ8Ek2F4lLPh0ptfejbqz6r
   fD+e9Cq+NxgDqPbCimJ51uNBMTCoh1spd8m4NN9xntHNoqPqGhJ2Haxvb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422910472"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="422910472"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 02:44:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="884168939"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="884168939"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 21 Nov 2023 02:44:50 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5OFE-0007hO-37;
	Tue, 21 Nov 2023 10:44:44 +0000
Date: Tue, 21 Nov 2023 18:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Thomas Gleixner <tglx@linutronix.de>,
	Steve Wahl <steve.wahl@hpe.com>
Subject: [tglx-devel:x86/topology 1/73]
 drivers/iommu/intel/irq_remapping.c:1115:27: error: no member named
 'delivery_mode' in 'struct apic'
Message-ID: <202311211831.nbJ6tryI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   ed585684e724a1a12844095f6b58d6cdd1f9f332
commit: 0ed62b297d6164d78367aa26301df7797418a1f4 [1/73] x86/apic: Drop apic:: Delivery_mode
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231121/202311211831.nbJ6tryI-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211831.nbJ6tryI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211831.nbJ6tryI-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/intel/irq_remapping.c:1115:27: error: no member named 'delivery_mode' in 'struct apic'
           irte->dlvry_mode = apic->delivery_mode;
                              ~~~~  ^
   1 error generated.


vim +1115 drivers/iommu/intel/irq_remapping.c

85a8dfc57a0b96 drivers/iommu/intel/irq_remapping.c  Thomas Gleixner 2020-08-26  1100  
3c6e567509ed4e drivers/iommu/intel_irq_remapping.c  Jiang Liu       2015-04-14  1101  static void prepare_irte(struct irte *irte, int vector, unsigned int dest)
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1102  {
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1103  	memset(irte, 0, sizeof(*irte));
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1104  
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1105  	irte->present = 1;
8c44963b603db7 drivers/iommu/intel/irq_remapping.c  Thomas Gleixner 2020-10-24  1106  	irte->dst_mode = apic->dest_mode_logical;
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1107  	/*
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1108  	 * Trigger mode in the IRTE will always be edge, and for IO-APIC, the
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1109  	 * actual level or edge trigger will be setup in the IO-APIC
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1110  	 * RTE. This will help simplify level triggered irq migration.
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1111  	 * For more details, see the comments (in io_apic.c) explainig IO-APIC
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1112  	 * irq migration in the presence of interrupt-remapping.
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1113  	*/
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1114  	irte->trigger_mode = 0;
721612994f53ed drivers/iommu/intel/irq_remapping.c  Thomas Gleixner 2020-10-24 @1115  	irte->dlvry_mode = apic->delivery_mode;
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1116  	irte->vector = vector;
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1117  	irte->dest_id = IRTE_DEST(dest);
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1118  	irte->redir_hint = 1;
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1119  }
0c3f173a88c4ae drivers/iommu/intel_intr_remapping.c Joerg Roedel    2012-03-30  1120  

:::::: The code at line 1115 was first introduced by commit
:::::: 721612994f53ed600b39a80d912b10f51960e2e3 x86/apic: Cleanup delivery mode defines

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
