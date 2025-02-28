Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A11D25F781;
	Fri, 28 Feb 2025 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740743779; cv=none; b=Lt+a6q55t+tUN6ZX+bgDdA2BEemLXlU6LepfhVEigCfB2yXm6OS1r+W3vZmdwhbFDtVBoEygnh7J10Z/Uz/B7WlQhc2Pnyh2C13IlX23qdluDZK0btYYafXMpr5Cxz4UTs+L6aNTE6nkzmHZEsTrCqVkaeVAxcqz9MroIntmL1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740743779; c=relaxed/simple;
	bh=DU2MIOCInzlt7F0yK4hZYi3mDmHRqglMly/XxHRLOHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHaRzj6DaRL1k+3oFZU+7PVJMZJjfMswtdsMfFpsKhQbN3TjY2oXqKJwtF64upBG3/Exsvd66avUUvXkDrbw2d2TEs7+1OqHmnIsXWtcnLRLEDwLudu04hQyBmOKMYgesTmpeUjHuajFOILV29ebaekLejcu7H8WyH7uLlwhCv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V2/n72HI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V2/n72HI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740743778; x=1772279778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DU2MIOCInzlt7F0yK4hZYi3mDmHRqglMly/XxHRLOHM=;
  b=V2/n72HIvmbOz00rWt5DudTf0kjCPM033mr8oFU2du28LbIiXYY87qYb
   PrPQpkJbn1Bqok0197xgZoy2OM3II4rt1XZUgOipgzGlGPlj1S527TzZw
   Fo+KIr2o/IicYxtnew4JLLXB5yPM6bWd0oZ9xfs2zE5M2CNuVYiMe89BD
   UF8Ceo8vfIGrhtnUgDL22qvTSojIYxmDsb/vFENX1JDYai/E+WQj2yR/8
   PGITryaihT7S7nMop3kNlFsBeYenTDoB/RqVmfAPLe0xblMdga0cot6u1
   9S9mVYo920tLaijrVY7uBG3LZh01wsTBWjCPYX5n2BUvDBUFVrIWN6Ieb
   A==;
X-CSE-ConnectionGUID: pDjTlRRXRBC6zp2D2QsjWw==
X-CSE-MsgGUID: f45xNe4FSRWHJ08LcbUehQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="59082606"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="59082606"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 03:56:17 -0800
X-CSE-ConnectionGUID: jgKVaaQqQzWugKKqsbzRCQ==
X-CSE-MsgGUID: bNPavz8jSr6zb9KSBDo6yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="117106196"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 28 Feb 2025 03:56:13 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnyyR-000EpM-1p;
	Fri, 28 Feb 2025 11:56:11 +0000
Date: Fri, 28 Feb 2025 19:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: Longfang Liu <liulongfang@huawei.com>, alex.williamson@redhat.com,
	jgg@nvidia.com, shameerali.kolothum.thodi@huawei.com,
	jonathan.cameron@huawei.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxarm@openeuler.org, liulongfang@huawei.com
Subject: Re: [PATCH v4 1/5] hisi_acc_vfio_pci: fix XQE dma address error
Message-ID: <202502281952.Z9JQ8jcK-lkp@intel.com>
References: <20250225062757.19692-2-liulongfang@huawei.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225062757.19692-2-liulongfang@huawei.com>

Hi Longfang,

kernel test robot noticed the following build errors:

[auto build test ERROR on awilliam-vfio/next]
[also build test ERROR on awilliam-vfio/for-linus linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Longfang-Liu/hisi_acc_vfio_pci-fix-XQE-dma-address-error/20250225-143347
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20250225062757.19692-2-liulongfang%40huawei.com
patch subject: [PATCH v4 1/5] hisi_acc_vfio_pci: fix XQE dma address error
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502281952.Z9JQ8jcK-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281952.Z9JQ8jcK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281952.Z9JQ8jcK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c:9:
   In file included from include/linux/hisi_acc_qm.h:10:
   In file included from include/linux/pci.h:1644:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2224:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c:448:23: error: use of undeclared identifier 'ACC_DRV_MAR'
     448 |         vf_data->major_ver = ACC_DRV_MAR;
         |                              ^
>> drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c:449:23: error: use of undeclared identifier 'ACC_DRV_MIN'
     449 |         vf_data->minor_ver = ACC_DRV_MIN;
         |                              ^
   3 warnings and 2 errors generated.


vim +/ACC_DRV_MAR +448 drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c

   438	
   439	static int vf_qm_get_match_data(struct hisi_acc_vf_core_device *hisi_acc_vdev,
   440					struct acc_vf_data *vf_data)
   441	{
   442		struct hisi_qm *pf_qm = hisi_acc_vdev->pf_qm;
   443		struct device *dev = &pf_qm->pdev->dev;
   444		int vf_id = hisi_acc_vdev->vf_id;
   445		int ret;
   446	
   447		vf_data->acc_magic = ACC_DEV_MAGIC_V2;
 > 448		vf_data->major_ver = ACC_DRV_MAR;
 > 449		vf_data->minor_ver = ACC_DRV_MIN;
   450		/* Save device id */
   451		vf_data->dev_id = hisi_acc_vdev->vf_dev->device;
   452	
   453		/* VF qp num save from PF */
   454		ret = pf_qm_get_qp_num(pf_qm, vf_id, &vf_data->qp_base);
   455		if (ret <= 0) {
   456			dev_err(dev, "failed to get vft qp nums!\n");
   457			return -EINVAL;
   458		}
   459	
   460		vf_data->qp_num = ret;
   461	
   462		/* VF isolation state save from PF */
   463		ret = qm_read_regs(pf_qm, QM_QUE_ISO_CFG_V, &vf_data->que_iso_cfg, 1);
   464		if (ret) {
   465			dev_err(dev, "failed to read QM_QUE_ISO_CFG_V!\n");
   466			return ret;
   467		}
   468	
   469		return 0;
   470	}
   471	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
