Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC5E28FB
	for <llvm@lists.linux.dev>; Wed, 16 Feb 2022 13:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645019921; x=1676555921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qvAp7UjfatOV1YPeRCglhE3Ss3K/ZrGUqKHuMIDZNoM=;
  b=cLahU+x1YkMSQ4t4x5JswTbVMrNtL58I86L4L5h9gsy4YDB6S0mqtwcX
   G+enERz297YPPnIj9PLiMTMFTrq6sY3tCcTEOsepRhNpmERL5hAg5yzfC
   8F+Zq5bEWog6b8llH7jnNdydhbkU/q2LQ6Daj/AbUDVoegI3fcG8kMg97
   eCwDmBE71pWw8JtyF1O+o/6RzmGaOh6HZDa8cfkhVYwOJJbEgpfRVFALT
   EVIc0uCS5NAUQ3wEBo70xdHyoWB0McszoNzVWxmjv2BeUNWxRA/974fkE
   XnKjOVaIidAlGcuTaHatbKJ2s6KVS3dTaB2ppQOVHY+yfq+fZo5T/4UCG
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="250806595"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="250806595"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 05:58:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="529471368"
Received: from lkp-server01.sh.intel.com (HELO d95dc2dabeb1) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 16 Feb 2022 05:58:39 -0800
Received: from kbuild by d95dc2dabeb1 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1nKKpK-000AqY-HK; Wed, 16 Feb 2022 13:58:38 +0000
Date: Wed, 16 Feb 2022 21:58:11 +0800
From: kernel test robot <lkp@intel.com>
To: Zhu Lingshan <lingshan.zhu@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	linux-kernel@vger.kernel.org
Subject: [ls-zhu:shared_irq_v4 3/3] drivers/vdpa/ifcvf/ifcvf_main.c:94:6:
 warning: variable 'max_intr' set but not used
Message-ID: <202202162136.H3NDPxQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

tree:   https://github.com/ls-zhu/linux shared_irq_v4
head:   25e932e005734a4b8924e41bbedafa9dd394aead
commit: 25e932e005734a4b8924e41bbedafa9dd394aead [3/3] vDPA/ifcvf: implement device MSIX vector allocator
config: i386-randconfig-a004 (https://download.01.org/0day-ci/archive/20220216/202202162136.H3NDPxQe-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0e628a783b935c70c80815db6c061ec84f884af5)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ls-zhu/linux/commit/25e932e005734a4b8924e41bbedafa9dd394aead
        git remote add ls-zhu https://github.com/ls-zhu/linux
        git fetch --no-tags ls-zhu shared_irq_v4
        git checkout 25e932e005734a4b8924e41bbedafa9dd394aead
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/vdpa/ifcvf/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/vdpa/ifcvf/ifcvf_main.c:94:6: warning: variable 'max_intr' set but not used [-Wunused-but-set-variable]
           u16 max_intr;
               ^
   1 warning generated.


vim +/max_intr +94 drivers/vdpa/ifcvf/ifcvf_main.c

    88	
    89	static int ifcvf_request_irq(struct ifcvf_adapter *adapter)
    90	{
    91		struct pci_dev *pdev = adapter->pdev;
    92		struct ifcvf_hw *vf = &adapter->vf;
    93		int vector, nvectors, i, ret, irq;
  > 94		u16 max_intr;
    95	
    96		nvectors = ifcvf_alloc_vectors(adapter);
    97		if (nvectors <=0)
    98			return nvectors;
    99	
   100		max_intr = vf->nr_vring + 1;
   101		snprintf(vf->config_msix_name, 256, "ifcvf[%s]-config\n",
   102			 pci_name(pdev));
   103		vector = 0;
   104		vf->config_irq = pci_irq_vector(pdev, vector);
   105		ret = devm_request_irq(&pdev->dev, vf->config_irq,
   106				       ifcvf_config_changed, 0,
   107				       vf->config_msix_name, vf);
   108		if (ret) {
   109			IFCVF_ERR(pdev, "Failed to request config irq\n");
   110			return ret;
   111		}
   112	
   113		for (i = 0; i < vf->nr_vring; i++) {
   114			snprintf(vf->vring[i].msix_name, 256, "ifcvf[%s]-%d\n",
   115				 pci_name(pdev), i);
   116			vector = i + IFCVF_MSI_QUEUE_OFF;
   117			irq = pci_irq_vector(pdev, vector);
   118			ret = devm_request_irq(&pdev->dev, irq,
   119					       ifcvf_intr_handler, 0,
   120					       vf->vring[i].msix_name,
   121					       &vf->vring[i]);
   122			if (ret) {
   123				IFCVF_ERR(pdev,
   124					  "Failed to request irq for vq %d\n", i);
   125				ifcvf_free_irq(adapter, i);
   126	
   127				return ret;
   128			}
   129	
   130			vf->vring[i].irq = irq;
   131		}
   132	
   133		return 0;
   134	}
   135	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
