Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2049F11700;
	Fri, 11 Aug 2023 21:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691787902; x=1723323902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0AVsr8cuwcN/XQ4FfzCMvw6/qGGUcXUrkGMPHzB1ra4=;
  b=FzKJV5yTv4KJz0k6NOt04oMv8/61wsG8U0SVyXHphC89Df/08wJPgC/J
   KElhZMVw+kX9F1Kjf+mrOMvDcGu1cdd3xlMPscC2MYT7tvsy/9IC5MVwB
   6twz/Yz+8mfG6NNF3q7u+EH0JyKf8UH4t/ks+PQP0YgUZs9VvKcbtBQRD
   Ez7jmDq9XaAgnOrKyH3MfErCXbgEDQLOmHSDMkJ5LCz88RrchDmv9Gtbw
   B0fuQ2b2W+56z0xiAPdltMK59u40F5j3AhQrrScKL03D//nmxrxqvn1dO
   cLAx2+4y4ELeYxA3hpZjWkKAyrD+mUkohtQl9iY1sHtBsJ3CsXOBrE2yP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="369232112"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="369232112"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2023 14:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10799"; a="682653293"
X-IronPort-AV: E=Sophos;i="6.01,166,1684825200"; 
   d="scan'208";a="682653293"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 11 Aug 2023 14:04:53 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUZJT-00082c-2x;
	Fri, 11 Aug 2023 21:04:51 +0000
Date: Sat, 12 Aug 2023 05:03:52 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [davejiang:cxl-ide 15/24] drivers/pci/ide.c:99:6: warning: variable
 'link_num' is used uninitialized whenever 'if' condition is false
Message-ID: <202308120458.W4qCGU2d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davejiang/linux.git cxl-ide
head:   ee3a63e65f46140bcb484e3d0052d641abceb9da
commit: 39772261c553965d12d4c23ae5236cf0e10b9462 [15/24] pci: Add basic support for discovery of IDE on PCIe device
config: i386-randconfig-r022-20230812 (https://download.01.org/0day-ci/archive/20230812/202308120458.W4qCGU2d-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230812/202308120458.W4qCGU2d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308120458.W4qCGU2d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/ide.c:46:5: warning: no previous prototype for function 'pcie_ide_stream_create' [-Wmissing-prototypes]
   int pcie_ide_stream_create(struct pci_dev *pdev1, struct pci_dev *pdev2,
       ^
   drivers/pci/ide.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pcie_ide_stream_create(struct pci_dev *pdev1, struct pci_dev *pdev2,
   ^
   static 
   drivers/pci/ide.c:72:6: warning: no previous prototype for function 'pcie_ide_stream_shutdown' [-Wmissing-prototypes]
   void pcie_ide_stream_shutdown(struct pci_dev *pdev1, struct pci_dev *pdev2)
        ^
   drivers/pci/ide.c:72:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void pcie_ide_stream_shutdown(struct pci_dev *pdev1, struct pci_dev *pdev2)
   ^
   static 
>> drivers/pci/ide.c:99:6: warning: variable 'link_num' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (cap & PCI_IDE_CAP_LNK)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/ide.c:106:23: note: uninitialized use occurs here
           pdev->ide.link_num = link_num;
                                ^~~~~~~~
   drivers/pci/ide.c:99:2: note: remove the 'if' if its condition is always true
           if (cap & PCI_IDE_CAP_LNK)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/ide.c:84:14: note: initialize the variable 'link_num' to silence this warning
           int link_num, select_num, pos;
                       ^
                        = 0
>> drivers/pci/ide.c:102:6: warning: variable 'select_num' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
           if (cap & PCI_IDE_CAP_SEL)
               ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/ide.c:107:25: note: uninitialized use occurs here
           pdev->ide.select_num = select_num;
                                  ^~~~~~~~~~
   drivers/pci/ide.c:102:2: note: remove the 'if' if its condition is always true
           if (cap & PCI_IDE_CAP_SEL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/ide.c:84:26: note: initialize the variable 'select_num' to silence this warning
           int link_num, select_num, pos;
                                   ^
                                    = 0
   4 warnings generated.


vim +99 drivers/pci/ide.c

    81	
    82	void pci_ide_init(struct pci_dev *pdev)
    83	{
    84		int link_num, select_num, pos;
    85		u32 cap;
    86		int rc;
    87	
    88		if (!pci_is_pcie(pdev))
    89			return;
    90	
    91		pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_IDE);
    92		if (!pos)
    93			return;
    94	
    95		pci_read_config_dword(pdev, pos + PCI_IDE_CAP, &cap);
    96		if (!(cap & (PCI_IDE_CAP_LNK | PCI_IDE_CAP_SEL)))
    97			return;
    98	
  > 99		if (cap & PCI_IDE_CAP_LNK)
   100			link_num = 1 + FIELD_GET(PCI_IDE_CAP_LNK_NUM, cap);
   101	
 > 102		if (cap & PCI_IDE_CAP_SEL)
   103			select_num = 1 + FIELD_GET(PCI_IDE_CAP_SEL_NUM, cap);
   104	
   105		pdev->ide_support = true;
   106		pdev->ide.link_num = link_num;
   107		pdev->ide.select_num = select_num;
   108		pdev->ide.stream_min = 0;
   109		pdev->ide.stream_max = link_num + select_num;
   110		ida_init(&pdev->ide.stream_pos_ids);
   111		ida_init(&pdev->ide.stream_ids);
   112	
   113		/* No CMA established, just exit */
   114		if (!test_bit(PCI_CMA_AUTHENTICATED, &pdev->priv_flags))
   115			return;
   116	
   117		if (pci_pcie_type(pdev) == PCI_EXP_TYPE_ENDPOINT ||
   118		    pci_pcie_type(pdev) == PCI_EXP_TYPE_RC_END) {
   119			struct pci_dev *rp = pcie_find_root_port(pdev);
   120	
   121			rc = pcie_ide_stream_create(rp, pdev,
   122						    PCI_IDE_STREAM_TYPE_SELECTIVE);
   123			if (rc) {
   124				dev_dbg(&pdev->dev,
   125					"Failed to establish IDE stream.\n");
   126				return;
   127			}
   128		}
   129	}
   130	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
