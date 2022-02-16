Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369AA23A1
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 07:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644995671; x=1676531671;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=7U5oGMWf02SUVa1LAPpCRrhjG1lzNajEeU86IkZlmic=;
  b=WTynbeyVvOz/mZbXiAlLE4QA/vmJOVhhkoGYBs7TGf3XZH5cGzMjZtcE
   eyKvm1e9f798jH3dakjUy/S1fqb8nhipJiepA+Z/d3dig+HAk3CReRzqD
   lLHJJNnSQ2jPwLE2lkGy+oII5Vi8d+pafVVX0yMvaVmcFIvw4warFldrw
   z2rlgltflI60LPPTF3vCqLRbRopWQ3Gq4p4S/DcMFoD27womV++qz/DpF
   uP3kwyeNP9fj9ZwGnMClpO1AaqUWMzn/ZmEDqrmwl6pa/5W3uZha+JmVy
   zEXWCNFP9D5huqUW18qcEvspBH6Q+0B2j9TSbijmI01f07bflIBb+46Aq
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="313813925"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="313813925"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2022 23:14:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; 
   d="scan'208";a="529305275"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Feb 2022 23:14:29 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKEWC-000AYw-GX; Wed, 16 Feb 2022 07:14:28 +0000
Date: Wed, 16 Feb 2022 15:13:26 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/4] NTB: EPF: support NTB transfer between PCI RC
 and EP connection
Message-ID: <202202161525.BBBVV79O-lkp@intel.com>
References: <20220215053844.7119-4-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215053844.7119-4-Frank.Li@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Frank,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on helgaas-pci/next]
[also build test WARNING on jonmason-ntb/ntb-next v5.17-rc4 next-20220215]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Frank-Li/NTB-function-for-PCIe-RC-to-EP-connection/20220215-134115
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20220216/202202161525.BBBVV79O-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/84bf6254010435435a8c196e30bb2d25fd22763c
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Frank-Li/NTB-function-for-PCIe-RC-to-EP-connection/20220215-134115
        git checkout 84bf6254010435435a8c196e30bb2d25fd22763c
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/i915/gvt/ drivers/media/i2c/ drivers/pci/endpoint/functions/ kernel/bpf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/pci/endpoint/functions/pci-epf-vntb.c:975:5: warning: no previous prototype for function 'pci_read' [-Wmissing-prototypes]
   int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
       ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:975:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
   ^
   static 
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:984:5: warning: no previous prototype for function 'pci_write' [-Wmissing-prototypes]
   int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
       ^
   drivers/pci/endpoint/functions/pci-epf-vntb.c:984:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
   ^
   static 
   2 warnings generated.


vim +/pci_read +975 drivers/pci/endpoint/functions/pci-epf-vntb.c

   974	
 > 975	int pci_read(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 *val)
   976	{
   977		if (devfn == 0) {
   978			memcpy(val, ((uint8_t *)pci_space) + where, size);
   979			return 0;
   980		}
   981		return -1;
   982	}
   983	
 > 984	int pci_write(struct pci_bus *bus, unsigned int devfn, int where, int size, u32 val)
   985	{
   986		return 0;
   987	}
   988	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
