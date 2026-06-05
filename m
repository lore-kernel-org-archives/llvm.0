Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39B226A0A7;
	Fri,  5 Jun 2026 05:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780636393; cv=none; b=MBk16BJBm7Uc59MYkdm633HGiVYfXDY7K/ygg/0+wRa+uHiHrlAK9MKJZVHdSFL3ECTNUlYeA4uva8aOVNHHT9BYmaisKDOXmpMx317zuHOQSAKezlV4F2e5ECImDxh8moqUTnS1eJ8t1yYM0ePx3oytm3y+B0ZUJxm3rRz+LVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780636393; c=relaxed/simple;
	bh=wjjS3RRY2MZkS8+TAwsHEXrYCx9dywpP1pA5N3cKgAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YF7p5MV8D/H3+y8sNYgMQsJVD7PC8kWNOp3IT2WHgl3ZBuwlmA4Pz4xcPdGXzGYDI5VUnjqCO8NGW5IKreSftTD/nrsnLDYElpnTYUa7P9m+n+utdndp6unHHwWLz0TH0mgxLW/tmDoXY6CRESXjcycSUkU+wVHJMo54n1wtgXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEZ5VbiC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEZ5VbiC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780636391; x=1812172391;
  h=date:from:to:cc:subject:message-id;
  bh=wjjS3RRY2MZkS8+TAwsHEXrYCx9dywpP1pA5N3cKgAE=;
  b=bEZ5VbiCJCwlGXXEtWNlVgqgtBInEgLPssDNrEDbDQi/M6OzrEjk3yHD
   4mUHxHPkh97+JDajXhh1eW1iWTt/D8iN8O6zaetN/peFy7LHsdkz2RHIH
   QV4GBTRM7tFDsGeunmcuIUnAHyi2EsKXK/Zfm/0fT3IGKfFeai+Y+dteM
   CMT1iNmMzL7rDryogH7cn9mNpChaBa0J0Go2+77+d2w8XJ64eWl4/IiWr
   GC0NfpdQYhji55r7VudUYgwN56/vPCSPYCpu0UVHQjYfMfH77O0bnxa/z
   d8i0wk5MY0U3Bo7nukghByzFJU5Ys+GSzvSCb6Kgopwrm/HXEPfxmZeAu
   w==;
X-CSE-ConnectionGUID: zKcvCA26Q22KOwyV2ug1Xw==
X-CSE-MsgGUID: lAqLAj6SRNuEFFnx1HrPog==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81529061"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81529061"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 22:13:11 -0700
X-CSE-ConnectionGUID: Vg3sGhd6QiCkAXX/rUMsMw==
X-CSE-MsgGUID: ebVgZb6SQo+8a9d7Zy2tww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="249077884"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 04 Jun 2026 22:13:09 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVMrj-000000002U7-1mbJ;
	Fri, 05 Jun 2026 05:13:07 +0000
Date: Fri, 05 Jun 2026 07:12:09 +0200
From: kernel test robot <lkp@intel.com>
To: Chengwen Feng <fengchengwen@huawei.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 0day robot <lkp@intel.com>
Subject: drivers/vfio/pci/vfio_pci_config.c:1166:9: error: call to
 undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202606050731.hnLOapOi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/PCI-TPH-Fix-pcie_tph_get_st_table_loc-field-extraction/20260604-214853
head:   345c2b0902fb86eb32cf8fadfdfb114490531b81
commit: 345c2b0902fb86eb32cf8fadfdfb114490531b81 vfio/pci: Virtualize PCIe TPH capability registers
date:   15 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260605/202606050731.hnLOapOi-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050731.hnLOapOi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050731.hnLOapOi-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/vfio/pci/vfio_pci_config.c:1166:9: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1166 |         mode = FIELD_GET(PCI_TPH_CTRL_MODE_SEL_MASK, data);
         |                ^
   1 error generated.


vim +/FIELD_GET +1166 drivers/vfio/pci/vfio_pci_config.c

  1127	
  1128	static int vfio_find_cap_start(struct vfio_pci_core_device *vdev, int pos);
  1129	static int vfio_tph_config_write(struct vfio_pci_core_device *vdev, int pos,
  1130					 int count, struct perm_bits *perm,
  1131					 int offset, __le32 val)
  1132	{
  1133		int req_en_byte = PCI_TPH_CTRL + 1;
  1134		struct pci_dev *pdev = vdev->pdev;
  1135		__le32 org_val = 0;
  1136		bool extended;
  1137		u8 mode, req;
  1138		int i, ret;
  1139		u16 start;
  1140		u32 data;
  1141	
  1142		if (!vdev->tph_permit)
  1143			return count;
  1144	
  1145		/* Back up the original values in order rollback when fail */
  1146		if (offset <= req_en_byte && offset + count > req_en_byte)
  1147			vfio_default_config_read(vdev, pos, count, perm, offset,
  1148						 &org_val);
  1149	
  1150		ret = vfio_default_config_write(vdev, pos, count, perm, offset, val);
  1151		if (ret != count)
  1152			return ret;
  1153	
  1154		/* Skip if write range does not cover Requester Enable byte */
  1155		if (offset > req_en_byte || offset + count <= req_en_byte)
  1156			return count;
  1157	
  1158		ret = vfio_pci_set_power_state(vdev, PCI_D0);
  1159		if (ret)
  1160			return count;
  1161	
  1162		mutex_lock(&vdev->tph_lock);
  1163	
  1164		start = vfio_find_cap_start(vdev, pos);
  1165		data = le32_to_cpu(*(__le32 *)&vdev->vconfig[start + PCI_TPH_CTRL]);
> 1166		mode = FIELD_GET(PCI_TPH_CTRL_MODE_SEL_MASK, data);
  1167		req = FIELD_GET(PCI_TPH_CTRL_REQ_EN_MASK, data);
  1168	
  1169		if (req == PCI_TPH_REQ_TPH_ONLY || req == PCI_TPH_REQ_EXT_TPH) {
  1170			extended = !!(req == PCI_TPH_REQ_EXT_TPH);
  1171			ret = pcie_enable_tph_explicit(pdev, mode, extended);
  1172			if (!ret && vdev->tph_st_shadow) {
  1173				for (i = 0; i < vdev->tph_st_entries; i++)
  1174					pcie_tph_set_st_entry(pdev, i,
  1175							      vdev->tph_st_shadow[i]);
  1176			}
  1177			if (ret)
  1178				vfio_default_config_write(vdev, pos, count, perm,
  1179							  offset, org_val);
  1180		} else if (req == PCI_TPH_REQ_DISABLE) {
  1181			pcie_disable_tph(vdev->pdev);
  1182		} else {
  1183			vfio_default_config_write(vdev, pos, count, perm, offset,
  1184						  org_val);
  1185		}
  1186	
  1187		mutex_unlock(&vdev->tph_lock);
  1188	
  1189		return count;
  1190	}
  1191	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
