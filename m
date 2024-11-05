Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF53F2A1CA;
	Tue,  5 Nov 2024 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730812953; cv=none; b=KMqjuAx76DO5JUTaHD7Iw8UCW49oMwA+UuIqBJLJx/N/51g4PsryRAmMx0QQRx5vdcKcl9/NkWK+m4ByrdKWiSEfafz0yMnqAbSVBH05CROeixNl7rt69JM+9DzDGBi1HNLQt7ezxxH3zuC8JEx7pJWkNgDYZhNty/tllIR6S5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730812953; c=relaxed/simple;
	bh=Rl2BdQd4VeKv/WVzNjNrixfTnglCDHJ0qmXNSu1Eo0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nQ9rJdy5putRadoCixegLb5wBLr1BUIDRuQfeGR6OvHVrieRiH+eYinN/Q+7Q82cj0OcI7FbPRBQPftU6dBC19atWQ52QvxaL1Olk62HXbUo3CgeXjtLLm/60+PbXYbE5hbnAceZq33lp9WB9A/4wQqV+zunXn400QDSvntvsfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mnq2XuJX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mnq2XuJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730812951; x=1762348951;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Rl2BdQd4VeKv/WVzNjNrixfTnglCDHJ0qmXNSu1Eo0Y=;
  b=Mnq2XuJXtic6Q8uACjLUQ0Wj0E1uhliUkqE4/gFJRHECo74xrv6tCLpD
   V8WXXNYnhPb7i8DJ5FJKCVGAkpXYEqKrJS1BfCb8gwEx+2Gy0vGjzX8BO
   ydeBF6v0nV8U2xsCN3qibbDZY1NO/WeA4fULjMfPqG1Op5zf622Du5eYg
   mM/K5Dd/pfxKxoq0uwvijhf22QGZOR64lt2L2xdI54KnnLYrnMOEWZ8pA
   3fZqVSiIT8hm4mNGUpnFMFA1wFeymctbwCrNXUTLu2hly7FdvW+aA8L6o
   aWjmitoBQtqNWQxIQXvjPsv/OjHh9XcJLC3TWPWs0FuDBWJC06/Rm8q5e
   Q==;
X-CSE-ConnectionGUID: QBXi6GAuRJG/apT2jKzMrA==
X-CSE-MsgGUID: k8uGEOFBQtuoJvrTy8yRSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30781626"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="30781626"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 05:22:31 -0800
X-CSE-ConnectionGUID: 60Efj1CBRyWYuszSKZdpYQ==
X-CSE-MsgGUID: 84Y1uhMIRkeJ5oOTjdxhzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="114809964"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2024 05:22:29 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8JVr-000m5D-2v;
	Tue, 05 Nov 2024 13:22:27 +0000
Date: Tue, 5 Nov 2024 21:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: Ed Tsai <ed.tsai@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [linux-next:master 7954/9328]
 drivers/ufs/host/ufs-mediatek.c:1789:51: error: no member named
 'reqeust_queue' in 'struct scsi_device'; did you mean 'request_queue'?
Message-ID: <202411052104.cBFin611-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   850f22c42f4b0a14a015aecc26f46f9948ded6dd
commit: 1b55fc24d50fc5c752b8d6b594998c6f96445d2c [7954/9328] scsi: ufs: ufs-mediatek: Configure individual LU queue flags
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241105/202411052104.cBFin611-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411052104.cBFin611-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411052104.cBFin611-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/ufs/host/ufs-mediatek.c:18:
   In file included from include/linux/phy/phy.h:17:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
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
>> drivers/ufs/host/ufs-mediatek.c:1789:51: error: no member named 'reqeust_queue' in 'struct scsi_device'; did you mean 'request_queue'?
    1789 |                 blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, sdev->reqeust_queue);
         |                                                                 ^~~~~~~~~~~~~
         |                                                                 request_queue
   include/scsi/scsi_device.h:105:24: note: 'request_queue' declared here
     105 |         struct request_queue *request_queue;
         |                               ^
   4 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=y] || GCC_PLUGINS [=n]) && MODULES [=y]


vim +1789 drivers/ufs/host/ufs-mediatek.c

  1782	
  1783	static void ufs_mtk_config_scsi_dev(struct scsi_device *sdev)
  1784	{
  1785		struct ufs_hba *hba = shost_priv(sdev->host);
  1786	
  1787		dev_dbg(hba->dev, "lu %llu scsi device configured", sdev->lun);
  1788		if (sdev->lun == 2)
> 1789			blk_queue_flag_set(QUEUE_FLAG_SAME_FORCE, sdev->reqeust_queue);
  1790	}
  1791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
