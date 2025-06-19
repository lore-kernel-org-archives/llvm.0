Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B5354764;
	Thu, 19 Jun 2025 05:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750309996; cv=none; b=F905zmCcZQbXGw+Cks+eB+mbVDni2OjOC+xC6DB5U8bWrxseKWHChcbyiAJqje3ZlVkKfzRq6OwAA9uM0gFv6JShHRCnPdusDJcHkPkM6ECT83bn4/5l/QLV6+TJ95dD2g2s+AnhslmyYjajLZTGRgM1BRvRU6oUFTZZYecbQXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750309996; c=relaxed/simple;
	bh=qQl/KjRXFDkhKxcXV4UJBgo5FGPgSB8os3yphU9+x/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KHIy1FsCyPLeakDWYAvvut+0EqeTr27bbBS28ST1OZ2rkmewTc6G0bw+nfPkFSNaLTZsj9AnUXb9pr+JBmy9r3rG+6gxntyjgp0pIh7k+osQjESsh8C1NmSGy7dhq7EAktoEcWwipRAFuQNZ05Aa3xLxwaNAFOEstiQdSVfFvdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kkX64QCB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kkX64QCB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750309995; x=1781845995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qQl/KjRXFDkhKxcXV4UJBgo5FGPgSB8os3yphU9+x/4=;
  b=kkX64QCBzemqpkhkXh297Fa+Lv4Qjc/6l+7eTmVvtRY6kVTvjrqtNp9C
   8fH0ypDLg09lSTmalxG5qHhOZwhsrrrv0odr0EApVyzb4322qdIF9pRQe
   8MLqAR405XP/RT2iVpQnOhGxmMjpAhWVhucRYASWHznahZtB2w6Ix4gBd
   4TB6LRG2YRS8cSG9L+7tmVr0tbBdOrpx21LEVjCMxddtOD3WkZhWk8dDV
   xpDk7QsYxe+ObQR12DAIcUnft/taL9Hb1umGkK2eH7y8q6txMKXTTTSv6
   jJ5hrnUDi1uQxlzcvJYm7JPEEeziSREq+8x2j/lLrun8es1YNlRKeSH/b
   g==;
X-CSE-ConnectionGUID: bKzXOvDMSAeo0f8flHxD4Q==
X-CSE-MsgGUID: vDcA/6EZRpuA/tMOXiD3wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="51784178"
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="51784178"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 22:13:14 -0700
X-CSE-ConnectionGUID: WENs+vSzTZ2EmgKFFsmOUQ==
X-CSE-MsgGUID: S3AwLiP6SJa4E+q7/NivTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="scan'208";a="151106258"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Jun 2025 22:13:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uS7aJ-000KQG-1J;
	Thu, 19 Jun 2025 05:13:11 +0000
Date: Thu, 19 Jun 2025 13:12:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt_vtd 17/42]
 drivers/iommu/generic_pt/fmt/iommu_amdv1.o: warning: objtool:
 amdv1pt_install_leaf_entry(): unexpected end of section
 .text.amdv1pt_install_leaf_entry
Message-ID: <202506191325.5O9Z8kp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt_vtd
head:   4245120afe2501de333527c4d900356914995527
commit: 63d11a6c1a177f9385c914898554a1a56ebaf6b0 [17/42] iommupt: Add map_pages op
config: x86_64-randconfig-077-20250619 (https://download.01.org/0day-ci/archive/20250619/202506191325.5O9Z8kp1-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506191325.5O9Z8kp1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506191325.5O9Z8kp1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/generic_pt/fmt/iommu_amdv1.o: warning: objtool: amdv1pt_install_leaf_entry(): unexpected end of section .text.amdv1pt_install_leaf_entry

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
