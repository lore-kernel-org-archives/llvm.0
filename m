Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA3429A0
	for <llvm@lists.linux.dev>; Thu, 16 Jun 2022 15:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655394068; x=1686930068;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=177HsodJhwWD0Qkb0iFftpOM/MgSWjE1YFwWaL3Rc4Q=;
  b=OpogsaS1nuzpT0pQo802zcrlbRaDuVyVv++IaKU0bqGEzgCy7Gi70SmA
   OGf87yqMzAnruiMjfvuJjUY1UqL435lF1DNL5zb049puAsHejq9V12sRX
   evB+5p0Bc0uiNK57786qCQ4EX0nGFQeV2QqVYJF9gr8fHpk6fy80z/k2K
   kjwe0gPB88WlbRNmtQgWO4LfP5EUJVsc6FRrkT09JWXwAw6CKGNSnRKte
   eIIFmY7baXSV0ZgGBLQsT5KMFjmWLRW997yReIdZzdqfgy2tRJin022C4
   x0CxXus+3enbxLh89BuqsWuoMI8j7O17DioSeA2JPH7fCsf8tSyd4WYKi
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="304721032"
X-IronPort-AV: E=Sophos;i="5.92,305,1650956400"; 
   d="scan'208";a="304721032"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 08:41:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,305,1650956400"; 
   d="scan'208";a="536490997"
Received: from lkp-server01.sh.intel.com (HELO 60dabacc1df6) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Jun 2022 08:41:04 -0700
Received: from kbuild by 60dabacc1df6 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o1rcG-000OVR-95;
	Thu, 16 Jun 2022 15:41:04 +0000
Date: Thu, 16 Jun 2022 23:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: priyanka.dandamudi@intel.com, matthew.auld@intel.com,
	intel-gfx@lists.freedesktop.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org
Subject: Re: [Intel-gfx] [PATCH i-g-t 1/2] drm/i915: Add support for LMEM
 PCIe resizable bar
Message-ID: <202206162313.aYMhL5Br-lkp@intel.com>
References: <20220616120509.1190329-2-priyanka.dandamudi@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616120509.1190329-2-priyanka.dandamudi@intel.com>

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/priyanka-dandamudi-intel-com/Add-support-for-LMEM-PCIe-resizable-bar/20220616-201631
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: i386-randconfig-a013 (https://download.01.org/0day-ci/archive/20220616/202206162313.aYMhL5Br-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project f0e608de27b3d568000046eebf3712ab542979d6)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/0242b37c1e2e73134035a0847c34367331f16cca
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review priyanka-dandamudi-intel-com/Add-support-for-LMEM-PCIe-resizable-bar/20220616-201631
        git checkout 0242b37c1e2e73134035a0847c34367331f16cca
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/i915/i915_driver.c:374:44: warning: result of comparison of constant 4294967296 with expression of type 'resource_size_t' (aka 'unsigned int') is always false [-Wtautological-constant-out-of-range-compare]
                                           IORESOURCE_MEM_64) && root_res->start > 0x100000000ull)
                                                                 ~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   1 warning generated.


vim +374 drivers/gpu/drm/i915/i915_driver.c

   354	
   355	#define LMEM_BAR_NUM 2
   356	static void i915_resize_lmem_bar(struct drm_i915_private *i915)
   357	{
   358		struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
   359		struct pci_bus *root = pdev->bus;
   360		struct resource *root_res;
   361		resource_size_t rebar_size = __lmem_rebar_size(i915, LMEM_BAR_NUM);
   362		u32 pci_cmd;
   363		int i;
   364	
   365		if (!rebar_size)
   366			return;
   367	
   368		/* Find out if root bus contains 64bit memory addressing */
   369		while (root->parent)
   370			root = root->parent;
   371	
   372		pci_bus_for_each_resource(root, root_res, i) {
   373			if (root_res && root_res->flags & (IORESOURCE_MEM |
 > 374						IORESOURCE_MEM_64) && root_res->start > 0x100000000ull)
   375				break;
   376		}
   377	
   378		/* pci_resize_resource will fail anyways */
   379		if (!root_res) {
   380			drm_info(&i915->drm, "Can't resize LMEM BAR - platform support is missing\n");
   381			return;
   382		}
   383	
   384		/* First disable PCI memory decoding references */
   385		pci_read_config_dword(pdev, PCI_COMMAND, &pci_cmd);
   386		pci_write_config_dword(pdev, PCI_COMMAND,
   387				       pci_cmd & ~PCI_COMMAND_MEMORY);
   388	
   389		__resize_bar(i915, LMEM_BAR_NUM, rebar_size);
   390	
   391		pci_assign_unassigned_bus_resources(pdev->bus);
   392		pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
   393	}
   394	

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
