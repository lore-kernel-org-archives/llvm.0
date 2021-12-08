Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A9568
	for <llvm@lists.linux.dev>; Wed,  8 Dec 2021 13:38:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="217853807"
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; 
   d="scan'208";a="217853807"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2021 05:38:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,189,1635231600"; 
   d="scan'208";a="679888540"
Received: from lkp-server02.sh.intel.com (HELO 9e1e9f9b3bcb) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 08 Dec 2021 05:38:45 -0800
Received: from kbuild by 9e1e9f9b3bcb with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1mux9g-0000bZ-BT; Wed, 08 Dec 2021 13:38:44 +0000
Date: Wed, 8 Dec 2021 21:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH 04/17] PCI: aardvark: Fix reading MSI interrupt number
Message-ID: <202112082134.fNH8OE60-lkp@intel.com>
References: <20211208061851.31867-5-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208061851.31867-5-kabel@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi "Marek,

I love your patch! Perhaps something to improve:

[auto build test WARNING on helgaas-pci/next]
[also build test WARNING on next-20211208]
[cannot apply to v5.16-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Marek-Beh-n/PCI-aardvark-controller-fixes-BATCH-4/20211208-141958
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: arm64-randconfig-r022-20211207 (https://download.01.org/0day-ci/archive/20211208/202112082134.fNH8OE60-lkp@intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1cb1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/0day-ci/linux/commit/1d0822699fe4ce28186773b9186410166165fd0f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Marek-Beh-n/PCI-aardvark-controller-fixes-BATCH-4/20211208-141958
        git checkout 1d0822699fe4ce28186773b9186410166165fd0f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/pci/controller/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/pci-aardvark.c:1409:70: warning: format specifies type 'unsigned short' but the argument has type 'u32' (aka 'unsigned int') [-Wformat]
                           dev_err_ratelimited(&pcie->pdev->dev, "unexpected MSI 0x%04hx\n", msi_idx);
                                                                                   ~~~~~     ^~~~~~~
                                                                                   %04x
   include/linux/dev_printk.h:218:45: note: expanded from macro 'dev_err_ratelimited'
           dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
                                               ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:208:25: note: expanded from macro 'dev_level_ratelimited'
                   dev_level(dev, fmt, ##__VA_ARGS__);                     \
                                  ~~~    ^~~~~~~~~~~
   include/linux/dev_printk.h:144:65: note: expanded from macro 'dev_err'
           dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
                                                                  ~~~     ^~~~~~~~~~~
   include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
                   _p_func(dev, fmt, ##__VA_ARGS__);                       \
                                ~~~    ^~~~~~~~~~~
   1 warning generated.


vim +1409 drivers/pci/controller/pci-aardvark.c

  1393	
  1394	static void advk_pcie_handle_msi(struct advk_pcie *pcie)
  1395	{
  1396		u32 msi_val, msi_mask, msi_status, msi_idx;
  1397	
  1398		msi_mask = advk_readl(pcie, PCIE_MSI_MASK_REG);
  1399		msi_val = advk_readl(pcie, PCIE_MSI_STATUS_REG);
  1400		msi_status = msi_val & ((~msi_mask) & PCIE_MSI_ALL_MASK);
  1401	
  1402		for (msi_idx = 0; msi_idx < MSI_IRQ_NUM; msi_idx++) {
  1403			if (!(BIT(msi_idx) & msi_status))
  1404				continue;
  1405	
  1406			advk_writel(pcie, BIT(msi_idx), PCIE_MSI_STATUS_REG);
  1407	
  1408			if (generic_handle_domain_irq(pcie->msi_inner_domain, msi_idx) == -EINVAL)
> 1409				dev_err_ratelimited(&pcie->pdev->dev, "unexpected MSI 0x%04hx\n", msi_idx);
  1410		}
  1411	
  1412		advk_writel(pcie, PCIE_ISR0_MSI_INT_PENDING,
  1413			    PCIE_ISR0_REG);
  1414	}
  1415	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
