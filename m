Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAAE1A31;
	Tue, 24 Jan 2023 03:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674530617; x=1706066617;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i5cQGgEfBw/33l88+xUU6jS6/UEUfmUd9BXWUVIFskk=;
  b=G7mAijWdPW9Wn+H9l4epHGffrzY9hWOjkWO0fChUhO4eao4ZDLZRj0Wa
   W4jGT896PqObgK9uqq6L2PxEKS2x+I5VllumvdHi9B3TTOOEy5PYiSo8L
   UWicR1Hvqf1nSv8MT1cBRfuvImI2xjazHn6kf9VTejIICzhfcLoND9qtn
   o2m/Fdl0ZkzyOw5Ha0N7PyVPYw84IrOQypciJBk06BsfOuEOccAfdpdN1
   YOsWAlzopXKRal1bCiMwPc3MWwM3xsGZaln5iCqmSLhJyvIfFRYy1X3GD
   oY7kP4gtj7SYJOvM2Z7uetRdowLjfhuftNseRwo36VI1cekR0hCOeFuJu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="305884412"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="305884412"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 19:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="804430035"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="804430035"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 23 Jan 2023 19:23:35 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pK9uI-00065c-27;
	Tue, 24 Jan 2023 03:23:34 +0000
Date: Tue, 24 Jan 2023 11:23:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:guest-filter-upstream 5/30]
 drivers/base/da_firmware.c:145:8: warning: no previous prototype for
 function 'parse_firmware_devices'
Message-ID: <202301241135.15kn7DPy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest-filter-upstream
head:   2eb6cd239352583e1275ed7d6e772e7bbc0343b0
commit: 304ef1a77b5f5171d3e3ceb4d315ac79b135ab92 [5/30] driver core: Add support to parse device authorize firmware
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230124/202301241135.15kn7DPy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/304ef1a77b5f5171d3e3ceb4d315ac79b135ab92
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx guest-filter-upstream
        git checkout 304ef1a77b5f5171d3e3ceb4d315ac79b135ab92
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/coco/tdx/ drivers/base/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/base/da_firmware.c:145:8: warning: no previous prototype for function 'parse_firmware_devices' [-Wmissing-prototypes]
   size_t parse_firmware_devices(struct da_bus_node *node, void *data)
          ^
   drivers/base/da_firmware.c:145:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t parse_firmware_devices(struct da_bus_node *node, void *data)
   ^
   static 
   1 warning generated.


vim +/parse_firmware_devices +145 drivers/base/da_firmware.c

   144	
 > 145	size_t parse_firmware_devices(struct da_bus_node *node, void *data)
   146	{
   147		struct da_pci_device_id *da_id = data;
   148		struct pci_device_id *pci_ids;
   149		struct da_bus_device_id *ids;
   150		unsigned int i;
   151	
   152		if (!strncmp(node->name, "pci", 3)) {
   153			pci_ids = kmalloc_array(node->count, sizeof(*pci_ids), GFP_KERNEL | __GFP_ZERO);
   154			if (!pci_ids)
   155				return 0;
   156	
   157			for (i = 0; i < node->count; i++)
   158				memcpy(&pci_ids[i], &da_id[i], sizeof(*da_id));
   159	
   160			node->dev_ids = pci_ids;
   161	
   162			return sizeof(*da_id) * node->count;
   163		}
   164	
   165		ids = kmalloc_array(node->count, sizeof(*ids), GFP_KERNEL);
   166		if (!ids)
   167			return 0;
   168	
   169		memcpy(ids, data, sizeof(*ids) * node->count);
   170	
   171		node->dev_ids = ids;
   172	
   173		return sizeof(*ids) * node->count;
   174	}
   175	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
