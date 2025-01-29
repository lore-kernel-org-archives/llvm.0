Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CBDEAF6;
	Wed, 29 Jan 2025 04:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738126276; cv=none; b=ApGdJ/h6orYOX429Vr8+Ju4TgsP17MOga5um+V61WY8UCAj08ciTy9WGDxyeeOV1PvyLb1PJ1Ju+JOI/BXrhe9VT5fz3SyvRZe7vmGe/1PZ64xtVRQZFS/zvenokTsEWPi5hc9WvptxGi7IhI3hamJTFTPF6g6/qhxY0tavL8Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738126276; c=relaxed/simple;
	bh=zDXs6l9RG3bx/xv+Z7xxh9vD/zJAv6yMqt5JCZmm9RQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PMILuX4iVq8TEM7WULJcGOseQoYTH2QViLgglUGjEOcSi9JmT1TYG6AQRgPx+OT+6mDoMHCcmgFeh9iJMRE3tNuMY5cz2D9BpdgdE99Aby7JDnlKYvFxxedOA1iqIO0sU6c5mem5yAbYNOQjigBhwd7gIuScQSKE+xqsAVYKUsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dA+033vC; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dA+033vC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738126275; x=1769662275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zDXs6l9RG3bx/xv+Z7xxh9vD/zJAv6yMqt5JCZmm9RQ=;
  b=dA+033vCFQ2HWgYrzP633k0dphmfnfwxwcbBCvjX341Rbj7pF1LhywFL
   jz8gIGGpGc8uKvFkHkKMfVUwHREajC6cupAzLlz02tXC7HdCl74Or8l8z
   PjqWCacoUX10HvvwIWSU+FcLmkECilBiI1yUly4Xd4ZNVrPJn/st6ZbiI
   FPMTGQzqdwCiZsbh8WwPV+bhZeyIp8sf4Ql5G5ugs1/0U4WSX2oWA+wTl
   ouPEvdwE2wNVIbmuR9K8YCgWNR+4tNWyuE2zlQ1ep1GoW4dgTD7Xk59BZ
   v048ToaCKzoMOZWDVgws9qPoxsAiJXmEqhazhHpQ/IhecxCl/XjrzFi8D
   A==;
X-CSE-ConnectionGUID: m31vxvA1RCKkhXiegFXPgQ==
X-CSE-MsgGUID: BQASrVpESvOD4Hdh0v+XNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="37873188"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="37873188"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 20:51:14 -0800
X-CSE-ConnectionGUID: 88H/x59fQDa0DEzz0SjyBA==
X-CSE-MsgGUID: YJmlDYTuT2CS6jjDqEYr6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108780600"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Jan 2025 20:51:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1td02g-000iaJ-1f;
	Wed, 29 Jan 2025 04:51:10 +0000
Date: Wed, 29 Jan 2025 12:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pages 12/20] drivers/iommu/iommu-pages.c:76:
 warning: Function parameter or struct member 'list' not described in
 'iommu_put_pages_list'
Message-ID: <202501291246.gO5lkZQ0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pages
head:   470a82a6588cba1a19210a78a710620a15b6019b
commit: ccc2b9fbf982bd3f5b8057056fcb7c6edbc1a838 [12/20] iommu/pages: Remove iommu_put_pages_list_old and the _Generic
config: s390-randconfig-002-20250129 (https://download.01.org/0day-ci/archive/20250129/202501291246.gO5lkZQ0-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501291246.gO5lkZQ0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501291246.gO5lkZQ0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommu-pages.c:76: warning: Function parameter or struct member 'list' not described in 'iommu_put_pages_list'
>> drivers/iommu/iommu-pages.c:76: warning: Excess function parameter 'head' description in 'iommu_put_pages_list'


vim +76 drivers/iommu/iommu-pages.c

6c72aac62af905 Jason Gunthorpe 2025-01-24  68  
6c72aac62af905 Jason Gunthorpe 2025-01-24  69  /**
6c72aac62af905 Jason Gunthorpe 2025-01-24  70   * iommu_put_pages_list - free a list of pages.
6c72aac62af905 Jason Gunthorpe 2025-01-24  71   * @head: the head of the lru list to be freed.
6c72aac62af905 Jason Gunthorpe 2025-01-24  72   *
6c72aac62af905 Jason Gunthorpe 2025-01-24  73   * Frees a list of pages allocated by iommu_alloc_pages_node().
6c72aac62af905 Jason Gunthorpe 2025-01-24  74   */
ccc2b9fbf982bd Jason Gunthorpe 2025-01-26  75  void iommu_put_pages_list(struct iommu_pages_list *list)
6c72aac62af905 Jason Gunthorpe 2025-01-24 @76  {

:::::: The code at line 76 was first introduced by commit
:::::: 6c72aac62af905e9c969c12aa399d8bed4b4d033 iommu/pages: De-inline the substantial functions

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
