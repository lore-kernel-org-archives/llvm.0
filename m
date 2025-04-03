Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B772E339D;
	Thu,  3 Apr 2025 03:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743652035; cv=none; b=L81CQeL/bVRxgOrizaif4i8v9cQC+1x7Zlc9hbynAIrxWQhBdZisH6YOWFIoxWLCkkeQ+Xn6XCN1Wgmst8VqOhozQeYywe9/ROIOnsro8/TmcEgAaOeLoZyrzeaEibXXddoIuJRi+qnxmkLZPJvkXnwicxyXbsMnUGCmaML5k+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743652035; c=relaxed/simple;
	bh=g4ykxFkOxio+rO/eRFM+AuZ1Ex7MTyb84JiaC7xlu9U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AoWjhMhhhjGDlqQ9yfoZx3F5kUsiia05Xe7cbFthNYdrFU0Sk5dBrAuunhovTSgNckbHuIr3cIq6a8A0ah/0+9Ss1ZgZhi5f+uRYefPCyJUPKjeVeJus6gHpk5IoVvUscDwVkdH8yO2ZeIcTWSNngtxyQXv+SGQCfVKhrItdEbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/zwhl8h; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/zwhl8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743652034; x=1775188034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g4ykxFkOxio+rO/eRFM+AuZ1Ex7MTyb84JiaC7xlu9U=;
  b=H/zwhl8hWaMQR9Z/gsNPo4MnxLZS7ispPPWMcQVUNElaGaCK11OEQSzX
   MYp4uauV2oarEg/QTY9aBKtzJWWSW2S35KHLIT6Pf+bgeTvDnLgHkKp+q
   KQIrrzEDBRcUa2Mnlotr34gVQiXOcrF1AHb/dpQSE6S1l9UyE8xWY+/O+
   hIY3DFEmWP8nv+tmrZ0veI8DAiYEoUUJqtgXcnMSrc/z89osGRuZdvoeE
   Ro6yRvpsb6D2rccCGEDyAwbSpFDz4m84/Zwr10He5HrhE2QcpzxOAMMu6
   hxDungCnyPlFUKDTRmGzRKKsLj7kRejttkAPJ3yRIn8K5RrJkpbL7KJkT
   A==;
X-CSE-ConnectionGUID: LJ7Od+JUT3GIc0vFnrNR4Q==
X-CSE-MsgGUID: QaBzts/cSkGFtKhndZd9WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="56416717"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="56416717"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 20:47:13 -0700
X-CSE-ConnectionGUID: j4UQ3kn8TwCsGbnoZNmg4A==
X-CSE-MsgGUID: 1+C12AcdTGKcg+PQyEythQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="127797216"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Apr 2025 20:47:11 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0BXp-00003X-1P;
	Thu, 03 Apr 2025 03:47:09 +0000
Date: Thu, 3 Apr 2025 11:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:ns-migration 17/18]
 drivers/nvme/host/multipath.c:709:11: warning: variable 'old_instance' set
 but not used
Message-ID: <202504031140.v7ySR5D9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git ns-migration
head:   1cd2ac8db713fdf42bc7bb10329d795f7aee4f1f
commit: c99bbaa789ad558a900b867b376d68801acbbf9a [17/18] nvme: namespace migration
config: hexagon-randconfig-002-20250403 (https://download.01.org/0day-ci/archive/20250403/202504031140.v7ySR5D9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 7eccafc3c84606587a175c0a8c1ebea6e4fb21cd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250403/202504031140.v7ySR5D9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504031140.v7ySR5D9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/multipath.c:709:11: warning: variable 'old_instance' set but not used [-Wunused-but-set-variable]
     709 |         int ret, old_instance;
         |                  ^
   1 warning generated.


vim +/old_instance +709 drivers/nvme/host/multipath.c

   705	
   706	int nvme_mpath_move_head(struct nvme_ns_head *head, struct nvme_subsystem *subsys)
   707	{
   708		struct nvme_subsystem *old_subsys = head->subsys;
 > 709		int ret, old_instance;
   710	
   711		ret = ida_alloc_min(&subsys->ns_ida, 1, GFP_KERNEL);
   712		if (ret < 0)
   713			return ret;
   714	
   715		mutex_lock(&old_subsys->lock);
   716		list_del_init(&head->entry);
   717		mutex_unlock(&old_subsys->lock);
   718		list_add_tail(&head->entry, &subsys->nsheads);
   719		head->subsys = subsys;
   720		old_instance = head->instance;
   721		head->instance = ret;
   722		ret = device_move(disk_to_dev(head->disk), &subsys->dev,
   723			    DPM_ORDER_DEV_AFTER_PARENT);
   724		if (ret) {
   725			mutex_lock(&old_subsys->lock);
   726			list_del_init(&head->entry);
   727			list_add_tail(&head->entry, &old_subsys->nsheads);
   728			head->subsys = old_subsys;
   729			mutex_unlock(&old_subsys->lock);
   730		} else {
   731			ida_free(&old_subsys->ns_ida, head->instance);
   732		}
   733		return ret;
   734	}
   735	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
