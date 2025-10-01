Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE8419DF4F;
	Wed,  1 Oct 2025 08:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307620; cv=none; b=TfAzV+dV60hTOlHGYqyrScyjLGlYOnuvO40MtRQ81hTNP1H3aLc6OPZrO/Zhac94L5BRexkaqXgryfcBs6T0GkN00wWrkS4fDQVgm7ofNZF4IP2mtV2NvXg6LdbDq+KGAfv0iEyDzMimJ80NEg20tzrrD1Q494Wy84wZMgwTHiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307620; c=relaxed/simple;
	bh=CkhS9nO4OcwZ75+Xz4ricIYnN+zqZxXwC5+z7Wwgp7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pxMPTtZYoitNf06HKntUJTZIbdjxGf1ABVfXMYbx0qk25HlslTDGdRriv/IPYztxMIETKTlFgocx3eMoYjSZqRmCiB3kRiBkDiQKB1gFOn3jsZMvnxAsK8+E/ksbs22VT639F87l1N/qu3sCNwQMjEaFG81/8/mMlmsTZXlnQ1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bN8aQEKt; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bN8aQEKt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759307619; x=1790843619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CkhS9nO4OcwZ75+Xz4ricIYnN+zqZxXwC5+z7Wwgp7g=;
  b=bN8aQEKtwzPUuwBReip00QzQRKG46haZingXDHAM1SxcYZ09N7tQBOnW
   HoKDzyQWB0HVsbozXyIgldNLJRClwhibaWwxzQ3I+w/6gU0UXAXL+HDdp
   TY0niUEQQhpnhb4FJA2W+2XJzfOvMrWCj7S5FnVj0dQkEIUJ7ocTRNbgL
   hT6a4i5EO8DQ2JsEQ+9S0U2abN8O31epxKL98G5I8tTaJkI9c3r0H6LHx
   q3wJs3xGqMYNf6RP8WAjHyx5gSYYz6AcxXWISEHt2hhWKbXmro6j82KWv
   ymWod+lksY+LAG4/mNDc/6UBRI7yryd0kPzHHMhCvUhNSCjA8UiYgENC0
   w==;
X-CSE-ConnectionGUID: d8/LgiISS+uIUCZWrQr7LA==
X-CSE-MsgGUID: GsQTX0edRbaU63Ra2s6rbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="84196359"
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="84196359"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2025 01:33:38 -0700
X-CSE-ConnectionGUID: 3Zs3Y9PhSGu4YGq3bgFUZA==
X-CSE-MsgGUID: bsNHBe0iSrezyTGLpiDg3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,306,1751266800"; 
   d="scan'208";a="209689188"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Oct 2025 01:33:36 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v3sHG-0002pv-0V;
	Wed, 01 Oct 2025 08:33:34 +0000
Date: Wed, 1 Oct 2025 16:33:22 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:vfio_get_region_info_op 25/28]
 drivers/vfio/pci/vfio_pci_core.c:1005:16: warning: unused variable 'minsz'
Message-ID: <202510011644.GIbWHIIW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux vfio_get_region_info_op
head:   efea69dc6e5be19ed7b37490c863b00b304a3cb0
commit: 248fdef198f527aa782953cdc9d94978725986d9 [25/28] vfio/pci: Convert all PCI drivers to get_region_info_caps
config: i386-buildonly-randconfig-005-20251001 (https://download.01.org/0day-ci/archive/20251001/202510011644.GIbWHIIW-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251001/202510011644.GIbWHIIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510011644.GIbWHIIW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/vfio/pci/vfio_pci_core.c:35:
   In file included from drivers/vfio/pci/vfio_pci_priv.h:5:
   In file included from include/linux/vfio_pci_core.h:13:
   include/linux/vfio.h:139:13: warning: declaration of 'struct vfio_info_cap' will not be visible outside of this function [-Wvisibility]
     139 |                                         struct vfio_info_cap *caps);
         |                                                ^
>> drivers/vfio/pci/vfio_pci_core.c:1005:16: warning: unused variable 'minsz' [-Wunused-variable]
    1005 |         unsigned long minsz = offsetofend(struct vfio_region_info, offset);
         |                       ^~~~~
   2 warnings generated.


vim +/minsz +1005 drivers/vfio/pci/vfio_pci_core.c

