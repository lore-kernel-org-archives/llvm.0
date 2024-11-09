Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E3C8836;
	Sat,  9 Nov 2024 08:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731139843; cv=none; b=KTEW4IgUn/MyttYcTdB1pG65nLf2Jm00Ps4zlaNDallrmG85MpX9tT2Wux4DACQLBLVySD7jRZ1ELqV98xyysjeAnPc3xi+gXd5Pkdk7A8xfzfeNsJjIeIbSVjnhjpTSteC74tw7LT2UuEQZb0egHwKECfptcr+y8ucFlZoDy3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731139843; c=relaxed/simple;
	bh=MGLLQLeBMJJhUNTLWntyt/SGCbTjq2H/PmWZJx7hfEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7lvKy8xK58LvKbVD1YVRbiQC3AhNXhHSeFp7yDBO+JXJlaVVRWWzLjyZZxH3wLudA5rNRJ3Ew/SDvqv6JBQJJlHF99bPnbJtozJbJ/K+t1VFWB7lNtATKtOO1ezzZOKDgYlFs4f865h98Aa4PUGlyNob9H3mCmKDa8tRPkXnDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OjzDGZu7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OjzDGZu7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731139842; x=1762675842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MGLLQLeBMJJhUNTLWntyt/SGCbTjq2H/PmWZJx7hfEg=;
  b=OjzDGZu7rx93NLFL5d0fKx7CdsaQL504cDuCuhuTKnqTucjajGPsPjpr
   0tHqWCDs5qaKj1nW9eyUU5zLbp8XGsVo4y8jur/mSLW2UvB4SwXrcbQR1
   i3xlXsLUMCwKFSwIRKnaJ89h9mtY7OIzCQm0lArcR6RzYhlJp7myTGjgd
   g+iwD1giCZjLWYMOZCNb2aKQICRwRVYJy6dsugXhmU84aVIgTAwohEsZ+
   0NIfkx0XCZzlhMLtk/T1sUC7fPabkTzmkGLjQE+EBcF291JS4DLKDsP/k
   WOPXovChBZf2p2bNMhgZmERSjWrkOQBGCyCQvNJ0Phc8tyNIp9ct4/6d2
   Q==;
X-CSE-ConnectionGUID: iEfJAHJcQFSkrfNBtFIMhA==
X-CSE-MsgGUID: uiedQZwVQtKZv80VJuBBQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31180699"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31180699"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 00:10:41 -0800
X-CSE-ConnectionGUID: LB7pq2h1Qf6/jrEl4p50fQ==
X-CSE-MsgGUID: bE/4jyEyS9muYlIT+63n7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="86744496"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Nov 2024 00:10:39 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9gYG-000sDe-2S;
	Sat, 09 Nov 2024 08:10:36 +0000
Date: Sat, 9 Nov 2024 16:10:34 +0800
From: kernel test robot <lkp@intel.com>
To: himanshu.madhani@oracle.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 6/8] scsi: Add multipath suppport for device handler
Message-ID: <202411091541.tWU8XhvE-lkp@intel.com>
References: <20241109044529.992935-7-himanshu.madhani@oracle.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109044529.992935-7-himanshu.madhani@oracle.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 128faa1845a2d5b0178b986f3bd18fb38cc08cc2]

url:    https://github.com/intel-lab-lkp/linux/commits/himanshu-madhani-oracle-com/scsi-Add-multipath-device-support/20241109-124908
base:   128faa1845a2d5b0178b986f3bd18fb38cc08cc2
patch link:    https://lore.kernel.org/r/20241109044529.992935-7-himanshu.madhani%40oracle.com
patch subject: [RFC v1 6/8] scsi: Add multipath suppport for device handler
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241109/202411091541.tWU8XhvE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091541.tWU8XhvE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091541.tWU8XhvE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/scsi/device_handler/scsi_dh_alua.c:15:
   In file included from include/scsi/scsi_eh.h:5:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
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
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/scsi/device_handler/scsi_dh_alua.c:262:46: error: no member named 'mpath_pg_data' in 'struct scsi_device'
     262 |                 struct scsi_mpath_dh_data *dh_data = sdev->mpath_pg_data;
         |                                                      ~~~~  ^
