Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D42469C
	for <llvm@lists.linux.dev>; Tue, 12 Apr 2022 04:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649738494; x=1681274494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RJ1qAco3PB+HuwV+dpAVuogTlXi4tirxjL6ITUQz924=;
  b=PoyyYw/hzJx8Bc5yZU0gZRUs+TPyxe8Nu7LZjwb1VKjloJhs7b/Sh9Y9
   QnwMmSQ6OjLtD6lPAL9qFY1dHTBEp9klriO+jR0ZfE/r4qAdkmAnB7/4B
   5cGvfS+YWW8Ns0JL2CaydS2ksYP0oiJiG9XItvxAdxQIK177pc5ZntclV
   +ruVnXjymvVZeVbaCrh4mTQq/kXRrce2fQV/7gTGH5fHD/alH+suigqK8
   8miHEAGuRsmeWgg5mISn8BL212Yll0Sn5YkfG35E3Lk0gllEPvppEKJ6z
   Q2fsBZDNP00mYkZtzQWH53oop8bg9xWyzxmseY+gIph29CHix+qb6ulkY
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10314"; a="262020011"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="262020011"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2022 21:41:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; 
   d="scan'208";a="590165626"
Received: from lkp-server02.sh.intel.com (HELO d3fc50ef50de) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 11 Apr 2022 21:41:32 -0700
Received: from kbuild by d3fc50ef50de with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1ne8LM-0002Vg-Ay;
	Tue, 12 Apr 2022 04:41:32 +0000
Date: Tue, 12 Apr 2022 12:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH v4 4/4] PCI: mvebu: Add support for sending
 Set_Slot_Power_Limit message
Message-ID: <202204121218.2C0C4sRc-lkp@intel.com>
References: <20220411185859.32722-5-pali@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411185859.32722-5-pali@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Pali,

I love your patch! Yet something to improve:

[auto build test ERROR on helgaas-pci/next]
[also build test ERROR on robh/for-next v5.18-rc2 next-20220411]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Pali-Roh-r/PCI-mvebu-Slot-support/20220412-030318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: arm-dove_defconfig (https://download.01.org/0day-ci/archive/20220412/202204121218.2C0C4sRc-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project c6e83f560f06cdfe8aa47b248d8bdc58f947274b)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/intel-lab-lkp/linux/commit/5453bfff3f906999c849d3e495990951fbe59fc9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Pali-Roh-r/PCI-mvebu-Slot-support/20220412-030318
        git checkout 5453bfff3f906999c849d3e495990951fbe59fc9
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/pci/controller/pci-mvebu.c:663:11: error: use of undeclared identifier 'slotctl'; did you mean 'slotsta'?
                           val |= slotctl & PCI_EXP_SLTCTL_ASPL_DISABLE;
                                  ^~~~~~~
                                  slotsta
   drivers/pci/controller/pci-mvebu.c:655:7: note: 'slotsta' declared here
                   u16 slotsta = le16_to_cpu(bridge->pcie_conf.slotsta);
                       ^
   1 error generated.


vim +663 drivers/pci/controller/pci-mvebu.c

   620	
   621	static pci_bridge_emul_read_status_t
   622	mvebu_pci_bridge_emul_pcie_conf_read(struct pci_bridge_emul *bridge,
   623					     int reg, u32 *value)
   624	{
   625		struct mvebu_pcie_port *port = bridge->data;
   626	
   627		switch (reg) {
   628		case PCI_EXP_DEVCAP:
   629			*value = mvebu_readl(port, PCIE_CAP_PCIEXP + PCI_EXP_DEVCAP);
   630			break;
   631	
   632		case PCI_EXP_DEVCTL:
   633			*value = mvebu_readl(port, PCIE_CAP_PCIEXP + PCI_EXP_DEVCTL);
   634			break;
   635	
   636		case PCI_EXP_LNKCAP:
   637			/*
   638			 * PCIe requires that the Clock Power Management capability bit
   639			 * is hard-wired to zero for downstream ports but HW returns 1.
   640			 * Additionally enable Data Link Layer Link Active Reporting
   641			 * Capable bit as DL_Active indication is provided too.
   642			 */
   643			*value = (mvebu_readl(port, PCIE_CAP_PCIEXP + PCI_EXP_LNKCAP) &
   644				  ~PCI_EXP_LNKCAP_CLKPM) | PCI_EXP_LNKCAP_DLLLARC;
   645			break;
   646	
   647		case PCI_EXP_LNKCTL:
   648			/* DL_Active indication is provided via PCIE_STAT_OFF */
   649			*value = mvebu_readl(port, PCIE_CAP_PCIEXP + PCI_EXP_LNKCTL) |
   650				 (mvebu_pcie_link_up(port) ?
   651				  (PCI_EXP_LNKSTA_DLLLA << 16) : 0);
   652			break;
   653	
   654		case PCI_EXP_SLTCTL: {
   655			u16 slotsta = le16_to_cpu(bridge->pcie_conf.slotsta);
   656			u32 val = 0;
   657			/*
   658			 * When slot power limit was not specified in DT then
   659			 * ASPL_DISABLE bit is stored only in emulated config space.
   660			 * Otherwise reflect status of PCIE_SSPL_ENABLE bit in HW.
   661			 */
   662			if (!port->slot_power_limit_value)
 > 663				val |= slotctl & PCI_EXP_SLTCTL_ASPL_DISABLE;
   664			else if (!(mvebu_readl(port, PCIE_SSPL_OFF) & PCIE_SSPL_ENABLE))
   665				val |= PCI_EXP_SLTCTL_ASPL_DISABLE;
   666			/* This callback is 32-bit and in high bits is slot status. */
   667			val |= slotsta << 16;
   668			*value = val;
   669			break;
   670		}
   671	
   672		case PCI_EXP_RTSTA:
   673			*value = mvebu_readl(port, PCIE_RC_RTSTA);
   674			break;
   675	
   676		case PCI_EXP_DEVCAP2:
   677			*value = mvebu_readl(port, PCIE_CAP_PCIEXP + PCI_EXP_DEVCAP2);
   678			break;
   679	
   680		case PCI_EXP_DEVCTL2:
   681			*value = mvebu_readl(port, PCIE_CAP_PCIEXP + PCI_EXP_DEVCTL2);
   682			break;
   683	
   684		case PCI_EXP_LNKCTL2:
   685			*value = mvebu_readl(port, PCIE_CAP_PCIEXP + PCI_EXP_LNKCTL2);
   686			break;
   687	
   688		default:
   689			return PCI_BRIDGE_EMUL_NOT_HANDLED;
   690		}
   691	
   692		return PCI_BRIDGE_EMUL_HANDLED;
   693	}
   694	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