89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31   998  
82d2acf97b7df6 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30   999  int vfio_pci_ioctl_get_region_info(struct vfio_device *core_vdev,
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1000  				   struct vfio_region_info *info,
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1001  				   struct vfio_info_cap *caps)
2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2022-08-31  1002  {
82d2acf97b7df6 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1003  	struct vfio_pci_core_device *vdev =
82d2acf97b7df6 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1004  		container_of(core_vdev, struct vfio_pci_core_device, vdev);
2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2022-08-31 @1005  	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1006  	struct pci_dev *pdev = vdev->pdev;
28541d41c9e04c drivers/vfio/pci/vfio_pci.c      Alex Williamson      2016-02-22  1007  	int i, ret;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1008  
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1009  	switch (info->index) {
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1010  	case VFIO_PCI_CONFIG_REGION_INDEX:
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1011  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1012  		info->size = pdev->cfg_size;
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1013  		info->flags = VFIO_REGION_INFO_FLAG_READ |
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1014  			      VFIO_REGION_INFO_FLAG_WRITE;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1015  		break;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1016  	case VFIO_PCI_BAR0_REGION_INDEX ... VFIO_PCI_BAR5_REGION_INDEX:
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1017  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1018  		info->size = pci_resource_len(pdev, info->index);
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1019  		if (!info->size) {
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1020  			info->flags = 0;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1021  			break;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1022  		}
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1023  
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1024  		info->flags = VFIO_REGION_INFO_FLAG_READ |
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1025  			      VFIO_REGION_INFO_FLAG_WRITE;
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1026  		if (vdev->bar_mmap_supported[info->index]) {
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1027  			info->flags |= VFIO_REGION_INFO_FLAG_MMAP;
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1028  			if (info->index == vdev->msix_bar) {
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1029  				ret = msix_mmappable_cap(vdev, caps);
188ad9d6cbbce4 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2016-02-22  1030  				if (ret)
188ad9d6cbbce4 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2016-02-22  1031  					return ret;
188ad9d6cbbce4 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2016-02-22  1032  			}
188ad9d6cbbce4 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2016-02-22  1033  		}
188ad9d6cbbce4 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2016-02-22  1034  
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1035  		break;
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2022-08-31  1036  	case VFIO_PCI_ROM_REGION_INDEX: {
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1037  		void __iomem *io;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1038  		size_t size;
abafbc551fdded drivers/vfio/pci/vfio_pci.c      Alex Williamson      2020-04-22  1039  		u16 cmd;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1040  
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1041  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1042  		info->flags = 0;
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1043  		info->size = 0;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1044  
e021e6cbfb5a69 drivers/vfio/pci/vfio_pci_core.c Yunxiang Li          2025-01-02  1045  		if (pci_resource_start(pdev, PCI_ROM_RESOURCE)) {
0cfd027be1d6de drivers/vfio/pci/vfio_pci.c      Eric Auger           2019-02-15  1046  			/*
e021e6cbfb5a69 drivers/vfio/pci/vfio_pci_core.c Yunxiang Li          2025-01-02  1047  			 * Check ROM content is valid. Need to enable memory
e021e6cbfb5a69 drivers/vfio/pci/vfio_pci_core.c Yunxiang Li          2025-01-02  1048  			 * decode for ROM access in pci_map_rom().
0cfd027be1d6de drivers/vfio/pci/vfio_pci.c      Eric Auger           2019-02-15  1049  			 */
abafbc551fdded drivers/vfio/pci/vfio_pci.c      Alex Williamson      2020-04-22  1050  			cmd = vfio_pci_memory_lock_and_enable(vdev);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1051  			io = pci_map_rom(pdev, &size);
0cfd027be1d6de drivers/vfio/pci/vfio_pci.c      Eric Auger           2019-02-15  1052  			if (io) {
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1053  				info->flags = VFIO_REGION_INFO_FLAG_READ;
e021e6cbfb5a69 drivers/vfio/pci/vfio_pci_core.c Yunxiang Li          2025-01-02  1054  				/* Report the BAR size, not the ROM size. */
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1055  				info->size = pci_resource_len(pdev,
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1056  							      PCI_ROM_RESOURCE);
0cfd027be1d6de drivers/vfio/pci/vfio_pci.c      Eric Auger           2019-02-15  1057  				pci_unmap_rom(pdev, io);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1058  			}
abafbc551fdded drivers/vfio/pci/vfio_pci.c      Alex Williamson      2020-04-22  1059  			vfio_pci_memory_unlock_and_restore(vdev, cmd);
e021e6cbfb5a69 drivers/vfio/pci/vfio_pci_core.c Yunxiang Li          2025-01-02  1060  		} else if (pdev->rom && pdev->romlen) {
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1061  			info->flags = VFIO_REGION_INFO_FLAG_READ;
e021e6cbfb5a69 drivers/vfio/pci/vfio_pci_core.c Yunxiang Li          2025-01-02  1062  			/* Report BAR size as power of two. */
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1063  			info->size = roundup_pow_of_two(pdev->romlen);
e021e6cbfb5a69 drivers/vfio/pci/vfio_pci_core.c Yunxiang Li          2025-01-02  1064  		}
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1065  
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1066  		break;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1067  	}
84237a826b261d drivers/vfio/pci/vfio_pci.c      Alex Williamson      2013-02-18  1068  	case VFIO_PCI_VGA_REGION_INDEX:
84237a826b261d drivers/vfio/pci/vfio_pci.c      Alex Williamson      2013-02-18  1069  		if (!vdev->has_vga)
84237a826b261d drivers/vfio/pci/vfio_pci.c      Alex Williamson      2013-02-18  1070  			return -EINVAL;
84237a826b261d drivers/vfio/pci/vfio_pci.c      Alex Williamson      2013-02-18  1071  
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1072  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1073  		info->size = 0xc0000;
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1074  		info->flags = VFIO_REGION_INFO_FLAG_READ |
84237a826b261d drivers/vfio/pci/vfio_pci.c      Alex Williamson      2013-02-18  1075  			      VFIO_REGION_INFO_FLAG_WRITE;
84237a826b261d drivers/vfio/pci/vfio_pci.c      Alex Williamson      2013-02-18  1076  
84237a826b261d drivers/vfio/pci/vfio_pci.c      Alex Williamson      2013-02-18  1077  		break;
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2022-08-31  1078  	default: {
dda01f787df9f9 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2017-12-12  1079  		struct vfio_region_info_cap_type cap_type = {
dda01f787df9f9 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2017-12-12  1080  			.header.id = VFIO_REGION_INFO_CAP_TYPE,
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2022-08-31  1081  			.header.version = 1
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2022-08-31  1082  		};
c535d34569bbc6 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede       2016-11-17  1083  
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1084  		if (info->index >= VFIO_PCI_NUM_REGIONS + vdev->num_regions)
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1085  			return -EINVAL;
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1086  		info->index = array_index_nospec(
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1087  			info->index, VFIO_PCI_NUM_REGIONS + vdev->num_regions);
28541d41c9e04c drivers/vfio/pci/vfio_pci.c      Alex Williamson      2016-02-22  1088  
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1089  		i = info->index - VFIO_PCI_NUM_REGIONS;
28541d41c9e04c drivers/vfio/pci/vfio_pci.c      Alex Williamson      2016-02-22  1090  
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1091  		info->offset = VFIO_PCI_INDEX_TO_OFFSET(info->index);
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1092  		info->size = vdev->region[i].size;
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1093  		info->flags = vdev->region[i].flags;
28541d41c9e04c drivers/vfio/pci/vfio_pci.c      Alex Williamson      2016-02-22  1094  
c535d34569bbc6 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede       2016-11-17  1095  		cap_type.type = vdev->region[i].type;
c535d34569bbc6 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede       2016-11-17  1096  		cap_type.subtype = vdev->region[i].subtype;
c535d34569bbc6 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede       2016-11-17  1097  
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1098  		ret = vfio_info_add_capability(caps, &cap_type.header,
dda01f787df9f9 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2017-12-12  1099  					       sizeof(cap_type));
28541d41c9e04c drivers/vfio/pci/vfio_pci.c      Alex Williamson      2016-02-22  1100  		if (ret)
28541d41c9e04c drivers/vfio/pci/vfio_pci.c      Alex Williamson      2016-02-22  1101  			return ret;
c535d34569bbc6 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede       2016-11-17  1102  
c2c0f1cde0ef56 drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy 2018-12-19  1103  		if (vdev->region[i].ops->add_capability) {
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2022-08-31  1104  			ret = vdev->region[i].ops->add_capability(
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1105  				vdev, &vdev->region[i], caps);
c2c0f1cde0ef56 drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy 2018-12-19  1106  			if (ret)
c2c0f1cde0ef56 drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy 2018-12-19  1107  				return ret;
c2c0f1cde0ef56 drivers/vfio/pci/vfio_pci.c      Alexey Kardashevskiy 2018-12-19  1108  		}
c535d34569bbc6 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede       2016-11-17  1109  	}
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1110  	}
248fdef198f527 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1111  	return 0;
2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2022-08-31  1112  }
82d2acf97b7df6 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe      2025-09-30  1113  EXPORT_SYMBOL_GPL(vfio_pci_ioctl_get_region_info);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson      2012-07-31  1114  

:::::: The code at line 1005 was first introduced by commit
:::::: 2ecf3b58ed7bc52ad58e02bb1596130fa6e6da53 vfio-pci: Break up vfio_pci_core_ioctl() into one function per ioctl

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