>> drivers/scsi/device_handler/scsi_dh_alua.c:273:15: error: no member named 'mpath_alua_grpid' in 'struct Scsi_Host'
     273 |                 sdev->host->mpath_alua_grpid = pg->group_id;
         |                 ~~~~~~~~~~  ^
   4 warnings and 2 errors generated.


vim +262 drivers/scsi/device_handler/scsi_dh_alua.c

   207	
   208	/*
   209	 * alua_alloc_pg - Allocate a new port_group structure
   210	 * @sdev: scsi device
   211	 * @group_id: port group id
   212	 * @tpgs: target port group settings
   213	 *
   214	 * Allocate a new port_group structure for a given
   215	 * device.
   216	 */
   217	static struct alua_port_group *alua_alloc_pg(struct scsi_device *sdev,
   218						     int group_id, int tpgs)
   219	{
   220		struct alua_port_group *pg, *tmp_pg;
   221	
   222		pg = kzalloc(sizeof(struct alua_port_group), GFP_KERNEL);
   223		if (!pg)
   224			return ERR_PTR(-ENOMEM);
   225	
   226		pg->device_id_len = scsi_vpd_lun_id(sdev, pg->device_id_str,
   227						    sizeof(pg->device_id_str));
   228		if (pg->device_id_len <= 0) {
   229			/*
   230			 * TPGS supported but no device identification found.
   231			 * Generate private device identification.
   232			 */
   233			sdev_printk(KERN_INFO, sdev,
   234				    "%s: No device descriptors found\n",
   235				    ALUA_DH_NAME);
   236			pg->device_id_str[0] = '\0';
   237			pg->device_id_len = 0;
   238		}
   239		pg->group_id = group_id;
   240		pg->tpgs = tpgs;
   241		pg->state = SCSI_ACCESS_STATE_OPTIMAL;
   242		pg->valid_states = TPGS_SUPPORT_ALL;
   243		if (optimize_stpg)
   244			pg->flags |= ALUA_OPTIMIZE_STPG;
   245		kref_init(&pg->kref);
   246		INIT_DELAYED_WORK(&pg->rtpg_work, alua_rtpg_work);
   247		INIT_LIST_HEAD(&pg->rtpg_list);
   248		INIT_LIST_HEAD(&pg->node);
   249		INIT_LIST_HEAD(&pg->dh_list);
   250		spin_lock_init(&pg->lock);
   251	
   252		spin_lock(&port_group_lock);
   253		tmp_pg = alua_find_get_pg(pg->device_id_str, pg->device_id_len,
   254					  group_id);
   255		if (tmp_pg) {
   256			spin_unlock(&port_group_lock);
   257			kfree(pg);
   258			return tmp_pg;
   259		}
   260	
   261		if (scsi_mpath_enabled(sdev)) {
 > 262			struct scsi_mpath_dh_data *dh_data = sdev->mpath_pg_data;
   263	
   264			dh_data->group_id = pg->group_id;
   265			dh_data->tpgs = pg->tpgs;
   266			dh_data->state = pg->state;
   267			dh_data->valid_states = pg->valid_states;
   268			dh_data->prefrence = pg->pref;
   269			dh_data->is_active = 1;
   270			dh_data->device_id_str = kstrdup(pg->device_id_str, GFP_KERNEL);
   271			dh_data->device_id_len = pg->device_id_len;
   272	
 > 273			sdev->host->mpath_alua_grpid = pg->group_id;
   274		}
   275	
   276		list_add(&pg->node, &port_group_list);
   277		spin_unlock(&port_group_lock);
   278	
   279		return pg;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
