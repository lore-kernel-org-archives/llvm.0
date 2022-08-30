Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7398E374
	for <llvm@lists.linux.dev>; Tue, 30 Aug 2022 05:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1661835842; x=1693371842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=6KKF2JZkbkjkGGOElKzxIs7M0EPkmxF+SdOE1b/Aq6k=;
  b=ULsKJErk4iHg4g1sh5np4DdHTxoKJlQX/SSHYYGr4kanQfxBBFoJi0PG
   g5y9D8obsmylzhqzy1K2O0e2mPh9JIPa+eZdMCRfPRjO29Z2ElPRFSFGU
   MQxhv0alKZcOPGGqnlgUlyPa86dZ3l2PeA79iqV0d83/E9wiF/gm2pa8v
   rWg3pk7anFEiBtnWIVEqDVeysZoxIoRV8cKAS9tE7h3S2PfkwyrzMpaz0
   Cl8YO0AaOLQ3iVQgRMJ05dotUfmsas5IjYmRizvx9/pGDv96Y2kzYE8aM
   Qhe5Eig+yKZ5pwYpmv7pvDNFu3DXMrQVk8JFtvnJWaDWJATAggdGX8jZv
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="381376087"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="381376087"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2022 22:04:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="672680749"
Received: from lkp-server02.sh.intel.com (HELO e45bc14ccf4d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 29 Aug 2022 22:04:00 -0700
Received: from kbuild by e45bc14ccf4d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oStPs-0000Yt-19;
	Tue, 30 Aug 2022 05:04:00 +0000
Date: Tue, 30 Aug 2022 13:03:17 +0800
From: kernel test robot <lkp@intel.com>
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [PATCH RFC 2/2] pci: create device tree node for selected devices
Message-ID: <202208301237.ndR0szmn-lkp@intel.com>
References: <1661809417-11370-3-git-send-email-lizhi.hou@amd.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1661809417-11370-3-git-send-email-lizhi.hou@amd.com>

Hi Lizhi,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on helgaas-pci/next]
[also build test ERROR on robh/for-next linus/master v6.0-rc3 next-20220829]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lizhi-Hou/Generate-device-tree-node-for-pci-devices/20220830-054614
base:   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
config: i386-randconfig-a012-20220829 (https://download.01.org/0day-ci/archive/20220830/202208301237.ndR0szmn-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/f78f02388fd4e94a2ce74278c2af4c983b3ed98d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Lizhi-Hou/Generate-device-tree-node-for-pci-devices/20220830-054614
        git checkout f78f02388fd4e94a2ce74278c2af4c983b3ed98d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from drivers/pci/controller/cadence/pci-j721e.c:23:
>> drivers/pci/controller/cadence/../../pci.h:693:1: error: expected identifier or '('
   {
   ^
   1 error generated.


vim +693 drivers/pci/controller/cadence/../../pci.h

   690	
   691	static inline void
   692	of_pci_remove_node(struct pci_dev *pdev);
 > 693	{
   694	}
   695	#endif /* CONFIG_OF_DYNAMIC */
   696	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
